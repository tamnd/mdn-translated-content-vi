---
title: "RTCDtlsTransport: state property"
short-title: state
slug: Web/API/RTCDtlsTransport/state
page-type: web-api-instance-property
browser-compat: api.RTCDtlsTransport.state
---

{{APIRef("WebRTC")}}

Thuộc tính chỉ đọc **`state`** của giao diện {{DOMxRef("RTCDtlsTransport")}} cung cấp thông tin mô tả trạng thái transport Datagram Transport Layer Security (**{{Glossary("DTLS")}}**).

## Giá trị

Một chuỗi. Giá trị của nó là một trong các giá trị sau:

- `new`
  - : Trạng thái ban đầu khi DTLS chưa bắt đầu thỏa thuận.
- `connecting`
  - : DTLS đang trong quá trình thỏa thuận kết nối bảo mật và xác minh fingerprint từ xa.
- `connected`
  - : DTLS đã hoàn thành thỏa thuận kết nối bảo mật và xác minh fingerprint từ xa.
- `closed`
  - : Transport đã bị đóng có chủ ý do nhận cảnh báo `close_notify`, hoặc gọi {{DOMxRef("RTCPeerConnection.close()")}}.
- `failed`
  - : Transport đã thất bại do lỗi (chẳng hạn như nhận cảnh báo lỗi hoặc thất bại khi xác thực fingerprint từ xa).

## Ví dụ

Xem [`RTCDtlsTransport`](/en-US/docs/Web/API/RTCDtlsTransport#examples) để có mã ví dụ.

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [WebRTC API](/en-US/docs/Web/API/WebRTC_API)
- {{DOMxRef("RTCDtlsTransport")}}
