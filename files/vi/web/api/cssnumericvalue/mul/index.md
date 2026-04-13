---
title: "CSSNumericValue: mul() method"
short-title: mul()
slug: Web/API/CSSNumericValue/mul
page-type: web-api-instance-method
browser-compat: api.CSSNumericValue.mul
---

{{APIRef("CSS Typed OM")}}

Phương thức **`mul()`** của giao diện {{domxref("CSSNumericValue")}} nhân `CSSNumericValue` với giá trị được cung cấp.

## Cú pháp

```js-nolint
mul(number)
```

### Tham số

- `number`
  - : Một số hoặc một {{domxref('CSSNumericValue')}}.

### Giá trị trả về

Một {{domxref('CSSMathProduct')}}.

### Ngoại lệ

- {{jsxref("TypeError")}}
  - : Được ném ra nếu kiểu không hợp lệ được truyền vào phương thức.

## Ví dụ

```js
let mathSum = CSS.px("23")
  .mul(CSS.percent("4"))
  .mul(CSS.cm("3"))
  .mul(CSS.in("9"));
// In ra "calc(23px * 4% * 3cm * 9in)"
console.log(mathSum.toString());
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
