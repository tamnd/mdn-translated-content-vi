---
title: "ReadableStreamDefaultController: desiredSize property"
short-title: desiredSize
slug: Web/API/ReadableStreamDefaultController/desiredSize
page-type: web-api-instance-property
browser-compat: api.ReadableStreamDefaultController.desiredSize
---

{{APIRef("Streams")}}{{AvailableInWorkers}}

Thuộc tính chỉ đọc **`desiredSize`** của giao diện {{domxref("ReadableStreamDefaultController")}} trả về kích thước mong muốn cần thiết để lấp đầy hàng đợi nội bộ của luồng.

## Giá trị

Một số nguyên. Lưu ý rằng giá trị này có thể âm nếu hàng đợi đã đầy quá mức.

## Ví dụ

Ví dụ [Luồng có thể đọc với nguồn đẩy cơ bản và hỗ trợ backpressure](https://streams.spec.whatwg.org/#example-rs-push-backpressure) trong đặc tả cung cấp một ví dụ tốt về cách sử dụng `desiredSize` để phát hiện thủ công khi luồng đầy và áp dụng backpressure, cũng như sử dụng {{domxref("ReadableStreamDefaultController.error()")}} để kích hoạt thủ công lỗi luồng nếu một phần khác của hệ thống mà nó phụ thuộc gặp sự cố.

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Sử dụng các luồng có thể đọc](/en-US/docs/Web/API/Streams_API/Using_readable_streams)
- {{domxref("ReadableStreamDefaultController")}}
