---
title: "Request: thuộc tính referrerPolicy"
short-title: referrerPolicy
slug: Web/API/Request/referrerPolicy
page-type: web-api-instance-property
browser-compat: api.Request.referrerPolicy
---

{{APIRef("Fetch API")}}{{AvailableInWorkers}}

Thuộc tính chỉ đọc **`referrerPolicy`** của giao diện {{domxref("Request")}} trả về chính sách referrer, tức là cơ chế quy định thông tin referrer nào, được gửi trong header {{HTTPHeader("Referer")}}, sẽ được bao gồm cùng request.

## Giá trị

Một chuỗi biểu thị `referrerPolicy` của request. Để biết thêm thông tin và các giá trị có thể có, xem trang header HTTP {{HTTPHeader("Referrer-Policy")}}.

## Ví dụ

Trong đoạn mã sau, chúng ta tạo một request mới bằng constructor {{domxref("Request.Request", "Request()")}} rồi lưu referrer policy của request vào một biến:

```js
const myRequest = new Request("flowers.jpg");
const myReferrer = myRequest.referrerPolicy; // returns "" by default
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [ServiceWorker API](/en-US/docs/Web/API/Service_Worker_API)
- [HTTP access control (CORS)](/en-US/docs/Web/HTTP/Guides/CORS)
- [HTTP](/en-US/docs/Web/HTTP)
