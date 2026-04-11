---
title: "GPURenderPassEncoder: phương thức draw()"
short-title: draw()
slug: Web/API/GPURenderPassEncoder/draw
page-type: web-api-instance-method
browser-compat: api.GPURenderPassEncoder.draw
---

{{APIRef("WebGPU API")}}{{SecureContext_Header}}{{AvailableInWorkers}}

Phương thức **`draw()`** của giao diện {{domxref("GPURenderPassEncoder")}} vẽ các nguyên thủy dựa trên các bộ đệm đỉnh được cung cấp bởi {{domxref("GPURenderPassEncoder.setVertexBuffer", "setVertexBuffer()")}}.

## Cú pháp

```js-nolint
draw(vertexCount)
draw(vertexCount, instanceCount)
draw(vertexCount, instanceCount, firstVertex)
draw(vertexCount, instanceCount, firstVertex, firstInstance)
```

### Tham số

- `vertexCount`
  - : Một số xác định số lượng đỉnh cần vẽ.
- `instanceCount` {{optional_inline}}
  - : Một số xác định số lượng thực thể cần vẽ. Nếu bỏ qua, `instanceCount` mặc định là 1.
- `firstVertex` {{optional_inline}}
  - : Một số xác định độ lệch vào các bộ đệm đỉnh, tính bằng đỉnh, để bắt đầu vẽ từ đó. Nếu bỏ qua, `firstVertex` mặc định là 0.
- `firstInstance` {{optional_inline}}
  - : Một số xác định thực thể đầu tiên cần vẽ. Nếu bỏ qua, `firstInstance` mặc định là 0.

### Giá trị trả về

Không có ({{jsxref("Undefined")}}).

## Ví dụ

Trong [demo kết xuất cơ bản](https://mdn.github.io/dom-examples/webgpu-render-demo/) của chúng tôi, một số lệnh được ghi lại thông qua {{domxref("GPUCommandEncoder")}}. Hầu hết các lệnh này xuất phát từ `GPURenderPassEncoder` được tạo thông qua {{domxref("GPUCommandEncoder.beginRenderPass()")}}. `draw()` được dùng để chỉ định rằng ba đỉnh sẽ được vẽ để tạo tam giác của chúng tôi.

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
