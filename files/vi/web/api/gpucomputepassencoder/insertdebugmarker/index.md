---
title: "GPUComputePassEncoder: insertDebugMarker() method"
short-title: insertDebugMarker()
slug: Web/API/GPUComputePassEncoder/insertDebugMarker
page-type: web-api-instance-method
browser-compat: api.GPUComputePassEncoder.insertDebugMarker
---

{{APIRef("WebGPU API")}}{{SecureContext_Header}}{{AvailableInWorkers}}

Phương thức **`insertDebugMarker()`** của giao diện {{domxref("GPUComputePassEncoder")}} đánh dấu một điểm cụ thể trong chuỗi lệnh compute pass mã hóa bằng một nhãn.

Phương thức này có thể được dùng cho telemetry, hoặc trong tương lai có thể được sử dụng trong thông báo {{domxref("GPUError")}}, dev tools của trình duyệt hoặc các dịch vụ khác để hỗ trợ gỡ lỗi.

## Cú pháp

```js-nolint
insertDebugMarker(markerLabel)
```

### Tham số

- `markerLabel`
  - : Một chuỗi đại diện cho nhãn cần chèn vào.

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
