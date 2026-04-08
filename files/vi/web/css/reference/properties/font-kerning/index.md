---
title: font-kerning
slug: Web/CSS/Reference/Properties/font-kerning
page-type: css-property
browser-compat: css.properties.font-kerning
sidebar: cssref
---

Thuộc tính **`font-kerning`** [CSS](/en-US/docs/Web/CSS) đặt việc sử dụng thông tin kerning được lưu trữ trong font.

{{InteractiveExample("CSS Demo: font-kerning")}}

```css interactive-example-choice
font-kerning: auto;
```

```css interactive-example-choice
font-kerning: normal;
```

```css interactive-example-choice
font-kerning: none;
```

```html interactive-example
<section class="default-example" id="default-example">
  <div class="transition-all" id="example-element">
    "We took Tracy to see 'THE WATERFALL' in W. Virginia."
  </div>
</section>
```

```css interactive-example
section {
  font-family: serif;
}
```

_Kerning_ ảnh hưởng đến cách các chữ cái được sắp xếp. Trong các font có _kerning tốt_, tính năng này làm cho khoảng cách ký tự đồng đều và dễ đọc hơn bằng cách giảm khoảng trắng giữa một số tổ hợp ký tự nhất định.

Ví dụ trong hình dưới đây, các mẫu bên trái không dùng kerning, trong khi các mẫu bên phải có dùng:

![Ví dụ về font-kerning](font-kerning.png)

## Cú pháp

```css
font-kerning: auto;
font-kerning: normal;
font-kerning: none;

/* Giá trị toàn cục */
font-kerning: inherit;
font-kerning: initial;
font-kerning: revert;
font-kerning: revert-layer;
font-kerning: unset;
```

### Các giá trị

- `auto`
  - : Trình duyệt xác định xem có nên dùng kerning font hay không. Ví dụ, một số trình duyệt sẽ tắt kerning trên các font nhỏ vì việc áp dụng có thể gây hại cho khả năng đọc của văn bản.
- `normal`
  - : Thông tin kerning font được lưu trữ trong font phải được áp dụng.
- `none`
  - : Thông tin kerning font được lưu trữ trong font bị vô hiệu hóa.

## Định nghĩa hình thức

{{cssinfo}}

## Cú pháp hình thức

{{csssyntax}}

## Ví dụ

### Bật và tắt kerning

#### HTML

```html
<div id="kern"></div>
<div id="no-kern"></div>
<textarea id="input">AV T. ij</textarea>
```

#### CSS

```css
div {
  font-size: 2rem;
  font-family: serif;
}

#no-kern {
  font-kerning: none;
}

#kern {
  font-kerning: normal;
}
```

#### JavaScript

```js
const input = document.getElementById("input");
const kern = document.getElementById("kern");
const noKern = document.getElementById("no-kern");

input.addEventListener("keyup", () => {
  kern.textContent = input.value; /* Update content */
  noKern.textContent = input.value;
});

kern.textContent = input.value; /* Initialize content */
noKern.textContent = input.value;
```

{{ EmbedLiveSample('Enabling_and_disabling_kerning') }}

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{cssxref("font-variant")}}, {{cssxref("font-variant-position")}}, {{cssxref("font-variant-east-asian")}}, {{cssxref("font-variant-caps")}}, {{cssxref("font-variant-ligatures")}}, {{cssxref("font-variant-numeric")}}, {{cssxref("font-variant-alternates")}}, {{cssxref("font-synthesis")}}, {{cssxref("letter-spacing")}}
