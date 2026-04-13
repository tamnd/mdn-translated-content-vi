---
title: "RTCPeerConnection: phương thức setConfiguration()"
short-title: setConfiguration()
slug: Web/API/RTCPeerConnection/setConfiguration
page-type: web-api-instance-method
browser-compat: api.RTCPeerConnection.setConfiguration
---

{{APIRef("WebRTC")}}

Phương thức **`setConfiguration()`** của giao diện {{domxref("RTCPeerConnection")}} đặt cấu hình hiện tại của kết nối dựa trên các giá trị được bao gồm trong đối tượng chỉ định.
Điều này cho phép bạn thay đổi các máy chủ {{Glossary("ICE")}} được dùng bởi kết nối và chính sách truyền tải nào sẽ được sử dụng.

## Cú pháp

```js-nolint
setConfiguration(configuration)
```

### Tham số

- `configuration`
  - : Một đối tượng {{domxref("RTCConfiguration")}} mới.

### Giá trị trả về

Không có.

## Ví dụ

```js
pc.setConfiguration({
  iceServers: [{ urls: "stun:stun.l.google.com:19302" }],
});
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
