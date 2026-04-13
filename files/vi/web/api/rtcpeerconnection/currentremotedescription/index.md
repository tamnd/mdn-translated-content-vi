---
title: "RTCPeerConnection: thuộc tính currentRemoteDescription"
short-title: currentRemoteDescription
slug: Web/API/RTCPeerConnection/currentRemoteDescription
page-type: web-api-instance-property
browser-compat: api.RTCPeerConnection.currentRemoteDescription
---

{{APIRef("WebRTC")}}

Thuộc tính chỉ đọc **`currentRemoteDescription`** của giao diện {{domxref("RTCPeerConnection")}} trả về một đối tượng {{domxref("RTCSessionDescription")}} mô tả đầu từ xa của kết nối như lần thương lượng thành công gần nhất kể từ khi `RTCPeerConnection` này hoàn tất việc thương lượng và kết nối với máy ngang hàng từ xa.
Nó cũng bao gồm danh sách bất kỳ ICE candidate nào đã được bộ máy ICE tạo ra kể từ khi offer hoặc answer được mô tả được khởi tạo lần đầu.

## Giá trị

Một đối tượng {{domxref("RTCSessionDescription")}} mô tả trạng thái từ xa hiện tại của kết nối, hoặc `null` nếu chưa có mô tả hiện tại.

## Ví dụ

```js
const peerConnection = new RTCPeerConnection();

const remoteDescription = peerConnection.currentRemoteDescription;
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
