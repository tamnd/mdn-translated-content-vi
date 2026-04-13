---
title: "GPUCanvasContext: unconfigure() method"
short-title: unconfigure()
slug: Web/API/GPUCanvasContext/unconfigure
page-type: web-api-instance-method
browser-compat: api.GPUCanvasContext.unconfigure
---

{{APIRef("WebGPU API")}}{{SecureContext_Header}}{{AvailableInWorkers}}

Phương thức **`unconfigure()`** của giao diện {{domxref("GPUCanvasContext")}} xóa bất kỳ cấu hình ngữ cảnh nào đã được đặt trước đó, và hủy bất kỳ texture nào được trả về qua {{domxref("GPUCanvasContext.getCurrentTexture", "getCurrentTexture()")}} khi ngữ cảnh canvas đã được cấu hình.

## Cú pháp

```js-nolint
unconfigure()
```

### Tham số

Không có.

### Giá trị trả về

None (`undefined`).

## Ví dụ

```js
const canvas = document.querySelector("#gpuCanvas");
const context = canvas.getContext("webgpu");

context.configure({
  device,
  format: navigator.gpu.getPreferredCanvasFormat(),
  alphaMode: "premultiplied",
});

// Later on
context.unconfigure();
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [WebGPU API](/en-US/docs/Web/API/WebGPU_API)
