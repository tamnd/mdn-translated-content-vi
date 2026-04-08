---
title: Temporal.PlainYearMonth.prototype.valueOf()
short-title: valueOf()
slug: Web/JavaScript/Reference/Global_Objects/Temporal/PlainYearMonth/valueOf
page-type: javascript-instance-method
browser-compat: javascript.builtins.Temporal.PlainYearMonth.valueOf
sidebar: jsref
---

Phương thức **`valueOf()`** của các instance {{jsxref("Temporal.PlainYearMonth")}} ném ra {{jsxref("TypeError")}}, ngăn các instance `Temporal.PlainYearMonth` bị [chuyển đổi ngầm định thành kiểu nguyên thủy](/en-US/docs/Web/JavaScript/Guide/Data_structures#primitive_coercion) khi được sử dụng trong các phép toán số học hoặc so sánh.

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
  - : Luôn luôn được ném ra.

## Mô tả

Vì cả [chuyển đổi nguyên thủy](/en-US/docs/Web/JavaScript/Guide/Data_structures#primitive_coercion) và [chuyển đổi số](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Number#number_coercion) đều gọi `valueOf()` trước `toString()`, nếu `valueOf()` không tồn tại, thì một biểu thức như `yearMonth1 > yearMonth2` sẽ ngầm định so sánh chúng dưới dạng chuỗi, điều này có thể cho ra kết quả không mong muốn. Bằng cách ném ra `TypeError`, các instance `Temporal.PlainYearMonth` ngăn chặn các chuyển đổi ngầm định như vậy. Bạn cần chuyển đổi chúng thành chuỗi một cách tường minh bằng {{jsxref("Temporal/PlainYearMonth/toString", "Temporal.PlainYearMonth.prototype.toString()")}}, hoặc sử dụng phương thức tĩnh {{jsxref("Temporal/PlainYearMonth/compare", "Temporal.PlainYearMonth.compare()")}} để so sánh chúng.

## Ví dụ

### Các phép toán số học và so sánh trên Temporal.PlainYearMonth

Tất cả các phép toán số học và so sánh trên các instance `Temporal.PlainYearMonth` nên sử dụng các phương thức chuyên dụng hoặc chuyển đổi chúng thành kiểu nguyên thủy một cách tường minh.

```js
const ym1 = Temporal.PlainYearMonth.from("2021-01");
const ym2 = Temporal.PlainYearMonth.from("2021-07");
ym1 > ym2; // TypeError: can't convert PlainYearMonth to primitive type
Temporal.PlainYearMonth.compare(ym1, ym2); // -1

ym2 - ym1; // TypeError: can't convert PlainYearMonth to primitive type
ym2.since(ym1).toString(); // "P6M"
```

## Đặc tả kỹ thuật

{{Specifications}}

## Khả năng tương thích với trình duyệt

{{Compat}}

## Xem thêm

- {{jsxref("Temporal.PlainYearMonth")}}
- {{jsxref("Temporal/PlainYearMonth/toString", "Temporal.PlainYearMonth.prototype.toString()")}}
- {{jsxref("Temporal/PlainYearMonth/toJSON", "Temporal.PlainYearMonth.prototype.toJSON()")}}
- {{jsxref("Temporal/PlainYearMonth/toLocaleString", "Temporal.PlainYearMonth.prototype.toLocaleString()")}}
