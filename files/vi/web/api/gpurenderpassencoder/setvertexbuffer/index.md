---
title: "GPURenderPassEncoder: phương thức setVertexBuffer()"
short-title: setVertexBuffer()
slug: Web/API/GPURenderPassEncoder/setVertexBuffer
page-type: web-api-instance-method
browser-compat: api.GPURenderPassEncoder.setVertexBuffer
---

{{APIRef("WebGPU API")}}{{SecureContext_Header}}{{AvailableInWorkers}}

Phương thức **`setVertexBuffer()`** của giao diện {{domxref("GPURenderPassEncoder")}} đặt hoặc bỏ đặt {{domxref("GPUBuffer")}} hiện tại cho vị trí đã cho sẽ cung cấp dữ liệu đỉnh cho các lệnh vẽ tiếp theo.

## Cú pháp

```js-nolint
setVertexBuffer(slot, buffer, offset, size)
```

### Tham số

- `slot`
  - : Một số tham chiếu vị trí bộ đệm đỉnh để đặt bộ đệm đỉnh cho.
- `buffer`
  - : Một {{domxref("GPUBuffer")}} biểu diễn bộ đệm chứa dữ liệu đỉnh để sử dụng cho các lệnh vẽ tiếp theo, hoặc `null`, trong trường hợp đó bất kỳ bộ đệm đã đặt trước đó trong vị trí đã cho sẽ bị bỏ đặt.
- `offset` {{optional_inline}}
  - : Một số biểu diễn độ lệch, tính bằng byte, vào `buffer` nơi dữ liệu đỉnh bắt đầu. Nếu bỏ qua, `offset` mặc định là 0.
- `size` {{optional_inline}}
  - : Một số biểu diễn kích thước, tính bằng byte, của dữ liệu đỉnh chứa trong `buffer`. Nếu bỏ qua, `size` mặc định là {{domxref("GPUBuffer.size")}} của `buffer` trừ `offset`.

### Giá trị trả về

Không có ({{jsxref("Undefined")}}).

### Xác thực

Các tiêu chí sau phải được đáp ứng khi gọi **`setVertexBuffer()`**, nếu không {{domxref("GPUValidationError")}} sẽ được tạo ra và {{domxref("GPURenderPassEncoder")}} sẽ không hợp lệ:

- {{domxref("GPUBuffer.usage")}} của `buffer` chứa cờ `GPUBufferUsage.VERTEX`.
- `slot` nhỏ hơn giới hạn `maxVertexBuffers` {{domxref("GPUSupportedLimits", "limit", "", "nocode")}} của {{domxref("GPUDevice")}}.
- `offset` + `size` nhỏ hơn hoặc bằng {{domxref("GPUBuffer.size")}} của `buffer`.
- `offset` là bội số của 4.

## Ví dụ

### Đặt bộ đệm đỉnh

Trong [demo kết xuất cơ bản](https://mdn.github.io/dom-examples/webgpu-render-demo/) của chúng tôi, một số lệnh được ghi lại thông qua {{domxref("GPUCommandEncoder")}}. Hầu hết các lệnh này xuất phát từ `GPURenderPassEncoder` được tạo thông qua {{domxref("GPUCommandEncoder.beginRenderPass()")}}. `setVertexBuffer()` được sử dụng phù hợp để đặt nguồn dữ liệu đỉnh.

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

### Bỏ đặt bộ đệm đỉnh

```js
// Set vertex buffer in slot 0
passEncoder.setVertexBuffer(0, vertexBuffer);

// Later, unset vertex buffer in slot 0
passEncoder.setVertexBuffer(0, null);
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [WebGPU API](/en-US/docs/Web/API/WebGPU_API)
