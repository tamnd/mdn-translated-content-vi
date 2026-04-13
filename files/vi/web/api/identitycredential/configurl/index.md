---
title: "IdentityCredential: configURL property"
short-title: configURL
slug: Web/API/IdentityCredential/configURL
page-type: web-api-instance-property
status:
  - experimental
browser-compat: api.IdentityCredential.configURL
---

{{APIRef("FedCM API")}}{{SeeCompatTable}}{{SecureContext_Header}}

Thuộc tính chỉ đọc **`configURL`** của giao diện {{domxref("IdentityCredential")}} trả về một chuỗi chỉ định URL tệp cấu hình của {{glossary("Identity provider", "nhà cung cấp danh tính")}} (IdP) được sử dụng để đăng nhập.

Xem [Cung cấp tệp cấu hình](/en-US/docs/Web/API/FedCM_API/IDP_integration#provide_a_config_file_and_endpoints) để biết thêm thông tin.

## Giá trị

Một chuỗi.

## Ví dụ

### Đăng nhập liên kết cơ bản và truy cập `configURL`

{{glossary("Relying party", "Các bên tin cậy")}} (RP) có thể gọi `navigator.credentials.get()` với tùy chọn `identity` để thực hiện yêu cầu đăng nhập:

```js
async function signIn() {
  const identityCredential = await navigator.credentials.get({
    identity: {
      providers: [
        {
          configURL: "https://accounts.idp.example/config.json",
          clientId: "********",
          params: {
            /* IdP-specific parameters */
          },
        },
      ],
    },
  });

  console.log(identityCredential.configURL);
}
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Federated Credential Management API](https://developer.chrome.com/docs/identity/fedcm/overview)
