---
title: "Request: thuộc tính bodyUsed"
short-title: bodyUsed
slug: Web/API/Request/bodyUsed
page-type: web-api-instance-property
browser-compat: api.Request.bodyUsed
---

{{APIRef("Fetch API")}}{{AvailableInWorkers}}

Thuộc tính chỉ đọc **`bodyUsed`** của giao diện {{domxref("Request")}} là một giá trị boolean cho biết body của request đã được đọc hay chưa.

## Giá trị

Một giá trị boolean.

## Ví dụ

```js
const request = new Request("/myEndpoint", {
  method: "POST",
  body: "Hello world",
});

request.bodyUsed; // false

request.text().then((bodyAsText) => {
  console.log(request.bodyUsed); // true
});
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("Request.body")}}
