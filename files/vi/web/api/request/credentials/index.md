---
title: "Request: thuộc tính credentials"
short-title: credentials
slug: Web/API/Request/credentials
page-type: web-api-instance-property
browser-compat: api.Request.credentials
---

{{APIRef("Fetch API")}}{{AvailableInWorkers}}

Thuộc tính chỉ đọc **`credentials`** của giao diện {{domxref("Request")}} chứa chế độ credentials của request.

## Giá trị

Một giá trị `RequestCredentials`. Các giá trị khả dụng là:

- `omit`
  - : Credentials sẽ không bao giờ được gửi hoặc nhận.
- `same-origin`
  - : Credentials sẽ chỉ được gửi đến cùng origin với URL đích.
- `include`
  - : Credentials luôn được gửi, kể cả với request cross-origin.

## Ví dụ

```js
const myRequest = new Request("flowers.jpg");
const myCred = myRequest.credentials; // "same-origin" theo mặc định
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [ServiceWorker API](/en-US/docs/Web/API/Service_Worker_API)
- [HTTP access control (CORS)](/en-US/docs/Web/HTTP/Guides/CORS)
- [HTTP](/en-US/docs/Web/HTTP)
