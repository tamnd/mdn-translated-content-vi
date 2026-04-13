---
title: PeriodicSyncEvent
slug: Web/API/PeriodicSyncEvent
page-type: web-api-interface
status:
  - experimental
browser-compat: api.PeriodicSyncEvent
---

{{APIRef("Periodic Background Sync")}}{{SeeCompatTable}}{{AvailableInWorkers("service")}}

Giao diện **`PeriodicSyncEvent`** của {{domxref('Web Periodic Background Synchronization API', '', '', 'nocode')}} cung cấp một cách để chạy các tác vụ trong service worker với kết nối mạng.

Một phiên bản của sự kiện này được truyền đến trình xử lý {{domxref('ServiceWorkerGlobalScope.periodicsync_event', 'periodicsync')}}. Điều này xảy ra định kỳ, theo khoảng thời gian lớn hơn hoặc bằng khoảng thời gian được đặt trong phương thức {{domxref('PeriodicSyncManager.register()')}}. Các yếu tố khác như mức độ tương tác của người dùng với trang quyết định khoảng thời gian thực tế.

{{InheritanceDiagram}}

## Hàm khởi tạo

- {{domxref("PeriodicSyncEvent.PeriodicSyncEvent", "PeriodicSyncEvent()")}} {{Experimental_Inline}}
  - : Tạo một đối tượng `PeriodicSyncEvent` mới. Hàm khởi tạo này thường không được sử dụng. Trình duyệt tự tạo các đối tượng này và cung cấp chúng cho callback {{domxref('ServiceWorkerGlobalScope.periodicsync_event', 'onperiodicsync')}}.

## Thuộc tính phiên bản

_Kế thừa các thuộc tính từ lớp cha, {{domxref('ExtendableEvent')}}._

- {{domxref('PeriodicSyncEvent.tag')}} {{ReadOnlyInline}} {{Experimental_Inline}}
  - : Trả về định danh do nhà phát triển xác định cho `PeriodicSyncEvent` này. Nhiều thẻ có thể được sử dụng bởi ứng dụng web để chạy các tác vụ định kỳ khác nhau ở các tần số khác nhau.

## Phương thức phiên bản

_Kế thừa các phương thức từ lớp cha, {{domxref('ExtendableEvent')}}._

## Ví dụ

Ví dụ sau đây cho thấy cách phản ứng với sự kiện đồng bộ định kỳ trong service worker.

```js
self.addEventListener("periodicsync", (event) => {
  if (event.tag === "get-latest-news") {
    event.waitUntil(fetchAndCacheLatestNews());
  }
});
```

`fetchAndCacheLatestNews` là một hàm do nhà phát triển định nghĩa.

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Richer offline experiences with the Periodic Background Sync API](https://developer.chrome.com/docs/capabilities/periodic-background-sync)
