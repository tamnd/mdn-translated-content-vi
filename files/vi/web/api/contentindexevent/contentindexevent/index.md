---
title: "ContentIndexEvent: hàm tạo ContentIndexEvent()"
short-title: ContentIndexEvent()
slug: Web/API/ContentIndexEvent/ContentIndexEvent
page-type: web-api-constructor
status:
  - experimental
browser-compat: api.ContentIndexEvent.ContentIndexEvent
---

{{APIRef("Content Index API")}}{{SeeCompatTable}}{{AvailableInWorkers("service")}}

Hàm tạo **`ContentIndexEvent()`** tạo một đối tượng {{domxref("ContentIndexEvent")}} mới với kiểu và các tùy chọn khác được cấu hình theo chỉ định.

## Cú pháp

```js-nolint
new ContentIndexEvent(type, options)
```

### Tham số

- `type`
  - : Một chuỗi chứa tên của sự kiện.
    Giá trị này phân biệt chữ hoa chữ thường và trình duyệt luôn đặt nó thành `contentdelete`.
- `options`
  - : Một đối tượng mà, _ngoài các thuộc tính được định nghĩa trong {{domxref("ExtendableEvent/ExtendableEvent", "ExtendableEvent()")}}_, còn có thuộc tính sau:
    - `id`
      - : `id` của nội dung đã được lập chỉ mục mà bạn muốn đối tượng {{domxref("ContentIndex")}} xóa.

### Giá trị trả về

Một đối tượng {{domxref("ContentIndexEvent")}} mới được cấu hình bằng các tùy chọn đã cho.

## Ví dụ

Ví dụ này tạo một {{domxref("ContentIndexEvent")}} mới với `id` tương ứng.

```js
const removeData = {
  id: "unique-content-id",
};

const ciEvent = new ContentIndexEvent("contentdelete", removeData);

ciEvent.id; // should return 'unique-content-id'
```

## Thông số kỹ thuật

{{Specifications}}

## Khả năng tương thích với trình duyệt

{{Compat}}

## Xem thêm

- [Bài viết giới thiệu về Content Index API](https://developer.chrome.com/docs/capabilities/web-apis/content-indexing-api)
- [Service Worker API cùng với thông tin về Cache và CacheStorage](/en-US/docs/Web/API/Service_Worker_API)
