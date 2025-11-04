shader_type canvas_item;

// How many "big pixels" across the screen (X = width, Y = height)
uniform vec2 pixel_grid = vec2(160.0, 90.0);

// Optional: how many color steps (posterize). Set to 0 to disable.
uniform float color_steps = 8.0;

// Sample the game render
uniform sampler2D screen_tex : hint_screen_texture, repeat_disable, filter_nearest;

void fragment() {
    // Screen UVs (0..1)
    vec2 uv = SCREEN_UV;

    // Snap UVs to a coarse grid
    vec2 uv_pixel = floor(uv * pixel_grid) / pixel_grid;

    // Sample the screen at the snapped UV
    vec4 col = texture(screen_tex, uv_pixel);

    // Optional color quantization (pixel-art style)
    if (color_steps > 0.0) {
        col.rgb = floor(col.rgb * color_steps) / color_steps;
    }

    COLOR = col;
}
