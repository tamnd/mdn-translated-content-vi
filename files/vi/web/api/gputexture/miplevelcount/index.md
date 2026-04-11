---
title: "GPUTexture: mipLevelCount property"
short-title: mipLevelCount
slug: Web/API/GPUTexture/mipLevelCount
page-type: web-api-instance-property
browser-compat: api.GPUTexture.mipLevelCount
---

{{APIRef("WebGPU API")}}{{SecureContext_Header}}{{AvailableInWorkers}}

Thuộc tính chỉ đọc **`mipLevelCount`** của giao diện {{domxref("GPUTexture")}} đại diện cho số lượng mip level của `GPUTexture`.

Giá trị này được đặt thông qua thuộc tính `mipLevelCount` trong đối tượng descriptor truyền vào lời gọi {{domxref("GPUDevice.createTexture()")}} ban đầu. Nếu bị bỏ qua, mặc định là 1.

## Giá trị

Một số.

## Ví dụ

```js
// …

const depthTexture = device.createTexture({
  size: [canvas.width, canvas.height],
  format: "depth24plus",
  usage: GPUTextureUsage.RENDER_ATTACHMENT,
});

console.log(depthTexture.mipLevelCount); // 1
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [WebGPU API](/en-US/docs/Web/API/WebGPU_API)
