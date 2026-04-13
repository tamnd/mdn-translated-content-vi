---
title: "IdentityCredential: isAutoSelected property"
short-title: isAutoSelected
slug: Web/API/IdentityCredential/isAutoSelected
page-type: web-api-instance-property
status:
  - experimental
browser-compat: api.IdentityCredential.isAutoSelected
---

{{securecontext_header}}{{APIRef("FedCM API")}}{{SeeCompatTable}}

Thuộc tính chỉ đọc **`isAutoSelected`** của giao diện {{domxref("IdentityCredential")}} cho biết đăng nhập liên kết có được thực hiện bằng [xác thực lại tự động](/en-US/docs/Web/API/FedCM_API/RP_sign-in#auto-reauthentication) (tức là không có sự can thiệp của người dùng) hay không.

Xác thực lại tự động có thể xảy ra khi lệnh gọi {{domxref("CredentialsContainer.get", "navigator.credentials.get()")}} được phát ra với giá trị tùy chọn [`mediation`](/en-US/docs/Web/API/CredentialsContainer/get#mediation) là `"optional"` hoặc `"silent"`.

## Giá trị

Giá trị boolean. `true` cho biết xác thực lại tự động đã được sử dụng; `false` cho biết không.

## Ví dụ

### Đăng nhập liên kết cơ bản và truy cập `isAutoSelected`

```js
async function signIn() {
  const identityCredential = await navigator.credentials.get({
    identity: {
      providers: [
        {
          configURL: "https://accounts.idp.example/config.json",
          clientId: "********",
        },
      ],
    },
    mediation: "optional", // this is the default
  });

  // isAutoSelected is true if auto-reauthentication occurred.
  const isAutoSelected = identityCredential.isAutoSelected;
}
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Federated Credential Management API](https://developer.chrome.com/docs/identity/fedcm/overview)
