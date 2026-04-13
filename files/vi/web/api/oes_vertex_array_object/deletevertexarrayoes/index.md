---
title: "OES_vertex_array_object: phương thức deleteVertexArrayOES()"
short-title: deleteVertexArrayOES()
slug: Web/API/OES_vertex_array_object/deleteVertexArrayOES
page-type: webgl-extension-method
browser-compat: api.OES_vertex_array_object.deleteVertexArrayOES
---

{{APIRef("WebGL")}}

Phương thức **`OES_vertex_array_object.deleteVertexArrayOES()`** của [WebGL API](/en-US/docs/Web/API/WebGL_API) xóa đối tượng {{domxref("WebGLVertexArrayObject")}} đã cho.

## Cú pháp

```js-nolint
deleteVertexArrayOES(arrayObject)
```

### Tham số

- `arrayObject`
  - : Đối tượng {{domxref("WebGLVertexArrayObject")}} (VAO) cần xóa.

### Giá trị trả về

Không có ({{jsxref("undefined")}}).

## Ví dụ

```js
const ext = gl.getExtension("OES_vertex_array_object");
const vao = ext.createVertexArrayOES();
ext.bindVertexArrayOES(vao);

// …

ext.deleteVertexArrayOES(vao);
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("WebGLRenderingContext.getExtension()")}}
- {{domxref("WebGLRenderingContext.vertexAttribPointer()")}}
- Tương đương WebGL2: {{domxref("WebGL2RenderingContext.deleteVertexArray()")}}
