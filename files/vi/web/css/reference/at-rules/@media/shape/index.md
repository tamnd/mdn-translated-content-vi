---
title: shape
slug: Web/CSS/Reference/At-rules/@media/shape
page-type: css-media-feature
status:
  - experimental
spec-urls: https://drafts.csswg.org/css-round-display/#shape-media-feature
sidebar: cssref
---

{{SeeCompatTable}}

Đặc trưng media CSS `shape` có thể được dùng để kiểm tra hình dạng của thiết bị nhằm phân biệt màn hình hình chữ nhật và màn hình hình tròn.

## Cú pháp

Đặc trưng rời rạc `shape` được chỉ định là một trong hai chuỗi có thể chấp nhận: `rect` đại diện cho màn hình hình chữ nhật, hoặc `round` đại diện cho màn hình hình tròn, hình bầu dục hoặc elip.

- `rect`
  - : Hình dạng là hình chữ nhật hoặc hình vuông căn chỉnh theo trục, hoặc hình dạng tương tự như hình chữ nhật bo góc mà các thiết kế truyền thống phù hợp với nó.
- `round`
  - : Hình dạng là hình tròn hoặc hình dạng tương tự như hình tròn chẳng hạn như hình bầu dục, elip mà các thiết kế có đường tròn đặc biệt phù hợp với nó.

## Ví dụ

### Ví dụ cơ bản

#### HTML

```html
<h1>Hello World!</h1>
```

#### CSS

```css
h1 {
  text-align: left;
}

@media (shape: rect) {
  h1 {
    text-align: left;
  }
}

@media (shape: round) {
  h1 {
    text-align: center;
  }
}
```

### Stylesheet tùy chỉnh

HTML này sẽ áp dụng stylesheet đặc biệt cho các thiết bị có màn hình tròn.

```html
<head>
  <link rel="stylesheet" href="default.css" />
  <link
    media="screen and (shape: rect)"
    rel="stylesheet"
    href="rectangle.css" />
  <link media="screen and (shape: round)" rel="stylesheet" href="round.css" />
</head>
```

## Thông số kỹ thuật

{{Specifications}}

## Khả năng tương thích với trình duyệt

Hiện tại, không có trình duyệt nào hỗ trợ tính năng này.

## Xem thêm

- [Sử dụng Media Queries](/en-US/docs/Web/CSS/Guides/Media_queries/Using)
- [@media](/en-US/docs/Web/CSS/Reference/At-rules/@media)
- [Module CSS round display](/en-US/docs/Web/CSS/Guides/Round_display)
- [Sử dụng biến môi trường](/en-US/docs/Web/CSS/Guides/Environment_variables/Using)
- [Module biến môi trường CSS](/en-US/docs/Web/CSS/Guides/Environment_variables)
