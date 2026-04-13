---
title: "CSSNumericValue: equals() method"
short-title: equals()
slug: Web/API/CSSNumericValue/equals
page-type: web-api-instance-method
browser-compat: api.CSSNumericValue.equals
---

{{APIRef("CSS Typed OM")}}

Phương thức **`equals()`** của giao diện {{domxref("CSSNumericValue")}} trả về một giá trị boolean cho biết liệu các giá trị được truyền vào có hoàn toàn bằng nhau hay không. Để trả về `true`, tất cả các giá trị được truyền vào phải có cùng kiểu, cùng giá trị và theo cùng thứ tự. Điều này cho phép kiểm tra bình đẳng cấu trúc một cách nhanh chóng.

## Cú pháp

```js-nolint
equals(number)
```

### Tham số

- `number`
  - : Một số hoặc một {{domxref('CSSNumericValue')}}.

### Giá trị trả về

Một giá trị boolean.

### Ngoại lệ

Không có.

## Ví dụ

Như đã đề cập, tất cả các giá trị được truyền vào phải có cùng kiểu, cùng giá trị và theo cùng thứ tự. Một số ví dụ dưới đây minh họa điều gì xảy ra khi các điều kiện này không được thỏa mãn.

```js
let cssMathSum = new CSSMathSum(CSS.px(1), CSS.px(2));
let matchingCssMathSum = new CSSMathSum(CSS.px(1), CSS.px(2));
// In ra true
console.log(cssMathSum.equals(matchingCssMathSum));

let otherCssMathSum = CSSMathSum(CSS.px(2), CSS.px(1));
// In ra false
console.log(cssMathSum.equals(otherCssMathSum));

// Cũng in ra false
console.log(CSS.cm("1").equal(CSS.in("0.393701")));
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
