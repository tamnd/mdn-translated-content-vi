---
title: IdentityCredential
slug: Web/API/IdentityCredential
page-type: web-api-interface
status:
  - experimental
browser-compat: api.IdentityCredential
---

{{APIRef("FedCM API")}}{{SeeCompatTable}}{{SecureContext_Header}}

Giao diện **`IdentityCredential`** của [API Quản lý Thông tin Xác thực Liên kết (FedCM)](/en-US/docs/Web/API/FedCM_API) đại diện cho thông tin xác thực danh tính người dùng phát sinh từ đăng nhập liên kết thành công.

Lệnh gọi {{domxref("CredentialsContainer.get", "navigator.credentials.get()")}} thành công bao gồm tùy chọn `identity` sẽ hoàn thành bằng một thực thể `IdentityCredential`.

{{InheritanceDiagram}}

## Thuộc tính phiên bản

_Kế thừa các thuộc tính từ tổ tiên, {{domxref("Credential")}}._

- {{domxref("IdentityCredential.configURL")}} {{ReadOnlyInline}} {{experimental_inline}}
  - : Một chuỗi chỉ định URL [tệp cấu hình](/en-US/docs/Web/API/FedCM_API/IDP_integration#provide_a_config_file_and_endpoints) của {{glossary("Identity provider", "IdP")}} được sử dụng để đăng nhập.
- {{domxref("IdentityCredential.isAutoSelected")}} {{ReadOnlyInline}} {{experimental_inline}}
  - : Giá trị boolean cho biết đăng nhập liên kết có được thực hiện bằng [xác thực lại tự động](/en-US/docs/Web/API/FedCM_API/RP_sign-in#auto-reauthentication) (tức là không có sự can thiệp của người dùng) hay không.
- {{domxref("IdentityCredential.token")}} {{experimental_inline}}
  - : Trả về token được sử dụng để xác thực đăng nhập liên kết.

## Phương thức tĩnh

- {{domxref("IdentityCredential.disconnect_static", "IdentityCredential.disconnect()")}} {{experimental_inline}}
  - : Ngắt kết nối tài khoản đăng nhập liên kết được sử dụng để lấy thông tin xác thực.

## Ví dụ

### Đăng nhập liên kết cơ bản

{{glossary("Relying party", "Các bên tin cậy")}} (RP) có thể gọi `navigator.credentials.get()` với tùy chọn `identity` để thực hiện yêu cầu đăng nhập vào RP thông qua nhà cung cấp danh tính (IdP), sử dụng liên kết danh tính. Một yêu cầu điển hình sẽ trông như thế này:

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
}
```

Nếu thành công, lệnh gọi này sẽ hoàn thành bằng một thực thể `IdentityCredential`. Từ đây, bạn có thể trả về giá trị {{domxref("IdentityCredential.token")}}, ví dụ:

```js
console.log(identityCredential.token);
```

Xem [API Quản lý Thông tin Xác thực Liên kết (FedCM)](/en-US/docs/Web/API/FedCM_API) để biết thêm chi tiết về cách thức hoạt động.

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Federated Credential Management API](https://developer.chrome.com/docs/identity/fedcm/overview)
