---
title: "GPUComputePassEncoder: setPipeline() method"
short-title: setPipeline()
slug: Web/API/GPUComputePassEncoder/setPipeline
page-type: web-api-instance-method
browser-compat: api.GPUComputePassEncoder.setPipeline
---

{{APIRef("WebGPU API")}}{{SecureContext_Header}}{{AvailableInWorkers}}

Phương thức **`setPipeline()`** của giao diện {{domxref("GPUComputePassEncoder")}} đặt {{domxref("GPUComputePipeline")}} để sử dụng cho compute pass này.

## Cú pháp

```js-nolint
setPipeline(pipeline)
```

### Tham số

- `pipeline`
  - : {{domxref("GPUComputePipeline")}} để sử dụng cho compute pass này.

### Giá trị trả về

Không có ({{jsxref("Undefined")}}).

## Ví dụ

Trong [bản demo compute cơ bản](https://mdn.github.io/dom-examples/webgpu-compute-demo/), một số lệnh được ghi thông qua {{domxref("GPUCommandEncoder")}}. Phần lớn các lệnh này xuất phát từ {{domxref("GPUComputePassEncoder")}} được tạo qua `beginComputePass()`. Lời gọi `setPipeline()` được sử dụng phù hợp để đặt pipeline sử dụng cho pass này.

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
