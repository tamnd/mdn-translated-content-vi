---
title: NavigatorLogin
slug: Web/API/NavigatorLogin
page-type: web-api-interface
browser-compat: api.NavigatorLogin
---

{{securecontext_header}}{{APIRef("FedCM API")}}

Giao diện **`NavigatorLogin`** của [Federated Credential Management (FedCM) API](/en-US/docs/Web/API/FedCM_API) định nghĩa chức năng đăng nhập cho các nhà cung cấp danh tính liên kết (IdP). Cụ thể, nó cho phép nhà cung cấp danh tính liên kết (IdP) đặt trạng thái đăng nhập khi người dùng đăng nhập hoặc đăng xuất khỏi IdP.

Xem [Cập nhật trạng thái đăng nhập bằng Login Status API](/en-US/docs/Web/API/FedCM_API/IDP_integration#update_login_status_using_the_login_status_api) để biết thêm chi tiết về cách sử dụng.

`NavigatorLogin` được truy cập thông qua thuộc tính {{domxref("Navigator.login")}}.

{{InheritanceDiagram}}

## Phương thức phiên bản

- {{domxref("NavigatorLogin.setStatus", "setStatus()")}}
  - : Đặt trạng thái đăng nhập của nhà cung cấp danh tính liên kết (IdP), khi được gọi từ origin của IdP. Theo "trạng thái đăng nhập", chúng ta có nghĩa là "liệu có người dùng nào đăng nhập vào IdP trên trình duyệt hiện tại hay không".

## Ví dụ

```js
/* Set logged-in status */
navigator.login.setStatus("logged-in");

/* Set logged-out status */
navigator.login.setStatus("logged-out");
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Federated Credential Management (FedCM) API](/en-US/docs/Web/API/FedCM_API)
