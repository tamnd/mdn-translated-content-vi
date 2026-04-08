---
title: :right
slug: Web/CSS/Reference/Selectors/:right
page-type: css-pseudo-class
browser-compat: css.selectors.right
sidebar: cssref
---

Lớp giả **`:right`** trong [CSS](/en-US/docs/Web/CSS) ([pseudo-class](/en-US/docs/Web/CSS/Reference/Selectors/Pseudo-classes)), được sử dụng với at-rule {{cssxref("@page")}}, đại diện cho tất cả các trang bên phải của tài liệu được in.

```css
/* Selects any right-hand pages when printing */
@page :right {
  margin: 2in 3in;
}
```

Việc một trang nhất định là "trái" hay "phải" được xác định bởi hướng viết chính của tài liệu. Ví dụ, nếu trang đầu tiên có hướng viết chính là trái-sang-phải thì nó sẽ là trang `:right`; nếu nó có hướng viết chính là phải-sang-trái thì nó sẽ là trang {{Cssxref(":left")}}.

> [!NOTE]
> Lớp giả này chỉ có thể được sử dụng để thay đổi các thuộc tính {{ Cssxref("margin") }}, {{ Cssxref("padding") }}, {{ Cssxref("border") }}, và {{ Cssxref("background") }} của _hộp trang_. Tất cả các thuộc tính khác sẽ bị bỏ qua, và chỉ hộp trang, không phải nội dung tài liệu trên trang, mới bị ảnh hưởng.

## Cú pháp

```css
:right {
  /* ... */
}
```

## Ví dụ

### Đặt lề cho các trang bên phải

```css
@page :right {
  margin: 2in 3in;
}
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{ Cssxref("@page") }}
- Các lớp giả liên quan đến trang khác: {{ Cssxref(":first") }}, {{ Cssxref(":left") }}
