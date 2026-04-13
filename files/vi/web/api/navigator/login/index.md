---
title: "Navigator: thuộc tính login"
short-title: login
slug: Web/API/Navigator/login
page-type: web-api-instance-property
browser-compat: api.Navigator.login
---

{{securecontext_header}}{{APIRef("FedCM API")}}

Thuộc tính chỉ đọc **`login`** của giao diện {{domxref("Navigator")}} cung cấp quyền truy cập vào đối tượng {{domxref("NavigatorLogin")}} của trình duyệt mà nhà cung cấp danh tính liên kết (IdP) có thể sử dụng để đặt trạng thái đăng nhập khi người dùng đăng nhập vào hoặc đăng xuất khỏi IdP.

Xem [Update login status using the Login Status API](/en-US/docs/Web/API/FedCM_API/IDP_integration#update_login_status_using_the_login_status_api) để biết thêm chi tiết về cách sử dụng tính năng này.

## Giá trị

Đối tượng {{domxref("NavigatorLogin")}}.

## Ví dụ

```js
/* Set logged-in status */
navigator.login.setStatus("logged-in");

/* Set logged-out status */
navigator.login.setStatus("logged-out");
```

## Thông số kỹ thuật

{{Specifications}}

## Khả năng tương thích của trình duyệt

{{Compat}}

## Xem thêm

- [Federated Credential Management (FedCM) API](/en-US/docs/Web/API/FedCM_API)
