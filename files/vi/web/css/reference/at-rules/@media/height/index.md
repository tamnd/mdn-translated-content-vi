---
title: height
slug: Web/CSS/Reference/At-rules/@media/height
page-type: css-media-feature
browser-compat: css.at-rules.media.height
sidebar: cssref
---

Tính năng media **`height`** trong [CSS](/vi/docs/Web/CSS) có thể được dùng để áp dụng kiểu dáng dựa trên chiều cao của {{glossary("viewport")}} (hoặc hộp trang, đối với [phương tiện phân trang](/en-US/docs/Web/CSS/Guides/Paged_media)).

## Cú pháp

Tính năng `height` được xác định bởi giá trị {{cssxref("&lt;length&gt;")}} đại diện cho chiều cao của viewport. Đây là tính năng phạm vi, nghĩa là bạn cũng có thể dùng các biến thể có tiền tố **`min-height`** và **`max-height`** để truy vấn giá trị tối thiểu và tối đa tương ứng.

## Ví dụ

### HTML

```html
<div>Hãy quan sát phần tử này khi bạn thay đổi chiều cao viewport.</div>
```

### CSS

```css
/* Chiều cao chính xác */
@media (height: 360px) {
  div {
    color: red;
  }
}

/* Chiều cao tối thiểu */
@media (min-height: 25rem) {
  div {
    background: yellow;
  }
}

/* Chiều cao tối đa */
@media (max-height: 40rem) {
  div {
    border: 2px solid blue;
  }
}
```

### Kết quả

{{EmbedLiveSample('Examples','90%')}}

## Đặc tả kỹ thuật

{{Specifications}}

## Khả năng tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Sử dụng media queries](/en-US/docs/Web/CSS/Guides/Media_queries/Using)
- [@media](/en-US/docs/Web/CSS/Reference/At-rules/@media)
