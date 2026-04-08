---
title: :-moz-loading
slug: Web/CSS/Reference/Selectors/:-moz-loading
page-type: css-pseudo-class
status:
  - non-standard
sidebar: cssref
---

{{Non-standard_header}}

**`:-moz-loading`** là [lớp giả](/vi/docs/Web/CSS/Reference/Selectors/Pseudo-classes) [CSS](/vi/docs/Web/CSS) là một [phần mở rộng Mozilla](/vi/docs/Web/CSS/Reference/Mozilla_extensions) khớp với các phần tử không thể hiển thị vì chúng chưa bắt đầu tải, chẳng hạn như các hình ảnh chưa bắt đầu đến. Lưu ý rằng các hình ảnh _đang trong quá trình_ tải _không_ được khớp bởi lớp giả này.

> [!NOTE]
> Bộ chọn này chủ yếu được thiết kế để sử dụng bởi các nhà phát triển theme.

## Cú pháp

```css
:-moz-loading {
  /* ... */
}
```

## Ví dụ

### Đặt nền cho các hình ảnh đang tải

```css
:-moz-loading {
  background: url("loading-animation.gif") center no-repeat;
}
```

## Thông số kỹ thuật

Không thuộc bất kỳ tiêu chuẩn nào.

## Xem thêm

- {{cssxref(":-moz-broken")}}, {{cssxref(":-moz-suppressed")}}, {{cssxref(":-moz-user-disabled")}}
