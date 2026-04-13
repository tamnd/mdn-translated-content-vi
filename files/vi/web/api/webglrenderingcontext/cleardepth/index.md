---
title: "WebGLRenderingContext: clearDepth() method"
short-title: clearDepth()
slug: Web/API/WebGLRenderingContext/clearDepth
page-type: web-api-instance-method
browser-compat: api.WebGLRenderingContext.clearDepth
---

{{APIRef("WebGL")}}{{AvailableInWorkers}}

Phương thức **`WebGLRenderingContext.clearDepth()`** của [WebGL API](/en-US/docs/Web/API/WebGL_API) chỉ định giá trị rõ ràng cho vùng đệm độ sâu.

Điều này xác định giá trị độ sâu nào sẽ được sử dụng khi gọi phương thức {{domxref("WebGLRenderingContext.clear", "clear()")}}. Giá trị được kẹp trong khoảng từ 0 đến 1.

## Cú pháp

```js-nolint
clearDepth(depth)
```

### Thông số

- `depth`
  - : A {{domxref("WebGL_API/Types", "GLclampf")}} chỉ định giá trị độ sâu được sử dụng khi bộ đệm độ sâu được kích hoạt
đã xóa. Giá trị mặc định: 1.

### Giá trị trả về

Không có ({{jsxref("undefined")}}).

## Ví dụ

```js
gl.clearDepth(0.5);
```

Để có được giá trị rõ ràng về độ sâu hiện tại, hãy truy vấn hằng số `DEPTH_CLEAR_VALUE`.

```js
gl.getParameter(gl.DEPTH_CLEAR_VALUE);
// 0.5
```

## Thông số kỹ thuật

{{Specifications}}

## Khả năng tương thích của trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("WebGLRenderingContext.clear()")}}
- {{domxref("WebGLRenderingContext.clearColor()")}}
- {{domxref("WebGLRenderingContext.clearStencil()")}}
