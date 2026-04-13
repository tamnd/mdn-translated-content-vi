---
title: GPUComputePipeline
slug: Web/API/GPUComputePipeline
page-type: web-api-interface
browser-compat: api.GPUComputePipeline
---

{{APIRef("WebGPU API")}}{{SecureContext_Header}}{{AvailableInWorkers}}

Giao diện **`GPUComputePipeline`** của {{domxref("WebGPU API", "WebGPU API", "", "nocode")}} đại diện cho pipeline kiểm soát giai đoạn compute shader và có thể được sử dụng trong {{domxref("GPUComputePassEncoder")}}.

Phiên bản đối tượng `GPUComputePipeline` có thể được tạo bằng phương thức {{domxref("GPUDevice.createComputePipeline()")}} hoặc {{domxref("GPUDevice.createComputePipelineAsync()")}}.

{{InheritanceDiagram}}

## Thuộc tính phiên bản

- {{domxref("GPUComputePipeline.label", "label")}}
  - : Một chuỗi cung cấp nhãn có thể được sử dụng để xác định đối tượng, ví dụ trong các thông báo {{domxref("GPUError")}} hoặc cảnh báo console.

## Phương thức phiên bản

- {{domxref("GPUComputePipeline.getBindGroupLayout", "getBindGroupLayout()")}}
  - : Trả về đối tượng {{domxref("GPUBindGroupLayout")}} của pipeline với chỉ mục cho trước (tức là được bao gồm trong bố cục pipeline của lệnh gọi {{domxref("GPUDevice.createComputePipeline()")}} hoặc {{domxref("GPUDevice.createComputePipelineAsync()")}} gốc).

## Ví dụ

> [!NOTE]
> [Mẫu WebGPU](https://webgpu.github.io/webgpu-samples/) có nhiều ví dụ hơn.

### Ví dụ cơ bản

[Demo tính toán cơ bản](https://mdn.github.io/dom-examples/webgpu-compute-demo/) của chúng ta hiển thị quá trình:

- Tạo bố cục nhóm ràng buộc bằng {{domxref("GPUDevice.createBindGroupLayout()")}}.
- Cung cấp `bindGroupLayout` vào {{domxref("GPUDevice.createPipelineLayout()")}} để tạo {{domxref("GPUPipelineLayout")}}.
- Sử dụng giá trị đó ngay lập tức trong lệnh gọi `createComputePipeline()` để tạo `GPUComputePipeline`.

```js
// …

const bindGroupLayout = device.createBindGroupLayout({
  entries: [
    {
      binding: 0,
      visibility: GPUShaderStage.COMPUTE,
      buffer: {
        type: "storage",
      },
    },
  ],
});

const computePipeline = device.createComputePipeline({
  layout: device.createPipelineLayout({
    bindGroupLayouts: [bindGroupLayout],
  }),
  compute: {
    module: shaderModule,
    entryPoint: "main",
  },
});

// …
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [WebGPU API](/en-US/docs/Web/API/WebGPU_API)
