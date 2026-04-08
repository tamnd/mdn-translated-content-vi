---
title: Temporal.PlainDateTime.prototype.withPlainTime()
short-title: withPlainTime()
slug: Web/JavaScript/Reference/Global_Objects/Temporal/PlainDateTime/withPlainTime
page-type: javascript-instance-method
browser-compat: javascript.builtins.Temporal.PlainDateTime.withPlainTime
sidebar: jsref
---

Phương thức **`withPlainTime()`** của các instance {{jsxref("Temporal.PlainDateTime")}} trả về một đối tượng `Temporal.PlainDateTime` mới đại diện cho ngày-giờ này với phần thời gian được thay thế hoàn toàn bởi thời gian mới (theo dạng có thể chuyển đổi bởi {{jsxref("Temporal/PlainTime/from", "Temporal.PlainTime.from()")}})

Phương thức này sẽ thay thế tất cả các thuộc tính thời gian, mặc định là `0` với các thuộc tính không được chỉ định. Nếu bạn chỉ muốn thay thế một số thuộc tính thời gian, hãy dùng phương thức {{jsxref("Temporal/PlainDateTime/with", "with()")}} thay thế.

## Cú pháp

```js-nolint
withPlainTime()
withPlainTime(plainTime)
```

### Tham số

- `plainTime` {{optional_inline}}
  - : Một chuỗi, một đối tượng, hoặc một instance {{jsxref("Temporal.PlainTime")}} đại diện cho thời gian mới. Nó được chuyển đổi thành đối tượng `Temporal.PlainTime` sử dụng cùng thuật toán như {{jsxref("Temporal/PlainTime/from", "Temporal.PlainTime.from()")}}. Nếu không được chỉ định, phần thời gian sẽ được đặt thành `00:00:00`.

### Giá trị trả về

Một đối tượng `Temporal.PlainDateTime` mới, với phần ngày được sao chép từ ngày-giờ gốc và phần thời gian được thay thế bởi thời gian mới.

## Ví dụ

### Sử dụng withPlainTime()

```js
const dt = Temporal.PlainDateTime.from("2021-07-01T12:34:56");

// You can pass a string
const newDT = dt.withPlainTime("13:45:00");
console.log(newDT.toString()); // "2021-07-01T13:45:00"

// You can only specify some time properties, and the rest default to 0;
// for the with() method, they would be copied from the original date-time
const newDT2 = dt.withPlainTime({ hour: 13 });
console.log(newDT2.toString()); // "2021-07-01T13:00:00"

// You can pass nothing to set the time to midnight
const newDT3 = dt.withPlainTime();
console.log(newDT3.toString()); // "2021-07-01T00:00:00"
```

## Đặc tả

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{jsxref("Temporal.PlainDateTime")}}
- {{jsxref("Temporal/PlainDateTime/with", "Temporal.PlainDateTime.prototype.with()")}}
- {{jsxref("Temporal/PlainDateTime/withCalendar", "Temporal.PlainDateTime.prototype.withCalendar()")}}
- {{jsxref("Temporal/PlainDateTime/toPlainTime", "Temporal.PlainDateTime.prototype.toPlainTime()")}}
- {{jsxref("Temporal/PlainDateTime/from", "Temporal.PlainDateTime.from()")}}
