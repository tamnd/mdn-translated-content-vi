---
title: "TransformStreamDefaultController: desiredSize property"
short-title: desiredSize
slug: Web/API/TransformStreamDefaultController/desiredSize
page-type: web-api-instance-property
browser-compat: api.TransformStreamDefaultController.desiredSize
---

{{APIRef("Streams")}}{{AvailableInWorkers}}

Thuộc tính chỉ đọc **`desiredSize`** của giao diện {{domxref("TransformStreamDefaultController")}} trả về kích thước mong muốn để lấp đầy hàng đợi của {{domxref("ReadableStream")}} liên quan.

Hàng đợi nội bộ của `ReadableStream` chứa các chunk đã được xếp hàng nhưng chưa được đọc. Trình duyệt xác định **kích thước mong muốn** để lấp đầy luồng, và đây là giá trị được trả về bởi thuộc tính `desiredSize`.

Nếu `desiredSize` là `0`, hàng đợi đã đầy. Do đó bạn có thể sử dụng thông tin này để [áp dụng backpressure thủ công](/en-US/docs/Web/API/Streams_API/Concepts#backpressure) để quản lý hàng đợi.

## Giá trị

Kích thước mong muốn.

## Ví dụ

Trong ví dụ tiếp theo, `desiredSize` được ghi vào console.

```js
console.log(controller.desiredSize);
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
