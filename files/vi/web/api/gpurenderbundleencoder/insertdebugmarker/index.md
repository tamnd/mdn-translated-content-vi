---
title: "GPURenderBundleEncoder: phương thức insertDebugMarker()"
short-title: insertDebugMarker()
slug: Web/API/GPURenderBundleEncoder/insertDebugMarker
page-type: web-api-instance-method
browser-compat: api.GPURenderBundleEncoder.insertDebugMarker
---

{{APIRef("WebGPU API")}}{{SecureContext_Header}}{{AvailableInWorkers}}

Phương thức **`insertDebugMarker()`** của giao diện {{domxref("GPURenderBundleEncoder")}} đánh dấu một điểm cụ thể trong một loạt các lệnh lần thực thi gói kết xuất đã được mã hóa bằng một nhãn.

Phương thức này có thể được dùng cho mục đích thu thập dữ liệu telemetry, hoặc có thể được sử dụng trong các thông báo {{domxref("GPUError")}}, công cụ phát triển trình duyệt, hoặc các dịch vụ khác trong tương lai để hỗ trợ gỡ lỗi.

> [!NOTE]
> Phương thức này về mặt chức năng giống hệt với phương thức tương đương trên {{domxref("GPURenderPassEncoder")}} — {{domxref("GPURenderPassEncoder.InsertDebugMarker", "InsertDebugMarker()")}}.

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

bundleEncoder.insertDebugMarker("my_marker");

// …
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [WebGPU API](/en-US/docs/Web/API/WebGPU_API)
