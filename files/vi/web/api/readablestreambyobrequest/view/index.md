---
title: "ReadableStreamBYOBRequest: view property"
short-title: view
slug: Web/API/ReadableStreamBYOBRequest/view
page-type: web-api-instance-property
browser-compat: api.ReadableStreamBYOBRequest.view
---

{{APIRef("Streams")}}{{AvailableInWorkers}}

Thuộc tính getter **`view`** của giao diện {{domxref("ReadableStreamBYOBRequest")}} trả về view hiện tại.

## Giá trị

Một [mảng đã phân loại](/en-US/docs/Web/JavaScript/Guide/Typed_arrays) đại diện cho vùng đích mà controller có thể ghi dữ liệu tạo ra.

`null` nếu yêu cầu đã được phản hồi, bằng cách gọi {{domxref("ReadableStreamBYOBRequest.respond()")}} hoặc {{domxref("ReadableStreamBYOBRequest.respondWithNewView()")}}.

## Ví dụ

Xem các ví dụ trong {{domxref("ReadableStreamBYOBRequest")}}.

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Sử dụng readable byte stream](/en-US/docs/Web/API/Streams_API/Using_readable_byte_streams)
