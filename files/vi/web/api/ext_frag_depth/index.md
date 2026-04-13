---
title: EXT_frag_depth extension
short-title: EXT_frag_depth
slug: Web/API/EXT_frag_depth
page-type: webgl-extension
browser-compat: api.EXT_frag_depth
---

{{APIRef("WebGL")}}

Phần mở rộng **`EXT_frag_depth`** là một phần của [WebGL API](/en-US/docs/Web/API/WebGL_API) và cho phép đặt giá trị độ sâu của fragment từ bên trong fragment shader.

Các phần mở rộng WebGL có sẵn bằng cách sử dụng phương thức {{domxref("WebGLRenderingContext.getExtension()")}}.

> [!NOTE]
> Phần mở rộng này chỉ có sẵn cho các ngữ cảnh {{domxref("WebGLRenderingContext", "WebGL1", "", 1)}}. Trong {{domxref("WebGL2RenderingContext", "WebGL2", "", 1)}}, chức năng của phần mở rộng này có sẵn theo mặc định. Nó yêu cầu GLSL `#version 300 es`.

## Ví dụ

Bật phần mở rộng:

```js
gl.getExtension("EXT_frag_depth");
```

Bây giờ biến đầu ra `gl_FragDepthEXT` có sẵn để đặt giá trị độ sâu của fragment từ bên trong fragment shader:

```html
<script type="x-shader/x-fragment">
  void main() {
    gl_FragColor = vec4(1.0, 0.0, 1.0, 1.0);
    gl_FragDepthEXT = 0.5;
  }
</script>
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("WebGLRenderingContext.getExtension()")}}
