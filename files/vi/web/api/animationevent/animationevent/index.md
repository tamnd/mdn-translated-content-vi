---
title: "AnimationEvent: bộ khởi tạo AnimationEvent()"
short-title: AnimationEvent()
slug: Web/API/AnimationEvent/AnimationEvent
page-type: web-api-constructor
browser-compat: api.AnimationEvent.AnimationEvent
---

{{APIRef("Web Animations")}}

Bộ khởi tạo **`AnimationEvent()`** trả về một đối tượng {{domxref("AnimationEvent")}} mới, đại diện cho một sự kiện liên quan đến một hoạt ảnh.

## Cú pháp

```js-nolint
new AnimationEvent(type)
new AnimationEvent(type, options)
```

### Tham số

- `type`
  - : Một chuỗi chứa tên kiểu của `AnimationEvent`.
    Giá trị này phân biệt chữ hoa chữ thường và trình duyệt đặt nó thành `animationstart`, `animationend`, hoặc `animationiteration`.
- `options` {{optional_inline}}
  - : Một đối tượng mà, _ngoài các thuộc tính được định nghĩa trong {{domxref("Event/Event", "Event()")}}_, còn có các thuộc tính sau:
    - `animationName` {{optional_inline}}
      - : Một chuỗi chứa giá trị của thuộc tính CSS {{cssxref("animation-name")}} liên kết với chuyển tiếp. Mặc định là `""`.
    - `elapsedTime` {{optional_inline}}
      - : Một giá trị `float` cho biết khoảng thời gian hoạt ảnh đã chạy, tính bằng giây, tại thời điểm sự kiện này được kích hoạt, không bao gồm mọi khoảng thời gian hoạt ảnh bị tạm dừng.
        Với sự kiện `animationstart`, `elapsedTime` là `0.0` trừ khi có giá trị âm cho {{cssxref("animation-delay")}},
        trong trường hợp đó sự kiện sẽ được kích hoạt với `elapsedTime` chứa `(-1 * delay)`. Mặc định là `0.0`.
    - `pseudoElement` {{optional_inline}}
      - : Một chuỗi, bắt đầu bằng `"::"`, chứa tên của [pseudo-element](/en-US/docs/Web/CSS/Reference/Selectors/Pseudo-elements) mà hoạt ảnh chạy trên đó. Nếu hoạt ảnh không chạy trên pseudo-element mà chạy trên chính phần tử, hãy chỉ định một chuỗi rỗng: `""`. Mặc định là `""`.

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Dùng CSS animations](/en-US/docs/Web/CSS/Guides/Animations/Using)
- Các thuộc tính và at-rule CSS liên quan đến hoạt ảnh: {{cssxref("animation")}},
  {{cssxref("animation-delay")}}, {{cssxref("animation-direction")}},
  {{cssxref("animation-duration")}}, {{cssxref("animation-fill-mode")}},
  {{cssxref("animation-iteration-count")}}, {{cssxref("animation-name")}},
  {{cssxref("animation-play-state")}}, {{cssxref("animation-timing-function")}},
  {{cssxref("@keyframes")}}
- Giao diện {{domxref("AnimationEvent")}} mà nó thuộc về.
