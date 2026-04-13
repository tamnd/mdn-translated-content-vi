---
title: "GPUTexture: label property"
short-title: label
slug: Web/API/GPUTexture/label
page-type: web-api-instance-property
browser-compat: api.GPUTexture.label
---

{{APIRef("WebGPU API")}}{{SecureContext_Header}}{{AvailableInWorkers}}

Thuộc tính **`label`** của giao diện {{domxref("GPUTexture")}} cung cấp một nhãn có thể dùng để nhận diện đối tượng, ví dụ trong thông báo {{domxref("GPUError")}} hoặc cảnh báo console.

Có thể đặt giá trị này bằng cách cung cấp thuộc tính `label` trong đối tượng descriptor truyền vào lời gọi {{domxref("GPUDevice.createTexture()")}} ban đầu, hoặc bạn có thể lấy và đặt trực tiếp trên đối tượng `GPUTexture`.

## Giá trị

Một chuỗi. Nếu chưa được đặt như mô tả ở trên, giá trị sẽ là chuỗi rỗng.

## Ví dụ

Đặt và lấy nhãn qua `GPUTexture.label`:

```js
// …

const depthTexture = device.createTexture({
  size: [canvas.width, canvas.height],
  format: "depth24plus",
  usage: GPUTextureUsage.RENDER_ATTACHMENT,
});

depthTexture.label = "my_texture";

console.log(depthTexture.label); // "my_texture"
```

Đặt nhãn qua lời gọi {{domxref("GPUDevice.createTexture()")}} ban đầu, rồi lấy qua `GPUTexture.label`:

```js
// …

const depthTexture = device.createTexture({
  size: [canvas.width, canvas.height],
  format: "depth24plus",
  usage: GPUTextureUsage.RENDER_ATTACHMENT,
  label: "my_texture",
});

console.log(depthTexture.label); // "my_texture"
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [WebGPU API](/en-US/docs/Web/API/WebGPU_API)
