---
title: -webkit-device-pixel-ratio
slug: Web/CSS/Reference/At-rules/@media/-webkit-device-pixel-ratio
page-type: css-media-feature
browser-compat: css.at-rules.media.-webkit-device-pixel-ratio
sidebar: cssref
---

Tính năng phương tiện **`-webkit-device-pixel-ratio`** là một tính năng phương tiện Boolean [CSS](/en-US/docs/Web/CSS) [media feature](/en-US/docs/Web/CSS/Reference/At-rules/@media#media_features) không chuẩn, là sự thay thế cho tính năng phương tiện chuẩn [`resolution`](/en-US/docs/Web/CSS/Reference/At-rules/@media/resolution).

> [!NOTE]
> Nếu có thể, hãy sử dụng feature query tính năng phương tiện [`resolution`](/en-US/docs/Web/CSS/Reference/At-rules/@media/resolution) thay thế, đây là tính năng phương tiện chuẩn. Mặc dù tính năng phương tiện có tiền tố này là một tính năng WebKit, các công cụ trình duyệt khác cũng có thể hỗ trợ nó. Xem [tương thích trình duyệt](#browser_compatibility) bên dưới.

## Cú pháp

Tính năng `-webkit-device-pixel-ratio` được chỉ định là giá trị {{cssxref("&lt;number&gt;")}}. Đây là tính năng phạm vi, nghĩa là bạn cũng có thể sử dụng các biến thể có tiền tố **`-webkit-min-device-pixel-ratio`** và **`-webkit-max-device-pixel-ratio`** để truy vấn các giá trị tối thiểu và tối đa, tương ứng.

### Các giá trị

- {{cssxref("&lt;number&gt;")}}
  - : Số pixel thiết bị được sử dụng để đại diện cho mỗi [`px`](/en-US/docs/Web/CSS/Reference/Values/length#absolute_length_units) CSS. Mặc dù giá trị là `<number>`, và do đó không cho phép đơn vị về mặt cú pháp, đơn vị ngầm định của nó là [`dppx`](/en-US/docs/Web/CSS/Reference/Values/resolution#units).

## Triển khai

```css
/* A unit of "dppx" is implied: */
@media (-webkit-min-device-pixel-ratio: 2) {
  /* … */
}
/* It is equivalent to: */
@media (min-resolution: 2dppx) {
  /* … */
}

/* Similarly: */
@media (-webkit-max-device-pixel-ratio: 2) {
  /* … */
}
/* It is equivalent to: */
@media (max-resolution: 2dppx) {
  /* … */
}
```

## Ví dụ

### HTML

```html
<p>This is a test of your device's pixel density.</p>
```

### CSS

```css
/* Exact resolution */
@media (-webkit-device-pixel-ratio: 1) {
  p {
    color: red;
  }
}

/* Minimum resolution */
@media (-webkit-min-device-pixel-ratio: 1.1) {
  p {
    font-size: 1.5em;
  }
}

/* Maximum resolution */
@media (-webkit-max-device-pixel-ratio: 3) {
  p {
    background: yellow;
  }
}
```

### Kết quả

{{EmbedLiveSample("Examples")}}

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Using media queries](/en-US/docs/Web/CSS/Guides/Media_queries/Using)
- {{cssxref("resolution")}}
- [`-webkit-transform-2d`](/en-US/docs/Web/CSS/Reference/At-rules/@media/-webkit-transform-2d)
- [`-webkit-transform-3d`](/en-US/docs/Web/CSS/Reference/At-rules/@media/-webkit-transform-3d)
- [`-webkit-transition`](/en-US/docs/Web/CSS/Reference/At-rules/@media/-webkit-transition)
- [`-webkit-animation`](/en-US/docs/Web/CSS/Reference/At-rules/@media/-webkit-animation)
- [W3C Suggested Method to UnPrefix](https://www.w3.org/blog/CSS/2012/06/14/unprefix-webkit-device-pixel-ratio/)
