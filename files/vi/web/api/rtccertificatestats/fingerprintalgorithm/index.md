---
title: "RTCCertificateStats: thuộc tính fingerprintAlgorithm"
short-title: fingerprintAlgorithm
slug: Web/API/RTCCertificateStats/fingerprintAlgorithm
page-type: web-api-instance-property
browser-compat: api.RTCStatsReport.type_certificate.fingerprintAlgorithm
---

{{APIRef("WebRTC")}}

Thuộc tính **`fingerprintAlgorithm`** của từ điển {{domxref("RTCCertificateStats")}} là một chuỗi chứa tên của hàm băm được dùng để tạo giá trị {{domxref("RTCCertificateStats.fingerprint", "fingerprint")}} trong {{domxref("RTCCertificate")}} liên kết.

## Giá trị

Một chuỗi chứa tên của hàm băm được dùng để tạo dấu vân tay của chứng chỉ liên kết.

Các giá trị được phép là: `"sha-1"`, `"sha-224"`, `"sha-256"`, `"sha-384"`, `"sha-512"`, `"md5"`, `"md2"`. <!-- from [RFC4572, Section 5](https://www.rfc-editor.org/rfc/rfc4572#section-5) -->

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
