---
title: device-height
slug: Web/CSS/Reference/At-rules/@media/device-height
page-type: css-media-feature
status:
  - deprecated
browser-compat: css.at-rules.media.device-height
sidebar: cssref
---

{{deprecated_header}}

> [!NOTE]
> Để truy vấn chiều cao của khung nhìn (viewport), các nhà phát triển nên sử dụng tính năng media [`height`](/en-US/docs/Web/CSS/Reference/At-rules/@media/height) thay thế.

Tính năng media **`device-height`** trong [CSS](/en-US/docs/Web/CSS) có thể được dùng để kiểm tra chiều cao bề mặt hiển thị của thiết bị đầu ra.

## Cú pháp

Tính năng `device-height` được chỉ định dưới dạng giá trị {{cssxref("&lt;length&gt;")}}. Đây là tính năng phạm vi, nghĩa là bạn cũng có thể dùng các biến thể có tiền tố **`min-device-height`** và **`max-device-height`** để truy vấn giá trị nhỏ nhất và lớn nhất tương ứng.

## Ví dụ

### Áp dụng stylesheet đặc biệt cho các thiết bị có chiều cao nhỏ hơn 800 pixel

```html
<link
  rel="stylesheet"
  media="screen and (max-device-height: 799px)"
  href="https://cdn.example.com/short-styles.css" />
```

## Đặc tả

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Sử dụng Media Queries](/en-US/docs/Web/CSS/Guides/Media_queries/Using)
- [@media](/en-US/docs/Web/CSS/Reference/At-rules/@media)
