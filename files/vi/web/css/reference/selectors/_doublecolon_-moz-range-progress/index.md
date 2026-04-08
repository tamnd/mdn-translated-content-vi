---
title: ::-moz-range-progress
slug: Web/CSS/Reference/Selectors/::-moz-range-progress
page-type: css-pseudo-element
status:
  - non-standard
browser-compat: css.selectors.-moz-range-progress
sidebar: cssref
---

{{Non-standard_header}}

[Phần tử giả](/en-US/docs/Web/CSS/Reference/Selectors/Pseudo-elements) [CSS](/en-US/docs/Web/CSS) **`::-moz-range-progress`** là một [phần mở rộng của Mozilla](/en-US/docs/Web/CSS/Reference/Mozilla_extensions) đại diện cho phần dưới của _rãnh trượt_ (tức là rãnh) mà chỉ số trượt di chuyển trong một {{HTMLElement("input")}} với `type="range"`. Phần này tương ứng với các giá trị thấp hơn giá trị hiện đang được chọn bởi _nút trượt_ (tức là núm ảo).

> [!NOTE]
> Sử dụng `::-moz-range-progress` với bất kỳ thứ gì khác ngoài `<input type="range">` sẽ không khớp với bất cứ thứ gì và không có hiệu lực.

## Cú pháp

```css
::-moz-range-progress {
  /* ... */
}
```

## Ví dụ

### HTML

```html
<input type="range" min="0" max="100" step="5" value="50" />
```

### CSS

```css
input[type="range"]::-moz-range-progress {
  background-color: green;
  height: 1em;
}
```

### Kết quả

{{EmbedLiveSample("Examples", 300, 50)}}

Thanh tiến trình sử dụng kiểu này có thể trông như thế này:

![The progress bar is a thick green square to the left of the thumb and a thin grey line to the right. The thumb is a circle with a diameter the height of the green area.](screen_shot_2015-12-04_at_20.14.48.png)

## Đặc tả

Không thuộc bất kỳ tiêu chuẩn nào.

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- Các phần tử giả được Gecko dùng để tạo kiểu cho các phần khác của input range:
  - {{cssxref("::-moz-range-thumb")}} đại diện cho chỉ số trượt trong rãnh.
  - {{cssxref("::-moz-range-track")}} đại diện cho rãnh mà nút trượt di chuyển.

- [CSS-Tricks: Styling Cross-Browser Compatible Range Inputs with CSS](https://css-tricks.com/styling-cross-browser-compatible-range-inputs-css/)
- [QuirksMode: Styling and scripting sliders](https://www.quirksmode.org/blog/archives/2015/11/styling_and_scr.html)
