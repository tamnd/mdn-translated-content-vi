---
title: Temporal.PlainDate.prototype.monthCode
short-title: monthCode
slug: Web/JavaScript/Reference/Global_Objects/Temporal/PlainDate/monthCode
page-type: javascript-instance-accessor-property
browser-compat: javascript.builtins.Temporal.PlainDate.monthCode
sidebar: jsref
---

Thuộc tính accessor **`monthCode`** của các instance {{jsxref("Temporal.PlainDate")}} trả về một chuỗi đặc thù theo lịch biểu diễn tháng của ngày này. Nó phụ thuộc vào [lịch](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Temporal#calendars).

## Giá trị

Định dạng cơ bản của `monthCode` là `M` cộng với số tháng hai chữ số. Đối với tháng nhuận, đó là mã tháng trước theo sau là `L` (dù nó theo nghĩa khái niệm là phái sinh của tháng tiếp theo; ví dụ, trong lịch Hebrew, Adar I có mã `M05L` nhưng Adar II có mã `M06`).

Tất cả các lịch đều có ít nhất 12 tháng, với mã từ `"M01"` đến `"M12"`.

Tất cả [các lịch được chỉ định](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Intl/supportedValuesOf#supported_calendar_types) có mã tháng được định nghĩa đầy đủ theo đặc tả. Hầu hết không có quy tắc tháng khác biệt so với `iso8601`. Các lịch `coptic`, `ethioaa`, và `ethiopic` có thêm tháng `M13`. Các lịch `chinese` và `dangi` có 12 tháng nhuận bổ sung có thể có, với mã từ `"M01L"` đến `"M12L"`. Lịch `hebrew` có một tháng nhuận, `"M05L"` (Adar I).

> [!NOTE]
> Đừng giả định rằng `monthCode` là một chuỗi thân thiện với người dùng; hãy sử dụng `toLocaleString()` để định dạng ngày thay thế. Nói chung, đừng lưu trữ tên các tháng trong mảng hoặc đối tượng. Dù `monthCode` thường ánh xạ đến tên tháng trong một lịch, chúng tôi khuyến nghị luôn tính tên tháng bằng cách ví dụ `date.toLocaleString("en-US", { calendar: date.calendarId, month: "long" })`.

Set accessor của `monthCode` là `undefined`. Bạn không thể thay đổi thuộc tính này trực tiếp. Sử dụng phương thức {{jsxref("Temporal/PlainDate/with", "with()")}} để tạo một đối tượng `Temporal.PlainDate` mới với giá trị mới mong muốn.

Khi đặt ngày sang một năm khác, `monthCode` vẫn giữ nguyên, nhưng `month` có thể thay đổi nếu năm đích có cấu trúc tháng nhuận khác. Nếu `monthCode` hiện tại không tồn tại trong năm đích và phương thức không được cấu hình để từ chối, thì đối với các lịch `chinese` và `dangi`, tháng trước được sử dụng thay thế (ví dụ, từ `"M03L"` thành `"M03"`, tức từ 闰三月 thành 三月). Đối với `hebrew`, tháng _tiếp theo_ được sử dụng thay thế (từ `"M05L"` thành `"M06"`, tức từ Adar I thành Adar II).

## Ví dụ

### Sử dụng monthCode

```js
const date = Temporal.PlainDate.from("2021-07-01"); // Lịch ISO 8601
console.log(date.monthCode); // "M07"
console.log(date.month); // 7

const date2 = Temporal.PlainDate.from("2021-05-01[u-ca=chinese]");
console.log(date2.monthCode); // "M03"
console.log(date2.month); // 3; đây là ngày 20 tháng 3 trong lịch Trung Quốc

const date3 = Temporal.PlainDate.from("2023-05-01[u-ca=chinese]");
console.log(date3.monthCode); // "M03"
console.log(date3.month); // 4, mặc dù cũng là tháng Ba (M03)!

const date4 = Temporal.PlainDate.from("2023-04-01[u-ca=chinese]");
console.log(date4.monthCode); // "M02L"
console.log(date4.month); // 3, tháng này là tháng nhuận, tức tháng Hai nhân đôi
```

### Thay đổi monthCode

```js
const date = Temporal.PlainDate.from("2021-07-01");
const newDate = date.with({ month: 2 });
console.log(newDate.toString()); // 2021-02-01
```

Bạn cũng có thể sử dụng {{jsxref("Temporal/PlainDate/add", "add()")}} hoặc {{jsxref("Temporal/PlainDate/subtract", "subtract()")}} để di chuyển một số tháng nhất định từ ngày hiện tại.

```js
const date = Temporal.PlainDate.from("2021-07-01");
const newDate = date.add({ months: 3 });
console.log(newDate.toString()); // 2021-10-01
```

Theo mặc định, `with()` ràng buộc ngày trong phạm vi giá trị hợp lệ. Cả hai cách sau đây đều đặt tháng thành tháng cuối cùng của năm:

```js
const date = Temporal.PlainDate.from("2021-07-01");
const lastMonth = date.with({ month: date.monthsInYear }); // 2021-12-01
const lastMonth2 = date.with({ month: Number.MAX_VALUE }); // 2021-12-01
```

### Định dạng tên tháng

Đừng làm điều này:

<!-- prettier-ignore -->
```js example-bad
const names = [
  "January", "February", "March", "April", "May", "June",
  "July", "August", "September", "October", "November", "December",
];

const date = Temporal.PlainDate.from("2021-07-01");
console.log(names[date.month - 1]); // July
```

Cũng đừng làm điều này:

<!-- prettier-ignore -->
```js example-bad
const names = {
  "M01": "January", "M02": "February", "M03": "March", "M04": "April",
  "M05": "May", "M06": "June", "M07": "July", "M08": "August",
  "M09": "September", "M10": "October", "M11": "November", "M12": "December",
};

const date = Temporal.PlainDate.from("2021-07-01");
console.log(names[date.monthCode]); // July
```

Thay vào đó, hãy luôn làm như này, thân thiện với người dùng hơn và ít lỗi hơn, và dễ dàng áp dụng cho các lịch khác:

```js
const date = Temporal.PlainDate.from("2021-07-01");
console.log(
  date.toLocaleString("en-US", { calendar: date.calendarId, month: "long" }),
); // July
```

## Đặc tả

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{jsxref("Temporal.PlainDate")}}
- {{jsxref("Temporal/PlainDate/with", "Temporal.PlainDate.prototype.with()")}}
- {{jsxref("Temporal/PlainDate/add", "Temporal.PlainDate.prototype.add()")}}
- {{jsxref("Temporal/PlainDate/subtract", "Temporal.PlainDate.prototype.subtract()")}}
- {{jsxref("Temporal/PlainDate/year", "Temporal.PlainDate.prototype.year")}}
- {{jsxref("Temporal/PlainDate/month", "Temporal.PlainDate.prototype.month")}}
- {{jsxref("Temporal/PlainDate/daysInMonth", "Temporal.PlainDate.prototype.daysInMonth")}}
- {{jsxref("Temporal/PlainDate/monthsInYear", "Temporal.PlainDate.prototype.monthsInYear")}}
