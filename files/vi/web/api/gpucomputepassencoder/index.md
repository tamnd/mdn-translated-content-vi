---
title: GPUComputePassEncoder
slug: Web/API/GPUComputePassEncoder
page-type: web-api-interface
browser-compat: api.GPUComputePassEncoder
---

{{APIRef("WebGPU API")}}{{SecureContext_Header}}{{AvailableInWorkers}}

Giao diện **`GPUComputePassEncoder`** của {{domxref("WebGPU API", "WebGPU API", "", "nocode")}} mã hóa các lệnh liên quan đến điều khiển giai đoạn compute shader, được phát ra bởi {{domxref("GPUComputePipeline")}}. Đây là một phần trong hoạt động mã hóa tổng thể của {{domxref("GPUCommandEncoder")}}.

Một compute pipeline chứa một giai đoạn compute duy nhất, trong đó compute shader nhận dữ liệu tổng quát, xử lý song song trên một số lượng workgroup được chỉ định, rồi trả kết quả vào một hoặc nhiều buffer.

Một phiên bản đối tượng `GPUComputePassEncoder` được tạo thông qua thuộc tính {{domxref("GPUCommandEncoder.beginComputePass()")}}.

{{InheritanceDiagram}}

## Thuộc tính phiên bản

- {{domxref("GPUComputePassEncoder.label", "label")}}
  - : Một chuỗi cung cấp nhãn có thể dùng để nhận dạng đối tượng, ví dụ trong thông báo {{domxref("GPUError")}} hoặc cảnh báo console.

## Phương thức phiên bản

- {{domxref("GPUComputePassEncoder.dispatchWorkgroups", "dispatchWorkgroups()")}}
  - : Gửi đi một lưới workgroup cụ thể để thực hiện công việc do {{domxref("GPUComputePipeline")}} hiện tại đảm nhiệm.
- {{domxref("GPUComputePassEncoder.dispatchWorkgroupsIndirect", "dispatchWorkgroupsIndirect()")}}
  - : Gửi đi một lưới workgroup, được định nghĩa bởi các tham số của {{domxref("GPUBuffer")}}, để thực hiện công việc do {{domxref("GPUComputePipeline")}} hiện tại đảm nhiệm.
- {{domxref("GPUComputePassEncoder.end", "end()")}}
  - : Hoàn tất việc ghi chuỗi lệnh compute pass hiện tại.
- {{domxref("GPUComputePassEncoder.insertDebugMarker", "insertDebugMarker()")}}
  - : Đánh dấu một điểm cụ thể trong chuỗi lệnh mã hóa bằng một nhãn.
- {{domxref("GPUComputePassEncoder.popDebugGroup", "popDebugGroup()")}}
  - : Kết thúc một debug group, được bắt đầu bởi lời gọi {{domxref("GPUComputePassEncoder.pushDebugGroup", "pushDebugGroup()")}}.
- {{domxref("GPUComputePassEncoder.pushDebugGroup", "pushDebugGroup()")}}
  - : Bắt đầu một debug group, được đánh dấu bằng nhãn chỉ định, và sẽ chứa tất cả các lệnh mã hóa tiếp theo cho đến khi phương thức {{domxref("GPUComputePassEncoder.popDebugGroup", "popDebugGroup()")}} được gọi.
- {{domxref("GPUComputePassEncoder.setBindGroup", "setBindGroup()")}}
  - : Đặt {{domxref("GPUBindGroup")}} để sử dụng cho các lệnh compute tiếp theo, cho một chỉ mục nhất định.
- {{domxref("GPUComputePassEncoder.setPipeline", "setPipeline()")}}
  - : Đặt {{domxref("GPUComputePipeline")}} để sử dụng cho compute pass này.

## Ví dụ

Trong [bản demo compute cơ bản](https://mdn.github.io/dom-examples/webgpu-compute-demo/) của chúng tôi, một số lệnh được ghi thông qua {{domxref("GPUCommandEncoder")}}. Phần lớn các lệnh này xuất phát từ `GPUComputePassEncoder` được tạo qua {{domxref("GPUCommandEncoder.beginComputePass()")}}.

```js
// …

// Create GPUCommandEncoder to encode commands to issue to the GPU
const commandEncoder = device.createCommandEncoder();

// Create GPUComputePassEncoder to initiate compute pass
const passEncoder = commandEncoder.beginComputePass();

// Issue commands
passEncoder.setPipeline(computePipeline);
passEncoder.setBindGroup(0, bindGroup);
passEncoder.dispatchWorkgroups(Math.ceil(BUFFER_SIZE / 64));

// End the compute pass
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
