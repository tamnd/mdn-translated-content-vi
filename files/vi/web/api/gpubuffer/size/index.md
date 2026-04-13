---
title: "GPUBuffer: size property"
short-title: size
slug: Web/API/GPUBuffer/size
page-type: web-api-instance-property
browser-compat: api.GPUBuffer.size
---

{{APIRef("WebGPU API")}}{{SecureContext_Header}}{{AvailableInWorkers}}

Thuộc tính chỉ đọc **`size`** của giao diện {{domxref("GPUBuffer")}} đại diện cho độ dài của phân bổ bộ nhớ của `GPUBuffer`, tính bằng byte.

`size` được đặt qua thuộc tính `size` trong đối tượng descriptor được truyền vào lệnh gọi {{domxref("GPUDevice.createBuffer()")}} gốc.

## Giá trị

Một số.

## Ví dụ

```js
// Define global buffer size
const BUFFER_SIZE = 1000;

// …

const output = device.createBuffer({
  size: BUFFER_SIZE,
  usage: GPUBufferUsage.STORAGE | GPUBufferUsage.COPY_SRC,
});

console.log(output.size); // 1000
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [WebGPU API](/en-US/docs/Web/API/WebGPU_API)
