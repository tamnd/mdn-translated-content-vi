---
title: "RTCPeerConnection: phương thức createOffer()"
short-title: createOffer()
slug: Web/API/RTCPeerConnection/createOffer
page-type: web-api-instance-method
browser-compat: api.RTCPeerConnection.createOffer
---

{{APIRef("WebRTC")}}

Phương thức **`createOffer()`** của giao diện {{domxref("RTCPeerConnection")}} bắt đầu tạo một offer {{Glossary("SDP")}} để khởi động một kết nối WebRTC mới tới máy ngang hàng từ xa.
Offer SDP bao gồm thông tin về các đối tượng {{DOMxRef("MediaStreamTrack")}} đã được gắn vào phiên WebRTC, codec và tùy chọn được trình duyệt hỗ trợ, cũng như mọi candidate đã được bộ máy {{Glossary("ICE")}} thu thập, nhằm được gửi qua kênh báo hiệu tới máy ngang hàng tiềm năng để yêu cầu kết nối hoặc cập nhật cấu hình của một kết nối hiện có.

## Cú pháp

```js-nolint
createOffer()
createOffer(options)

createOffer(successCallback, failureCallback) // deprecated
createOffer(options, successCallback, failureCallback) // deprecated
```

### Tham số

- `options` {{optional_inline}}
  - : Một đối tượng tùy chọn, chẳng hạn như `iceRestart`, dùng để điều khiển quá trình tạo offer.

### Tham số lỗi thời

- `successCallback` {{deprecated_inline}}
  - : Hàm được gọi khi offer được tạo thành công.
- `failureCallback` {{deprecated_inline}}
  - : Hàm được gọi nếu việc tạo offer thất bại.

### Giá trị trả về

Một {{jsxref("Promise")}} được giải quyết với một đối tượng {{domxref("RTCSessionDescription")}}.

## Ví dụ

```js
pc.createOffer().then((offer) => pc.setLocalDescription(offer));
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
