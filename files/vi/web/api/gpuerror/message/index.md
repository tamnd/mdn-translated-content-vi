---
title: "GPUError: message property"
short-title: message
slug: Web/API/GPUError/message
page-type: web-api-instance-property
browser-compat: api.GPUError.message
---

{{APIRef("WebGPU API")}}{{SecureContext_Header}}{{AvailableInWorkers}}

Thuộc tính chỉ đọc **`message`** của giao diện {{domxref("GPUError")}} cung cấp thông báo dễ đọc giải thích lý do tại sao lỗi xảy ra.

## Giá trị

Một chuỗi.

## Ví dụ

Để biết ví dụ sử dụng các đối tượng lỗi dựa trên `GPUError`, xem:

- [`GPUDevice.popErrorScope`](/en-US/docs/Web/API/GPUDevice/popErrorScope#examples)
- [Sự kiện `GPUDevice uncapturederror`](/en-US/docs/Web/API/GPUDevice/uncapturederror_event#examples)
- {{domxref("GPUInternalError")}}, {{domxref("GPUOutOfMemoryError")}}, và {{domxref("GPUValidationError")}}

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [WebGPU API](/en-US/docs/Web/API/WebGPU_API)
- [Các phương pháp hay nhất về xử lý lỗi WebGPU](https://toji.dev/webgpu-best-practices/error-handling)
