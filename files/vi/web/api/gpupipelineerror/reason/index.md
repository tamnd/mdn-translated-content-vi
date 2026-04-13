---
title: "GPUPipelineError: reason property"
short-title: reason
slug: Web/API/GPUPipelineError/reason
page-type: web-api-instance-property
browser-compat: api.GPUPipelineError.reason
---

{{APIRef("WebGPU API")}}{{SecureContext_Header}}{{AvailableInWorkers}}

Thuộc tính chỉ đọc **`reason`** của giao diện {{domxref("GPUPipelineError")}} xác định lý do tạo pipeline thất bại theo cách máy có thể đọc được.

## Giá trị

Giá trị được liệt kê có thể là một trong:

- `"internal"`
  - : Tạo pipeline thất bại vì lỗi nội bộ (xem {{domxref("GPUInternalError")}} để biết thêm thông tin về các loại lỗi này.)
- `"validation"`
  - : Tạo pipeline thất bại vì lỗi xác thực (xem {{domxref("GPUValidationError")}} để biết thêm thông tin về các loại lỗi này.)

## Ví dụ

Xem trang [`GPUPipelineError` chính](/en-US/docs/Web/API/GPUPipelineError#examples) để biết ví dụ liên quan đến phiên bản đối tượng `GPUPipelineError`.

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [WebGPU API](/en-US/docs/Web/API/WebGPU_API)
