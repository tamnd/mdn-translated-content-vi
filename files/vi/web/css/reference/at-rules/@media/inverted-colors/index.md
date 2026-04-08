---
title: inverted-colors
slug: Web/CSS/Reference/At-rules/@media/inverted-colors
page-type: css-media-feature
browser-compat: css.at-rules.media.inverted-colors
sidebar: cssref
---

Tính năng media **`inverted-colors`** trong [CSS](/vi/docs/Web/CSS) được dùng để kiểm tra xem {{glossary("user agent")}} hay hệ điều hành cơ sở có đảo ngược tất cả các màu sắc hay không.

Việc đảo ngược màu sắc có thể gây ra các tác dụng phụ không mong muốn, chẳng hạn như bóng đổ trở thành vùng sáng, điều này có thể làm giảm khả năng đọc của nội dung. Sử dụng tính năng media này, bạn có thể phát hiện khi nào đang xảy ra đảo ngược và tạo kiểu cho nội dung phù hợp trong khi vẫn tôn trọng tùy chọn của người dùng.

## Cú pháp

```css
/* Giá trị từ khóa */
@media (inverted-colors: inverted) {
  /* các kiểu áp dụng khi phát hiện đảo ngược màu sắc */
}
```

Tính năng `inverted-colors` được xác định bởi một trong các giá trị từ khóa sau:

- `none`
  - : Cho biết màu sắc được hiển thị bình thường và không có đảo ngược màu sắc nào xảy ra. Giá trị từ khóa này được đánh giá là false.
- `inverted`
  - : Cho biết tất cả các pixel trong vùng hiển thị đã bị đảo ngược. Giá trị từ khóa này được đánh giá là true.

## Ví dụ

### Áp dụng kiểu khi phát hiện đảo ngược màu sắc

Ví dụ này minh họa tác dụng của cả hai giá trị từ khóa tính năng media `inverted-colors` và khi tính năng media `inverted-colors` không được hỗ trợ.

#### HTML

```html
<p>
  Nếu phát hiện đảo ngược màu sắc, văn bản này sẽ xuất hiện màu xanh lam trên
  nền trắng (đảo ngược của vàng trên đen) cùng với đường gạch trên văn bản. Nếu
  không có đảo ngược màu sắc, văn bản sẽ xuất hiện màu đỏ trên nền xám nhạt mà
  không có đường gạch trên văn bản.
</p>
<p>
  Nếu văn bản có màu xám và không có đường gạch trên, điều đó có nghĩa là trình
  duyệt của bạn không hỗ trợ tính năng media
  <code>inverted-colors</code>.
</p>
```

#### CSS

```css
p {
  color: gray;
}

@media (inverted-colors: inverted) {
  p {
    background: black;
    color: yellow;
    text-decoration: overline;
  }
}

@media (inverted-colors: none) {
  p {
    background: #eeeeee;
    color: red;
  }
}
```

#### Kết quả

{{EmbedLiveSample("Applying styles if color inversion is detected")}}

## Đặc tả kỹ thuật

{{Specifications}}

## Khả năng tương thích trình duyệt

{{Compat}}

## Xem thêm

- [@media](/en-US/docs/Web/CSS/Reference/At-rules/@media)
- [CSS media queries](/en-US/docs/Web/CSS/Guides/Media_queries) module
- [Sử dụng media queries](/en-US/docs/Web/CSS/Guides/Media_queries/Using)
