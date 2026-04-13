---
title: RTCPeerConnectionIceErrorEvent
slug: Web/API/RTCPeerConnectionIceErrorEvent
page-type: web-api-interface
browser-compat: api.RTCPeerConnectionIceErrorEvent
---

{{APIRef("WebRTC")}}

Giao diện **`RTCPeerConnectionIceErrorEvent`** dựa trên giao diện {{domxref("Event")}}, cung cấp các chi tiết liên quan đến lỗi {{Glossary("ICE")}} được thông báo bằng cách gửi một sự kiện {{domxref("RTCPeerConnection.icecandidateerror_event", "icecandidateerror")}} đến đối tượng {{domxref("RTCPeerConnection")}}.

{{InheritanceDiagram}}

## Hàm khởi tạo

- {{domxref("RTCPeerConnectionIceErrorEvent.RTCPeerConnectionIceErrorEvent", "RTCPeerConnectionIceErrorEvent()")}}
  - : Tạo và trả về một đối tượng `RTCPeerConnectionIceErrorEvent` mới, với `type` và các thuộc tính khác được khởi tạo như được chỉ định trong các tham số. Thông thường bạn sẽ không tự tạo một đối tượng loại này.

## Thuộc tính phiên bản

_Giao diện `RTCPeerConnectionIceErrorEvent` bao gồm các thuộc tính tìm thấy trên giao diện {{domxref("Event")}}, cũng như các thuộc tính sau:_

- {{domxref("RTCPeerConnectionIceErrorEvent.address", "address")}} {{ReadOnlyInline}}
  - : Một chuỗi cung cấp địa chỉ IP cục bộ được dùng để giao tiếp với máy chủ {{Glossary("STUN")}} hoặc {{Glossary("TURN")}} đang được dùng để thương lượng kết nối, hoặc `null` nếu địa chỉ IP cục bộ chưa được tiết lộ như một phần của ICE candidate cục bộ.
- {{domxref("RTCPeerConnectionIceErrorEvent.errorCode", "errorCode")}} {{ReadOnlyInline}}
  - : Một giá trị số nguyên không dấu nêu [mã lỗi STUN](https://www.iana.org/assignments/stun-parameters/stun-parameters.xhtml#stun-parameters-6) số trả về bởi máy chủ STUN hoặc TURN. Nếu không có host candidate nào có thể tiếp cận máy chủ, thuộc tính này được đặt thành số 701, nằm ngoài phạm vi mã lỗi STUN hợp lệ. Lỗi 701 chỉ được kích hoạt một lần mỗi URL máy chủ, và chỉ khi {{domxref("RTCPeerConnection.iceGatheringState", "iceGatheringState")}} đang ở trạng thái `gathering`.
- {{domxref("RTCPeerConnectionIceErrorEvent.errorText", "errorText")}} {{ReadOnlyInline}}
  - : Một chuỗi chứa văn bản lý do STUN trả về bởi máy chủ STUN hoặc TURN. Nếu không thể thiết lập liên lạc với máy chủ STUN hoặc TURN, chuỗi này sẽ là một chuỗi do trình duyệt xác định giải thích lỗi.
- {{domxref("RTCPeerConnectionIceErrorEvent.port", "port")}} {{ReadOnlyInline}}
  - : Một giá trị số nguyên không dấu cho số cổng nơi giao tiếp với máy chủ STUN hoặc TURN đang diễn ra, sử dụng địa chỉ IP đã cho trong `address`. `null` nếu kết nối chưa được thiết lập (tức là nếu `address` là `null`).
- {{domxref("RTCPeerConnectionIceErrorEvent.url", "url")}} {{ReadOnlyInline}}
  - : Một chuỗi chỉ ra URL của máy chủ STUN hoặc TURN nơi xảy ra lỗi.

## Phương thức phiên bản

_`RTCPeerConnectionIceErrorEvent` không có phương thức nào khác ngoài những phương thức được cung cấp bởi giao diện cha, {{domxref("Event")}}._

## Ví dụ

TBD

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
