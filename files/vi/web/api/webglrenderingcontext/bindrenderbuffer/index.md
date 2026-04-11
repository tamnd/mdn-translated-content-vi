---
title: "WebGLRenderingContext: bindRenderbuffer() method"
short-title: bindRenderbuffer()
slug: Web/API/WebGLRenderingContext/bindRenderbuffer
page-type: web-api-instance-method
browser-compat: api.WebGLRenderingContext.bindRenderbuffer
---

{{APIRef("WebGL")}}{{AvailableInWorkers}}

Phương thức **`WebGLRenderingContext.bindRenderbuffer()`** của [WebGL API](/en-US/docs/Web/API/WebGL_API) liên kết một {{domxref("WebGLRenderbuffer")}} nhất định với một mục tiêu, mục tiêu này phải là `gl.RENDERBUFFER`.

## Cú pháp

```js-nolint
bindRenderbuffer(target, renderbuffer)
```

### Thông số

- `target`
  - : A {{domxref("WebGL_API/Types", "GLenum")}} chỉ định điểm liên kết (đích). Các giá trị có thể:
    - `gl.RENDERBUFFER`
      - : Bộ đệm lưu trữ dữ liệu cho các hình ảnh đơn lẻ trong một
định dạng nội bộ có thể hiển thị.

- `renderbuffer`
  - : Một đối tượng {{domxref("WebGLRenderbuffer")}} để liên kết.

### Giá trị trả về

Không có ({{jsxref("undefined")}}).

### Ngoại lệ

Một lỗi `gl.INVALID_ENUM` sẽ xuất hiện nếu `target` không phải là `gl.RENDERBUFFER`.

## Ví dụ

### Ràng buộc một bộ đệm kết xuất

```js
const canvas = document.getElementById("canvas");
const gl = canvas.getContext("webgl");
const renderbuffer = gl.createRenderbuffer();

gl.bindRenderbuffer(gl.RENDERBUFFER, renderbuffer);
```

### Nhận các ràng buộc hiện tại

Để kiểm tra liên kết bộ đệm kết xuất hiện tại, hãy truy vấn hằng số `RENDERBUFFER_BINDING`.

```js
gl.getParameter(gl.RENDERBUFFER_BINDING);
```

## Thông số kỹ thuật

{{Specifications}}

## Khả năng tương thích của trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("WebGLRenderingContext.createRenderbuffer()")}}
- {{domxref("WebGLRenderingContext.deleteRenderbuffer()")}}
- {{domxref("WebGLRenderingContext.isRenderbuffer()")}}
- Các bộ đệm khác: {{domxref("WebGLBuffer")}}, {{domxref("WebGLFramebuffer")}}
