---
title: device-aspect-ratio
slug: Web/CSS/Reference/At-rules/@media/device-aspect-ratio
page-type: css-media-feature
status:
  - deprecated
browser-compat: css.at-rules.media.device-aspect-ratio
sidebar: cssref
---

{{deprecated_header}}

> [!NOTE]
> Để truy vấn {{glossary("aspect ratio")}} của khung nhìn (viewport), các nhà phát triển nên sử dụng tính năng media [`aspect-ratio`](/en-US/docs/Web/CSS/Reference/At-rules/@media/aspect-ratio) thay thế.

Tính năng media **`device-aspect-ratio`** trong [CSS](/en-US/docs/Web/CSS) có thể được dùng để kiểm tra {{glossary("aspect ratio")}} chiều rộng so với chiều cao của thiết bị đầu ra.

## Cú pháp

Tính năng `device-aspect-ratio` được chỉ định dưới dạng giá trị {{cssxref("&lt;ratio&gt;")}}. Đây là tính năng phạm vi, nghĩa là bạn cũng có thể dùng các biến thể có tiền tố **`min-device-aspect-ratio`** và **`max-device-aspect-ratio`** để truy vấn giá trị nhỏ nhất và lớn nhất tương ứng.

## Ví dụ

### Sử dụng min-device-aspect-ratio

```css
article {
  padding: 1rem;
}

@media screen and (min-device-aspect-ratio: 16/9) {
  article {
    padding: 1rem 5vw;
  }
}
```

## Đặc tả

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
