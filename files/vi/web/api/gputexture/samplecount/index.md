---
title: "GPUTexture: sampleCount property"
short-title: sampleCount
slug: Web/API/GPUTexture/sampleCount
page-type: web-api-instance-property
browser-compat: api.GPUTexture.sampleCount
---

{{APIRef("WebGPU API")}}{{SecureContext_Header}}{{AvailableInWorkers}}

Thuộc tính chỉ đọc **`sampleCount`** của giao diện {{domxref("GPUTexture")}} đại diện cho số mẫu (sample count) của `GPUTexture`.

Giá trị này được đặt thông qua thuộc tính `sampleCount` trong đối tượng descriptor truyền vào lời gọi {{domxref("GPUDevice.createTexture()")}} ban đầu. Nếu bị bỏ qua, mặc định là 1.

## Giá trị

Một số. Các giá trị có thể là:

- 1
- 4, biểu thị kết cấu đa mẫu (multi-sampled texture).

## Ví dụ

```js
// …

const depthTexture = device.createTexture({
  size: [canvas.width, canvas.height],
  format: "depth24plus",
  usage: GPUTextureUsage.RENDER_ATTACHMENT,
});

console.log(depthTexture.sampleCount); // 1
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [WebGPU API](/en-US/docs/Web/API/WebGPU_API)
