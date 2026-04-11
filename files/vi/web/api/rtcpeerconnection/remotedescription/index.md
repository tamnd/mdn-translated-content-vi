---
title: "RTCPeerConnection: thuộc tính remoteDescription"
short-title: remoteDescription
slug: Web/API/RTCPeerConnection/remoteDescription
page-type: web-api-instance-property
browser-compat: api.RTCPeerConnection.remoteDescription
---

{{APIRef("WebRTC")}}

Thuộc tính chỉ đọc **`remoteDescription`** của giao diện {{domxref("RTCPeerConnection")}} trả về một đối tượng {{domxref("RTCSessionDescription")}} mô tả phiên, bao gồm thông tin cấu hình và phương tiện, cho đầu từ xa của kết nối.
Nếu chưa được đặt, thuộc tính này trả về `null`.

## Giá trị

Một đối tượng {{domxref("RTCSessionDescription")}} hoặc `null`.

## Ví dụ

```js
const peerConnection = new RTCPeerConnection();

const remoteDescription = peerConnection.remoteDescription;
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
