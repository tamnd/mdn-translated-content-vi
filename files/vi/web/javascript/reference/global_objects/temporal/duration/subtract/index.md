---
title: Temporal.Duration.prototype.subtract()
short-title: subtract()
slug: Web/JavaScript/Reference/Global_Objects/Temporal/Duration/subtract
page-type: javascript-instance-method
browser-compat: javascript.builtins.Temporal.Duration.subtract
sidebar: jsref
---

Phương thức **`subtract()`** của các instance {{jsxref("Temporal.Duration")}} trả về một đối tượng `Temporal.Duration` mới với hiệu của duration này và một duration đã cho. Nó tương đương với việc [cộng](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Temporal/Duration/add) giá trị [phủ định](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Temporal/Duration/negated) của duration kia.

## Cú pháp

```js-nolint
subtract(other)
```

### Tham số

- `other`
  - : Một chuỗi, một đối tượng, hoặc một instance {{jsxref("Temporal.Duration")}} đại diện cho duration cần trừ khỏi duration này. Nó được chuyển đổi thành đối tượng `Temporal.Duration` bằng thuật toán giống như {{jsxref("Temporal/Duration/from", "Temporal.Duration.from()")}}.

### Giá trị trả về

Một đối tượng `Temporal.Duration` mới đại diện cho hiệu của duration này và `other`.

### Ngoại lệ

- {{jsxref("RangeError")}}
  - : Được ném ra trong một trong các trường hợp sau:
    - `this` hoặc `other` là [calendar duration](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Temporal/Duration#calendar_durations) (có `years`, `months` hoặc `weeks` khác không), vì calendar duration là mơ hồ mà không có lịch và tham chiếu thời gian.
    - Hiệu của `this` và `other` vượt quá hoặc dưới mức duration tối đa hoặc tối thiểu có thể biểu diễn, là ±2<sup>53</sup> giây.

## Ví dụ

### Sử dụng subtract()

```js
const d1 = Temporal.Duration.from({ hours: 1, minutes: 30 });
const d2 = Temporal.Duration.from({ hours: -1, minutes: -20 });

const d3 = d1.subtract(d2);
console.log(d3.toString()); // "PT2H50M"
```

Để biết thêm ví dụ và lưu ý, xem phương thức [`add()`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Temporal/Duration/add).

## Đặc tả

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{jsxref("Temporal.Duration")}}
- {{jsxref("Temporal/Duration/add", "Temporal.Duration.prototype.add()")}}
- {{jsxref("Temporal/Duration/negated", "Temporal.Duration.prototype.negated()")}}
