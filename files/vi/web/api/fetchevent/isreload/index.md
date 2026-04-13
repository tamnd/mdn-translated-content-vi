---
title: "FetchEvent: thuộc tính isReload"
short-title: isReload
slug: Web/API/FetchEvent/isReload
page-type: web-api-instance-property
status:
  - deprecated
  - non-standard
browser-compat: api.FetchEvent.isReload
---

{{APIRef("Service Workers API")}}{{deprecated_header}}{{Non-standard_header}}{{AvailableInWorkers("service")}}

Thuộc tính chỉ đọc **`isReload`** của giao diện {{domxref("FetchEvent")}} trả về `true` nếu sự kiện được gửi bởi người dùng đang cố tải lại trang, và `false` nếu không.
Nhấn nút làm mới là tải lại, trong khi nhấp vào liên kết và nhấn nút quay lại thì không.

## Giá trị

Một giá trị boolean.

## Ví dụ

```js
self.addEventListener("fetch", (event) => {
  event.respondWith(async () => {
    if (event.isReload) {
      // Trả về một nội dung nào đó
    } else {
      // Trả về nội dung khác
    }
  })();
});
```

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Sử dụng Service Workers](/en-US/docs/Web/API/Service_Worker_API/Using_Service_Workers)
- [Ví dụ mã cơ bản về service worker](https://github.com/mdn/dom-examples/tree/main/service-worker/simple-service-worker)
- [Sử dụng web workers](/en-US/docs/Web/API/Web_Workers_API/Using_web_workers)
