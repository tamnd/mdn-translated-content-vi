---
title: "GPUTexture: depthOrArrayLayers property"
short-title: depthOrArrayLayers
slug: Web/API/GPUTexture/depthOrArrayLayers
page-type: web-api-instance-property
browser-compat: api.GPUTexture.depthOrArrayLayers
---

{{APIRef("WebGPU API")}}{{SecureContext_Header}}{{AvailableInWorkers}}

Thuộc tính chỉ đọc **`depthOrArrayLayers`** của giao diện {{domxref("GPUTexture")}} đại diện cho chiều sâu hoặc số lớp của `GPUTexture`.

Giá trị này được đặt dựa trên thuộc tính `size` trong đối tượng descriptor truyền vào lời gọi {{domxref("GPUDevice.createTexture()")}} ban đầu.

## Giá trị

Một số. Giá trị này đại diện cho:

- Chiều sâu tính bằng pixel, trong trường hợp kết cấu có {{domxref("GPUTexture.dimension")}} là `"3d"`.
- Số lớp, trong trường hợp kết cấu phân lớp có {{domxref("GPUTexture.dimension")}} là `"2d"`.

Trong các trường hợp `GPUTexture` không có chiều sâu hoặc lớp, giá trị là 1.

## Ví dụ

```js
// …

const test = device.createTexture({
  size: [128],
  format: "r8uint",
  dimension: "1d",
  usage: GPUTextureUsage.COPY_SRC,
});

console.log(test.depthOrArrayLayers); // 1
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [WebGPU API](/en-US/docs/Web/API/WebGPU_API)
