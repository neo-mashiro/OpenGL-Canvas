#version 440

smooth in vec4 _color;  // user-defined input, passed from the previous shader stage

layout(location = 0) out vec4 Color;

uniform float elapsed_time;  // the same uniform as in vertex shader
uniform float loop_time = 4.0f;

const vec4 black = vec4(0.0f);  // const variables are NOT shared between shader stages

void main() {
    float loops = 0, t = 0;
    float ticks = modf(elapsed_time / loop_time, loops);

    t = mod(loops, 2) > 0 ? ticks : 1 - ticks;
    
    Color = mix(black, _color, t);
}