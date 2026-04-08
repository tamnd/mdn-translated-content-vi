---
title: text-underline-offset
slug: Web/CSS/Reference/Properties/text-underline-offset
page-type: css-property
browser-compat: css.properties.text-underline-offset
sidebar: cssref
---

Thuộc tính **`text-underline-offset`** [CSS](/en-US/docs/Web/CSS) thiết lập khoảng cách bù của đường trang trí văn bản gạch chân (được áp dụng bằng {{cssxref("text-decoration")}}) so với vị trí ban đầu của nó.

{{InteractiveExample("CSS Demo: text-underline-offset")}}

```css interactive-example-choice
text-underline-offset: auto;
```

```css interactive-example-choice
text-underline-offset: 8px;
```

```css interactive-example-choice
text-underline-offset: -0.5rem;
```

```html interactive-example
<section id="default-example">
  <p id="example-element">And after all we are only ordinary</p>
</section>
```

```css interactive-example
p {
  font: 1.5em sans-serif;
  text-decoration-line: underline;
  text-decoration-color: red;
}
```

`text-underline-offset` không phải là một phần của viết tắt {{cssxref('text-decoration')}}. Mặc dù một phần tử có thể có nhiều đường `text-decoration`, nhưng `text-underline-offset` chỉ ảnh hưởng đến gạch chân, và **không** ảnh hưởng đến các tùy chọn trang trí đường khác như `overline` hay `line-through`.

## Cú pháp

```css
/* Từ khóa đơn */
text-underline-offset: auto;

/* độ dài */
text-underline-offset: 0.1em;
text-underline-offset: 3px;

/* phần trăm */
text-underline-offset: 20%;

/* Giá trị toàn cục */
text-underline-offset: inherit;
text-underline-offset: initial;
text-underline-offset: revert;
text-underline-offset: revert-layer;
text-underline-offset: unset;
```

Thuộc tính `text-underline-offset` được chỉ định là một giá trị đơn từ danh sách dưới đây.

### Giá trị

- `auto`
  - : Trình duyệt chọn khoảng bù thích hợp cho gạch chân.
- `<length>`
  - : Chỉ định khoảng bù của gạch chân dưới dạng {{cssxref('length')}}, ghi đè gợi ý từ tệp phông chữ và mặc định của trình duyệt. Khuyến nghị sử dụng đơn vị `em` để khoảng bù điều chỉnh theo kích thước phông chữ.
- `<percentage>`
  - : Chỉ định khoảng bù của gạch chân dưới dạng {{cssxref('percentage')}} của **1 em** trong phông chữ của phần tử. Phần trăm được kế thừa dưới dạng giá trị tương đối, và do đó điều chỉnh theo thay đổi về kích thước phông chữ. Đối với một ứng dụng cụ thể của thuộc tính này, khoảng bù là hằng số trên toàn bộ hộp mà gạch chân được áp dụng, ngay cả khi có các phần tử con với kích thước phông chữ hoặc căn chỉnh dọc khác nhau.

## Định nghĩa hình thức

{{CSSInfo}}

## Cú pháp hình thức

{{csssyntax}}

## Ví dụ

### Minh họa text-underline-offset

```html
<p class="one-line">Here's some text with an offset wavy red underline!</p>
<br />
<p class="two-lines">
  This text has lines both above and below it. Only the bottom one is offset.
</p>
```

```css
p {
  text-decoration: underline wavy red;
  text-underline-offset: 1em;
}

.two-lines {
  text-decoration-color: purple;
  text-decoration-line: underline overline;
}
```

{{EmbedLiveSample('Examples')}}

## Đặc tả

{{Specifications}}

## Khả năng tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{cssxref("text-decoration")}}
- {{cssxref("text-decoration-thickness")}}
