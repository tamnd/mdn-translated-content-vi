---
title: "Request: thuộc tính url"
short-title: url
slug: Web/API/Request/url
page-type: web-api-instance-property
browser-compat: api.Request.url
---

{{APIRef("Fetch API")}}{{AvailableInWorkers}}

Thuộc tính chỉ đọc **`url`** của giao diện {{domxref("Request")}} chứa URL của request.

## Giá trị

Một chuỗi biểu thị URL của request.

## Ví dụ

Trong đoạn mã sau, chúng ta tạo một request mới bằng constructor {{domxref("Request.Request", "Request()")}} rồi lưu URL của request vào một biến:

```js
const myRequest = new Request("flowers.jpg");
const myURL = myRequest.url; // "https://github.com/mdn/dom-examples/tree/main/fetch/fetch-request/flowers.jpg"
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [ServiceWorker API](/en-US/docs/Web/API/Service_Worker_API)
- [HTTP access control (CORS)](/en-US/docs/Web/HTTP/Guides/CORS)
- [HTTP](/en-US/docs/Web/HTTP)
