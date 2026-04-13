---
title: "CSSNumericValue: add() method"
short-title: add()
slug: Web/API/CSSNumericValue/add
page-type: web-api-instance-method
browser-compat: api.CSSNumericValue.add
---

{{APIRef("CSS Typed OM")}}

Phương thức **`add()`** của giao diện {{domxref("CSSNumericValue")}} cộng thêm một số vào `CSSNumericValue`.

## Cú pháp

```js-nolint
add(number)
```

### Tham số

- `number`
  - : Một số hoặc một {{domxref('CSSNumericValue')}}.

### Giá trị trả về

Một {{domxref('CSSMathSum')}}.

### Ngoại lệ

- {{jsxref("TypeError")}}
  - : Được ném ra nếu kiểu không hợp lệ được truyền vào phương thức.

## Ví dụ

```js
let mathSum = CSS.px("23")
  .add(CSS.percent("4"))
  .add(CSS.cm("3"))
  .add(CSS.in("9"));
// In ra "calc(23px + 4% + 3cm + 9in)"
console.log(mathSum.toString());
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
