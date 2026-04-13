---
title: "RTCIceTransport: phương thức getLocalParameters()"
short-title: getLocalParameters()
slug: Web/API/RTCIceTransport/getLocalParameters
page-type: web-api-instance-method
browser-compat: api.RTCIceTransport.getLocalParameters
---

{{APIRef("WebRTC")}}

Phương thức **`getLocalParameters()`** của giao diện {{domxref("RTCIceTransport")}} trả về một đối tượng {{domxref("RTCIceParameters")}} cung cấp thông tin nhận dạng duy nhất đối tác cục bộ trong suốt phiên ICE.

Các tham số của đối tác cục bộ được lấy trong quá trình tín hiệu ICE và được chuyển đến truyền tải khi máy khách gọi {{domxref("RTCPeerConnection.setLocalDescription()")}}.

## Cú pháp

```js-nolint
getLocalParameters()
```

### Tham số

Không có.

### Giá trị trả về

Một đối tượng {{domxref("RTCIceParameters")}} cho biết {{domxref("RTCIceParameters.usernameFragment", "usernameFragment")}} và {{domxref("RTCIceParameters.password", "password")}} nhận dạng duy nhất đối tác cục bộ trong suốt phiên ICE.

Trả về `null` nếu các tham số chưa được nhận.

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
