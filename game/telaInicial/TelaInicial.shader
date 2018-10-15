float rand(vec2 n) {
 return fract(cos(dot(n, vec2(12.9898, 4.1414))) * 43758.5453);
}

float noise(vec2 n) {
 vec2 d = vec2(0.0, 1.0);
 vec2 b = floor(n);
 vec2 f = smoothstep(vec2(0.0), vec2(1.0), fract(n));
 return mix(mix(rand(b), rand(b + d.yx), f.x), mix(rand(b + d.xy), rand(b + d.yy), f.x), f.y);
}

float fbm(vec2 n) {
 return noise(n) * 0.5 + noise(n * 2.0) * 0.25 + noise(n * 4.0) * 0.125 + noise(n * 8.0) * 0.065;
}

vec2 p = vec2(UV.x * 2.5, -UV.y * 1.0);
float r = fbm(p - vec2(0.0, fbm(p) + TIME *0.5));
DIFFUSE_ALPHA = vec4(r,r,r,UV.y);﻿