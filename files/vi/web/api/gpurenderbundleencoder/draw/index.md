---
title: "GPURenderBundleEncoder: phương thức draw()"
short-title: draw()
slug: Web/API/GPURenderBundleEncoder/draw
page-type: web-api-instance-method
browser-compat: api.GPURenderBundleEncoder.draw
---

{{APIRef("WebGPU API")}}{{SecureContext_Header}}{{AvailableInWorkers}}

Phương thức **`draw()`** của giao diện {{domxref("GPURenderBundleEncoder")}} vẽ các nguyên thủy dựa trên các bộ đệm đỉnh được cung cấp bởi {{domxref("GPURenderBundleEncoder.setVertexBuffer", "setVertexBuffer()")}}.

> [!NOTE]
> Phương thức này về mặt chức năng giống hệt với phương thức tương đương trên {{domxref("GPURenderPassEncoder")}} — {{domxref("GPURenderPassEncoder.draw", "draw()")}}.

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

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [WebGPU API](/en-US/docs/Web/API/WebGPU_API)
