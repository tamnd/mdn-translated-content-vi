---
title: color-index
slug: Web/CSS/Reference/At-rules/@media/color-index
page-type: css-media-feature
browser-compat: css.at-rules.media.color-index
sidebar: cssref
---

Tính năng media **`color-index`** trong [CSS](/en-US/docs/Web/CSS) có thể được dùng để kiểm tra số lượng mục trong bảng tra cứu màu sắc (color lookup table) của thiết bị đầu ra.

## Cú pháp

Tính năng `color-index` được chỉ định dưới dạng giá trị {{cssxref("&lt;integer&gt;")}} biểu thị số lượng mục trong bảng tra cứu màu sắc của thiết bị đầu ra. (Giá trị này bằng 0 nếu thiết bị không sử dụng bảng như vậy.) Đây là tính năng phạm vi, nghĩa là bạn cũng có thể dùng các biến thể có tiền tố **`min-color-index`** và **`max-color-index`** để truy vấn giá trị nhỏ nhất và lớn nhất tương ứng.

## Ví dụ

### Ví dụ cơ bản

#### HTML

```html
<p>This is a test.</p>
```

#### CSS

```css
p {
  color: black;
}

@media (color-index) {
  p {
    color: red;
  }
}

@media (min-color-index: 15000) {
  p {
    color: #1475ef;
  }
}
```

#### Kết quả

{{EmbedLiveSample("Basic_example")}}

### Stylesheet tùy chỉnh

HTML này sẽ áp dụng một stylesheet đặc biệt cho các thiết bị có ít nhất 256 màu.

```html
<link rel="stylesheet" href="https://cdn.example.com/base.css" />
<link
  rel="stylesheet"
  media="(color-index >= 256)"
  href="https://cdn.example.com/color-stylesheet.css" />
```

## Đặc tả

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Sử dụng Media Queries](/en-US/docs/Web/CSS/Guides/Media_queries/Using)
- [@media](/en-US/docs/Web/CSS/Reference/At-rules/@media)
