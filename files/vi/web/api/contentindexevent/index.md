---
title: ContentIndexEvent
slug: Web/API/ContentIndexEvent
page-type: web-api-interface
status:
  - experimental
browser-compat: api.ContentIndexEvent
---

{{APIRef("Content Index API")}}{{SeeCompatTable}}{{AvailableInWorkers("service")}}

Giao diện **`ContentIndexEvent`** của [Content Index API](/en-US/docs/Web/API/Content_Index_API) định nghĩa đối tượng dùng để biểu diễn sự kiện {{domxref("ServiceWorkerGlobalScope.contentdelete_event", "contentdelete")}}.

Sự kiện này được gửi tới [phạm vi toàn cục](/en-US/docs/Web/API/ServiceWorkerGlobalScope) của một {{domxref("ServiceWorker")}}. Nó chứa `id` của nội dung đã được lập chỉ mục cần bị xóa.

Sự kiện {{domxref("ServiceWorkerGlobalScope.contentdelete_event", "contentdelete")}} chỉ được kích hoạt khi việc xóa xảy ra do tương tác với giao diện người dùng tích hợp sẵn của trình duyệt. Nó không được kích hoạt khi phương thức {{domxref("ContentIndex.delete")}} được gọi.

{{InheritanceDiagram}}

## Constructor

- {{domxref("ContentIndexEvent.ContentIndexEvent", "ContentIndexEvent()")}} {{Experimental_Inline}}
  - : Tạo và trả về một đối tượng `ContentIndexEvent` mới, với kiểu và các tùy chọn khác được cấu hình theo chỉ định.

## Thuộc tính thể hiện

_Ngoài các thuộc tính được liệt kê bên dưới, giao diện này còn kế thừa các thuộc tính từ giao diện cha của nó là {{domxref("ExtendableEvent")}}._

- {{domxref("ContentIndexEvent.id", "id")}} {{ReadOnlyInline}} {{Experimental_Inline}}
  - : Một {{jsxref("String")}} xác định mục nội dung đã bị xóa thông qua `id` của nó.

## Phương thức thể hiện

_Mặc dù `ContentIndexEvent` không cung cấp phương thức riêng nào, nó kế thừa mọi phương thức được chỉ định bởi giao diện cha của nó là {{domxref("ExtendableEvent")}}._

## Ví dụ

Ví dụ này cho thấy tập lệnh [service worker](/en-US/docs/Web/API/ServiceWorker) lắng nghe sự kiện {{domxref("ServiceWorkerGlobalScope.contentdelete_event", "contentdelete")}} và ghi nhật ký `id` của mục nội dung bị xóa.

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
