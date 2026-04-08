---
title: ::-moz-color-swatch
slug: Web/CSS/Reference/Selectors/::-moz-color-swatch
page-type: css-pseudo-element
status:
  - non-standard
browser-compat: css.selectors.-moz-color-swatch
sidebar: cssref
---

{{Non-standard_header}}

Phần tử giả **`::-moz-color-swatch`** trong [CSS](/en-US/docs/Web/CSS) là một [phần mở rộng của Mozilla](/en-US/docs/Web/CSS/Reference/Mozilla_extensions) đại diện cho màu được chọn trong phần tử {{HTMLElement("input")}} có `type="color"`.

> [!NOTE]
> Sử dụng `::-moz-color-swatch` với bất cứ thứ gì khác ngoài `<input type="color">` sẽ không khớp bất cứ thứ gì và không có hiệu lực.

## Cú pháp

```css
::-moz-color-swatch {
  /* ... */
}
```

## Ví dụ

### HTML

```html
<input type="color" value="#de2020" />
```

### CSS

```css
input[type="color"]::-moz-color-swatch {
  border-radius: 10px;
  border-style: none;
}
```

### Kết quả

{{EmbedLiveSample("Examples", 300, 50)}}

## Đặc tả kỹ thuật

Không thuộc bất kỳ tiêu chuẩn nào.

## Khả năng tương thích trình duyệt

{{Compat}}

## Xem thêm

- Các phần tử giả tương tự được dùng bởi các trình duyệt khác:
  - {{cssxref("::-webkit-color-swatch")}}, phần tử giả được hỗ trợ bởi WebKit và Blink (Safari, Chrome, và Opera)
