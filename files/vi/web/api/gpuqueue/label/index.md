---
title: "GPUQueue: label property"
short-title: label
slug: Web/API/GPUQueue/label
page-type: web-api-instance-property
browser-compat: api.GPUQueue.label
---

{{APIRef("WebGPU API")}}{{SecureContext_Header}}{{AvailableInWorkers}}

Thuộc tính chỉ đọc **`label`** của giao diện {{domxref("GPUQueue")}} là một chuỗi cung cấp nhãn có thể dùng để nhận diện đối tượng, ví dụ trong thông báo {{domxref("GPUError")}} hoặc cảnh báo console.

Bạn có thể lấy và thiết lập trực tiếp trên đối tượng `GPUQueue`.

## Giá trị

Một chuỗi. Nếu chưa có giá trị nhãn nào được thiết lập, khi lấy nhãn sẽ trả về chuỗi rỗng.

## Ví dụ

Thiết lập và lấy nhãn thông qua `GPUQueue.label`:

```js
device.queue.label = "my_queue";
console.log(device.queue.label); // "my_queue"
```

Bạn cũng có thể thiết lập nhãn của hàng đợi khi yêu cầu thiết bị:

```js
const device = adapter.requestDevice({
  defaultQueue: { label: "my_queue" },
});
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [WebGPU API](/en-US/docs/Web/API/WebGPU_API)
