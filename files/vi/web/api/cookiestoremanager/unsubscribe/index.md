---
title: "CookieStoreManager: phương thức unsubscribe()"
short-title: unsubscribe()
slug: Web/API/CookieStoreManager/unsubscribe
page-type: web-api-instance-method
browser-compat: api.CookieStoreManager.unsubscribe
---

{{securecontext_header}}{{APIRef("Cookie Store API")}}{{AvailableInWorkers("window_and_service")}}

Phương thức **`unsubscribe()`** của giao diện {{domxref("CookieStoreManager")}} ngừng để {{domxref("ServiceWorkerRegistration")}} nhận các sự kiện đã đăng ký trước đó.

## Cú pháp

```js-nolint
unsubscribe(subscriptions)
```

### Tham số

- `subscriptions`
  - : Một danh sách đối tượng, mỗi đối tượng chứa:
    - `name`
      - : Một chuỗi chứa tên của cookie.
    - `url`
      - : Một chuỗi chứa URL của phạm vi được dùng để đăng ký với cookie này.

### Giá trị trả về

Một {{jsxref("Promise")}} được phân giải với {{jsxref("undefined")}} khi service worker đã được hủy đăng ký.

### Ngoại lệ

- {{jsxref("TypeError")}}
  - : Được ném ra nếu URL được truyền trong `subscriptions` không khớp với {{domxref("ServiceWorkerRegistration.scope","scope")}} của đăng ký service worker.

## Ví dụ

Trong ví dụ này, {{domxref("ServiceWorkerRegistration")}} được biểu diễn bởi `registration` hủy đăng ký nhận các sự kiện thay đổi trên cookie có tên `"cookie1"` với phạm vi là `"/path1"`.

```js
const subscriptions = [{ name: "cookie1", url: `/path1` }];
await registration.cookies.unsubscribe(subscriptions);
```

## Thông số kỹ thuật

{{Specifications}}

## Khả năng tương thích với trình duyệt

{{Compat}}
