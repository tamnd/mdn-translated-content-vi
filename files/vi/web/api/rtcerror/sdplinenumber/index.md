---
title: "RTCError: thuộc tính sdpLineNumber"
short-title: sdpLineNumber
slug: Web/API/RTCError/sdpLineNumber
page-type: web-api-instance-property
browser-compat: api.RTCError.sdpLineNumber
---

{{APIRef("WebRTC")}}

Thuộc tính chỉ đọc **`sdpLineNumber`** của giao diện {{domxref("RTCError")}} chỉ định số dòng trong {{Glossary("SDP")}} tại đó xảy ra lỗi cú pháp trong khi phân tích cú pháp.

## Giá trị

Một giá trị số nguyên không dấu cho biết dòng trong SDP tại đó xảy ra lỗi cú pháp được mô tả bởi đối tượng `RTCError`. Các dòng được đánh số bắt đầu từ dòng 1.

Thuộc tính này là `null` trừ khi giá trị của {{domxref("RTCError.errorDetail", "errorDetail")}} là `sdp-syntax-error`.

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
