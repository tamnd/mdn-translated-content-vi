---
title: "GPUTexture: format property"
short-title: format
slug: Web/API/GPUTexture/format
page-type: web-api-instance-property
browser-compat: api.GPUTexture.format
---

{{APIRef("WebGPU API")}}{{SecureContext_Header}}{{AvailableInWorkers}}

Thuộc tính chỉ đọc **`format`** của giao diện {{domxref("GPUTexture")}} đại diện cho định dạng của `GPUTexture`.

Giá trị này được đặt thông qua thuộc tính `format` trong đối tượng descriptor truyền vào lời gọi {{domxref("GPUDevice.createTexture()")}} ban đầu.

## Giá trị

Một giá trị liệt kê. Xem phần [Texture formats](https://gpuweb.github.io/gpuweb/#enumdef-gputextureformat) của thông số kỹ thuật để biết tất cả các giá trị có thể. Xem thêm [Tier 1 and Tier 2 texture formats](/en-US/docs/Web/API/GPUDevice/createTexture#tier_1_and_tier_2_texture_formats).

## Ví dụ

```js
// …

const depthTexture = device.createTexture({
  size: [canvas.width, canvas.height],
  format: "depth24plus",
  usage: GPUTextureUsage.RENDER_ATTACHMENT,
});

console.log(depthTexture.format); // "depth24plus"
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [WebGPU API](/en-US/docs/Web/API/WebGPU_API)
