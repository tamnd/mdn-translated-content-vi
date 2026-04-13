---
title: "GPURenderPassEncoder: phương thức endOcclusionQuery()"
short-title: endOcclusionQuery()
slug: Web/API/GPURenderPassEncoder/endOcclusionQuery
page-type: web-api-instance-method
browser-compat: api.GPURenderPassEncoder.endOcclusionQuery
---

{{APIRef("WebGPU API")}}{{SecureContext_Header}}{{AvailableInWorkers}}

Phương thức **`endOcclusionQuery()`** của giao diện {{domxref("GPURenderPassEncoder")}} kết thúc một truy vấn occlusion đang hoạt động đã được bắt đầu trước đó bằng {{domxref("GPURenderPassEncoder.beginOcclusionQuery", "beginOcclusionQuery()")}}.

## Cú pháp

```js-nolint
endOcclusionQuery()
```

### Tham số

Không có.

### Giá trị trả về

Không có ({{jsxref("Undefined")}}).

### Xác thực

Các tiêu chí sau phải được đáp ứng khi gọi **`endOcclusionQuery()`**, nếu không {{domxref("GPUValidationError")}} sẽ được tạo ra và {{domxref("GPURenderPassEncoder")}} sẽ không hợp lệ:

- Có một truy vấn occlusion đang hoạt động cho lần thực thi kết xuất này (tức là thông qua lệnh gọi `beginOcclusionQuery()` trước đó).

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
