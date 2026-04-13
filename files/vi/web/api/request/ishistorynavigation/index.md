---
title: "Request: thuộc tính isHistoryNavigation"
short-title: isHistoryNavigation
slug: Web/API/Request/isHistoryNavigation
page-type: web-api-instance-property
browser-compat: api.Request.isHistoryNavigation
---

{{APIRef("Fetch API")}}{{AvailableInWorkers}}

Thuộc tính chỉ đọc **`isHistoryNavigation`** của giao diện {{domxref("Request")}} là một giá trị boolean cho biết request có phải là một điều hướng lịch sử hay không.

Một điều hướng lịch sử là một điều hướng trong lịch sử trình duyệt, được thực hiện bằng cách gọi {{domxref("History.go()")}}, {{domxref("History.back()")}}, {{domxref("History.forward()")}}, {{domxref("Navigation.traverseTo()")}}, {{domxref("Navigation.back()")}}, {{domxref("Navigation.forward()")}}, hoặc trực tiếp bằng cách nhấp nút back hoặc forward của trình duyệt.

## Giá trị

Một giá trị boolean.

## Ví dụ

Ví dụ này chạy trong service worker. Nó lắng nghe sự kiện {{domxref("ServiceWorkerGlobalScope/fetch_event", "fetch")}}. Trong handler, service worker kiểm tra thuộc tính `isHistoryNavigation` để biết request có xảy ra do điều hướng lịch sử hay không. Nếu có, nó cố trả về một phản hồi đã cache. Nếu cache không chứa phản hồi cho request này, service worker sẽ fetch phản hồi từ mạng, cache một bản sao của nó và trả về phản hồi từ mạng.

```js
self.addEventListener("request", (event) => {
  // …

  if (event.request.isHistoryNavigation) {
    event.respondWith(
      caches.match(event.request).then((response) => {
        if (response !== undefined) {
          return response;
        }
        return fetch(event.request).then((response) => {
          const responseClone = response.clone();

          caches
            .open("v1")
            .then((cache) => cache.put(event.request, responseClone));

          return response;
        });
      }),
    );
  }

  // …
});
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("History API", "", "", 1)}}
- {{domxref("Navigation API", "", "", 1)}}
- {{domxref("Service Worker API", "", "", 1)}}
