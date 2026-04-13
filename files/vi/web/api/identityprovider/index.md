---
title: IdentityProvider
slug: Web/API/IdentityProvider
page-type: web-api-interface
status:
  - experimental
browser-compat: api.IdentityProvider
---

{{APIRef("FedCM API")}}{{SeeCompatTable}}{{SecureContext_Header}}

Giao diện **`IdentityProvider`** của [Federated Credential Management (FedCM) API](/en-US/docs/Web/API/FedCM_API) đại diện cho một {{glossary("Identity provider", "IdP")}} và cung cấp quyền truy cập vào thông tin và chức năng liên quan.

{{InheritanceDiagram}}

## Phương thức tĩnh

- {{domxref("IdentityProvider.close_static", "close()")}} {{experimental_inline}}
  - : Cung cấp tín hiệu thủ công cho trình duyệt rằng luồng đăng nhập IdP đã hoàn tất. Điều này cần thiết, ví dụ, để đóng hộp thoại đăng nhập IdP khi đăng nhập hoàn tất và IdP đã thu thập xong dữ liệu từ người dùng.
- {{domxref("IdentityProvider.getUserInfo_static", "getUserInfo()")}} {{experimental_inline}}
  - : Trả về thông tin về một người dùng đã đăng nhập trước đó khi họ quay lại IdP, có thể được sử dụng để hiển thị thông điệp chào mừng và nút đăng nhập được cá nhân hóa.

## Ví dụ

### Cách sử dụng cơ bản của `IdentityProvider.getUserInfo()`

Ví dụ sau đây minh họa cách phương thức {{domxref("IdentityProvider.getUserInfo_static", "getUserInfo()")}} có thể được sử dụng để trả về thông tin về người dùng đã đăng nhập trước đó từ một IdP cụ thể.

```js
// Iframe displaying a page from the https://idp.example origin
const userInfo = await IdentityProvider.getUserInfo({
  configURL: "https://idp.example/fedcm.json",
  clientId: "client1234",
});

// IdentityProvider.getUserInfo() returns an array of user information.
if (userInfo.length > 0) {
  // Returning accounts should be first, so the first account received
  // is guaranteed to be a returning account
  const name = userInfo[0].name;
  const givenName = userInfo[0].given_name;
  const displayName = givenName || name;
  const picture = userInfo[0].picture;
  const email = userInfo[0].email;

  // …

  // Render a personalized sign-in button using the information returned above
}
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Federated Credential Management API](https://developer.chrome.com/docs/identity/fedcm/overview) on developer.chrome.com (2023)
