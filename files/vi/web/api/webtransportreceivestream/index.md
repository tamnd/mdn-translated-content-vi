---
title: WebTransportReceiveStream
slug: Web/API/WebTransportReceiveStream
page-type: web-api-interface
browser-compat: api.WebTransportReceiveStream
---

{{APIRef("WebTransport API")}}{{securecontext_header}} {{AvailableInWorkers}}

Giao diện `WebTransportReceiveStream` của {{domxref("WebTransport API", "WebTransport API", "", "nocode")}} là một {{domxref("ReadableStream")}} có thể được dùng để đọc từ một luồng {{domxref("WebTransport")}} một chiều hoặc hai chiều đến.

Luồng này là một [readable byte stream](/en-US/docs/Web/API/Streams_API/Using_readable_byte_streams) gồm các [`Uint8Array`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Uint8Array), và có thể được sử dụng bằng BYOB reader ([`ReadableStreamBYOBReader`](/en-US/docs/Web/API/ReadableStreamBYOBReader)) hoặc default reader ([`ReadableStreamDefaultReader`](/en-US/docs/Web/API/ReadableStreamDefaultReader)).

Các đối tượng thuộc kiểu này không được khởi tạo trực tiếp. Thay vào đó, chúng được lấy qua thuộc tính [`WebTransport.incomingUnidirectionalStream`](/en-US/docs/Web/API/WebTransport/incomingUnidirectionalStreams).

`WebTransportReceiveStream` là một [transferable object](/en-US/docs/Web/API/Web_Workers_API/Transferable_objects).

{{InheritanceDiagram}}

## Thuộc tính phiên bản

_Kế thừa thuộc tính từ giao diện cha, {{domxref("ReadableStream")}}._

## Phương thức phiên bản

_Cũng kế thừa thuộc tính từ giao diện cha, {{domxref("ReadableStream")}}._

- {{domxref("WebTransportReceiveStream.getStats()")}}
  - : Trả về một {{jsxref("Promise")}} phân giải với các số liệu thống kê liên quan đến luồng này.

## Ví dụ

Xem [`WebTransport.incomingUnidirectionalStreams`](/en-US/docs/Web/API/WebTransport/incomingUnidirectionalStreams) để xem ví dụ về cách lấy một {{domxref("ReadableStream")}} gồm các đối tượng `WebTransportReceiveStream`.

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Using WebTransport](https://developer.chrome.com/docs/capabilities/web-apis/webtransport)
- {{domxref("Streams API", "Streams API", "", "nocode")}}
- [WebTransport over HTTP/3](https://datatracker.ietf.org/doc/html/draft-ietf-webtrans-http3/)
