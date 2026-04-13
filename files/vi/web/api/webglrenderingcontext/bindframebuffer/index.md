---
title: "WebGLRenderingContext: bindFramebuffer() method"
short-title: bindFramebuffer()
slug: Web/API/WebGLRenderingContext/bindFramebuffer
page-type: web-api-instance-method
browser-compat: api.WebGLRenderingContext.bindFramebuffer
---

{{APIRef("WebGL")}}{{AvailableInWorkers}}

Phương thức **`WebGLRenderingContext.bindFramebuffer()`** của [WebGL API](/en-US/docs/Web/API/WebGL_API) liên kết với mục tiêu đã chỉ định là {{domxref("WebGLFramebuffer")}} được cung cấp, hoặc, nếu đối số `framebuffer` là null, thì {{domxref("WebGLFramebuffer")}} mặc định, được liên kết với bối cảnh kết xuất canvas.

## Cú pháp

```js-nolint
bindFramebuffer(target, framebuffer)
```

### Thông số

- `target`
  - : A {{domxref("WebGL_API/Types", "GLenum")}} chỉ định điểm liên kết (đích). Các giá trị có thể:
    - `gl.FRAMEBUFFER`
      - : Bộ sưu tập bộ đệm lưu trữ dữ liệu màu, alpha,
bộ đệm độ sâu và stencil được sử dụng làm đích cho bản vẽ và làm nguồn để đọc (xem bên dưới).

Khi sử dụng {{domxref("WebGL2RenderingContext", "WebGL 2 context", "", 1)}}, các giá trị sau đây có sẵn bổ sung:
    - `gl.DRAW_FRAMEBUFFER`
      - : Được sử dụng làm đích cho các thao tác vẽ như `gl.draw*`, `gl.clear*` và `gl.blitFramebuffer`.
    - `gl.READ_FRAMEBUFFER`
      - : Được sử dụng làm nguồn cho các hoạt động đọc như `gl.readPixels` và `gl.blitFramebuffer`.

- `framebuffer`
  - : Một đối tượng {{domxref("WebGLFramebuffer")}} để liên kết, hoặc [`null`](/en-US/docs/Web/JavaScript/Reference/Operators/null) để liên kết đối tượng {{domxref("HTMLCanvasElement")}} hoặc {{domxref("OffscreenCanvas")}} được liên kết với bối cảnh kết xuất.

### Giá trị trả về

Không có ({{jsxref("undefined")}}).

### Ngoại lệ

Một lỗi `gl.INVALID_ENUM` được đưa ra nếu `target` không phải là `gl.FRAMEBUFFER`, `gl.DRAW_FRAMEBUFFER`, hoặc `gl.READ_FRAMEBUFFER`.

## Ví dụ

### Liên kết bộ đệm khung

```js
const canvas = document.getElementById("canvas");
const gl = canvas.getContext("webgl");
const framebuffer = gl.createFramebuffer();

gl.bindFramebuffer(gl.FRAMEBUFFER, framebuffer);
```

### Nhận các ràng buộc hiện tại

Để kiểm tra liên kết bộ đệm khung hiện tại, hãy truy vấn hằng số `FRAMEBUFFER_BINDING`.

```js
gl.getParameter(gl.FRAMEBUFFER_BINDING);
```

## Thông số kỹ thuật

{{Specifications}}

## Khả năng tương thích của trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("WebGLRenderingContext.createFramebuffer()")}}
- {{domxref("WebGLRenderingContext.deleteFramebuffer()")}}
- {{domxref("WebGLRenderingContext.isFramebuffer()")}}
- Các bộ đệm khác: {{domxref("WebGLBuffer")}}, {{domxref("WebGLRenderbuffer")}}
