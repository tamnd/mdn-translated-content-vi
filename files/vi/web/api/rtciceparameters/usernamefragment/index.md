---
title: "RTCIceParameters: thuộc tính usernameFragment"
short-title: usernameFragment
slug: Web/API/RTCIceParameters/usernameFragment
page-type: web-api-instance-property
spec-urls: https://w3c.github.io/webrtc-pc/#dom-rtciceparameters-usernamefragment
---

{{APIRef("WebRTC")}}

Thuộc tính **`usernameFragment`** của từ điển **{{domxref("RTCIceParameters")}}** xác định username fragment ("ufrag") xác định duy nhất phiên ICE tương ứng trong suốt thời gian của phiên ICE hiện tại.

## Giá trị

Một chuỗi chứa username fragment mà cùng với {{domxref("RTCIceParameters.password", "password")}}, xác định duy nhất phiên ICE được sử dụng bởi transport. Chuỗi có thể dài tối đa 256 ký tự.

Xem {{domxref("RTCIceCandidate.usernameFragment")}} để tìm hiểu thêm về username fragment và vai trò của chúng trong kết nối.

## Thông số kỹ thuật

{{Specifications}}
