---
title: "Request: thuộc tính body"
short-title: body
slug: Web/API/Request/body
page-type: web-api-instance-property
browser-compat: api.Request.body
---

{{APIRef("Fetch API")}}{{AvailableInWorkers}}

Thuộc tính chỉ đọc **`body`** của giao diện {{domxref("Request")}} chứa một {{domxref("ReadableStream")}} với nội dung body đã được thêm vào request. Lưu ý rằng request dùng phương thức `GET` hoặc `HEAD` không thể có body và trong các trường hợp này sẽ trả về `null`.

## Giá trị

Một {{domxref("ReadableStream")}} hoặc [`null`](/en-US/docs/Web/JavaScript/Reference/Operators/null).

## Ví dụ

```js
const request = new Request("/myEndpoint", {
  method: "POST",
  body: "Hello world",
});

request.body; // ReadableStream
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("Request.bodyUsed")}}
