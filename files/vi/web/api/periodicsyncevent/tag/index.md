---
title: "PeriodicSyncEvent: thuộc tính tag"
short-title: tag
slug: Web/API/PeriodicSyncEvent/tag
page-type: web-api-instance-property
status:
  - experimental
browser-compat: api.PeriodicSyncEvent.tag
---

{{APIRef("Periodic Background Sync")}}{{SeeCompatTable}}{{AvailableInWorkers("service")}}

Thuộc tính chỉ đọc **`tag`** của giao diện {{domxref("PeriodicSyncEvent")}} trả về định danh do nhà phát triển xác định cho {{domxref('PeriodicSyncEvent')}}. Điều này được chỉ định khi gọi phương thức {{domxref('PeriodicSyncManager.register()')}} của giao diện {{domxref('PeriodicSyncManager')}}. Nhiều thẻ có thể được sử dụng bởi ứng dụng web để chạy các tác vụ định kỳ khác nhau ở các tần số khác nhau.

## Giá trị

Trả về một {{jsxref('String')}} của định danh đã được xác định.

## Ví dụ

Ví dụ sau đây minh họa việc lắng nghe sự kiện đồng bộ định kỳ trong service worker và truy cập thuộc tính `tag`.

```js
self.addEventListener("periodicsync", (event) => {
  console.log(event.tag); // ghi lại thẻ sự kiện
});
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Richer offline experiences with the Periodic Background Sync API](https://developer.chrome.com/docs/capabilities/periodic-background-sync)
