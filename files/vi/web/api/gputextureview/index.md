---
title: GPUTextureView
slug: Web/API/GPUTextureView
page-type: web-api-interface
browser-compat: api.GPUTextureView
---

{{APIRef("WebGPU API")}}{{SecureContext_Header}}{{AvailableInWorkers}}

Giao diện **`GPUTextureView`** của {{domxref("WebGPU API", "WebGPU API", "", "nocode")}} đại diện cho một khung nhìn vào một tập con tài nguyên kết cấu được xác định bởi một {{domxref("GPUTexture")}} cụ thể.

Đối tượng `GPUTextureView` được tạo bằng phương thức {{domxref("GPUTexture.createView()")}}.

{{InheritanceDiagram}}

## Thuộc tính phiên bản

- {{domxref("GPUTextureView.label", "label")}}
  - : Một chuỗi cung cấp nhãn có thể được sử dụng để nhận dạng đối tượng, ví dụ trong thông báo {{domxref("GPUError")}} hoặc cảnh báo bảng điều khiển.

## Ví dụ

Trong bản demo [Cubemap](https://webgpu.github.io/webgpu-samples/samples/cubemap/) của WebGPU Samples, bạn sẽ thấy nhiều ví dụ về cách `GPUTextureView` (được tạo bởi lệnh gọi {{domxref("GPUTexture.createView()")}}) được sử dụng, cả như `resource` trong lệnh gọi {{domxref("GPUDevice.createBindGroup()")}} và như `view` được cung cấp trong đối tượng `depthStencilAttachment` của descriptor {{domxref("GPUCommandEncoder.beginRenderPass()")}}.

```js
const uniformBindGroup = device.createBindGroup({
  layout: pipeline.getBindGroupLayout(0),
  entries: [
    {
      binding: 0,
      resource: {
        buffer: uniformBuffer,
        offset: 0,
        size: uniformBufferSize,
      },
    },
    {
      binding: 1,
      resource: sampler,
    },
    {
      binding: 2,
      resource: cubemapTexture.createView({
        dimension: "cube",
      }),
    },
  ],
});

const renderPassDescriptor: GPURenderPassDescriptor = {
  colorAttachments: [
    {
      view: undefined, // Assigned later
      loadOp: "clear",
      storeOp: "store",
    },
  ],
  depthStencilAttachment: {
    view: depthTexture.createView(),
    depthClearValue: 1.0,
    depthLoadOp: "clear",
    depthStoreOp: "store",
  },
};

// …

const commandEncoder = device.createCommandEncoder();
const passEncoder = commandEncoder.beginRenderPass(renderPassDescriptor);

// …
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [WebGPU API](/en-US/docs/Web/API/WebGPU_API)
