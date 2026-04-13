---
title: "GPURenderPassEncoder: phương thức setPipeline()"
short-title: setPipeline()
slug: Web/API/GPURenderPassEncoder/setPipeline
page-type: web-api-instance-method
browser-compat: api.GPURenderPassEncoder.setPipeline
---

{{APIRef("WebGPU API")}}{{SecureContext_Header}}{{AvailableInWorkers}}

Phương thức **`setPipeline()`** của giao diện {{domxref("GPURenderPassEncoder")}} đặt {{domxref("GPURenderPipeline")}} để sử dụng cho các lệnh lần thực thi kết xuất tiếp theo.

## Cú pháp

```js-nolint
setPipeline(pipeline)
```

### Tham số

- `pipeline`
  - : {{domxref("GPURenderPipeline")}} để sử dụng cho các lệnh lần thực thi kết xuất tiếp theo.

### Giá trị trả về

Không có ({{jsxref("Undefined")}}).

### Xác thực

Các tiêu chí sau phải được đáp ứng khi gọi **`setPipeline()`**, nếu không {{domxref("GPUValidationError")}} sẽ được tạo ra và {{domxref("GPURenderPassEncoder")}} sẽ không hợp lệ:

- Nếu {{domxref("GPURenderPipeline")}} ghi vào thành phần độ sâu của tệp đính kèm độ sâu/stencil, `depthReadOnly` (như được chỉ định trong descriptor của lệnh gọi {{domxref("GPUCommandEncoder.beginRenderPass()")}} nguồn gốc) là `true`.
- Nếu {{domxref("GPURenderPipeline")}} ghi vào thành phần stencil của tệp đính kèm độ sâu/stencil, `stencilReadOnly` (như được chỉ định trong descriptor của lệnh gọi {{domxref("GPUCommandEncoder.beginRenderPass()")}} nguồn gốc) là `true`.

## Ví dụ

Trong [demo kết xuất cơ bản](https://mdn.github.io/dom-examples/webgpu-render-demo/) của chúng tôi, một số lệnh được ghi lại thông qua {{domxref("GPUCommandEncoder")}}. Hầu hết các lệnh này xuất phát từ `GPURenderPassEncoder` được tạo thông qua {{domxref("GPUCommandEncoder.beginRenderPass()")}}. `setPipeline()` được gọi tại vị trí thích hợp để đặt đường ống kết xuất.

```js
// …

const renderPipeline = device.createRenderPipeline(pipelineDescriptor);

// Create GPUCommandEncoder to issue commands to the GPU
// Note: render pass descriptor, command encoder, etc. are destroyed after use, fresh one needed for each frame.
const commandEncoder = device.createCommandEncoder();

// Create GPURenderPassDescriptor to tell WebGPU which texture to draw into, then initiate render pass
const renderPassDescriptor = {
  colorAttachments: [
    {
      clearValue: clearColor,
      loadOp: "clear",
      storeOp: "store",
      view: context.getCurrentTexture().createView(),
    },
  ],
};

const passEncoder = commandEncoder.beginRenderPass(renderPassDescriptor);

// Draw the triangle
passEncoder.setPipeline(renderPipeline);
passEncoder.setVertexBuffer(0, vertexBuffer);
passEncoder.draw(3);

// End the render pass
passEncoder.end();

// End frame by passing array of command buffers to command queue for execution
device.queue.submit([commandEncoder.finish()]);

// …
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [WebGPU API](/en-US/docs/Web/API/WebGPU_API)
