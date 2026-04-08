---
title: resolution
slug: Web/CSS/Reference/At-rules/@media/resolution
page-type: css-media-feature
browser-compat: css.at-rules.media.resolution
sidebar: cssref
---

Đặc trưng media CSS **`resolution`** có thể được dùng để kiểm tra mật độ pixel của thiết bị đầu ra.

## Cú pháp

Đặc trưng `resolution` được chỉ định là giá trị {{cssxref("resolution")}} đại diện cho mật độ pixel của thiết bị đầu ra. Đây là đặc trưng phạm vi, nghĩa là bạn cũng có thể dùng các biến thể có tiền tố **`min-resolution`** và **`max-resolution`** để truy vấn các giá trị tối thiểu và tối đa tương ứng.

## Ví dụ

### HTML

```html
<p>This is a test of your device's pixel density.</p>
```

### CSS

```css
/* Exact resolution with unit `dpi` */
@media (resolution: 150dpi) {
  p {
    color: red;
  }
}

/* Minimum resolution synonym units: `dppx` and `x` */
@media (min-resolution: 2dppx) {
  p {
    text-decoration: underline;
  }
}

@media (min-resolution: 2x) {
  p {
    text-decoration: underline;
  }
}

/* Maximum resolution with unit `dpcm` */
@media (max-resolution: 2dpcm) {
  p {
    background: yellow;
  }
}
```

### Kết quả

{{EmbedLiveSample("Examples")}}

## Thông số kỹ thuật

{{Specifications}}

## Khả năng tương thích với trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("window.devicePixelRatio")}}
- Thuộc tính {{cssxref("image-resolution")}}
