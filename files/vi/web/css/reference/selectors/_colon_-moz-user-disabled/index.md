---
title: :-moz-user-disabled
slug: Web/CSS/Reference/Selectors/:-moz-user-disabled
page-type: css-pseudo-class
status:
  - non-standard
sidebar: cssref
---

{{Non-standard_header}}

**`:-moz-user-disabled`** là [lớp giả](/vi/docs/Web/CSS/Reference/Selectors/Pseudo-classes) [CSS](/vi/docs/Web/CSS) là một [phần mở rộng Mozilla](/vi/docs/Web/CSS/Reference/Mozilla_extensions) khớp với các phần tử đại diện cho các hình ảnh không được tải vì hình ảnh đã bị tắt hoàn toàn theo tùy chọn của người dùng.

> [!NOTE]
> Bộ chọn này chủ yếu được thiết kế để sử dụng bởi các nhà phát triển theme.

## Cú pháp

```css
:-moz-user-disabled {
  /* ... */
}
```

## Ví dụ

### Tạo kiểu cho các phần tử bị tắt bởi người dùng

```css
:-moz-user-disabled {
  background-color: lightgray;
  padding: 8px;
}
```

## Thông số kỹ thuật

Không thuộc bất kỳ tiêu chuẩn nào.

## Xem thêm

- {{cssxref(":-moz-broken")}}, {{cssxref(":-moz-loading")}}, {{cssxref(":-moz-suppressed")}}
