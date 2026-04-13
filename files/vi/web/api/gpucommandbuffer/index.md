---
title: GPUCommandBuffer
slug: Web/API/GPUCommandBuffer
page-type: web-api-interface
browser-compat: api.GPUCommandBuffer
---

{{APIRef("WebGPU API")}}{{SecureContext_Header}}{{AvailableInWorkers}}

Giao diện **`GPUCommandBuffer`** của {{domxref("WebGPU API", "WebGPU API", "", "nocode")}} đại diện cho một danh sách các lệnh GPU được ghi trước có thể được gửi đến {{domxref("GPUQueue")}} để thực thi.

`GPUCommandBuffer` được tạo thông qua phương thức {{domxref("GPUCommandEncoder.finish()")}}; các lệnh GPU được ghi trong đó được gửi để thực thi bằng cách truyền `GPUCommandBuffer` vào tham số của lệnh gọi {{domxref("GPUQueue.submit()")}}.

> [!NOTE]
> Một khi đối tượng `GPUCommandBuffer` đã được gửi, nó không thể được sử dụng lại.

{{InheritanceDiagram}}

## Thuộc tính phiên bản

- {{domxref("GPUCommandBuffer.label", "label")}}
  - : Một chuỗi cung cấp nhãn có thể được sử dụng để nhận dạng đối tượng, ví dụ trong thông báo {{domxref("GPUError")}} hoặc cảnh báo bảng điều khiển.

## Ví dụ

```js
// …

const commandBuffer = commandEncoder.finish();
device.queue.submit([commandBuffer]);
```

> [!NOTE]
> Nghiên cứu [WebGPU samples](https://webgpu.github.io/webgpu-samples/) để tìm ví dụ đầy đủ.

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [WebGPU API](/en-US/docs/Web/API/WebGPU_API)
