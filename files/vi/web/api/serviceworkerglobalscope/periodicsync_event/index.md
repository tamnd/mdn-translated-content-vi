---
title: "ServiceWorkerGlobalScope: sự kiện periodicsync"
short-title: periodicsync
slug: Web/API/ServiceWorkerGlobalScope/periodicsync_event
page-type: web-api-event
status:
  - experimental
browser-compat: api.ServiceWorkerGlobalScope.periodicsync_event
---

{{APIRef("Periodic Background Sync")}}{{SeeCompatTable}}{{SecureContext_Header}}{{AvailableInWorkers("service")}}

Sự kiện **`periodicsync`** của giao diện {{domxref("ServiceWorkerGlobalScope")}} được kích hoạt ở các khoảng thời gian định kỳ, được chỉ định khi đăng ký một {{domxref('PeriodicSyncManager')}}.

Sự kiện này không thể hủy và không nổi bọt.

## Cú pháp

Sử dụng tên sự kiện trong các phương thức như {{domxref("EventTarget.addEventListener", "addEventListener()")}}, hoặc thiết lập một thuộc tính trình xử lý sự kiện.

```js-nolint
addEventListener("periodicsync", (event) => { })

onperiodicsync = (event) => { }
```

## Loại sự kiện

Một {{domxref("PeriodicSyncEvent")}}. Kế thừa từ {{domxref("Event")}}.

{{InheritanceDiagram("PeriodicSyncEvent")}}

## Thuộc tính sự kiện

_Kế thừa các thuộc tính từ giao diện tổ tiên, {{domxref("Event")}}_.

- {{domxref('PeriodicSyncEvent.tag')}} {{ReadOnlyInline}}
  - : Trả về định danh do nhà phát triển định nghĩa cho `PeriodicSyncEvent` này. Nhiều tag có thể được sử dụng bởi ứng dụng web để chạy các tác vụ định kỳ khác nhau ở các tần suất khác nhau.

## Ví dụ

Ví dụ sau cho thấy cách phản hồi một sự kiện đồng bộ định kỳ trong service worker.

```js
self.addEventListener("periodicsync", (event) => {
  if (event.tag === "get-latest-news") {
    event.waitUntil(fetchAndCacheLatestNews());
  }
});
```

Bạn cũng có thể thiết lập trình xử lý sự kiện bằng cách sử dụng thuộc tính `onperiodicsync`:

```js
self.onperiodicsync = (event) => {
  // …
};
```

## Đặc tả kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Richer offline experiences with the Periodic Background Sync API](https://developer.chrome.com/docs/capabilities/periodic-background-sync)
