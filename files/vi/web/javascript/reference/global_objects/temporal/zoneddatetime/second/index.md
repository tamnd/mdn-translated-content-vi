---
title: Temporal.ZonedDateTime.prototype.second
short-title: second
slug: Web/JavaScript/Reference/Global_Objects/Temporal/ZonedDateTime/second
page-type: javascript-instance-accessor-property
browser-compat: javascript.builtins.Temporal.ZonedDateTime.second
sidebar: jsref
---

Thuộc tính truy cập **`second`** của các thực thể {{jsxref("Temporal.ZonedDateTime")}} trả về một số nguyên từ 0 đến 59 biểu thị thành phần giây của thời điểm này.

Set accessor của `second` là `undefined`. Bạn không thể thay đổi thuộc tính này trực tiếp. Hãy sử dụng phương thức {{jsxref("Temporal/ZonedDateTime/with", "with()")}} để tạo một đối tượng `Temporal.ZonedDateTime` mới với giá trị mong muốn.

Để biết thêm thông tin chung và các ví dụ khác, xem {{jsxref("Temporal/PlainTime/second", "Temporal.PlainTime.prototype.second")}}.

Đối với `ZonedDateTime`, `second` có thể không liên tục do thay đổi offset. Mặc dù hiếm gặp hơn nhiều so với thay đổi `hour` hoặc `minute` (vì các thay đổi giờ mùa hè thường tính theo giờ nguyên), nhưng vẫn có thể xảy ra.

## Ví dụ

### Sử dụng second

```js
const dt = Temporal.ZonedDateTime.from(
  "2021-07-01T12:34:56.123456789-04:00[America/New_York]",
);
console.log(dt.second); // 56
```

### Giây không liên tục

Thông thường, `second` luôn đi từ 0 đến 59 rồi quay lại 0, ngay cả khi vượt qua quá trình chuyển đổi giờ mùa hè. Có một trường hợp đặc biệt khi giây có thể không liên tục: việc tiêu chuẩn hóa múi giờ theo giờ. Vào đầu thế kỷ 20, hầu hết các quốc gia sử dụng múi giờ của riêng mình thường không phải là số giờ nguyên so với UTC. Ví dụ, Paris trước đây có offset UTC+0:09:21, đã được đổi thành UTC+0 vào ngày 11 tháng 3 năm 1911.

```js
const dt = Temporal.ZonedDateTime.from(
  "1911-03-10T23:59:59+00:09:21[Europe/Paris]",
);
console.log(dt.second); // 59
const dt2 = dt.add({ seconds: 1 });
console.log(dt2.second); // 39
console.log(dt2.toString()); // 1911-03-10T23:50:39+00:00[Europe/Paris]
```

Vì lý do này, bạn nên luôn ưu tiên {{jsxref("Temporal/ZonedDateTime/add", "add()")}} và {{jsxref("Temporal/ZonedDateTime/subtract", "subtract()")}} để thao tác ngày giờ, thay vì thay đổi trực tiếp thuộc tính `second`.

## Đặc tả

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{jsxref("Temporal.ZonedDateTime")}}
- {{jsxref("Temporal/ZonedDateTime/with", "Temporal.ZonedDateTime.prototype.with()")}}
- {{jsxref("Temporal/ZonedDateTime/add", "Temporal.ZonedDateTime.prototype.add()")}}
- {{jsxref("Temporal/ZonedDateTime/subtract", "Temporal.ZonedDateTime.prototype.subtract()")}}
- {{jsxref("Temporal/ZonedDateTime/millisecond", "Temporal.ZonedDateTime.prototype.millisecond")}}
- {{jsxref("Temporal/ZonedDateTime/microsecond", "Temporal.ZonedDateTime.prototype.microsecond")}}
- {{jsxref("Temporal/ZonedDateTime/nanosecond", "Temporal.ZonedDateTime.prototype.nanosecond")}}
- {{jsxref("Temporal/PlainTime/second", "Temporal.PlainTime.prototype.second")}}
