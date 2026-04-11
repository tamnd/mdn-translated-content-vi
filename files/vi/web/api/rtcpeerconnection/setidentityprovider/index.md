---
title: "RTCPeerConnection: phương thức setIdentityProvider()"
short-title: setIdentityProvider()
slug: Web/API/RTCPeerConnection/setIdentityProvider
page-type: web-api-instance-method
browser-compat: api.RTCPeerConnection.setIdentityProvider
---

{{APIRef("WebRTC")}}

Phương thức **`setIdentityProvider()`** của giao diện {{domxref("RTCPeerConnection")}} đặt Nhà cung cấp danh tính (IdP) theo bộ ba được truyền vào tham số: tên của nó, giao thức được dùng để giao tiếp với nó và tên người dùng.
Giao thức và tên người dùng là tùy chọn.

## Cú pháp

```js-nolint
setIdentityProvider(provider, protocol, username)
```

### Tham số

- `provider`
  - : Tên của nhà cung cấp danh tính.
- `protocol` {{optional_inline}}
  - : Giao thức dùng để giao tiếp với nhà cung cấp.
- `username` {{optional_inline}}
  - : Tên người dùng.

### Giá trị trả về

Không có.

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
