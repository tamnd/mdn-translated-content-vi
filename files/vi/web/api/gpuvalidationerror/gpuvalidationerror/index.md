---
title: "GPUValidationError: GPUValidationError() constructor"
short-title: GPUValidationError()
slug: Web/API/GPUValidationError/GPUValidationError
page-type: web-api-constructor
browser-compat: api.GPUValidationError.GPUValidationError
---

{{APIRef("WebGPU API")}}{{SecureContext_Header}}{{AvailableInWorkers}}

Hàm khởi tạo **`GPUValidationError()`** tạo một đối tượng {{domxref("GPUValidationError")}} mới.

## Cú pháp

```js-nolint
new GPUValidationError(message)
```

### Tham số

- `message`
  - : Một chuỗi cung cấp thông báo dễ đọc giải thích lý do tại sao lỗi xảy ra.

## Ví dụ

Nhà phát triển thường không sử dụng hàm khởi tạo này để tạo đối tượng `GPUValidationError` theo cách thủ công. Tác nhân người dùng sử dụng hàm khởi tạo này để tạo một đối tượng thích hợp khi lỗi xác thực được hiển thị bởi {{domxref("GPUDevice.popErrorScope")}} hoặc sự kiện {{domxref("GPUDevice.uncapturederror_event", "uncapturederror")}}.

Xem trang chính [`GPUValidationError`](/en-US/docs/Web/API/GPUValidationError#examples) để có ví dụ cụ thể liên quan đến đối tượng `GPUValidationError`.

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [WebGPU API](/en-US/docs/Web/API/WebGPU_API)
- [Các phương pháp hay nhất về xử lý lỗi WebGPU](https://toji.dev/webgpu-best-practices/error-handling)
