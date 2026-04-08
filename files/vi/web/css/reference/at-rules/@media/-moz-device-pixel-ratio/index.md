---
title: -moz-device-pixel-ratio
slug: Web/CSS/Reference/At-rules/@media/-moz-device-pixel-ratio
page-type: css-media-feature
status:
  - deprecated
  - non-standard
browser-compat: css.at-rules.media.-moz-device-pixel-ratio
sidebar: cssref
---

{{Non-standard_header}} {{Deprecated_header}}

Tính năng phương tiện **`-moz-device-pixel-ratio`** [CSS](/en-US/docs/Web/CSS) dành riêng cho Gecko [media feature](/en-US/docs/Web/CSS/Reference/At-rules/@media#media_features) có thể được dùng để áp dụng các kiểu dáng dựa trên số pixel thiết bị trên mỗi pixel CSS.

> [!WARNING]
> Không sử dụng tính năng này. Thay vào đó hãy sử dụng tính năng [`resolution`](/en-US/docs/Web/CSS/Reference/At-rules/@media/resolution) với đơn vị `dppx`.

> [!NOTE]
> Tính năng phương tiện này cũng được WebKit triển khai là `-webkit-device-pixel-ratio`. Các tiền tố min và max như được Gecko triển khai có tên là `min--moz-device-pixel-ratio` và `max--moz-device-pixel-ratio`; nhưng các tiền tố tương tự như WebKit triển khai có tên là `-webkit-min-device-pixel-ratio` và `-webkit-max-device-pixel-ratio`.

## Cú pháp

- {{cssxref("&lt;number&gt;")}}
  - : Số pixel thiết bị trên mỗi pixel CSS.

**Phương tiện:** {{cssxref("@media")}}
**Chấp nhận tiền tố min/max:** có

## Ví dụ

### Ví dụ tương thích cơ bản

`-moz-device-pixel-ratio` có thể được dùng để tương thích với Firefox phiên bản cũ hơn 16, và cùng với `-webkit-device-pixel-ratio` để tương thích với các trình duyệt dựa trên WebKit không hỗ trợ `dppx`.

Ví dụ:

```css
/* First, set for WebKit-based browsers */
@media (-webkit-min-device-pixel-ratio: 2),
  (min--moz-device-pixel-ratio: 2) /* Older Firefox browsers (prior to firefox 16) */,
  (min-resolution: 2dppx) /* The standard way */,
  (min-resolution: 192dpi); /* dppx fallback */
```

> [!NOTE]
> Xem [bài viết CSSWG](https://www.w3.org/blog/CSS/2012/06/14/unprefix-webkit-device-pixel-ratio/) này để biết các thực hành tốt về tương thích liên quan đến `resolution` và `dppx`.

## Thông số kỹ thuật

Không phải là một phần của bất kỳ tiêu chuẩn nào.

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Using Media Queries](/en-US/docs/Web/CSS/Guides/Media_queries/Using)
- [@media](/en-US/docs/Web/CSS/Reference/At-rules/@media)
