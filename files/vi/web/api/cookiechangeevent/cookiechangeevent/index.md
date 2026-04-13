---
title: "CookieChangeEvent: hàm tạo CookieChangeEvent()"
short-title: CookieChangeEvent()
slug: Web/API/CookieChangeEvent/CookieChangeEvent
page-type: web-api-constructor
browser-compat: api.CookieChangeEvent.CookieChangeEvent
---

{{securecontext_header}}{{APIRef("Cookie Store API")}}

Hàm tạo **`CookieChangeEvent()`** tạo một đối tượng {{domxref("CookieChangeEvent")}} mới, là kiểu sự kiện của sự kiện {{domxref("CookieStore/change_event", "change")}} được kích hoạt trên một {{domxref("CookieStore")}} khi có bất kỳ thay đổi cookie nào xảy ra.
Hàm tạo này được trình duyệt gọi khi sự kiện thay đổi xảy ra.

> [!NOTE]
> Hàm tạo sự kiện này thường không cần cho các website production. Mục đích sử dụng chính của nó là cho các bài kiểm thử cần một thể hiện của sự kiện này.

## Cú pháp

```js-nolint
new CookieChangeEvent(type)
new CookieChangeEvent(type, options)
```

### Tham số

- `type`
  - : Một chuỗi với tên của sự kiện. Nó phân biệt chữ hoa chữ thường và trình duyệt luôn đặt giá trị này là `change`.
- `options` {{Optional_Inline}}
  - : Một đối tượng, ngoài các thuộc tính được định nghĩa trong {{domxref("Event/Event", "Event()")}}, còn có thể có các thuộc tính sau:
    - `changed` {{Optional_Inline}}
      - : Một mảng chứa các cookie đã thay đổi.
    - `deleted` {{Optional_Inline}}
      - : Một mảng chứa các cookie đã bị xóa.

### Giá trị trả về

Một đối tượng {{domxref("CookieChangeEvent")}} mới.

## Thông số kỹ thuật

{{Specifications}}

## Khả năng tương thích với trình duyệt

{{Compat}}
