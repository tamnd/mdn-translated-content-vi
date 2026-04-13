---
title: GPUError
slug: Web/API/GPUError
page-type: web-api-interface
browser-compat: api.GPUError
---

{{APIRef("WebGPU API")}}{{SecureContext_Header}}{{AvailableInWorkers}}

Giao diện **`GPUError`** của {{domxref("WebGPU API", "WebGPU API", "", "nocode")}} là giao diện cơ sở cho các lỗi được hiển thị bởi {{domxref("GPUDevice.popErrorScope")}} và sự kiện {{domxref("GPUDevice.uncapturederror_event", "uncapturederror")}}.

{{InheritanceDiagram}}

## Thuộc tính phiên bản

- {{domxref("GPUError.message", "message")}} {{ReadOnlyInline}}
  - : Một chuỗi cung cấp thông báo dễ đọc giải thích lý do tại sao lỗi xảy ra.

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
