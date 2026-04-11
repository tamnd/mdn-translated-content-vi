---
title: "GPURenderPassEncoder: phương thức setStencilReference()"
short-title: setStencilReference()
slug: Web/API/GPURenderPassEncoder/setStencilReference
page-type: web-api-instance-method
browser-compat: api.GPURenderPassEncoder.setStencilReference
---

{{APIRef("WebGPU API")}}{{SecureContext_Header}}{{AvailableInWorkers}}

Phương thức **`setStencilReference()`** của giao diện {{domxref("GPURenderPassEncoder")}} đặt giá trị tham chiếu stencil được sử dụng trong các bài kiểm tra stencil với thao tác stencil `"replace"` (như được đặt trong descriptor của phương thức {{domxref("GPUDevice.createRenderPipeline()")}}, trong các thuộc tính định nghĩa các thao tác stencil khác nhau).

## Cú pháp

```js-nolint
setStencilReference(reference)
```

### Tham số

- `reference`
  - : Một số biểu diễn giá trị tham chiếu stencil mới để đặt cho lần thực thi kết xuất.

> [!NOTE]
> Nếu không có lệnh gọi `setStencilReference()` nào được thực hiện, giá trị tham chiếu stencil mặc định là 0 cho mỗi lần thực thi kết xuất.

### Giá trị trả về

Không có ({{jsxref("Undefined")}}).

## Ví dụ

```js
// …

const passEncoder = commandEncoder.beginRenderPass(renderPassDescriptor);

passEncoder.setPipeline(renderPipeline);
passEncoder.setVertexBuffer(0, vertexBuffer);
passEncoder.setStencilReference(1);
passEncoder.draw(3);

passEncoder.end();

// …
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [WebGPU API](/en-US/docs/Web/API/WebGPU_API)
