---
title: ::-webkit-meter-bar
slug: Web/CSS/Reference/Selectors/::-webkit-meter-bar
page-type: css-pseudo-element
status:
  - deprecated
  - non-standard
browser-compat: css.selectors.-webkit-meter-bar
sidebar: cssref
---

{{Non-standard_header}}{{deprecated_header}}

Phần tử giả **`::-webkit-meter-bar`** trong [CSS](/en-US/docs/Web/CSS) là [phần tử giả](/en-US/docs/Glossary/Pseudo-element) là một [phần mở rộng WebKit](/en-US/docs/Web/CSS/Reference/Webkit_extensions) đại diện cho nền của phần tử {{HTMLElement("meter")}}. Nó được dùng để chọn và áp dụng kiểu cho vùng chứa của đồng hồ đo (meter gauge).

## Cú pháp

```css
::-webkit-meter-bar {
  /* ... */
}
```

## Ví dụ

### HTML

```html
Normal: <meter min="0" max="10" value="6">Score 6/10</meter>
<br />
Styled: &nbsp;&nbsp;<meter id="styled" min="0" max="10" value="6">
  Score 6/10
</meter>
```

### CSS

```css hidden
meter {
  height: 30px;
  width: 200px;
  vertical-align: -0.8rem;
}
```

```css
.safari meter {
  /* Reset the default appearance for Safari only */
  /* .safari class is added via JavaScript */
  -webkit-appearance: none;
}

#styled::-webkit-meter-bar {
  background: lime;
  box-shadow: 0 10px 20px grey inset;
  border-radius: 10px;
}
```

### JavaScript

```js
// Safari requires <meter> elements to have an `appearance` of `none` for custom styling
// using `::-webkit-meter-*` selectors, but `appearance: none` breaks rendering on Chrome.
// Therefore, we must check if the browser is Safari-based.

const isSafari =
  navigator.userAgent.includes("AppleWebKit/") &&
  !navigator.userAgent.includes("Chrome/");

if (isSafari) {
  document.body.classList.add("safari");
}
```

### Kết quả

{{ EmbedLiveSample('Examples') }}

## Đặc tả

Không thuộc bất kỳ tiêu chuẩn nào.

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- Các phần tử giả được WebKit/Blink sử dụng để tạo kiểu cho các phần khác của phần tử {{htmlelement("meter")}}:
  - {{cssxref("::-webkit-meter-inner-element")}}
  - {{cssxref("::-webkit-meter-even-less-good-value")}}
  - {{cssxref("::-webkit-meter-optimum-value")}}
  - {{cssxref("::-webkit-meter-suboptimum-value")}}

- [WebKit CSS extensions](/en-US/docs/Web/CSS/Reference/Webkit_extensions)
