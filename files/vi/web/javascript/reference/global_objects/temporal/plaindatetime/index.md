---
title: Temporal.PlainDateTime
slug: Web/JavaScript/Reference/Global_Objects/Temporal/PlainDateTime
page-type: javascript-class
browser-compat: javascript.builtins.Temporal.PlainDateTime
sidebar: jsref
---

Đối tượng **`Temporal.PlainDateTime`** đại diện cho một ngày (ngày theo lịch) và thời gian (thời gian trên đồng hồ) mà không có múi giờ. Về cơ bản, nó được biểu diễn như sự kết hợp của một [ngày](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Temporal/PlainDate) (cùng với hệ thống lịch liên quan) và một [thời gian](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Temporal/PlainTime).

## Mô tả

Một `PlainDateTime` về cơ bản là sự kết hợp của {{jsxref("Temporal.PlainDate")}} và {{jsxref("Temporal.PlainTime")}}. Vì thông tin ngày và thời gian không có nhiều tương tác với nhau, tất cả thông tin chung về thuộc tính ngày được ghi lại trong đối tượng `PlainDate`, và tất cả thông tin chung về thuộc tính thời gian được ghi lại trong đối tượng `PlainTime`.

Nếu ngày-giờ đại diện cho một thời điểm cụ thể phải không thay đổi qua các múi giờ, bạn nên sử dụng đối tượng {{jsxref("Temporal.ZonedDateTime")}} thay thế. Hãy dùng `PlainDateTime` khi bạn cần đại diện cho một sự kiện xảy ra tại một thời điểm cụ thể trên đồng hồ, nhưng có thể là thời điểm khác nhau ở các múi giờ khác nhau.

### Định dạng RFC 9557

Các đối tượng `PlainDateTime` có thể được tuần tự hóa và phân tích cú pháp theo định dạng [RFC 9557](https://datatracker.ietf.org/doc/html/rfc9557), một phần mở rộng của định dạng [ISO 8601 / RFC 3339](https://datatracker.ietf.org/doc/html/rfc3339). Chuỗi có dạng như sau (khoảng trắng chỉ để dễ đọc và không nên có trong chuỗi thực tế):

```plain
YYYY-MM-DD T HH:mm:ss.sssssssss [u-ca=calendar_id]
```

- `YYYY`
  - : Một số bốn chữ số, hoặc một số sáu chữ số với dấu `+` hoặc `-`.
- `MM`
  - : Một số hai chữ số từ `01` đến `12`.
- `DD`
  - : Một số hai chữ số từ `01` đến `31`. Các thành phần `YYYY`, `MM`, và `DD` có thể được phân tách bằng `-` hoặc không có gì.
- `T` {{optional_inline}}
  - : Ký tự phân cách ngày-giờ, có thể là `T`, `t`, hoặc khoảng trắng. Có mặt khi và chỉ khi `HH` có mặt.
- `HH` {{optional_inline}}
  - : Một số hai chữ số từ `00` đến `23`. Mặc định là `00`.
- `mm` {{optional_inline}}
  - : Một số hai chữ số từ `00` đến `59`. Mặc định là `00`.
- `ss.sssssssss` {{optional_inline}}
  - : Một số hai chữ số từ `00` đến `59`. Có thể tùy chọn theo sau bởi dấu `.` hoặc `,` và từ một đến chín chữ số. Mặc định là `00`. Các thành phần `HH`, `mm`, và `ss` có thể được phân tách bằng `:` hoặc không có gì. Bạn có thể bỏ qua chỉ `ss` hoặc cả `ss` lẫn `mm`, vì vậy thời gian có thể có một trong ba dạng: `HH`, `HH:mm`, hoặc `HH:mm:ss.sssssssss`.
- `[u-ca=calendar_id]` {{optional_inline}}
  - : Thay `calendar_id` bằng lịch muốn sử dụng. Xem [`Intl.supportedValuesOf()`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Intl/supportedValuesOf#supported_calendar_types) để biết danh sách các loại lịch thường được hỗ trợ. Mặc định là `[u-ca=iso8601]`. Có thể có _cờ bắt buộc_ bằng cách thêm tiền tố `!` vào trước khóa: ví dụ, `[!u-ca=iso8601]`. Cờ này thường thông báo cho các hệ thống khác rằng không thể bỏ qua nó nếu chúng không hỗ trợ. Trình phân tích cú pháp `Temporal` sẽ ném lỗi nếu các chú thích chứa hai hoặc nhiều chú thích lịch và một trong số chúng có cờ bắt buộc. Lưu ý rằng `YYYY-MM-DD` luôn được hiểu là ngày theo lịch ISO 8601 và sau đó được chuyển đổi sang lịch được chỉ định.

Khi nhập vào, bạn có thể tùy chọn bao gồm offset và định danh múi giờ, theo cùng định dạng như [`ZonedDateTime`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Temporal/ZonedDateTime#rfc_9557_format), nhưng chúng sẽ bị bỏ qua. Lưu ý rằng offset _không_ được là `Z`. Các chú thích khác theo định dạng `[key=value]` cũng bị bỏ qua, và chúng không được có cờ bắt buộc.

Khi tuần tự hóa, bạn có thể cấu hình số chữ số phần giây phân số, có hiển thị ID lịch hay không, và có thêm cờ bắt buộc cho nó hay không.

## Hàm khởi tạo

- {{jsxref("Temporal/PlainDateTime/PlainDateTime", "Temporal.PlainDateTime()")}} {{experimental_inline}}
  - : Tạo một đối tượng `Temporal.PlainDateTime` mới bằng cách cung cấp trực tiếp dữ liệu cơ sở.

## Phương thức tĩnh

- {{jsxref("Temporal/PlainDateTime/compare", "Temporal.PlainDateTime.compare()")}}
  - : Trả về một số (-1, 0, hoặc 1) cho biết ngày-giờ đầu tiên đến trước, giống với, hoặc đến sau ngày-giờ thứ hai. Tương đương với việc so sánh ngày trước, rồi so sánh thời gian nếu ngày giống nhau.
- {{jsxref("Temporal/PlainDateTime/from", "Temporal.PlainDateTime.from()")}}
  - : Tạo một đối tượng `Temporal.PlainDateTime` mới từ một đối tượng `Temporal.PlainDateTime` khác, một đối tượng có thuộc tính ngày và thời gian, hoặc một chuỗi [RFC 9557](#định-dạng-rfc-9557).

## Thuộc tính instance

Các thuộc tính này được định nghĩa trên `Temporal.PlainDateTime.prototype` và được chia sẻ bởi tất cả các instance `Temporal.PlainDateTime`.

- {{jsxref("Temporal/PlainDateTime/calendarId", "Temporal.PlainDateTime.prototype.calendarId")}}
  - : Trả về một chuỗi đại diện cho [lịch](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Temporal#calendars) được sử dụng để diễn giải ngày ISO 8601 nội bộ.
- {{jsxref("Object/constructor", "Temporal.PlainDateTime.prototype.constructor")}}
  - : Hàm khởi tạo đã tạo ra đối tượng instance. Đối với các instance `Temporal.PlainDateTime`, giá trị ban đầu là hàm khởi tạo {{jsxref("Temporal/PlainDateTime/PlainDateTime", "Temporal.PlainDateTime()")}}.
- {{jsxref("Temporal/PlainDateTime/day", "Temporal.PlainDateTime.prototype.day")}}
  - : Trả về một số nguyên dương đại diện cho chỉ số ngày theo cơ số 1 trong tháng của ngày này, đây là số ngày giống như bạn thấy trên lịch. Phụ thuộc vào [lịch](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Temporal#calendars). Thường bắt đầu từ 1 và liên tục, nhưng không phải lúc nào cũng vậy.
- {{jsxref("Temporal/PlainDateTime/dayOfWeek", "Temporal.PlainDateTime.prototype.dayOfWeek")}}
  - : Trả về một số nguyên dương đại diện cho chỉ số ngày theo cơ số 1 trong tuần của ngày này. Các ngày trong tuần được đánh số tuần tự từ `1` đến {{jsxref("Temporal/PlainDateTime/daysInWeek", "daysInWeek")}}, với mỗi số ánh xạ đến tên của nó. Phụ thuộc vào [lịch](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Temporal#calendars). 1 thường đại diện cho Thứ Hai trong lịch, ngay cả khi các vùng ngôn ngữ sử dụng lịch đó có thể coi một ngày khác là ngày đầu tiên của tuần (xem {{jsxref("Intl/Locale/getWeekInfo", "Intl.Locale.prototype.getWeekInfo()")}}).
- {{jsxref("Temporal/PlainDateTime/dayOfYear", "Temporal.PlainDateTime.prototype.dayOfYear")}}
  - : Trả về một số nguyên dương đại diện cho chỉ số ngày theo cơ số 1 trong năm của ngày này. Ngày đầu tiên của năm là `1`, và ngày cuối cùng là {{jsxref("Temporal/PlainDateTime/daysInYear", "daysInYear")}}. Phụ thuộc vào [lịch](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Temporal#calendars).
- {{jsxref("Temporal/PlainDateTime/daysInMonth", "Temporal.PlainDateTime.prototype.daysInMonth")}}
  - : Trả về một số nguyên dương đại diện cho số ngày trong tháng của ngày này. Phụ thuộc vào [lịch](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Temporal#calendars).
- {{jsxref("Temporal/PlainDateTime/daysInWeek", "Temporal.PlainDateTime.prototype.daysInWeek")}}
  - : Trả về một số nguyên dương đại diện cho số ngày trong tuần của ngày này. Phụ thuộc vào [lịch](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Temporal#calendars). Đối với lịch ISO 8601, luôn là 7, nhưng trong các hệ thống lịch khác nó có thể khác nhau giữa các tuần.
- {{jsxref("Temporal/PlainDateTime/daysInYear", "Temporal.PlainDateTime.prototype.daysInYear")}}
  - : Trả về một số nguyên dương đại diện cho số ngày trong năm của ngày này. Phụ thuộc vào [lịch](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Temporal#calendars). Đối với lịch ISO 8601, đây là 365, hoặc 366 trong năm nhuận.
- {{jsxref("Temporal/PlainDateTime/era", "Temporal.PlainDateTime.prototype.era")}}
  - : Trả về một chuỗi chữ thường đặc trưng theo lịch đại diện cho thời đại của ngày này, hoặc `undefined` nếu lịch không sử dụng thời đại (ví dụ: ISO 8601). `era` và `eraYear` cùng nhau xác định duy nhất một năm trong lịch, theo cách tương tự như `year`. Phụ thuộc vào [lịch](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Temporal#calendars). Đối với Gregorian, đó là `"ce"` hoặc `"bce"`.
- {{jsxref("Temporal/PlainDateTime/eraYear", "Temporal.PlainDateTime.prototype.eraYear")}}
  - : Trả về một số nguyên không âm đại diện cho năm của ngày này trong thời đại, hoặc `undefined` nếu lịch không sử dụng thời đại (ví dụ: ISO 8601). Chỉ số năm thường bắt đầu từ 1 (phổ biến hơn) hoặc 0, và các năm trong một thời đại có thể giảm theo thời gian (ví dụ: Gregorian BCE). `era` và `eraYear` cùng nhau xác định duy nhất một năm trong lịch, theo cách tương tự như `year`. Phụ thuộc vào [lịch](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Temporal#calendars).
- {{jsxref("Temporal/PlainDateTime/hour", "Temporal.PlainDateTime.prototype.hour")}}
  - : Trả về một số nguyên từ 0 đến 23 đại diện cho thành phần giờ của thời gian này.
- {{jsxref("Temporal/PlainDateTime/inLeapYear", "Temporal.PlainDateTime.prototype.inLeapYear")}}
  - : Trả về một giá trị boolean cho biết ngày này có trong năm nhuận không. Năm nhuận là năm có nhiều ngày hơn (do ngày nhuận hoặc tháng nhuận) so với năm thường. Phụ thuộc vào [lịch](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Temporal#calendars).
- {{jsxref("Temporal/PlainDateTime/microsecond", "Temporal.PlainDateTime.prototype.microsecond")}}
  - : Trả về một số nguyên từ 0 đến 999 đại diện cho thành phần micro giây (10<sup>-6</sup> giây) của thời gian này.
- {{jsxref("Temporal/PlainDateTime/millisecond", "Temporal.PlainDateTime.prototype.millisecond")}}
  - : Trả về một số nguyên từ 0 đến 999 đại diện cho thành phần mili giây (10<sup>-3</sup> giây) của thời gian này.
- {{jsxref("Temporal/PlainDateTime/minute", "Temporal.PlainDateTime.prototype.minute")}}
  - : Trả về một số nguyên từ 0 đến 59 đại diện cho thành phần phút của thời gian này.
- {{jsxref("Temporal/PlainDateTime/month", "Temporal.PlainDateTime.prototype.month")}}
  - : Trả về một số nguyên dương đại diện cho chỉ số tháng theo cơ số 1 trong năm của ngày này. Tháng đầu tiên của năm là `1`, và tháng cuối cùng là {{jsxref("Temporal/PlainDateTime/monthsInYear", "monthsInYear")}}. Phụ thuộc vào [lịch](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Temporal#calendars). Lưu ý rằng không giống như {{jsxref("Date.prototype.getMonth()")}}, chỉ số này theo cơ số 1. Nếu lịch có tháng nhuận, tháng có cùng {{jsxref("Temporal/PlainDateTime/monthCode", "monthCode")}} có thể có các chỉ số `month` khác nhau cho các năm khác nhau.
- {{jsxref("Temporal/PlainDateTime/monthCode", "Temporal.PlainDateTime.prototype.monthCode")}}
  - : Trả về một chuỗi đặc trưng theo lịch đại diện cho tháng của ngày này. Phụ thuộc vào [lịch](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Temporal#calendars). Thường là `M` cộng với số tháng hai chữ số. Đối với tháng nhuận, là mã tháng trước theo sau là `L`. Nếu tháng nhuận là tháng đầu tiên của năm, mã là `M00L`.
- {{jsxref("Temporal/PlainDateTime/monthsInYear", "Temporal.PlainDateTime.prototype.monthsInYear")}}
  - : Trả về một số nguyên dương đại diện cho số tháng trong năm của ngày này. Phụ thuộc vào [lịch](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Temporal#calendars). Đối với lịch ISO 8601, luôn là 12, nhưng trong các hệ thống lịch khác nó có thể khác.
- {{jsxref("Temporal/PlainDateTime/nanosecond", "Temporal.PlainDateTime.prototype.nanosecond")}}
  - : Trả về một số nguyên từ 0 đến 999 đại diện cho thành phần nano giây (10<sup>-9</sup> giây) của thời gian này.
- {{jsxref("Temporal/PlainDateTime/second", "Temporal.PlainDateTime.prototype.second")}}
  - : Trả về một số nguyên từ 0 đến 59 đại diện cho thành phần giây của thời gian này.
- {{jsxref("Temporal/PlainDateTime/weekOfYear", "Temporal.PlainDateTime.prototype.weekOfYear")}}
  - : Trả về một số nguyên dương đại diện cho chỉ số tuần theo cơ số 1 trong {{jsxref("Temporal/PlainDateTime/yearOfWeek", "yearOfWeek")}} của ngày này, hoặc `undefined` nếu lịch không có hệ thống tuần được xác định rõ ràng. Tuần đầu tiên của năm là `1`. Phụ thuộc vào [lịch](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Temporal#calendars). Lưu ý rằng đối với ISO 8601, một vài ngày đầu và cuối năm có thể được tính vào tuần cuối của năm trước hoặc tuần đầu của năm tiếp theo.
- {{jsxref("Temporal/PlainDateTime/year", "Temporal.PlainDateTime.prototype.year")}}
  - : Trả về một số nguyên đại diện cho số năm của ngày này tính từ năm gốc đặc trưng theo lịch. Phụ thuộc vào [lịch](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Temporal#calendars). Thường năm 1 là năm đầu tiên của thời đại mới nhất hoặc năm ISO 8601 `0001`. Nếu gốc ở giữa năm, năm đó sẽ có cùng giá trị trước và sau ngày bắt đầu của thời đại.
- {{jsxref("Temporal/PlainDateTime/yearOfWeek", "Temporal.PlainDateTime.prototype.yearOfWeek")}}
  - : Trả về một số nguyên đại diện cho năm được ghép nối với {{jsxref("Temporal/PlainDateTime/weekOfYear", "weekOfYear")}} của ngày này, hoặc `undefined` nếu lịch không có hệ thống tuần được xác định rõ ràng. Phụ thuộc vào [lịch](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Temporal#calendars). Thường đây là năm của ngày đó, nhưng đối với ISO 8601, một vài ngày đầu và cuối năm có thể được tính vào tuần cuối của năm trước hoặc tuần đầu của năm tiếp theo, khiến `yearOfWeek` có thể chênh lệch 1.
- `Temporal.PlainDateTime.prototype[Symbol.toStringTag]`
  - : Giá trị ban đầu của thuộc tính [`[Symbol.toStringTag]`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Symbol/toStringTag) là chuỗi `"Temporal.PlainDateTime"`. Thuộc tính này được sử dụng trong {{jsxref("Object.prototype.toString()")}}.

## Phương thức instance

- {{jsxref("Temporal/PlainDateTime/add", "Temporal.PlainDateTime.prototype.add()")}}
  - : Trả về một đối tượng `Temporal.PlainDateTime` mới đại diện cho ngày-giờ này tiến về phía trước một khoảng thời gian cho trước (theo dạng có thể chuyển đổi bởi {{jsxref("Temporal/Duration/from", "Temporal.Duration.from()")}}).
- {{jsxref("Temporal/PlainDateTime/equals", "Temporal.PlainDateTime.prototype.equals()")}}
  - : Trả về `true` nếu ngày-giờ này tương đương về giá trị với một ngày-giờ khác (theo dạng có thể chuyển đổi bởi {{jsxref("Temporal/PlainDateTime/from", "Temporal.PlainDateTime.from()")}}), và `false` nếu không. Chúng được so sánh cả theo giá trị ngày giờ lẫn lịch, vì vậy hai ngày-giờ từ các lịch khác nhau có thể được coi là bằng nhau bởi {{jsxref("Temporal/PlainDateTime/compare", "Temporal.PlainDateTime.compare()")}} nhưng không phải bởi `equals()`.
- {{jsxref("Temporal/PlainDateTime/round", "Temporal.PlainDateTime.prototype.round()")}}
  - : Trả về một đối tượng `Temporal.PlainDateTime` mới đại diện cho ngày-giờ này được làm tròn đến đơn vị đã cho.
- {{jsxref("Temporal/PlainDateTime/since", "Temporal.PlainDateTime.prototype.since()")}}
  - : Trả về một đối tượng {{jsxref("Temporal.Duration")}} mới đại diện cho khoảng thời gian từ một ngày-giờ khác (theo dạng có thể chuyển đổi bởi {{jsxref("Temporal/PlainDateTime/from", "Temporal.PlainDateTime.from()")}}) đến ngày-giờ này. Khoảng thời gian là dương nếu ngày-giờ kia trước ngày-giờ này, và âm nếu sau.
- {{jsxref("Temporal/PlainDateTime/subtract", "Temporal.PlainDateTime.prototype.subtract()")}}
  - : Trả về một đối tượng `Temporal.PlainDateTime` mới đại diện cho ngày-giờ này lùi về phía sau một khoảng thời gian cho trước (theo dạng có thể chuyển đổi bởi {{jsxref("Temporal/Duration/from", "Temporal.Duration.from()")}}).
- {{jsxref("Temporal/PlainDateTime/toJSON", "Temporal.PlainDateTime.prototype.toJSON()")}}
  - : Trả về một chuỗi đại diện cho ngày-giờ này theo cùng [định dạng RFC 9557](#định-dạng-rfc-9557) như khi gọi {{jsxref("Temporal/PlainDateTime/toString", "toString()")}}. Được thiết kế để được gọi ngầm bởi {{jsxref("JSON.stringify()")}}.
- {{jsxref("Temporal/PlainDateTime/toLocaleString", "Temporal.PlainDateTime.prototype.toLocaleString()")}}
  - : Trả về một chuỗi với biểu diễn nhạy cảm ngôn ngữ của ngày-giờ này.
- {{jsxref("Temporal/PlainDateTime/toPlainDate", "Temporal.PlainDateTime.prototype.toPlainDate()")}}
  - : Trả về một đối tượng {{jsxref("Temporal.PlainDate")}} mới đại diện cho phần ngày (năm, tháng, ngày) của ngày-giờ này trong cùng hệ thống lịch.
- {{jsxref("Temporal/PlainDateTime/toPlainTime", "Temporal.PlainDateTime.prototype.toPlainTime()")}}
  - : Trả về một đối tượng {{jsxref("Temporal.PlainTime")}} mới đại diện cho phần thời gian (giờ, phút, giây và các thành phần dưới giây) của ngày-giờ này.
- {{jsxref("Temporal/PlainDateTime/toString", "Temporal.PlainDateTime.prototype.toString()")}}
  - : Trả về một chuỗi đại diện cho ngày-giờ này theo [định dạng RFC 9557](#định-dạng-rfc-9557).
- {{jsxref("Temporal/PlainDateTime/toZonedDateTime", "Temporal.PlainDateTime.prototype.toZonedDateTime()")}}
  - : Trả về một instance {{jsxref("Temporal.ZonedDateTime")}} mới đại diện cho cùng ngày-giờ như ngày-giờ thuần này, nhưng trong múi giờ được chỉ định.
- {{jsxref("Temporal/PlainDateTime/until", "Temporal.PlainDateTime.prototype.until()")}}
  - : Trả về một đối tượng {{jsxref("Temporal.Duration")}} mới đại diện cho khoảng thời gian từ ngày-giờ này đến một ngày-giờ khác (theo dạng có thể chuyển đổi bởi {{jsxref("Temporal/PlainDateTime/from", "Temporal.PlainDateTime.from()")}}). Khoảng thời gian là dương nếu ngày-giờ kia sau ngày-giờ này, và âm nếu trước.
- {{jsxref("Temporal/PlainDateTime/valueOf", "Temporal.PlainDateTime.prototype.valueOf()")}}
  - : Ném {{jsxref("TypeError")}}, ngăn các instance `Temporal.PlainDateTime` bị [chuyển đổi ngầm thành kiểu nguyên thủy](/en-US/docs/Web/JavaScript/Guide/Data_structures#primitive_coercion) khi được sử dụng trong các phép toán số học hoặc so sánh.
- {{jsxref("Temporal/PlainDateTime/with", "Temporal.PlainDateTime.prototype.with()")}}
  - : Trả về một đối tượng `Temporal.PlainDateTime` mới đại diện cho ngày-giờ này với một số trường được thay thế bằng giá trị mới.
- {{jsxref("Temporal/PlainDateTime/withCalendar", "Temporal.PlainDateTime.prototype.withCalendar()")}}
  - : Trả về một đối tượng `Temporal.PlainDateTime` mới đại diện cho ngày-giờ này được diễn giải trong hệ thống lịch mới.
- {{jsxref("Temporal/PlainDateTime/withPlainTime", "Temporal.PlainDateTime.prototype.withPlainTime()")}}
  - : Trả về một đối tượng `Temporal.PlainDateTime` mới đại diện cho ngày-giờ này với phần thời gian được thay thế hoàn toàn bằng thời gian mới (theo dạng có thể chuyển đổi bởi {{jsxref("Temporal/PlainTime/from", "Temporal.PlainTime.from()")}}).

## Đặc tả

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{jsxref("Temporal")}}
- {{jsxref("Temporal.Duration")}}
- {{jsxref("Temporal.PlainDate")}}
- {{jsxref("Temporal.PlainTime")}}
- {{jsxref("Temporal.ZonedDateTime")}}
