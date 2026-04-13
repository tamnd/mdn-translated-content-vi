---
title: "RTCError: thuộc tính errorDetail"
short-title: errorDetail
slug: Web/API/RTCError/errorDetail
page-type: web-api-instance-property
browser-compat: api.RTCError.errorDetail
---

{{APIRef("WebRTC")}}

Thuộc tính chỉ đọc **`errorDetail`** của giao diện {{domxref("RTCError")}} là một chuỗi cho biết mã lỗi [WebRTC](/en-US/docs/Web/API/WebRTC_API) cụ thể đã xảy ra.

## Giá trị

Một chuỗi chỉ đọc có giá trị cho biết loại lỗi WebRTC cụ thể xảy ra trên {{domxref("RTCPeerConnection")}}. Các giá trị có thể là:

- `data-channel-failure`
  - : {{domxref("RTCDataChannel")}} của kết nối đã bị lỗi.
- `dtls-failure`
  - : Quá trình thương lượng kết nối {{Glossary("DTLS")}} thất bại, hoặc kết nối bị chấm dứt với một lỗi nghiêm trọng. {{domxref("DOMException.message", "message")}} của lỗi chứa thông tin chi tiết về bản chất của lỗi. Nếu một lỗi nghiêm trọng được _nhận_, thuộc tính {{domxref("RTCError.receivedAlert", "receivedAlert")}} của đối tượng lỗi được đặt thành giá trị của cảnh báo DTLSL nhận được. Nếu ngược lại, một lỗi nghiêm trọng được _gửi_, {{domxref("RTCError.sentAlert", "sentAlert")}} được đặt thành giá trị của cảnh báo.
- `fingerprint-failure`
  - : Chứng chỉ từ xa cho {{domxref("RTCDtlsTransport")}} không khớp với bất kỳ fingerprint nào được liệt kê trong SDP. Nếu peer từ xa không thể khớp chứng chỉ cục bộ với fingerprint được cung cấp, lỗi này không xảy ra, mặc dù tình huống này có thể dẫn đến lỗi `dtls-failure` thay thế.
- `hardware-encoder-error`
  - : Bộ mã hóa phần cứng không hỗ trợ các tham số cấu hình đã cho.
- `hardware-encoder-not-available`
  - : Các tài nguyên bộ mã hóa phần cứng cần thiết để hoàn thành thao tác được yêu cầu không có sẵn.
- `sctp-failure`
  - : Quá trình thương lượng {{Glossary("SCTP")}} thất bại, hoặc kết nối bị chấm dứt với một lỗi nghiêm trọng. Mã nguyên nhân SCTP có thể được tìm thấy trong {{domxref("RTCError.sctpCauseCode", "sctpCauseCode")}} của đối tượng `RTCError`. Mã nguyên nhân lỗi SCTP 1-13 được định nghĩa trong thông số kỹ thuật SCTP: {{RFC(4960, "", "3.3.10")}}.
- `sdp-syntax-error`
  - : Cú pháp SDP không hợp lệ. Thuộc tính {{domxref("RTCError.sdpLineNumber", "sdpLineNumber")}} của lỗi cho biết số dòng trong SDP tại đó lỗi được phát hiện.

## Ví dụ

tbd

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
