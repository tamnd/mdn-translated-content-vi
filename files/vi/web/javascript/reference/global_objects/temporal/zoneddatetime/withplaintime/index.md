---
title: Temporal.ZonedDateTime.prototype.withPlainTime()
short-title: withPlainTime()
slug: Web/JavaScript/Reference/Global_Objects/Temporal/ZonedDateTime/withPlainTime
page-type: javascript-instance-method
browser-compat: javascript.builtins.Temporal.ZonedDateTime.withPlainTime
sidebar: jsref
---

Phương thức **`withPlainTime()`** của các thực thể {{jsxref("Temporal.ZonedDateTime")}} trả về một đối tượng `Temporal.ZonedDateTime` mới biểu thị ngày-giờ này với phần thời gian được thay thế hoàn toàn bằng thời gian mới (dưới dạng có thể chuyển đổi bởi {{jsxref("Temporal/PlainTime/from", "Temporal.PlainTime.from()")}})

Phương thức này sẽ thay thế tất cả các thuộc tính thời gian, mặc định là `0` khi các thuộc tính không được chỉ định. Nếu bạn chỉ muốn thay thế một số thuộc tính thời gian, hãy sử dụng phương thức {{jsxref("Temporal/ZonedDateTime/with", "with()")}} thay thế.

## Cú pháp

```js-nolint
withPlainTime()
withPlainTime(plainTime)
```

### Tham số

- `plainTime` {{optional_inline}}
  - : Một chuỗi, một đối tượng, hoặc một thực thể {{jsxref("Temporal.PlainTime")}} biểu thị thời gian mới. Nó được chuyển đổi thành đối tượng `Temporal.PlainTime` bằng cùng thuật toán như {{jsxref("Temporal/PlainTime/from", "Temporal.PlainTime.from()")}}. Nếu không được chỉ định, phần thời gian được đặt thành [đầu ngày](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Temporal/ZonedDateTime/startOfDay) (thường là `00:00:00` trừ khi nó không tồn tại do chuyển đổi offset). [Disambiguation](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Temporal/ZonedDateTime#time_zones_and_offsets) luôn xảy ra ở chế độ `"compatible"`; nếu bạn muốn sử dụng chế độ khác, hãy sử dụng phương thức {{jsxref("Temporal/ZonedDateTime/with", "with()")}} thay thế.

### Giá trị trả về

Một đối tượng `Temporal.ZonedDateTime` mới, với phần ngày và múi giờ được sao chép từ ngày-giờ ban đầu và phần thời gian được thay thế bằng thời gian mới.

## Ví dụ

### Sử dụng withPlainTime()

```js
const zdt = Temporal.ZonedDateTime.from(
  "2021-07-01T12:34:56[America/New_York]",
);

// You can pass a string
const newZDT = zdt.withPlainTime("13:45:00");
console.log(newZDT.toString()); // "2021-07-01T13:45:00-04:00[America/New_York]"

// You can only specify some time properties, and the rest default to 0;
// for the with() method, they would be copied from the original date-time
const newZDT2 = zdt.withPlainTime({ hour: 13 });
console.log(newZDT2.toString()); // "2021-07-01T13:00:00-04:00[America/New_York]"

// You can pass nothing to set the time to midnight
const newZDT3 = zdt.withPlainTime();
console.log(newZDT3.toString()); // "2021-07-01T00:00:00-04:00[America/New_York]"

// But, if midnight doesn't exist, it may be a different time
const zdt2 = Temporal.ZonedDateTime.from(
  "2015-10-18T12:00-02:00[America/Sao_Paulo]",
);
console.log(zdt2.withPlainTime().toString()); // "2015-10-18T01:00:00-02:00[America/Sao_Paulo]"
```

## Đặc tả

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{jsxref("Temporal.ZonedDateTime")}}
- {{jsxref("Temporal/ZonedDateTime/with", "Temporal.ZonedDateTime.prototype.with()")}}
- {{jsxref("Temporal/ZonedDateTime/withCalendar", "Temporal.ZonedDateTime.prototype.withCalendar()")}}
- {{jsxref("Temporal/ZonedDateTime/withTimeZone", "Temporal.ZonedDateTime.prototype.withTimeZone()")}}
- {{jsxref("Temporal/ZonedDateTime/toPlainTime", "Temporal.ZonedDateTime.prototype.toPlainTime()")}}
- {{jsxref("Temporal/ZonedDateTime/from", "Temporal.ZonedDateTime.from()")}}
