---
title: "PublicKeyCredential: thuộc tính authenticatorAttachment"
short-title: authenticatorAttachment
slug: Web/API/PublicKeyCredential/authenticatorAttachment
page-type: web-api-instance-property
browser-compat: api.PublicKeyCredential.authenticatorAttachment
---

{{APIRef("Web Authentication API")}}{{securecontext_header}}

Thuộc tính chỉ đọc **`authenticatorAttachment`** của giao diện {{domxref("PublicKeyCredential")}} là một chuỗi cho biết danh mục chung của thiết bị xác thực được sử dụng trong cuộc gọi {{domxref("CredentialsContainer.create()","navigator.credentials.create()")}} hoặc {{domxref("CredentialsContainer.get()","navigator.credentials.get()")}} liên quan.

## Giá trị

Một chuỗi, là một trong các giá trị sau:

- `"platform"`
  - : Thiết bị xác thực là một phần của thiết bị mà WebAuthn đang chạy (được gọi là **thiết bị xác thực nền tảng**), do đó WebAuthn sẽ giao tiếp với nó bằng một phương thức truyền tải có sẵn cho nền tảng đó, chẳng hạn như API dành riêng cho nền tảng. Thông tin xác thực công khai được gắn với thiết bị xác thực nền tảng được gọi là **thông tin xác thực nền tảng**.
- `"cross-platform"`
  - : Thiết bị xác thực không phải là một phần của thiết bị mà WebAuthn đang chạy (được gọi là **thiết bị xác thực di động** vì nó có thể di chuyển giữa các thiết bị khác nhau), do đó WebAuthn sẽ giao tiếp với nó bằng giao thức truyền tải xuyên nền tảng như Bluetooth hoặc NFC. Thông tin xác thực công khai được gắn với thiết bị xác thực di động được gọi là **thông tin xác thực di động**.

## Ví dụ

```js
const options = {
  challenge: new Uint8Array(26) /* from the server */,
  rp: {
    name: "Example CORP",
    id: "login.example.com",
  },
  user: {
    id: new Uint8Array(26) /* To be changed for each user */,
    name: "canand@example.com",
    displayName: "Carina Anand",
  },
  pubKeyCredParams: [
    {
      type: "public-key",
      alg: -7,
    },
  ],
};

navigator.credentials
  .create({ publicKey: options })
  .then((pubKeyCredential) => {
    const attachment = pubKeyCredential.authenticatorAttachment;
    // Do something with authenticatorAttachment
  })
  .catch((err) => {
    // Deal with any error
  });
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
