---
title: "RTCPeerConnection: phương thức setRemoteDescription()"
short-title: setRemoteDescription()
slug: Web/API/RTCPeerConnection/setRemoteDescription
page-type: web-api-instance-method
browser-compat: api.RTCPeerConnection.setRemoteDescription
---

{{APIRef("WebRTC")}}

Phương thức **`setRemoteDescription()`** của giao diện {{domxref("RTCPeerConnection")}} đặt mô tả phiên được chỉ định làm offer hoặc answer hiện tại của máy ngang hàng từ xa.
Mô tả này chỉ định các thuộc tính của đầu từ xa của kết nối, bao gồm định dạng media.
Nó trả về một {{jsxref("Promise")}} được thực thi khi mô tả đã được thay đổi, theo cách bất đồng bộ.

## Cú pháp

```js-nolint
setRemoteDescription(sessionDescription)

setRemoteDescription(sessionDescription, successCallback, errorCallback) // deprecated
```

### Tham số

- `sessionDescription`
  - : Một đối tượng {{domxref("RTCSessionDescription")}} hoặc từ điển mô tả phiên sẽ được đặt làm mô tả từ xa.

### Giá trị trả về

Một {{jsxref("Promise")}} được thực thi khi mô tả từ xa đã được đặt thành công.

## Ví dụ

```js
pc.setRemoteDescription(new RTCSessionDescription(desc));
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
