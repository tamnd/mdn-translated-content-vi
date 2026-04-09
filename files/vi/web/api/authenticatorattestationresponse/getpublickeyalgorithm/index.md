---
title: "AuthenticatorAttestationResponse: phương thức getPublicKeyAlgorithm()"
short-title: getPublicKeyAlgorithm()
slug: Web/API/AuthenticatorAttestationResponse/getPublicKeyAlgorithm
page-type: web-api-instance-method
browser-compat: api.AuthenticatorAttestationResponse.getPublicKeyAlgorithm
---

{{APIRef("Web Authentication API")}}{{securecontext_header}}

Phương thức **`getPublicKeyAlgorithm()`** của giao diện {{domxref("AuthenticatorAttestationResponse")}} trả về một số bằng với một [COSE Algorithm Identifier](https://www.iana.org/assignments/cose/cose.xhtml#algorithms), biểu thị thuật toán mật mã được dùng cho thông tin xác thực mới.

Đây là một hàm tiện ích được tạo ra để cho phép truy cập dễ dàng vào kiểu thuật toán. Thông tin này sẽ cần được lưu lại để xác minh các thao tác xác thực trong tương lai (tức là dùng {{domxref("CredentialsContainer.get()","navigator.credentials.get()")}}).

## Cú pháp

```js-nolint
getPublicKeyAlgorithm()
```

### Tham số

Không có.

### Giá trị trả về

Một số bằng với một [COSE Algorithm Identifier](https://www.iana.org/assignments/cose/cose.xhtml#algorithms), biểu thị thuật toán mật mã được dùng cho thông tin xác thực mới.

## Ví dụ

Xem [Creating a public key credential](/en-US/docs/Web/API/CredentialsContainer/create#creating_a_public_key_credential) để có ví dụ chi tiết.

## Thông số kỹ thuật

{{Specifications}}

## Khả năng tương thích với trình duyệt

{{Compat}}
