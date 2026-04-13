---
title: "WebTransportDatagramDuplexStream: readable property"
short-title: readable
slug: Web/API/WebTransportDatagramDuplexStream/readable
page-type: web-api-instance-property
browser-compat: api.WebTransportDatagramDuplexStream.readable
---

{{APIRef("WebTransport API")}}{{SecureContext_Header}} {{AvailableInWorkers}}

Thuộc tính chỉ đọc **`readable`** của giao diện {{domxref("WebTransportDatagramDuplexStream")}} trả về một đối tượng {{domxref("ReadableStream")}} có thể được sử dụng để đọc các datagram đến từ luồng theo cách không đáng tin cậy.

"Không đáng tin cậy" có nghĩa là việc truyền dữ liệu không được đảm bảo, và cũng không đảm bảo thứ tự đến. Điều này phù hợp trong một số tình huống và cung cấp khả năng truyền rất nhanh. Ví dụ, bạn có thể muốn truyền các bản cập nhật trạng thái trò chơi thường xuyên, nơi mỗi thông điệp thay thế thông điệp trước đó và thứ tự không quan trọng.

## Giá trị

Một {{domxref("ReadableStream")}}.

## Ví dụ

Xem trang giao diện chính {{domxref("WebTransportDatagramDuplexStream")}}.

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Using WebTransport](https://developer.chrome.com/docs/capabilities/web-apis/webtransport)
- {{domxref("WebSockets API", "WebSockets API", "", "nocode")}}
- {{domxref("Streams API", "Streams API", "", "nocode")}}
- [WebTransport over HTTP/3](https://datatracker.ietf.org/doc/html/draft-ietf-webtrans-http3/)
