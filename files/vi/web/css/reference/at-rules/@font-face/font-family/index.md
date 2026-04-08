---
title: font-family
slug: Web/CSS/Reference/At-rules/@font-face/font-family
page-type: css-at-rule-descriptor
browser-compat: css.at-rules.font-face.font-family
sidebar: cssref
---

Descriptor CSS **`font-family`** đặt họ font cho một font được chỉ định trong at-rule {{cssxref("@font-face")}}.

Giá trị được sử dụng để khớp tên với một `@font-face` cụ thể khi tạo kiểu các phần tử bằng thuộc tính {{cssxref("font-family")}}. Bất kỳ tên nào cũng có thể được sử dụng, và điều này ghi đè bất kỳ tên nào được chỉ định trong dữ liệu font cơ bản.

## Cú pháp

```css
/* Giá trị <string> */
font-family: "font family";
font-family: "another font family";

/* Giá trị <custom-ident> */
font-family: example-font;
```

### Giá trị

- `<family-name>`
  - : Chỉ định tên của họ font.

## Định nghĩa hình thức

{{cssinfo}}

## Cú pháp hình thức

{{csssyntax}}

## Ví dụ

### Đặt tên họ font

```css
@font-face {
  font-family: "Some font family";
  src: url("some_font_name.ttf");
}
```

## Thông số kỹ thuật

{{Specifications}}

## Khả năng tương thích với trình duyệt

{{Compat}}

## Xem thêm

- {{cssxref("@font-face/font-display", "font-display")}}
- {{cssxref("@font-face/font-stretch", "font-stretch")}}
- {{cssxref("@font-face/font-style", "font-style")}}
- {{cssxref("@font-face/font-weight", "font-weight")}}
- {{cssxref("font-feature-settings", "font-feature-settings")}}
- {{cssxref("@font-face/font-variation-settings", "font-variation-settings")}}
- {{cssxref("@font-face/src", "src")}}
- {{cssxref("@font-face/unicode-range", "unicode-range")}}
