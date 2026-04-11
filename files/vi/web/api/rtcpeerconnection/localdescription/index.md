---
title: "RTCPeerConnection: thuộc tính localDescription"
short-title: localDescription
slug: Web/API/RTCPeerConnection/localDescription
page-type: web-api-instance-property
browser-compat: api.RTCPeerConnection.localDescription
---

{{APIRef("WebRTC")}}

Thuộc tính chỉ đọc **`localDescription`** của giao diện {{domxref("RTCPeerConnection")}} trả về một đối tượng {{domxref("RTCSessionDescription")}} mô tả phiên cho đầu cục bộ của kết nối.
Nếu chưa được đặt, giá trị trả về là `null`.

## Giá trị

Một đối tượng {{domxref("RTCSessionDescription")}} hoặc `null`.

## Ví dụ

```js
const peerConnection = new RTCPeerConnection();

const localDescription = peerConnection.localDescription;
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
