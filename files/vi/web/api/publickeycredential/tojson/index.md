---
title: "PublicKeyCredential: phương thức toJSON()"
short-title: toJSON()
slug: Web/API/PublicKeyCredential/toJSON
page-type: web-api-instance-method
browser-compat: api.PublicKeyCredential.toJSON
---

{{APIRef("Web Authentication API")}}{{securecontext_header}}

Phương thức **`toJSON()`** của giao diện {{domxref("PublicKeyCredential")}} trả về {{glossary("JSON type representation")}} của {{domxref("PublicKeyCredential")}}.

Các thuộc tính của đối tượng được trả về phụ thuộc vào việc thông tin xác thực được trả về bởi [`navigator.credentials.create()`](/en-US/docs/Web/API/CredentialsContainer/create) khi [tạo cặp khóa và đăng ký người dùng](/en-US/docs/Web/API/Web_Authentication_API#creating_a_key_pair_and_registering_a_user), hay [`navigator.credentials.get()`](/en-US/docs/Web/API/CredentialsContainer/get) khi [xác thực người dùng](/en-US/docs/Web/API/Web_Authentication_API#authenticating_a_user).

Phương thức này được tự động gọi khi code ứng dụng web gọi [`JSON.stringify()`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/JSON/stringify) để tuần tự hóa {{domxref("PublicKeyCredential")}} để có thể gửi đến máy chủ relying party khi đăng ký hoặc xác thực người dùng.
Phương thức này không có ý định được gọi trực tiếp trong code ứng dụng web.

## Cú pháp

```js-nolint
toJSON()
```

### Tham số

Không có.

### Giá trị trả về

{{glossary("JSON type representation")}} của đối tượng [`PublicKeyCredential`](/en-US/docs/Web/API/PublicKeyCredential).

Các thuộc tính được bao gồm phụ thuộc vào việc thông tin xác thực được trả về bởi [`navigator.credentials.create()`](/en-US/docs/Web/API/CredentialsContainer/create) khi đăng ký, hay [`navigator.credentials.get()`](/en-US/docs/Web/API/CredentialsContainer/get) khi xác thực người dùng.
Các giá trị và loại của các thuộc tính được bao gồm giống như của [`PublicKeyCredential`](/en-US/docs/Web/API/PublicKeyCredential), ngoại trừ các chuỗi được mã hóa [base64url](/en-US/docs/Glossary/Base64) được dùng thay cho các thuộc tính buffer.

Các thuộc tính của đối tượng là:

- `id`
  - : Giá trị được trả về bởi {{domxref("PublicKeyCredential.id")}}.
- `rawId`
  - : Phiên bản được mã hóa [base64url](/en-US/docs/Glossary/Base64) của {{domxref("PublicKeyCredential.rawId")}}.
- `authenticatorAttachment` {{optional_inline}}
  - : Giá trị được trả về bởi {{domxref("PublicKeyCredential.authenticatorAttachment")}}.
- `type`
  - : Chuỗi `"public-key"`.
- `clientExtensionResults`
  - : Một mảng chứa các phiên bản được mã hóa [base64url](/en-US/docs/Glossary/Base64) của các giá trị được trả về bởi {{domxref("PublicKeyCredential.getClientExtensionResults()")}}.
- `response`
  - : Đối tượng thuộc tính response phụ thuộc vào việc thông tin xác thực được trả về sau thao tác đăng ký hay xác thực.
    - Khi đăng ký người dùng mới, `response` sẽ là biểu diễn kiểu JSON của {{domxref("AuthenticatorAttestationResponse")}} trong đó các giá trị buffer đã được mã hóa [base64url](/en-US/docs/Glossary/Base64).

    - Khi xác thực người dùng, giá trị được trả về sẽ là phiên bản biểu diễn kiểu JSON của {{domxref("AuthenticatorAssertionResponse")}} trong đó các giá trị buffer đã được mã hóa [base64url](/en-US/docs/Glossary/Base64).

### Ngoại lệ

- `SecurityError` {{domxref("DOMException")}}
  - : Miền RP không hợp lệ.

## Ví dụ

Khi đăng ký người dùng mới, máy chủ relying party sẽ cung cấp thông tin về thông tin xác thực dự kiến cho ứng dụng web.
Ứng dụng web gọi [`navigator.credentials.create()`](/en-US/docs/Web/API/CredentialsContainer/create) với thông tin nhận đư��c (`createCredentialOptions` bên dưới), trả về một promise được thực hiện với thông tin xác thực mới (một {{domxref("PublicKeyCredential")}}).

```js
const newCredentialInfo = await navigator.credentials.create({
  createCredentialOptions,
});
```

Ứng dụng web sau đó tuần tự hóa thông tin xác thực được trả về bằng `JSON.stringify()` (gọi `toJSON()`) và đăng nó trở lại máy chủ.

```js
const registrationURL = "https://example.com/registration";
const apiRegOptsResp = await fetch(registrationURL, {
  method: "POST",
  headers: { "Content-Type": "application/json" },
  body: JSON.stringify(newCredentialInfo), // Calls newCredentialInfo.toJSON
});
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Web Authentication API](/en-US/docs/Web/API/Web_Authentication_API)
- {{domxref("PublicKeyCredential.parseCreationOptionsFromJSON_static", "PublicKeyCredential.parseCreationOptionsFromJSON()")}}
- {{domxref("PublicKeyCredential.parseRequestOptionsFromJSON_static", "PublicKeyCredential.parseRequestOptionsFromJSON()")}}
