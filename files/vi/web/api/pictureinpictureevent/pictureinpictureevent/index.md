---
title: "PictureInPictureEvent: hàm khởi tạo PictureInPictureEvent()"
short-title: PictureInPictureEvent()
slug: Web/API/PictureInPictureEvent/PictureInPictureEvent
page-type: web-api-constructor
browser-compat: api.PictureInPictureEvent.PictureInPictureEvent
---

{{APIRef("Picture-in-Picture API")}}

Hàm khởi tạo **`PictureInPictureEvent()`** trả về một đối tượng {{domxref("PictureInPictureEvent")}} mới.

## Cú pháp

```js-nolint
new PictureInPictureEvent(type, options)
```

### Tham số

- `type`
  - : Một chuỗi đại diện cho tên của sự kiện. Phân biệt chữ hoa chữ thường và các trình duyệt đặt là `enterpictureinpicture`, `leavepictureinpicture` hoặc `resize`.
- `options`
  - : Một đối tượng mà, _ngoài các thuộc tính được định nghĩa trong {{domxref("Event/Event", "Event()")}}_, có thể có các thuộc tính sau:
    - `pictureInPictureWindow`
      - : Một {{domxref("PictureInPictureWindow")}}.

### Giá trị trả về

Một đối tượng {{domxref("PictureInPictureEvent")}} mới.

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- Giao diện {{domxref("PictureInPictureEvent")}} mà nó thuộc về.
