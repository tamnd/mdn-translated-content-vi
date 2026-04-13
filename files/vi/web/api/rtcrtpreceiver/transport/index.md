---
title: "RTCRtpReceiver: thuộc tính transport"
short-title: transport
slug: Web/API/RTCRtpReceiver/transport
page-type: web-api-instance-property
browser-compat: api.RTCRtpReceiver.transport
---

{{APIRef("WebRTC")}}

Thuộc tính **`transport`** chỉ đọc của một đối tượng {{domxref("RTCRtpReceiver")}} cung cấp đối tượng {{domxref("RTCDtlsTransport")}} được dùng để tương tác với transport nền tảng mà qua đó receiver đang trao đổi các gói Real-time Transport Control Protocol ({{Glossary("RTCP")}}).

Transport này chịu trách nhiệm nhận dữ liệu cho track {{domxref("RTCRtpReceiver.track", "track")}} của receiver.

## Giá trị

Một đối tượng {{domxref("RTCDtlsTransport")}} đại diện cho transport nền tảng đang được receiver dùng để trao đổi gói với peer từ xa, hoặc `null` nếu receiver chưa kết nối tới transport.

## Mô tả

Khi `RTCRtpReceiver` được tạo lần đầu, giá trị của `transport` là `null`. Giá trị này được thay bằng một `RTCDtlsTransport` khi transport của receiver đã được thiết lập.

Lưu ý rằng khi bundling có hiệu lực, tức là khi {{domxref("RTCPeerConnection")}} được tạo với một đối tượng cấu hình có `bundlePolicy` là `max-compat` hoặc `max-bundle`, nhiều receiver có thể chia sẻ cùng một transport; trong trường hợp đó, tất cả chúng đều dùng cùng một kết nối để truyền và/hoặc nhận gói {{Glossary("RTP")}} và {{Glossary("RTCP")}}.

## Đặc tả kỹ thuật

{{Specifications}}

## Tính tương thích trên trình duyệt

{{Compat}}
