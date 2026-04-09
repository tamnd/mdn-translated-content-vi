---
title: "ContentIndexEvent: thuộc tính id"
short-title: id
slug: Web/API/ContentIndexEvent/id
page-type: web-api-instance-property
status:
  - experimental
browser-compat: api.ContentIndexEvent.id
---

{{APIRef("Content Index API")}}{{SeeCompatTable}}{{AvailableInWorkers("service")}}

Thuộc tính chỉ đọc **`id`** của giao diện {{domxref("ContentIndexEvent")}} là một {{jsxref("String")}} xác định mục nội dung đã bị xóa thông qua `id` của nó.

## Giá trị

Biểu diễn {{jsxref("String")}} của `id` mục nội dung đã bị xóa.

## Ví dụ

Ví dụ này lắng nghe sự kiện {{domxref("ContentIndexEvent", "contentdelete")}} và ghi nhật ký `id` của mục nội dung bị xóa.

{{domxref("ContentIndexEvent")}} chỉ khả dụng trong [phạm vi toàn cục](/en-US/docs/Web/API/ServiceWorkerGlobalScope) của một {{domxref("ServiceWorker")}}.

```js
self.addEventListener("contentdelete", (event) => {
  console.log(event.id);

  // ghi nhật ký id của mục nội dung, sau đó có thể dùng để xác định nội dung nào cần xóa khỏi bộ nhớ đệm
});
```

## Thông số kỹ thuật

{{Specifications}}

## Khả năng tương thích với trình duyệt

{{Compat}}

## Xem thêm

- [Bài viết giới thiệu về Content Index API](https://developer.chrome.com/docs/capabilities/web-apis/content-indexing-api)
- [Service Worker API cùng với thông tin về Cache và CacheStorage](/en-US/docs/Web/API/Service_Worker_API)
