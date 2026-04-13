---
title: "CSSNumericValue: max() method"
short-title: max()
slug: Web/API/CSSNumericValue/max
page-type: web-api-instance-method
browser-compat: api.CSSNumericValue.max
---

{{APIRef("CSS Typed OM")}}

Phương thức **`max()`** của giao diện {{domxref("CSSNumericValue")}} trả về giá trị lớn nhất trong số các giá trị được truyền vào. Các giá trị được truyền vào phải cùng kiểu.

## Cú pháp

```js-nolint
max(number1, /* …, */ numberN)
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
// In ra "2cm"
console.log(CSS.cm("1").max(CSS.cm("2")).toString());

// In ra "max(1cm, 0.393701in)"
console.log(CSS.cm("1").max(CSS.in("0.393701")).toString());
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
