---
title: "Thuộc tính dtmf của RTCRtpSender"
short-title: dtmf
slug: Web/API/RTCRtpSender/dtmf
page-type: web-api-instance-property
browser-compat: api.RTCRtpSender.dtmf
---

{{APIRef("WebRTC")}}

Thuộc tính chỉ đọc **`dtmf`** trên giao diện **{{domxref("RTCRtpSender")}}** trả về một đối tượng {{domxref("RTCDTMFSender")}} có thể được sử dụng để gửi các âm {{Glossary("DTMF")}} qua {{domxref("RTCPeerConnection")}}. Xem [Sử dụng DTMF](/en-US/docs/Web/API/WebRTC_API/Using_DTMF) để biết chi tiết về cách sử dụng đối tượng `RTCDTMFSender` được trả về.

## Giá trị

Một {{domxref("RTCDTMFSender")}} có thể được sử dụng để gửi DTMF qua phiên RTP, hoặc `null` nếu track đang được mang bởi phiên RTP hoặc {{domxref("RTCPeerConnection")}} nói chung không hỗ trợ DTMF.

> [!NOTE]
> Chỉ các track âm thanh mới có thể hỗ trợ DTMF và thông thường chỉ một track âm thanh trên mỗi `RTCPeerConnection` sẽ có một {{domxref("RTCDTMFSender")}} liên kết.

## Ví dụ

tbd

## Đặc tả kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [API WebRTC](/en-US/docs/Web/API/WebRTC_API)
- [Sử dụng DTMF với WebRTC](/en-US/docs/Web/API/WebRTC_API/Using_DTMF)
- {{domxref("RTCPeerConnection")}}
- {{domxref("RTCDTMFSender")}}
- {{domxref("RTCRtpSender")}}
