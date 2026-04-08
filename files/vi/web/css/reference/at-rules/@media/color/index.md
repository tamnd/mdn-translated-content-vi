---
title: color
slug: Web/CSS/Reference/At-rules/@media/color
page-type: css-media-feature
browser-compat: css.at-rules.media.color
sidebar: cssref
---

Tính năng media [CSS](/en-US/docs/Web/CSS) **`color`** có thể được dùng để kiểm tra số bit trên mỗi thành phần màu (đỏ, lục, lam) của thiết bị đầu ra.

## Cú pháp

Tính năng `color` được chỉ định dưới dạng giá trị {{cssxref("&lt;integer&gt;")}} đại diện cho số bit trên mỗi thành phần màu (đỏ, lục, lam) của thiết bị đầu ra. Nếu thiết bị không phải là thiết bị màu, giá trị là không. Đây là tính năng phạm vi, nghĩa là bạn cũng có thể sử dụng các biến thể có tiền tố **`min-color`** và **`max-color`** để truy vấn các giá trị tối thiểu và tối đa tương ứng.

> [!NOTE]
> Nếu các thành phần màu khác nhau được biểu diễn bằng các số bit khác nhau, số nhỏ nhất sẽ được sử dụng. Ví dụ: nếu màn hình sử dụng 5 bit cho màu xanh lam và đỏ, và 6 bit cho màu xanh lá, thì thiết bị được coi là sử dụng 5 bit trên mỗi thành phần màu. Nếu thiết bị sử dụng màu được lập chỉ mục, số bit tối thiểu trên mỗi thành phần màu trong bảng màu sẽ được sử dụng.

Xem [Áp dụng màu cho các phần tử HTML bằng CSS](/en-US/docs/Web/CSS/Guides/Colors/Applying_color) để tìm hiểu thêm về việc sử dụng CSS để áp dụng màu cho HTML.

## Ví dụ

### HTML

```html
<p>
  Văn bản này sẽ có màu đen trên các thiết bị không hỗ trợ màu sắc, màu đỏ trên
  các thiết bị có số màu thấp, và màu xanh lá trên các thiết bị có số màu cao.
</p>
```

### CSS

```css
p {
  color: black;
}

/* Bất kỳ thiết bị màu nào */
@media (color) {
  p {
    color: red;
  }
}

/* Bất kỳ thiết bị màu nào với ít nhất 8 bit trên mỗi thành phần màu */
@media (min-color: 8) {
  p {
    color: #24ba13;
  }
}
```

### Kết quả

{{EmbedLiveSample("Examples")}}

## Đặc tả

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- Thuộc tính CSS {{cssxref("color")}}
- Kiểu dữ liệu CSS {{cssxref("&lt;color&gt;")}}
