---
title: "GPUBuffer: label property"
short-title: label
slug: Web/API/GPUBuffer/label
page-type: web-api-instance-property
browser-compat: api.GPUBuffer.label
---

{{APIRef("WebGPU API")}}{{SecureContext_Header}}{{AvailableInWorkers}}

Thuộc tính **`label`** của giao diện {{domxref("GPUBuffer")}} cung cấp nhãn có thể được sử dụng để xác định đối tượng, ví dụ trong các thông báo {{domxref("GPUError")}} hoặc cảnh báo console.

Điều này có thể được đặt bằng cách cung cấp thuộc tính `label` trong đối tượng descriptor được truyền vào lệnh gọi {{domxref("GPUDevice.createBuffer()")}} gốc, hoặc bạn có thể lấy và đặt trực tiếp trên đối tượng `GPUBuffer`.

## Giá trị

Một chuỗi. Nếu chưa được đặt như mô tả ở trên, nó sẽ là chuỗi rỗng.

## Ví dụ

Đặt và lấy nhãn qua `GPUBuffer.label`:

```js
const output = device.createBuffer({
  size: BUFFER_SIZE,
  usage: GPUBufferUsage.STORAGE | GPUBufferUsage.COPY_SRC,
});

output.label = "my_buffer";

console.log(output.label); // "my_buffer"
```

Đặt nhãn qua lệnh gọi {{domxref("GPUDevice.createBuffer()")}} gốc, sau đó lấy qua `GPUBuffer.label`:

```js
const output = device.createBuffer({
  size: BUFFER_SIZE,
  usage: GPUBufferUsage.STORAGE | GPUBufferUsage.COPY_SRC,
  label: "my_buffer",
});

console.log(output.label); // "my_buffer"
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [WebGPU API](/en-US/docs/Web/API/WebGPU_API)
