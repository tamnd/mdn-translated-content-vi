---
title: "RTCPeerConnection: thuộc tính pendingRemoteDescription"
short-title: pendingRemoteDescription
slug: Web/API/RTCPeerConnection/pendingRemoteDescription
page-type: web-api-instance-property
browser-compat: api.RTCPeerConnection.pendingRemoteDescription
---

{{APIRef("WebRTC")}}

Thuộc tính chỉ đọc **`pendingRemoteDescription`** của giao diện {{domxref("RTCPeerConnection")}} trả về một đối tượng {{domxref("RTCSessionDescription")}} mô tả một thay đổi cấu hình đang chờ xử lý cho đầu từ xa của kết nối.
Nó không mô tả kết nối ở trạng thái hiện tại, mà là như nó có thể tồn tại trong tương lai gần.

## Giá trị

Một đối tượng {{domxref("RTCSessionDescription")}} mô tả mô tả từ xa đang chờ xử lý, hoặc `null` nếu không có.

## Ví dụ

```js
const peerConnection = new RTCPeerConnection();

const pendingRemoteDescription = peerConnection.pendingRemoteDescription;
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
