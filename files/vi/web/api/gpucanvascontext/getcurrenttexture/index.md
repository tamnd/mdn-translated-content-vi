---
title: "GPUCanvasContext: getCurrentTexture() method"
short-title: getCurrentTexture()
slug: Web/API/GPUCanvasContext/getCurrentTexture
page-type: web-api-instance-method
browser-compat: api.GPUCanvasContext.getCurrentTexture
---

{{APIRef("WebGPU API")}}{{SecureContext_Header}}{{AvailableInWorkers}}

Phương thức **`getCurrentTexture()`** của giao diện {{domxref("GPUCanvasContext")}} trả về {{domxref("GPUTexture")}} tiếp theo sẽ được ghép vào tài liệu bởi ngữ cảnh canvas.

## Cú pháp

```js-nolint
getCurrentTexture()
```

### Tham số

Không có.

### Giá trị trả về

Phiên bản đối tượng {{domxref("GPUTexture")}}.

### Ngoại lệ

- `InvalidStateError` {{domxref("DOMException")}}
  - : Ném ra nếu `getCurrentTexture()` được gọi trên ngữ cảnh canvas trước khi nó được cấu hình (tức là trước khi {{domxref("GPUCanvasContext.configure()")}} được gọi).

## Ví dụ

```js
const canvas = document.querySelector("#gpuCanvas");
const context = canvas.getContext("webgpu");

context.configure({
  device,
  format: navigator.gpu.getPreferredCanvasFormat(),
  alphaMode: "premultiplied",
});

// …
// Later on
const commandEncoder = device.createCommandEncoder();

const renderPassDescriptor = {
  colorAttachments: [
    {
      clearValue: [0, 0, 0, 1], // Opaque black
      loadOp: "clear",
      storeOp: "store",
      view: context.getCurrentTexture().createView(),
    },
  ],
};

const passEncoder = commandEncoder.beginRenderPass(renderPassDescriptor);
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [WebGPU API](/en-US/docs/Web/API/WebGPU_API)
