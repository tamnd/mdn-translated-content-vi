---
title: "GPURenderPassEncoder: phương thức beginOcclusionQuery()"
short-title: beginOcclusionQuery()
slug: Web/API/GPURenderPassEncoder/beginOcclusionQuery
page-type: web-api-instance-method
browser-compat: api.GPURenderPassEncoder.beginOcclusionQuery
---

{{APIRef("WebGPU API")}}{{SecureContext_Header}}{{AvailableInWorkers}}

Phương thức **`beginOcclusionQuery()`** của giao diện {{domxref("GPURenderPassEncoder")}} bắt đầu một truy vấn occlusion tại chỉ mục được chỉ định của {{domxref("GPUQuerySet")}} liên quan (được cung cấp làm giá trị của thuộc tính descriptor `occlusionQuerySet` khi gọi {{domxref("GPUCommandEncoder.beginRenderPass()")}} để chạy lần thực thi kết xuất).

## Cú pháp

```js-nolint
beginOcclusionQuery(queryIndex)
```

### Tham số

- `queryIndex`
  - : Chỉ mục trong {{domxref("GPUQuerySet")}} để bắt đầu truy vấn occlusion tại đó.

### Giá trị trả về

Không có ({{jsxref("Undefined")}}).

### Xác thực

Các tiêu chí sau phải được đáp ứng khi gọi **`beginOcclusionQuery()`**, nếu không {{domxref("GPUValidationError")}} sẽ được tạo ra và {{domxref("GPURenderPassEncoder")}} sẽ không hợp lệ:

- Một {{domxref("GPUQuerySet")}} đã được chỉ định trong thuộc tính descriptor `occlusionQuerySet` khi gọi {{domxref("GPUCommandEncoder.beginRenderPass()")}} nguồn gốc.
- `queryIndex` nhỏ hơn {{domxref("GPUQuerySet.count")}}.
- `queryIndex` chưa được ghi vào trong cùng lần thực thi kết xuất.
- Không có truy vấn occlusion nào đang hoạt động cho lần thực thi kết xuất này (tức là thông qua lệnh gọi `beginOcclusionQuery()` trước đó).

## Ví dụ

```js
// …

// Create a query set to hold the occlusion queries
const querySet = device.createQuerySet({
  type: "occlusion",
  count: 32,
});

// Render pass descriptor object, including the querySet
const renderPassDescriptor = {
  colorAttachments: [
    {
      clearValue: clearColor,
      loadOp: "clear",
      storeOp: "store",
      view: context.getCurrentTexture().createView(),
    },
  ],
  occlusionQuerySet: querySet,
};

// Begin the render pass
const passEncoder = commandEncoder.beginRenderPass(renderPassDescriptor);

// Begin an occlusion query at index 0
passEncoder.beginOcclusionQuery(0);

// Run some rendering commands
passEncoder.setPipeline(renderPipeline);
passEncoder.setVertexBuffer(0, vertexBuffer);
passEncoder.draw(3);

// End the occlusion query
passEncoder.endOcclusionQuery();

// …
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [WebGPU API](/en-US/docs/Web/API/WebGPU_API)
