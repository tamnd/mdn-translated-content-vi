---
title: Temporal.Duration.prototype.with()
short-title: with()
slug: Web/JavaScript/Reference/Global_Objects/Temporal/Duration/with
page-type: javascript-instance-method
browser-compat: javascript.builtins.Temporal.Duration.with
sidebar: jsref
---

Phương thức **`with()`** của các instance {{jsxref("Temporal.Duration")}} trả về một đối tượng `Temporal.Duration` mới biểu diễn duration này với một số trường được thay thế bằng các giá trị mới. Vì tất cả các đối tượng `Temporal` được thiết kế để bất biến, phương thức này về cơ bản hoạt động như setter cho các trường của duration.

## Cú pháp

```js-nolint
with(info)
```

### Tham số

- `info`
  - : Một đối tượng chứa ít nhất một trong các thuộc tính được nhận bởi {{jsxref("Temporal/Duration/from", "Temporal.Duration.from()")}}: `years`, `months`, `weeks`, `days`, `hours`, `minutes`, `seconds`, `milliseconds`, `microseconds`, `nanoseconds`. Các thuộc tính không được chỉ định sẽ sử dụng các giá trị từ duration gốc.

### Giá trị trả về

Một đối tượng `Temporal.Duration` mới, trong đó các trường được chỉ định trong `info` mà không phải `undefined` được thay thế bằng các giá trị tương ứng, và phần còn lại của các trường được sao chép từ duration gốc.

### Ngoại lệ

- {{jsxref("RangeError")}}
  - : Được ném ra trong một trong các trường hợp sau:
    - Bất kỳ thuộc tính nào được nhận trong đối tượng `info` không phải là số nguyên (bao gồm cả các giá trị không hữu hạn).
    - Một [đơn vị lịch](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Temporal/Duration#calendar_durations) (years, months, weeks) có giá trị tuyệt đối ≥ 2<sup>32</sup>.
    - Phần không phải lịch của duration (days trở xuống), khi biểu diễn bằng giây, có giá trị tuyệt đối ≥ 2<sup>53</sup>.
- {{jsxref("TypeError")}}
  - : Được ném ra trong một trong các trường hợp sau:
    - Đối tượng `info` không phải là một đối tượng.
    - Tất cả các thuộc tính được nhận trong đối tượng `info` đều là `undefined`.

## Ví dụ

### Sử dụng with()

Bạn có thể sử dụng `with()` để kiểm soát chi tiết các trường của đối tượng `Temporal.Duration`. Ví dụ, bạn có thể [cân bằng](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Temporal/Duration#duration_balancing) thủ công một duration chỉ trên một đơn vị, điều mà `round()` không cung cấp:

```js
function balanceMinutes(duration) {
  const { hours, minutes } = duration;
  const totalMinutes = hours * 60 + minutes;
  const balancedMinutes = totalMinutes % 60;
  const balancedHours = (totalMinutes - balancedMinutes) / 60;
  return duration.with({ hours: balancedHours, minutes: balancedMinutes });
}

const d1 = Temporal.Duration.from({ hours: 100, minutes: 100, seconds: 100 });
const d2 = balanceMinutes(d1);
console.log(d2.hours); // 101
console.log(d2.minutes); // 40
console.log(d2.seconds); // 100; vẫn chưa được cân bằng
```

## Đặc tả

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{jsxref("Temporal.Duration")}}
- {{jsxref("Temporal/Duration/from", "Temporal.Duration.from()")}}
- {{jsxref("Temporal/Duration/add", "Temporal.Duration.prototype.add()")}}
- {{jsxref("Temporal/Duration/subtract", "Temporal.Duration.prototype.subtract()")}}
- {{jsxref("Temporal/Duration/round", "Temporal.Duration.prototype.round()")}}
