---
title: "AnimationPlaybackEvent: bộ khởi tạo AnimationPlaybackEvent()"
short-title: AnimationPlaybackEvent()
slug: Web/API/AnimationPlaybackEvent/AnimationPlaybackEvent
page-type: web-api-constructor
browser-compat: api.AnimationPlaybackEvent.AnimationPlaybackEvent
---

{{ APIRef("Web Animations") }}

Bộ khởi tạo **`AnimationPlaybackEvent()`** của [Web Animations API](/en-US/docs/Web/API/Web_Animations_API) trả về một thể hiện đối tượng {{domxref("AnimationPlaybackEvent")}} mới.

## Cú pháp

```js-nolint
new AnimationPlaybackEvent(type)
new AnimationPlaybackEvent(type, options)
```

### Tham số

- `type`
  - : Một chuỗi chứa tên của sự kiện.
    Nó phân biệt chữ hoa chữ thường và trình duyệt đặt nó thành `cancel`, `finish`, hoặc `remove`.
- `options` {{optional_inline}}
  - : Một đối tượng mà, _ngoài các thuộc tính được định nghĩa trong {{domxref("Event/Event", "Event()")}}_, còn có các thuộc tính sau:
    - `detail` {{optional_inline}}
      - : Một giá trị phụ thuộc vào sự kiện, được liên kết với sự kiện. Mặc định là `null`.

### Giá trị trả về

Một đối tượng {{domxref("AnimationPlaybackEvent")}} mới.

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Web Animations API](/en-US/docs/Web/API/Web_Animations_API)
- {{domxref("AnimationPlayBackEvent")}}
- {{domxref("Animation.playState")}}
- {{domxref("CustomEvent.CustomEvent", "CustomEvent()")}}
- {{domxref("Event.Event", "Event()")}}
