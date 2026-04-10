---
title: "Request: thuộc tính headers"
short-title: headers
slug: Web/API/Request/headers
page-type: web-api-instance-property
browser-compat: api.Request.headers
---

{{APIRef("Fetch API")}}{{AvailableInWorkers}}

Thuộc tính chỉ đọc **`headers`** của giao diện {{domxref("Request")}} chứa đối tượng {{domxref("Headers")}} liên kết với request.

## Giá trị

Một đối tượng {{domxref("Headers")}}.

## Ví dụ

Trong đoạn mã sau, chúng ta tạo một request mới bằng constructor {{domxref("Request.Request", "Request()")}} rồi lưu các header của request vào một biến:

```js
const myRequest = new Request("flowers.jpg");
const myHeaders = myRequest.headers; // Headers {}
```

Để thêm một header vào đối tượng {{domxref("Headers")}} chúng ta dùng {{domxref("Headers.append")}}; sau đó chúng ta tạo một `Request` mới cùng với tham số init thứ hai, truyền headers vào như một tùy chọn init:

```js
const myHeaders = new Headers();
myHeaders.append("Content-Type", "image/jpeg");

const myInit = {
  method: "GET",
  headers: myHeaders,
  mode: "cors",
  cache: "default",
};

const myRequest = new Request("flowers.jpg", myInit);

const myContentType = myRequest.headers.get("Content-Type"); // returns 'image/jpeg'
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [ServiceWorker API](/en-US/docs/Web/API/Service_Worker_API)
- [HTTP access control (CORS)](/en-US/docs/Web/HTTP/Guides/CORS)
- [HTTP](/en-US/docs/Web/HTTP)
