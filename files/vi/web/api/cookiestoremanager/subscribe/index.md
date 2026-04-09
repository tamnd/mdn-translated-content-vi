---
title: "CookieStoreManager: phương thức subscribe()"
short-title: subscribe()
slug: Web/API/CookieStoreManager/subscribe
page-type: web-api-instance-method
browser-compat: api.CookieStoreManager.subscribe
---

{{securecontext_header}}{{APIRef("Cookie Store API")}}{{AvailableInWorkers("window_and_service")}}

Phương thức **`subscribe()`** của giao diện {{domxref("CookieStoreManager")}} đăng ký cho một {{domxref("ServiceWorkerRegistration")}} nhận các sự kiện thay đổi cookie.

## Cú pháp

```js-nolint
subscribe(subscriptions)
```

### Tham số

- `subscriptions`
  - : Một mảng đối tượng, trong đó mỗi đối tượng có các thuộc tính sau:
    - `name`
      - : Một chuỗi chứa tên của cookie.
    - `url`
      - : Một chuỗi chứa URL của phạm vi cookie. Phạm vi này có thể hẹp hơn phạm vi của đăng ký service worker.

### Giá trị trả về

Một {{jsxref("Promise")}} được phân giải với {{jsxref("undefined")}} khi việc đăng ký hoàn tất.

### Ngoại lệ

- {{jsxref("TypeError")}}
  - : Được ném ra nếu URL được truyền trong `subscriptions` không khớp với {{domxref("ServiceWorkerRegistration.scope","scope")}} của đăng ký service worker.

## Ví dụ

Trong ví dụ này, {{domxref("ServiceWorkerRegistration")}} được biểu diễn bởi `registration` đăng ký nhận các sự kiện thay đổi trên cookie có tên `"cookie1"` với phạm vi là `"/path1"`.

```js
const subscriptions = [{ name: "cookie1", url: `/path1` }];
await registration.cookies.subscribe(subscriptions);
```

URL được truyền cho phương thức `subscribe()` có thể hẹp hơn phạm vi đăng ký service worker. Trong ví dụ sau, đăng ký áp dụng cho `/path/one/`, nên nó sẽ nhận được sự kiện thay đổi cho thay đổi trên cookie thứ nhất, nhưng không nhận được cho cookie thứ hai.

```js
registration.cookies.subscribe([{ name: "cookie1", url: "/path/one/" }]); // đăng ký
cookieStore.set({ name: "cookie1", value: "cookie-value", path: "/path/one/" }); // nhận được sự kiện thay đổi
cookieStore.set({ name: "cookie1", value: "cookie-value", path: "/path/two/" }); // không nhận được sự kiện thay đổi
```

## Thông số kỹ thuật

{{Specifications}}

## Khả năng tương thích với trình duyệt

{{Compat}}
