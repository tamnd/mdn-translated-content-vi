---
title: text-decoration-thickness
slug: Web/CSS/Reference/Properties/text-decoration-thickness
page-type: css-property
browser-compat: css.properties.text-decoration-thickness
sidebar: cssref
---

Thuộc tính [CSS](/en-US/docs/Web/CSS) **`text-decoration-thickness`** xác định độ dày nét vẽ của đường trang trí văn bản, chẳng hạn như đường gạch ngang, gạch chân hay gạch trên.

{{InteractiveExample("CSS Demo: text-decoration-thickness")}}

```css interactive-example-choice
text-decoration-line: underline;
text-decoration-thickness: 3px;
```

```css interactive-example-choice
text-decoration-line: line-through;
text-decoration-thickness: 0.4rem;
```

```css interactive-example-choice
text-decoration-line: underline overline;
text-decoration-thickness: from-font;
font-size: 2rem;
```

```html interactive-example
<section id="default-example">
  <p id="example-element">
    Confusion kissed me on the cheek, and left a taste so bittersweet
  </p>
</section>
```

```css interactive-example
p {
  font: 1.5em sans-serif;
  text-decoration-color: red;
}
```

## Cú pháp

```css
/* Từ khóa đơn */
text-decoration-thickness: auto;
text-decoration-thickness: from-font;

/* độ dài */
text-decoration-thickness: 0.1em;
text-decoration-thickness: 3px;

/* phần trăm */
text-decoration-thickness: 10%;

/* Giá trị toàn cục */
text-decoration-thickness: inherit;
text-decoration-thickness: initial;
text-decoration-thickness: revert;
text-decoration-thickness: revert-layer;
text-decoration-thickness: unset;
```

### Giá trị

- `auto`
  - : Trình duyệt chọn độ rộng phù hợp cho đường trang trí văn bản.
- `from-font`
  - : Nếu tệp phông chữ bao gồm thông tin về độ dày ưa thích, hãy sử dụng giá trị đó. Nếu tệp phông chữ không bao gồm thông tin này, hành vi như thể `auto` được đặt, với trình duyệt chọn độ dày phù hợp.
- `<length>`
  - : Chỉ định độ dày của đường trang trí văn bản là một {{cssxref('length')}}, ghi đè gợi ý của tệp phông chữ hoặc mặc định của trình duyệt.
- `<percentage>`
  - : Chỉ định độ dày của đường trang trí văn bản là một {{cssxref('percentage')}} của **1em** trong phông chữ hiện tại. Phần trăm được kế thừa dưới dạng giá trị tương đối, và do đó thay đổi theo kích thước phông chữ. Trình duyệt phải sử dụng tối thiểu 1 pixel thiết bị. Đối với một ứng dụng cụ thể của thuộc tính này, độ dày không đổi trên toàn bộ hộp được áp dụng, ngay cả khi có các phần tử con với kích thước phông chữ khác.

## Định nghĩa hình thức

{{CSSInfo}}

## Cú pháp hình thức

{{csssyntax}}

## Ví dụ

### Độ dày thay đổi

#### HTML

```html
<p class="thin">Here's some text with a 1px red underline.</p>
<p class="thick">This one has a 5px red underline.</p>
<p class="shorthand">This uses the equivalent shorthand.</p>
```

#### CSS

```css
.thin {
  text-decoration-line: underline;
  text-decoration-style: solid;
  text-decoration-color: red;
  text-decoration-thickness: 1px;
}

.thick {
  text-decoration-line: underline;
  text-decoration-style: solid;
  text-decoration-color: red;
  text-decoration-thickness: 5px;
}

.shorthand {
  text-decoration: underline solid red 5px;
}
```

#### Kết quả

{{EmbedLiveSample('Varying_thickness')}}

## Đặc tả kỹ thuật

{{Specifications}}

> [!NOTE]
> Thuộc tính này trước đây được gọi là `text-decoration-width`, nhưng đã được cập nhật thành `text-decoration-thickness` vào năm 2019.

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{cssxref("text-decoration")}}
- {{cssxref("text-underline-offset")}}
