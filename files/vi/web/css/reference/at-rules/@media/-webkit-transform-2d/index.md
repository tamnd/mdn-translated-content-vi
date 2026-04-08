---
title: -webkit-transform-2d
slug: Web/CSS/Reference/At-rules/@media/-webkit-transform-2d
page-type: css-media-feature
status:
  - non-standard
browser-compat: css.at-rules.media.-webkit-transform-2d
sidebar: cssref
---

{{ Non-standard_header }}

> [!NOTE]
> Tất cả các trình duyệt đều hỗ trợ thuộc tính [`transform`](/en-US/docs/Web/CSS/Reference/Properties/transform#browser_compatibility) mà không cần tiền tố nhà cung cấp. Chỉ các trình duyệt dựa trên WebKit (Safari), không phải Chromium, mới hỗ trợ tính năng media `-webkit-transform-2d`. Không có trình duyệt nào hỗ trợ `transform`, không có tiền tố hoặc phần mở rộng `2d`, dưới dạng truy vấn media. Hãy sử dụng truy vấn tính năng [`@supports (transform)`](/en-US/docs/Web/CSS/Reference/At-rules/@supports) thay thế.

Tính năng media [CSS](/en-US/docs/Web/CSS) Boolean **`-webkit-transform-2d`** là một [phần mở rộng WebKit](/en-US/docs/Web/CSS/Reference/Webkit_extensions) có giá trị là `true` nếu CSS 2D {{cssxref("transform")}} với tiền tố nhà cung cấp và các truy vấn media có tiền tố không chuẩn được hỗ trợ.

Apple có [mô tả trong Safari CSS Reference](https://developer.apple.com/library/archive/documentation/AppleApplications/Reference/SafariCSSRef/Articles/OtherStandardCSS3Features.html#//apple_ref/doc/uid/TP40007601-SW3).

## Cú pháp

`-webkit-transform-2d` là tính năng media [CSS](/en-US/docs/Web/CSS) Boolean có giá trị là `true` nếu trình duyệt hỗ trợ CSS 2D {{cssxref("transform")}} với tiền tố `-webkit`.

### Giá trị

- `true`
  - : Trình duyệt hỗ trợ CSS 2D transform với tiền tố `-webkit`.
- `false`
  - : CSS 2D transform có tiền tố `-webkit` không được trình duyệt hỗ trợ.

## Ví dụ

### Ví dụ cơ bản

```css
@media (-webkit-transform-2d) {
  div {
    -webkit-transform: translate(100px, 100px);
  }
}
```

Tính năng media này chỉ được hỗ trợ bởi WebKit. Thuộc tính {{cssxref("transform")}} không có tiền tố được hỗ trợ trong tất cả các trình duyệt hiện đại. Nếu có thể, hãy sử dụng truy vấn tính năng {{cssxref("@supports")}} thay thế:

```css
@supports (-webkit-transform: translate(100px, 100px)) {
  div {
    -webkit-transform: translate(100px, 100px);
  }
}
```

## Đặc tả

Không thuộc bất kỳ tiêu chuẩn nào.

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{cssxref("@media/-webkit-transform-3d", "-webkit-transform-3d")}}
- {{cssxref("@media/-webkit-transition", "-webkit-transition")}}
- {{cssxref("@media/-webkit-animation", "-webkit-animation")}}
- [Trang thử nghiệm tại quirksmode.org](https://www.quirksmode.org/css/tests/mediaqueries/animation.html)
- {{cssxref("transform")}} và [sử dụng CSS transforms](/en-US/docs/Web/CSS/Guides/Transforms/Using)
- {{cssxref("@media")}} và [Sử dụng media queries](/en-US/docs/Web/CSS/Guides/Media_queries/Using)
- {{cssxref("@supports")}} và [sử dụng feature queries](/en-US/docs/Web/CSS/Guides/Conditional_rules/Using_feature_queries)
