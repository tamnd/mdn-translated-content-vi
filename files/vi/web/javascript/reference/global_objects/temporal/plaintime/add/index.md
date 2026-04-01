---
title: Temporal.PlainTime.prototype.add()
short-title: add()
slug: Web/JavaScript/Reference/Global_Objects/Temporal/PlainTime/add
page-type: javascript-instance-method
browser-compat: javascript.builtins.Temporal.PlainTime.add
sidebar: jsref
---

Phương thức **`add()`** của các thực thể {{jsxref("Temporal.PlainTime")}} trả về một đối tượng `Temporal.PlainTime` mới đại diện cho thời gian này được tiến về phía trước một khoảng thời gian nhất định (dưới dạng có thể chuyển đổi bởi {{jsxref("Temporal/Duration/from", "Temporal.Duration.from()")}}), cuộn qua đồng hồ nếu cần.

## Cú pháp

```js-nolint
add(duration)
```

### Tham số

- `duration`
  - : Một chuỗi, một đối tượng, hoặc một thực thể {{jsxref("Temporal.Duration")}} đại diện cho khoảng thời gian cần thêm vào thời gian này. Nó được chuyển đổi thành đối tượng `Temporal.Duration` bằng cùng thuật toán như {{jsxref("Temporal/Duration/from", "Temporal.Duration.from()")}}.

### Giá trị trả về

Một đối tượng `Temporal.PlainTime` mới đại diện cho thời gian được chỉ định bởi `PlainTime` gốc, cộng với khoảng thời gian. Bất kỳ đơn vị nào lớn hơn `hours` đều bị bỏ qua, và nếu thời gian vượt qua nửa đêm, nó sẽ cuộn sang ngày tiếp theo.

Cộng một khoảng thời gian tương đương với [trừ](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Temporal/PlainTime/subtract) [phủ định](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Temporal/Duration/negated) của nó.

## Ví dụ

### Cộng một khoảng thời gian

```js
const start = Temporal.PlainTime.from("12:34:56");
const end = start.add({ hours: 1, minutes: 30 });
console.log(end.toString()); // 14:04:56

const end2 = start.add({ hours: -1, minutes: -30 });
console.log(end2.toString()); // 11:04:56

const distance = Temporal.PlainTime.from("00:00:00").until("01:23:45"); // 1h 23m 45s
const end3 = start.add(distance);
console.log(end3.toString()); // 13:58:41
```

### Cuộn qua thời gian

Nếu thời gian vượt qua nửa đêm, nó sẽ cuộn sang ngày tiếp theo:

```js
const start = Temporal.PlainTime.from("12:34:56");
const end = start.add({ hours: 12 });
console.log(end.toString()); // 00:34:56
```

## Đặc tả

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{jsxref("Temporal.PlainTime")}}
- {{jsxref("Temporal.Duration")}}
- {{jsxref("Temporal/PlainTime/subtract", "Temporal.PlainTime.prototype.subtract()")}}
