---
title: "Request: thuộc tính redirect"
short-title: redirect
slug: Web/API/Request/redirect
page-type: web-api-instance-property
browser-compat: api.Request.redirect
---

{{APIRef("Fetch API")}}{{AvailableInWorkers}}

Thuộc tính chỉ đọc **`redirect`** của giao diện {{domxref("Request")}} chứa chế độ xử lý chuyển hướng.

## Giá trị

Một giá trị enum `RequestRedirect`, có thể là một trong các chuỗi sau:

- `follow`
- `error`
- `manual`

Nếu không được chỉ định khi request được tạo, nó sẽ nhận giá trị mặc định là `follow`.

## Ví dụ

Trong đoạn mã sau, chúng ta tạo một request mới bằng constructor {{domxref("Request.Request", "Request()")}} rồi lưu giá trị `redirect` của request vào một biến:

```js
const myRequest = new Request("flowers.jpg");
const myCred = myRequest.redirect;
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [ServiceWorker API](/en-US/docs/Web/API/Service_Worker_API)
- [HTTP access control (CORS)](/en-US/docs/Web/HTTP/Guides/CORS)
- [HTTP](/en-US/docs/Web/HTTP)
