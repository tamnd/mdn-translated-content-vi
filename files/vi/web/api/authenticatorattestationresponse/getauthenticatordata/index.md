---
title: "AuthenticatorAttestationResponse: phương thức getAuthenticatorData()"
short-title: getAuthenticatorData()
slug: Web/API/AuthenticatorAttestationResponse/getAuthenticatorData
page-type: web-api-instance-method
browser-compat: api.AuthenticatorAttestationResponse.getAuthenticatorData
---

{{APIRef("Web Authentication API")}}{{securecontext_header}}

Phương thức **`getAuthenticatorData()`** của giao diện {{domxref("AuthenticatorAttestationResponse")}} trả về một {{jsxref("ArrayBuffer")}} chứa dữ liệu authenticator nằm trong thuộc tính {{domxref("AuthenticatorAttestationResponse.attestationObject")}}.

Đây là một hàm tiện ích, được tạo ra để cho phép truy cập dễ dàng vào dữ liệu authenticator mà không cần viết thêm mã phân tích để trích xuất nó từ `attestationObject`.

## Cú pháp

```js-nolint
getAuthenticatorData()
```

### Tham số

Không có.

### Giá trị trả về

Một {{jsxref("ArrayBuffer")}} có {{jsxref("ArrayBuffer.byteLength", "byteLength")}} ít nhất là 37 byte, chứa cấu trúc dữ liệu được giải thích trong [Authenticator data](/en-US/docs/Web/API/Web_Authentication_API/Authenticator_data).

Giá trị này sẽ tương đương với dữ liệu authenticator chứa trong thuộc tính {{domxref("AuthenticatorAttestationResponse.attestationObject")}}.

## Ví dụ

Xem [Creating a public key credential](/en-US/docs/Web/API/CredentialsContainer/create#creating_a_public_key_credential) để có ví dụ chi tiết.

## Thông số kỹ thuật

{{Specifications}}

## Khả năng tương thích với trình duyệt

{{Compat}}
