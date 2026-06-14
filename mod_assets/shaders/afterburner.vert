uniform mat4 u_m44ModelViewProjection;
uniform mat4 u_m44Texture;

attribute vec4 a_v4Position;
attribute vec2 a_v2TexCoord;

varying mediump vec2 v_v2TexCoord;
varying lowp vec4 v_v4Color;

uniform vec4 u_v4Color;

void main()
{
	v_v2TexCoord = (u_m44Texture * vec4(a_v2TexCoord, 0, 1)).xy;
	v_v4Color.xyz = vec3(0.25, 0.45, 1.0);
	v_v4Color.w = u_v4Color.w * a_v2TexCoord.y * -2.0;
	gl_Position = u_m44ModelViewProjection * a_v4Position;
}
