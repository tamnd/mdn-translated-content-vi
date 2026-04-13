---
title: "IDBVersionChangeEvent: hàm khởi tạo IDBVersionChangeEvent()"
short-title: IDBVersionChangeEvent()
slug: Web/API/IDBVersionChangeEvent/IDBVersionChangeEvent
page-type: web-api-constructor
browser-compat: api.IDBVersionChangeEvent.IDBVersionChangeEvent
---

{{securecontext_header}}{{APIRef("IndexedDB")}}

Hàm khởi tạo **`IDBVersionChangeEvent()`** tạo một đối tượng {{domxref("IDBVersionChangeEvent")}} mới, được sử dụng để đại diện cho khi phiên bản của cơ sở dữ liệu đã thay đổi, là kết quả của trình xử lý sự kiện {{domxref('IDBOpenDBRequest.upgradeneeded_event', 'onupgradeneeded')}}.

## Cú pháp

```js-nolint
new IDBVersionChangeEvent(type)
new IDBVersionChangeEvent(type, options)
```

### Tham số

- `type`
  - : Một chuỗi với tên của sự kiện.
    Nó phân biệt hoa thường và trình duyệt đặt nó thành `versionchange`, `success` hoặc `blocked`.
- `options` {{optional_inline}}
  - : Một đối tượng, _ngoài các thuộc tính được định nghĩa trong {{domxref("Event/Event", "Event()")}}_, có thể có các thuộc tính sau:
    - `oldVersion` {{optional_inline}}
      - : Một số đại diện cho phiên bản trước của cơ sở dữ liệu. Mặc định là `0`.
    - `newVersion` {{optional_inline}}
      - : Một unsigned long đại diện cho phiên bản mới của cơ sở dữ liệu, hoặc `null` nếu cơ sở dữ liệu đang bị xóa. Mặc định là `null`.

### Giá trị trả về

Một đối tượng {{domxref("IDBVersionChangeEvent")}} mới.

## Ví dụ

Để có ví dụ hoạt động đầy đủ, xem ứng dụng [To-do Notifications](https://github.com/mdn/dom-examples/tree/main/to-do-notifications) ([xem ví dụ trực tiếp](https://mdn.github.io/dom-examples/to-do-notifications/)).

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
