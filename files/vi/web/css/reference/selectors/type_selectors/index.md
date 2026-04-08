---
title: Type selectors
slug: Web/CSS/Reference/Selectors/Type_selectors
page-type: css-selector
browser-compat: css.selectors.type
sidebar: cssref
---

**Bộ chọn kiểu** CSS khớp với các phần tử theo tên node. Nói cách khác, nó chọn tất cả các phần tử của kiểu đã cho trong tài liệu.

```css
/* All <a> elements. */
a {
  color: red;
}
```

Bộ chọn kiểu có thể được đặt tên namespace khi sử dụng {{CSSXref("@namespace")}}. Điều này hữu ích khi xử lý các tài liệu chứa nhiều namespace như HTML với SVG hoặc MathML nội tuyến, hoặc XML kết hợp nhiều từ vựng.

- `ns|h1` - khớp với các phần tử `<h1>` trong namespace _ns_
- `*|h1` - khớp với tất cả các phần tử `<h1>`
- `|h1` - khớp với tất cả các phần tử `<h1>` không có namespace nào được khai báo

## Cú pháp

```css
element { style properties }
```

## Ví dụ

### CSS

```css
span {
  background-color: skyblue;
}
```

### HTML

```html
<span>Here's a span with some text.</span>
<p>Here's a p with some text.</p>
<span>Here's a span with more text.</span>
```

### Kết quả

{{EmbedLiveSample('Examples', '100%', 150)}}

### Namespace

Trong ví dụ này, bộ chọn chỉ khớp với các phần tử `<h1>` trong namespace ví dụ.

```css
@namespace example url("http://www.example.com/");
example|h1 {
  color: blue;
}
```

## Thông số kỹ thuật

{{Specifications}}

## Khả năng tương thích với trình duyệt

{{Compat}}

## Xem thêm

- [CSS Selectors](/vi/docs/Web/CSS/Guides/Selectors)
- [Học CSS: Các bộ chọn cơ bản](/vi/docs/Learn_web_development/Core/Styling_basics/Basic_selectors)
