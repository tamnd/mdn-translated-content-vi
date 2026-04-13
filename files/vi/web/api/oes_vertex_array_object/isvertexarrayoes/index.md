---
title: "OES_vertex_array_object: phương thức isVertexArrayOES()"
short-title: isVertexArrayOES()
slug: Web/API/OES_vertex_array_object/isVertexArrayOES
page-type: webgl-extension-method
browser-compat: api.OES_vertex_array_object.isVertexArrayOES
---

{{APIRef("WebGL")}}

Phương thức **`OES_vertex_array_object.isVertexArrayOES()`** của [WebGL API](/en-US/docs/Web/API/WebGL_API) trả về `true` nếu đối tượng đã truyền là đối tượng {{domxref("WebGLVertexArrayObject")}}.

## Cú pháp

```js-nolint
isVertexArrayOES(arrayObject)
```

### Tham số

- `arrayObject`
  - : Đối tượng {{domxref("WebGLVertexArrayObject")}} (VAO) cần kiểm tra.

### Giá trị trả về

Một {{domxref("WebGL_API.Types", "GLboolean")}} cho biết đối tượng đã cho có phải là đối tượng {{domxref("WebGLVertexArrayObject")}} (`true`) hay không (`false`).

## Ví dụ

```js
const ext = gl.getExtension("OES_vertex_array_object");
const vao = ext.createVertexArrayOES();
ext.bindVertexArrayOES(vao);

// …

ext.isVertexArrayOES(vao);
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("WebGLRenderingContext.getExtension()")}}
- {{domxref("WebGLRenderingContext.vertexAttribPointer()")}}
- Tương đương WebGL2: {{domxref("WebGL2RenderingContext.isVertexArray()")}}
