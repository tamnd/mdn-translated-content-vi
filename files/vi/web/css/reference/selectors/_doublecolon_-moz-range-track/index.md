---
title: ::-moz-range-track
slug: Web/CSS/Reference/Selectors/::-moz-range-track
page-type: css-pseudo-element
status:
  - non-standard
browser-compat: css.selectors.-moz-range-track
sidebar: cssref
---

{{Non-standard_header}}

[Phần tử giả](/en-US/docs/Web/CSS/Reference/Selectors/Pseudo-elements) [CSS](/en-US/docs/Web/CSS) **`::-moz-range-track`** là một [phần mở rộng của Mozilla](/en-US/docs/Web/CSS/Reference/Mozilla_extensions) đại diện cho _rãnh trượt_ (tức là rãnh) mà chỉ số trượt di chuyển trong một {{HTMLElement("input")}} với `type="range"`.

> [!NOTE]
> Sử dụng `::-moz-range-track` với bất kỳ thứ gì khác ngoài `<input type="range">` sẽ không khớp với bất cứ thứ gì và không có hiệu lực.

## Cú pháp

```css
::-moz-range-track {
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
input[type="range"]::-moz-range-track {
  background-color: green;
}
```

### Kết quả

{{EmbedLiveSample("Examples", 300, 50)}}

Thanh trượt range sử dụng kiểu này có thể trông như thế này:

![A range with the track green](screen_shot_2015-12-04_at_10.14.34.png)

## Đặc tả

Không thuộc bất kỳ tiêu chuẩn nào.

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- Các phần tử giả được Gecko dùng để tạo kiểu cho các phần khác của input range:
  - {{cssxref("::-moz-range-thumb")}} đại diện cho chỉ số trượt trong rãnh.
  - {{cssxref("::-moz-range-progress")}} đại diện cho phần dưới của rãnh trượt.

- Các phần tử giả tương tự được dùng bởi các trình duyệt khác:
  - {{cssxref("::-webkit-slider-runnable-track")}}, phần tử giả được hỗ trợ bởi WebKit và Blink (Safari, Chrome và Opera)

- [CSS-Tricks: Styling Cross-Browser Compatible Range Inputs with CSS](https://css-tricks.com/styling-cross-browser-compatible-range-inputs-css/)
- [QuirksMode: Styling and scripting sliders](https://www.quirksmode.org/blog/archives/2015/11/styling_and_scr.html)
