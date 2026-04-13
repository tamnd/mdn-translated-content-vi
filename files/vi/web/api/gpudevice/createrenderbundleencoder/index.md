---
title: "GPUDevice: phương thức createRenderBundleEncoder()"
short-title: createRenderBundleEncoder()
slug: Web/API/GPUDevice/createRenderBundleEncoder
page-type: web-api-instance-method
browser-compat: api.GPUDevice.createRenderBundleEncoder
---

{{APIRef("WebGPU API")}}{{SecureContext_Header}}{{AvailableInWorkers}}

Phương thức **`createRenderBundleEncoder()`** của giao diện {{domxref("GPUDevice")}} tạo một {{domxref("GPURenderBundleEncoder")}} có thể dùng để ghi sẵn các gói lệnh. Chúng có thể được tái sử dụng trong {{domxref("GPURenderPassEncoder")}} thông qua phương thức {{domxref("GPURenderPassEncoder.executeBundles", "executeBundles()")}} nhiều lần tùy cần.

## Cú pháp

```js-nolint
createRenderBundleEncoder(descriptor)
```

### Tham số

- `descriptor`
  - : Đối tượng mô tả bộ mã hóa render bundle cần tạo.

### Giá trị trả về

Một thể hiện {{domxref("GPURenderBundleEncoder")}}.

## Đặc tả

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
