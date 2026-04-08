---
title: Temporal.ZonedDateTime.prototype.hour
short-title: hour
slug: Web/JavaScript/Reference/Global_Objects/Temporal/ZonedDateTime/hour
page-type: javascript-instance-accessor-property
browser-compat: javascript.builtins.Temporal.ZonedDateTime.hour
sidebar: jsref
---

Thuộc tính accessor **`hour`** của các thực thể {{jsxref("Temporal.ZonedDateTime")}} trả về một số nguyên từ 0 đến 23 biểu thị thành phần giờ của thời gian này.

Set accessor của `hour` là `undefined`. Bạn không thể thay đổi thuộc tính này trực tiếp. Sử dụng phương thức {{jsxref("Temporal/ZonedDateTime/with", "with()")}} để tạo đối tượng `Temporal.ZonedDateTime` mới với giá trị mong muốn.

Để biết thêm thông tin chung và các ví dụ khác, xem {{jsxref("Temporal/PlainTime/hour", "Temporal.PlainTime.prototype.hour")}}.

Với `ZonedDateTime`, `hour` có thể không liên tục do thay đổi offset như các chuyển đổi giờ tiết kiệm ánh sáng ban ngày (DST). Trong trường hợp này, giờ có thể bị lặp lại hoặc bị bỏ qua.

## Ví dụ

### Sử dụng hour

```js
const dt = Temporal.ZonedDateTime.from(
  "2021-07-01T12:34:56.123456789-04:00[America/New_York]",
);
console.log(dt.hour); // 12
```

### Giờ không liên tục

Giờ không liên tục rất phổ biến do các chuyển đổi giờ tiết kiệm ánh sáng ban ngày (DST), được giải thích thêm trong [Tính mơ hồ và khoảng trống từ giờ địa phương đến UTC](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Temporal/ZonedDateTime#ambiguity_and_gaps_from_local_time_to_utc_time).

```js
const dt = Temporal.ZonedDateTime.from(
  "2024-11-03T01:59:00-04:00[America/New_York]",
);
console.log(dt.hour); // 1
const dt2 = dt.add({ minutes: 1 });
console.log(dt2.hour); // 1
console.log(dt2.toString()); // 2024-11-03T01:00:00-05:00[America/New_York]

const dt3 = Temporal.ZonedDateTime.from(
  "2024-03-10T01:59:00-05:00[America/New_York]",
);
console.log(dt3.hour); // 1
const dt4 = dt3.add({ minutes: 1 });
console.log(dt4.hour); // 3
console.log(dt4.toString()); // 2024-03-10T03:00:00-04:00[America/New_York]
```

Vì lý do này, bạn luôn nên ưu tiên sử dụng {{jsxref("Temporal/ZonedDateTime/add", "add()")}} và {{jsxref("Temporal/ZonedDateTime/subtract", "subtract()")}} để thao tác ngày và giờ, thay vì thay đổi trực tiếp thuộc tính `hour`.

## Thông số kỹ thuật

{{Specifications}}

## Tính tương thích với trình duyệt

{{Compat}}

## Xem thêm

- {{jsxref("Temporal.ZonedDateTime")}}
- {{jsxref("Temporal/ZonedDateTime/with", "Temporal.ZonedDateTime.prototype.with()")}}
- {{jsxref("Temporal/ZonedDateTime/add", "Temporal.ZonedDateTime.prototype.add()")}}
- {{jsxref("Temporal/ZonedDateTime/subtract", "Temporal.ZonedDateTime.prototype.subtract()")}}
- {{jsxref("Temporal/PlainTime/hour", "Temporal.PlainTime.prototype.hour")}}
