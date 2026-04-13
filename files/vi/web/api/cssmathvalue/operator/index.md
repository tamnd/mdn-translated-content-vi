---
title: "CSSMathValue: operator property"
short-title: operator
slug: Web/API/CSSMathValue/operator
page-type: web-api-instance-property
browser-compat: api.CSSMathValue.operator
---

{{APIRef("CSS Typed Object Model API")}}

Thuộc tính chỉ đọc **`CSSMathValue.operator`** của giao diện {{domxref("CSSMathValue")}} chỉ ra toán tử mà kiểu con hiện tại đại diện. Ví dụ, nếu kiểu con `CSSMathValue` hiện tại là `CSSMathSum`, thuộc tính này sẽ trả về chuỗi `"sum"`.

## Giá trị

Một {{jsxref('String')}}.

| Giao diện                     | Giá trị     |
| ----------------------------- | ----------- |
| {{domxref('CSSMathSum')}}     | `"sum"`     |
| {{domxref('CSSMathProduct')}} | `"product"` |
| {{domxref('CSSMathMin')}}     | `"min"`     |
| {{domxref('CSSMathMax')}}     | `"max"`     |
| {{domxref('CSSMathClamp')}}   | `"clamp"`   |
| {{domxref('CSSMathNegate')}}  | `"negate"`  |
| {{domxref('CSSMathInvert')}}  | `"invert"`  |

## Ví dụ

Chúng ta tạo một phần tử với {{cssxref("width")}} được xác định bằng hàm {{cssxref("calc()")}}, sau đó dùng {{domxref("console/log_static", "console.log()")}} để ghi `operator`.

```html
<div>My width has a <code>calc()</code> function</div>
```

Chúng ta gán `width` với phép tính

```css
div {
  width: calc(50% - 0.5vw);
}
```

Chúng ta thêm JavaScript

```js
const styleMap = document.querySelector("div").computedStyleMap();

console.log(styleMap.get("width")); // CSSMathSum {values: CSSNumericArray, operator: "sum"}
console.log(styleMap.get("width").values); // CSSNumericArray {0: CSSUnitValue, 1: CSSMathNegate, length: 2}
console.log(styleMap.get("width").operator); // 'sum'
console.log(styleMap.get("width").values[1].operator); // 'negate'
```

{{EmbedLiveSample("Examples", 120, 300)}}

`CSSMathValue.operator` trả về `sum` cho biểu thức và `negate` cho toán tử trên giá trị thứ hai.

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
