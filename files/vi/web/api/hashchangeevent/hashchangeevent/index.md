---
title: "HashChangeEvent: HashChangeEvent() constructor"
short-title: HashChangeEvent()
slug: Web/API/HashChangeEvent/HashChangeEvent
page-type: web-api-constructor
browser-compat: api.HashChangeEvent.HashChangeEvent
---

{{APIRef("HTML DOM")}}

Hàm khởi tạo **`HashChangeEvent()`** tạo một đối tượng {{domxref("HashChangeEvent")}} mới, được sử dụng bởi sự kiện {{domxref("Window/hashchange_event", "hashchange")}} kích hoạt tại đối tượng {{domxref("window")}} khi phân mảnh của URL thay đổi.

> [!NOTE]
> Thông thường, nhà phát triển web không cần gọi hàm khởi tạo này vì trình duyệt tự tạo các đối tượng này khi kích hoạt sự kiện {{domxref("Window/hashchange_event", "hashchange")}}.

## Cú pháp

```js-nolint
new HashChangeEvent(type, options)
```

### Tham số

- `type`
  - : Một chuỗi với tên của sự kiện.
    Phân biệt chữ hoa chữ thường và trình duyệt đặt là `hashchange`.
- `options` {{optional_inline}}
  - : Một đối tượng có, _ngoài các thuộc tính được định nghĩa trong {{domxref("Event/Event", "Event()")}}_, các thuộc tính sau:
    - `oldURL` {{optional_inline}}
      - : Một chuỗi chứa URL cũ. Giá trị mặc định là chuỗi rỗng (`""`).
    - `newURL` {{optional_inline}}
      - : Một chuỗi chứa URL mới. Giá trị mặc định là chuỗi rỗng (`""`).

### Giá trị trả về

Một đối tượng {{domxref("HashChangeEvent")}} mới.

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- Sự kiện {{domxref("Window/hashchange_event", "hashchange")}}
