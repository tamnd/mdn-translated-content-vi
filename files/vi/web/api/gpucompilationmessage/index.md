---
title: GPUCompilationMessage
slug: Web/API/GPUCompilationMessage
page-type: web-api-interface
browser-compat: api.GPUCompilationMessage
---

{{APIRef("WebGPU API")}}{{SecureContext_Header}}{{AvailableInWorkers}}

Giao diện **`GPUCompilationMessage`** của {{domxref("WebGPU API", "WebGPU API", "", "nocode")}} đại diện cho một thông báo thông tin, cảnh báo hoặc lỗi đơn lẻ được tạo ra bởi trình biên dịch shader module của GPU.

Một mảng các đối tượng `GPUCompilationMessage` có sẵn trong thuộc tính `messages` của đối tượng {{domxref("GPUCompilationInfo")}} được truy cập qua {{domxref("GPUShaderModule.getCompilationInfo()")}}.

{{InheritanceDiagram}}

## Thuộc tính phiên bản

- {{domxref("GPUCompilationMessage.length", "length")}} {{ReadOnlyInline}}
  - : Một số đại diện cho độ dài của chuỗi con mà thông báo tương ứng.
- {{domxref("GPUCompilationMessage.lineNum", "lineNum")}} {{ReadOnlyInline}}
  - : Một số đại diện cho số dòng trong mã shader mà thông báo tương ứng.
- {{domxref("GPUCompilationMessage.linePos", "linePos")}} {{ReadOnlyInline}}
  - : Một số đại diện cho vị trí trong dòng mã mà thông báo tương ứng. Có thể là một điểm chính xác, hoặc bắt đầu của chuỗi con liên quan.
- {{domxref("GPUCompilationMessage.message", "message")}} {{ReadOnlyInline}}
  - : Một chuỗi đại diện cho văn bản thông báo có thể đọc được.
- {{domxref("GPUCompilationMessage.offset", "offset")}} {{ReadOnlyInline}}
  - : Một số đại diện cho độ lệch từ đầu mã shader đến điểm chính xác, hoặc bắt đầu của chuỗi con liên quan, mà thông báo tương ứng.
- {{domxref("GPUCompilationMessage.type", "type")}} {{ReadOnlyInline}}
  - : Một giá trị liệt kê đại diện cho loại thông báo, một trong các giá trị `"error"`, `"info"`, hoặc `"warning"`.

## Ví dụ

Xem trang chính [`GPUCompilationInfo`](/en-US/docs/Web/API/GPUCompilationInfo#examples) để biết ví dụ.

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [WebGPU API](/en-US/docs/Web/API/WebGPU_API)
