---
title: "BackgroundFetchEvent: hàm tạo BackgroundFetchEvent()"
short-title: BackgroundFetchEvent()
slug: Web/API/BackgroundFetchEvent/BackgroundFetchEvent
page-type: web-api-constructor
status:
  - experimental
browser-compat: api.BackgroundFetchEvent.BackgroundFetchEvent
---

{{APIRef("Background Fetch API")}}{{SeeCompatTable}}{{AvailableInWorkers("service")}}

Hàm tạo **`BackgroundFetchEvent()`** tạo một đối tượng {{domxref("BackgroundFetchEvent")}} mới. Hàm tạo này thường không được dùng trực tiếp vì trình duyệt tự tạo các đối tượng này và cung cấp chúng cho các callback của sự kiện tìm nạp nền.

## Cú pháp

```js-nolint
new BackgroundFetchEvent(type, options)
```

### Tham số

- `type`
  - : Một chuỗi chứa tên của sự kiện.
    Giá trị này phân biệt chữ hoa chữ thường và trình duyệt đặt nó thành `backgroundfetchabort` hoặc `backgroundfetchclick`.
- `options`
  - : Một đối tượng mà, _ngoài các thuộc tính được định nghĩa trong {{domxref("ExtendableEvent/ExtendableEvent", "ExtendableEvent()")}}_, còn có các thuộc tính sau:
    - `registration`
      - : Một đối tượng {{domxref("BackgroundFetchRegistration")}}.

### Giá trị trả về

Một đối tượng {{domxref("BackgroundFetchEvent")}} mới.

## Thông số kỹ thuật

{{Specifications}}

## Khả năng tương thích với trình duyệt

{{Compat}}
