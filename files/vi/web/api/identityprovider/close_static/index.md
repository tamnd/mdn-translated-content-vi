---
title: "IdentityProvider: close() static method"
short-title: close()
slug: Web/API/IdentityProvider/close_static
page-type: web-api-static-method
status:
  - experimental
browser-compat: api.IdentityProvider.close_static
---

{{securecontext_header}}{{APIRef("FedCM API")}}{{SeeCompatTable}}

Phương thức tĩnh **`close()`** của giao diện {{domxref("IdentityProvider")}} cung cấp tín hiệu thủ công cho trình duyệt rằng luồng đăng nhập {{glossary("Identity provider", "IdP")}} đã hoàn tất.

`close()` cần được gọi từ cùng origin với hộp thoại đăng nhập của IdP được chỉ định, như được định nghĩa trong [cấu hình IdP](/en-US/docs/Web/API/FedCM_API/IDP_integration#provide_a_config_file_and_endpoints).

`close()` được dùng để đóng hộp thoại đăng nhập IdP khi đăng nhập hoàn tất và IdP đã thu thập xong dữ liệu từ người dùng. Một trường hợp sử dụng chính cho `close()` là đóng hộp thoại đăng nhập IdP trong các trường hợp [trạng thái đăng nhập của trình duyệt và IdP không đồng bộ](/en-US/docs/Web/API/FedCM_API/IDP_integration#what_if_the_browser_and_the_idp_login_status_become_out_of_sync), và trình duyệt khởi tạo luồng đăng nhập động để khắc phục vấn đề.

## Cú pháp

```js-nolint
IdentityProvider.close()
```

### Tham số

Không có.

### Giá trị trả về

`undefined`.

## Ví dụ

### Cách sử dụng cơ bản của `IdentityProvider.close()`

```js
IdentityProvider.close();
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Federated Credential Management API](https://developer.chrome.com/docs/identity/fedcm/overview) on developer.chrome.com (2023)
