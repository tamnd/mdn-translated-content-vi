---
title: "WebGLRenderingContext: deleteBuffer() method"
short-title: deleteBuffer()
slug: Web/API/WebGLRenderingContext/deleteBuffer
page-type: web-api-instance-method
browser-compat: api.WebGLRenderingContext.deleteBuffer
---

{{APIRef("WebGL")}}{{AvailableInWorkers}}

Phương thức **`WebGLRenderingContext.deleteBuffer()`** của [WebGL API](/en-US/docs/Web/API/WebGL_API) xóa một {{domxref("WebGLBuffer")}} đã cho. Phương pháp này không có hiệu lực nếu bộ đệm đã bị xóa. Thông thường bạn không cần phải tự gọi phương thức này, khi đối tượng bộ đệm bị dereferenced nó sẽ được đánh dấu là free.

## Cú pháp

```js-nolint
deleteBuffer(buffer)
```

### Thông số

- `buffer`
  - : Một đối tượng {{domxref("WebGLBuffer")}} cần xóa.

### Giá trị trả về

Không có ({{jsxref("undefined")}}).

## Ví dụ

### Xóa bộ đệm

```js
const canvas = document.getElementById("canvas");
const gl = canvas.getContext("webgl");
const buffer = gl.createBuffer();

// …

gl.deleteBuffer(buffer);
```

## Thông số kỹ thuật

{{Specifications}}

## Khả năng tương thích của trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("WebGLRenderingContext.bindBuffer()")}}
- {{domxref("WebGLRenderingContext.createBuffer()")}}
- {{domxref("WebGLRenderingContext.isBuffer()")}}
- Các bộ đệm khác: {{domxref("WebGLFramebuffer")}}, {{domxref("WebGLRenderbuffer")}}
