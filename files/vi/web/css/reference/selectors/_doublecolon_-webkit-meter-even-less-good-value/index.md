---
title: ::-webkit-meter-even-less-good-value
slug: Web/CSS/Reference/Selectors/::-webkit-meter-even-less-good-value
page-type: css-pseudo-element
status:
  - non-standard
browser-compat: css.selectors.-webkit-meter-even-less-good-value
sidebar: cssref
---

{{Non-standard_header}}

Phần tử giả **`::-webkit-meter-even-less-good-value`** tạo kiểu cho phần tử {{htmlelement("meter")}} khi thuộc tính value và thuộc tính optimum nằm ngoài phạm vi low-high nhưng ở các vùng đối lập nhau. Để minh họa, nó áp dụng khi _value_ < _low_ < _high_ < _optimum_ hoặc _value_ > _high_ > _low_ > _optimum_.

Màu đỏ là màu mặc định.

## Cú pháp

```css
::-webkit-meter-even-less-good-value {
  /* ... */
}
```

## Ví dụ

### HTML

```html
Normal:
<meter min="0" max="10" low="3" high="7" optimum="8" value="2">
  Score 2/10
</meter>
<br />
Styled:
<meter id="styled" min="0" max="10" low="3" high="7" optimum="8" value="2">
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

#styled::-webkit-meter-even-less-good-value {
  background: linear-gradient(
    to bottom,
    #ff7777,
    #990000 45%,
    #990000 55%,
    #ff7777
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
- {{cssxref("::-webkit-meter-optimum-value")}}
- {{cssxref("::-webkit-meter-suboptimum-value")}}
