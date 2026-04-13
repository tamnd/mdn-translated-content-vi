---
title: "GPUInternalError: GPUInternalError() constructor"
short-title: GPUInternalError()
slug: Web/API/GPUInternalError/GPUInternalError
page-type: web-api-constructor
browser-compat: api.GPUInternalError.GPUInternalError
---

{{APIRef("WebGPU API")}}{{SecureContext_Header}}{{AvailableInWorkers}}

Hàm khởi tạo **`GPUInternalError()`** tạo một đối tượng {{domxref("GPUInternalError")}} mới.

## Cú pháp

```js-nolint
new GPUInternalError(message)
```

### Tham số

- `message`
  - : Một chuỗi cung cấp thông báo dễ đọc giải thích lý do tại sao lỗi xảy ra.

## Ví dụ

Nhà phát triển thường không sử dụng hàm khởi tạo này để tạo đối tượng `GPUInternalError` theo cách thủ công. Tác nhân người dùng sử dụng hàm khởi tạo này để tạo một đối tượng thích hợp khi lỗi nội bộ được hiển thị bởi {{domxref("GPUDevice.popErrorScope")}} hoặc sự kiện {{domxref("GPUDevice.uncapturederror_event", "uncapturederror")}}.

Xem trang chính [`GPUInternalError`](/en-US/docs/Web/API/GPUInternalError#examples) để có ví dụ liên quan đến đối tượng `GPUInternalError`.

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [WebGPU API](/en-US/docs/Web/API/WebGPU_API)
- [Các phương pháp hay nhất về xử lý lỗi WebGPU](https://toji.dev/webgpu-best-practices/error-handling)
