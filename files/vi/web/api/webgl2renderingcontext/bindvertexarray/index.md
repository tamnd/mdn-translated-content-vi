---
title: "WebGL2RenderingContext: phương thức bindVertexArray()"
short-title: bindVertexArray()
slug: Web/API/WebGL2RenderingContext/bindVertexArray
page-type: web-api-instance-method
browser-compat: api.WebGL2RenderingContext.bindVertexArray
---

{{APIRef("WebGL")}}{{AvailableInWorkers}}

Phương thức **`WebGL2RenderingContext.bindVertexArray()`** của [WebGL 2 API](/en-US/docs/Web/API/WebGL_API) liên kết một đối tượng {{domxref("WebGLVertexArrayObject")}} đã cho với bộ đệm.

## Cú pháp

```js-nolint
bindVertexArray(vertexArray)
```

### Tham số

- `vertexArray`
  - : Một đối tượng {{domxref("WebGLVertexArrayObject")}} (VAO) để liên kết.

### Giá trị trả về

None ({{jsxref("undefined")}}).

## Ví dụ

```js
const vao = gl.createVertexArray();
gl.bindVertexArray(vao);

// …

// các lệnh gọi bindBuffer hoặc vertexAttribPointer
// sẽ được "ghi lại" trong VAO

// …
```

## Đặc tả kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("WebGLVertexArrayObject")}}
