---
title: :-moz-broken
slug: Web/CSS/Reference/Selectors/:-moz-broken
page-type: css-pseudo-class
status:
  - deprecated
  - non-standard
browser-compat: css.selectors.-moz-broken
sidebar: cssref
---

{{Non-standard_header}}{{deprecated_header}}

**`:-moz-broken`** là [lớp giả](/vi/docs/Web/CSS/Reference/Selectors/Pseudo-classes) [CSS](/vi/docs/Web/CSS) là một [phần mở rộng Mozilla](/vi/docs/Web/CSS/Reference/Mozilla_extensions) khớp với các phần tử đại diện cho các liên kết hình ảnh bị hỏng.

> [!NOTE]
> Bộ chọn này chủ yếu được thiết kế để sử dụng bởi các nhà phát triển theme.

## Cú pháp

```css
:-moz-broken {
  /* ... */
}
```

## Ví dụ

### HTML

```html
<img src="broken.jpg" alt="This image is broken. :-(" />
```

### CSS

```css
:-moz-broken {
  background: bisque;
  padding: 8px;
}
```

### Kết quả

{{EmbedLiveSample("Examples")}}

## Thông số kỹ thuật

Không thuộc bất kỳ tiêu chuẩn nào.

## Khả năng tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{cssxref(":-moz-loading")}}, {{cssxref(":-moz-suppressed")}}, {{cssxref(":-moz-user-disabled")}}
- [Firefox bug 11011](https://bugzil.la/11011)
