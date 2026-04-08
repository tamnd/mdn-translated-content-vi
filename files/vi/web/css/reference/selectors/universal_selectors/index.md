---
title: Universal selectors
slug: Web/CSS/Reference/Selectors/Universal_selectors
page-type: css-selector
browser-compat: css.selectors.universal
sidebar: cssref
---

**Bộ chọn phổ quát** CSS (`*`) khớp với các phần tử của bất kỳ kiểu nào.

```css
/* Selects all elements */
* {
  color: green;
}
```

Bộ chọn phổ quát là một [bộ chọn kiểu](/en-US/docs/Web/CSS/Reference/Selectors/Type_selectors) đặc biệt và do đó có thể được đặt tên namespace khi sử dụng {{CSSXref("@namespace")}}. Điều này hữu ích khi xử lý các tài liệu chứa nhiều namespace như HTML với SVG hoặc MathML nội tuyến, hoặc XML kết hợp nhiều từ vựng.

- `ns|*` - khớp với tất cả các phần tử trong namespace _ns_
- `*|*` - khớp với tất cả các phần tử
- `|*` - khớp với tất cả các phần tử không có namespace nào được khai báo

> [!NOTE]
> Bộ chọn phổ quát (`*`) chỉ khớp với **các phần tử**.
> Nó **không** trực tiếp khớp với pseudo-element một mình.
>
> Ví dụ: để khớp với tất cả các pseudo-element {{cssxref("::before")}} trên một trang, bạn phải sử dụng bộ chọn như `*::before`. Điều này hoạt động vì `*` khớp với tất cả các phần tử, và pseudo-element `::before` có sẵn trên tất cả các phần tử.

## Cú pháp

```css
* { style properties }
```

Dấu hoa thị là tùy chọn với các bộ chọn đơn giản. Ví dụ: `*.warning` và `.warning` tương đương nhau.

## Ví dụ

### CSS

```css
* [lang^="en"] {
  color: green;
}

*.warning {
  color: red;
}

*#maincontent {
  border: 1px solid blue;
}

.floating {
  float: left;
}

/* automatically clear the next sibling after a floating element */
.floating + * {
  clear: left;
}
```

### HTML

```html
<p class="warning">
  <span lang="en-us">A green span</span> in a red paragraph.
</p>
<p id="maincontent" lang="en-gb">
  <span class="warning">A red span</span> in a green paragraph.
</p>
```

### Kết quả

{{EmbedLiveSample('Examples')}}

### Namespace

Trong ví dụ này, bộ chọn chỉ khớp với các phần tử trong namespace ví dụ.

```css
@namespace example url("http://www.example.com/");
example|* {
  color: blue;
}
```

## Thông số kỹ thuật

{{Specifications}}

## Khả năng tương thích với trình duyệt

{{Compat}}

## Xem thêm

- Mô-đun [CSS selectors](/vi/docs/Web/CSS/Guides/Selectors)
- [Học CSS: Các bộ chọn cơ bản](/vi/docs/Learn_web_development/Core/Styling_basics/Basic_selectors)
