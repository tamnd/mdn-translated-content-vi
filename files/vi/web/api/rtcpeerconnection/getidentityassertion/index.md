---
title: "RTCPeerConnection: phương thức getIdentityAssertion()"
short-title: getIdentityAssertion()
slug: Web/API/RTCPeerConnection/getIdentityAssertion
page-type: web-api-instance-method
browser-compat: api.RTCPeerConnection.getIdentityAssertion
---

{{APIRef("WebRTC")}}

Phương thức **`getIdentityAssertion()`** của giao diện {{domxref("RTCPeerConnection")}} bắt đầu thu thập một chứng thực danh tính và trả về một {{jsxref("Promise")}} được giải quyết thành chuỗi mã hóa chứng thực danh tính.

Phương thức này chỉ có hiệu lực nếu {{DOMxRef("RTCPeerConnection.signalingState", "signalingState")}} không phải là `closed`.

## Cú pháp

```js-nolint
getIdentityAssertion()
```

### Tham số

Không có.

### Giá trị trả về

Một {{jsxref("Promise")}} được giải quyết thành chuỗi chứa chứng thực danh tính.

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
