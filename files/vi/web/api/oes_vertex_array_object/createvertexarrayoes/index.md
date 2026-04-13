---
title: "OES_vertex_array_object: phương thức createVertexArrayOES()"
short-title: createVertexArrayOES()
slug: Web/API/OES_vertex_array_object/createVertexArrayOES
page-type: webgl-extension-method
browser-compat: api.OES_vertex_array_object.createVertexArrayOES
---

{{APIRef("WebGL")}}

Phương thức **`OES_vertex_array_object.createVertexArrayOES()`** của [WebGL API](/en-US/docs/Web/API/WebGL_API) tạo và khởi tạo đối tượng {{domxref("WebGLVertexArrayObject")}} đại diện cho một đối tượng mảng đỉnh (VAO) trỏ đến dữ liệu mảng đỉnh và cung cấp tên cho các bộ dữ liệu đỉnh khác nhau.

## Cú pháp

```js-nolint
createVertexArrayOES()
```

### Tham số

Không có.

### Giá trị trả về

Một {{domxref("WebGLVertexArrayObject")}} đại diện cho đối tượng mảng đỉnh (VAO) trỏ đến dữ liệu mảng đỉnh.

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
- Tương đương WebGL2: {{domxref("WebGL2RenderingContext.createVertexArray()")}}
