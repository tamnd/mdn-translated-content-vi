---
title: "GPURenderPassEncoder: phương thức end()"
short-title: end()
slug: Web/API/GPURenderPassEncoder/end
page-type: web-api-instance-method
browser-compat: api.GPURenderPassEncoder.end
---

{{APIRef("WebGPU API")}}{{SecureContext_Header}}{{AvailableInWorkers}}

Phương thức **`end()`** của giao diện {{domxref("GPURenderPassEncoder")}} hoàn thành việc ghi lại chuỗi lệnh của lần thực thi kết xuất hiện tại.

## Cú pháp

```js-nolint
end()
```

### Tham số

Không có.

### Giá trị trả về

Không có ({{jsxref("Undefined")}}).

### Xác thực

Các tiêu chí sau phải được đáp ứng khi gọi **`end()`**, nếu không {{domxref("GPUValidationError")}} sẽ được tạo ra và {{domxref("GPURenderPassEncoder")}} sẽ không hợp lệ:

- {{domxref("GPURenderPassEncoder")}} đang mở (tức là chưa kết thúc bằng lệnh gọi `end()`).
- Không có truy vấn occlusion nào (tức là đã được bắt đầu qua {{domxref("GPURenderPassEncoder.beginOcclusionQuery", "beginOcclusionQuery()")}}) đang hoạt động trên lần thực thi kết xuất hiện tại.
- Ngăn xếp gỡ lỗi cho lần thực thi kết xuất hiện tại trống (tức là không có nhóm gỡ lỗi lần thực thi kết xuất nào đang mở, như được mở bởi {{domxref("GPURenderPassEncoder.pushDebugGroup", "pushDebugGroup()")}}).
- Số lệnh vẽ được mã hóa trong lần thực thi kết xuất này nhỏ hơn hoặc bằng thuộc tính `maxDrawCount` được đặt trong descriptor {{domxref("GPUCommandEncoder.beginRenderPass()")}}.

## Ví dụ

Trong [demo kết xuất cơ bản](https://mdn.github.io/dom-examples/webgpu-render-demo/) của chúng tôi, một số lệnh được ghi lại thông qua {{domxref("GPUCommandEncoder")}}. Hầu hết các lệnh này xuất phát từ `GPURenderPassEncoder` được tạo thông qua {{domxref("GPUCommandEncoder.beginRenderPass()")}}. `end()` được gọi tại vị trí thích hợp để kết thúc lần thực thi kết xuất.

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
