---
title: CookieStoreManager
slug: Web/API/CookieStoreManager
page-type: web-api-interface
browser-compat: api.CookieStoreManager
---

{{securecontext_header}}{{APIRef("Cookie Store API")}}{{AvailableInWorkers("window_and_service")}}

Giao diện **`CookieStoreManager`** của {{domxref("Cookie Store API", "", "", "nocode")}} cho phép service worker đăng ký nhận các sự kiện thay đổi cookie. Hãy gọi {{domxref("CookieStoreManager.subscribe()","subscribe()")}} trên một đăng ký service worker cụ thể để nhận các sự kiện thay đổi.

Một `CookieStoreManager` được liên kết với một {{domxref("ServiceWorkerRegistration")}}. Mỗi đăng ký service worker có một danh sách đăng ký thay đổi cookie, là danh sách các đăng ký thay đổi cookie mà mỗi đăng ký chứa một tên và URL. Các phương thức trong giao diện này cho phép service worker thêm và xóa các đăng ký khỏi danh sách này, cũng như lấy danh sách toàn bộ các đăng ký.

Để lấy một `CookieStoreManager`, hãy gọi {{domxref("ServiceWorkerRegistration.cookies")}}.

## Phương thức thể hiện

- {{domxref("CookieStoreManager.getSubscriptions()")}}
  - : Trả về một {{jsxref("Promise")}} phân giải thành danh sách các đăng ký thay đổi cookie cho đăng ký service worker này.
- {{domxref("CookieStoreManager.subscribe()")}}
  - : Đăng ký nhận các thay đổi đối với cookie. Phương thức này trả về một {{jsxref("Promise")}} được phân giải khi việc đăng ký thành công.
- {{domxref("CookieStoreManager.unsubscribe()")}}
  - : Hủy đăng ký service worker đã đăng ký khỏi các thay đổi đối với cookie. Phương thức này trả về một {{jsxref("Promise")}} được phân giải khi thao tác thành công.

## Ví dụ

Trong ví dụ này, {{domxref("ServiceWorkerRegistration")}} được biểu diễn bởi `registration` đăng ký nhận các sự kiện thay đổi trên cookie có tên `"cookie1"` với phạm vi là `"/path1"`.

```js
const subscriptions = [{ name: "cookie1", url: `/path1` }];
await registration.cookies.subscribe(subscriptions);
```

Nếu {{domxref("ServiceWorkerRegistration")}} đã đăng ký với bất kỳ cookie nào, thì {{domxref("CookieStoreManager.getSubscriptions()","getSubscriptions()")}} sẽ trả về một danh sách cookie được biểu diễn bằng các đối tượng có cùng định dạng như khi dùng cho lần đăng ký ban đầu.

```js
const subscriptions = await self.registration.cookies.getSubscriptions();
```

## Thông số kỹ thuật

{{Specifications}}

## Khả năng tương thích với trình duyệt

{{Compat}}
