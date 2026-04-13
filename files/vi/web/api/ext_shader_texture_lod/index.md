---
title: EXT_shader_texture_lod extension
short-title: EXT_shader_texture_lod
slug: Web/API/EXT_shader_texture_lod
page-type: webgl-extension
browser-compat: api.EXT_shader_texture_lod
---

{{APIRef("WebGL")}}

Phần mở rộng **`EXT_shader_texture_lod`** là một phần của [WebGL API](/en-US/docs/Web/API/WebGL_API) và thêm các hàm texture bổ sung vào OpenGL ES Shading Language, cho phép người viết shader kiểm soát rõ ràng LOD ([Level of detail](https://en.wikipedia.org/wiki/Level_of_detail)).

Các phần mở rộng WebGL có sẵn bằng cách sử dụng phương thức {{domxref("WebGLRenderingContext.getExtension()")}}.

> [!NOTE]
> Phần mở rộng này chỉ có sẵn cho các ngữ cảnh {{domxref("WebGLRenderingContext", "WebGL1", "", 1)}}. Trong {{domxref("WebGL2RenderingContext", "WebGL2", "", 1)}}, chức năng của phần mở rộng này có sẵn theo mặc định. Nó yêu cầu GLSL `#version 300 es`.

## Hàm dựng sẵn GLSL

Các hàm mới sau có thể được sử dụng trong mã shader GLSL nếu phần mở rộng này được bật:

```c
vec4 texture2DLodEXT(sampler2D sampler, vec2 coord, float lod)
vec4 texture2DProjLodEXT(sampler2D sampler, vec3 coord, float lod)
vec4 texture2DProjLodEXT(sampler2D sampler, vec4 coord, float lod)
vec4 textureCubeLodEXT(samplerCube sampler, vec3 coord, float lod)
vec4 texture2DGradEXT(sampler2D sampler, vec2 P, vec2 dPdx, vec2 dPdy)
vec4 texture2DProjGradEXT(sampler2D sampler, vec3 P, vec2 dPdx, vec2 dPdy)
vec4 texture2DProjGradEXT(sampler2D sampler, vec4 P, vec2 dPdx, vec2 dPdy)
vec4 textureCubeGradEXT(samplerCube sampler, vec3 P, vec3 dPdx, vec3 dPdy)
```

## Ví dụ

Bật phần mở rộng:

```js
gl.getExtension("EXT_shader_texture_lod");
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("WebGLRenderingContext.getExtension()")}}
