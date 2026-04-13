---
title: Tiện ích mở rộng OES_vertex_array_object
short-title: OES_vertex_array_object
slug: Web/API/OES_vertex_array_object
page-type: webgl-extension
browser-compat: api.OES_vertex_array_object
---

{{APIRef("WebGL")}}

Tiện ích mở rộng **OES_vertex_array_object** là một phần của [WebGL API](/en-US/docs/Web/API/WebGL_API) và cung cấp các đối tượng mảng đỉnh (VAO) đóng gói các trạng thái mảng đỉnh. Các đối tượng này lưu con trỏ đến dữ liệu đỉnh và cung cấp tên cho các bộ dữ liệu đỉnh khác nhau.

Các tiện ích mở rộng WebGL có sẵn thông qua phương thức {{domxref("WebGLRenderingContext.getExtension()")}}. Để biết thêm thông tin, xem [Sử dụng tiện ích mở rộng](/en-US/docs/Web/API/WebGL_API/Using_Extensions) trong [hướng dẫn WebGL](/en-US/docs/Web/API/WebGL_API/Tutorial).

> [!NOTE]
> Tiện ích mở rộng này chỉ có sẵn cho các ngữ cảnh {{domxref("WebGLRenderingContext", "WebGL1", "", 1)}}. Trong {{domxref("WebGL2RenderingContext", "WebGL2", "", 1)}}, chức năng của tiện ích mở rộng này có sẵn trong ngữ cảnh WebGL2 theo mặc định và các hằng số và phương thức có sẵn mà không có tiền tố `OES_`.

## Hằng số

Tiện ích mở rộng này cung cấp một hằng số mới, có thể được sử dụng trong phương thức {{domxref("WebGLRenderingContext.getParameter()", "gl.getParameter()")}}:

- `ext.VERTEX_ARRAY_BINDING_OES`
  - : Trả về đối tượng {{domxref("WebGLVertexArrayObject")}} khi được sử dụng trong phương thức {{domxref("WebGLRenderingContext.getParameter()", "gl.getParameter()")}} như tham số `pname`.

## Phương thức phiên bản

Tiện ích mở rộng này cung cấp bốn phương thức mới.

- {{domxref("OES_vertex_array_object.createVertexArrayOES()", "ext.createVertexArrayOES()")}}
  - : Tạo một {{domxref("WebGLVertexArrayObject")}} mới.
- {{domxref("OES_vertex_array_object.deleteVertexArrayOES()", "ext.deleteVertexArrayOES()")}}
  - : Xóa một {{domxref("WebGLVertexArrayObject")}} đã cho.
- {{domxref("OES_vertex_array_object.isVertexArrayOES()", "ext.isVertexArrayOES()")}}
  - : Trả về `true` nếu đối tượng đã cho là {{domxref("WebGLVertexArrayObject")}}.
- {{domxref("OES_vertex_array_object.bindVertexArrayOES()", "ext.bindVertexArrayOES()")}}
  - : Gắn kết một {{domxref("WebGLVertexArrayObject")}} đã cho vào bộ đệm.

## Ví dụ

```js
const ext = gl.getExtension("OES_vertex_array_object");
const vao = ext.createVertexArrayOES();
ext.bindVertexArrayOES(vao);

// …
// calls to bindBuffer or vertexAttribPointer
// which will be "recorded" in the VAO
// …
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("WebGLRenderingContext.getExtension()")}}
- {{domxref("WebGLRenderingContext.vertexAttribPointer()")}}
- Các phương thức tương đương WebGL2:
  - {{domxref("WebGL2RenderingContext.createVertexArray()")}}
  - {{domxref("WebGL2RenderingContext.deleteVertexArray()")}}
  - {{domxref("WebGL2RenderingContext.isVertexArray()")}}
  - {{domxref("WebGL2RenderingContext.bindVertexArray()")}}
