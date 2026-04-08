---
title: Intl.DateTimeFormat.prototype.formatToParts()
short-title: formatToParts()
slug: Web/JavaScript/Reference/Global_Objects/Intl/DateTimeFormat/formatToParts
page-type: javascript-instance-method
browser-compat: javascript.builtins.Intl.DateTimeFormat.formatToParts
sidebar: jsref
---

Phương thức **`formatToParts()`** của các instance {{jsxref("Intl.DateTimeFormat")}} trả về một mảng các đối tượng biểu diễn từng phần của chuỗi được định dạng mà {{jsxref("Intl/DatetimeFormat/format", "format()")}} sẽ trả về. Nó hữu ích để xây dựng các chuỗi tùy chỉnh từ các token đặc thù theo ngôn ngữ.

{{InteractiveExample("JavaScript Demo: Intl.DateTimeFormat.prototype.formatToParts()", "taller")}}

```js interactive-example
const date = new Date(2012, 5);
const options = {
  weekday: "long",
  year: "numeric",
  month: "long",
  day: "numeric",
};
const dateTimeFormat = new Intl.DateTimeFormat("en-US", options);

const parts = dateTimeFormat.formatToParts(date);
const partValues = parts.map((p) => p.value);

console.log(partValues);
// Expected output: "["Friday", ", ", "June", " ", "1", ", ", "2012"]"
```

## Cú pháp

```js-nolint
formatToParts(date)
```

### Tham số

- `date` {{optional_inline}}
  - : Ngày cần định dạng. Có thể là đối tượng {{jsxref("Date")}} hoặc {{jsxref("Temporal.PlainDateTime")}}. Ngoài ra còn có thể là đối tượng {{jsxref("Temporal.PlainTime")}}, {{jsxref("Temporal.PlainDate")}}, {{jsxref("Temporal.PlainYearMonth")}}, hoặc {{jsxref("Temporal.PlainMonthDay")}} nếu đối tượng `DateTimeFormat` được cấu hình để in ít nhất một phần liên quan của ngày.

    > [!NOTE]
    > Một đối tượng {{jsxref("Temporal.ZonedDateTime")}} sẽ luôn ném ra `TypeError`; hãy sử dụng {{jsxref("Temporal/ZonedDateTime/toLocaleString", "Temporal.ZonedDateTime.prototype.toLocaleString()")}} hoặc chuyển đổi nó thành đối tượng {{jsxref("Temporal.PlainDateTime")}}.

    Bỏ qua tham số này dẫn đến việc định dạng ngày hiện tại (do {{jsxref("Date.now()")}} trả về), điều này có thể gây nhầm lẫn, vì vậy nên luôn luôn truyền một ngày một cách rõ ràng.

### Giá trị trả về

Một {{jsxref("Array")}} các đối tượng chứa ngày được định dạng theo từng phần. Mỗi đối tượng có hai thuộc tính, `type` và `value`, mỗi thuộc tính chứa một chuỗi. Việc nối chuỗi của `value`, theo thứ tự được cung cấp, sẽ cho ra cùng một chuỗi như {{jsxref("Intl/DateTimeFormat/format", "format()")}}. `type` có thể là một trong các [thành phần ngày giờ](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Intl/DateTimeFormat/DateTimeFormat#date-time_component_options):

- `weekday`
  - : Ví dụ `"M"`, `"Monday"`, hay `"Montag"`.
- `era`
  - : Ví dụ `"BC"` hay `"AD"`.
- `year`
  - : Ví dụ `"2012"` hay `"96"`.
- `month`
  - : Ví dụ `"12"` hay `"January"`.
- `day`
  - : Ví dụ `"17"`.
- `dayPeriod`
  - : Ví dụ `"AM"`, `"PM"`, `"in the morning"`, hay `"noon"`.
- `hour`
  - : Ví dụ `"3"` hay `"03"`.
- `minute`
  - : Ví dụ `"00"`.
- `second`
  - : Ví dụ `"07"` hay `"42"`.
- `fractionalSecond`
  - : Ví dụ `"0"`, `"00"`, hay `"000"`.
- `timeZoneName`
  - : Ví dụ `"UTC"`, `"CET"`, hay `"Central European Time"`.

`type` cũng có thể là một trong các giá trị sau:

- `literal`
  - : Bất kỳ chuỗi nào là một phần của mẫu định dạng và không bị ảnh hưởng bởi `date`; ví dụ `"/"`, `", "`, `"o'clock"`, `"de"`, `" "`, v.v.
- `relatedYear`
  - : Năm Gregorian gồm 4 chữ số, trong trường hợp biểu diễn của lịch sẽ là `yearName` thay vì một năm; ví dụ `"2019"`. Xem [năm được đặt tên](#named_years) để biết thêm chi tiết.
- `yearName`
  - : Tên được đặt cho năm, thường trong các lịch không có khái niệm về năm liên tục; ví dụ `"geng-zi"`.
- `unknown`
  - : Dành cho bất kỳ token nào không được nhận dạng là bất kỳ giá trị nào ở trên; hiếm khi gặp.

## Ví dụ

### Sử dụng formatToParts()

Phương thức `format()` xuất ra các chuỗi được bản địa hóa và mờ đục, không thể thao tác trực tiếp:

```js
const date = Date.UTC(2012, 11, 17, 3, 0, 42);

const formatter = new Intl.DateTimeFormat("en-us", {
  weekday: "long",
  year: "numeric",
  month: "numeric",
  day: "numeric",
  hour: "numeric",
  minute: "numeric",
  second: "numeric",
  fractionalSecondDigits: 3,
  hour12: true,
  timeZone: "UTC",
});

formatter.format(date);
// "Monday, 12/17/2012, 3:00:42.000 AM"
```

Tuy nhiên, trong nhiều giao diện người dùng bạn có thể muốn tùy chỉnh định dạng của chuỗi này, hoặc xen kẽ nó với các văn bản khác. Phương thức `formatToParts()` tạo ra cùng thông tin theo từng phần:

```js
formatter.formatToParts(date);

// return value:
[
  { type: "weekday", value: "Monday" },
  { type: "literal", value: ", " },
  { type: "month", value: "12" },
  { type: "literal", value: "/" },
  { type: "day", value: "17" },
  { type: "literal", value: "/" },
  { type: "year", value: "2012" },
  { type: "literal", value: ", " },
  { type: "hour", value: "3" },
  { type: "literal", value: ":" },
  { type: "minute", value: "00" },
  { type: "literal", value: ":" },
  { type: "second", value: "42" },
  { type: "fractionalSecond", value: "000" },
  { type: "literal", value: " " },
  { type: "dayPeriod", value: "AM" },
];
```

Bây giờ thông tin có sẵn riêng lẻ và nó có thể được định dạng và nối lại theo cách tùy chỉnh. Ví dụ sử dụng {{jsxref("Array.prototype.map()")}}, [arrow functions](/en-US/docs/Web/JavaScript/Reference/Functions/Arrow_functions), một [câu lệnh switch](/en-US/docs/Web/JavaScript/Reference/Statements/switch), [template literals](/en-US/docs/Web/JavaScript/Reference/Template_literals), và {{jsxref("Array.prototype.join()")}}, để chèn thêm đánh dấu cho các thành phần nhất định.

```js
const dateString = formatter
  .formatToParts(date)
  .map(({ type, value }) => {
    switch (type) {
      case "dayPeriod":
        return `<em>${value}</em>`;
      default:
        return value;
    }
  })
  .join("");

console.log(dateString);
// "Monday, 12/17/2012, 3:00:42.000 <em>AM</em>"
```

### Năm được đặt tên

Một số lịch sử dụng năm được đặt tên; ví dụ, lịch Trung Quốc và Tây Tạng sử dụng [chu kỳ lục thập hoa giáp](https://en.wikipedia.org/wiki/Sexagenary_cycle) gồm 60 năm được đặt tên. Các lịch này không có cách phổ quát để đánh số từng năm một cách rõ ràng, vì vậy các năm được làm rõ bằng mối quan hệ với các năm tương ứng trên lịch Gregorian. Trong trường hợp này, khi `DateTimeFormat` được cấu hình để xuất thành phần năm, một token cho `relatedYear` được xuất thay vì `year`.

```js
const df = new Intl.DateTimeFormat("zh-u-ca-chinese");
df.formatToParts(Date.UTC(2012, 11, 17, 3, 0, 42));

// return value:
[
  { type: "relatedYear", value: "2012" },
  { type: "literal", value: "年" },
  { type: "month", value: "十一月" },
  { type: "day", value: "4" },
];
```

Đôi khi, sự kết hợp của các tùy chọn thành phần ngày giờ ánh xạ đến một định dạng cũng bao gồm `yearName`. Không có tùy chọn riêng biệt để kiểm soát liệu `yearName` có được hiển thị hay không. Ví dụ, các tùy chọn bên dưới đặt `month` thành `"long"` và dẫn đến một token `yearName`, mặc dù `year` vẫn là `"numeric"`:

```js
const opts = { year: "numeric", month: "long", day: "numeric" };
const df = new Intl.DateTimeFormat("zh-u-ca-chinese", opts);
df.formatToParts(Date.UTC(2012, 11, 17, 3, 0, 42));

// return value:
[
  { type: "relatedYear", value: "2012" },
  { type: "yearName", value: "壬辰" },
  { type: "literal", value: "年" },
  { type: "month", value: "十一月" },
  { type: "day", value: "4" },
];
```

Vì `format()` chỉ nối tất cả các chuỗi `value` lại với nhau, bạn sẽ thấy năm Gregorian và tên năm cùng nhau trong đầu ra trong trường hợp này.

## Đặc tả kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{jsxref("Intl.DateTimeFormat")}}
- {{jsxref("Intl/DateTimeFormat/format", "Intl.DateTimeFormat.prototype.format()")}}
