---
title: "PublicKeyCredential: thuộc tính id"
short-title: id
slug: Web/API/PublicKeyCredential/id
page-type: web-api-instance-property
browser-compat: api.PublicKeyCredential.id
---

{{APIRef("Web Authentication API")}}{{securecontext_header}}

Thuộc tính chỉ đọc **`id`** của
giao diện {{domxref("PublicKeyCredential")}} là một chuỗi, kế thừa
từ {{domxref("Credential")}}, đại diện cho định danh của phiên bản
`PublicKeyCredential` hiện tại.

Thuộc tính này là phiên bản [được mã hóa base64url](/en-US/docs/Glossary/Base64) của {{domxref("PublicKeyCredential.rawId")}}.

> [!NOTE]
> Thuộc tính này chỉ có thể được sử dụng trong ngữ cảnh cấp cao nhất và
> sẽ không có sẵn trong một {{HTMLElement("iframe")}} chẳng hạn.

## Giá trị

Một chuỗi là phiên bản [được mã hóa base64url](/en-US/docs/Glossary/Base64) của {{domxref("PublicKeyCredential.rawId")}}.

## Ví dụ

```js
const publicKey = {
  challenge: new Uint8Array(26) /* this actually is given from the server */,
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
  .create({ publicKey })
  .then((newCredentialInfo) => {
    const id = newCredentialInfo.id;
    // Do something with the id

    // send attestation response and client extensions
    // to the server to proceed with the registration
    // of the credential
  })
  .catch((err) => {
    console.error(err);
  });
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("Credential.id")}}
