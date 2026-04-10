---
title: "Request: thuộc tính destination"
short-title: destination
slug: Web/API/Request/destination
page-type: web-api-instance-property
browser-compat: api.Request.destination
---

{{APIRef("Fetch API")}}{{AvailableInWorkers}}

Thuộc tính chỉ đọc **`destination`** của giao diện {{domxref("Request")}} chứa chuỗi mô tả loại nội dung đang được yêu cầu.

## Giá trị

Chuỗi mô tả đích của request, ví dụ `image`, `script`, `style`, `document`, hoặc chuỗi rỗng nếu không xác định.

## Ví dụ

```js
const myRequest = new Request("flowers.jpg");
const myDestination = myRequest.destination;
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [ServiceWorker API](/en-US/docs/Web/API/Service_Worker_API)
- [HTTP access control (CORS)](/en-US/docs/Web/HTTP/Guides/CORS)
- [HTTP](/en-US/docs/Web/HTTP)
