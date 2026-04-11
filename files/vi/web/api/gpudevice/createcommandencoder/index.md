---
title: "GPUDevice: phương thức createCommandEncoder()"
short-title: createCommandEncoder()
slug: Web/API/GPUDevice/createCommandEncoder
page-type: web-api-instance-method
browser-compat: api.GPUDevice.createCommandEncoder
---

{{APIRef("WebGPU API")}}{{SecureContext_Header}}{{AvailableInWorkers}}

Phương thức **`createCommandEncoder()`** của giao diện {{domxref("GPUDevice")}} tạo một {{domxref("GPUCommandEncoder")}}, được dùng để mã hóa các lệnh sẽ được gửi tới GPU.

## Cú pháp

```js-nolint
createCommandEncoder(descriptor)
```

### Tham số

- `descriptor` {{optional_inline}}
  - : Đối tượng mô tả bộ mã hóa lệnh cần tạo.

### Giá trị trả về

Một thể hiện {{domxref("GPUCommandEncoder")}}.

## Đặc tả

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
