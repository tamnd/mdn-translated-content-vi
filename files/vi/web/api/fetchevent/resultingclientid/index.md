---
title: "FetchEvent: thuộc tính resultingClientId"
short-title: resultingClientId
slug: Web/API/FetchEvent/resultingClientId
page-type: web-api-instance-property
browser-compat: api.FetchEvent.resultingClientId
---

{{APIRef("Service Workers API")}}{{AvailableInWorkers("service")}}

Thuộc tính chỉ đọc **`resultingClientId`** của giao diện {{domxref("FetchEvent")}} là {{domxref("Client.id", "id")}} của {{domxref("Client", "client")}} thay thế client trước trong quá trình điều hướng trang.

Ví dụ, khi điều hướng từ trang A đến trang B, `resultingClientId` là ID của client liên kết với trang B.

Nếu yêu cầu tìm nạp là yêu cầu tài nguyên con hoặc [`destination`](/en-US/docs/Web/API/Request/destination) của yêu cầu là `report`, `resultingClientId` sẽ là chuỗi rỗng.

## Giá trị

Một chuỗi.

## Ví dụ

```js
self.addEventListener("fetch", (event) => {
  console.log(event.resultingClientId);
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
