---
title: Temporal.PlainYearMonth
slug: Web/JavaScript/Reference/Global_Objects/Temporal/PlainYearMonth
page-type: javascript-class
browser-compat: javascript.builtins.Temporal.PlainYearMonth
sidebar: jsref
---

Đối tượng **`Temporal.PlainYearMonth`** đại diện cho năm và tháng của một ngày trong lịch, không có ngày cụ thể hay múi giờ; ví dụ, một sự kiện trong lịch xảy ra trong suốt cả tháng. Về cơ bản, nó được biểu diễn dưới dạng một ngày theo lịch ISO 8601, với các trường năm, tháng và ngày, cùng với một hệ thống lịch được liên kết. Ngày được dùng để phân biệt year-month trong các hệ thống lịch không phải ISO.

## Mô tả

Một `PlainYearMonth` về cơ bản là phần year-month của một đối tượng {{jsxref("Temporal.PlainDate")}}, không có ngày.

### Định dạng RFC 9557

Các đối tượng `PlainYearMonth` có thể được tuần tự hóa và phân tích cú pháp bằng định dạng [RFC 9557](https://datatracker.ietf.org/doc/html/rfc9557), một phần mở rộng của định dạng [ISO 8601 / RFC 3339](https://datatracker.ietf.org/doc/html/rfc3339). Chuỗi có dạng sau (khoảng trắng chỉ để dễ đọc và không được có trong chuỗi thực tế):

```plain
YYYY-MM-DD [u-ca=calendar_id]
```

- `YYYY`
  - : Một số bốn chữ số, hoặc một số sáu chữ số với dấu `+` hoặc `-`.
- `MM`
  - : Một số hai chữ số từ `01` đến `12`.
- `DD` {{optional_inline}}
  - : Một số hai chữ số từ `01` đến `31`. Bắt buộc đối với các lịch không phải ISO, và tùy chọn trong trường hợp còn lại. Nếu bỏ qua, chuỗi trông như `YYYY-MM` hoặc `YYYYMM`. Lưu ý rằng ngày tham chiếu thực sự được lưu trữ có thể khác với ngày bạn cung cấp, nhưng year-month được biểu diễn vẫn giống nhau. Xem {{jsxref("Temporal/PlainYearMonth/from", "Temporal.PlainYearMonth.from()")}} để biết thêm thông tin. Các thành phần `YYYY`, `MM` và `DD` có thể được ngăn cách bằng `-` hoặc không có gì.
- `[u-ca=calendar_id]` {{optional_inline}}
  - : Thay `calendar_id` bằng lịch muốn sử dụng. Xem [`Intl.supportedValuesOf()`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Intl/supportedValuesOf#supported_calendar_types) để biết danh sách các loại lịch thường được hỗ trợ. Mặc định là `[u-ca=iso8601]`. Có thể có _cờ bắt buộc_ bằng cách thêm tiền tố `!` vào trước khóa: ví dụ, `[!u-ca=iso8601]`. Cờ này thường thông báo cho các hệ thống khác rằng nó không thể bị bỏ qua nếu họ không hỗ trợ nó. Trình phân tích cú pháp `Temporal` sẽ ném lỗi nếu các chú thích chứa hai hoặc nhiều chú thích lịch và một trong số đó là bắt buộc. Lưu ý rằng `YYYY-MM-DD` luôn được hiểu là ngày theo lịch ISO 8601 và sau đó được chuyển đổi sang lịch được chỉ định.

Khi nhập, bạn có thể tùy chọn bao gồm thời gian, độ lệch và mã định danh múi giờ, theo cùng định dạng như [`PlainDateTime`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Temporal/PlainDateTime#rfc_9557_format), nhưng chúng sẽ bị bỏ qua. Các chú thích khác theo định dạng `[key=value]` cũng bị bỏ qua, và chúng không được có cờ bắt buộc.

Khi tuần tự hóa, bạn có thể cấu hình xem có hiển thị ID lịch hay không, và có thêm cờ bắt buộc cho nó hay không.

## Constructor

- {{jsxref("Temporal/PlainYearMonth/PlainYearMonth", "Temporal.PlainYearMonth()")}} {{experimental_inline}}
  - : Tạo một đối tượng `Temporal.PlainYearMonth` mới bằng cách cung cấp trực tiếp dữ liệu cơ bản.

## Phương thức tĩnh

- {{jsxref("Temporal/PlainYearMonth/compare", "Temporal.PlainYearMonth.compare()")}}
  - : Trả về một số (-1, 0 hoặc 1) cho biết year-month đầu tiên đến trước, bằng hoặc sau year-month thứ hai. Tương đương với việc so sánh các ngày ISO 8601 cơ bản của chúng. Hai year-month từ các lịch khác nhau có thể được coi là bằng nhau nếu chúng bắt đầu vào cùng một ngày ISO.
- {{jsxref("Temporal/PlainYearMonth/from", "Temporal.PlainYearMonth.from()")}}
  - : Tạo một đối tượng `Temporal.PlainYearMonth` mới từ một đối tượng `Temporal.PlainYearMonth` khác, một đối tượng có thuộc tính year và month, hoặc một chuỗi [RFC 9557](#rfc_9557_format).

## Thuộc tính thực thể

Những thuộc tính này được định nghĩa trên `Temporal.PlainYearMonth.prototype` và được chia sẻ bởi tất cả các thực thể `Temporal.PlainYearMonth`.

- {{jsxref("Temporal/PlainYearMonth/calendarId", "Temporal.PlainYearMonth.prototype.calendarId")}}
  - : Trả về một chuỗi đại diện cho [lịch](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Temporal#calendars) được dùng để giải thích ngày ISO 8601 nội bộ.
- {{jsxref("Object/constructor", "Temporal.PlainYearMonth.prototype.constructor")}}
  - : Hàm constructor đã tạo ra đối tượng thực thể. Đối với các thực thể `Temporal.PlainYearMonth`, giá trị ban đầu là constructor {{jsxref("Temporal/PlainYearMonth/PlainYearMonth", "Temporal.PlainYearMonth()")}}.
- {{jsxref("Temporal/PlainYearMonth/daysInMonth", "Temporal.PlainYearMonth.prototype.daysInMonth")}}
  - : Trả về một số nguyên dương đại diện cho số ngày trong tháng của ngày này. Phụ thuộc vào [lịch](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Temporal#calendars).
- {{jsxref("Temporal/PlainYearMonth/daysInYear", "Temporal.PlainYearMonth.prototype.daysInYear")}}
  - : Trả về một số nguyên dương đại diện cho số ngày trong năm của ngày này. Phụ thuộc vào [lịch](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Temporal#calendars). Đối với lịch ISO 8601, đây là 365, hoặc 366 trong năm nhuận.
- {{jsxref("Temporal/PlainYearMonth/era", "Temporal.PlainYearMonth.prototype.era")}}
  - : Trả về một chuỗi viết thường đặc thù của lịch đại diện cho kỷ nguyên của year-month này, hoặc `undefined` nếu lịch không sử dụng kỷ nguyên (ví dụ: ISO 8601). `era` và `eraYear` cùng nhau xác định duy nhất một năm trong một lịch, giống như cách `year` làm. Phụ thuộc vào [lịch](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Temporal#calendars). Đối với Gregory, đây là `"ce"` hoặc `"bce"`.
- {{jsxref("Temporal/PlainYearMonth/eraYear", "Temporal.PlainYearMonth.prototype.eraYear")}}
  - : Trả về một số nguyên không âm đại diện cho năm của year-month này trong kỷ nguyên, hoặc `undefined` nếu lịch không sử dụng kỷ nguyên (ví dụ: ISO 8601). Chỉ số năm thường bắt đầu từ 1 (phổ biến hơn) hoặc 0, và các năm trong một kỷ nguyên có thể giảm theo thời gian (ví dụ: Gregory TCN). `era` và `eraYear` cùng nhau xác định duy nhất một năm trong một lịch, giống như cách `year` làm. Phụ thuộc vào [lịch](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Temporal#calendars).
- {{jsxref("Temporal/PlainYearMonth/inLeapYear", "Temporal.PlainYearMonth.prototype.inLeapYear")}}
  - : Trả về một boolean cho biết year-month này có thuộc năm nhuận hay không. Năm nhuận là năm có nhiều ngày hơn (do ngày nhuận hoặc tháng nhuận) so với năm thường. Phụ thuộc vào [lịch](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Temporal#calendars).
- {{jsxref("Temporal/PlainYearMonth/month", "Temporal.PlainYearMonth.prototype.month")}}
  - : Trả về một số nguyên dương đại diện cho chỉ số tháng bắt đầu từ 1 trong năm của year-month này. Tháng đầu tiên của năm này là `1`, và tháng cuối cùng là {{jsxref("Temporal/PlainYearMonth/monthsInYear", "monthsInYear")}}. Phụ thuộc vào [lịch](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Temporal#calendars). Lưu ý rằng không giống như {{jsxref("Date.prototype.getMonth()")}}, chỉ số bắt đầu từ 1. Nếu lịch có tháng nhuận, thì tháng có cùng {{jsxref("Temporal/PlainDate/monthCode", "monthCode")}} có thể có các chỉ số `month` khác nhau cho các năm khác nhau.
- {{jsxref("Temporal/PlainYearMonth/monthCode", "Temporal.PlainYearMonth.prototype.monthCode")}}
  - : Trả về một chuỗi đặc thù của lịch đại diện cho tháng của year-month này. Phụ thuộc vào [lịch](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Temporal#calendars). Thường là `M` cộng với số tháng hai chữ số. Đối với tháng nhuận, đây là mã của tháng trước theo sau là `L`. Nếu tháng nhuận là tháng đầu tiên của năm, mã là `M00L`.
- {{jsxref("Temporal/PlainYearMonth/monthsInYear", "Temporal.PlainYearMonth.prototype.monthsInYear")}}
  - : Trả về một số nguyên dương đại diện cho số tháng trong năm của ngày này. Phụ thuộc vào [lịch](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Temporal#calendars). Đối với lịch ISO 8601, luôn là 12, nhưng trong các hệ thống lịch khác có thể khác.
- {{jsxref("Temporal/PlainYearMonth/year", "Temporal.PlainYearMonth.prototype.year")}}
  - : Trả về một số nguyên đại diện cho số năm của year-month này tương đối so với năm bắt đầu của kỷ nguyên đặc thù theo lịch. Phụ thuộc vào [lịch](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Temporal#calendars). Thông thường năm 1 là năm đầu tiên của kỷ nguyên mới nhất hoặc năm ISO 8601 `0001`. Nếu kỷ nguyên nằm ở giữa năm, năm đó sẽ có cùng giá trị trước và sau ngày bắt đầu của kỷ nguyên.
- `Temporal.PlainYearMonth.prototype[Symbol.toStringTag]`
  - : Giá trị ban đầu của thuộc tính [`[Symbol.toStringTag]`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Symbol/toStringTag) là chuỗi `"Temporal.PlainYearMonth"`. Thuộc tính này được dùng trong {{jsxref("Object.prototype.toString()")}}.

## Phương thức thực thể

- {{jsxref("Temporal/PlainYearMonth/add", "Temporal.PlainYearMonth.prototype.add()")}}
  - : Trả về một đối tượng `Temporal.PlainYearMonth` mới đại diện cho year-month này được chuyển tiếp theo một khoảng thời gian nhất định (ở dạng có thể chuyển đổi bởi {{jsxref("Temporal/Duration/from", "Temporal.Duration.from()")}}).
- {{jsxref("Temporal/PlainYearMonth/equals", "Temporal.PlainYearMonth.prototype.equals()")}}
  - : Trả về `true` nếu year-month này có giá trị tương đương với một year-month khác (ở dạng có thể chuyển đổi bởi {{jsxref("Temporal/PlainYearMonth/from", "Temporal.PlainYearMonth.from()")}}), và `false` trong trường hợp còn lại. Chúng được so sánh cả theo giá trị ngày ISO cơ bản lẫn lịch, vì vậy hai year-month từ các lịch khác nhau có thể được coi là bằng nhau bởi {{jsxref("Temporal/PlainYearMonth/compare", "Temporal.PlainYearMonth.compare()")}} nhưng không bởi `equals()`.
- {{jsxref("Temporal/PlainYearMonth/since", "Temporal.PlainYearMonth.prototype.since()")}}
  - : Trả về một đối tượng {{jsxref("Temporal.Duration")}} mới đại diện cho khoảng thời gian từ một year-month khác (ở dạng có thể chuyển đổi bởi {{jsxref("Temporal/PlainYearMonth/from", "Temporal.PlainYearMonth.from()")}}) đến year-month này. Khoảng thời gian là dương nếu tháng kia trước tháng này, và âm nếu sau.
- {{jsxref("Temporal/PlainYearMonth/subtract", "Temporal.PlainYearMonth.prototype.subtract()")}}
  - : Trả về một đối tượng `Temporal.PlainYearMonth` mới đại diện cho year-month này được chuyển lùi theo một khoảng thời gian nhất định (ở dạng có thể chuyển đổi bởi {{jsxref("Temporal/Duration/from", "Temporal.Duration.from()")}}).
- {{jsxref("Temporal/PlainYearMonth/toJSON", "Temporal.PlainYearMonth.prototype.toJSON()")}}
  - : Trả về một chuỗi đại diện cho year-month này theo cùng [định dạng RFC 9557](#rfc_9557_format) như khi gọi {{jsxref("Temporal/PlainYearMonth/toString", "toString()")}}. Được thiết kế để được gọi ngầm định bởi {{jsxref("JSON.stringify()")}}.
- {{jsxref("Temporal/PlainYearMonth/toLocaleString", "Temporal.PlainYearMonth.prototype.toLocaleString()")}}
  - : Trả về một chuỗi với biểu diễn phụ thuộc ngôn ngữ của year-month này.
- {{jsxref("Temporal/PlainYearMonth/toPlainDate", "Temporal.PlainYearMonth.prototype.toPlainDate()")}}
  - : Trả về một đối tượng {{jsxref("Temporal.PlainDate")}} mới đại diện cho year-month này và một ngày được cung cấp trong cùng hệ thống lịch.
- {{jsxref("Temporal/PlainYearMonth/toString", "Temporal.PlainYearMonth.prototype.toString()")}}
  - : Trả về một chuỗi đại diện cho year-month này theo [định dạng RFC 9557](#rfc_9557_format).
- {{jsxref("Temporal/PlainYearMonth/until", "Temporal.PlainYearMonth.prototype.until()")}}
  - : Trả về một đối tượng {{jsxref("Temporal.Duration")}} mới đại diện cho khoảng thời gian từ year-month này đến một year-month khác (ở dạng có thể chuyển đổi bởi {{jsxref("Temporal/PlainYearMonth/from", "Temporal.PlainYearMonth.from()")}}). Khoảng thời gian là dương nếu tháng kia sau tháng này, và âm nếu trước.
- {{jsxref("Temporal/PlainYearMonth/valueOf", "Temporal.PlainYearMonth.prototype.valueOf()")}}
  - : Ném một {{jsxref("TypeError")}}, ngăn các thực thể `Temporal.PlainYearMonth` bị [chuyển đổi ngầm định sang kiểu nguyên thủy](/en-US/docs/Web/JavaScript/Guide/Data_structures#primitive_coercion) khi được dùng trong các phép toán số học hoặc so sánh.
- {{jsxref("Temporal/PlainYearMonth/with", "Temporal.PlainYearMonth.prototype.with()")}}
  - : Trả về một đối tượng `Temporal.PlainYearMonth` mới đại diện cho year-month này với một số trường được thay thế bằng giá trị mới.

## Đặc tả

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{jsxref("Temporal")}}
- {{jsxref("Temporal.PlainDate")}}
- {{jsxref("Temporal.PlainMonthDay")}}
