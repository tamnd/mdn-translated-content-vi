---
title: grid
slug: Web/CSS/Reference/At-rules/@media/grid
page-type: css-media-feature
browser-compat: css.at-rules.media.grid
sidebar: cssref
---

Tính năng media **`grid`** trong [CSS](/vi/docs/Web/CSS) có thể được dùng để kiểm tra xem thiết bị đầu ra có sử dụng màn hình dạng lưới (grid-based) hay không.

Hầu hết máy tính hiện đại và điện thoại thông minh đều có màn hình dạng bitmap. Ví dụ về thiết bị dạng lưới bao gồm các terminal chỉ hiển thị văn bản và điện thoại cơ bản chỉ có một phông chữ cố định.

## Cú pháp

Tính năng `grid` được xác định bởi giá trị {{cssxref("CSS_media_queries/Using_media_queries", "&lt;mq-boolean&gt;")}} (`0` hoặc `1`), đại diện cho việc thiết bị đầu ra có dạng lưới hay không.

## Ví dụ

### HTML

```html
<p class="unknown">Tôi không biết bạn có đang dùng thiết bị lưới không. :-(</p>
<p class="bitmap">Bạn đang dùng thiết bị bitmap.</p>
<p class="grid">Bạn đang dùng thiết bị lưới! Thật tuyệt!</p>
```

### CSS

```css
:not(.unknown) {
  color: lightgray;
}

@media (grid: 0) {
  .unknown {
    color: lightgray;
  }

  .bitmap {
    color: red;
    text-transform: uppercase;
  }
}

@media (grid: 1) {
  .unknown {
    color: lightgray;
  }

  .grid {
    color: black;
    text-transform: uppercase;
  }
}
```

### Kết quả

{{EmbedLiveSample("Examples")}}

## Đặc tả kỹ thuật

{{Specifications}}

## Khả năng tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Sử dụng Media Queries](/en-US/docs/Web/CSS/Guides/Media_queries/Using)
- [@media](/en-US/docs/Web/CSS/Reference/At-rules/@media)
