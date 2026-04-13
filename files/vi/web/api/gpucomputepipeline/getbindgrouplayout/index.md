---
title: "GPUComputePipeline: getBindGroupLayout() method"
short-title: getBindGroupLayout()
slug: Web/API/GPUComputePipeline/getBindGroupLayout
page-type: web-api-instance-method
browser-compat: api.GPUComputePipeline.getBindGroupLayout
---

{{APIRef("WebGPU API")}}{{SecureContext_Header}}{{AvailableInWorkers}}

Phương thức **`getBindGroupLayout()`** của giao diện {{domxref("GPUComputePipeline")}} trả về đối tượng {{domxref("GPUBindGroupLayout")}} của pipeline với chỉ mục cho trước (tức là được bao gồm trong bố cục pipeline của lệnh gọi {{domxref("GPUDevice.createComputePipeline()")}} hoặc {{domxref("GPUDevice.createComputePipelineAsync()")}} gốc).

Nếu {{domxref("GPUComputePipeline")}} được tạo với `layout: "auto"`, phương thức này là cách duy nhất để lấy {{domxref("GPUBindGroupLayout")}} được tạo bởi pipeline.

## Cú pháp

```js-nolint
getBindGroupLayout(index)
```

### Tham số

- `index`
  - : Số đại diện cho chỉ mục của {{domxref("GPUBindGroupLayout")}} cần trả về.

### Giá trị trả về

Phiên bản đối tượng {{domxref("GPUBindGroupLayout")}}.

### Xác thực

Các tiêu chí sau phải được đáp ứng khi gọi **`getBindGroupLayout()`**, nếu không {{domxref("GPUValidationError")}} được tạo ra và đối tượng {{domxref("GPUBindGroupLayout")}} không hợp lệ được trả về:

- `index` nhỏ hơn số đối tượng {{domxref("GPUBindGroupLayout")}} được sử dụng trong bố cục pipeline.

## Ví dụ

> [!NOTE]
> Bạn có thể thấy các ví dụ hoàn chỉnh với `getBindGroupLayout()` trong các [mẫu WebGPU](https://webgpu.github.io/webgpu-samples/).

```js
// …

// Create a compute pipeline using layout: "auto" to automatically generate
// appropriate bind group layouts
const computePipeline = device.createComputePipeline({
  layout: "auto",
  compute: {
    module: shaderModule,
    entryPoint: "main",
  },
});

// Create a bind group with the auto-generated layout from the compute pipeline
const computeBindGroup = device.createBindGroup({
  layout: computePipeline.getBindGroupLayout(0),
  entries: [
    {
      binding: 0,
      resource: { buffer: storageBuffer },
    },
  ],
});

// …
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [WebGPU API](/en-US/docs/Web/API/WebGPU_API)
