---
title: "GPUCanvasContext: getConfiguration() method"
short-title: getConfiguration()
slug: Web/API/GPUCanvasContext/getConfiguration
page-type: web-api-instance-method
browser-compat: api.GPUCanvasContext.getConfiguration
---

{{APIRef("WebGPU API")}}{{SecureContext_Header}}{{AvailableInWorkers}}

Phương thức **`getConfiguration()`** của giao diện {{domxref("GPUCanvasContext")}} trả về cấu hình hiện tại được đặt cho ngữ cảnh.

## Cú pháp

```js-nolint
getConfiguration()
```

### Tham số

Không có.

### Giá trị trả về

Đối tượng chứa các tùy chọn cấu hình được đặt trên ngữ cảnh (tức là qua phương thức {{domxref("GPUCanvasContext.configure()")}}), hoặc `null` nếu không có cấu hình nào được đặt (hoặc không có cấu hình nào đã được đặt trước đó, hoặc cấu hình đã được đặt rồi {{domxref("GPUCanvasContext.unconfigure()")}} đã được gọi trên ngữ cảnh).

## Ví dụ

```js
const canvas = document.querySelector("canvas");
const context = canvas.getContext("webgpu");

if (!navigator.gpu) {
  throw Error("WebGPU not supported.");
}

const adapter = await navigator.gpu.requestAdapter();
if (!adapter) {
  throw Error("Couldn't request WebGPU adapter.");
}

const device = await adapter.requestDevice();

context.configure({
  device,
  format: navigator.gpu.getPreferredCanvasFormat(),
  alphaMode: "premultiplied",
});

console.log(context.getConfiguration());
/* Logs something like:

{
  "alphaMode": "premultiplied",
  "colorSpace": "srgb",
  "device": { ... },
  "format": "bgra8unorm",
  "toneMapping": {
      "mode": "standard"
  },
  "usage": 16,
  "viewFormats": []
}
*/
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("GPUCanvasContext.configure()")}}
- [WebGPU API](/en-US/docs/Web/API/WebGPU_API)
