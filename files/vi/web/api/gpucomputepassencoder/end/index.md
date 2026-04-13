---
title: "GPUComputePassEncoder: end() method"
short-title: end()
slug: Web/API/GPUComputePassEncoder/end
page-type: web-api-instance-method
browser-compat: api.GPUComputePassEncoder.end
---

{{APIRef("WebGPU API")}}{{SecureContext_Header}}{{AvailableInWorkers}}

Phương thức **`end()`** của giao diện {{domxref("GPUComputePassEncoder")}} hoàn tất việc ghi chuỗi lệnh compute pass hiện tại.

## Cú pháp

```js-nolint
end()
```

### Tham số

Không có.

### Giá trị trả về

Không có ({{jsxref("Undefined")}}).

### Kiểm tra hợp lệ

Các tiêu chí sau phải được đáp ứng khi gọi **`end()`**, nếu không {{domxref("GPUValidationError")}} sẽ được tạo ra và {{domxref("GPUComputePassEncoder")}} sẽ trở nên không hợp lệ:

- {{domxref("GPUComputePassEncoder")}} đang mở (tức là chưa kết thúc bằng lời gọi `end()`).
- Bất kỳ lời gọi {{domxref("GPUComputePassEncoder.pushDebugGroup", "pushDebugGroup()")}} nào trên encoder này đều phải có lời gọi {{domxref("GPUComputePassEncoder.popDebugGroup", "popDebugGroup()")}} tương ứng trước khi `end()` được gọi.

## Ví dụ

Trong [bản demo compute cơ bản](https://mdn.github.io/dom-examples/webgpu-compute-demo/), một số lệnh được ghi thông qua {{domxref("GPUCommandEncoder")}}. Phần lớn các lệnh này xuất phát từ {{domxref("GPUComputePassEncoder")}} được tạo qua {{domxref("GPUCommandEncoder.beginComputePass()")}}.

```js
const BUFFER_SIZE = 1000;

// …

// Create GPUCommandEncoder to encode commands to issue to the GPU
const commandEncoder = device.createCommandEncoder();

// Initiate compute pass
const passEncoder = commandEncoder.beginComputePass();

// Issue commands
passEncoder.setPipeline(computePipeline);
passEncoder.setBindGroup(0, bindGroup);
passEncoder.dispatchWorkgroups(Math.ceil(BUFFER_SIZE / 64));

// End the render pass
passEncoder.end();

// Copy output buffer to staging buffer
commandEncoder.copyBufferToBuffer(
  output,
  0, // Source offset
  stagingBuffer,
  0, // Destination offset
  BUFFER_SIZE,
);

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
