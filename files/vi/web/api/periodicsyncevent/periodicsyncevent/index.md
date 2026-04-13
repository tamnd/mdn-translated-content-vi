---
title: "PeriodicSyncEvent: hàm khởi tạo PeriodicSyncEvent()"
short-title: PeriodicSyncEvent()
slug: Web/API/PeriodicSyncEvent/PeriodicSyncEvent
page-type: web-api-constructor
status:
  - experimental
browser-compat: api.PeriodicSyncEvent.PeriodicSyncEvent
---

{{APIRef("Periodic Background Sync")}}{{SeeCompatTable}}{{AvailableInWorkers("service")}}

Hàm khởi tạo **`PeriodicSyncEvent()`** tạo một đối tượng {{domxref("PeriodicSyncEvent")}} mới. Hàm khởi tạo này thường không được sử dụng. Trình duyệt tự tạo các đối tượng này và cung cấp chúng cho callback {{domxref('ServiceWorkerGlobalScope.periodicsync_event', 'onperiodicsync')}}.

## Cú pháp

```js-nolint
new PeriodicSyncEvent(type, options)
```

### Tham số

- `type`
  - : Một chuỗi với tên của sự kiện.
    Phân biệt chữ hoa chữ thường và các trình duyệt đặt là `periodicsync`.
- `options`
  - : Một đối tượng mà, _ngoài các thuộc tính được định nghĩa trong {{domxref("Event/Event", "Event()")}}_, có thể có các thuộc tính sau:
    - `tag`
      - : Thẻ tham chiếu đến sự kiện đồng bộ.

### Giá trị trả về

Một đối tượng {{domxref("PeriodicSyncEvent")}} mới được cấu hình bằng các đầu vào đã cho.

## Ví dụ

Ví dụ này xây dựng một {{domxref('PeriodicSyncEvent')}} mới với thẻ liên kết phù hợp.

```js
const psEvent = new ExtendableEvent("periodicsync", { tag: "unique-tag" });
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Richer offline experiences with the Periodic Background Sync API](https://developer.chrome.com/docs/capabilities/periodic-background-sync)
