---
title: "IdentityCredentialError: thuộc tính error"
short-title: error
slug: Web/API/IdentityCredentialError/error
page-type: web-api-instance-property
status:
  - experimental
browser-compat: api.IdentityCredentialError.error
---

{{APIRef("FedCM API")}}{{AvailableInWorkers}}{{SeeCompatTable}}

Thuộc tính chỉ đọc **`error`** của giao diện {{domxref("IdentityCredentialError")}} là một trong các giá trị được liệt kê trong [danh sách lỗi được chỉ định bởi OAuth 2.0](https://datatracker.ietf.org/doc/html/rfc6749#section-4.1.2.1) hoặc một chuỗi tùy ý cung cấp thêm thông tin về lỗi.

## Giá trị

Một trong các giá trị được liệt kê trong [danh sách lỗi được chỉ định bởi OAuth 2.0](https://datatracker.ietf.org/doc/html/rfc6749#section-4.1.2.1) hoặc một chuỗi tùy ý.

## Ví dụ

```js
try {
  const cred = await navigator.credentials.get({
    identity: {
      providers: [
        {
          configURL: "https://idp.example/manifest.json",
          clientId: "1234",
        },
      ],
    },
  });
} catch (e) {
  const error = e.error;
  const url = e.url;
}
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("CredentialsContainer.get()")}}
- [Phản hồi lỗi ID assertion](/en-US/docs/Web/API/FedCM_API/IDP_integration#id_assertion_error_responses)
