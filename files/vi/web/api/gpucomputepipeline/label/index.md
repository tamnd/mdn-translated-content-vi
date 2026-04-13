---
title: "GPUComputePipeline: label property"
short-title: label
slug: Web/API/GPUComputePipeline/label
page-type: web-api-instance-property
browser-compat: api.GPUComputePipeline.label
---

{{APIRef("WebGPU API")}}{{SecureContext_Header}}{{AvailableInWorkers}}

Thuộc tính **`label`** của giao diện {{domxref("GPUComputePipeline")}} cung cấp nhãn có thể được sử dụng để xác định đối tượng, ví dụ trong các thông báo {{domxref("GPUError")}} hoặc cảnh báo console.

Điều này có thể được đặt bằng cách cung cấp thuộc tính `label` trong đối tượng descriptor được truyền vào lệnh gọi {{domxref("GPUDevice.createComputePipeline()")}} hoặc {{domxref("GPUDevice.createComputePipelineAsync()")}} gốc, hoặc bạn có thể lấy và đặt trực tiếp trên đối tượng `GPUComputePipeline`.

## Giá trị

Một chuỗi. Nếu chưa được đặt như mô tả ở trên, nó sẽ là chuỗi rỗng.

## Ví dụ

Đặt và lấy nhãn qua `GPUComputePipeline.label`:

```js
// …

const computePipeline = device.createComputePipeline({
  layout: device.createPipelineLayout({
    bindGroupLayouts: [bindGroupLayout],
  }),
  compute: {
    module: shaderModule,
    entryPoint: "main",
  },
});

computePipeline.label = "my_compute_pipeline";

console.log(computePipeline.label); // "my_compute_pipeline"
```

Đặt nhãn qua lệnh gọi {{domxref("GPUDevice.createComputePipeline()")}}, sau đó lấy qua `GPUComputePipeline.label`:

```js
// …

const computePipeline = device.createComputePipeline({
  layout: device.createPipelineLayout({
    bindGroupLayouts: [bindGroupLayout],
  }),
  compute: {
    module: shaderModule,
    entryPoint: "main",
  },
  label: "my_compute_pipeline",
});

console.log(computePipeline.label); // "my_compute_pipeline"
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [WebGPU API](/en-US/docs/Web/API/WebGPU_API)
