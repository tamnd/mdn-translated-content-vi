---
title: Temporal.ZonedDateTime.prototype.minute
short-title: minute
slug: Web/JavaScript/Reference/Global_Objects/Temporal/ZonedDateTime/minute
page-type: javascript-instance-accessor-property
browser-compat: javascript.builtins.Temporal.ZonedDateTime.minute
sidebar: jsref
---

Thuộc tính accessor **`minute`** của các thực thể {{jsxref("Temporal.ZonedDateTime")}} trả về một số nguyên từ 0 đến 59 biểu thị thành phần phút của thời gian này.

Set accessor của `minute` là `undefined`. Bạn không thể thay đổi thuộc tính này trực tiếp. Hãy sử dụng phương thức {{jsxref("Temporal/ZonedDateTime/with", "with()")}} để tạo một đối tượng `Temporal.ZonedDateTime` mới với giá trị mong muốn.

Để biết thêm thông tin chung và các ví dụ khác, hãy xem {{jsxref("Temporal/PlainTime/minute", "Temporal.PlainTime.prototype.minute")}}.

Với `ZonedDateTime`, `minute` có thể không liên tục do thay đổi offset. Mặc dù điều này hiếm hơn nhiều so với thay đổi `hour` (vì các ca chuyển giờ tiết kiệm ánh sáng ban ngày thường theo đơn vị giờ nguyên), nhưng vẫn có thể xảy ra.

## Ví dụ

### Sử dụng minute

```js
const dt = Temporal.ZonedDateTime.from(
  "2021-07-01T12:34:56.123456789-04:00[America/New_York]",
);
console.log(dt.minute); // 34
```

### Phút không liên tục

Thông thường, `minute` luôn đi từ 0 đến 59 rồi quay lại 0, ngay cả khi qua quá trình chuyển đổi giờ tiết kiệm ánh sáng ban ngày. Có một trường hợp đặc biệt khi DST có offset 30 phút: Đảo Lord Howe ở Úc, nơi chuyển đổi giữa +10:30 và +11:00. Trong trường hợp này, phút có thể không liên tục.

```js
const dt = Temporal.ZonedDateTime.from(
  "2021-10-03T01:59:00+10:30[Australia/Lord_Howe]",
);
console.log(dt.minute); // 59
const dt2 = dt.add({ minutes: 1 });
console.log(dt2.minute); // 30
console.log(dt2.toString()); // 2021-10-03T02:30:00+11:00[Australia/Lord_Howe]
```

Có một trường hợp đặc biệt thứ hai khi phút có thể không liên tục: sự tiêu chuẩn hóa của các múi giờ theo giờ. Vào đầu thế kỷ 20, hầu hết các quốc gia đang sử dụng múi giờ riêng của mình thường không phải là offset nguyên giờ so với UTC. Ví dụ, Paris từng có offset UTC+0:09:21, và được thay đổi thành UTC+0 vào ngày 11 tháng 3 năm 1911.

```js
const dt = Temporal.ZonedDateTime.from(
  "1911-03-10T23:59:00+00:09:21[Europe/Paris]",
);
console.log(dt.minute); // 59
const dt2 = dt.add({ minutes: 1 });
console.log(dt2.minute); // 50
console.log(dt2.toString()); // 1911-03-10T23:50:39+00:00[Europe/Paris]
```

Vì lý do này, bạn nên luôn ưu tiên sử dụng {{jsxref("Temporal/ZonedDateTime/add", "add()")}} và {{jsxref("Temporal/ZonedDateTime/subtract", "subtract()")}} để thao tác ngày giờ, thay vì thay đổi trực tiếp thuộc tính `minute`.

## Đặc tả

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{jsxref("Temporal.ZonedDateTime")}}
- {{jsxref("Temporal/ZonedDateTime/with", "Temporal.ZonedDateTime.prototype.with()")}}
- {{jsxref("Temporal/ZonedDateTime/add", "Temporal.ZonedDateTime.prototype.add()")}}
- {{jsxref("Temporal/ZonedDateTime/subtract", "Temporal.ZonedDateTime.prototype.subtract()")}}
- {{jsxref("Temporal/PlainTime/minute", "Temporal.ZonedDateTime.prototype.minute")}}
