---
title: "RTCPeerConnection: thuộc tính currentLocalDescription"
short-title: currentLocalDescription
slug: Web/API/RTCPeerConnection/currentLocalDescription
page-type: web-api-instance-property
browser-compat: api.RTCPeerConnection.currentLocalDescription
---

{{APIRef("WebRTC")}}

Thuộc tính chỉ đọc **`currentLocalDescription`** của giao diện {{domxref("RTCPeerConnection")}} trả về một đối tượng {{domxref("RTCSessionDescription")}} mô tả đầu cục bộ của kết nối như lần thương lượng thành công gần nhất kể từ khi `RTCPeerConnection` này hoàn tất việc thương lượng và kết nối với máy ngang hàng từ xa.
Nó cũng bao gồm danh sách bất kỳ ICE candidate nào đã được bộ máy ICE tạo ra kể từ khi offer hoặc answer được mô tả được khởi tạo lần đầu.

## Giá trị

Một đối tượng {{domxref("RTCSessionDescription")}} mô tả trạng thái cục bộ hiện tại của kết nối, hoặc `null` nếu chưa có mô tả hiện tại.

## Ví dụ

```js
const peerConnection = new RTCPeerConnection();

const localDescription = peerConnection.currentLocalDescription;
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
