---
title: -webkit-transform-3d
slug: Web/CSS/Reference/At-rules/@media/-webkit-transform-3d
page-type: css-media-feature
browser-compat: css.at-rules.media.-webkit-transform-3d
sidebar: cssref
---

Tính năng media [CSS](/en-US/docs/Web/CSS) Boolean **`-webkit-transform-3d`** là một [phần mở rộng WebKit](/en-US/docs/Web/CSS/Reference/Webkit_extensions) có giá trị là `true` nếu CSS 3D {{cssxref("transform")}} với tiền tố nhà cung cấp được hỗ trợ.

> [!NOTE]
> Mặc dù tính năng media này hiện đang [được hỗ trợ bởi hầu hết các trình duyệt](#browser_compatibility), nếu có thể, hãy sử dụng truy vấn tính năng {{cssxref("@supports")}} thay thế.

## Cú pháp

`-webkit-transform-3d` là tính năng media [CSS](/en-US/docs/Web/CSS) Boolean có giá trị là `true` nếu trình duyệt hỗ trợ CSS 3D {{cssxref("transform")}} với tiền tố `-webkit`.

### Giá trị

- `true`
  - : Trình duyệt hỗ trợ CSS 3D transform với tiền tố `-webkit` và hỗ trợ các truy vấn media có tiền tố không chuẩn.
- `false`
  - : CSS 3D transform có tiền tố `-webkit` không được trình duyệt hỗ trợ.

## Ví dụ

### Ví dụ về media queries với -webkit-transform-3d

```css
@media (-webkit-transform-3d) {
  .foo {
    transform-style: preserve-3d;
  }
}
```

Cách tốt hơn để kiểm tra hỗ trợ trình duyệt là sử dụng truy vấn tính năng:

```css
@supports (transform-style) {
  .foo {
    transform-style: preserve-3d;
  }
}
```

## Đặc tả

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{cssxref("@media/-webkit-transform-2d", "-webkit-transform-2d")}}
- {{cssxref("@media/-webkit-transition", "-webkit-transition")}}
- {{cssxref("@media/-webkit-animation", "-webkit-animation")}}
- [Trang thử nghiệm tại quirksmode.org](https://www.quirksmode.org/css/tests/mediaqueries/animation.html)
- {{cssxref("transform")}} và [sử dụng CSS transforms](/en-US/docs/Web/CSS/Guides/Transforms/Using)
- {{cssxref("@media")}} và [Sử dụng media queries](/en-US/docs/Web/CSS/Guides/Media_queries/Using)
- {{cssxref("@supports")}} và [sử dụng feature queries](/en-US/docs/Web/CSS/Guides/Conditional_rules/Using_feature_queries)
