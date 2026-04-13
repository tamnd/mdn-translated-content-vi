---
title: "CSSMathSum: hàm khởi tạo CSSMathSum()"
short-title: CSSMathSum()
slug: Web/API/CSSMathSum/CSSMathSum
page-type: web-api-constructor
status:
  - experimental
browser-compat: api.CSSMathSum.CSSMathSum
---

{{APIRef("CSS Typed Object Model API")}}{{SeeCompatTable}}

Hàm khởi tạo **`CSSMathSum()`** tạo một đối tượng {{domxref("CSSMathSum")}} mới biểu thị kết quả thu được khi gọi {{domxref('CSSNumericValue.add','add()')}}, {{domxref('CSSNumericValue.sub','sub()')}}, hoặc {{domxref('CSSNumericValue.toSum','toSum()')}} trên {{domxref('CSSNumericValue')}}.

## Cú pháp

```js-nolint
new CSSMathSum(values)
```

### Tham số

- `values`
  - : Một hoặc nhiều số (được bọc thành {{domxref("CSSUnitValue")}} với `unit: "number"`) hoặc các đối tượng {{domxref("CSSNumericValue")}}.

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
