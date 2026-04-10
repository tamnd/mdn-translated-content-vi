---
title: "WebGL2RenderingContext: phương thức isVertexArray()"
short-title: isVertexArray()
slug: Web/API/WebGL2RenderingContext/isVertexArray
page-type: web-api-instance-method
browser-compat: api.WebGL2RenderingContext.isVertexArray
---

{{APIRef("WebGL")}}{{AvailableInWorkers}}

Phương thức **`WebGL2RenderingContext.isVertexArray()`** của [WebGL API](/en-US/docs/Web/API/WebGL_API) trả về `true` nếu đối tượng được truyền là một đối tượng {{domxref("WebGLVertexArrayObject")}} hợp lệ.

## Cú pháp

```js-nolint
isVertexArray(vertexArray)
```

### Tham số

- `vertexArray`
  - : Một đối tượng {{domxref("WebGLVertexArrayObject")}} (VAO) để kiểm tra.

### Giá trị trả về

Một {{domxref("WebGL_API/Types", "GLboolean")}} cho biết đối tượng đã cho có phải là một đối tượng {{domxref("WebGLVertexArrayObject")}} hợp lệ (`true`) hay không (`false`).

## Ví dụ

```js
const vao = gl.createVertexArray();
gl.bindVertexArray(vao);

// …

gl.isVertexArray(vao);
```

## Đặc tả kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("WebGLVertexArrayObject")}}