---
title: RTCSctpTransport
slug: Web/API/RTCSctpTransport
page-type: web-api-interface
browser-compat: api.RTCSctpTransport
---

{{APIRef("WebRTC")}}

Giao diện **`RTCSctpTransport`** cung cấp thông tin mô tả một giao thức truyền tải Stream Control Transmission Protocol (**{{Glossary("SCTP")}}**). Giao diện này cung cấp thông tin về các giới hạn của giao thức truyền tải, nhưng cũng cung cấp cách truy cập giao thức truyền tải Datagram Transport Layer Security (**{{Glossary("DTLS")}}**) bên dưới qua đó các gói SCTP cho tất cả các kênh dữ liệu của một {{DOMxRef("RTCPeerConnection")}} được gửi và nhận.

Bạn không tự tạo các đối tượng `RTCSctpTransport`; thay vào đó, bạn có quyền truy cập `RTCSctpTransport` cho một `RTCPeerConnection` nhất định thông qua thuộc tính **{{DOMxRef("RTCPeerConnection.sctp", "sctp")}}** của nó.

Có thể thuộc tính hữu ích nhất trên giao diện này là thuộc tính [`maxMessageSize`](/en-US/docs/Web/API/RTCSctpTransport/maxMessageSize), bạn có thể sử dụng để xác định giới hạn trên về kích thước tin nhắn bạn có thể gửi qua kênh dữ liệu trên kết nối peer.

{{InheritanceDiagram}}

## Thuộc tính phiên bản

_Cũng kế thừa các thuộc tính từ: {{DOMxRef("EventTarget")}}_.

- {{DOMxRef("RTCSctpTransport.maxChannels")}} {{ReadOnlyInline}}
  - : Một giá trị số nguyên cho biết số lượng tối đa các đối tượng [`RTCDataChannel`](/en-US/docs/Web/API/RTCDataChannel) có thể mở đồng thời.
- {{DOMxRef("RTCSctpTransport.maxMessageSize")}} {{ReadOnlyInline}}
  - : Một giá trị số nguyên cho biết kích thước tối đa, tính bằng byte, của một tin nhắn có thể được gửi bằng phương thức {{DOMxRef("RTCDataChannel.send()")}}.
- {{DOMxRef("RTCSctpTransport.state")}} {{ReadOnlyInline}}
  - : Một giá trị chuỗi liệt kê cho biết trạng thái của giao thức truyền tải SCTP.
- {{DOMxRef("RTCSctpTransport.transport")}} {{ReadOnlyInline}}
  - : Một đối tượng {{DOMxRef("RTCDtlsTransport")}} đại diện cho giao thức truyền tải {{Glossary("DTLS")}} được sử dụng để truyền và nhận các gói dữ liệu.

## Sự kiện

Lắng nghe các sự kiện này bằng {{domxref("EventTarget.addEventListener", "addEventListener()")}} hoặc bằng cách gán trình lắng nghe sự kiện vào thuộc tính `oneventname` của giao diện này.

- {{domxref("RTCSctpTransport.statechange_event", "statechange")}}
  - : Được gửi khi {{DOMxRef("RTCSctpTransport.state")}} thay đổi.

## Phương thức phiên bản

_Giao diện này không có phương thức, nhưng kế thừa các phương thức từ: {{DOMxRef("EventTarget")}}._

## Ví dụ

TBD

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [WebRTC](/en-US/docs/Web/API/WebRTC_API)
- {{DOMxRef("RTCPeerConnection")}}
- {{DOMxRef("RTCPeerConnection.sctp")}}
