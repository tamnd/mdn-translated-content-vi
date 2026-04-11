---
title: "GPURenderPassEncoder: phương thức insertDebugMarker()"
short-title: insertDebugMarker()
slug: Web/API/GPURenderPassEncoder/insertDebugMarker
page-type: web-api-instance-method
browser-compat: api.GPURenderPassEncoder.insertDebugMarker
---

{{APIRef("WebGPU API")}}{{SecureContext_Header}}{{AvailableInWorkers}}

Phương thức **`insertDebugMarker()`** của giao diện {{domxref("GPURenderPassEncoder")}} đánh dấu một điểm cụ thể trong một loạt các lệnh kết xuất đã được mã hóa bằng một nhãn.

Phương thức này có thể được dùng cho mục đích thu thập dữ liệu telemetry, hoặc có thể được sử dụng trong các thông báo {{domxref("GPUError")}}, công cụ phát triển trình duyệt, hoặc các dịch vụ khác trong tương lai để hỗ trợ gỡ lỗi.

## Cú pháp

```js-nolint
insertDebugMarker(markerLabel)
```

### Tham số

- `markerLabel`
  - : Một chuỗi biểu diễn nhãn cần chèn.

### Giá trị trả về

Không có ({{jsxref("Undefined")}}).

## Ví dụ

```js
// …

passEncoder.insertDebugMarker("my_marker");

// …
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [WebGPU API](/en-US/docs/Web/API/WebGPU_API)
