---
title: "CookieStoreManager: phương thức getSubscriptions()"
short-title: getSubscriptions()
slug: Web/API/CookieStoreManager/getSubscriptions
page-type: web-api-instance-method
browser-compat: api.CookieStoreManager.getSubscriptions
---

{{securecontext_header}}{{APIRef("Cookie Store API")}}{{AvailableInWorkers("window_and_service")}}

Phương thức **`getSubscriptions()`** của giao diện {{domxref("CookieStoreManager")}} trả về danh sách tất cả các đăng ký thay đổi cookie cho {{domxref("ServiceWorkerRegistration")}} này.

## Cú pháp

```js-nolint
getSubscriptions()
```

### Tham số

Không có.

### Giá trị trả về

Một {{jsxref("Promise")}} được phân giải với một danh sách đối tượng, mỗi đối tượng chứa:

- `name`
  - : Một chuỗi chứa tên của cookie.
- `url`
  - : Một chuỗi chứa URL của phạm vi được dùng để đăng ký với cookie.

## Ví dụ

Nếu {{domxref("ServiceWorkerRegistration")}} được biểu diễn bởi `registration` đã đăng ký với bất kỳ sự kiện thay đổi cookie nào, `subscriptions` sẽ được phân giải thành một danh sách đối tượng chứa tên và URL của các cookie đó.

```js
const subscriptions = await self.registration.cookies.getSubscriptions();
```

## Thông số kỹ thuật

{{Specifications}}

## Khả năng tương thích với trình duyệt

{{Compat}}
