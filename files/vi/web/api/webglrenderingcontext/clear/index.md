---
title: "WebGLRenderingContext: clear() method"
short-title: clear()
slug: Web/API/WebGLRenderingContext/clear
page-type: web-api-instance-method
browser-compat: api.WebGLRenderingContext.clear
---

{{APIRef("WebGL")}}{{AvailableInWorkers}}

Phương thức **`WebGLRenderingContext.clear()`** của [WebGL API](/en-US/docs/Web/API/WebGL_API) xóa bộ đệm về các giá trị đặt trước.

Các giá trị đặt trước có thể được đặt bởi {{domxref("WebGLRenderingContext.clearColor", "clearColor()")}}, {{domxref("WebGLRenderingContext.clearDepth", "clearDepth()")}} hoặc {{domxref("WebGLRenderingContext.clearStencil", "clearStencil()")}}.

Hộp cắt kéo, phối màu và mặt nạ ghi đệm có thể ảnh hưởng đến phương pháp `clear()`. Ví dụ, nếu việc ghi vào bộ đệm bị vô hiệu hóa thông qua {{domxref("WebGLRenderingContext.colorMask", "colorMask()")}}, {{domxref("WebGLRenderingContext.depthMask", "depthMask()")}}, hoặc {{domxref("WebGLRenderingContext.stencilMask", "stencilMask()")}}, `clear()` không có tác dụng lên bộ đệm tương ứng.

## Cú pháp

```js-nolint
clear(mask)
```

### Thông số

- `mask`
  - : Mặt nạ {{domxref("WebGL_API/Types", "GLbitfield")}} bitwise OR cho biết bộ đệm được sử dụng
đã xóa. Các giá trị có thể là:
    - `gl.COLOR_BUFFER_BIT`
    - `gl.DEPTH_BUFFER_BIT`
    - `gl.STENCIL_BUFFER_BIT`

### Giá trị trả về

Không có ({{jsxref("undefined")}}).

### Ngoại lệ

Nếu _mask_ không phải là một trong các giá trị có thể được liệt kê, lỗi `gl.INVALID_ENUM` sẽ được đưa ra.

## Ví dụ

Phương thức `clear()` chấp nhận nhiều giá trị.

```js
gl.clear(gl.DEPTH_BUFFER_BIT);
gl.clear(gl.DEPTH_BUFFER_BIT | gl.COLOR_BUFFER_BIT);
```

Để có được các giá trị rõ ràng hiện tại, hãy truy vấn các hằng số `COLOR_CLEAR_VALUE`, `DEPTH_CLEAR_VALUE`, và `STENCIL_CLEAR_VALUE`.

```js
gl.getParameter(gl.COLOR_CLEAR_VALUE);
gl.getParameter(gl.DEPTH_CLEAR_VALUE);
gl.getParameter(gl.STENCIL_CLEAR_VALUE);
```

## Thông số kỹ thuật

{{Specifications}}

## Khả năng tương thích của trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("WebGLRenderingContext.clearColor()")}}
- {{domxref("WebGLRenderingContext.clearDepth()")}}
- {{domxref("WebGLRenderingContext.clearStencil()")}}
