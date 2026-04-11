---
title: "GPUDevice: phương thức createComputePipeline()"
short-title: createComputePipeline()
slug: Web/API/GPUDevice/createComputePipeline
page-type: web-api-instance-method
browser-compat: api.GPUDevice.createComputePipeline
---

{{APIRef("WebGPU API")}}{{SecureContext_Header}}{{AvailableInWorkers}}

Phương thức **`createComputePipeline()`** của giao diện {{domxref("GPUDevice")}} tạo một {{domxref("GPUComputePipeline")}} có thể điều khiển giai đoạn compute shader và được dùng trong {{domxref("GPUComputePassEncoder")}}.

## Cú pháp

```js-nolint
createComputePipeline(descriptor)
```

### Tham số

- `descriptor`
  - : Đối tượng mô tả pipeline tính toán cần tạo.

### Giá trị trả về

Một thể hiện {{domxref("GPUComputePipeline")}}.

## Đặc tả

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
