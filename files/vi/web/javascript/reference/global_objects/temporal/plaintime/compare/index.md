---
title: Temporal.PlainTime.compare()
short-title: compare()
slug: Web/JavaScript/Reference/Global_Objects/Temporal/PlainTime/compare
page-type: javascript-static-method
browser-compat: javascript.builtins.Temporal.PlainTime.compare
sidebar: jsref
---

Phương thức tĩnh **`Temporal.PlainTime.compare()`** trả về một số (-1, 0 hoặc 1) cho biết thời gian đầu tiên đến trước, bằng hoặc sau thời gian thứ hai. Nó tương đương với việc so sánh từng trường giờ, phút, giây, mili-giây, micro-giây và nano-giây một.

## Cú pháp

```js-nolint
Temporal.PlainTime.compare(time1, time2)
```

### Tham số

- `time1`
  - : Một chuỗi, một đối tượng, hoặc một thực thể {{jsxref("Temporal.PlainTime")}} đại diện cho thời gian đầu tiên cần so sánh. Nó được chuyển đổi thành đối tượng `Temporal.PlainTime` bằng cùng thuật toán như {{jsxref("Temporal/PlainTime/from", "Temporal.PlainTime.from()")}}.
- `time2`
  - : Thời gian thứ hai cần so sánh, được chuyển đổi thành đối tượng `Temporal.PlainTime` bằng cùng thuật toán như `time1`.

### Giá trị trả về

Trả về `-1` nếu `time1` đến trước `time2`, `0` nếu chúng bằng nhau, và `1` nếu `time1` đến sau `time2`.

## Ví dụ

### Sử dụng Temporal.PlainTime.compare()

```js
const time1 = Temporal.PlainTime.from("12:34:56");
const time2 = Temporal.PlainTime.from("12:34:57");
console.log(Temporal.PlainTime.compare(time1, time2)); // -1

const time3 = Temporal.PlainTime.from("11:34:56");
console.log(Temporal.PlainTime.compare(time1, time3)); // 1
```

### Sắp xếp một mảng thời gian

Mục đích của hàm `compare()` này là hoạt động như một hàm so sánh để truyền vào {{jsxref("Array.prototype.sort()")}} và các hàm liên quan.

```js
const times = ["12:34:56", "11:34:56", "12:34:57"];

times.sort(Temporal.PlainTime.compare);
console.log(times);
// [ "11:34:56", "12:34:56", "12:34:57" ]
```

## Đặc tả

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{jsxref("Temporal.PlainTime")}}
- {{jsxref("Temporal/PlainTime/equals", "Temporal.PlainTime.prototype.equals()")}}
