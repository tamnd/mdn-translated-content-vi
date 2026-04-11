---
title: "GPUDevice: phương thức pushErrorScope()"
short-title: pushErrorScope()
slug: Web/API/GPUDevice/pushErrorScope
page-type: web-api-instance-method
browser-compat: api.GPUDevice.pushErrorScope
---

{{APIRef("WebGPU API")}}{{SecureContext_Header}}{{AvailableInWorkers}}

Phương thức **`pushErrorScope()`** của giao diện {{domxref("GPUDevice")}} đẩy một GPU error scope mới lên ngăn xếp error scope của thiết bị, cho phép bạn bắt các lỗi thuộc một kiểu nhất định.

## Cú pháp

```js-nolint
pushErrorScope(filter)
```

### Tham số

- `filter`
  - : Bộ lọc kiểu lỗi cần bắt.

### Giá trị trả về

`undefined`.

## Đặc tả

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
