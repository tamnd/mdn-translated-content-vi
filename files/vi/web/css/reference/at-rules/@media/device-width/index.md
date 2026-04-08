---
title: device-width
slug: Web/CSS/Reference/At-rules/@media/device-width
page-type: css-media-feature
status:
  - deprecated
browser-compat: css.at-rules.media.device-width
sidebar: cssref
---

{{deprecated_header}}

> [!NOTE]
> Để truy vấn chiều rộng của khung nhìn (viewport), các nhà phát triển nên sử dụng tính năng media [`width`](/en-US/docs/Web/CSS/Reference/At-rules/@media/width) thay thế.

Tính năng media **`device-width`** trong [CSS](/en-US/docs/Web/CSS) có thể được dùng để kiểm tra chiều rộng bề mặt hiển thị của thiết bị đầu ra.

## Cú pháp

Tính năng `device-width` được chỉ định dưới dạng giá trị {{cssxref("&lt;length&gt;")}}. Đây là tính năng phạm vi, nghĩa là bạn cũng có thể dùng các biến thể có tiền tố **`min-device-width`** và **`max-device-width`** để truy vấn giá trị nhỏ nhất và lớn nhất tương ứng.

## Ví dụ

### Áp dụng stylesheet đặc biệt cho các thiết bị có chiều rộng nhỏ hơn 800 pixel

```html
<link
  rel="stylesheet"
  media="screen and (max-device-width: 799px)"
  href="https://cdn.example.com/narrow-styles.css" />
```

## Đặc tả

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Sử dụng Media Queries](/en-US/docs/Web/CSS/Guides/Media_queries/Using)
- [@media](/en-US/docs/Web/CSS/Reference/At-rules/@media)
