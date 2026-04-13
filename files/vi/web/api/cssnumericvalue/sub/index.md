---
title: "CSSNumericValue: sub() method"
short-title: sub()
slug: Web/API/CSSNumericValue/sub
page-type: web-api-instance-method
browser-compat: api.CSSNumericValue.sub
---

{{APIRef("CSS Typed OM")}}

Phương thức **`sub()`** của giao diện {{domxref("CSSNumericValue")}} trừ một số khỏi `CSSNumericValue`.

## Cú pháp

```js-nolint
sub(number)
```

### Tham số

- `number`
  - : Một số hoặc một {{domxref('CSSMathSum')}}.

### Giá trị trả về

Một {{domxref('CSSMathSum')}}.

### Ngoại lệ

- {{jsxref("TypeError")}}
  - : Được ném ra nếu kiểu không hợp lệ được truyền vào phương thức.

## Ví dụ

```js
let mathSum = CSS.px("23")
  .sub(CSS.percent("4"))
  .sub(CSS.cm("3"))
  .sub(CSS.in("9"));
// In ra "calc(23px - 4% - 3cm - 9in)"
console.log(mathSum.toString());
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
