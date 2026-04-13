---
title: "RTCPeerConnectionIceEvent: url property"
short-title: url
slug: Web/API/RTCPeerConnectionIceEvent/url
page-type: web-api-instance-property
status:
  - deprecated
browser-compat: api.RTCPeerConnectionIceEvent.url
---

{{APIRef("WebRTC")}}{{deprecated_header}}

Thuộc tính chỉ đọc **`url`** của giao diện {{domxref("RTCPeerConnectionIceEvent")}} trả về URL của máy chủ {{Glossary("STUN")}} hoặc {{Glossary("TURN")}} được dùng để thu thập ứng viên ICE đã kích hoạt sự kiện. Nếu ứng viên không được thu thập từ máy chủ {{Glossary("STUN")}} hoặc {{Glossary("TURN")}}, giá trị là `null`.

> [!NOTE]
> Thuộc tính này được coi là đã lỗi thời theo thông số kỹ thuật, thay thế bằng thuộc tính `url` trên giao diện {{domxref("RTCIceCandidate")}}.

## Giá trị

Một chuỗi chứa URL của máy chủ {{Glossary("STUN")}} hoặc {{Glossary("TURN")}} được dùng để thu thập ứng viên này, hoặc `null` nếu ứng viên không được thu thập từ máy chủ (ví dụ như ứng viên local host).

## Ví dụ

### Ghi log URL máy chủ ICE

```js
pc.onicecandidate = (event) => {
  if (event.candidate) {
    console.log(`Candidate gathered from: ${event.url}`);
  }
};
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("RTCPeerConnection.icecandidate_event", "icecandidate")}}
- {{domxref("RTCPeerConnectionIceEvent.candidate")}}
- {{domxref("RTCPeerConnection")}}
