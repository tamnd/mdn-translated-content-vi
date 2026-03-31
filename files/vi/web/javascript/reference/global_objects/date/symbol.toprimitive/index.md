---
title: Date.prototype[Symbol.toPrimitive]()
short-title: "[Symbol.toPrimitive]()"
slug: Web/JavaScript/Reference/Global_Objects/Date/Symbol.toPrimitive
page-type: javascript-instance-method
browser-compat: javascript.builtins.Date.@@toPrimitive
sidebar: jsref
---

Phương thức **`[Symbol.toPrimitive]()`** của các instance {{jsxref("Date")}} trả về một giá trị nguyên thủy đại diện cho ngày này. Nó có thể là một chuỗi hoặc một số, tùy thuộc vào gợi ý được cung cấp.

{{InteractiveExample("JavaScript Demo: Date.prototype[Symbol.toPrimitive]")}}

```js interactive-example
// Depending on timezone, your results will vary
const date = new Date("20 December 2019 14:48");

console.log(date[Symbol.toPrimitive]("string"));
// Expected output: "Fri Dec 20 2019 14:48:00 GMT+0530 (India Standard Time)"

console.log(date[Symbol.toPrimitive]("number"));
// Expected output: 1576833480000
```

## Cú pháp

```js-nolint
date[Symbol.toPrimitive](hint)
```

### Tham số

- `hint`
  - : Một chuỗi đại diện cho kiểu giá trị nguyên thủy cần trả về. Các giá trị hợp lệ như sau:
    - `"string"` hoặc `"default"`: Phương thức nên trả về một chuỗi.
    - `"number"`: Phương thức nên trả về một số.

### Giá trị trả về

Nếu `hint` là `"string"` hoặc `"default"`, phương thức này trả về một chuỗi bằng cách [ép kiểu giá trị `this` thành chuỗi](/en-US/docs/Web/JavaScript/Reference/Global_Objects/String#string_coercion) (thử `toString()` trước rồi thử `valueOf()`).

Nếu `hint` là `"number"`, phương thức này trả về một số bằng cách [ép kiểu giá trị `this` thành số](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Number#number_coercion) (thử `valueOf()` trước rồi thử `toString()`).

### Ngoại lệ

- {{jsxref("TypeError")}}
  - : Ném ra nếu đối số `hint` không phải là một trong ba giá trị hợp lệ.

## Mô tả

Phương thức `[Symbol.toPrimitive]()` là một phần của [giao thức ép kiểu](/en-US/docs/Web/JavaScript/Guide/Data_structures#type_coercion). JavaScript luôn gọi phương thức `[Symbol.toPrimitive]()` ưu tiên để chuyển đổi một đối tượng thành giá trị nguyên thủy. Bạn hiếm khi cần tự gọi phương thức `[Symbol.toPrimitive]()`; JavaScript tự động gọi nó khi gặp một đối tượng mà ở đó một giá trị nguyên thủy được mong đợi.

Phương thức `[Symbol.toPrimitive]()` của đối tượng {{jsxref("Date")}} trả về một giá trị nguyên thủy bằng cách gọi {{jsxref("Date/valueOf", "this.valueOf()")}} và trả về một số, hoặc gọi {{jsxref("Date/toString", "this.toString()")}} và trả về một chuỗi. Nó tồn tại để ghi đè quá trình [ép kiểu nguyên thủy](/en-US/docs/Web/JavaScript/Guide/Data_structures#primitive_coercion) mặc định nhằm trả về một chuỗi thay vì một số, vì ép kiểu nguyên thủy theo mặc định gọi {{jsxref("Date/valueOf", "valueOf()")}} trước {{jsxref("Date/toString", "toString()")}}. Với `[Symbol.toPrimitive]()` tùy chỉnh, `new Date(0) + 1` trả về `"Thu Jan 01 1970 00:00:00 GMT+0000 (Coordinated Universal Time)1"` (một chuỗi) thay vì `1` (một số).

## Ví dụ

### Sử dụng \[Symbol.toPrimitive]()

```js
const d = new Date(0); // 1970-01-01T00:00:00.000Z

d[Symbol.toPrimitive]("string"); // "Thu Jan 01 1970 00:00:00 GMT+0000 (Coordinated Universal Time)"
d[Symbol.toPrimitive]("number"); // 0
d[Symbol.toPrimitive]("default"); // "Thu Jan 01 1970 00:00:00 GMT+0000 (Coordinated Universal Time)"
```

## Đặc tả kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{jsxref("Symbol.toPrimitive")}}
