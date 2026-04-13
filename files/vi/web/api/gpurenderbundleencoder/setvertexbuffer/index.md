---
title: "GPURenderBundleEncoder: phương thức setVertexBuffer()"
short-title: setVertexBuffer()
slug: Web/API/GPURenderBundleEncoder/setVertexBuffer
page-type: web-api-instance-method
browser-compat: api.GPURenderBundleEncoder.setVertexBuffer
---

{{APIRef("WebGPU API")}}{{SecureContext_Header}}{{AvailableInWorkers}}

Phương thức **`setVertexBuffer()`** của giao diện {{domxref("GPURenderBundleEncoder")}} đặt hoặc bỏ đặt {{domxref("GPUBuffer")}} hiện tại cho vị trí đã cho sẽ cung cấp dữ liệu đỉnh cho các lệnh vẽ tiếp theo.

> [!NOTE]
> Phương thức này về mặt chức năng giống hệt với phương thức tương đương trên {{domxref("GPURenderPassEncoder")}} — {{domxref("GPURenderPassEncoder.setVertexBuffer", "setVertexBuffer()")}}.

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

Các tiêu chí sau phải được đáp ứng khi gọi **`setVertexBuffer()`**, nếu không {{domxref("GPUValidationError")}} sẽ được tạo ra và {{domxref("GPURenderBundleEncoder")}} sẽ không hợp lệ:

- {{domxref("GPUBuffer.usage")}} của `buffer` chứa cờ `GPUBufferUsage.VERTEX`.
- `slot` nhỏ hơn giới hạn `maxVertexBuffers` {{domxref("GPUSupportedLimits", "limit", "", "nocode")}} của {{domxref("GPUDevice")}}.
- `offset` + `size` nhỏ hơn hoặc bằng {{domxref("GPUBuffer.size")}} của `buffer`.
- `offset` là bội số của 4.

## Ví dụ

### Đặt bộ đệm đỉnh

```js
function recordRenderPass(passEncoder) {
  if (settings.dynamicOffsets) {
    passEncoder.setPipeline(dynamicPipeline);
  } else {
    passEncoder.setPipeline(pipeline);
  }
  passEncoder.setVertexBuffer(0, vertexBuffer);
  passEncoder.setBindGroup(0, timeBindGroup);
  const dynamicOffsets = [0];
  for (let i = 0; i < numTriangles; ++i) {
    if (settings.dynamicOffsets) {
      dynamicOffsets[0] = i * alignedUniformBytes;
      passEncoder.setBindGroup(1, dynamicBindGroup, dynamicOffsets);
    } else {
      passEncoder.setBindGroup(1, bindGroups[i]);
    }
    passEncoder.draw(3, 1, 0, 0);
  }
}
```

Đoạn mã trên được lấy từ ví dụ WebGPU Samples [Animometer example](https://webgpu.github.io/webgpu-samples/samples/animometer/).

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
