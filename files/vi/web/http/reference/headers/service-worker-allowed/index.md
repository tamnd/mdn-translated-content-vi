---
title: Service-Worker-Allowed header
short-title: Service-Worker-Allowed
slug: Web/HTTP/Reference/Headers/Service-Worker-Allowed
page-type: http-header
browser-compat: http.headers.Service-Worker-Allowed
sidebar: http
---

Tiêu đề HTTP **`Service-Worker-Allowed`** {{Glossary("response header")}} được sử dụng để mở rộng hạn chế đường dẫn cho `scope` mặc định của service worker.

Theo mặc định, [`scope`](/en-US/docs/Web/API/ServiceWorkerContainer/register#scope) của một đăng ký service worker là thư mục nơi script service worker đặt.
Ví dụ: nếu script `sw.js` nằm tại `/js/sw.js`, theo mặc định nó chỉ có thể kiểm soát các URL dưới `/js/`.
Máy chủ có thể sử dụng tiêu đề `Service-Worker-Allowed` để cho phép service worker kiểm soát các URL bên ngoài thư mục của nó.

Service worker chặn tất cả các yêu cầu mạng trong phạm vi của nó, vì vậy bạn nên tránh sử dụng phạm vi quá rộng trừ khi cần thiết.

<table class="properties">
  <tbody>
    <tr>
      <th scope="row">Loại tiêu đề</th>
      <td>{{Glossary("Response header")}}</td>
    </tr>
  </tbody>
</table>

## Cú pháp

```http
Service-Worker-Allowed: <scope>
```

## Chỉ thị

- `<scope>`
  - : Chuỗi đại diện cho URL xác định phạm vi đăng ký của service worker; tức là phạm vi URL mà service worker có thể kiểm soát.

## Ví dụ

### Sử dụng Service-Worker-Allowed để mở rộng phạm vi service worker

Ví dụ JavaScript dưới đây được bao gồm trong `example.com/product/index.html`, và cố gắng [đăng ký](/en-US/docs/Web/API/ServiceWorkerContainer/register) service worker với phạm vi áp dụng cho tất cả tài nguyên dưới `example.com/`.

```js
navigator.serviceWorker.register("./sw.js", { scope: "/" }).then(
  (registration) => {
    console.log("Install succeeded, scoped to '/'", registration);
  },
  (error) => {
    console.error(`Service worker registration failed: ${error}`);
  },
);
```

Phản hồi HTTP cho yêu cầu tài nguyên script của service worker (`./sw.js`) bao gồm tiêu đề `Service-Worker-Allowed` được đặt thành `/`:

```http
HTTP/1.1 200 OK
Date: Mon, 16 Dec 2024 14:37:20 GMT
Service-Worker-Allowed: /

// sw.js contents…
```

Nếu máy chủ không đặt tiêu đề, việc đăng ký service worker sẽ thất bại, vì tùy chọn `scope` (`{ scope: "/" }`) yêu cầu phạm vi rộng hơn thư mục nơi script service worker đặt (`/product/sw.js`).

## Đặc tả

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- Tiêu đề {{HTTPHeader("Service-Worker")}}
- [Service worker API](/en-US/docs/Web/API/Service_Worker_API)
- {{domxref("ServiceWorkerRegistration")}}
- [Tại sao service worker của tôi không đăng ký được](/en-US/docs/Web/API/Service_Worker_API/Using_Service_Workers#why_is_my_service_worker_failing_to_register) trong _Sử dụng Service Workers_.
