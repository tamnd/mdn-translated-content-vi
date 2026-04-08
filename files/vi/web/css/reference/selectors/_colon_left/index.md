---
title: :left
slug: Web/CSS/Reference/Selectors/:left
page-type: css-pseudo-class
browser-compat: css.selectors.left
sidebar: cssref
---

[Lớp giả](/en-US/docs/Web/CSS/Reference/Selectors/Pseudo-classes) [CSS](/en-US/docs/Web/CSS) **`:left`**, được dùng với [at-rule](/en-US/docs/Web/CSS/Guides/Syntax/At-rules) {{cssxref("@page")}}, đại diện cho tất cả các trang bên trái của tài liệu in.

```css
/* Selects any left-hand pages when printing */
@page :left {
  margin: 2in 3in;
}
```

Một trang nhất định là "trái" hay "phải" được xác định bởi hướng viết chính của tài liệu. Ví dụ, nếu trang đầu tiên có hướng viết chính là trái sang phải thì nó sẽ là trang {{Cssxref(":right")}}; nếu có hướng viết chính là phải sang trái thì nó sẽ là trang `:left`.

> [!NOTE]
> Lớp giả này chỉ có thể dùng để thay đổi các thuộc tính {{ Cssxref("margin") }}, {{ Cssxref("padding") }}, {{ Cssxref("border") }} và {{ Cssxref("background") }} của _hộp trang_. Tất cả các thuộc tính khác sẽ bị bỏ qua, và chỉ hộp trang, không phải nội dung tài liệu trên trang, bị ảnh hưởng.

## Cú pháp

```css
:left {
  /* ... */
}
```

## Ví dụ

### Đặt lề cho các trang bên trái

```css
@page :left {
  margin: 2in 3in;
}
```

## Đặc tả

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{ Cssxref("@page") }}
- Các lớp giả liên quan đến trang: {{ Cssxref(":first") }}, {{ Cssxref(":right") }}
