---
title: ::-webkit-meter-suboptimum-value
slug: Web/CSS/Reference/Selectors/::-webkit-meter-suboptimum-value
page-type: css-pseudo-element
status:
  - non-standard
browser-compat: css.selectors.-webkit-meter-suboptimum-value
sidebar: cssref
---

{{Non-standard_header}}

Phần tử giả **`::-webkit-meter-suboptimum-value`** là [phần tử giả](/en-US/docs/Glossary/Pseudo-element) tạo kiểu cho phần tử {{htmlelement("meter")}} khi thuộc tính value nằm ngoài phạm vi low-high và không tương đương với giá trị tối ưu (optimum).

Màu vàng là màu mặc định.

## Cú pháp

```css
::-webkit-meter-suboptimum-value {
  /* ... */
}
```

## Ví dụ

Ví dụ này chỉ hoạt động trên các trình duyệt dựa trên WebKit hoặc Blink.

### HTML

```html
Normal:
<meter min="0" max="10" low="3" high="7" optimum="6" value="2">
  Score 2/10
</meter>
<br />
Styled:
<meter id="styled" min="0" max="10" low="3" high="7" optimum="6" value="2">
  Score 2/10
</meter>
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

#styled::-webkit-meter-suboptimum-value {
  background: linear-gradient(
    to bottom,
    #ffff77,
    #999900 45%,
    #999900 55%,
    #ffff77
  );
  height: 100%;
  box-sizing: border-box;
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

{{ EmbedLiveSample('Examples', '100%', 50) }}

## Đặc tả

Không thuộc bất kỳ tiêu chuẩn nào.

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

Các phần tử giả được WebKit/Blink sử dụng để tạo kiểu cho các phần khác của phần tử {{htmlelement("meter")}}:

- {{cssxref("::-webkit-meter-inner-element")}}
- {{cssxref("::-webkit-meter-bar")}}
- {{cssxref("::-webkit-meter-even-less-good-value")}}
- {{cssxref("::-webkit-meter-optimum-value")}}
