---
title: "GPUComputePassEncoder: label property"
short-title: label
slug: Web/API/GPUComputePassEncoder/label
page-type: web-api-instance-property
browser-compat: api.GPUComputePassEncoder.label
---

{{APIRef("WebGPU API")}}{{SecureContext_Header}}{{AvailableInWorkers}}

Thuộc tính chỉ đọc **`label`** của giao diện {{domxref("GPUComputePassEncoder")}} là một chuỗi cung cấp nhãn có thể dùng để nhận dạng đối tượng, ví dụ trong thông báo {{domxref("GPUError")}} hoặc cảnh báo console.

Có thể đặt nhãn bằng cách cung cấp thuộc tính `label` trong đối tượng descriptor truyền vào lời gọi {{domxref("GPUCommandEncoder.beginComputePass()")}} ban đầu, hoặc có thể lấy và đặt trực tiếp trên đối tượng `GPUComputePassEncoder`.

## Giá trị

Một chuỗi. Nếu chưa có giá trị nhãn nào được đặt trước đó, khi lấy nhãn sẽ trả về chuỗi rỗng.

## Ví dụ

Đặt và lấy nhãn thông qua `GPUComputePassEncoder.label`:

```js
const commandEncoder = device.createCommandEncoder();
const passEncoder = commandEncoder.beginComputePass();

passEncoder.label = "my_compute_pass_encoder";
console.log(passEncoder.label); // "my_compute_pass_encoder"
```

Đặt nhãn thông qua lời gọi {{domxref("GPUCommandEncoder.beginComputePass()")}} ban đầu, rồi lấy thông qua `GPUComputePassEncoder.label`:

```js
const commandEncoder = device.createCommandEncoder();
const passEncoder = commandEncoder.beginComputePass({
  label: "my_compute_pass_encoder",
});

console.log(passEncoder.label); // "my_compute_pass_encoder"
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [WebGPU API](/en-US/docs/Web/API/WebGPU_API)
