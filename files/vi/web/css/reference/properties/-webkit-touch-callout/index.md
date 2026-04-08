---
title: -webkit-touch-callout
slug: Web/CSS/Reference/Properties/-webkit-touch-callout
page-type: css-property
status:
  - non-standard
browser-compat: css.properties.-webkit-touch-callout
sidebar: cssref
---

{{Non-standard_header}}

Thuộc tính [CSS](/en-US/docs/Web/CSS) `-webkit-touch-callout` kiểm soát việc hiển thị hộp thông tin mặc định xuất hiện khi bạn chạm và giữ vào một đối tượng cảm ứng.

Khi một đối tượng được chạm và giữ trên iOS, Safari hiển thị một hộp thông tin về liên kết đó. Thuộc tính này cho phép tắt hành vi đó.

## Cú pháp

```css
/* Giá trị từ khóa */
-webkit-touch-callout: default;
-webkit-touch-callout: none;

/* Giá trị toàn cục */
-webkit-touch-callout: initial;
-webkit-touch-callout: inherit;
-webkit-touch-callout: revert;
-webkit-touch-callout: revert-layer;
-webkit-touch-callout: unset;
```

### Giá trị

- `default`
  - : Hộp thông tin mặc định được hiển thị.
- `none`
  - : Hộp thông tin bị tắt.

## Định nghĩa hình thức

{{CSSInfo}}

## Cú pháp hình thức

{{CSSSyntaxRaw(`-webkit-touch-callout = default | none`)}}

## Ví dụ

### Tắt hộp thông tin cảm ứng

```css
.example {
  -webkit-touch-callout: none;
}
```

## Đặc tả kỹ thuật

Không thuộc bất kỳ tiêu chuẩn nào. Apple có [mô tả trong Safari CSS Reference](https://developer.apple.com/library/archive/documentation/AppleApplications/Reference/SafariCSSRef/Articles/StandardCSSProperties.html#//apple_ref/doc/uid/TP30001266-_webkit_touch_callout).

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Các phần mở rộng CSS của WebKit](/en-US/docs/Web/CSS/Reference/Webkit_extensions)
- [-webkit-touch-callout trong tài liệu lập trình viên Apple](https://developer.apple.com/library/archive/documentation/AppleApplications/Reference/SafariCSSRef/Articles/StandardCSSProperties.html#//apple_ref/doc/uid/TP30001266-_webkit_touch_callout)
