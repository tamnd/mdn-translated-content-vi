---
title: text-emphasis-style
slug: Web/CSS/Reference/Properties/text-emphasis-style
page-type: css-property
browser-compat: css.properties.text-emphasis-style
sidebar: cssref
---

Thuộc tính [CSS](/en-US/docs/Web/CSS) **`text-emphasis-style`** đặt kiểu hiển thị của dấu nhấn mạnh. Nó cũng có thể được đặt và đặt lại bằng thuộc tính viết tắt {{cssxref("text-emphasis")}}.

{{InteractiveExample("CSS Demo: text-emphasis-style")}}

```css interactive-example-choice
text-emphasis-style: none;
```

```css interactive-example-choice
text-emphasis-style: triangle;
```

```css interactive-example-choice
text-emphasis-style: "x";
```

```css interactive-example-choice
text-emphasis-style: filled double-circle;
```

```html interactive-example
<section id="default-example">
  <p>
    I'd far rather be
    <span class="transition-all" id="example-element">happy than right</span>
    any day.
  </p>
</section>
```

```css interactive-example
p {
  font: 1.5em sans-serif;
}
```

## Cú pháp

```css
/* Giá trị ban đầu */
text-emphasis-style: none; /* Không có dấu nhấn mạnh */

/* Giá trị <string> */
text-emphasis-style: "x";
text-emphasis-style: "\25B2";
text-emphasis-style: "*";

/* Giá trị từ khóa */
text-emphasis-style: filled;
text-emphasis-style: open;
text-emphasis-style: dot;
text-emphasis-style: circle;
text-emphasis-style: double-circle;
text-emphasis-style: triangle;
text-emphasis-style: filled sesame;
text-emphasis-style: open sesame;

/* Giá trị toàn cục */
text-emphasis-style: inherit;
text-emphasis-style: initial;
text-emphasis-style: revert;
text-emphasis-style: revert-layer;
text-emphasis-style: unset;
```

### Giá trị

- `none`
  - : Không có dấu nhấn mạnh.
- `filled`
  - : Hình dạng được tô đặc bằng màu đồng nhất. Nếu không có `filled` hay `open`, đây là giá trị mặc định.
- `open`
  - : Hình dạng rỗng (không tô).
- `dot`
  - : Hiển thị các chấm nhỏ làm dấu. Chấm tô đặc là `'•'` (`U+2022`), chấm rỗng là `'◦'` (`U+25E6`).
- `circle`
  - : Hiển thị các vòng tròn lớn làm dấu. Vòng tròn tô đặc là `'●'` (`U+25CF`), vòng tròn rỗng là `'○'` (`U+25CB`).
- `double-circle`
  - : Hiển thị vòng tròn kép làm dấu. Vòng tròn kép tô đặc là `'◉'` (`U+25C9`), vòng tròn kép rỗng là `'◎'` (`U+25CE`).
- `triangle`
  - : Hiển thị hình tam giác làm dấu. Tam giác tô đặc là `'▲'` (`U+25B2`), tam giác rỗng là `'△'` (`U+25B3`).
- `sesame`
  - : Hiển thị dấu mè làm dấu nhấn mạnh. Dấu mè tô đặc là `'﹅'` (`U+FE45`), dấu mè rỗng là `'﹆'` (`U+FE46`).
- `<string>`
  - : Hiển thị chuỗi ký tự đã cho làm dấu. Tác giả không nên chỉ định nhiều hơn một _ký tự_ trong `<string>`. Tác nhân người dùng có thể cắt bớt hoặc bỏ qua các chuỗi có nhiều hơn một cụm ký tự đồ họa.

## Định nghĩa hình thức

{{CSSInfo}}

## Cú pháp hình thức

{{csssyntax}}

## Ví dụ

### Ví dụ cơ bản

```css
h2 {
  -webkit-text-emphasis-style: sesame;
  text-emphasis-style: sesame;
}
```

## Đặc tả kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- Các thuộc tính liên quan {{cssxref('text-emphasis-color')}}, {{cssxref('text-emphasis')}}.
- Thuộc tính {{cssxref('text-emphasis-position')}} cho phép xác định vị trí của dấu nhấn mạnh.
