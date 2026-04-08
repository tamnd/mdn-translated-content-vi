---
title: width
slug: Web/CSS/Reference/At-rules/@media/width
page-type: css-media-feature
browser-compat: css.at-rules.media.width
sidebar: cssref
---

Đặc trưng media CSS **`width`** có thể được dùng để kiểm tra chiều rộng của {{glossary("viewport")}} (hoặc hộp trang, đối với [phương tiện phân trang](/en-US/docs/Web/CSS/Guides/Paged_media)).

## Cú pháp

Đặc trưng `width` được chỉ định là giá trị {{cssxref("&lt;length&gt;")}} đại diện cho chiều rộng viewport. Đây là đặc trưng phạm vi, nghĩa là bạn cũng có thể sử dụng các biến thể có tiền tố **`min-width`** và **`max-width`** để truy vấn giá trị tối thiểu và tối đa tương ứng.

## Ví dụ

### HTML

```html
<div>Watch this element as you resize your viewport's width.</div>
```

### CSS

```css
/* Exact width */
@media (width: 360px) {
  div {
    color: red;
  }
}

/* Minimum width */
@media (min-width: 35rem) {
  div {
    background: yellow;
  }
}

/* Maximum width */
@media (max-width: 50rem) {
  div {
    border: 2px solid blue;
  }
}
```

### Kết quả

{{EmbedLiveSample('Examples','90%')}}

## Thông số kỹ thuật

{{Specifications}}

## Khả năng tương thích với trình duyệt

{{Compat}}

## Xem thêm

- [Sử dụng media queries](/en-US/docs/Web/CSS/Guides/Media_queries/Using)
- [@media](/en-US/docs/Web/CSS/Reference/At-rules/@media)
