---
title: "GPUBuffer: mapState property"
short-title: mapState
slug: Web/API/GPUBuffer/mapState
page-type: web-api-instance-property
browser-compat: api.GPUBuffer.mapState
---

{{APIRef("WebGPU API")}}{{SecureContext_Header}}{{AvailableInWorkers}}

Thuộc tính chỉ đọc **`mapState`** của giao diện {{domxref("GPUBuffer")}} đại diện cho trạng thái được ánh xạ của `GPUBuffer`.

## Giá trị

Giá trị được liệt kê. Các giá trị có thể là:

- `unmapped`
  - : Buffer không được ánh xạ. {{domxref("GPUBuffer.getMappedRange()")}} không thể được sử dụng để truy cập nội dung của `GPUBuffer` trong JavaScript. Điều này có thể vì:
    - {{domxref("GPUBuffer.mapAsync()")}} chưa được gọi.
    - `GPUBuffer` trước đây đã được ánh xạ, sau đó được hủy ánh xạ bằng {{domxref("GPUBuffer.unmap()")}}.
- `pending`
  - : Buffer chưa được ánh xạ. {{domxref("GPUBuffer.mapAsync()")}} đã được gọi, nhưng {{jsxref("Promise")}} của nó hiện đang chờ xử lý. {{domxref("GPUBuffer.getMappedRange()")}} hiện không thể được sử dụng để truy cập nội dung của `GPUBuffer` trong JavaScript.
- `mapped`
  - : Buffer đã được ánh xạ. {{jsxref("Promise")}} của {{domxref("GPUBuffer.mapAsync()")}} đã được thực hiện và {{domxref("GPUBuffer.getMappedRange()")}} hiện có thể được sử dụng để truy cập nội dung của `GPUBuffer` trong JavaScript.

## Ví dụ

```js
const stagingBuffer = device.createBuffer({
  size: BUFFER_SIZE,
  usage: GPUBufferUsage.MAP_READ | GPUBufferUsage.COPY_DST,
});

console.log(stagingBuffer.mapState); // "unmapped"

// …

await stagingBuffer.mapAsync(
  GPUMapMode.READ,
  0, // Offset
  BUFFER_SIZE, // Length
);

console.log(stagingBuffer.mapState); // "mapped"
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [WebGPU API](/en-US/docs/Web/API/WebGPU_API)
