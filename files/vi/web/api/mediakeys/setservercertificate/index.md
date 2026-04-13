---
title: MediaKeys.setServerCertificate()
slug: Web/API/MediaKeys/setServerCertificate
page-type: web-api-instance-method
browser-compat: api.MediaKeys.setServerCertificate
---

{{APIRef("Encrypted Media Extensions")}}{{SecureContext_Header}}

Phương thức **`setServerCertificate()`** của giao diện {{domxref("MediaKeys")}} cung cấp cho hệ thống CDM (Content Decryption Module) chứng chỉ máy chủ để mã hóa các tin nhắn cho máy chủ giấy phép đó.

## Cú pháp

```js-nolint
setServerCertificate(serverCertificate)
```

### Tham số

- `serverCertificate`
  - : Đối tượng {{jsxref("ArrayBuffer")}}, {{jsxref("TypedArray")}} hoặc {{jsxref("DataView")}} chứa chứng chỉ máy chủ. Định dạng của chứng chỉ là dành riêng cho hệ thống key.

### Giá trị trả về

{{jsxref("Promise")}} thực hiện với giá trị boolean. Trả về `true` nếu CDM sử dụng chứng chỉ máy chủ; trả về `false` nếu CDM không hỗ trợ chứng chỉ máy chủ.

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
