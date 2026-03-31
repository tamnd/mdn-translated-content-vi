---
title: Temporal.PlainDate
slug: Web/JavaScript/Reference/Global_Objects/Temporal/PlainDate
page-type: javascript-class
browser-compat: javascript.builtins.Temporal.PlainDate
sidebar: jsref
---

Đối tượng **`Temporal.PlainDate`** đại diện cho một ngày trên lịch (một ngày không có giờ hoặc múi giờ); ví dụ, một sự kiện trên lịch xảy ra trong suốt cả ngày bất kể múi giờ nào. Về cơ bản, nó được biểu diễn dưới dạng một ngày lịch ISO 8601, với các trường năm, tháng và ngày, cùng với một hệ thống lịch được liên kết.

## Mô tả

`PlainDate` về cơ bản là phần ngày của đối tượng {{jsxref("Temporal.PlainDateTime")}}, với thông tin thời gian bị loại bỏ. Vì thông tin ngày và giờ không có nhiều tương tác, tất cả thông tin chung về các thuộc tính ngày được ghi lại ở đây.

### Định dạng RFC 9557

Các đối tượng `PlainDate` có thể được tuần tự hóa và phân tích cú pháp bằng định dạng [RFC 9557](https://datatracker.ietf.org/doc/html/rfc9557), một phần mở rộng của định dạng [ISO 8601 / RFC 3339](https://datatracker.ietf.org/doc/html/rfc3339). Chuỗi có dạng sau (khoảng trắng chỉ để dễ đọc và không được có trong chuỗi thực tế):

```plain
YYYY-MM-DD [u-ca=calendar_id]
```

- `YYYY`
  - : Một số bốn chữ số, hoặc một số sáu chữ số với dấu `+` hoặc `-`.
- `MM`
  - : Một số hai chữ số từ `01` đến `12`.
- `DD`
  - : Một số hai chữ số từ `01` đến `31`. Các thành phần `YYYY`, `MM` và `DD` có thể được phân tách bằng `-` hoặc không có gì.
- `[u-ca=calendar_id]` {{optional_inline}}
  - : Thay thế `calendar_id` bằng lịch cần sử dụng. Xem [`Intl.supportedValuesOf()`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Intl/supportedValuesOf#supported_calendar_types) để biết danh sách các loại lịch thường được hỗ trợ. Mặc định là `[u-ca=iso8601]`. Có thể có _cờ quan trọng_ bằng cách thêm tiền tố `!` vào key: ví dụ, `[!u-ca=iso8601]`. Cờ này thường thông báo cho các hệ thống khác rằng nó không thể bị bỏ qua nếu họ không hỗ trợ nó. Trình phân tích cú pháp `Temporal` sẽ ném lỗi nếu các chú thích chứa hai hoặc nhiều chú thích lịch và một trong số chúng là quan trọng. Lưu ý rằng `YYYY-MM-DD` luôn được hiểu là ngày lịch ISO 8601 và sau đó được chuyển đổi sang lịch được chỉ định.

Là đầu vào, bạn có thể tùy chọn bao gồm giờ, độ lệch và định danh múi giờ, theo cùng định dạng như [`PlainDateTime`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Temporal/PlainDateTime#rfc_9557_format), nhưng chúng sẽ bị bỏ qua. Các chú thích khác ở định dạng `[key=value]` cũng bị bỏ qua và chúng không được có cờ quan trọng.

Khi tuần tự hóa, bạn có thể cấu hình xem có hiển thị ID lịch hay không và có thêm cờ quan trọng cho nó hay không.

### Kẹp ngày không hợp lệ

Các phương thức {{jsxref("Temporal/PlainDate/from", "Temporal.PlainDate.from()")}}, {{jsxref("Temporal/PlainDate/with", "Temporal.PlainDate.prototype.with()")}}, {{jsxref("Temporal/PlainDate/add", "Temporal.PlainDate.prototype.add()")}}, {{jsxref("Temporal/PlainDate/subtract", "Temporal.PlainDate.prototype.subtract()")}} và các phương thức tương đương trong các đối tượng `Temporal` khác, cho phép xây dựng ngày bằng cách sử dụng các thuộc tính dành riêng cho lịch. Các thành phần ngày có thể nằm ngoài phạm vi. Trong lịch ISO, đây luôn là _tràn_, chẳng hạn như tháng lớn hơn 12 hoặc ngày lớn hơn số ngày, và việc sửa nó chỉ liên quan đến việc kẹp giá trị về giá trị tối đa được phép. Trong các lịch khác, trường hợp không hợp lệ có thể phức tạp hơn. Khi sử dụng tùy chọn `overflow: "constrain"`, các ngày không hợp lệ được sửa thành ngày hợp lệ theo cách sau:

- Nếu ngày không tồn tại nhưng tháng tồn tại: chọn ngày gần nhất trong cùng tháng. Nếu có hai ngày cách đều nhau trong tháng đó, chọn ngày sau.
- Nếu tháng là tháng nhuận không tồn tại trong năm: chọn ngày khác theo quy ước văn hóa của người dùng lịch đó. Thông thường điều này sẽ dẫn đến cùng ngày trong tháng trước hoặc sau khi tháng đó thường rơi vào trong năm nhuận.
- Nếu tháng không tồn tại trong năm vì lý do khác: chọn ngày gần nhất vẫn còn trong cùng năm. Nếu có hai ngày cách đều nhau trong năm đó, chọn ngày sau.
- Nếu toàn bộ năm không tồn tại: chọn ngày gần nhất trong một năm khác. Nếu có hai ngày cách đều nhau, chọn ngày sau.

## Constructor

- {{jsxref("Temporal/PlainDate/PlainDate", "Temporal.PlainDate()")}} {{experimental_inline}}
  - : Tạo một đối tượng `Temporal.PlainDate` mới bằng cách cung cấp trực tiếp dữ liệu bên dưới.

## Phương thức tĩnh

- {{jsxref("Temporal/PlainDate/compare", "Temporal.PlainDate.compare()")}}
  - : Trả về một số (-1, 0 hoặc 1) cho biết ngày đầu tiên đến trước, bằng hoặc sau ngày thứ hai. Tương đương với việc so sánh các trường năm, tháng và ngày của các ngày ISO 8601 bên dưới.
- {{jsxref("Temporal/PlainDate/from", "Temporal.PlainDate.from()")}}
  - : Tạo một đối tượng `Temporal.PlainDate` mới từ đối tượng `Temporal.PlainDate` khác, đối tượng có thuộc tính ngày, hoặc chuỗi [RFC 9557](#rfc_9557_format).

## Thuộc tính instance

Các thuộc tính này được định nghĩa trên `Temporal.PlainDate.prototype` và được chia sẻ bởi tất cả các instance `Temporal.PlainDate`.

- {{jsxref("Temporal/PlainDate/calendarId", "Temporal.PlainDate.prototype.calendarId")}}
  - : Trả về một chuỗi đại diện cho [lịch](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Temporal#calendars) được sử dụng để diễn giải ngày ISO 8601 bên trong.
- {{jsxref("Object/constructor", "Temporal.PlainDate.prototype.constructor")}}
  - : Hàm constructor đã tạo đối tượng instance. Đối với các instance `Temporal.PlainDate`, giá trị ban đầu là constructor {{jsxref("Temporal/PlainDate/PlainDate", "Temporal.PlainDate()")}}.
- {{jsxref("Temporal/PlainDate/day", "Temporal.PlainDate.prototype.day")}}
  - : Trả về một số nguyên dương đại diện cho chỉ mục ngày dựa trên 1 trong tháng của ngày này, là cùng số ngày bạn sẽ thấy trên lịch. Phụ thuộc vào [lịch](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Temporal#calendars). Thường bắt đầu từ 1 và liên tục, nhưng không phải lúc nào cũng vậy.
- {{jsxref("Temporal/PlainDate/dayOfWeek", "Temporal.PlainDate.prototype.dayOfWeek")}}
  - : Trả về một số nguyên dương đại diện cho chỉ mục ngày trong tuần dựa trên 1 của ngày này. Các ngày trong tuần được đánh số tuần tự từ `1` đến {{jsxref("Temporal/PlainDate/daysInWeek", "daysInWeek")}}, với mỗi số ánh xạ tới tên của nó. Phụ thuộc vào [lịch](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Temporal#calendars). 1 thường đại diện cho Thứ Hai trong lịch, ngay cả khi các locale sử dụng lịch có thể coi một ngày khác là ngày đầu tiên của tuần (xem {{jsxref("Intl/Locale/getWeekInfo", "Intl.Locale.prototype.getWeekInfo()")}}).
- {{jsxref("Temporal/PlainDate/dayOfYear", "Temporal.PlainDate.prototype.dayOfYear")}}
  - : Trả về một số nguyên dương đại diện cho chỉ mục ngày trong năm dựa trên 1 của ngày này. Ngày đầu tiên của năm này là `1`, và ngày cuối cùng là {{jsxref("Temporal/PlainDate/daysInYear", "daysInYear")}}. Phụ thuộc vào [lịch](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Temporal#calendars).
- {{jsxref("Temporal/PlainDate/daysInMonth", "Temporal.PlainDate.prototype.daysInMonth")}}
  - : Trả về một số nguyên dương đại diện cho số ngày trong tháng của ngày này. Phụ thuộc vào [lịch](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Temporal#calendars).
- {{jsxref("Temporal/PlainDate/daysInWeek", "Temporal.PlainDate.prototype.daysInWeek")}}
  - : Trả về một số nguyên dương đại diện cho số ngày trong tuần của ngày này. Phụ thuộc vào [lịch](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Temporal#calendars). Đối với lịch ISO 8601, đây luôn là 7, nhưng trong các hệ thống lịch khác, nó có thể khác nhau từ tuần này sang tuần khác.
- {{jsxref("Temporal/PlainDate/daysInYear", "Temporal.PlainDate.prototype.daysInYear")}}
  - : Trả về một số nguyên dương đại diện cho số ngày trong năm của ngày này. Phụ thuộc vào [lịch](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Temporal#calendars). Đối với lịch ISO 8601, đây là 365, hoặc 366 trong năm nhuận.
- {{jsxref("Temporal/PlainDate/era", "Temporal.PlainDate.prototype.era")}}
  - : Trả về một chuỗi chữ thường dành riêng cho lịch đại diện cho kỷ nguyên của ngày này, hoặc `undefined` nếu lịch không sử dụng kỷ nguyên (ví dụ, ISO 8601). `era` và `eraYear` cùng nhau xác định duy nhất một năm trong lịch, theo cách tương tự như `year`. Phụ thuộc vào [lịch](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Temporal#calendars). Đối với Gregorian, đó là `"ce"` hoặc `"bce"`.
- {{jsxref("Temporal/PlainDate/eraYear", "Temporal.PlainDate.prototype.eraYear")}}
  - : Trả về một số nguyên không âm đại diện cho năm của ngày này trong kỷ nguyên, hoặc `undefined` nếu lịch không sử dụng kỷ nguyên (ví dụ, ISO 8601). Chỉ mục năm thường bắt đầu từ 1 (phổ biến hơn) hoặc 0, và các năm trong một kỷ nguyên có thể giảm theo thời gian (ví dụ, Gregorian BCE). `era` và `eraYear` cùng nhau xác định duy nhất một năm trong lịch, theo cách tương tự như `year`. Phụ thuộc vào [lịch](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Temporal#calendars).
- {{jsxref("Temporal/PlainDate/inLeapYear", "Temporal.PlainDate.prototype.inLeapYear")}}
  - : Trả về một boolean cho biết ngày này có phải là năm nhuận không. Năm nhuận là năm có nhiều ngày hơn (do ngày nhuận hoặc tháng nhuận) so với năm thông thường. Phụ thuộc vào [lịch](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Temporal#calendars).
- {{jsxref("Temporal/PlainDate/month", "Temporal.PlainDate.prototype.month")}}
  - : Trả về một số nguyên dương đại diện cho chỉ mục tháng dựa trên 1 trong năm của ngày này. Tháng đầu tiên của năm này là `1`, và tháng cuối cùng là {{jsxref("Temporal/PlainDate/monthsInYear", "monthsInYear")}}. Phụ thuộc vào [lịch](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Temporal#calendars). Lưu ý rằng không giống như {{jsxref("Date.prototype.getMonth()")}}, chỉ mục dựa trên 1. Nếu lịch có tháng nhuận, thì tháng có cùng {{jsxref("Temporal/PlainDate/monthCode", "monthCode")}} có thể có các chỉ mục `month` khác nhau cho các năm khác nhau.
- {{jsxref("Temporal/PlainDate/monthCode", "Temporal.PlainDate.prototype.monthCode")}}
  - : Trả về một chuỗi dành riêng cho lịch đại diện cho tháng của ngày này. Phụ thuộc vào [lịch](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Temporal#calendars). Thường là `M` cộng với số tháng hai chữ số. Đối với tháng nhuận, đó là mã của tháng trước theo sau bởi `L`. Nếu tháng nhuận là tháng đầu tiên của năm, mã là `M00L`.
- {{jsxref("Temporal/PlainDate/monthsInYear", "Temporal.PlainDate.prototype.monthsInYear")}}
  - : Trả về một số nguyên dương đại diện cho số tháng trong năm của ngày này. Phụ thuộc vào [lịch](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Temporal#calendars). Đối với lịch ISO 8601, đây luôn là 12, nhưng trong các hệ thống lịch khác, nó có thể khác nhau.
- {{jsxref("Temporal/PlainDate/weekOfYear", "Temporal.PlainDate.prototype.weekOfYear")}}
  - : Trả về một số nguyên dương đại diện cho chỉ mục tuần dựa trên 1 trong {{jsxref("Temporal/PlainDate/yearOfWeek", "yearOfWeek")}} của ngày này, hoặc `undefined` nếu lịch không có hệ thống tuần được xác định rõ ràng. Tuần đầu tiên của năm là `1`. Phụ thuộc vào [lịch](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Temporal#calendars). Lưu ý rằng đối với ISO 8601, một số ngày đầu và cuối năm có thể được gán cho tuần cuối cùng của năm trước hoặc tuần đầu tiên của năm tiếp theo.
- {{jsxref("Temporal/PlainDate/year", "Temporal.PlainDate.prototype.year")}}
  - : Trả về một số nguyên đại diện cho số năm của ngày này tương đối so với năm bắt đầu của kỷ nguyên dành riêng cho lịch. Phụ thuộc vào [lịch](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Temporal#calendars). Thường năm 1 là năm đầu tiên của kỷ nguyên mới nhất hoặc năm ISO 8601 `0001`. Nếu kỷ nguyên nằm ở giữa năm, năm đó sẽ có cùng giá trị trước và sau ngày bắt đầu của kỷ nguyên.
- {{jsxref("Temporal/PlainDate/yearOfWeek", "Temporal.PlainDate.prototype.yearOfWeek")}}
  - : Trả về một số nguyên đại diện cho năm được ghép với {{jsxref("Temporal/PlainDate/weekOfYear", "weekOfYear")}} của ngày này, hoặc `undefined` nếu lịch không có hệ thống tuần được xác định rõ ràng. Phụ thuộc vào [lịch](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Temporal#calendars). Thường đây là năm của ngày, nhưng đối với ISO 8601, một số ngày đầu và cuối năm có thể được gán cho tuần cuối cùng của năm trước hoặc tuần đầu tiên của năm tiếp theo, khiến `yearOfWeek` chênh lệch 1.
- `Temporal.PlainDate.prototype[Symbol.toStringTag]`
  - : Giá trị ban đầu của thuộc tính [`[Symbol.toStringTag]`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Symbol/toStringTag) là chuỗi `"Temporal.PlainDate"`. Thuộc tính này được sử dụng trong {{jsxref("Object.prototype.toString()")}}.

## Phương thức instance

- {{jsxref("Temporal/PlainDate/add", "Temporal.PlainDate.prototype.add()")}}
  - : Trả về một đối tượng `Temporal.PlainDate` mới đại diện cho ngày này được tiến về phía trước theo một khoảng thời gian nhất định (ở dạng có thể chuyển đổi bởi {{jsxref("Temporal/Duration/from", "Temporal.Duration.from()")}}).
- {{jsxref("Temporal/PlainDate/equals", "Temporal.PlainDate.prototype.equals()")}}
  - : Trả về `true` nếu ngày này tương đương về giá trị với một ngày khác (ở dạng có thể chuyển đổi bởi {{jsxref("Temporal/PlainDate/from", "Temporal.PlainDate.from()")}}), và `false` nếu không. Chúng được so sánh cả về giá trị ngày và lịch của chúng.
- {{jsxref("Temporal/PlainDate/since", "Temporal.PlainDate.prototype.since()")}}
  - : Trả về một đối tượng {{jsxref("Temporal.Duration")}} mới đại diện cho khoảng thời gian từ một ngày khác (ở dạng có thể chuyển đổi bởi {{jsxref("Temporal/PlainDate/from", "Temporal.PlainDate.from()")}}) đến ngày này. Khoảng thời gian là dương nếu ngày kia trước ngày này, và âm nếu sau.
- {{jsxref("Temporal/PlainDate/subtract", "Temporal.PlainDate.prototype.subtract()")}}
  - : Trả về một đối tượng `Temporal.PlainDate` mới đại diện cho ngày này được lùi về phía sau theo một khoảng thời gian nhất định (ở dạng có thể chuyển đổi bởi {{jsxref("Temporal/Duration/from", "Temporal.Duration.from()")}}).
- {{jsxref("Temporal/PlainDate/toJSON", "Temporal.PlainDate.prototype.toJSON()")}}
  - : Trả về một chuỗi đại diện cho ngày này theo cùng [định dạng RFC 9557](#rfc_9557_format) như khi gọi {{jsxref("Temporal/PlainDate/toString", "toString()")}}. Dự định được gọi ngầm bởi {{jsxref("JSON.stringify()")}}.
- {{jsxref("Temporal/PlainDate/toLocaleString", "Temporal.PlainDate.prototype.toLocaleString()")}}
  - : Trả về một chuỗi với biểu diễn nhạy cảm ngôn ngữ của ngày này.
- {{jsxref("Temporal/PlainDate/toPlainDateTime", "Temporal.PlainDate.prototype.toPlainDateTime()")}}
  - : Trả về một đối tượng {{jsxref("Temporal.PlainDateTime")}} mới đại diện cho ngày này và một giờ được cung cấp trong cùng hệ thống lịch.
- {{jsxref("Temporal/PlainDate/toPlainMonthDay", "Temporal.PlainDate.prototype.toPlainMonthDay()")}}
  - : Trả về một đối tượng {{jsxref("Temporal.PlainMonthDay")}} mới đại diện cho {{jsxref("Temporal/PlainDate/monthCode", "monthCode")}} và {{jsxref("Temporal/PlainDate/day", "day")}} của ngày này trong cùng hệ thống lịch.
- {{jsxref("Temporal/PlainDate/toPlainYearMonth", "Temporal.PlainDate.prototype.toPlainYearMonth()")}}
  - : Trả về một đối tượng {{jsxref("Temporal.PlainYearMonth")}} mới đại diện cho {{jsxref("Temporal/PlainDate/year", "year")}} và {{jsxref("Temporal/PlainDate/month", "month")}} của ngày này trong cùng hệ thống lịch.
- {{jsxref("Temporal/PlainDate/toString", "Temporal.PlainDate.prototype.toString()")}}
  - : Trả về một chuỗi đại diện cho ngày này theo [định dạng RFC 9557](#rfc_9557_format).
- {{jsxref("Temporal/PlainDate/toZonedDateTime", "Temporal.PlainDate.prototype.toZonedDateTime()")}}
  - : Trả về một đối tượng {{jsxref("Temporal.ZonedDateTime")}} mới đại diện cho ngày này, một giờ được cung cấp và một múi giờ được cung cấp, trong cùng hệ thống lịch.
- {{jsxref("Temporal/PlainDate/until", "Temporal.PlainDate.prototype.until()")}}
  - : Trả về một đối tượng {{jsxref("Temporal.Duration")}} mới đại diện cho khoảng thời gian từ ngày này đến một ngày khác (ở dạng có thể chuyển đổi bởi {{jsxref("Temporal/Instant/from", "Temporal.Instant.from()")}}). Khoảng thời gian là dương nếu ngày kia sau ngày này, và âm nếu trước.
- {{jsxref("Temporal/PlainDate/valueOf", "Temporal.PlainDate.prototype.valueOf()")}}
  - : Ném ra {{jsxref("TypeError")}}, ngăn các instance `Temporal.PlainDate` bị [chuyển đổi ngầm thành các giá trị nguyên thủy](/en-US/docs/Web/JavaScript/Guide/Data_structures#primitive_coercion) khi được sử dụng trong các phép toán số học hoặc so sánh.
- {{jsxref("Temporal/PlainDate/with", "Temporal.PlainDate.prototype.with()")}}
  - : Trả về một đối tượng `Temporal.PlainDate` mới đại diện cho ngày này với một số trường được thay thế bằng các giá trị mới.
- {{jsxref("Temporal/PlainDate/withCalendar", "Temporal.PlainDate.prototype.withCalendar()")}}
  - : Trả về một đối tượng `Temporal.PlainDate` mới đại diện cho ngày này được diễn giải trong hệ thống lịch mới.

## Đặc tả

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{jsxref("Temporal")}}
- {{jsxref("Temporal.Duration")}}
- {{jsxref("Temporal.PlainDateTime")}}
- {{jsxref("Temporal.PlainMonthDay")}}
- {{jsxref("Temporal.PlainYearMonth")}}
- {{jsxref("Temporal.ZonedDateTime")}}
