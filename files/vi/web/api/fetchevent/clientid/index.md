---
title: "FetchEvent: thuộc tính clientId"
short-title: clientId
slug: Web/API/FetchEvent/clientId
page-type: web-api-instance-property
browser-compat: api.FetchEvent.clientId
---

{{APIRef("Service Workers API")}}{{AvailableInWorkers("service")}}

Thuộc tính chỉ đọc **`clientId`** của giao diện {{domxref("FetchEvent")}} trả về id của {{domxref("Client")}} mà service worker hiện tại đang kiểm soát.

Phương thức {{domxref("Clients.get()")}} sau đó có thể được truyền ID này để lấy client liên quan.

## Giá trị

Một chuỗi đại diện cho ID của client.

## Ví dụ

```js
self.addEventListener("fetch", (event) => {
  console.log(event.clientId);
});
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Sử dụng Service Workers](/en-US/docs/Web/API/Service_Worker_API/Using_Service_Workers)
- [Ví dụ mã cơ bản về service worker](https://github.com/mdn/dom-examples/tree/main/service-worker/simple-service-worker)
- [Sử dụng web workers](/en-US/docs/Web/API/Web_Workers_API/Using_web_workers)
