---
title: "GPUTexture: width property"
short-title: width
slug: Web/API/GPUTexture/width
page-type: web-api-instance-property
browser-compat: api.GPUTexture.width
---

{{APIRef("WebGPU API")}}{{SecureContext_Header}}{{AvailableInWorkers}}

Thuộc tính chỉ đọc **`width`** của giao diện {{domxref("GPUTexture")}} đại diện cho chiều rộng của `GPUTexture`.

Giá trị này được đặt dựa trên giá trị của thuộc tính `size` trong đối tượng descriptor truyền vào lời gọi {{domxref("GPUDevice.createTexture()")}} ban đầu.

## Giá trị

Một số.

## Ví dụ

```js
// …

const depthTexture = device.createTexture({
  size: [640, 480],
  format: "depth24plus",
  usage: GPUTextureUsage.RENDER_ATTACHMENT,
});

console.log(depthTexture.width); // 640
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [WebGPU API](/en-US/docs/Web/API/WebGPU_API)
