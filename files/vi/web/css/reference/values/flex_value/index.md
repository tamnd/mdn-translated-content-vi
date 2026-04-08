---
title: <flex>
slug: Web/CSS/Reference/Values/flex_value
page-type: css-type
browser-compat: css.types.flex
sidebar: cssref
---

Kiểu dữ liệu **`<flex>`** trong [CSS](/vi/docs/Web/CSS) biểu thị độ dài linh hoạt trong một grid container. Nó được dùng trong {{cssxref("grid-template-columns")}}, {{cssxref("grid-template-rows")}} và các thuộc tính liên quan khác.

## Cú pháp

Kiểu dữ liệu `<flex>` được chỉ định bằng một {{cssxref("&lt;number&gt;")}} theo sau là đơn vị `fr`. Đơn vị `fr` đại diện cho một phần của không gian còn lại trong grid container. Như với tất cả các kích thước CSS, không có khoảng trắng giữa đơn vị và số.

## Ví dụ

### Ví dụ về các giá trị hợp lệ cho kiểu dữ liệu fr

```plain
1fr    /* Dùng giá trị nguyên */
2.5fr  /* Dùng giá trị thực */
```

### Ví dụ sử dụng trong danh sách track của bố cục CSS grid

```css
.grid {
  display: grid;
  grid-template-columns: 1fr 1fr 2.5fr 1.5fr;
}
```

## Thông số kỹ thuật

{{Specifications}}

## Khả năng tương thích trình duyệt

{{Compat}}

## Xem thêm

- [CSS grid layout](/vi/docs/Web/CSS/Guides/Grid_layout)
