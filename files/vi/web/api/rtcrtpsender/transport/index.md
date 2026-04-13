---
title: "Thuộc tính transport của RTCRtpSender"
short-title: transport
slug: Web/API/RTCRtpSender/transport
page-type: web-api-instance-property
browser-compat: api.RTCRtpSender.transport
---

{{APIRef("WebRTC")}}

Thuộc tính chỉ đọc **`transport`** của một đối tượng {{domxref("RTCRtpSender")}} cung cấp đối tượng {{domxref("RTCDtlsTransport")}} được sử dụng để tương tác với transport cơ bản mà qua đó sender đang trao đổi các gói Giao thức điều khiển truyền tải thời gian thực ({{Glossary("RTCP")}}).

Transport này chịu trách nhiệm nhận dữ liệu cho media trên {{domxref("RTCRtpReceiver.track", "track")}} của sender.

## Giá trị

Một đối tượng {{domxref("RTCDtlsTransport")}} đại diện cho transport cơ bản đang được sử dụng bởi sender để trao đổi các gói với peer từ xa, hoặc `null` nếu sender chưa được kết nối với một transport.

## Mô tả

Khi `RTCRtpSender` được tạo lần đầu, giá trị của `transport` là `null`. Giá trị này được thay thế bằng một `RTCDtlsTransport` sau khi transport của sender được thiết lập.

Lưu ý rằng khi bundling đang có hiệu lực — tức là, khi {{domxref("RTCPeerConnection")}} được tạo với một đối tượng cấu hình có `bundlePolicy` là `max-compat` hoặc `max-bundle` — nhiều sender có thể chia sẻ cùng một transport; trong trường hợp này, tất cả chúng đều sử dụng cùng một kết nối để truyền và/hoặc nhận các gói {{Glossary("RTP")}} và {{Glossary("RTCP")}}.

## Đặc tả kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
