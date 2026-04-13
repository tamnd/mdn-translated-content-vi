---
title: "GPURenderPassEncoder: phương thức drawIndexed()"
short-title: drawIndexed()
slug: Web/API/GPURenderPassEncoder/drawIndexed
page-type: web-api-instance-method
browser-compat: api.GPURenderPassEncoder.drawIndexed
---

{{APIRef("WebGPU API")}}{{SecureContext_Header}}{{AvailableInWorkers}}

Phương thức **`drawIndexed()`** của giao diện {{domxref("GPURenderPassEncoder")}} vẽ các nguyên thủy có chỉ mục dựa trên các bộ đệm đỉnh và chỉ mục được cung cấp bởi {{domxref("GPURenderPassEncoder.setVertexBuffer", "setVertexBuffer()")}} và {{domxref("GPURenderPassEncoder.setIndexBuffer", "setIndexBuffer()")}}.

## Cú pháp

```js-nolint
drawIndexed(indexCount)
drawIndexed(indexCount, instanceCount)
drawIndexed(indexCount, instanceCount, firstIndex)
drawIndexed(indexCount, instanceCount, firstIndex, baseVertex)
drawIndexed(indexCount, instanceCount, firstIndex, baseVertex, firstInstance)
```

### Tham số

- `indexCount`
  - : Một số xác định số lượng chỉ mục cần vẽ.
- `instanceCount` {{optional_inline}}
  - : Một số xác định số lượng thực thể cần vẽ. Nếu bỏ qua, `instanceCount` mặc định là 1.
- `firstIndex` {{optional_inline}}
  - : Một số xác định độ lệch vào bộ đệm chỉ mục, tính bằng chỉ mục, để bắt đầu vẽ từ đó. Nếu bỏ qua, `firstIndex` mặc định là 0.
- `baseVertex` {{optional_inline}}
  - : Một số được thêm vào mỗi giá trị chỉ mục trước khi lập chỉ mục vào các bộ đệm đỉnh. Nếu bỏ qua, `baseVertex` mặc định là 0.
- `firstInstance` {{optional_inline}}
  - : Một số xác định thực thể đầu tiên cần vẽ. Nếu bỏ qua, `firstInstance` mặc định là 0.

### Giá trị trả về

Không có ({{jsxref("Undefined")}}).

## Ví dụ

Trong ví dụ WebGPU Samples [Shadow Mapping](https://webgpu.github.io/webgpu-samples/samples/shadowMapping/), `drawIndexed()` được sử dụng trong hai lần thực thi kết xuất riêng biệt trong mỗi khung hình hoạt ảnh, một lần để điền vào bộ đệm bóng và một lần để vẽ dạng xem chính của cảnh. Nghiên cứu danh sách mã ví dụ để có đầy đủ ngữ cảnh.

```js
// …

const commandEncoder = device.createCommandEncoder();
{
  const shadowPass = commandEncoder.beginRenderPass(shadowPassDescriptor);
  shadowPass.setPipeline(shadowPipeline);
  shadowPass.setBindGroup(0, sceneBindGroupForShadow);
  shadowPass.setBindGroup(1, modelBindGroup);
  shadowPass.setVertexBuffer(0, vertexBuffer);
  shadowPass.setIndexBuffer(indexBuffer, "uint16");
  shadowPass.drawIndexed(indexCount);

  shadowPass.end();
}
{
  const renderPass = commandEncoder.beginRenderPass(renderPassDescriptor);
  renderPass.setPipeline(pipeline);
  renderPass.setBindGroup(0, sceneBindGroupForRender);
  renderPass.setBindGroup(1, modelBindGroup);
  renderPass.setVertexBuffer(0, vertexBuffer);
  renderPass.setIndexBuffer(indexBuffer, "uint16");
  renderPass.drawIndexed(indexCount);

  renderPass.end();
}

// …
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [WebGPU API](/en-US/docs/Web/API/WebGPU_API)
