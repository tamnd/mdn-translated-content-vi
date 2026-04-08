---
title: Temporal.PlainDate.prototype.valueOf()
short-title: valueOf()
slug: Web/JavaScript/Reference/Global_Objects/Temporal/PlainDate/valueOf
page-type: javascript-instance-method
browser-compat: javascript.builtins.Temporal.PlainDate.valueOf
sidebar: jsref
---

Phương thức **`valueOf()`** của các instance {{jsxref("Temporal.PlainDate")}} ném ra một {{jsxref("TypeError")}}, nhằm ngăn các instance `Temporal.PlainDate` bị [chuyển đổi ngầm thành kiểu nguyên thủy](/en-US/docs/Web/JavaScript/Guide/Data_structures#primitive_coercion) khi được sử dụng trong các phép toán số học hoặc so sánh.

## Cú pháp

```js-nolint
valueOf()
```

### Tham số

Không có.

### Giá trị trả về

Không có.

### Ngoại lệ

- {{jsxref("TypeError")}}
  - : Luôn được ném ra.

## Mô tả

Vì cả [chuyển đổi nguyên thủy](/en-US/docs/Web/JavaScript/Guide/Data_structures#primitive_coercion) và [chuyển đổi số](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Number#number_coercion) đều gọi `valueOf()` trước `toString()`, nếu `valueOf()` vắng mặt, thì một biểu thức như `date1 > date2` sẽ ngầm so sánh chúng dưới dạng chuỗi, điều này có thể cho kết quả ngoài mong đợi. Bằng cách ném ra `TypeError`, các instance `Temporal.PlainDate` ngăn chặn các chuyển đổi ngầm như vậy. Bạn cần phải chuyển đổi chúng rõ ràng thành chuỗi bằng {{jsxref("Temporal/PlainDate/toString", "Temporal.PlainDate.prototype.toString()")}}, hoặc sử dụng phương thức tĩnh {{jsxref("Temporal/PlainDate/compare", "Temporal.PlainDate.compare()")}} để so sánh chúng.

## Ví dụ

### Các phép toán số học và so sánh trên Temporal.PlainDate

Tất cả các phép toán số học và so sánh trên các instance `Temporal.PlainDate` phải sử dụng các phương thức chuyên dụng hoặc chuyển đổi chúng thành kiểu nguyên thủy một cách rõ ràng.

```js
const date1 = Temporal.PlainDate.from("2022-01-01");
const date2 = Temporal.PlainDate.from("2022-07-01");
date1 > date2; // TypeError: can't convert PlainDate to primitive type
Temporal.PlainDate.compare(date1, date2); // -1

date2 - date1; // TypeError: can't convert PlainDate to primitive type
date2.since(date1).toString(); // "P181D"
```

## Đặc tả

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{jsxref("Temporal.PlainDate")}}
- {{jsxref("Temporal/PlainDate/toString", "Temporal.PlainDate.prototype.toString()")}}
- {{jsxref("Temporal/PlainDate/toJSON", "Temporal.PlainDate.prototype.toJSON()")}}
- {{jsxref("Temporal/PlainDate/toLocaleString", "Temporal.PlainDate.prototype.toLocaleString()")}}
