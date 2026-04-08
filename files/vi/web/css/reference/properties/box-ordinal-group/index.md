---
title: box-ordinal-group
slug: Web/CSS/Reference/Properties/box-ordinal-group
page-type: css-property
status:
  - deprecated
  - non-standard
browser-compat: css.properties.box-ordinal-group
sidebar: cssref
---

{{Non-standard_Header}}{{Deprecated_Header}}

> [!WARNING]
> Đây là thuộc tính thuộc bản thảo đặc tả gốc của CSS Flexible Box Layout Module. Nó đã được thay thế trong đặc tả. Xem [flexbox](/en-US/docs/Web/CSS/Guides/Flexible_box_layout/Basic_concepts) để biết thông tin về tiêu chuẩn hiện hành.

Thuộc tính [CSS](/en-US/docs/Web/CSS) **`box-ordinal-group`** gán các phần tử con của flexbox vào một nhóm thứ tự.

Các nhóm thứ tự có thể được sử dụng kết hợp với thuộc tính {{CSSxRef("box-direction")}} để kiểm soát thứ tự hiển thị của các phần tử con trực tiếp của hộp. Khi `box-direction` tính toán là `normal`, hộp sẽ hiển thị các phần tử của nó bắt đầu từ nhóm thứ tự có số thấp nhất và đảm bảo rằng các phần tử đó xuất hiện bên trái (đối với hộp ngang) hoặc ở trên cùng (đối với hộp dọc) của container. Các phần tử trong cùng nhóm thứ tự được hiển thị theo thứ tự chúng xuất hiện trong cây tài liệu nguồn. Theo hướng ngược lại, các nhóm thứ tự được xem xét theo cùng thứ tự, ngoại trừ các phần tử xuất hiện theo chiều ngược lại.

## Cú pháp

```css
/* <integer> values */
box-ordinal-group: 1;
box-ordinal-group: 5;

/* Global values */
box-ordinal-group: inherit;
box-ordinal-group: initial;
box-ordinal-group: unset;
```

Thuộc tính `box-ordinal-group` được chỉ định là bất kỳ {{CSSxRef("&lt;integer&gt;")}} dương nào.

## Định nghĩa hình thức

{{CSSInfo}}

## Cú pháp hình thức

{{CSSSyntaxRaw(`box-ordinal-group = <integer>`)}}

## Ví dụ

### Ví dụ sử dụng cơ bản

Trong phiên bản cũ hơn của đặc tả, `box-ordinal-group` được đưa vào để cho phép bạn thay đổi thứ tự hiển thị của các phần tử con flex bên trong flex container:

```css
article:nth-child(1) {
  -webkit-box-ordinal-group: 2;
  -moz-box-ordinal-group: 2;
  box-ordinal-group: 2;
}

article:nth-child(2) {
  -webkit-box-ordinal-group: 1;
  -moz-box-ordinal-group: 1;
  box-ordinal-group: 1;
}
```

Tương đương flexbox hiện đại là {{cssxref("order")}}.

## Đặc tả

Không thuộc bất kỳ tiêu chuẩn nào.

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{CSSxRef("flex")}}
- {{CSSxRef("flex-basis")}}
- {{CSSxRef("flex-grow")}}
- {{CSSxRef("flex-shrink")}}
