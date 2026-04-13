---
title: "FetchEvent: thuộc tính replacesClientId"
short-title: replacesClientId
slug: Web/API/FetchEvent/replacesClientId
page-type: web-api-instance-property
browser-compat: api.FetchEvent.replacesClientId
---

{{APIRef("Service Workers API")}}{{AvailableInWorkers("service")}}

Thuộc tính chỉ đọc **`replacesClientId`** của giao diện {{domxref("FetchEvent")}} là {{domxref("Client.id", "id")}} của {{domxref("Client", "client")}} đang được thay thế trong quá trình điều hướng trang.

Ví dụ, khi điều hướng từ trang A đến trang B, `replacesClientId` là ID của client liên kết với trang A. Nó có thể là chuỗi rỗng khi điều hướng từ `about:blank` đến trang khác, vì client của `about:blank` sẽ được tái sử dụng thay vì bị thay thế.

Ngoài ra, nếu lần tìm nạp không phải là điều hướng, `replacesClientId` sẽ là chuỗi rỗng. Điều này có thể được dùng để truy cập/giao tiếp với client sẽ sớm bị thay thế, ngay trước khi điều hướng.

## Giá trị

Một chuỗi.

## Ví dụ

```js
self.addEventListener("fetch", (event) => {
  console.log(event.replacesClientId);
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
