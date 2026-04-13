---
title: "RTCIceTransport: phương thức getRemoteParameters()"
short-title: getRemoteParameters()
slug: Web/API/RTCIceTransport/getRemoteParameters
page-type: web-api-instance-method
browser-compat: api.RTCIceTransport.getRemoteParameters
---

{{APIRef("WebRTC")}}

Phương thức **`getRemoteParameters()`** của giao diện {{domxref("RTCIceTransport")}} trả về một đối tượng {{domxref("RTCIceParameters")}} cung cấp thông tin nhận dạng duy nhất đối tác từ xa trong suốt phiên ICE.

Các tham số của đối tác từ xa được nhận trong quá trình tín hiệu ICE và được chuyển đến truyền tải khi máy khách gọi {{domxref("RTCPeerConnection.setRemoteDescription()")}}.

## Cú pháp

```js-nolint
getRemoteParameters()
```

### Tham số

Không có.

### Giá trị trả về

Một đối tượng {{domxref("RTCIceParameters")}} cho biết {{domxref("RTCIceParameters.usernameFragment", "usernameFragment")}} và {{domxref("RTCIceParameters.password", "password")}} nhận dạng duy nhất đối tác từ xa trong suốt phiên ICE.

Trả về `null` nếu các tham số chưa được nhận.

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
