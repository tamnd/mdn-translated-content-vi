---
title: Temporal.ZonedDateTime.prototype.timeZoneId
short-title: timeZoneId
slug: Web/JavaScript/Reference/Global_Objects/Temporal/ZonedDateTime/timeZoneId
page-type: javascript-instance-accessor-property
browser-compat: javascript.builtins.Temporal.ZonedDateTime.timeZoneId
sidebar: jsref
---

Thuộc tính truy cập **`timeZoneId`** của các thực thể {{jsxref("Temporal.ZonedDateTime")}} trả về một chuỗi biểu thị [định danh múi giờ](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Temporal/ZonedDateTime#time_zones_and_offsets) được sử dụng để diễn giải thời điểm nội bộ. Chuỗi này là định danh được đặt tên trong trường hợp ưu tiên (chẳng hạn như `"America/New_York"`), hoặc một offset dưới dạng `"±hh:mm"`. Nếu múi giờ có bí danh, `timeZoneId` là định danh được sử dụng để tạo `ZonedDateTime`, không được chuẩn hóa thành định danh chính.

Set accessor của `timeZoneId` là `undefined`. Bạn không thể thay đổi thuộc tính này trực tiếp. Hãy sử dụng phương thức {{jsxref("Temporal/ZonedDateTime/withTimeZone", "withTimeZone()")}} để tạo một đối tượng `Temporal.ZonedDateTime` mới với giá trị mong muốn.

> [!NOTE]
> Chuỗi này không được thiết kế để hiển thị cho người dùng. Hãy sử dụng {{jsxref("Temporal/ZonedDateTime/toLocaleString", "toLocaleString()")}} với các tùy chọn phù hợp để lấy chuỗi đã được bản địa hóa.

## Ví dụ

### Sử dụng timeZoneId

```js
const dt = Temporal.ZonedDateTime.from(
  "2021-07-01T12:00:00-07:00[America/Los_Angeles]",
);
console.log(dt.timeZoneId); // "America/Los_Angeles"

const dt2 = Temporal.ZonedDateTime.from("2021-07-01T12:00:00-07:00[-07:00]");
console.log(dt2.timeZoneId); // "-07:00"

const dt3 = dt2.withTimeZone("Asia/Shanghai");
console.log(dt3.timeZoneId); // "Asia/Shanghai"
```

`timeZoneId` không bao giờ được chuẩn hóa thành định danh chính; nó giống với định danh được sử dụng để tạo `ZonedDateTime`.

```js
const dt = Temporal.ZonedDateTime.from(
  "2021-07-01T12:00:00+07:00[Asia/Ho_Chi_Minh]",
);
const dt2 = Temporal.ZonedDateTime.from(
  "2021-07-01T12:00:00+07:00[Asia/Saigon]",
);
console.log(dt.timeZoneId); // "Asia/Ho_Chi_Minh"
console.log(dt2.timeZoneId); // "Asia/Saigon"
```

Tuy nhiên, các khác biệt về trình bày sẽ được chuẩn hóa.

```js
const dt = Temporal.ZonedDateTime.from(
  "2021-07-01T12:00:00+07:00[asia/ho_chi_minh]",
);
console.log(dt.timeZoneId); // "Asia/Ho_Chi_Minh"

const dt2 = Temporal.ZonedDateTime.from("2021-07-01T12:00:00+07:00[+07]");
console.log(dt2.timeZoneId); // "+07:00"
```

## Đặc tả

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{jsxref("Temporal.ZonedDateTime")}}
- {{jsxref("Temporal/ZonedDateTime/withTimeZone", "Temporal.ZonedDateTime.prototype.withTimeZone()")}}
- {{jsxref("Temporal/ZonedDateTime/offset", "Temporal.ZonedDateTime.prototype.offset")}}
- {{jsxref("Temporal/ZonedDateTime/offsetNanoseconds", "Temporal.ZonedDateTime.prototype.offsetNanoseconds")}}
