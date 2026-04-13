---
title: "ServiceWorkerGlobalScope: sự kiện sync"
short-title: sync
slug: Web/API/ServiceWorkerGlobalScope/sync_event
page-type: web-api-event
browser-compat: api.ServiceWorkerGlobalScope.sync_event
---

{{APIRef("Background Sync")}}{{SecureContext_Header}}{{AvailableInWorkers("service")}}

Sự kiện **`sync`** của giao diện {{domxref("ServiceWorkerGlobalScope")}} được kích hoạt khi trang (hoặc worker) đã đăng ký sự kiện với {{domxref('SyncManager')}} đang chạy và ngay khi kết nối mạng khả dụng.

Sự kiện này không thể hủy và không nổi bọt.

## Cú pháp

Sử dụng tên sự kiện trong các phương thức như {{domxref("EventTarget.addEventListener", "addEventListener()")}}, hoặc thiết lập một thuộc tính trình xử lý sự kiện.

```js-nolint
addEventListener("sync", (event) => { })

onsync = (event) => { }
```

## Loại sự kiện

Một {{domxref("SyncEvent")}}. Kế thừa từ {{domxref("ExtendableEvent")}} và {{domxref("Event")}}.

{{InheritanceDiagram("SyncEvent")}}

## Thuộc tính sự kiện

_Kế thừa các thuộc tính từ giao diện tổ tiên, {{domxref("ExtendableEvent")}} và {{domxref("Event")}}_.

- {{domxref("SyncEvent.tag")}} {{ReadOnlyInline}}
  - : Trả về định danh do nhà phát triển định nghĩa cho `SyncEvent` này.
- {{domxref("SyncEvent.lastChance")}} {{ReadOnlyInline}}
  - : Trả về `true` nếu user agent sẽ không thực hiện thêm bất kỳ lần đồng bộ nào sau lần thử hiện tại.

## Ví dụ

Ví dụ sau cho thấy cách phản hồi một sự kiện đồng bộ trong service worker.

```js
self.addEventListener("sync", (event) => {
  if (event.tag === "sync-messages") {
    event.waitUntil(sendOutboxMessages());
  }
});
```

Bạn cũng có thể thiết lập trình xử lý sự kiện bằng cách sử dụng thuộc tính `onsync`:

```js
self.onsync = (event) => {
  // …
};
```

## Đặc tả kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Richer offline experiences with the Periodic Background Sync API](https://developer.chrome.com/docs/capabilities/periodic-background-sync)
