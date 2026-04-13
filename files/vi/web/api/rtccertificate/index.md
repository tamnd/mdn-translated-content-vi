---
title: RTCCertificate
slug: Web/API/RTCCertificate
page-type: web-api-interface
browser-compat: api.RTCCertificate
---

{{APIRef("WebRTC")}}

Giao diện **`RTCCertificate`** của [WebRTC API](/en-US/docs/Web/API/WebRTC_API) cung cấp một đối tượng đại diện cho chứng chỉ mà {{domxref("RTCPeerConnection")}} sử dụng để xác thực.

`RTCCertificate` là một {{Glossary("serializable object")}}, vì vậy nó có thể được nhân bản bằng {{DOMxRef("Window.structuredClone", "structuredClone()")}} hoặc sao chép giữa các [Worker](/en-US/docs/Web/API/Worker) sử dụng {{domxref("Worker/postMessage()", "postMessage()")}}.

## Thuộc tính phiên bản

- {{domxref("RTCCertificate.expires")}} {{ReadOnlyInline}}
  - : Trả về ngày hết hạn của chứng chỉ.

## Phương thức phiên bản

- {{domxref("RTCCertificate.getFingerprints()")}}
  - : Trả về một mảng các dấu vân tay chứng chỉ, được tính toán bằng các thuật toán khác nhau được hỗ trợ bởi trình duyệt.

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [`RTCPeerConnection.RTCPeerConnection()` đối số `configuration.certificates`](/en-US/docs/Web/API/RTCPeerConnection/RTCPeerConnection#certificates)
- {{domxref("RTCPeerConnection.generateCertificate_static", "RTCPeerConnection.generateCertificate()")}}
