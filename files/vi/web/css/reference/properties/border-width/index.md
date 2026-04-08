---
title: border-width
slug: Web/CSS/Reference/Properties/border-width
page-type: css-shorthand-property
browser-compat: css.properties.border-width
sidebar: cssref
---

Thuộc tính [viết tắt](/en-US/docs/Web/CSS/Guides/Cascade/Shorthand_properties) **`border-width`** [CSS](/en-US/docs/Web/CSS) đặt độ rộng đường viền của một phần tử.

{{InteractiveExample("CSS Demo: border-width")}}

```css interactive-example-choice
border-width: thick;
```

```css interactive-example-choice
border-width: 1em;
```

```css interactive-example-choice
border-width: 4px 1.25em;
```

```css interactive-example-choice
border-width: 2ex 1.25ex 0.5ex;
```

```css interactive-example-choice
border-width: 0 4px 8px 12px;
```

```html interactive-example
<section class="default-example" id="default-example">
  <div class="transition-all" id="example-element">
    This is a box with a border around it.
  </div>
</section>
```

```css interactive-example
#example-element {
  background-color: palegreen;
  color: black;
  border: 0 solid crimson;
  padding: 0.75em;
  width: 80%;
  height: 100px;
}
```

## Thuộc tính thành phần

Thuộc tính này là viết tắt cho các thuộc tính CSS sau:

- {{cssxref("border-bottom-width")}}
- {{cssxref("border-left-width")}}
- {{cssxref("border-right-width")}}
- {{cssxref("border-top-width")}}

## Cú pháp

```css
/* Giá trị từ khóa */
border-width: thin;
border-width: medium;
border-width: thick;

/* Giá trị <length> */
border-width: 4px;
border-width: 1.2rem;

/* trên và dưới | trái và phải */
border-width: 2px 1.5em;

/* trên | trái và phải | dưới */
border-width: 1px 2em 1.5cm;

/* trên | phải | dưới | trái */
border-width: 1px 2em 0 4rem;

/* Giá trị toàn cục */
border-width: inherit;
border-width: initial;
border-width: revert;
border-width: revert-layer;
border-width: unset;
```

Thuộc tính `border-width` có thể được chỉ định bằng một, hai, ba hoặc bốn giá trị.

- Khi chỉ định **một** giá trị, nó áp dụng cùng độ rộng cho **cả bốn cạnh**.
- Khi chỉ định **hai** giá trị, giá trị đầu tiên áp dụng cho **cạnh trên và dưới**, giá trị thứ hai áp dụng cho **cạnh trái và phải**.
- Khi chỉ định **ba** giá trị, giá trị đầu tiên áp dụng cho **cạnh trên**, giá trị thứ hai áp dụng cho **cạnh trái và phải**, giá trị thứ ba áp dụng cho **cạnh dưới**.
- Khi chỉ định **bốn** giá trị, các độ rộng được áp dụng theo thứ tự **trên**, **phải**, **dưới**, **trái** (theo chiều kim đồng hồ).

### Giá trị

- `<line-width>`
  - : Định nghĩa độ rộng của đường viền, có thể là giá trị {{cssxref("&lt;length&gt;")}} không âm tường minh hoặc một từ khóa. Nếu là từ khóa, nó phải là một trong các giá trị sau:
    - `thin`
      - Tương đương `1px`.
    - `medium`
      - Tương đương `3px`.
    - `thick`
      - Tương đương `5px`.

## Định nghĩa hình thức

{{CSSInfo}}

## Cú pháp hình thức

{{csssyntax}}

## Ví dụ

### Kết hợp giá trị và độ dài

#### HTML

```html
<p id="one-value">một giá trị: đường viền rộng 6px trên cả 4 cạnh</p>
<p id="two-values">
  hai giá trị khác nhau: đường viền rộng 2px ở trên và dưới, rộng 10px ở phải và
  trái
</p>
<p id="three-values">
  ba giá trị khác nhau: 0.3em ở trên, 9px ở dưới, và độ rộng bằng 0 ở phải và
  trái
</p>
<p id="four-values">
  bốn giá trị khác nhau: "thin" ở trên, "medium" ở phải, "thick" ở dưới, và 1em
  ở trái
</p>
```

#### CSS

```css
#one-value {
  border: ridge #cccccc;
  border-width: 6px;
}
#two-values {
  border: solid red;
  border-width: 2px 10px;
}
#three-values {
  border: dotted orange;
  border-width: 0.3em 0 9px;
}
#four-values {
  border: solid lightgreen;
  border-width: thin medium thick 1em;
}
p {
  width: auto;
  margin: 0.25em;
  padding: 0.25em;
}
```

#### Kết quả

{{ EmbedLiveSample('A_mix_of_values_and_lengths', 320, 320) }}

## Thông số kỹ thuật

{{Specifications}}

## Khả năng tương thích trình duyệt

{{Compat}}

## Xem thêm

- Các thuộc tính viết tắt liên quan đến đường viền: {{Cssxref("border")}}, {{Cssxref("border-style")}}, {{Cssxref("border-color")}}
- Các thuộc tính liên quan đến độ rộng đường viền: {{Cssxref("border-bottom-width")}}, {{Cssxref("border-left-width")}}, {{Cssxref("border-right-width")}}, {{Cssxref("border-top-width")}}
