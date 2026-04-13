---
title: "RTCError: thuộc tính sentAlert"
short-title: sentAlert
slug: Web/API/RTCError/sentAlert
page-type: web-api-instance-property
browser-compat: api.RTCError.sentAlert
---

{{APIRef("WebRTC")}}

Thuộc tính chỉ đọc **`sentAlert`** trong đối tượng {{domxref("RTCError")}} chỉ định số cảnh báo {{Glossary("DTLS")}} xảy ra trong khi gửi dữ liệu đến peer từ xa, nếu lỗi đại diện cho lỗi DTLS đi.

## Giá trị

Một giá trị số nguyên không dấu cung cấp số cảnh báo DTLS tương ứng với lỗi DTLS đã được gửi đến peer từ xa, được đại diện bởi đối tượng `RTCError` này. Thuộc tính này là `null` nếu {{domxref("RTCError.errorDetail", "errorDetail")}} không phải là `dtls-failure`.

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
