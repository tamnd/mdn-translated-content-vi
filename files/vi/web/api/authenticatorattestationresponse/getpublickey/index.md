---
title: "AuthenticatorAttestationResponse: phương thức getPublicKey()"
short-title: getPublicKey()
slug: Web/API/AuthenticatorAttestationResponse/getPublicKey
page-type: web-api-instance-method
browser-compat: api.AuthenticatorAttestationResponse.getPublicKey
---

{{APIRef("Web Authentication API")}}{{securecontext_header}}

Phương thức **`getPublicKey()`** của giao diện {{domxref("AuthenticatorAttestationResponse")}} trả về một {{jsxref("ArrayBuffer")}} chứa `SubjectPublicKeyInfo` dạng DER của thông tin xác thực mới (xem [Subject Public Key Info](https://www.rfc-editor.org/rfc/rfc5280#section-4.1.2.7)), hoặc `null` nếu không có sẵn.

Đây là một hàm tiện ích được tạo ra để cho phép truy cập dễ dàng vào khóa công khai. Khóa này sẽ cần được lưu lại để xác minh các thao tác xác thực trong tương lai (tức là dùng {{domxref("CredentialsContainer.get()","navigator.credentials.get()")}}).

## Cú pháp

```js-nolint
getPublicKey()
```

### Tham số

Không có.

### Giá trị trả về

Một {{jsxref("ArrayBuffer")}} chứa `SubjectPublicKeyInfo` dạng DER của thông tin xác thực mới (xem [Subject Public Key Info](https://www.rfc-editor.org/rfc/rfc5280#section-4.1.2.7)), hoặc `null` nếu không có sẵn.

## Ví dụ

Xem [Creating a public key credential](/en-US/docs/Web/API/CredentialsContainer/create#creating_a_public_key_credential) để có ví dụ chi tiết.

## Thông số kỹ thuật

{{Specifications}}

## Khả năng tương thích với trình duyệt

{{Compat}}
