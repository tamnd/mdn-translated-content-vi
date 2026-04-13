---
title: CSSMathSum
slug: Web/API/CSSMathSum
page-type: web-api-interface
browser-compat: api.CSSMathSum
---

{{APIRef("CSS Typed Object Model API")}}

Giao diện **`CSSMathSum`** của [CSS Typed Object Model API](/en-US/docs/Web/API/CSS_Object_Model) biểu thị kết quả thu được khi gọi {{domxref('CSSNumericValue.add','add()')}}, {{domxref('CSSNumericValue.sub','sub()')}}, hoặc {{domxref('CSSNumericValue.toSum','toSum()')}} trên {{domxref('CSSNumericValue')}}.

`CSSMathSum` là loại đối tượng được trả về khi sử dụng phương thức [`StylePropertyMapReadOnly.get()`](/en-US/docs/Web/API/StylePropertyMapReadOnly/get) trên một thuộc tính CSS có giá trị được tạo bằng hàm {{cssxref("calc()")}}.

{{InheritanceDiagram}}

## Hàm khởi tạo

- {{domxref("CSSMathSum.CSSMathSum", "CSSMathSum()")}} {{Experimental_Inline}}
  - : Tạo một đối tượng `CSSMathSum` mới.

## Thuộc tính phiên bản

- {{domxref('CSSMathSum.values')}}
  - : Trả về một đối tượng {{domxref('CSSNumericArray')}} chứa một hoặc nhiều đối tượng {{domxref('CSSNumericValue')}}.

## Phương thức tĩnh

_Giao diện cũng có thể kế thừa phương thức từ giao diện cha {{domxref("CSSMathValue")}}._

## Phương thức phiên bản

_Giao diện cũng có thể kế thừa phương thức từ giao diện cha {{domxref("CSSMathValue")}}._

## Ví dụ

Chúng ta tạo một phần tử với {{cssxref("width")}} được xác định bằng hàm {{cssxref("calc()")}}, sau đó dùng {{domxref("console/log_static", "console.log()")}} để ghi lại `operator` và `values`, và đào sâu vào các giá trị.

```html
<div>has width</div>
```

Chúng ta gán `width`

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
console.log(styleMap.get("width").values); // CSSNumericArray {0: CSSUnitValue, 1: CSSUnitValue, length: 2}
console.log(styleMap.get("width").values[0]); // CSSUnitValue {value: 30, unit: "percent"}
console.log(styleMap.get("width").values[0].value); // 30
console.log(styleMap.get("width").values[0].unit); // 'percent'
console.log(styleMap.get("width").values[1]); // CSSUnitValue {value: -20, unit: "px"}
console.log(styleMap.get("width").values[1].value); //  -20
console.log(styleMap.get("width").values[1].unit); // 'px'
```

{{EmbedLiveSample("Examples", 120, 300)}}

Đặc tả vẫn đang phát triển. Trong tương lai chúng ta có thể viết ba dòng cuối như:

```js
console.log(styleMap.get("width").values[1]); // CSSMathNegate {value: CSSUnitValue, operator: "negate"}
console.log(styleMap.get("width").values[1].value); // CSSUnitValue {value: 20, unit: "px"}
console.log(styleMap.get("width").values[1].value.unit); // 'px'
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
