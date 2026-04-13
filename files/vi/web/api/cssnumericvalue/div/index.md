---
title: "CSSNumericValue: div() method"
short-title: div()
slug: Web/API/CSSNumericValue/div
page-type: web-api-instance-method
browser-compat: api.CSSNumericValue.div
---

{{APIRef("CSS Typed OM")}}

Phương thức **`div()`** của giao diện {{domxref("CSSNumericValue")}} chia `CSSNumericValue` cho giá trị được cung cấp.

## Cú pháp

```js-nolint
div(number)
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
let mathProduct = CSS.px("24").div(CSS.percent("4"));
// In ra "calc(24px / 4%)"
mathProduct.toString();
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
