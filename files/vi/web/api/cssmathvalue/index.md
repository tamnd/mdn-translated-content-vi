---
title: CSSMathValue
slug: Web/API/CSSMathValue
page-type: web-api-interface
browser-compat: api.CSSMathValue
---

{{APIRef("CSS Typed Object Model API")}}

Giao diện **`CSSMathValue`** của [CSS Typed Object Model API](/en-US/docs/Web/API/CSS_Object_Model) là lớp cơ sở cho các lớp đại diện cho các giá trị số phức tạp.

{{InheritanceDiagram}}

## Các giao diện dựa trên CSSMathValue

Dưới đây là danh sách các giao diện dựa trên giao diện CSSMathValue.

- {{domxref('CSSMathInvert')}}
- {{domxref('CSSMathMax')}}
- {{domxref('CSSMathMin')}}
- {{domxref('CSSMathNegate')}}
- {{domxref('CSSMathProduct')}}
- {{domxref('CSSMathSum')}}

## Thuộc tính phiên bản

- {{domxref('CSSMathValue.operator')}}
  - : Chỉ ra toán tử mà kiểu con hiện tại đại diện.

## Phương thức tĩnh

_Giao diện cũng có thể kế thừa phương thức từ giao diện cha, {{domxref("CSSNumericValue")}}._

## Phương thức phiên bản

_Giao diện cũng có thể kế thừa phương thức từ giao diện cha, {{domxref("CSSNumericValue")}}._

## Ví dụ

Chúng ta tạo một phần tử với {{cssxref("width")}} được xác định bằng hàm {{cssxref("calc()")}}, sau đó dùng {{domxref("console/log_static", "console.log()")}} để ghi `operator`.

```html
<div>has width</div>
```

Chúng ta gán `width` với phép tính

```css
div {
  width: calc(30% - 20px);
}
```

Chúng ta thêm JavaScript

```js
const styleMap = document.querySelector("div").computedStyleMap();

console.log(styleMap.get("width")); // CSSMathSum {values: CSSNumericArray, operator: "sum"}
console.log(styleMap.get("width").operator); // 'sum'
console.log(styleMap.get("width").values[1].value); // -20
```

{{EmbedLiveSample("Examples", 120, 300)}}

`CSSMathValue.operator` trả về `"sum"` vì `styleMap.get("width").values[1].value );` là `-20`: cộng với số âm.

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
