---
title: Temporal.PlainMonthDay
slug: Web/JavaScript/Reference/Global_Objects/Temporal/PlainMonthDay
page-type: javascript-class
browser-compat: javascript.builtins.Temporal.PlainMonthDay
sidebar: jsref
---

Đối tượng **`Temporal.PlainMonthDay`** đại diện cho tháng và ngày của một ngày trong lịch, không có năm hay múi giờ; ví dụ, một sự kiện trên lịch lặp lại mỗi năm và diễn ra trong suốt cả ngày. Về cơ bản, nó được biểu diễn dưới dạng một ngày lịch ISO 8601, với các trường năm, tháng và ngày, cùng với một hệ thống lịch được liên kết. Năm được dùng để phân biệt tháng-ngày trong các hệ thống lịch không phải ISO.

## Mô tả

`PlainMonthDay` về cơ bản là phần tháng-ngày của đối tượng {{jsxref("Temporal.PlainDate")}}, không có năm. Vì ý nghĩa của một tháng-ngày có thể thay đổi từ năm này sang năm khác (ví dụ: liệu nó có tồn tại hay không, hoặc tháng-ngày của ngày hôm sau là gì), đối tượng này không cung cấp nhiều chức năng độc lập, chẳng hạn như so sánh, cộng hoặc trừ. Thậm chí nó không có thuộc tính {{jsxref("Temporal/PlainDate/month", "month")}}, vì chỉ số tháng không có ý nghĩa nếu không có năm (ví dụ: hai tháng từ hai năm có cùng chỉ số có thể có tên khác nhau trong trường hợp tháng nhuận).

### Định dạng RFC 9557

Các đối tượng `PlainMonthDay` có thể được tuần tự hóa và phân tích cú pháp bằng định dạng [RFC 9557](https://datatracker.ietf.org/doc/html/rfc9557), một phần mở rộng của định dạng [ISO 8601 / RFC 3339](https://datatracker.ietf.org/doc/html/rfc3339). Chuỗi có dạng sau (khoảng trắng chỉ để dễ đọc và không được có trong chuỗi thực tế):

```plain
YYYY-MM-DD [u-ca=calendar_id]
```

- `YYYY` {{optional_inline}}
  - : Một số bốn chữ số, hoặc một số sáu chữ số với dấu `+` hoặc `-`. Bắt buộc đối với các lịch không phải ISO, và tùy chọn trong các trường hợp khác. Nếu bị bỏ qua, bạn có thể thay thế `YYYY-` bằng `--` (để chuỗi trông như `--MM-DD` hoặc `--MMDD`), hoặc bỏ phần `YYYY-` hoàn toàn (để chuỗi trông như `MM-DD` hoặc `MMDD`). Lưu ý rằng năm tham chiếu thực sự được lưu trữ có thể khác với năm bạn cung cấp, nhưng tháng-ngày được biểu diễn là như nhau. Xem {{jsxref("Temporal/PlainMonthDay/from", "Temporal.PlainMonthDay.from()")}} để biết thêm thông tin.
- `MM`
  - : Một số hai chữ số từ `01` đến `12`.
- `DD`
  - : Một số hai chữ số từ `01` đến `31`. Các thành phần `YYYY`, `MM` và `DD` có thể được phân tách bằng `-` hoặc không có gì.
- `[u-ca=calendar_id]` {{optional_inline}}
  - : Thay thế `calendar_id` bằng lịch cần sử dụng. Xem [`Intl.supportedValuesOf()`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Intl/supportedValuesOf#supported_calendar_types) để biết danh sách các loại lịch thường được hỗ trợ. Mặc định là `[u-ca=iso8601]`. Có thể có _cờ quan trọng_ bằng cách thêm tiền tố `!` vào key: ví dụ, `[!u-ca=iso8601]`. Cờ này thường thông báo cho các hệ thống khác rằng nó không thể bị bỏ qua nếu họ không hỗ trợ nó. Trình phân tích cú pháp `Temporal` sẽ ném lỗi nếu các chú thích chứa hai hoặc nhiều chú thích lịch và một trong số chúng là quan trọng. Lưu ý rằng `YYYY-MM-DD` luôn được hiểu là ngày lịch ISO 8601 và sau đó được chuyển đổi sang lịch được chỉ định.

Là đầu vào, bạn có thể tùy chọn bao gồm thông tin thời gian, độ lệch và định danh múi giờ, cùng định dạng với [`PlainDateTime`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Temporal/PlainDateTime#rfc_9557_format), nhưng chúng sẽ bị bỏ qua. Các chú thích khác theo định dạng `[key=value]` cũng bị bỏ qua, và chúng không được có cờ quan trọng.

Khi tuần tự hóa, bạn có thể cấu hình xem có hiển thị ID lịch hay không, và có thêm cờ quan trọng cho nó hay không.

## Constructor

- {{jsxref("Temporal/PlainMonthDay/PlainMonthDay", "Temporal.PlainMonthDay()")}} {{experimental_inline}}
  - : Tạo một đối tượng `Temporal.PlainMonthDay` mới bằng cách cung cấp trực tiếp dữ liệu bên dưới.

## Phương thức tĩnh

- {{jsxref("Temporal/PlainMonthDay/from", "Temporal.PlainMonthDay.from()")}}
  - : Tạo một đối tượng `Temporal.PlainMonthDay` mới từ một đối tượng `Temporal.PlainMonthDay` khác, một đối tượng có thuộc tính tháng và ngày, hoặc một chuỗi [RFC 9557](#định_dạng_rfc_9557).

## Thuộc tính instance

Các thuộc tính này được định nghĩa trên `Temporal.PlainMonthDay.prototype` và được chia sẻ bởi tất cả các instance `Temporal.PlainMonthDay`.

- {{jsxref("Temporal/PlainMonthDay/calendarId", "Temporal.PlainMonthDay.prototype.calendarId")}}
  - : Trả về một chuỗi đại diện cho [lịch](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Temporal#calendars) được dùng để diễn giải ngày ISO 8601 bên trong.
- {{jsxref("Object/constructor", "Temporal.PlainMonthDay.prototype.constructor")}}
  - : Hàm constructor đã tạo ra đối tượng instance. Đối với các instance `Temporal.PlainMonthDay`, giá trị ban đầu là constructor {{jsxref("Temporal/PlainMonthDay/PlainMonthDay", "Temporal.PlainMonthDay()")}}.
- {{jsxref("Temporal/PlainMonthDay/day", "Temporal.PlainMonthDay.prototype.day")}}
  - : Trả về một số nguyên dương đại diện cho chỉ số ngày dựa trên 1 trong tháng của ngày này, là cùng số ngày bạn thấy trên lịch. Phụ thuộc vào [lịch](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Temporal#calendars). Thường bắt đầu từ 1 và liên tục, nhưng không phải luôn luôn.
- {{jsxref("Temporal/PlainMonthDay/monthCode", "Temporal.PlainMonthDay.prototype.monthCode")}}
  - : Trả về một chuỗi đặc trưng cho lịch đại diện cho tháng của ngày này. Phụ thuộc vào [lịch](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Temporal#calendars). Thường là `M` cộng với số tháng hai chữ số. Đối với tháng nhuận, đó là mã của tháng trước theo sau là `L`. Nếu tháng nhuận là tháng đầu tiên của năm, mã là `M00L`.
- `Temporal.PlainMonthDay.prototype[Symbol.toStringTag]`
  - : Giá trị ban đầu của thuộc tính [`[Symbol.toStringTag]`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Symbol/toStringTag) là chuỗi `"Temporal.PlainMonthDay"`. Thuộc tính này được sử dụng trong {{jsxref("Object.prototype.toString()")}}.

## Phương thức instance

- {{jsxref("Temporal/PlainMonthDay/equals", "Temporal.PlainMonthDay.prototype.equals()")}}
  - : Trả về `true` nếu tháng-ngày này tương đương về giá trị với một tháng-ngày khác (ở dạng có thể chuyển đổi bởi {{jsxref("Temporal/PlainMonthDay/from", "Temporal.PlainMonthDay.from()")}}), và `false` nếu không. Chúng được so sánh cả về giá trị ngày và lịch của chúng.
- {{jsxref("Temporal/PlainMonthDay/toJSON", "Temporal.PlainMonthDay.prototype.toJSON()")}}
  - : Trả về một chuỗi đại diện cho tháng-ngày này theo cùng [định dạng RFC 9557](#định_dạng_rfc_9557) như khi gọi {{jsxref("Temporal/PlainMonthDay/toString", "toString()")}}. Được thiết kế để được gọi ngầm định bởi {{jsxref("JSON.stringify()")}}.
- {{jsxref("Temporal/PlainMonthDay/toLocaleString", "Temporal.PlainMonthDay.prototype.toLocaleString()")}}
  - : Trả về một chuỗi với biểu diễn tháng-ngày này theo ngôn ngữ cụ thể.
- {{jsxref("Temporal/PlainMonthDay/toPlainDate", "Temporal.PlainMonthDay.prototype.toPlainDate()")}}
  - : Trả về một đối tượng {{jsxref("Temporal.PlainDate")}} mới đại diện cho tháng-ngày này và một năm được cung cấp trong cùng hệ thống lịch.
- {{jsxref("Temporal/PlainMonthDay/toString", "Temporal.PlainMonthDay.prototype.toString()")}}
  - : Trả về một chuỗi đại diện cho tháng-ngày này theo [định dạng RFC 9557](#định_dạng_rfc_9557).
- {{jsxref("Temporal/PlainMonthDay/valueOf", "Temporal.PlainMonthDay.prototype.valueOf()")}}
  - : Ném một {{jsxref("TypeError")}}, ngăn các instance `Temporal.PlainMonthDay` bị [chuyển đổi ngầm định sang kiểu nguyên thủy](/en-US/docs/Web/JavaScript/Guide/Data_structures#primitive_coercion) khi được dùng trong các phép tính số học hoặc so sánh.
- {{jsxref("Temporal/PlainMonthDay/with", "Temporal.PlainMonthDay.prototype.with()")}}
  - : Trả về một đối tượng `Temporal.PlainMonthDay` mới đại diện cho tháng-ngày này với một số trường được thay thế bằng các giá trị mới.

## Ví dụ

### Lấy lần xuất hiện tiếp theo của một lễ hội

```js
// Tết Nguyên Đán là ngày 1/1 trong lịch Trung Quốc
const chineseNewYear = Temporal.PlainMonthDay.from({
  monthCode: "M01",
  day: 1,
  calendar: "chinese",
});
const currentYear = Temporal.Now.plainDateISO().withCalendar("chinese").year;
let nextCNY = chineseNewYear.toPlainDate({ year: currentYear });
if (Temporal.PlainDate.compare(nextCNY, Temporal.Now.plainDateISO()) <= 0) {
  nextCNY = nextCNY.add({ years: 1 });
}
console.log(
  `The next Chinese New Year is on ${nextCNY.withCalendar("iso8601").toLocaleString()}`,
);
```

## Đặc tả kỹ thuật

{{Specifications}}

## Tính tương thích với trình duyệt

{{Compat}}

## Xem thêm

- {{jsxref("Temporal")}}
- {{jsxref("Temporal.PlainDate")}}
- {{jsxref("Temporal.PlainYearMonth")}}
