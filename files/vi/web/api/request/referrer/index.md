---
title: "Request: thuộc tính referrer"
short-title: referrer
slug: Web/API/Request/referrer
page-type: web-api-instance-property
browser-compat: api.Request.referrer
---

{{APIRef("Fetch API")}}{{AvailableInWorkers}}

Thuộc tính chỉ đọc **`referrer`** của giao diện {{domxref("Request")}} được user agent đặt thành referrer của Request, ví dụ `client`, `no-referrer`, hoặc một URL.

> [!NOTE]
> Nếu giá trị của `referrer` là `no-referrer`,
> nó sẽ trả về một chuỗi rỗng.

## Giá trị

Một chuỗi biểu thị referrer của request.

## Ví dụ

Trong đoạn mã sau, chúng ta tạo một request mới bằng constructor {{domxref("Request.Request", "Request()")}} rồi lưu referrer của request vào một biến:

```js
const myRequest = new Request("flowers.jpg");
const myReferrer = myRequest.referrer; // returns "about:client" by default
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [ServiceWorker API](/en-US/docs/Web/API/Service_Worker_API)
- [HTTP access control (CORS)](/en-US/docs/Web/HTTP/Guides/CORS)
- [HTTP](/en-US/docs/Web/HTTP)
