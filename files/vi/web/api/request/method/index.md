---
title: "Request: thuộc tính method"
short-title: method
slug: Web/API/Request/method
page-type: web-api-instance-property
browser-compat: api.Request.method
---

{{APIRef("Fetch API")}}{{AvailableInWorkers}}

Thuộc tính chỉ đọc **`method`** của giao diện {{domxref("Request")}} chứa phương thức của request (`GET`, `POST`, v.v.).

## Giá trị

Một {{jsxref("String")}} biểu thị phương thức của request.

## Ví dụ

Trong đoạn mã sau, chúng ta tạo một request mới bằng constructor {{domxref("Request.Request", "Request()")}} rồi lưu phương thức của request vào một biến:

```js
const myRequest = new Request("flowers.jpg");
const myMethod = myRequest.method; // GET
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [ServiceWorker API](/en-US/docs/Web/API/Service_Worker_API)
- [HTTP access control (CORS)](/en-US/docs/Web/HTTP/Guides/CORS)
- [HTTP](/en-US/docs/Web/HTTP)
