---
title: WebTransportSendStream
slug: Web/API/WebTransportSendStream
page-type: web-api-interface
browser-compat: api.WebTransportSendStream
---

{{APIRef("WebTransport API")}}{{securecontext_header}} {{AvailableInWorkers}}

Giao diện `WebTransportSendStream` của {{domxref("WebTransport API", "WebTransport API", "", "nocode")}} là một {{domxref("WritableStream")}} chuyên biệt được sử dụng để gửi dữ liệu đầu ra trong các luồng {{domxref("WebTransport")}} một chiều hoặc hai chiều.

Luồng gửi là một [writable stream](/en-US/docs/Web/API/Streams_API/Using_writable_streams) của [`Uint8Array`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Uint8Array), có thể được ghi để gửi dữ liệu đến máy chủ. Ngoài ra, nó cung cấp các tính năng luồng như đặt thứ tự gửi và lấy thống kê luồng.

Các đối tượng thuộc kiểu này không được xây dựng trực tiếp. Khi tạo một luồng một chiều, {{domxref("WebTransport.createUnidirectionalStream()")}} trả về một đối tượng thuộc kiểu này để gửi dữ liệu. Khi tạo một luồng hai chiều bằng cách sử dụng {{domxref("WebTransport.createBidirectionalStream()")}}, phương thức trả về một {{domxref("WebTransportBidirectionalStream")}}, và đối tượng luồng gửi có thể được lấy từ thuộc tính {{domxref("WebTransportBidirectionalStream.writable", "writable")}} của nó. Khi một luồng hai chiều được khởi tạo bởi đầu xa, một đối tượng thuộc kiểu này cũng có thể được lấy tương tự bằng cách sử dụng {{domxref("WebTransport.incomingBidirectionalStreams")}}.

`WebTransportSendStream` là một [transferable object](/en-US/docs/Web/API/Web_Workers_API/Transferable_objects).

{{InheritanceDiagram}}

## Thuộc tính phiên bản

_Cũng kế thừa các thuộc tính từ giao diện cha {{domxref("WritableStream")}}._

- {{domxref("WebTransportSendStream.getStats()")}}
  - : Trả về một {{jsxref("Promise")}} phân giải thành các thống kê liên quan đến luồng này.

## Phương thức phiên bản

_Cũng kế thừa các phương thức từ giao diện cha {{domxref("WritableStream")}}._

<!-- WebTransportSendStream.sendGroup not implemented in any browser -->

- {{domxref("WebTransportSendStream.sendOrder")}}
  - : Chỉ ra độ ưu tiên gửi của luồng này so với các luồng khác mà giá trị đã được đặt.

## Ví dụ

Xem [`WebTransport.incomingUnidirectionalStreams`](/en-US/docs/Web/API/WebTransport/incomingUnidirectionalStreams) để biết ví dụ về cách lấy một {{domxref("ReadableStream")}} của các đối tượng `WebTransportSendStream`.

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Using WebTransport](https://developer.chrome.com/docs/capabilities/web-apis/webtransport)
- {{domxref("Streams API", "Streams API", "", "nocode")}}
- [WebTransport over HTTP/3](https://datatracker.ietf.org/doc/html/draft-ietf-webtrans-http3/)
