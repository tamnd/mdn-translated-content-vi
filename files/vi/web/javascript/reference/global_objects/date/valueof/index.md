---
title: Date.prototype.valueOf()
short-title: valueOf()
slug: Web/JavaScript/Reference/Global_Objects/Date/valueOf
page-type: javascript-instance-method
browser-compat: javascript.builtins.Date.valueOf
sidebar: jsref
---

Phương thức **`valueOf()`** của các instance {{jsxref("Date")}} trả về số mili giây của ngày này kể từ [epoch](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Date#the_epoch_timestamps_and_invalid_date), được định nghĩa là nửa đêm đầu ngày 1 tháng 1 năm 1970, UTC.

{{InteractiveExample("JavaScript Demo: Date.prototype.valueOf()")}}

```js interactive-example
const date1 = new Date(Date.UTC(96, 1, 2, 3, 4, 5));

console.log(date1.valueOf());
// Expected output: 823230245000

const date2 = new Date("02 Feb 1996 03:04:05 GMT");

console.log(date2.valueOf());
// Expected output: 823230245000
```

## Cú pháp

```js-nolint
valueOf()
```

### Tham số

Không có.

### Giá trị trả về

Một số đại diện cho [timestamp](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Date#the_epoch_timestamps_and_invalid_date), tính bằng mili giây, của ngày này. Trả về `NaN` nếu ngày [không hợp lệ](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Date#the_epoch_timestamps_and_invalid_date).

## Mô tả

Phương thức `valueOf()` là một phần của [giao thức ép kiểu](/en-US/docs/Web/JavaScript/Guide/Data_structures#type_coercion). Vì `Date` có phương thức [`[Symbol.toPrimitive]()`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Date/Symbol.toPrimitive), phương thức đó luôn được ưu tiên hơn `valueOf()` khi một đối tượng `Date` được ngầm [ép kiểu thành số](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Number#number_coercion). Tuy nhiên, `Date.prototype[Symbol.toPrimitive]()` vẫn gọi `this.valueOf()` nội bộ.

Đối tượng {{jsxref("Date")}} ghi đè phương thức {{jsxref("Object/valueOf", "valueOf()")}} của {{jsxref("Object")}}. `Date.prototype.valueOf()` trả về timestamp của ngày, tương đương về mặt chức năng với phương thức {{jsxref("Date.prototype.getTime()")}}.

## Ví dụ

### Sử dụng valueOf()

```js
const d = new Date(0); // 1970-01-01T00:00:00.000Z
console.log(d.valueOf()); // 0
```

## Đặc tả kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{jsxref("Object.prototype.valueOf()")}}
- {{jsxref("Date.prototype.getTime()")}}
