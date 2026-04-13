---
title: "WebGL2RenderingContext: phương thức deleteVertexArray()"
short-title: deleteVertexArray()
slug: Web/API/WebGL2RenderingContext/deleteVertexArray
page-type: web-api-instance-method
browser-compat: api.WebGL2RenderingContext.deleteVertexArray
---

{{APIRef("WebGL")}}{{AvailableInWorkers}}

Phương thức **`WebGL2RenderingContext.deleteVertexArray()`** của [WebGL 2 API](/en-US/docs/Web/API/WebGL_API) xóa một đối tượng {{domxref("WebGLVertexArrayObject")}} đã cho.

## Cú pháp

```js-nolint
deleteVertexArray(vertexArray)
```

### Tham số

- `vertexArray`
  - : Một đối tượng {{domxref("WebGLVertexArrayObject")}} (VAO) để xóa.

### Giá trị trả về

None ({{jsxref("undefined")}}).

## Ví dụ

```js
const vao = gl.createVertexArray();
gl.bindVertexArray(vao);

// …

gl.deleteVertexArray(vao);
```

## Đặc tả kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("WebGLVertexArrayObject")}}