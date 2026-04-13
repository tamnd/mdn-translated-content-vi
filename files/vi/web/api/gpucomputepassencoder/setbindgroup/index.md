---
title: "GPUComputePassEncoder: setBindGroup() method"
short-title: setBindGroup()
slug: Web/API/GPUComputePassEncoder/setBindGroup
page-type: web-api-instance-method
browser-compat: api.GPUComputePassEncoder.setBindGroup
---

{{APIRef("WebGPU API")}}{{SecureContext_Header}}{{AvailableInWorkers}}

Phương thức **`setBindGroup()`** của giao diện {{domxref("GPUComputePassEncoder")}} đặt {{domxref("GPUBindGroup")}} để sử dụng cho các lệnh compute tiếp theo, cho một chỉ mục nhất định.

## Cú pháp

```js-nolint
setBindGroup(index, bindGroup)
setBindGroup(index, bindGroup, dynamicOffsets)
setBindGroup(index, bindGroup, dynamicOffsets, dynamicOffsetsStart,
             dynamicOffsetsLength)
```

### Tham số

- `index`
  - : Chỉ mục để đặt bind group. Giá trị này khớp với chỉ mục `n` của thuộc tính [`@group(n)`](https://gpuweb.github.io/gpuweb/wgsl/#attribute-group) tương ứng trong shader code ({{domxref("GPUShaderModule")}}) được dùng trong pipeline liên quan.
- `bindGroup`
  - : {{domxref("GPUBindGroup")}} để sử dụng cho các lệnh compute tiếp theo, hoặc `null`, trong trường hợp đó bất kỳ bind group nào đã được đặt trước đó trong slot nhất định sẽ bị hủy.
- `dynamicOffsets` {{optional_inline}}
  - : Giá trị chỉ định offset tính bằng byte cho mỗi mục trong `bindGroup` có đặt `hasDynamicOffset: true` (tức là trong descriptor của lời gọi {{domxref("GPUDevice.createBindGroupLayout()")}} đã tạo ra đối tượng {{domxref("GPUBindGroupLayout")}} mà `bindGroup` dựa trên). Giá trị này có thể là:
    - Mảng các số chỉ định các offset khác nhau.
    - {{jsxref("Uint32Array")}} chứa các số chỉ định các offset.

Nếu giá trị {{jsxref("Uint32Array")}} được chỉ định cho `dynamicOffsets`, cả hai tham số sau cũng bắt buộc phải có:

- `dynamicOffsetsStart`
  - : Số chỉ định offset tính theo phần tử mảng vào trong `dynamicOffsetsData`, nơi dữ liệu dynamic offset bắt đầu.
- `dynamicOffsetsLength`
  - : Số chỉ định số lượng giá trị dynamic offset cần đọc từ `dynamicOffsetsData`.

### Giá trị trả về

Không có ({{jsxref("Undefined")}}).

### Ngoại lệ

Với các lời gọi `setBindGroup()` sử dụng giá trị {{jsxref("Uint32Array")}} cho `dynamicOffsets`, lời gọi sẽ ném ra `RangeError` {{domxref("DOMException")}} nếu:

- `dynamicOffsetsStart` nhỏ hơn 0.
- `dynamicOffsetsStart` + `dynamicOffsetsLength` lớn hơn `dynamicOffsets.length`.

### Kiểm tra hợp lệ

Các tiêu chí sau phải được đáp ứng khi gọi **`dispatchWorkgroups()`**, nếu không {{domxref("GPUValidationError")}} sẽ được tạo ra và {{domxref("GPUComputePassEncoder")}} sẽ trở nên không hợp lệ:

- `index` nhỏ hơn hoặc bằng giới hạn `maxBindGroups` {{domxref("GPUSupportedLimits", "limit", "", "nocode")}} của {{domxref("GPUDevice")}}.
- `dynamicOffsets.length` bằng số mục trong `bindGroup` có `hasDynamicOffset: true`.
- Với các mục `bindGroup` mà `buffer` được liên kết có `type` là `"uniform"` (xem {{domxref("GPUDevice.createBindGroupLayout()")}}), mỗi số trong `dynamicOffsets` phải là bội số của giới hạn `minUniformBufferOffsetAlignment` {{domxref("GPUSupportedLimits", "limit", "", "nocode")}} của {{domxref("GPUDevice")}}.
- Với các mục `bindGroup` mà `buffer` được liên kết có `type` là `"storage"` hoặc `"read-only-storage"` (xem {{domxref("GPUDevice.createBindGroupLayout()")}}), mỗi số trong `dynamicOffsets` phải là bội số của giới hạn `minStorageBufferOffsetAlignment` {{domxref("GPUSupportedLimits", "limit", "", "nocode")}} của {{domxref("GPUDevice")}}.
- Với mỗi mục `bindGroup`, `offset` của `buffer` được liên kết, cộng với `minBindingSize` của mục layout tương ứng, cộng với dynamic offset tương ứng được chỉ định trong `dynamicOffsets`, phải nhỏ hơn hoặc bằng `size` của `buffer` được liên kết.

## Ví dụ

### Đặt bind group

Trong [bản demo compute cơ bản](https://mdn.github.io/dom-examples/webgpu-compute-demo/), một số lệnh được ghi thông qua {{domxref("GPUCommandEncoder")}}. Phần lớn các lệnh này xuất phát từ {{domxref("GPUComputePassEncoder")}} được tạo qua `beginComputePass()`. Lời gọi `setBindGroup()` được sử dụng ở đây ở dạng đơn giản nhất, chỉ chỉ định chỉ mục và bind group.

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

### Hủy bind group

```js
// Set bind group in slot 0
passEncoder.setBindGroup(0, bindGroup);

// Later, unset bind group in slot 0
passEncoder.setBindGroup(0, null);
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [WebGPU API](/en-US/docs/Web/API/WebGPU_API)
