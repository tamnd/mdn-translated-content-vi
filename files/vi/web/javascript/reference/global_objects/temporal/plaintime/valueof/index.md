---
title: Temporal.PlainTime.prototype.valueOf()
short-title: valueOf()
slug: Web/JavaScript/Reference/Global_Objects/Temporal/PlainTime/valueOf
page-type: javascript-instance-method
browser-compat: javascript.builtins.Temporal.PlainTime.valueOf
sidebar: jsref
---

Phương thức **`valueOf()`** của các thực thể {{jsxref("Temporal.PlainTime")}} ném ra một {{jsxref("TypeError")}}, ngăn các thực thể `Temporal.PlainTime` bị [chuyển đổi ngầm thành kiểu nguyên thủy](/en-US/docs/Web/JavaScript/Guide/Data_structures#primitive_coercion) khi được sử dụng trong các phép toán số học hoặc so sánh.

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
  - : Luôn ném ra.

## Mô tả

Vì cả [chuyển đổi nguyên thủy](/en-US/docs/Web/JavaScript/Guide/Data_structures#primitive_coercion) và [chuyển đổi số](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Number#number_coercion) đều gọi `valueOf()` trước `toString()`, nếu `valueOf()` vắng mặt, một biểu thức như `time1 > time2` sẽ so sánh ngầm chúng dưới dạng chuỗi, có thể dẫn đến kết quả không mong đợi. Bằng cách ném ra `TypeError`, các thực thể `Temporal.PlainTime` ngăn chặn các chuyển đổi ngầm như vậy. Bạn cần chuyển đổi chúng thành chuỗi một cách tường minh bằng {{jsxref("Temporal/PlainTime/toString", "Temporal.PlainTime.prototype.toString()")}}, hoặc dùng phương thức tĩnh {{jsxref("Temporal/PlainTime/compare", "Temporal.PlainTime.compare()")}} để so sánh chúng.

## Ví dụ

### Phép toán số học và so sánh trên Temporal.PlainTime

Tất cả các phép toán số học và so sánh trên các thực thể `Temporal.PlainTime` phải sử dụng các phương thức chuyên dụng hoặc chuyển đổi chúng thành kiểu nguyên thủy một cách tường minh.

```js
const time1 = Temporal.PlainTime.from("00:00:00");
const time2 = Temporal.PlainTime.from("12:00:00");
time1 > time2; // TypeError: can't convert PlainTime to primitive type
Temporal.PlainTime.compare(time1, time2); // -1

time2 - time1; // TypeError: can't convert PlainTime to primitive type
time2.since(time1).toString(); // "PT12H"
```

## Đặc tả

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{jsxref("Temporal.PlainTime")}}
- {{jsxref("Temporal/PlainTime/toString", "Temporal.PlainTime.prototype.toString()")}}
- {{jsxref("Temporal/PlainTime/toJSON", "Temporal.PlainTime.prototype.toJSON()")}}
- {{jsxref("Temporal/PlainTime/toLocaleString", "Temporal.PlainTime.prototype.toLocaleString()")}}
