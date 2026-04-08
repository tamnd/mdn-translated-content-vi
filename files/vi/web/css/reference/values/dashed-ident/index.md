---
title: <dashed-ident>
slug: Web/CSS/Reference/Values/dashed-ident
page-type: css-type
spec-urls: https://drafts.csswg.org/css-values/#dashed-idents
sidebar: cssref
---

Kiểu dữ liệu **`<dashed-ident>`** trong [CSS](/vi/docs/Web/CSS) là một {{cssxref("custom-ident")}} phân biệt chữ hoa/thường, bắt đầu bằng hai dấu gạch ngang, biểu thị một chuỗi tùy ý được dùng như một {{glossary("identifier", "định danh")}}.

## Cú pháp

Cú pháp của `<dashed-ident>` tương tự như các định danh CSS (chẳng hạn như tên thuộc tính), ngoại trừ việc nó phân biệt chữ hoa/thường. Đây là một định danh do người dùng định nghĩa, bắt đầu bằng hai dấu gạch ngang (`--`).

Dấu gạch ngang kép ở đầu giúp dễ dàng nhận biết khi đọc qua một khối mã CSS, và giúp tránh xung đột tên với các từ khóa CSS tiêu chuẩn.

Giống như {{cssxref("custom-ident")}}, `<dashed-ident>` được định nghĩa bởi người dùng. Tuy nhiên, một số `<custom-ident>` được định nghĩa bởi chính ngôn ngữ CSS; còn `<dashed-ident>` sẽ không bao giờ được định nghĩa trong CSS.

## Ví dụ

### Sử dụng với thuộc tính tùy chỉnh CSS

Khi `<dashed-ident>` được dùng như một [thuộc tính tùy chỉnh CSS](/vi/docs/Web/CSS/Guides/Cascading_variables/Using_custom_properties), thuộc tính được khai báo trước, sau đó `<dashed-ident>` được dùng trong [hàm CSS `var()`](/vi/docs/Web/CSS/Reference/Values/var).

```css
html {
  --primary-color: red;
  --secondary-color: blue;
  --tertiary-color: green;
}

h1,
h4 {
  color: var(--primary-color);
}

h2,
h5 {
  color: var(--secondary-color);
}

h3,
h6 {
  color: var(--tertiary-color);
}
```

### Sử dụng với @color-profile

Khi `<dashed-ident>` được dùng với at-rule {{cssxref("@color-profile")}}, at-rule được khai báo trước, sau đó `<dashed-ident>` được dùng trong [hàm CSS `color()`](/vi/docs/Web/CSS/Reference/Values/color_value/color).

```css
@color-profile --my-color-profile {
  src: url("https://example.org/SWOP2006_Coated5v2.icc");
}

.header {
  background-color: color(--my-color-profile 0% 70% 20% 0%);
}
```

### Sử dụng với @font-palette-values

Khi `<dashed-ident>` được dùng với at-rule {{cssxref("@font-palette-values")}}, at-rule được khai báo trước, sau đó `<dashed-ident>` được dùng làm giá trị cho thuộc tính {{cssxref("font-palette")}}.

```css
@font-palette-values --my-palette {
  font-family: "Bixa";
  base-palette: 1;
  override-colors: 0 red;
}

h1,
h2,
h3,
h4 {
  font-palette: --my-palette;
}
```

## Thông số kỹ thuật

{{Specifications}}

## Khả năng tương thích trình duyệt

_Vì kiểu này không phải là kiểu thực sự mà chỉ là kiểu tiện ích dùng để đơn giản hóa định nghĩa các cú pháp CSS khác, nên không có thông tin khả năng tương thích trình duyệt._

## Xem thêm

- {{cssxref("ident")}}
- {{cssxref("custom-ident")}}
