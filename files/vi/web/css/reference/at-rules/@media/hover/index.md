---
title: hover
slug: Web/CSS/Reference/At-rules/@media/hover
page-type: css-media-feature
browser-compat: css.at-rules.media.hover
sidebar: cssref
---

Tính năng media **`hover`** trong [CSS](/vi/docs/Web/CSS) có thể được dùng để kiểm tra xem cơ chế nhập liệu _chính_ của người dùng có thể hover (di chuột) lên các phần tử hay không.

## Cú pháp

Tính năng `hover` được xác định bởi một trong các giá trị từ khóa dưới đây.

- `none`
  - : Cơ chế nhập liệu chính không thể hover hoặc không thể hover một cách thuận tiện (ví dụ: nhiều thiết bị di động mô phỏng hover khi người dùng thực hiện thao tác chạm giữ không thuận tiện), hoặc không có cơ chế nhập liệu trỏ chính nào.
- `hover`
  - : Cơ chế nhập liệu chính có thể hover lên các phần tử một cách thuận tiện.

## Ví dụ

### HTML

```html
<a href="#">Hãy thử hover lên tôi!</a>
```

### CSS

```css
/* hiệu ứng hover mặc định */
a:hover {
  color: black;
  background: yellow;
}

@media (hover: hover) {
  /* khi hover được hỗ trợ */
  a:hover {
    color: white;
    background: black;
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
