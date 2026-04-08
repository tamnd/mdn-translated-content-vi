---
title: <dimension>
slug: Web/CSS/Reference/Values/dimension
page-type: css-type
browser-compat: css.types.dimension
sidebar: cssref
---

Kiểu dữ liệu **`<dimension>`** trong [CSS](/vi/docs/Web/CSS) biểu diễn một {{CSSxRef("&lt;number&gt;")}} với đơn vị đi kèm, ví dụ `10px`.

CSS dùng kích thước để chỉ định khoảng cách ({{CSSxRef("&lt;length&gt;")}}), thời lượng ({{CSSxRef("&lt;time&gt;")}}), tần số ({{CSSxRef("&lt;frequency&gt;")}}), độ phân giải ({{cssxref("resolution")}}) và các đại lượng khác.

## Cú pháp

Cú pháp của `<dimension>` là một {{CSSxRef("&lt;number&gt;")}} theo sau ngay lập tức bởi một đơn vị là một định danh. Định danh đơn vị không phân biệt chữ hoa/thường.

## Ví dụ

### Kích thước hợp lệ

```plain example-good
12px      12 pixel
1rem      1 rem
1.2pt     1.2 điểm
2200ms    2200 mili giây
5s        5 giây
200hz     200 Hertz
200Hz     200 Hertz (các giá trị không phân biệt chữ hoa/thường)
```

### Kích thước không hợp lệ

```plain example-bad
12 px       Đơn vị phải đứng ngay sau số.
12"px"      Đơn vị là định danh và do đó không được trích dẫn.
3sec        Đơn vị giây được viết tắt là "s" chứ không phải "sec".
```

## Thông số kỹ thuật

{{Specifications}}

## Khả năng tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Các kiểu dữ liệu CSS](/vi/docs/Web/CSS/Reference/Values/Data_types)
- [Tìm hiểu cách tạo kiểu HTML bằng CSS](/vi/docs/Learn_web_development/Core/Styling_basics)
- Khoảng cách CSS ({{CSSxRef("&lt;length&gt;")}}), thời lượng ({{CSSxRef("&lt;time&gt;")}}), tần số ({{CSSxRef("&lt;frequency&gt;")}}), và độ phân giải ({{cssxref("resolution")}})
