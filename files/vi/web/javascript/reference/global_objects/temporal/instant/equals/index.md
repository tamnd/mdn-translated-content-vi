---
title: Temporal.Instant.prototype.equals()
short-title: equals()
slug: Web/JavaScript/Reference/Global_Objects/Temporal/Instant/equals
page-type: javascript-instance-method
browser-compat: javascript.builtins.Temporal.Instant.equals
sidebar: jsref
---

Phương thức **`equals()`** của các thực thể {{jsxref("Temporal.Instant")}} trả về `true` nếu instant này tương đương về giá trị với một instant khác (ở dạng có thể chuyển đổi bằng {{jsxref("Temporal/Instant/from", "Temporal.Instant.from()")}}), và `false` nếu không. Chúng được so sánh bằng {{jsxref("Temporal/Instant/epochNanoseconds", "epochNanoseconds")}} của chúng. Nó tương đương với `Temporal.Instant.compare(this, other) === 0`.

## Cú pháp

```js-nolint
equals(other)
```

### Tham số

- `other`
  - : Một chuỗi hoặc thực thể {{jsxref("Temporal.Instant")}} biểu diễn instant kia cần so sánh. Nó được chuyển đổi thành đối tượng `Temporal.Instant` bằng cùng thuật toán như {{jsxref("Temporal/Instant/from", "Temporal.Instant.from()")}}.

### Giá trị trả về

`true` nếu instant này bằng `other` theo nano giây, `false` nếu không.

## Ví dụ

### Sử dụng equals()

```js
const instant1 = Temporal.Instant.from("2021-08-01T12:34:56Z");
const instant2 = Temporal.Instant.fromEpochMilliseconds(1627821296000);
console.log(instant1.equals(instant2)); // true
```

## Đặc tả

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{jsxref("Temporal.Instant")}}
- {{jsxref("Temporal/Instant/compare", "Temporal.Instant.compare()")}}
