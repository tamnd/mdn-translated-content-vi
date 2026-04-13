---
title: RTCIceParameters
slug: Web/API/RTCIceParameters
page-type: web-api-interface
spec-urls: https://w3c.github.io/webrtc-pc/#rtciceparameters
---

{{APIRef("WebRTC")}}

Từ điển **`RTCIceParameters`** xác định username fragment và password được gán cho một phiên {{Glossary("ICE")}}.

Trong quá trình đàm phán ICE, username fragment và password của mỗi peer được ghi lại trong một đối tượng `RTCIceParameters`, có thể lấy từ {{domxref("RTCIceTransport")}} bằng cách gọi phương thức {{domxref("RTCIceTransport.getLocalParameters", "getLocalParameters()")}} hoặc {{domxref("RTCIceTransport.getRemoteParameters", "getRemoteParameters()")}}, tùy thuộc vào đầu nào bạn quan tâm.

## Thuộc tính phiên bản

- {{domxref("RTCIceParameters.usernameFragment", "usernameFragment")}}
  - : Một chuỗi xác định giá trị của trường username fragment của phiên ICE, `ufrag`.
- {{domxref("RTCIceParameters.password", "password")}}
  - : Một chuỗi xác định chuỗi password của phiên.

## Ghi chú sử dụng

Username fragment và password xác định duy nhất peer từ xa trong suốt thời gian của phiên ICE, và được sử dụng để đảm bảo tính bảo mật và tránh sự chồng chéo giữa nhiều phiên ICE đang diễn ra. Xem {{domxref("RTCIceCandidate.usernameFragment")}} để biết thêm thông tin.

## Thông số kỹ thuật

{{Specifications}}
