---
title: ::-webkit-meter-inner-element
slug: Web/CSS/Reference/Selectors/::-webkit-meter-inner-element
page-type: css-pseudo-element
status:
  - non-standard
browser-compat: css.selectors.-webkit-meter-inner-element
sidebar: cssref
---

{{Non-standard_header}}

**`::-webkit-meter-inner-element`** là phần tử giả CSS độc quyền của WebKit dùng để chọn và áp dụng kiểu cho phần tử chứa bên ngoài cùng của phần tử {{htmlelement("meter")}}. Đây là đánh dấu bổ sung để hiển thị phần tử meter dưới dạng chỉ đọc.

## Cú pháp

```css
::-webkit-meter-inner-element {
  /* ... */
}
```

## Ví dụ

Phần này chỉ hoạt động trên các trình duyệt dựa trên WebKit và Blink, chẳng hạn như Safari, Chrome và các phiên bản Edge dựa trên Chromium.

### HTML

```html
Normal: <meter min="0" max="10" value="6">Score 6/10</meter>
<br />
Styled: <meter id="styled" min="0" max="10" value="6">Score 6/10</meter>
```

### CSS

```css
body {
  font-family: monospace;
}

.safari meter {
  /* Reset the default appearance for Safari only */
  /* .safari class is added via JavaScript */
  -webkit-appearance: none;
}

#styled::-webkit-meter-inner-element {
  -webkit-appearance: inherit;
  box-sizing: inherit;
  border: 1px dashed #aaaaaa;
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

Các phần tử giả được WebKit/Blink sử dụng để tạo kiểu cho các phần khác của phần tử {{htmlelement("meter")}}:

- {{cssxref("::-webkit-meter-bar")}}
- {{cssxref("::-webkit-meter-even-less-good-value")}}
- {{cssxref("::-webkit-meter-optimum-value")}}
- {{cssxref("::-webkit-meter-suboptimum-value")}}
