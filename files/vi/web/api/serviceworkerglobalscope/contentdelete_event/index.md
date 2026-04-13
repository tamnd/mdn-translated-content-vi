---
title: "ServiceWorkerGlobalScope: sự kiện contentdelete"
short-title: contentdelete
slug: Web/API/ServiceWorkerGlobalScope/contentdelete_event
page-type: web-api-event
status:
  - experimental
browser-compat: api.ServiceWorkerGlobalScope.contentdelete_event
---

{{APIRef("Content Index API")}}{{SeeCompatTable}}{{SecureContext_Header}}{{AvailableInWorkers("service")}}

Sự kiện **`contentdelete`** của giao diện {{domxref("ServiceWorkerGlobalScope")}} được kích hoạt khi một mục bị xóa khỏi nội dung đã lập chỉ mục thông qua user agent.

Sự kiện này không thể hủy và không nổi bọt.

## Cú pháp

Sử dụng tên sự kiện trong các phương thức như {{domxref("EventTarget.addEventListener", "addEventListener()")}}, hoặc thiết lập một thuộc tính trình xử lý sự kiện.

```js-nolint
addEventListener("contentdelete", (event) => { })

oncontentdelete = (event) => { }
```

## Loại sự kiện

Một {{domxref("ContentIndexEvent")}}. Kế thừa từ {{domxref("Event")}}.

{{InheritanceDiagram("ContentIndexEvent")}}

## Thuộc tính sự kiện

_Ngoài các thuộc tính được liệt kê dưới đây, giao diện này kế thừa các thuộc tính từ giao diện cha, {{domxref("Event")}}._

- {{domxref("ContentIndexEvent.id", "id")}} {{ReadOnlyInline}}
  - : Một chuỗi xác định mục chỉ mục nội dung đã bị xóa thông qua `id` của nó.

## Ví dụ

Ví dụ sau sử dụng trình xử lý sự kiện `contentdelete` để xóa nội dung đã lưu trữ liên quan đến mục chỉ mục đã bị xóa.

```js
self.addEventListener("contentdelete", (event) => {
  const deletion = caches
    .open("cache-name")
    .then((cache) =>
      Promise.all([
        cache.delete(`/icon/${event.id}`),
        cache.delete(`/content/${event.id}`),
      ]),
    );
  event.waitUntil(deletion);
});
```

Bạn cũng có thể thiết lập trình xử lý sự kiện bằng cách sử dụng thuộc tính `oncontentdelete`:

```js
self.oncontentdelete = (event) => {
  // …
};
```

## Đặc tả kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Content index API](/en-US/docs/Web/API/Content_Index_API)
- [Bài viết giới thiệu về Content Index API](https://developer.chrome.com/docs/capabilities/web-apis/content-indexing-api)
