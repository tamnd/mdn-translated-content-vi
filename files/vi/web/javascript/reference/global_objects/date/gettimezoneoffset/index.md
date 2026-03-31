---
title: Date.prototype.getTimezoneOffset()
short-title: getTimezoneOffset()
slug: Web/JavaScript/Reference/Global_Objects/Date/getTimezoneOffset
page-type: javascript-instance-method
browser-compat: javascript.builtins.Date.getTimezoneOffset
sidebar: jsref
---

Phương thức **`getTimezoneOffset()`** của các đối tượng {{jsxref("Date")}} trả về sự chênh lệch, tính bằng phút, giữa ngày này được đánh giá theo múi giờ UTC và ngày đó được đánh giá theo múi giờ địa phương.

{{InteractiveExample("JavaScript Demo: Date.prototype.getTimezoneOffset()")}}

```js interactive-example
const date1 = new Date("August 19, 1975 23:15:30 GMT+07:00");
const date2 = new Date("August 19, 1975 23:15:30 GMT-02:00");

console.log(date1.getTimezoneOffset());
// Expected output: your local timezone offset in minutes
// (e.g., -120). NOT the timezone offset of the date object.

console.log(date1.getTimezoneOffset() === date2.getTimezoneOffset());
// Expected output: true
```

## Cú pháp

```js-nolint
getTimezoneOffset()
```

### Tham số

Không có.

### Giá trị trả về

Một số đại diện cho sự chênh lệch, tính bằng phút, giữa ngày được đánh giá theo múi giờ UTC và được đánh giá theo múi giờ địa phương. Thuật toán múi giờ địa phương thực tế phụ thuộc vào triển khai, và giá trị trả về được phép bằng không trong các runtime không có dữ liệu phù hợp. Trả về `NaN` nếu ngày [không hợp lệ](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Date#the_epoch_timestamps_and_invalid_date).

## Mô tả

`date.getTimezoneOffset()` trả về sự chênh lệch, tính bằng phút, giữa `date` được đánh giá theo múi giờ UTC và được đánh giá theo múi giờ địa phương — tức là múi giờ của hệ thống máy chủ mà trình duyệt đang được sử dụng (nếu mã được chạy từ Web trong trình duyệt), hoặc ngược lại là hệ thống máy chủ của bất kỳ runtime JavaScript nào (ví dụ, môi trường Node.js) mà mã đang được thực thi.

### Giá trị âm và giá trị dương

Số phút được trả về bởi `getTimezoneOffset()` là dương nếu múi giờ địa phương đứng sau UTC, và âm nếu múi giờ địa phương đứng trước UTC. Ví dụ, đối với UTC+10, `-600` sẽ được trả về.

| Múi giờ hiện tại | Giá trị trả về |
| ---------------- | -------------- |
| UTC-8            | 480            |
| UTC              | 0              |
| UTC+3            | -180           |

### Kết quả khác nhau trong các vùng có Giờ tiết kiệm ánh sáng ban ngày (DST)

Trong một vùng thay đổi hàng năm vào và ra khỏi Giờ tiết kiệm ánh sáng ban ngày (DST), khi `date` thay đổi, số phút được trả về khi gọi `getTimezoneOffset()` có thể không đồng nhất.

> [!NOTE]
> Hành vi của `getTimezoneOffset()` sẽ không bao giờ khác nhau dựa trên thời điểm mã được chạy — hành vi của nó luôn nhất quán khi chạy trong cùng một vùng. Chỉ có giá trị của `date` ảnh hưởng đến kết quả.

> [!NOTE]
> [Nhiều quốc gia đã thử nghiệm không thay đổi giờ hai lần một năm](https://en.wikipedia.org/wiki/Daylight_saving_time_by_country#Past_observance) và điều này có nghĩa là DST đã tiếp tục trong mùa đông. Ví dụ, ở Anh, DST kéo dài từ 2:00 SA ngày 18 tháng 2 năm 1968 đến 3:00 SA ngày 31 tháng 10 năm 1971, vì vậy trong mùa đông đồng hồ không được vặn lại.

Trong hầu hết các triển khai, [cơ sở dữ liệu múi giờ IANA](https://en.wikipedia.org/wiki/Daylight_saving_time#IANA_time_zone_database) (tzdata) được sử dụng để xác định chính xác offset của múi giờ địa phương tại thời điểm của `date`. Tuy nhiên, nếu thông tin đó không có sẵn, một triển khai có thể trả về không.

## Ví dụ

### Sử dụng getTimezoneOffset()

```js
// Create a Date instance for the current time
const currentLocalDate = new Date();
// Create a Date instance for 03:24 GMT-0200 on May 1st in 2016
const laborDay2016at0324GMTminus2 = new Date("2016-05-01T03:24:00-02:00");
currentLocalDate.getTimezoneOffset() ===
  laborDay2016at0324GMTminus2.getTimezoneOffset();
// true, always, in any timezone that doesn't annually shift in and out of DST
// false, sometimes, in any timezone that annually shifts in and out of DST
```

### getTimezoneOffset() và DST

Trong các vùng sử dụng DST, giá trị trả về có thể thay đổi dựa trên thời điểm trong năm mà `date` thuộc về. Dưới đây là đầu ra trong một runtime ở New York, nơi múi giờ là UTC-05:00.

```js
const nyOffsetSummer = new Date("2022-02-01").getTimezoneOffset(); // 300
const nyOffsetWinter = new Date("2022-08-01").getTimezoneOffset(); // 240
```

### getTimezoneOffset() và dữ liệu lịch sử

Do lý do lịch sử, múi giờ của một vùng có thể thay đổi liên tục, ngay cả khi bỏ qua DST. Ví dụ, dưới đây là đầu ra trong một runtime ở Thượng Hải, nơi múi giờ là UTC+08:00.

```js
const shModernOffset = new Date("2022-01-27").getTimezoneOffset(); // -480
const shHistoricalOffset = new Date("1943-01-27").getTimezoneOffset(); // -540
```

Điều này là do trong [Chiến tranh Trung-Nhật](https://en.wikipedia.org/wiki/Second_Sino-Japanese_War) khi Thượng Hải nằm dưới sự kiểm soát của Nhật Bản, múi giờ đã được thay đổi thành UTC+09:00 để phù hợp với Nhật Bản (thực chất là "DST quanh năm"), và điều này đã được ghi lại trong cơ sở dữ liệu IANA.

## Thông số kỹ thuật

{{Specifications}}

## Khả năng tương thích với trình duyệt

{{Compat}}

## Xem thêm

- {{jsxref("Date")}}
