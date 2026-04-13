---
title: RTCPeerConnectionIceEvent
slug: Web/API/RTCPeerConnectionIceEvent
page-type: web-api-interface
browser-compat: api.RTCPeerConnectionIceEvent
---

{{APIRef("WebRTC")}}

Giao diện **`RTCPeerConnectionIceEvent`** đại diện cho các sự kiện xảy ra liên quan đến các ứng viên {{Glossary("ICE")}} với đối tượng đích, thường là {{domxref("RTCPeerConnection")}}.

Chỉ có một sự kiện thuộc loại này: {{domxref("RTCPeerConnection.icecandidate_event", "icecandidate")}}.

{{InheritanceDiagram}}

## Thuộc tính phiên bản

_Vì `RTCPeerConnectionIceEvent` là một {{domxref("Event")}}, sự kiện này cũng triển khai các thuộc tính sau_.

- {{domxref("RTCPeerConnectionIceEvent.candidate")}} {{ReadOnlyInline}}
  - : Chứa {{domxref("RTCIceCandidate")}} bao gồm ứng viên liên quan đến sự kiện, hoặc `null` nếu sự kiện này cho biết không có thêm ứng viên nào nữa.
- {{domxref("RTCPeerConnectionIceEvent.url")}} {{ReadOnlyInline}} {{deprecated_inline}}
  - : Chứa một chuỗi cho biết URL của máy chủ {{Glossary("STUN")}} hoặc {{Glossary("TURN")}} được dùng để thu thập ứng viên, hoặc `null` nếu ứng viên không được thu thập từ máy chủ.

## Hàm khởi tạo

- {{domxref("RTCPeerConnectionIceEvent.RTCPeerConnectionIceEvent()", "RTCPeerConnectionIceEvent()")}}
  - : Trả về một `RTCPeerConnectionIceEvent` mới. Nó nhận hai tham số, tham số đầu tiên là một chuỗi đại diện cho loại sự kiện; tham số thứ hai là một từ điển chứa {{domxref("RTCIceCandidate")}} mà nó tham chiếu đến.

## Phương thức phiên bản

_Vì `RTCPeerConnectionIceEvent` là một {{domxref("Event")}}, sự kiện này cũng triển khai các thuộc tính sau. Không có phương thức {{domxref("RTCDataChannelEvent")}} cụ thể nào._

## Ví dụ

```js
pc.onicecandidate = (ev) => {
  console.log(
    `The ICE candidate ('${ev.candidate.candidate}') added to connection.`,
  );
};
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [WebRTC](/en-US/docs/Web/API/WebRTC_API)
- Đối tượng đích thông thường: {{domxref("RTCPeerConnection")}}.
