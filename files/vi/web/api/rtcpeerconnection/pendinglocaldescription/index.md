---
title: "RTCPeerConnection: thuộc tính pendingLocalDescription"
short-title: pendingLocalDescription
slug: Web/API/RTCPeerConnection/pendingLocalDescription
page-type: web-api-instance-property
browser-compat: api.RTCPeerConnection.pendingLocalDescription
---

{{APIRef("WebRTC")}}

Thuộc tính chỉ đọc **`pendingLocalDescription`** của giao diện {{domxref("RTCPeerConnection")}} trả về một đối tượng {{domxref("RTCSessionDescription")}} mô tả một thay đổi cấu hình đang chờ xử lý cho đầu cục bộ của kết nối.
Nó không mô tả kết nối ở trạng thái hiện tại, mà là như nó có thể tồn tại trong tương lai gần.

## Giá trị

Một đối tượng {{domxref("RTCSessionDescription")}} mô tả mô tả cục bộ đang chờ xử lý, hoặc `null` nếu không có.

## Ví dụ

```js
const peerConnection = new RTCPeerConnection();

const pendingLocalDescription = peerConnection.pendingLocalDescription;
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
