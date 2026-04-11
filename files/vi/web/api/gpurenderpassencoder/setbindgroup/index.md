---
title: "GPURenderPassEncoder: phương thức setBindGroup()"
short-title: setBindGroup()
slug: Web/API/GPURenderPassEncoder/setBindGroup
page-type: web-api-instance-method
browser-compat: api.GPURenderPassEncoder.setBindGroup
---

{{APIRef("WebGPU API")}}{{SecureContext_Header}}{{AvailableInWorkers}}

Phương thức **`setBindGroup()`** của giao diện {{domxref("GPURenderPassEncoder")}} đặt {{domxref("GPUBindGroup")}} để sử dụng cho các lệnh kết xuất tiếp theo, cho một chỉ mục nhất định.

## Cú pháp

```js-nolint
setBindGroup(index, bindGroup)
setBindGroup(index, bindGroup, dynamicOffsets)
setBindGroup(index, bindGroup, dynamicOffsets, dynamicOffsetsStart,
             dynamicOffsetsLength)
```

### Tham số

- `index`
  - : Chỉ mục để đặt nhóm bind tại đó. Điều này khớp với giá trị chỉ mục `n` của thuộc tính [`@group(n)`](https://gpuweb.github.io/gpuweb/wgsl/#attribute-group) tương ứng trong mã đổ bóng ({{domxref("GPUShaderModule")}}) được dùng trong pipeline liên quan.
- `bindGroup`
  - : {{domxref("GPUBindGroup")}} để sử dụng cho các lệnh kết xuất tiếp theo, hoặc `null`, trong trường hợp đó bất kỳ nhóm bind đã đặt trước đó trong vị trí đã cho sẽ bị bỏ đặt.
- `dynamicOffsets` {{optional_inline}}
  - : Một giá trị chỉ định độ lệch, tính bằng byte, cho mỗi mục trong `bindGroup` có `hasDynamicOffset: true` được đặt (tức là trong descriptor của lệnh gọi {{domxref("GPUDevice.createBindGroupLayout()")}} đã tạo đối tượng {{domxref("GPUBindGroupLayout")}} mà `bindGroup` dựa trên). Giá trị này có thể là:
    - Một mảng các số chỉ định các độ lệch khác nhau.
    - Một {{jsxref("Uint32Array")}} chứa các số chỉ định các độ lệch.

Nếu giá trị {{jsxref("Uint32Array")}} được chỉ định cho `dynamicOffsets`, cả hai tham số sau cũng bắt buộc:

- `dynamicOffsetsStart`
  - : Một số chỉ định độ lệch, tính bằng phần tử mảng, vào `dynamicOffsetsData`, nơi dữ liệu độ lệch động bắt đầu.
- `dynamicOffsetsLength`
  - : Một số chỉ định số lượng giá trị độ lệch động cần đọc từ `dynamicOffsetsData`.

### Giá trị trả về

Không có ({{jsxref("Undefined")}}).

### Ngoại lệ

Đối với các lệnh gọi `setBindGroup()` sử dụng giá trị {{jsxref("Uint32Array")}} cho `dynamicOffsets`, lệnh gọi sẽ ném ra `RangeError` {{domxref("DOMException")}} nếu:

- `dynamicOffsetsStart` nhỏ hơn 0.
- `dynamicOffsetsStart` + `dynamicOffsetsLength` lớn hơn `dynamicOffsets.length`.

### Xác thực

Các tiêu chí sau phải được đáp ứng khi gọi **`setBindGroup()`**, nếu không {{domxref("GPUValidationError")}} sẽ được tạo ra và {{domxref("GPURenderPassEncoder")}} sẽ không hợp lệ:

- `index` nhỏ hơn hoặc bằng giới hạn `maxBindGroups` {{domxref("GPUSupportedLimits", "limit", "", "nocode")}} của {{domxref("GPUDevice")}}.
- `dynamicOffsets.length` bằng với số lượng mục trong `bindGroup` có `hasDynamicOffset: true` được đặt.
- Đối với các mục `bindGroup` mà `type` của `buffer` bị ràng buộc là `"uniform"` (xem {{domxref("GPUDevice.createBindGroupLayout()")}}), mỗi số trong `dynamicOffsets` là bội số của giới hạn `minUniformBufferOffsetAlignment` {{domxref("GPUSupportedLimits", "limit", "", "nocode")}} của {{domxref("GPUDevice")}}.
- Đối với các mục `bindGroup` mà `type` của `buffer` bị ràng buộc là `"storage"` hoặc `"read-only-storage"` (xem {{domxref("GPUDevice.createBindGroupLayout()")}}), mỗi số trong `dynamicOffsets` là bội số của giới hạn `minStorageBufferOffsetAlignment` {{domxref("GPUSupportedLimits", "limit", "", "nocode")}} của {{domxref("GPUDevice")}}.
- Đối với mỗi mục `bindGroup`, `offset` của `buffer` bị ràng buộc, cộng với `minBindingSize` của mục layout tương ứng, cộng với độ lệch động tương ứng được chỉ định trong `dynamicOffsets`, nhỏ hơn hoặc bằng `size` của `buffer` bị ràng buộc.

## Ví dụ

### Đặt nhóm bind

Trong ví dụ WebGPU Samples [Textured Cube example](https://webgpu.github.io/webgpu-samples/samples/texturedCube/), `setBindGroup()` được dùng để ràng buộc `uniformBindGroup` vào vị trí chỉ mục 0. Xem ví dụ để có đầy đủ ngữ cảnh.

```js
// …

const commandEncoder = device.createCommandEncoder();
const passEncoder = commandEncoder.beginRenderPass(renderPassDescriptor);
passEncoder.setPipeline(pipeline);
passEncoder.setBindGroup(0, uniformBindGroup);
passEncoder.setVertexBuffer(0, verticesBuffer);
passEncoder.draw(cubeVertexCount, 1, 0, 0);
passEncoder.end();
device.queue.submit([commandEncoder.finish()]);

// …
```

> [!NOTE]
> Nghiên cứu các [WebGPU Samples](https://webgpu.github.io/webgpu-samples/) khác để biết thêm ví dụ về cách sử dụng `setBindGroup()`.

### Bỏ đặt nhóm bind

```js
// Set bind group in slot 0
passEncoder.setBindGroup(0, uniformBindGroup);

// Later, unset bind group in slot 0
passEncoder.setBindGroup(0, null);
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [WebGPU API](/en-US/docs/Web/API/WebGPU_API)
