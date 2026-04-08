---
title: Temporal.PlainMonthDay.prototype.valueOf()
short-title: valueOf()
slug: Web/JavaScript/Reference/Global_Objects/Temporal/PlainMonthDay/valueOf
page-type: javascript-instance-method
browser-compat: javascript.builtins.Temporal.PlainMonthDay.valueOf
sidebar: jsref
---

Phương thức **`valueOf()`** của các instance {{jsxref("Temporal.PlainMonthDay")}} ném ra một {{jsxref("TypeError")}}, ngăn các instance `Temporal.PlainMonthDay` bị [chuyển đổi ngầm định sang kiểu nguyên thủy](/en-US/docs/Web/JavaScript/Guide/Data_structures#primitive_coercion) khi được dùng trong các phép tính số học hoặc so sánh.

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
  - : Luôn được ném.

## Mô tả

Vì cả [chuyển đổi nguyên thủy](/en-US/docs/Web/JavaScript/Guide/Data_structures#primitive_coercion) và [chuyển đổi số](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Number#number_coercion) đều gọi `valueOf()` trước `toString()`, nếu `valueOf()` vắng mặt, thì một biểu thức như `monthDay1 > monthDay2` sẽ ngầm định so sánh chúng như chuỗi, điều này có thể cho kết quả không mong đợi. Bằng cách ném ra `TypeError`, các instance `Temporal.PlainMonthDay` ngăn các chuyển đổi ngầm định như vậy. Bạn cần chuyển đổi rõ ràng chúng sang chuỗi bằng {{jsxref("Temporal/PlainMonthDay/toString", "Temporal.PlainMonthDay.prototype.toString()")}}.

## Ví dụ

### Các phép tính số học và so sánh trên Temporal.PlainMonthDay

Tất cả các phép tính số học và so sánh trên các instance `Temporal.PlainMonthDay` nên sử dụng các phương thức dành riêng hoặc chuyển đổi chúng sang kiểu nguyên thủy một cách rõ ràng.

```js
const md1 = Temporal.PlainMonthDay.from("01-01");
const md2 = Temporal.PlainMonthDay.from("07-01");
md1 > md2; // TypeError: can't convert PlainMonthDay to primitive type
Temporal.PlainDate.compare(
  md1.toPlainDate({ year: 2021 }),
  md2.toPlainDate({ year: 2021 }),
); // -1

md2 - md1; // TypeError: can't convert PlainMonthDay to primitive type
md2
  .toPlainDate({ year: 2021 })
  .since(md1.toPlainDate({ year: 2021 }))
  .toString(); // "P181D"
```

## Đặc tả kỹ thuật

{{Specifications}}

## Tính tương thích với trình duyệt

{{Compat}}

## Xem thêm

- {{jsxref("Temporal.PlainMonthDay")}}
- {{jsxref("Temporal/PlainMonthDay/toString", "Temporal.PlainMonthDay.prototype.toString()")}}
- {{jsxref("Temporal/PlainMonthDay/toJSON", "Temporal.PlainMonthDay.prototype.toJSON()")}}
- {{jsxref("Temporal/PlainMonthDay/toLocaleString", "Temporal.PlainMonthDay.prototype.toLocaleString()")}}
