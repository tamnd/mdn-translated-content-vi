---
title: -moz-float-edge
slug: Web/CSS/Reference/Properties/-moz-float-edge
page-type: css-property
status:
  - deprecated
  - non-standard
browser-compat: css.properties.-moz-float-edge
sidebar: cssref
---

{{Non-standard_header}}{{Deprecated_Header}}

Thuộc tính [CSS](/en-US/docs/Web/CSS) không chuẩn **`-moz-float-edge`** chỉ định xem các thuộc tính chiều cao và chiều rộng của phần tử có bao gồm độ dày lề, viền hay đệm không.

## Cú pháp

```css
/* Keyword values */
-moz-float-edge: content-box;
-moz-float-edge: margin-box;

/* Global values */
-moz-float-edge: inherit;
-moz-float-edge: initial;
-moz-float-edge: unset;
```

### Giá trị

- `content-box`
  - : Các thuộc tính chiều cao và chiều rộng bao gồm nội dung, nhưng không bao gồm phần đệm, viền hoặc lề.
- `margin-box`
  - : Các thuộc tính chiều cao và chiều rộng bao gồm nội dung, phần đệm, viền và lề.

## Định nghĩa chính thức

{{CSSInfo}}

## Cú pháp chính thức

{{CSSSyntaxRaw(`-moz-float-edge = content-box | margin-box`)}}

## Ví dụ

### HTML

```html
<div class="box">
  <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit.</p>
</div>
```

### CSS

```css
.box {
  display: block;
  height: 5px;
  margin: 0.5em auto;
  color: gray;
  -moz-float-edge: margin-box;
  box-sizing: border-box;
}
```

### Kết quả

{{ EmbedLiveSample('Examples') }}

## Thông số kỹ thuật

Không thuộc về bất kỳ tiêu chuẩn nào.

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Firefox bug 432891](https://bugzil.la/432891)
