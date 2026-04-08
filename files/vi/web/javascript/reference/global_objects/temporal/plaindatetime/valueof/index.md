---
title: Temporal.PlainDateTime.prototype.valueOf()
short-title: valueOf()
slug: Web/JavaScript/Reference/Global_Objects/Temporal/PlainDateTime/valueOf
page-type: javascript-instance-method
browser-compat: javascript.builtins.Temporal.PlainDateTime.valueOf
sidebar: jsref
---

Phương thức **`valueOf()`** của các instance {{jsxref("Temporal.PlainDateTime")}} ném ra một {{jsxref("TypeError")}}, nhằm ngăn các instance `Temporal.PlainDateTime` bị [chuyển đổi ngầm thành kiểu nguyên thủy](/en-US/docs/Web/JavaScript/Guide/Data_structures#primitive_coercion) khi dùng trong các phép toán số học hoặc so sánh.

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

Vì cả [chuyển đổi nguyên thủy](/en-US/docs/Web/JavaScript/Guide/Data_structures#primitive_coercion) lẫn [chuyển đổi số](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Number#number_coercion) đều gọi `valueOf()` trước `toString()`, nếu `valueOf()` bị thiếu, thì một biểu thức như `dateTime1 > dateTime2` sẽ ngầm so sánh chúng dưới dạng chuỗi, điều này có thể cho kết quả không mong đợi. Bằng cách ném ra `TypeError`, các instance `Temporal.PlainDateTime` ngăn chặn các chuyển đổi ngầm như vậy. Bạn cần chuyển đổi tường minh sang chuỗi bằng {{jsxref("Temporal/PlainDateTime/toString", "Temporal.PlainDateTime.prototype.toString()")}}, hoặc sử dụng phương thức tĩnh {{jsxref("Temporal/PlainDateTime/compare", "Temporal.PlainDateTime.compare()")}} để so sánh chúng.

## Ví dụ

### Phép toán số học và so sánh trên Temporal.PlainDateTime

Tất cả các phép toán số học và so sánh trên các instance `Temporal.PlainDateTime` nên dùng các phương thức chuyên dụng hoặc chuyển đổi tường minh sang kiểu nguyên thủy.

```js
const dt1 = Temporal.PlainDateTime.from("2022-01-01T00:00:00");
const dt2 = Temporal.PlainDateTime.from("2022-07-01T00:00:00");
dt1 > dt2; // TypeError: can't convert PlainDateTime to primitive type
Temporal.PlainDateTime.compare(dt1, dt2); // -1

dt2 - dt1; // TypeError: can't convert PlainDateTime to primitive type
dt2.since(dt1).toString(); // "P181D"
```

## Đặc tả

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{jsxref("Temporal.PlainDateTime")}}
- {{jsxref("Temporal/PlainDateTime/toString", "Temporal.PlainDateTime.prototype.toString()")}}
- {{jsxref("Temporal/PlainDateTime/toJSON", "Temporal.PlainDateTime.prototype.toJSON()")}}
- {{jsxref("Temporal/PlainDateTime/toLocaleString", "Temporal.PlainDateTime.prototype.toLocaleString()")}}
