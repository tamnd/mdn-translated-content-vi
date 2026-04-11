---
title: "RTCTransportStats: thuộc tính srtpCipher"
short-title: srtpCipher
slug: Web/API/RTCTransportStats/srtpCipher
page-type: web-api-instance-property
browser-compat: api.RTCStatsReport.type_transport.srtpCipher
---

{{APIRef("WebRTC")}}

Thuộc tính **`srtpCipher`** của từ điển {{domxref("RTCTransportStats")}} chỉ ra tên mô tả của protection profile được sử dụng cho transport [Secure Real-time Transport Protocol (SRTP)](/en-US/docs/Glossary/RTP).

## Giá trị

Một chuỗi chỉ ra tên mô tả của SRTP protection profile.

Các giá trị được xác định trong cột "Profile" của [sổ đăng ký DTLS-SRTP protection profile IANA](https://www.iana.org/assignments/srtp-protection/srtp-protection.xhtml#srtp-protection-1) và {{rfc("5764","", "4.1.2")}}.

## Ví dụ

### SRTP_AES128_CM_HMAC_SHA1_80

`"SRTP_AES128_CM_HMAC_SHA1_80"` là tên mô tả của profile sau, trong đó `maximum_lifetime` là số lượng gói tin tối đa có thể được bảo vệ bởi một bộ khóa duy nhất.

```plain
SRTP_AES128_CM_HMAC_SHA1_80
cipher: AES_128_CM
cipher_key_length: 128
cipher_salt_length: 112
maximum_lifetime: 2^31
auth_function: HMAC-SHA1
auth_key_length: 160
auth_tag_length: 80
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
