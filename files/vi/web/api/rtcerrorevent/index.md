---
title: RTCErrorEvent
slug: Web/API/RTCErrorEvent
page-type: web-api-interface
browser-compat: api.RTCErrorEvent
---

{{APIRef("WebRTC")}}

Giao diện **`RTCErrorEvent`** của WebRTC API đại diện cho một lỗi được gửi đến một đối tượng WebRTC. Nó dựa trên giao diện {{domxref("Event")}} chuẩn, nhưng thêm thông tin đặc thù RTC mô tả lỗi, như được hiển thị bên dưới.

{{InheritanceDiagram}}

## Hàm khởi tạo

- {{domxref("RTCErrorEvent.RTCErrorEvent", "RTCErrorEvent()")}}
  - : Tạo và trả về một đối tượng `RTCErrorEvent` mới.

## Thuộc tính phiên bản

_Ngoài các thuộc tính chuẩn có sẵn trên giao diện {{domxref("Event")}}, `RTCErrorEvent` cũng bao gồm các thuộc tính sau:_

- {{domxref("RTCErrorEvent.error", "error")}} {{ReadOnlyInline}}
  - : Một đối tượng {{domxref("RTCError")}} xác định lỗi đã xảy ra; đối tượng này bao gồm loại lỗi đã xảy ra, thông tin về nơi xảy ra lỗi (chẳng hạn như số dòng nào trong {{Glossary("SDP")}} hoặc mã nguyên nhân {{Glossary("SCTP")}} nào đang là vấn đề).

## Phương thức phiên bản

_Không có phương thức bổ sung nào được cung cấp ngoài những phương thức tìm thấy trên giao diện cha, {{domxref("Event")}}._

## Mô tả

Có các loại dữ liệu khác được dùng cho các sự kiện lỗi trong WebRTC, khi cần cho các lỗi có yêu cầu chia sẻ thông tin đặc biệt. Phổ biến nhất trong số này có lẽ là {{domxref("RTCPeerConnectionIceErrorEvent")}}, được dùng bởi sự kiện {{domxref("RTCPeerConnection.icecandidateerror_event", "icecandidateerror")}}, báo hiệu lỗi đã xảy ra trong khi thu thập ICE candidate trong quá trình thương lượng kết nối.

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- WebRTC API
- {{domxref("RTCError")}}
- Sự kiện `error` xảy ra trên các giao diện sau: {{domxref("RTCDataChannel")}} và {{domxref("RTCDtlsTransport")}}
- {{domxref("RTCPeerConnectionIceErrorEvent")}}
