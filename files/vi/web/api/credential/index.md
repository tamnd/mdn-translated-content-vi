---
title: Credential
slug: Web/API/Credential
page-type: web-api-interface
browser-compat: api.Credential
---

{{APIRef("Credential Management API")}}{{securecontext_header}}

Giao diện **`Credential`** của [Credential Management API](/en-US/docs/Web/API/Credential_Management_API) cung cấp thông tin về một thực thể (thường là người dùng), thường như một điều kiện tiên quyết để đưa ra quyết định về mức độ tin cậy.

Các đối tượng `Credential` có thể thuộc các kiểu sau:

- {{domxref("FederatedCredential")}}
- {{domxref("IdentityCredential")}}
- {{domxref("PasswordCredential")}}
- {{domxref("PublicKeyCredential")}}
- {{domxref("OTPCredential")}}

## Thuộc tính thể hiện

- {{domxref("Credential.id")}} {{ReadOnlyInline}}
  - : Trả về một chuỗi chứa định danh của thông tin xác thực. Đây có thể là GUID, tên người dùng hoặc địa chỉ email.
- {{domxref("Credential.type")}} {{ReadOnlyInline}}
  - : Trả về một chuỗi chứa kiểu của thông tin xác thực. Các giá trị hợp lệ là `password`, `federated`, `public-key`, `identity` và `otp`. (Dành cho {{domxref("PasswordCredential")}}, {{domxref("FederatedCredential")}}, {{domxref("PublicKeyCredential")}}, {{domxref("IdentityCredential")}} và {{domxref("OTPCredential")}})

## Phương thức tĩnh

- {{domxref("Credential.isConditionalMediationAvailable_static", "Credential.isConditionalMediationAvailable()")}} {{experimental_inline}}
  - : Trả về một {{jsxref("Promise")}} luôn được giải quyết thành `false`. Các lớp con có thể ghi đè giá trị này.

## Ví dụ

```js
const pwdCredential = new PasswordCredential({
  id: "example-username", // Tên người dùng/ID
  name: "Carina Anand", // Tên hiển thị
  password: "correct horse battery staple", // Mật khẩu
});

console.assert(pwdCredential.type === "password");
```

## Thông số kỹ thuật

{{Specifications}}

## Khả năng tương thích của trình duyệt

{{Compat}}
