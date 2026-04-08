---
title: color-gamut
slug: Web/CSS/Reference/At-rules/@media/color-gamut
page-type: css-media-feature
browser-compat: css.at-rules.media.color-gamut
sidebar: cssref
---

Tính năng media [CSS](/en-US/docs/Web/CSS) **`color-gamut`** được dùng để áp dụng các kiểu CSS dựa trên phạm vi gần đúng của {{glossary("gamut")}} màu được hỗ trợ bởi {{glossary("user agent")}} và thiết bị đầu ra.

## Cú pháp

Tính năng `color-gamut` được chỉ định dưới dạng một trong các {{glossary("color space", "không gian màu")}} sau đây dưới dạng giá trị từ khóa:

- `srgb`
  - : User agent và thiết bị đầu ra có thể hỗ trợ gần đúng gamut [sRGB](/en-US/docs/Glossary/Color_space#srgb) hoặc hơn. Điều này bao gồm đại đa số các màn hình màu.
- `p3`
  - : User agent và thiết bị đầu ra có thể hỗ trợ gần đúng gamut được chỉ định bởi không gian màu [Display P3](https://registry.color.org/rgb-registry/displayp3) hoặc hơn. Gamut P3 lớn hơn và bao gồm gamut sRGB.
- `rec2020`
  - : User agent và thiết bị đầu ra có thể hỗ trợ gần đúng gamut được chỉ định bởi không gian màu [ITU-R Recommendation BT.2020](https://en.wikipedia.org/wiki/Rec._2020) hoặc hơn. Gamut REC. 2020 lớn hơn và bao gồm gamut P3.

## Ví dụ

### HTML

```html
<p>Đây là một bài kiểm tra.</p>
```

### CSS

```css
p {
  padding: 10px;
  border: solid;
}

@media (color-gamut: srgb) {
  p {
    background: #f4ae8a;
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

- Hàm [`color()`](/en-US/docs/Web/CSS/Reference/Values/color_value/color) để chỉ định màu trong một không gian màu xác định.
- Module [CSS colors](/en-US/docs/Web/CSS/Guides/Colors)
- At-rule {{cssxref("@media")}} được dùng để chỉ định biểu thức color-gamut.
- [Sử dụng media queries](/en-US/docs/Web/CSS/Guides/Media_queries/Using) để hiểu khi nào và cách sử dụng truy vấn media.
- Module [CSS media queries](/en-US/docs/Web/CSS/Guides/Media_queries)
- [sRGB](https://en.wikipedia.org/wiki/SRGB) trên Wikipedia
