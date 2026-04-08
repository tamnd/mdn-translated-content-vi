---
title: ::-moz-range-thumb
slug: Web/CSS/Reference/Selectors/::-moz-range-thumb
page-type: css-pseudo-element
status:
  - non-standard
browser-compat: css.selectors.-moz-range-thumb
sidebar: cssref
---

{{Non-standard_header}}

[Phần tử giả](/en-US/docs/Web/CSS/Reference/Selectors/Pseudo-elements) [CSS](/en-US/docs/Web/CSS) **`::-moz-range-thumb`** là một [phần mở rộng của Mozilla](/en-US/docs/Web/CSS/Reference/Mozilla_extensions) đại diện cho _nút trượt_ (tức là núm ảo) của một {{HTMLElement("input")}} với `type="range"`. Người dùng có thể di chuyển nút trượt dọc theo rãnh của input để thay đổi giá trị số của nó.

> [!NOTE]
> Sử dụng `::-moz-range-thumb` với bất kỳ thứ gì khác ngoài `<input type="range">` sẽ không khớp với bất cứ thứ gì và không có hiệu lực.

## Cú pháp

```css
::-moz-range-thumb {
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
input[type="range"]::-moz-range-thumb {
  background-color: green;
}
```

### Kết quả

{{EmbedLiveSample("Examples", 300, 50)}}

Thanh tiến trình sử dụng kiểu này có thể trông như thế này:

![The thumb of the 'input type=right' styled in green](screen_shot_2015-12-04_at_13.30.08.png)

## Đặc tả

Không thuộc bất kỳ tiêu chuẩn nào.

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- Các phần tử giả được Gecko dùng để tạo kiểu cho các phần khác của input range:
  - {{cssxref("::-moz-range-track")}} đại diện cho rãnh mà nút trượt di chuyển.
  - {{cssxref("::-moz-range-progress")}} đại diện cho phần dưới của rãnh trượt.

- Các phần tử giả tương tự được dùng bởi các trình duyệt khác:
  - {{cssxref("::-webkit-slider-thumb")}}, phần tử giả được hỗ trợ bởi WebKit và Blink (Safari, Chrome và Opera)

- [CSS-Tricks: Styling Cross-Browser Compatible Range Inputs with CSS](https://css-tricks.com/styling-cross-browser-compatible-range-inputs-css/)
- [QuirksMode: Styling and scripting sliders](https://www.quirksmode.org/blog/archives/2015/11/styling_and_scr.html)
