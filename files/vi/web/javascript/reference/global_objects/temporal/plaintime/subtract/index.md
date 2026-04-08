---
title: Temporal.PlainTime.prototype.subtract()
short-title: subtract()
slug: Web/JavaScript/Reference/Global_Objects/Temporal/PlainTime/subtract
page-type: javascript-instance-method
browser-compat: javascript.builtins.Temporal.PlainTime.subtract
sidebar: jsref
---

Phương thức **`subtract()`** của các thực thể {{jsxref("Temporal.PlainTime")}} trả về một đối tượng `Temporal.PlainTime` mới đại diện cho thời gian này được lùi về phía sau một khoảng thời gian nhất định (dưới dạng có thể chuyển đổi bởi {{jsxref("Temporal/Duration/from", "Temporal.Duration.from()")}}), cuộn qua đồng hồ nếu cần.

Nếu bạn muốn trừ hai thời gian và nhận được một khoảng thời gian, hãy sử dụng {{jsxref("Temporal/PlainTime/since", "since()")}} hoặc {{jsxref("Temporal/PlainTime/until", "until()")}} thay vào đó.

## Cú pháp

```js-nolint
subtract(duration)
```

### Tham số

- `duration`
  - : Một chuỗi, một đối tượng, hoặc một thực thể {{jsxref("Temporal.Duration")}} đại diện cho khoảng thời gian cần trừ từ thời gian này. Nó được chuyển đổi thành đối tượng `Temporal.Duration` bằng cùng thuật toán như {{jsxref("Temporal/Duration/from", "Temporal.Duration.from()")}}.

### Giá trị trả về

Một đối tượng `Temporal.PlainTime` mới đại diện cho thời gian được chỉ định bởi `PlainTime` gốc, trừ đi khoảng thời gian.

Trừ một khoảng thời gian tương đương với [cộng](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Temporal/PlainTime/add) [phủ định](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Temporal/Duration/negated) của nó, vì vậy tất cả các lưu ý tương tự đều áp dụng.

## Ví dụ

### Trừ một khoảng thời gian

```js
const start = Temporal.PlainTime.from("12:34:56");
const end = start.subtract({ hours: 1, minutes: 30 });
console.log(end.toString()); // 11:04:56
```

Để xem thêm ví dụ, hãy xem {{jsxref("Temporal/PlainTime/add", "add()")}}.

## Đặc tả

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{jsxref("Temporal.PlainTime")}}
- {{jsxref("Temporal.Duration")}}
- {{jsxref("Temporal/PlainTime/add", "Temporal.PlainTime.prototype.add()")}}
- {{jsxref("Temporal/PlainTime/since", "Temporal.PlainTime.prototype.since()")}}
- {{jsxref("Temporal/PlainTime/until", "Temporal.PlainTime.prototype.until()")}}
