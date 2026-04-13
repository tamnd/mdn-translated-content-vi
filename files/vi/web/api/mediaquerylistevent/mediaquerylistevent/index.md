---
title: MediaQueryListEvent()
slug: Web/API/MediaQueryListEvent/MediaQueryListEvent
page-type: web-api-constructor
browser-compat: api.MediaQueryListEvent.MediaQueryListEvent
---

{{APIRef("CSSOM")}}

Hàm khởi tạo **`MediaQueryListEvent()`** tạo ra một đối tượng {{domxref("MediaQueryListEvent")}} mới.

## Cú pháp

```js-nolint
new MediaQueryListEvent(type)
new MediaQueryListEvent(type, options)
```

### Tham số

- `type`
  - : Chuỗi với tên của sự kiện.
    Giá trị này phân biệt chữ hoa chữ thường và các trình duyệt luôn đặt nó là `change`.
- `options` {{optional_inline}}
  - : Đối tượng có _thêm_ các thuộc tính tùy chọn, ngoài các thuộc tính được định nghĩa trong {{domxref("Event/Event", "Event()")}}:
    - `media` {{optional_inline}}
      - : Chuỗi đại diện cho một media query được tuần tự hóa. Mặc định là `""`.
    - `matches` {{optional_inline}}
      - : Giá trị boolean đại diện cho trạng thái khớp của media query. Mặc định là `false`.

### Giá trị trả về

Đối tượng {{domxref("MediaQueryListEvent")}} mới.

## Ví dụ

```js
const event = new MediaQueryListEvent("change", {
  media: "(max-width: 600px)",
  matches: true,
});
console.log(event.media); // "(max-width: 600px)"
console.log(event.matches); // true
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("MediaQueryListEvent")}}
- {{domxref("MediaQueryList")}}
