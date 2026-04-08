---
title: -webkit-transition
slug: Web/CSS/Reference/At-rules/@media/-webkit-transition
page-type: css-media-feature
status:
  - deprecated
  - non-standard
browser-compat: css.at-rules.media.-webkit-transition
sidebar: cssref
---

{{deprecated_header}} {{ Non-standard_header }}

> [!NOTE]
> Tất cả các trình duyệt đều hỗ trợ thuộc tính [`transition`](/en-US/docs/Web/CSS/Reference/Properties/transition#browser_compatibility) mà không cần tiền tố nhà cung cấp. Chỉ các trình duyệt dựa trên WebKit (Safari), không phải Chromium, mới hỗ trợ tính năng media `-webkit-transition`. Không có trình duyệt nào hỗ trợ `transition` không có tiền tố dưới dạng truy vấn media (mặc dù một số trình duyệt hỗ trợ - {{cssxref("@media/-webkit-transform-3d", "-webkit-transform-3d")}}). Hãy sử dụng truy vấn tính năng [`@supports (transition)`](/en-US/docs/Web/CSS/Reference/At-rules/@supports) thay thế.

Tính năng media [CSS](/en-US/docs/Web/CSS) Boolean không chuẩn **`-webkit-transition`** là một [phần mở rộng WebKit](/en-US/docs/Web/CSS/Reference/Webkit_extensions) có giá trị là `true` nếu ngữ cảnh duyệt web hỗ trợ [CSS transitions](/en-US/docs/Web/CSS/Guides/Transitions).

Apple có [mô tả trong Safari CSS Reference](https://developer.apple.com/library/archive/documentation/AppleApplications/Reference/SafariCSSRef/Articles/OtherStandardCSS3Features.html#//apple_ref/doc/uid/TP40007601-SW3); hiện nay được gọi là `transition` ở đó.

> [!NOTE]
> Bạn không nên sử dụng tính năng media này; nó chưa bao giờ được đặc tả, chưa bao giờ được triển khai rộng rãi, và đã bị [xóa khỏi hầu hết các trình duyệt](#browser_compatibility). Hãy sử dụng truy vấn tính năng {{cssxref("@supports")}} thay thế.

## Cú pháp

```css
@media (-webkit-transition) {
  /* CSS sử dụng nếu tính năng media này và transition có tiền tố được hỗ trợ */
}
```

## Ví dụ

### Sử dụng @supports thay thế

Không sử dụng tính năng media `-webkit-transition`. Thay vào đó, hãy kiểm tra hỗ trợ transition bằng cách sử dụng CSS {{cssxref("@supports")}} [at-rule](/en-US/docs/Web/CSS/Guides/Syntax/At-rules), như sau:

```css
@supports (transition: initial) {
  /* CSS sử dụng nếu transitions được hỗ trợ */
}
```

### Ví dụ lỗi thời

Trước khi trở nên lỗi thời, bạn có thể sử dụng `-webkit-transition` trong CSS như sau:

```css
@media (-webkit-transition) {
  /* CSS sử dụng nếu transitions được hỗ trợ */
}
```

## Đặc tả

Không thuộc bất kỳ tiêu chuẩn nào.

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{cssxref("@media/-webkit-transform-3d", "-webkit-transform-3d")}}
- {{cssxref("@media/-webkit-transform-2d", "-webkit-transform-2d")}}
- {{cssxref("@media/-webkit-animation", "-webkit-animation")}}
- [Trang thử nghiệm tại quirksmode.org](https://www.quirksmode.org/css/tests/mediaqueries/animation.html)
- {{cssxref("transition")}} và [sử dụng CSS transitions](/en-US/docs/Web/CSS/Guides/Transitions/Using)
- {{cssxref("@media")}} và [Sử dụng media queries](/en-US/docs/Web/CSS/Guides/Media_queries/Using)
- {{cssxref("@supports")}} và [sử dụng feature queries](/en-US/docs/Web/CSS/Guides/Conditional_rules/Using_feature_queries)
