---
title: "CSSNumericValue: min() method"
short-title: min()
slug: Web/API/CSSNumericValue/min
page-type: web-api-instance-method
browser-compat: api.CSSNumericValue.min
---

{{APIRef("CSS Typed OM")}}

Phương thức **`min()`** của giao diện {{domxref("CSSNumericValue")}} trả về giá trị nhỏ nhất trong số các giá trị được truyền vào. Các giá trị được truyền vào phải cùng kiểu.

## Cú pháp

```js-nolint
min(number1, /* …, */ numberN)
```

### Tham số

- `number1`, …, `numberN`
  - : Một số hoặc một {{domxref('CSSNumericValue')}}.

### Giá trị trả về

Một {{domxref('CSSUnitValue')}}.

### Ngoại lệ

- {{jsxref("TypeError")}}
  - : Được ném ra nếu kiểu không hợp lệ được truyền vào phương thức.

## Ví dụ

Như đã đề cập, tất cả các giá trị được truyền vào phải cùng kiểu và giá trị. Một số ví dụ dưới đây minh họa điều gì xảy ra khi điều kiện này không được thỏa mãn.

```js
// In ra "1cm"
console.log(CSS.cm("1").min(CSS.cm("2")).toString());

// In ra "max(1cm, 0.393701in)"
console.log(CSS.cm("1").max(CSS.in("0.393701")).toString());
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
