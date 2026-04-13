---
title: "RTCCertificate: thuộc tính expires"
short-title: expires
slug: Web/API/RTCCertificate/expires
page-type: web-api-instance-property
browser-compat: api.RTCCertificate.expires
---

{{APIRef("WebRTC")}}

Thuộc tính chỉ đọc **`expires`** của giao diện {{domxref("RTCCertificate")}} trả về ngày hết hạn của chứng chỉ.

Theo mặc định, một chứng chỉ mới được cấu hình với `expires` được đặt thành giá trị 2592000000 mili giây, hay 30 ngày.
Thời gian hết hạn không được vượt quá 31536000000 mili giây, hay 365 ngày.
Cũng cần lưu ý rằng các trình duyệt có thể hạn chế thêm thời gian hết hạn của chứng chỉ nếu họ muốn.

## Giá trị

Một timestamp, được tính bằng [Unix time](/en-US/docs/Glossary/Unix_time) theo mili giây, chứa ngày hết hạn của chứng chỉ.

## Ví dụ

```js
RTCPeerConnection.generateCertificate({
  name: "RSASSA-PKCS1-v1_5",
  hash: "SHA-256",
  modulusLength: 2048,
  publicExponent: new Uint8Array([1, 0, 1]),
}).then((cert) => {
  const pc = new RTCPeerConnection({ certificates: [cert] });
  console.log(cert.expires); // 2592000000 (30 ngày, mặc định)
});
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("RTCPeerConnection.generateCertificate_static", "RTCPeerConnection.generateCertificate()")}}
