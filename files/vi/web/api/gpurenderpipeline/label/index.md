---
title: "GPURenderPipeline: label property"
short-title: label
slug: Web/API/GPURenderPipeline/label
page-type: web-api-instance-property
browser-compat: api.GPURenderPipeline.label
---

{{APIRef("WebGPU API")}}{{SecureContext_Header}}{{AvailableInWorkers}}

Thuộc tính **`label`** của giao diện {{domxref("GPURenderPipeline")}} cung cấp nhãn có thể được sử dụng để xác định đối tượng, ví dụ trong các thông báo {{domxref("GPUError")}} hoặc cảnh báo console.

Điều này có thể được đặt bằng cách cung cấp thuộc tính `label` trong đối tượng descriptor được truyền vào lệnh gọi {{domxref("GPUDevice.createRenderPipeline()")}} hoặc {{domxref("GPUDevice.createRenderPipelineAsync()")}} gốc, hoặc bạn có thể lấy và đặt trực tiếp trên đối tượng `GPURenderPipeline`.

## Giá trị

Một chuỗi. Nếu chưa được đặt như mô tả ở trên, nó sẽ là chuỗi rỗng.

## Ví dụ

Đặt và lấy nhãn qua `GPURenderPipeline.label`:

```js
// …

const pipelineDescriptor = {
  vertex: {
    module: shaderModule,
    entryPoint: "vertex_main",
    buffers: vertexBuffers,
  },
  fragment: {
    module: shaderModule,
    entryPoint: "fragment_main",
    targets: [
      {
        format: navigator.gpu.getPreferredCanvasFormat(),
      },
    ],
  },
  primitive: {
    topology: "triangle-list",
  },
  layout: "auto",
};

const renderPipeline = device.createRenderPipeline(pipelineDescriptor);

renderPipeline.label = "my_render_pipeline";

console.log(renderPipeline.label); // "my_render_pipeline"
```

Đặt nhãn qua lệnh gọi {{domxref("GPUDevice.createRenderPipeline()")}}, sau đó lấy qua `GPURenderPipeline.label`:

```js
// …

const pipelineDescriptor = {
  vertex: {
    module: shaderModule,
    entryPoint: "vertex_main",
    buffers: vertexBuffers,
  },
  fragment: {
    module: shaderModule,
    entryPoint: "fragment_main",
    targets: [
      {
        format: navigator.gpu.getPreferredCanvasFormat(),
      },
    ],
  },
  primitive: {
    topology: "triangle-list",
  },
  layout: "auto",
  label: "my_render_pipeline",
};

const renderPipeline = device.createRenderPipeline(pipelineDescriptor);

console.log(renderPipeline.label); // "my_render_pipeline"
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [WebGPU API](/en-US/docs/Web/API/WebGPU_API)
