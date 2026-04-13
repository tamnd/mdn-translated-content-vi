---
title: "GPUCommandBuffer: label property"
short-title: label
slug: Web/API/GPUCommandBuffer/label
page-type: web-api-instance-property
browser-compat: api.GPUCommandBuffer.label
---

{{APIRef("WebGPU API")}}{{SecureContext_Header}}{{AvailableInWorkers}}

Thuộc tính chỉ đọc **`label`** của giao diện {{domxref("GPUCommandBuffer")}} là một chuỗi cung cấp nhãn có thể được sử dụng để nhận dạng đối tượng, ví dụ trong thông báo {{domxref("GPUError")}} hoặc cảnh báo bảng điều khiển.

Thuộc tính này có thể được đặt bằng cách cung cấp thuộc tính `label` trong đối tượng descriptor truyền vào lệnh gọi {{domxref("GPUCommandEncoder.finish()")}} nguồn gốc, hoặc bạn có thể lấy và đặt trực tiếp trên đối tượng `GPUCommandBuffer`.

## Giá trị

Một chuỗi. Nếu chưa có giá trị nhãn nào được đặt trước đó, việc lấy nhãn sẽ trả về một chuỗi rỗng.

## Ví dụ

Đặt và lấy nhãn thông qua `GPUCommandBuffer.label`:

```js
const commandBuffer = commandEncoder.finish();
commandBuffer.label = "my_command_buffer";
console.log(commandBuffer.label); // "my_command_buffer"
```

Đặt nhãn thông qua lệnh gọi {{domxref("GPUCommandEncoder.finish()")}} nguồn gốc, sau đó lấy qua `GPUCommandBuffer.label`:

```js
const commandBuffer = commandEncoder.finish({
  label: "my_command_buffer",
});

console.log(commandBuffer.label); // "my_command_buffer"
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [WebGPU API](/en-US/docs/Web/API/WebGPU_API)
