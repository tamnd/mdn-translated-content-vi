---
title: "OES_vertex_array_object: phương thức bindVertexArrayOES()"
short-title: bindVertexArrayOES()
slug: Web/API/OES_vertex_array_object/bindVertexArrayOES
page-type: webgl-extension-method
browser-compat: api.OES_vertex_array_object.bindVertexArrayOES
---

{{APIRef("WebGL")}}

Phương thức **`OES_vertex_array_object.bindVertexArrayOES()`** của [WebGL API](/en-US/docs/Web/API/WebGL_API) gắn kết đối tượng {{domxref("WebGLVertexArrayObject")}} đã truyền vào bộ đệm.

## Cú pháp

```js-nolint
bindVertexArrayOES(arrayObject)
```

### Tham số

- `arrayObject`
  - : Đối tượng {{domxref("WebGLVertexArrayObject")}} (VAO) cần gắn kết.

### Giá trị trả về

Không có ({{jsxref("undefined")}}).

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
- Tương đương WebGL2: {{domxref("WebGL2RenderingContext.bindVertexArray()")}}
