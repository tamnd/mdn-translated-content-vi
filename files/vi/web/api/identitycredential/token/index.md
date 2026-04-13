---
title: "IdentityCredential: token property"
short-title: token
slug: Web/API/IdentityCredential/token
page-type: web-api-instance-property
status:
  - experimental
browser-compat: api.IdentityCredential.token
---

{{APIRef("FedCM API")}}{{SeeCompatTable}}{{SecureContext_Header}}

Thuộc tính chỉ đọc **`token`** của giao diện {{domxref("IdentityCredential")}} trả về token được sử dụng để xác thực đăng nhập liên kết.

API FedCM không xác định cấu trúc của đối tượng `token` hay RP nên làm gì với nó: điều này hoàn toàn phụ thuộc vào giao thức danh tính liên kết mà IdP thực hiện.

## Giá trị

Bất kỳ kiểu nào.

## Ví dụ

### Đăng nhập liên kết cơ bản và truy cập `token`

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

  console.log(identityCredential.token);
}
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Federated Credential Management API](https://developer.chrome.com/docs/identity/fedcm/overview)
