#[allow(dead_code)]
#[path = "../native_bridge/src/replay_camera.rs"]
mod replay_camera;

fn main() {
    replay_camera::set_mode(replay_camera::MODE_ORBIT);
    replay_camera::invalidate();

    let mut car = replay_camera::CarFrame {
        pos: [10.0, 2.0, 30.0],
        right: [1.0, 0.0, 0.0],
        up: [0.0, 1.0, 0.0],
        fwd: [0.0, 0.0, 1.0],
    };
    let mut frame = [
        1.0, 0.0, 0.0, // right
        0.0, 1.0, 0.0, // up
        0.0, 0.0, 1.0, // forward
        10.0, 7.0, 18.0, // camera position, behind/above car at capture
    ];

    let target_offset = [0.0, 0.0, 0.0];
    let mut initial_radius = 0.0f32;
    let mut initial_offset = [0.0f32; 3];
    let mut min_inward_dot = 1.0f32;
    let mut max_center_error = 0.0f32;
    let mut min_radius = f32::MAX;
    let mut max_radius = 0.0f32;
    let mut max_offset_change = 0.0f32;
    let mut orbit_chord = 0.0f32;
    let mut last_dir = [0.0f32; 3];
    let mut have_last_dir = false;

    for tick in 0..600 {
        car.pos[0] += 0.035;
        car.pos[2] += 0.010;
        assert!(replay_camera::update(1.0 / 60.0, &car, &mut frame));

        let target = add(car.pos, target_offset);
        let offset = sub(cam_pos(&frame), target);
        let radius = length(offset);
        let dir = normalize(offset);
        let inward = normalize(scale(offset, -1.0));
        let forward = normalize([frame[6], frame[7], frame[8]]);
        let inward_dot = dot(forward, inward);
        let center_error = length(cross(forward, inward));

        min_inward_dot = min_inward_dot.min(inward_dot);
        max_center_error = max_center_error.max(center_error);
        min_radius = min_radius.min(radius);
        max_radius = max_radius.max(radius);
        if tick == 0 {
            initial_offset = offset;
            initial_radius = radius;
        }
        max_offset_change = max_offset_change.max(length(sub(offset, initial_offset)));
        if have_last_dir {
            orbit_chord += length(sub(dir, last_dir));
        }
        last_dir = dir;
        have_last_dir = true;
    }

    assert!(
        (4.5..=5.5).contains(&initial_radius),
        "orbit proof frame is not at a sensible car-framing distance: {initial_radius}"
    );
    assert!(
        max_radius - min_radius < 0.05,
        "orbit radius drifted: min={min_radius} max={max_radius}"
    );
    assert!(
        min_inward_dot > 0.995,
        "camera forward is not parallel to spoke toward car: {min_inward_dot}"
    );
    assert!(
        max_center_error < 0.01,
        "car target is not held at the frame centre: {max_center_error}"
    );
    assert!(
        max_offset_change > initial_radius * 0.7,
        "camera offset did not revolve around the car: change={max_offset_change}"
    );
    assert!(
        orbit_chord > 2.2,
        "orbit did not accumulate near full revolution motion: chord={orbit_chord}"
    );
    assert!(
        replay_camera::read_diag(1) > 2000 && replay_camera::read_diag(2) > 995,
        "diagnostics do not prove radius/inward-facing state"
    );

    replay_camera::zoom(500.0);
    assert!(replay_camera::update(1.0 / 60.0, &car, &mut frame));
    let target = add(car.pos, target_offset);
    let zoom_clamped_radius = length(sub(cam_pos(&frame), target));
    assert!(
        (4.5..=5.5).contains(&zoom_clamped_radius),
        "orbit zoom did not clamp at the minimum car-framing distance: {zoom_clamped_radius}"
    );

    println!(
        "orbit_proof=passed radius={initial_radius:.3} inward_dot_min={min_inward_dot:.6} center_error_max={max_center_error:.6} offset_change_max={max_offset_change:.3} orbit_chord={orbit_chord:.3}"
    );
}

fn cam_pos(frame: &[f32; 12]) -> [f32; 3] {
    [frame[9], frame[10], frame[11]]
}

fn add(a: [f32; 3], b: [f32; 3]) -> [f32; 3] {
    [a[0] + b[0], a[1] + b[1], a[2] + b[2]]
}

fn sub(a: [f32; 3], b: [f32; 3]) -> [f32; 3] {
    [a[0] - b[0], a[1] - b[1], a[2] - b[2]]
}

fn scale(a: [f32; 3], s: f32) -> [f32; 3] {
    [a[0] * s, a[1] * s, a[2] * s]
}

fn dot(a: [f32; 3], b: [f32; 3]) -> f32 {
    a[0] * b[0] + a[1] * b[1] + a[2] * b[2]
}

fn cross(a: [f32; 3], b: [f32; 3]) -> [f32; 3] {
    [
        a[1] * b[2] - a[2] * b[1],
        a[2] * b[0] - a[0] * b[2],
        a[0] * b[1] - a[1] * b[0],
    ]
}

fn length(a: [f32; 3]) -> f32 {
    dot(a, a).sqrt()
}

fn normalize(a: [f32; 3]) -> [f32; 3] {
    let len = length(a);
    assert!(len > 0.000001, "zero vector");
    scale(a, 1.0 / len)
}
