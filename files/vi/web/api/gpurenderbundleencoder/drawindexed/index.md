---
title: "GPURenderBundleEncoder: phương thức drawIndexed()"
short-title: drawIndexed()
slug: Web/API/GPURenderBundleEncoder/drawIndexed
page-type: web-api-instance-method
browser-compat: api.GPURenderBundleEncoder.drawIndexed
---

{{APIRef("WebGPU API")}}{{SecureContext_Header}}{{AvailableInWorkers}}

Phương thức **`drawIndexed()`** của giao diện {{domxref("GPURenderBundleEncoder")}} vẽ các nguyên thủy có chỉ mục dựa trên các bộ đệm đỉnh và chỉ mục được cung cấp bởi {{domxref("GPURenderBundleEncoder.setVertexBuffer", "setVertexBuffer()")}} và {{domxref("GPURenderBundleEncoder.setIndexBuffer", "setIndexBuffer()")}}.

> [!NOTE]
> Phương thức này về mặt chức năng giống hệt với phương thức tương đương trên {{domxref("GPURenderPassEncoder")}} — {{domxref("GPURenderPassEncoder.drawIndexed", "drawIndexed()")}}.

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

```js
// …

const bundleEncoder = device.createRenderBundleEncoder(descriptor);

bundleEncoder.setPipeline(pipeline);
bundleEncoder.setBindGroup(0, sceneBindGroupForRender);
bundleEncoder.setBindGroup(1, modelBindGroup);
bundleEncoder.setVertexBuffer(0, vertexBuffer);
bundleEncoder.setIndexBuffer(indexBuffer, "uint16");
bundleEncoder.drawIndexed(indexCount);

const renderBundle = bundleEncoder.finish();

// …
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [WebGPU API](/en-US/docs/Web/API/WebGPU_API)
