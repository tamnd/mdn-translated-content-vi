---
title: -webkit-animation
slug: Web/CSS/Reference/At-rules/@media/-webkit-animation
page-type: css-media-feature
status:
  - deprecated
  - non-standard
browser-compat: css.at-rules.media.-webkit-animation
sidebar: cssref
---

{{Non-standard_header}}{{Deprecated_Header}}

> [!NOTE]
> Tất cả các trình duyệt đều hỗ trợ thuộc tính [`animation`](/en-US/docs/Web/CSS/Reference/Properties/animation#browser_compatibility) mà không cần tiền tố vendor. Chỉ các trình duyệt dựa trên WebKit (Safari), không phải Chromium, hỗ trợ tính năng phương tiện `-webkit-animation`. Không có trình duyệt nào hỗ trợ `animation`, không có tiền tố, như một media query. Thay vào đó hãy sử dụng feature query [`@supports (animation)`](/en-US/docs/Web/CSS/Reference/At-rules/@supports).

Tính năng phương tiện **`-webkit-animation`** Boolean [CSS](/en-US/docs/Web/CSS) [media feature](/en-US/docs/Web/CSS/Reference/At-rules/@media#media_features) là một [phần mở rộng WebKit](/en-US/docs/Web/CSS/Reference/Webkit_extensions) có giá trị là `true` nếu {{cssxref("animation")}} CSS có tiền tố vendor được hỗ trợ.

Apple có [mô tả trong Safari CSS Reference](https://developer.apple.com/library/archive/documentation/AppleApplications/Reference/SafariCSSRef/Articles/OtherStandardCSS3Features.html#//apple_ref/doc/uid/TP40007601-SW3).

> [!NOTE]
> Tính năng phương tiện này chỉ được hỗ trợ bởi WebKit. Nếu có thể, hãy sử dụng feature query {{cssxref("@supports")}} thay thế.

## Cú pháp

Tính năng phương tiện `-webkit-animation` là Boolean có giá trị là `true` nếu các thuộc tính hoạt ảnh CSS có tiền tố vendor được hỗ trợ _và_ trình duyệt hỗ trợ các media query thuộc tính có tiền tố.

### Các giá trị

- `true`
  - : Trình duyệt hỗ trợ {{cssxref("animation")}} CSS có tiền tố `-webkit`.
- `false`
  - : Trình duyệt không hỗ trợ các hoạt ảnh CSS có tiền tố này.

## Ví dụ

### Ví dụ về -webkit-animation

```css
@media (-webkit-animation) {
  /* CSS to use if -webkit- prefixed animations are supported AND the browser supports prefixed properties as media queries */
}
```

## Thông số kỹ thuật

Không phải là một phần của bất kỳ tiêu chuẩn nào.

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [`-webkit-transform-3d`](/en-US/docs/Web/CSS/Reference/At-rules/@media/-webkit-transform-3d)
- [`-webkit-transform-2d`](/en-US/docs/Web/CSS/Reference/At-rules/@media/-webkit-transform-2d)
- [`-webkit-transition`](/en-US/docs/Web/CSS/Reference/At-rules/@media/-webkit-transition)
- [Test page at quirksmode.org](https://www.quirksmode.org/css/tests/mediaqueries/animation.html)
- {{cssxref("animation")}} và [using CSS animations](/en-US/docs/Web/CSS/Guides/Animations/Using)
- {{cssxref("@media")}} và [Using media queries](/en-US/docs/Web/CSS/Guides/Media_queries/Using)
- {{cssxref("@supports")}} và [using feature queries](/en-US/docs/Web/CSS/Guides/Conditional_rules/Using_feature_queries)
