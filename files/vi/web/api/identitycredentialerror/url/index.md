---
title: "IdentityCredentialError: thuộc tính url"
short-title: url
slug: Web/API/IdentityCredentialError/url
page-type: web-api-instance-property
status:
  - experimental
browser-compat: api.IdentityCredentialError.url
---

{{APIRef("FedCM API")}}{{AvailableInWorkers}}{{SeeCompatTable}}

Thuộc tính chỉ đọc **`url`** của giao diện {{domxref("IdentityCredentialError")}} là URL trỏ đến thông tin mà người dùng có thể đọc được về lỗi để hiển thị cho người dùng, chẳng hạn như cách khắc phục lỗi hoặc liên hệ với dịch vụ khách hàng.

## Giá trị

Một chuỗi cho biết URL để biết thêm thông tin về lỗi.

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
