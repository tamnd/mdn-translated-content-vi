---
title: "GPUDevice: phương thức createRenderPipeline()"
short-title: createRenderPipeline()
slug: Web/API/GPUDevice/createRenderPipeline
page-type: web-api-instance-method
browser-compat: api.GPUDevice.createRenderPipeline
---

{{APIRef("WebGPU API")}}{{SecureContext_Header}}{{AvailableInWorkers}}

Phương thức **`createRenderPipeline()`** của giao diện {{domxref("GPUDevice")}} tạo một {{domxref("GPURenderPipeline")}} có thể điều khiển các giai đoạn vertex và fragment shader và được dùng trong {{domxref("GPURenderPassEncoder")}} hoặc {{domxref("GPURenderBundleEncoder")}}.

## Cú pháp

```js-nolint
createRenderPipeline(descriptor)
```

### Tham số

- `descriptor`
  - : Đối tượng mô tả pipeline dựng hình cần tạo.

### Giá trị trả về

Một thể hiện {{domxref("GPURenderPipeline")}}.

## Đặc tả

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
