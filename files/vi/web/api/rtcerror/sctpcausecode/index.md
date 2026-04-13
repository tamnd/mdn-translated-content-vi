---
title: "RTCError: thuộc tính sctpCauseCode"
short-title: sctpCauseCode
slug: Web/API/RTCError/sctpCauseCode
page-type: web-api-instance-property
browser-compat: api.RTCError.sctpCauseCode
---

{{APIRef("WebRTC")}}

Thuộc tính chỉ đọc **`sctpCauseCode`** trong đối tượng {{domxref("RTCError")}} cung cấp mã nguyên nhân {{Glossary("SCTP")}} giải thích lý do thương lượng SCTP thất bại, nếu `RTCError` đại diện cho lỗi SCTP.

## Giá trị

Một giá trị số nguyên không dấu dài chỉ định mã nguyên nhân SCTP giải thích tại sao lỗi xảy ra. Thuộc tính này là `null` nếu lỗi không phải là lỗi SCTP, với thuộc tính {{domxref("RTCError.errorDetail", "errorDetail")}} của nó được đặt thành `sctp-failure`.

Các mã nguyên nhân lỗi SCTP tiêu chuẩn, được đánh số 1-13, được định nghĩa trong thông số kỹ thuật SCTP: {{RFC(4960, "", "3.3.10")}}.

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
