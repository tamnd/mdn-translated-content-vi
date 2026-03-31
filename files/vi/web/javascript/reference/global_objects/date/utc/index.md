---
title: Date.UTC()
short-title: UTC()
slug: Web/JavaScript/Reference/Global_Objects/Date/UTC
page-type: javascript-static-method
browser-compat: javascript.builtins.Date.UTC
sidebar: jsref
---

Phương thức tĩnh **`Date.UTC()`** chấp nhận các tham số đại diện cho các thành phần ngày và giờ tương tự như constructor {{jsxref("Date")}}, nhưng xử lý chúng theo giờ UTC. Nó trả về số mili giây kể từ ngày 1 tháng 1 năm 1970, 00:00:00 UTC.

{{InteractiveExample("JavaScript Demo: Date.UTC()")}}

```js interactive-example
const utcDate1 = new Date(Date.UTC(96, 1, 2, 3, 4, 5));
const utcDate2 = new Date(Date.UTC(0, 0, 0, 0, 0, 0));

console.log(utcDate1.toUTCString());
// Expected output: "Fri, 02 Feb 1996 03:04:05 GMT"

console.log(utcDate2.toUTCString());
// Expected output: "Sun, 31 Dec 1899 00:00:00 GMT"
```

## Cú pháp

```js-nolint
Date.UTC(year)
Date.UTC(year, monthIndex)
Date.UTC(year, monthIndex, day)
Date.UTC(year, monthIndex, day, hours)
Date.UTC(year, monthIndex, day, hours, minutes)
Date.UTC(year, monthIndex, day, hours, minutes, seconds)
Date.UTC(year, monthIndex, day, hours, minutes, seconds, milliseconds)
```

### Tham số

- `year`
  - : Giá trị số nguyên đại diện cho năm. Các giá trị từ `0` đến `99` ánh xạ đến các năm từ `1900` đến `1999`. Tất cả các giá trị khác là năm thực tế. Xem [ví dụ](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Date#interpretation_of_two-digit_years).
- `monthIndex` {{optional_inline}}
  - : Giá trị số nguyên đại diện cho tháng, bắt đầu từ `0` cho tháng Một đến `11` cho tháng Mười Hai. Mặc định là `0`.
- `day` {{optional_inline}}
  - : Giá trị số nguyên đại diện cho ngày trong tháng. Mặc định là `1`.
- `hours` {{optional_inline}}
  - : Giá trị số nguyên từ `0` đến `23` đại diện cho giờ trong ngày. Mặc định là `0`.
- `minutes` {{optional_inline}}
  - : Giá trị số nguyên đại diện cho phút của thời gian. Mặc định là `0`.
- `seconds` {{optional_inline}}
  - : Giá trị số nguyên đại diện cho giây của thời gian. Mặc định là `0`.
- `milliseconds` {{optional_inline}}
  - : Giá trị số nguyên đại diện cho mili giây của thời gian. Mặc định là `0`.

### Giá trị trả về

Một số đại diện cho [timestamp](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Date#the_epoch_timestamps_and_invalid_date) của ngày đã cho. Trả về `NaN` nếu ngày [không hợp lệ](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Date#the_epoch_timestamps_and_invalid_date).

## Mô tả

Các năm từ `0` đến `99` được chuyển đổi thành một năm trong thế kỷ 20 `(1900 + year)`. Ví dụ, `95` được chuyển đổi thành năm `1995`.

Phương thức `UTC()` khác với constructor {{jsxref("Date/Date", "Date()")}} ở ba điểm:

1. `Date.UTC()` sử dụng giờ quốc tế thay vì giờ địa phương.
2. `Date.UTC()` trả về giá trị thời gian dưới dạng số thay vì tạo đối tượng {{jsxref("Date")}}.
3. Khi được truyền một số duy nhất, `Date.UTC()` diễn giải nó như là một năm thay vì một timestamp.

Nếu một tham số nằm ngoài phạm vi dự kiến, phương thức `UTC()` cập nhật các tham số khác để phù hợp với giá trị. Ví dụ, nếu `15` được dùng cho `monthIndex`, năm sẽ tăng thêm 1 `(year + 1)` và `3` sẽ được dùng cho tháng.

Vì `UTC()` là phương thức tĩnh của `Date`, bạn luôn sử dụng nó dưới dạng `Date.UTC()`, thay vì là phương thức của đối tượng `Date` bạn đã tạo.

## Ví dụ

### Sử dụng Date.UTC()

Câu lệnh sau tạo một đối tượng {{jsxref("Date")}} với các đối số được xử lý theo UTC thay vì theo địa phương:

```js
const utcDate = new Date(Date.UTC(2018, 11, 1, 0, 0, 0));
```

### Hành vi của Date.UTC() với một đối số

`Date.UTC()` khi được truyền một đối số từng có hành vi không nhất quán, vì các triển khai chỉ giữ hành vi nhất quán với constructor {{jsxref("Date/Date", "Date()")}}, không diễn giải một đối số duy nhất là số năm. Hiện tại các triển khai được yêu cầu xử lý `monthIndex` bị bỏ qua là `0`, thay vì ép kiểu nó thành `NaN`.

```js
Date.UTC(2017); // 1483228800000
```

## Đặc tả kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{jsxref("Date.parse()")}}
- {{jsxref("Date")}}
