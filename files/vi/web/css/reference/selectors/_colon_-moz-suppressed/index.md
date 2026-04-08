---
title: :-moz-suppressed
slug: Web/CSS/Reference/Selectors/:-moz-suppressed
page-type: css-pseudo-class
status:
  - non-standard
sidebar: cssref
---

{{Non-standard_header}}

**`:-moz-suppressed`** là [lớp giả](/vi/docs/Web/CSS/Reference/Selectors/Pseudo-classes) [CSS](/vi/docs/Web/CSS) là một [phần mở rộng Mozilla](/vi/docs/Web/CSS/Reference/Mozilla_extensions) khớp với các phần tử đại diện cho các hình ảnh bị chặn vì việc tải hình ảnh từ trang web đã chỉ định đã bị chặn.

> [!NOTE]
> Bộ chọn này chủ yếu được thiết kế để sử dụng bởi các nhà phát triển theme.

## Cú pháp

```css
:-moz-suppressed {
  /* ... */
}
```

## Ví dụ

### Tạo kiểu cho các phần tử đã bị chặn

```css
:-moz-suppressed {
  background: yellow;
  padding: 8px;
}
```

## Thông số kỹ thuật

Không thuộc bất kỳ tiêu chuẩn nào.

## Xem thêm

- {{cssxref(":-moz-broken")}}, {{cssxref(":-moz-loading")}}, {{cssxref(":-moz-user-disabled")}}
