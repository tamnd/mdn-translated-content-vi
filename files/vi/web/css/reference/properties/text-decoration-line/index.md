---
title: text-decoration-line
slug: Web/CSS/Reference/Properties/text-decoration-line
page-type: css-property
browser-compat: css.properties.text-decoration-line
sidebar: cssref
---

Thuộc tính [CSS](/en-US/docs/Web/CSS) **`text-decoration-line`** xác định loại trang trí được áp dụng lên văn bản trong một phần tử, chẳng hạn như gạch chân hay gạch trên.

{{InteractiveExample("CSS Demo: text-decoration-line")}}

```css interactive-example-choice
text-decoration-line: none;
```

```css interactive-example-choice
text-decoration-line: underline;
```

```css interactive-example-choice
text-decoration-line: overline;
```

```css interactive-example-choice
text-decoration-line: line-through;
```

```css interactive-example-choice
text-decoration-line: grammar-error;
```

```css interactive-example-choice
text-decoration-line: spelling-error;
```

```css interactive-example-choice
text-decoration-line: underline overline;
```

```css interactive-example-choice
text-decoration-line: underline line-through;
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

Khi cần đặt nhiều thuộc tính trang trí đường văn bản cùng một lúc, có thể tiện hơn khi sử dụng thuộc tính viết tắt {{cssxref("text-decoration")}} thay thế.

## Cú pháp

```css
/* Từ khóa đơn */
text-decoration-line: none;
text-decoration-line: underline;
text-decoration-line: overline;
text-decoration-line: line-through;
text-decoration-line: blink;
text-decoration-line: spelling-error;
text-decoration-line: grammar-error;

/* Nhiều từ khóa */
text-decoration-line: underline overline; /* Hai đường trang trí */
text-decoration-line: overline underline line-through; /* Nhiều đường trang trí */

/* Giá trị toàn cục */
text-decoration-line: inherit;
text-decoration-line: initial;
text-decoration-line: revert;
text-decoration-line: revert-layer;
text-decoration-line: unset;
```

Thuộc tính `text-decoration-line` được chỉ định là `none`, hoặc **một hoặc nhiều** giá trị cách nhau bởi dấu cách từ danh sách bên dưới.

### Giá trị

- `none`
  - : Không tạo ra trang trí văn bản nào.
- `underline`
  - : Mỗi dòng văn bản có một đường trang trí bên dưới.
- `overline`
  - : Mỗi dòng văn bản có một đường trang trí bên trên.
- `line-through`
  - : Mỗi dòng văn bản có một đường trang trí đi qua giữa.
- `blink`
  - : Văn bản nhấp nháy (xen kẽ giữa hiển thị và ẩn). Các tác nhân người dùng tuân thủ có thể không nhấp nháy văn bản. Giá trị này **không còn được khuyến nghị** thay bởi [CSS animations](/en-US/docs/Web/CSS/Reference/Properties/animation).
- `spelling-error`
  - : Mỗi dòng văn bản sử dụng phương pháp đánh dấu lỗi chính tả của tác nhân người dùng, thường là đường chấm màu đỏ trong hầu hết các trình duyệt.
- `grammar-error`
  - : Mỗi dòng văn bản sử dụng phương pháp đánh dấu lỗi ngữ pháp của tác nhân người dùng, thường là đường chấm màu xanh lá trong hầu hết các trình duyệt.

> [!NOTE]
> Khi sử dụng các giá trị `spelling-error` và `grammar-error`, trình duyệt bỏ qua các thuộc tính khác trong thuộc tính viết tắt {{cssxref("text-decoration")}} (chẳng hạn như {{cssxref("text-underline-position")}}, `color` hay `stroke`).

## Định nghĩa hình thức

{{CSSInfo}}

## Cú pháp hình thức

{{csssyntax}}

## Ví dụ

### Ví dụ cơ bản

```html
<p class="wavy">Here's some text with wavy red underline!</p>
<p class="both">This text has lines both above and below it.</p>
```

```css
.wavy {
  text-decoration-line: underline;
  text-decoration-style: wavy;
  text-decoration-color: red;
}

.both {
  text-decoration-line: underline overline;
}
```

{{EmbedLiveSample('basic_example',,90)}}

### Ví dụ lỗi

Trong ví dụ này, đoạn văn đầu tiên chứa một lỗi chính tả và sử dụng kiểu của trình duyệt cho lỗi chính tả trên từ bị sai. Đoạn văn thứ hai sử dụng kiểu của trình duyệt cho lỗi ngữ pháp. Không có thay đổi kiểu trong các trình duyệt không hỗ trợ các giá trị `text-decoration-line` này.

<!-- cSpell:ignore speling -->

```html
<p>This text contains a <span class="spelling">speling</span> mistake.</p>
<p class="grammar">This text contain grammatical errors.</p>
```

```css
.spelling {
  text-decoration-line: spelling-error;
}

.grammar {
  text-decoration-line: grammar-error;
}
```

{{EmbedLiveSample('errors_example',,90)}}

## Đặc tả kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- Khi cần đặt nhiều thuộc tính trang trí đường văn bản cùng một lúc, có thể tiện hơn khi sử dụng thuộc tính viết tắt {{cssxref("text-decoration")}} thay thế, bao gồm cả:
  - {{cssxref("text-decoration-style")}}
  - {{cssxref("text-decoration-color")}}
  - {{cssxref("text-decoration-thickness")}}
- {{cssxref("text-underline-offset")}}
- {{cssxref("::spelling-error")}}
- {{cssxref("::grammar-error")}}
