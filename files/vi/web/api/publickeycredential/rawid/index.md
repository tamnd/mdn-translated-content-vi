---
title: "PublicKeyCredential: thuộc tính rawId"
short-title: rawId
slug: Web/API/PublicKeyCredential/rawId
page-type: web-api-instance-property
browser-compat: api.PublicKeyCredential.rawId
---

{{APIRef("Web Authentication API")}}{{securecontext_header}}

Thuộc tính chỉ đọc **`rawId`** của
giao diện {{domxref("PublicKeyCredential")}} là một đối tượng {{jsxref("ArrayBuffer")}}
chứa định danh của thông tin xác thực.

Thuộc tính {{domxref("PublicKeyCredential.id")}} là phiên bản [được mã hóa base64url](/en-US/docs/Glossary/Base64) của định danh này.

> [!NOTE]
> Thuộc tính này chỉ có thể được sử dụng trong ngữ cảnh cấp cao nhất và
> sẽ không có sẵn trong một {{HTMLElement("iframe")}} chẳng hạn.

## Giá trị

Một {{jsxref("ArrayBuffer")}} chứa định danh của thông tin xác thực. Định danh này
được kỳ vọng là duy nhất toàn cầu và được chỉ định cho
`PublicKeyCredential` hiện tại và
{{domxref("AuthenticatorAssertionResponse")}} liên quan của nó.

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
    const rawId = pubKeyCredential.rawId;
    // Do something with rawId
  })
  .catch((err) => {
    // Deal with any error
  });
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
