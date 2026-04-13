---
title: "RTCPeerConnection: thuộc tính signalingState"
short-title: signalingState
slug: Web/API/RTCPeerConnection/signalingState
page-type: web-api-instance-property
browser-compat: api.RTCPeerConnection.signalingState
---

{{APIRef("WebRTC")}}

Thuộc tính chỉ đọc **`signalingState`** của giao diện {{domxref("RTCPeerConnection")}} trả về một chuỗi mô tả trạng thái của quá trình báo hiệu ở đầu cục bộ của kết nối trong khi đang kết nối hoặc kết nối lại với một máy ngang hàng khác.
Giá trị có thể là một trong các trạng thái sau: `stable`, `have-local-offer`, `have-remote-offer`, `have-local-pranswer`, `have-remote-pranswer` hoặc `closed`.

## Giá trị

- `stable`
  - : Không có offer hoặc answer đang chờ xử lý.
- `have-local-offer`
  - : Một offer cục bộ đã được đặt và đang chờ answer từ máy ngang hàng từ xa.
- `have-remote-offer`
  - : Một offer từ xa đã được đặt và đang chờ answer cục bộ.
- `have-local-pranswer`
  - : Một answer tạm thời cục bộ đã được đặt.
- `have-remote-pranswer`
  - : Một answer tạm thời từ xa đã được đặt.
- `closed`
  - : Kết nối đã đóng.

## Ví dụ

```js
const peerConnection = new RTCPeerConnection(configuration);

const signalingState = peerConnection.signalingState;
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
