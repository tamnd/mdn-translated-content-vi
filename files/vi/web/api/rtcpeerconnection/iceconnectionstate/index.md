---
title: "RTCPeerConnection: thuộc tính iceConnectionState"
short-title: iceConnectionState
slug: Web/API/RTCPeerConnection/iceConnectionState
page-type: web-api-instance-property
browser-compat: api.RTCPeerConnection.iceConnectionState
---

{{APIRef("WebRTC")}}

Thuộc tính chỉ đọc **`iceConnectionState`** của giao diện {{domxref("RTCPeerConnection")}} trả về một chuỗi mô tả trạng thái của bộ máy ICE gắn với `RTCPeerConnection` này.
Giá trị có thể là một trong các chuỗi sau: `new`, `checking`, `connected`, `completed`, `failed`, `disconnected` hoặc `closed`.

## Giá trị

Một chuỗi cho biết trạng thái hiện tại của kết nối ICE.

- `new`
  - : Bộ máy ICE đang ở trạng thái mới.
- `checking`
  - : Bộ máy ICE đang kiểm tra các candidate để thiết lập kết nối.
- `connected`
  - : Một kết nối giữa các máy ngang hàng đã được thiết lập và ít nhất một thành phần ICE đã nhận được xác nhận cuối cùng.
- `completed`
  - : Bộ máy ICE đã hoàn tất việc kiểm tra tất cả candidate và kết nối đang hoạt động.
- `failed`
  - : Quá trình kiểm tra ICE đã thất bại.
- `disconnected`
  - : Một hay nhiều thành phần ICE bị ngắt.
- `closed`
  - : `RTCPeerConnection` đã đóng.

## Ví dụ

```js
const peerConnection = new RTCPeerConnection(configuration);

const iceConnectionState = peerConnection.iceConnectionState;
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
