---
title: "RTCCertificateStats: thuộc tính fingerprint"
short-title: fingerprint
slug: Web/API/RTCCertificateStats/fingerprint
page-type: web-api-instance-property
browser-compat: api.RTCStatsReport.type_certificate.fingerprint
---

{{APIRef("WebRTC")}}

Thuộc tính **`fingerprint`** của từ điển {{domxref("RTCCertificateStats")}} là một chuỗi chứa giá trị dấu vân tay của {{domxref("RTCCertificate")}} liên kết.

## Giá trị

Một chuỗi chứa dấu vân tay của chứng chỉ liên kết.

Đây là một chuỗi hex viết thường, được tính bằng hàm băm được chỉ định trong thuộc tính {{domxref("RTCCertificateStats.fingerprintAlgorithm","fingerprintAlgorithm")}}. Định dạng được định nghĩa chính xác hơn trong [RFC4572, Mục 5](https://www.rfc-editor.org/rfc/rfc4572#section-5).

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
