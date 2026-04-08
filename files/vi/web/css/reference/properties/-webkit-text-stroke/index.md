---
title: -webkit-text-stroke
slug: Web/CSS/Reference/Properties/-webkit-text-stroke
page-type: css-shorthand-property
browser-compat: css.properties.-webkit-text-stroke
sidebar: cssref
---

Thuộc tính [CSS](/en-US/docs/Web/CSS) **`-webkit-text-stroke`** chỉ định [độ rộng](/en-US/docs/Web/CSS/Reference/Values/length) và [màu sắc](/en-US/docs/Web/CSS/Reference/Values/color_value) của nét viền cho các ký tự văn bản. Đây là thuộc tính viết tắt cho các thuộc tính đầy đủ {{cssxref("-webkit-text-stroke-width")}} và {{cssxref("-webkit-text-stroke-color")}}.

## Thuộc tính thành phần

Thuộc tính này là viết tắt của các thuộc tính CSS sau:

- {{cssxref("-webkit-text-stroke-color")}}
- {{cssxref("-webkit-text-stroke-width")}}

## Cú pháp

```css
/* Giá trị độ rộng và màu */
-webkit-text-stroke: 4px navy;

/* Giá trị toàn cục */
-webkit-text-stroke: inherit;
-webkit-text-stroke: initial;
-webkit-text-stroke: revert;
-webkit-text-stroke: revert-layer;
-webkit-text-stroke: unset;
```

### Giá trị

- {{cssxref("&lt;length&gt;")}}
  - : Độ rộng của nét viền.
- {{cssxref("&lt;color&gt;")}}
  - : Màu sắc của nét viền.

## Định nghĩa hình thức

{{CSSInfo}}

## Cú pháp hình thức

{{csssyntax}}

## Ví dụ

### Thêm nét viền văn bản màu đỏ

#### HTML

```html
<p id="example">The stroke of this text is red.</p>
```

#### CSS

```css
#example {
  font-size: 3em;
  margin: 0;
  -webkit-text-stroke: 2px red;
}
```

#### Kết quả

{{EmbedLiveSample("Adding_a_red_text_stroke", 600, 60)}}

## Đặc tả

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Introducing Text-Stroke](https://webkit.org/blog/85/introducing-text-stroke/) trên webkit.org (2006)
- [Bài viết CSS-Tricks giải thích tính năng này](https://css-tricks.com/adding-stroke-to-web-text/)
- {{cssxref("-webkit-text-stroke-width")}}
- {{cssxref("-webkit-text-stroke-color")}}
- {{cssxref("-webkit-text-fill-color")}}
