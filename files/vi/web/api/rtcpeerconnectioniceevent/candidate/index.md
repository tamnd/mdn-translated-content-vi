---
title: "RTCPeerConnectionIceEvent: candidate property"
short-title: candidate
slug: Web/API/RTCPeerConnectionIceEvent/candidate
page-type: web-api-instance-property
browser-compat: api.RTCPeerConnectionIceEvent.candidate
---

{{APIRef("WebRTC")}}

Thuộc tính chỉ đọc **`candidate`** của giao diện {{domxref("RTCPeerConnectionIceEvent")}} trả về {{domxref("RTCIceCandidate")}} liên quan đến sự kiện.

## Giá trị

Một đối tượng {{domxref("RTCIceCandidate")}} đại diện cho ứng viên ICE đã nhận, hoặc `null` để cho biết không có thêm ứng viên nào cho phiên thương lượng này.

## Ví dụ

```js
pc.onicecandidate = (ev) => {
  alert(
    `The ICE candidate (transport address: '${ev.candidate.candidate}') has been added to this connection.`,
  );
};
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("RTCPeerConnection.icecandidate_event", "icecandidate")}}
- {{domxref("RTCPeerConnection")}}
