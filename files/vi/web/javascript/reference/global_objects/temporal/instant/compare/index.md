---
title: Temporal.Instant.compare()
short-title: compare()
slug: Web/JavaScript/Reference/Global_Objects/Temporal/Instant/compare
page-type: javascript-static-method
browser-compat: javascript.builtins.Temporal.Instant.compare
sidebar: jsref
---

Phương thức tĩnh **`Temporal.Instant.compare()`** trả về một số (-1, 0, hoặc 1) cho biết instant đầu tiên đến trước, bằng, hoặc sau instant thứ hai. Nó tương đương với việc so sánh {{jsxref("Temporal/Instant/epochNanoseconds", "epochNanoseconds")}} của hai instant.

## Cú pháp

```js-nolint
Temporal.Instant.compare(instant1, instant2)
```

### Tham số

- `instant1`
  - : Một chuỗi hoặc thực thể {{jsxref("Temporal.Instant")}} biểu diễn instant đầu tiên cần so sánh. Nó được chuyển đổi thành đối tượng `Temporal.Instant` bằng cùng thuật toán như {{jsxref("Temporal/Instant/from", "Temporal.Instant.from()")}}.
- `instant2`
  - : Instant thứ hai để so sánh, được chuyển đổi thành đối tượng `Temporal.Instant` bằng cùng thuật toán như `instant1`.

### Giá trị trả về

Trả về `-1` nếu `instant1` đến trước `instant2`, `0` nếu chúng bằng nhau, và `1` nếu `instant1` đến sau `instant2`.

## Ví dụ

### Sử dụng Temporal.Instant.compare()

```js
const instant1 = Temporal.Instant.from("2021-08-01T12:34:56Z");
const instant2 = Temporal.Instant.from("2021-08-01T12:34:56Z");

console.log(Temporal.Instant.compare(instant1, instant2)); // 0

const instant3 = Temporal.Instant.from("2021-08-01T13:34:56Z");
console.log(Temporal.Instant.compare(instant1, instant3)); // -1
```

### Sắp xếp một mảng các instant

Mục đích của hàm `compare()` này là hoạt động như một bộ so sánh được truyền vào {{jsxref("Array.prototype.sort()")}} và các hàm liên quan.

```js
const instants = [
  Temporal.Instant.from("2021-08-01T12:34:56Z"),
  Temporal.Instant.from("2021-08-01T12:34:56+01:00"),
  Temporal.Instant.from("2021-08-01T12:34:56-01:00"),
];

instants.sort(Temporal.Instant.compare);
console.log(instants.map((instant) => instant.toString()));
// [ '2021-08-01T11:34:56Z', '2021-08-01T12:34:56Z', '2021-08-01T13:34:56Z' ]
```

## Đặc tả

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{jsxref("Temporal.Instant")}}
- {{jsxref("Temporal/Instant/equals", "Temporal.Instant.prototype.equals()")}}
