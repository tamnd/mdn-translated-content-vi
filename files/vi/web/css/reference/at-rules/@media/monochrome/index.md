---
title: monochrome
slug: Web/CSS/Reference/At-rules/@media/monochrome
page-type: css-media-feature
browser-compat: css.at-rules.media.monochrome
sidebar: cssref
---

Tính năng media **`monochrome`** trong [CSS](/vi/docs/Web/CSS) có thể được dùng để kiểm tra số bit trên mỗi pixel trong bộ đệm khung đơn sắc của thiết bị đầu ra.

## Cú pháp

Tính năng `monochrome` được xác định bởi giá trị {{cssxref("&lt;integer&gt;")}} đại diện cho số bit trên mỗi pixel trong bộ đệm khung đơn sắc. Nếu thiết bị không phải là thiết bị đơn sắc, giá trị là không. Đây là tính năng phạm vi, nghĩa là bạn cũng có thể dùng các biến thể có tiền tố **`min-monochrome`** và **`max-monochrome`** để truy vấn giá trị tối thiểu và tối đa tương ứng.

## Ví dụ

### HTML

```html
<p class="mono">Thiết bị của bạn hỗ trợ pixel đơn sắc!</p>
<p class="no-mono">Thiết bị của bạn không hỗ trợ pixel đơn sắc.</p>
```

### CSS

```css
p {
  display: none;
}

/* Bất kỳ thiết bị đơn sắc nào */
@media (monochrome) {
  p.mono {
    display: block;
    color: #333333;
  }
}

/* Bất kỳ thiết bị không đơn sắc nào */
@media (monochrome: 0) {
  p.no-mono {
    display: block;
    color: #ee3636;
  }
}
```

### Kết quả

{{EmbedLiveSample("Examples")}}

## Đặc tả kỹ thuật

{{Specifications}}

## Khả năng tương thích trình duyệt

{{Compat}}
