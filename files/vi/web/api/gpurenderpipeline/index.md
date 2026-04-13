---
title: GPURenderPipeline
slug: Web/API/GPURenderPipeline
page-type: web-api-interface
browser-compat: api.GPURenderPipeline
---

{{APIRef("WebGPU API")}}{{SecureContext_Header}}{{AvailableInWorkers}}

Giao diện **`GPURenderPipeline`** của {{domxref("WebGPU API", "WebGPU API", "", "nocode")}} đại diện cho pipeline kiểm soát các giai đoạn vertex và fragment shader và có thể được sử dụng trong {{domxref("GPURenderPassEncoder")}} hoặc {{domxref("GPURenderBundleEncoder")}}.

Phiên bản đối tượng `GPURenderPipeline` có thể được tạo bằng phương thức {{domxref("GPUDevice.createRenderPipeline()")}} hoặc {{domxref("GPUDevice.createRenderPipelineAsync()")}}.

{{InheritanceDiagram}}

## Thuộc tính phiên bản

- {{domxref("GPURenderPipeline.label", "label")}}
  - : Một chuỗi cung cấp nhãn có thể được sử dụng để xác định đối tượng, ví dụ trong các thông báo {{domxref("GPUError")}} hoặc cảnh báo console.

## Phương thức phiên bản

- {{domxref("GPURenderPipeline.getBindGroupLayout", "getBindGroupLayout()")}}
  - : Trả về đối tượng {{domxref("GPUBindGroupLayout")}} của pipeline với chỉ mục cho trước (tức là được bao gồm trong bố cục pipeline của lệnh gọi {{domxref("GPUDevice.createRenderPipeline()")}} hoặc {{domxref("GPUDevice.createRenderPipelineAsync()")}} gốc).

## Ví dụ

> [!NOTE]
> [Mẫu WebGPU](https://webgpu.github.io/webgpu-samples/) có nhiều ví dụ hơn.

### Ví dụ cơ bản

[Demo kết xuất cơ bản](https://mdn.github.io/dom-examples/webgpu-render-demo/) của chúng ta cung cấp ví dụ về việc xây dựng đối tượng descriptor pipeline kết xuất hợp lệ, sau đó được sử dụng để tạo `GPURenderPipeline` qua lệnh gọi `createRenderPipeline()`.

```js
// …

const vertexBuffers = [
  {
    attributes: [
      {
        shaderLocation: 0, // position
        offset: 0,
        format: "float32x4",
      },
      {
        shaderLocation: 1, // color
        offset: 16,
        format: "float32x4",
      },
    ],
    arrayStride: 32,
    stepMode: "vertex",
  },
];

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

// …
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [WebGPU API](/en-US/docs/Web/API/WebGPU_API)
