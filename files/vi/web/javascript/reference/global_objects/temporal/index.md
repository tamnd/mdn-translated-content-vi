---
title: Temporal
slug: Web/JavaScript/Reference/Global_Objects/Temporal
page-type: javascript-namespace
browser-compat: javascript.builtins.Temporal
sidebar: jsref
---

Đối tượng **`Temporal`** cho phép quản lý ngày và giờ trong nhiều tình huống khác nhau, bao gồm biểu diễn múi giờ và lịch tích hợp sẵn, chuyển đổi giờ thực, số học, định dạng và nhiều hơn nữa. Nó được thiết kế như một sự thay thế hoàn toàn cho đối tượng {{jsxref("Date")}}.

## Mô tả

Không giống như hầu hết các đối tượng toàn cục, `Temporal` không phải là một constructor. Bạn không thể sử dụng nó với [toán tử `new`](/en-US/docs/Web/JavaScript/Reference/Operators/new) hay gọi đối tượng `Temporal` như một hàm. Tất cả các thuộc tính và phương thức của `Temporal` đều là static (giống như đối tượng {{jsxref("Math")}}).

`Temporal` có một API phức tạp và mạnh mẽ. Nó cung cấp hơn 200 phương thức tiện ích thông qua một số lớp, vì vậy nó có vẻ rất phức tạp. Chúng ta sẽ cung cấp tổng quan cấp cao về cách các API này liên quan đến nhau.

### Nền tảng và khái niệm

JavaScript có đối tượng {{jsxref("Date")}} để xử lý ngày và giờ từ những ngày đầu. Tuy nhiên, API `Date` dựa trên lớp `java.util.Date` được thiết kế kém từ Java, lớp này đã được thay thế vào đầu những năm 2010; nhưng, do mục tiêu tương thích ngược của JavaScript, `Date` vẫn tồn tại trong ngôn ngữ.

Bài học quan trọng để mở đầu toàn bộ phần giới thiệu là **xử lý ngày tháng là phức tạp**. Hầu hết các vấn đề của `Date` đều có thể được khắc phục bằng cách thêm nhiều phương thức hơn, nhưng một lỗi thiết kế cơ bản vẫn còn đó: nó cung cấp quá nhiều phương thức trên cùng một đối tượng khiến các nhà phát triển thường bị nhầm lẫn về cách sử dụng, dẫn đến những cạm bẫy bất ngờ. Một API được thiết kế tốt không chỉ cần làm được nhiều hơn, mà còn nên làm _ít hơn_ với mỗi mức độ trừu tượng, bởi vì ngăn chặn sử dụng sai cũng quan trọng như cho phép các trường hợp sử dụng.

Đối tượng `Date` đồng thời đóng hai vai trò:

- Như một [timestamp](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Date#the_epoch_timestamps_and_invalid_date): số mili giây hoặc nano giây đã trôi qua kể từ một điểm thời gian cố định (được gọi là _epoch_).
- Như một tổ hợp [các thành phần](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Date#date_components_and_time_zones): năm, tháng, ngày, giờ, phút, giây, mili giây và nano giây. Các định danh năm, tháng và ngày chỉ có ý nghĩa khi tham chiếu đến một _hệ thống lịch_. Toàn bộ tổ hợp ánh xạ đến một thời điểm duy nhất trong lịch sử khi kết hợp với múi giờ. Đối tượng `Date` cung cấp các phương thức để đọc và sửa đổi các thành phần này.

[Múi giờ](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Temporal/ZonedDateTime#time_zones_and_offsets) là nguyên nhân của nhiều lỗi liên quan đến ngày tháng. Khi tương tác với `Date` thông qua mô hình "tổ hợp các thành phần", thời gian chỉ có thể ở một trong hai múi giờ: UTC và địa phương (thiết bị), và không có cách nào để chỉ định một múi giờ tùy ý. Cũng thiếu đi khái niệm "không có múi giờ": đây được gọi là _ngày theo lịch_ (đối với ngày) hoặc _giờ đồng hồ_ (đối với giờ), là thời gian bạn "đọc từ lịch hoặc đồng hồ". Ví dụ, nếu bạn đang đặt báo thức thức dậy hàng ngày, bạn sẽ muốn đặt nó lúc "8:00 SA" bất kể có phải giờ tiết kiệm ánh sáng ban ngày hay không, hay bạn có đi đến múi giờ khác hay không.

Một tính năng khác thiếu trong `Date` là [hệ thống lịch](#calendars). Hầu hết mọi người có thể quen với lịch Gregorian, nơi có hai kỷ nguyên, BC và AD; có 12 tháng; mỗi tháng có số ngày khác nhau; cứ 4 năm là một năm nhuận; và vân vân. Tuy nhiên, một số khái niệm này có thể không áp dụng được khi bạn làm việc với một hệ thống lịch khác, chẳng hạn như lịch Hebrew, lịch Trung Quốc, lịch Nhật Bản, v.v. Với `Date`, bạn chỉ có thể làm việc với mô hình lịch Gregorian.

Còn nhiều di sản không mong muốn khác về `Date`, chẳng hạn như tất cả các setter đều là mutating (điều này thường gây ra các tác dụng phụ không mong muốn), [định dạng chuỗi ngày giờ](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Date#date_time_string_format) không thể phân tích cú pháp theo cách nhất quán, v.v. Cuối cùng, giải pháp tốt nhất là xây dựng một API mới từ đầu, đó chính là `Temporal`.

### Tổng quan về API

`Temporal` là một namespace, giống như {{jsxref("Intl")}}. Nó chứa một số lớp và namespace, mỗi lớp được thiết kế để xử lý một khía cạnh cụ thể của quản lý ngày và giờ. Các lớp có thể được nhóm như sau:

- Biểu diễn một khoảng thời gian (sự khác biệt giữa hai điểm thời gian): {{jsxref("Temporal.Duration")}}
- Biểu diễn một điểm thời gian:
  - Biểu diễn một thời điểm duy nhất trong lịch sử:
    - Như một timestamp: {{jsxref("Temporal.Instant")}}
    - Như một tổ hợp thành phần ngày-giờ được ghép với một múi giờ: {{jsxref("Temporal.ZonedDateTime")}}
  - Biểu diễn ngày/giờ không có múi giờ (đều có tiền tố "Plain"):
    - Ngày (năm, tháng, ngày) + giờ (giờ, phút, giây, mili giây, micro giây, nano giây): {{jsxref("Temporal.PlainDateTime")}} (Lưu ý: `ZonedDateTime` tương đương với `PlainDateTime` cộng với một múi giờ)
      - Ngày (năm, tháng, ngày): {{jsxref("Temporal.PlainDate")}}
        - Năm, tháng: {{jsxref("Temporal.PlainYearMonth")}}
        - Tháng, ngày: {{jsxref("Temporal.PlainMonthDay")}}
      - Giờ (giờ, phút, giây, mili giây, micro giây, nano giây): {{jsxref("Temporal.PlainTime")}}

Ngoài ra, còn có một namespace tiện ích khác, {{jsxref("Temporal.Now")}}, cung cấp các phương thức để lấy thời gian hiện tại ở nhiều định dạng khác nhau.

### Giao diện lớp chung

Có nhiều lớp trong namespace `Temporal`, nhưng chúng có nhiều phương thức tương tự nhau. Bảng sau đây liệt kê tất cả các phương thức của mỗi lớp (ngoại trừ [phương thức chuyển đổi](#conversion_between_classes)):

<table>
<thead>
<tr>
<td></td>
<th><code>Instant</code></th>
<th><code>ZonedDateTime</code></th>
<th><code>PlainDateTime</code></th>
<th><code>PlainDate</code></th>
<th><code>PlainTime</code></th>
<th><code>PlainYearMonth</code></th>
<th><code>PlainMonthDay</code></th>
</tr>
</thead>
<tbody>
<tr>
<th>Khởi tạo</th>
<td>{{jsxref("Temporal/Instant/Instant", "Instant()")}}<br>{{jsxref("Temporal/Instant/from", "Instant.from()")}}<br>{{jsxref("Temporal/Instant/fromEpochMilliseconds", "Instant.fromEpochMilliseconds()")}}<br>{{jsxref("Temporal/Instant/fromEpochNanoseconds", "Instant.fromEpochNanoseconds()")}}</td>
<td>{{jsxref("Temporal/ZonedDateTime/ZonedDateTime", "ZonedDateTime()")}}<br>{{jsxref("Temporal/ZonedDateTime/from", "ZonedDateTime.from()")}}</td>
<td>{{jsxref("Temporal/PlainDateTime/PlainDateTime", "PlainDateTime()")}}<br>{{jsxref("Temporal/PlainDateTime/from", "PlainDateTime.from()")}}</td>
<td>{{jsxref("Temporal/PlainDate/PlainDate", "PlainDate()")}}<br>{{jsxref("Temporal/PlainDate/from", "PlainDate.from()")}}</td>
<td>{{jsxref("Temporal/PlainTime/PlainTime", "PlainTime()")}}<br>{{jsxref("Temporal/PlainTime/from", "PlainTime.from()")}}</td>
<td>{{jsxref("Temporal/PlainYearMonth/PlainYearMonth", "PlainYearMonth()")}}<br>{{jsxref("Temporal/PlainYearMonth/from", "PlainYearMonth.from()")}}</td>
<td>{{jsxref("Temporal/PlainMonthDay/PlainMonthDay", "PlainMonthDay()")}}<br>{{jsxref("Temporal/PlainMonthDay/from", "PlainMonthDay.from()")}}</td>
</tr>
<tr>
<th>Cập nhật</th>
<td>N/A</td>
<td>{{jsxref("Temporal/ZonedDateTime/with", "with()")}}<br>{{jsxref("Temporal/ZonedDateTime/withCalendar", "withCalendar()")}}<br>{{jsxref("Temporal/ZonedDateTime/withTimeZone", "withTimeZone()")}}<br>{{jsxref("Temporal/ZonedDateTime/withPlainTime", "withPlainTime()")}}</td>
<td>{{jsxref("Temporal/PlainDateTime/with", "with()")}}<br>{{jsxref("Temporal/PlainDateTime/withCalendar", "withCalendar()")}}<br>{{jsxref("Temporal/PlainDateTime/withPlainTime", "withPlainTime()")}}</td>
<td>{{jsxref("Temporal/PlainDate/with", "with()")}}<br>{{jsxref("Temporal/PlainDate/withCalendar", "withCalendar()")}}</td>
<td>{{jsxref("Temporal/PlainTime/with", "with()")}}</td>
<td>{{jsxref("Temporal/PlainYearMonth/with", "with()")}}</td>
<td>{{jsxref("Temporal/PlainMonthDay/with", "with()")}}</td>
</tr>
<tr>
<th>Số học</th>
<td>{{jsxref("Temporal/Instant/add", "add()")}}<br>{{jsxref("Temporal/Instant/subtract", "subtract()")}}<br>{{jsxref("Temporal/Instant/since", "since()")}}<br>{{jsxref("Temporal/Instant/until", "until()")}}</td>
<td>{{jsxref("Temporal/ZonedDateTime/add", "add()")}}<br>{{jsxref("Temporal/ZonedDateTime/subtract", "subtract()")}}<br>{{jsxref("Temporal/ZonedDateTime/since", "since()")}}<br>{{jsxref("Temporal/ZonedDateTime/until", "until()")}}</td>
<td>{{jsxref("Temporal/PlainDateTime/add", "add()")}}<br>{{jsxref("Temporal/PlainDateTime/subtract", "subtract()")}}<br>{{jsxref("Temporal/PlainDateTime/since", "since()")}}<br>{{jsxref("Temporal/PlainDateTime/until", "until()")}}</td>
<td>{{jsxref("Temporal/PlainDate/add", "add()")}}<br>{{jsxref("Temporal/PlainDate/subtract", "subtract()")}}<br>{{jsxref("Temporal/PlainDate/since", "since()")}}<br>{{jsxref("Temporal/PlainDate/until", "until()")}}</td>
<td>{{jsxref("Temporal/PlainTime/add", "add()")}}<br>{{jsxref("Temporal/PlainTime/subtract", "subtract()")}}<br>{{jsxref("Temporal/PlainTime/since", "since()")}}<br>{{jsxref("Temporal/PlainTime/until", "until()")}}</td>
<td>{{jsxref("Temporal/PlainYearMonth/add", "add()")}}<br>{{jsxref("Temporal/PlainYearMonth/subtract", "subtract()")}}<br>{{jsxref("Temporal/PlainYearMonth/since", "since()")}}<br>{{jsxref("Temporal/PlainYearMonth/until", "until()")}}</td>
<td>N/A</td>
</tr>
<tr>
<th>Làm tròn</th>
<td>{{jsxref("Temporal/Instant/round", "round()")}}</td>
<td>{{jsxref("Temporal/ZonedDateTime/round", "round()")}}</td>
<td>{{jsxref("Temporal/PlainDateTime/round", "round()")}}</td>
<td>N/A</td>
<td>{{jsxref("Temporal/PlainTime/round", "round()")}}</td>
<td>N/A</td>
<td>N/A</td>
</tr>
<tr>
<th>So sánh</th>
<td>{{jsxref("Temporal/Instant/equals", "equals()")}}<br>{{jsxref("Temporal/Instant/compare", "Instant.compare()")}}</td>
<td>{{jsxref("Temporal/ZonedDateTime/equals", "equals()")}}<br>{{jsxref("Temporal/ZonedDateTime/compare", "ZonedDateTime.compare()")}}</td>
<td>{{jsxref("Temporal/PlainDateTime/equals", "equals()")}}<br>{{jsxref("Temporal/PlainDateTime/compare", "PlainDateTime.compare()")}}</td>
<td>{{jsxref("Temporal/PlainDate/equals", "equals()")}}<br>{{jsxref("Temporal/PlainDate/compare", "PlainDate.compare()")}}</td>
<td>{{jsxref("Temporal/PlainTime/equals", "equals()")}}<br>{{jsxref("Temporal/PlainTime/compare", "PlainTime.compare()")}}</td>
<td>{{jsxref("Temporal/PlainYearMonth/equals", "equals()")}}<br>{{jsxref("Temporal/PlainYearMonth/compare", "PlainYearMonth.compare()")}}</td>
<td>{{jsxref("Temporal/PlainMonthDay/equals", "equals()")}}</td>
</tr>
<tr>
<th>Tuần tự hóa</th>
<td>{{jsxref("Temporal/Instant/toJSON", "toJSON()")}}<br>{{jsxref("Temporal/Instant/toLocaleString", "toLocaleString()")}}<br>{{jsxref("Temporal/Instant/toString", "toString()")}}<br>{{jsxref("Temporal/Instant/valueOf", "valueOf()")}}</td>
<td>{{jsxref("Temporal/ZonedDateTime/toJSON", "toJSON()")}}<br>{{jsxref("Temporal/ZonedDateTime/toLocaleString", "toLocaleString()")}}<br>{{jsxref("Temporal/ZonedDateTime/toString", "toString()")}}<br>{{jsxref("Temporal/ZonedDateTime/valueOf", "valueOf()")}}</td>
<td>{{jsxref("Temporal/PlainDateTime/toJSON", "toJSON()")}}<br>{{jsxref("Temporal/PlainDateTime/toLocaleString", "toLocaleString()")}}<br>{{jsxref("Temporal/PlainDateTime/toString", "toString()")}}<br>{{jsxref("Temporal/PlainDateTime/valueOf", "valueOf()")}}</td>
<td>{{jsxref("Temporal/PlainDate/toJSON", "toJSON()")}}<br>{{jsxref("Temporal/PlainDate/toLocaleString", "toLocaleString()")}}<br>{{jsxref("Temporal/PlainDate/toString", "toString()")}}<br>{{jsxref("Temporal/PlainDate/valueOf", "valueOf()")}}</td>
<td>{{jsxref("Temporal/PlainTime/toJSON", "toJSON()")}}<br>{{jsxref("Temporal/PlainTime/toLocaleString", "toLocaleString()")}}<br>{{jsxref("Temporal/PlainTime/toString", "toString()")}}<br>{{jsxref("Temporal/PlainTime/valueOf", "valueOf()")}}</td>
<td>{{jsxref("Temporal/PlainYearMonth/toJSON", "toJSON()")}}<br>{{jsxref("Temporal/PlainYearMonth/toLocaleString", "toLocaleString()")}}<br>{{jsxref("Temporal/PlainYearMonth/toString", "toString()")}}<br>{{jsxref("Temporal/PlainYearMonth/valueOf", "valueOf()")}}</td>
<td>{{jsxref("Temporal/PlainMonthDay/toJSON", "toJSON()")}}<br>{{jsxref("Temporal/PlainMonthDay/toLocaleString", "toLocaleString()")}}<br>{{jsxref("Temporal/PlainMonthDay/toString", "toString()")}}<br>{{jsxref("Temporal/PlainMonthDay/valueOf", "valueOf()")}}</td>
</tr>
</tbody>
</table>

Bảng sau đây tóm tắt những thuộc tính nào có sẵn trên mỗi lớp, giúp bạn có cảm giác về thông tin mà mỗi lớp có thể biểu diễn.

<table>
<thead>
<tr>
<td></td>
<th><code>Instant</code></th>
<th><code>ZonedDateTime</code></th>
<th><code>PlainDateTime</code></th>
<th><code>PlainDate</code></th>
<th><code>PlainTime</code></th>
<th><code>PlainYearMonth</code></th>
<th><code>PlainMonthDay</code></th>
</tr>
</thead>
<tbody>
<tr>
<th>Lịch</th>
<td>N/A</td>
<td>{{jsxref("Temporal/ZonedDateTime/calendarId", "calendarId")}}</td>
<td>{{jsxref("Temporal/PlainDateTime/calendarId", "calendarId")}}</td>
<td>{{jsxref("Temporal/PlainDate/calendarId", "calendarId")}}</td>
<td>N/A</td>
<td>{{jsxref("Temporal/PlainYearMonth/calendarId", "calendarId")}}</td>
<td>{{jsxref("Temporal/PlainMonthDay/calendarId", "calendarId")}}</td>
</tr>
<tr>
<th>Liên quan đến năm</th>
<td>N/A</td>
<td>{{jsxref("Temporal/ZonedDateTime/era", "era")}}<br>{{jsxref("Temporal/ZonedDateTime/eraYear", "eraYear")}}<br>{{jsxref("Temporal/ZonedDateTime/year", "year")}}<br>{{jsxref("Temporal/ZonedDateTime/inLeapYear", "inLeapYear")}}<br>{{jsxref("Temporal/ZonedDateTime/monthsInYear", "monthsInYear")}}<br>{{jsxref("Temporal/ZonedDateTime/daysInYear", "daysInYear")}}</td>
<td>{{jsxref("Temporal/PlainDateTime/era", "era")}}<br>{{jsxref("Temporal/PlainDateTime/eraYear", "eraYear")}}<br>{{jsxref("Temporal/PlainDateTime/year", "year")}}<br>{{jsxref("Temporal/PlainDateTime/inLeapYear", "inLeapYear")}}<br>{{jsxref("Temporal/PlainDateTime/monthsInYear", "monthsInYear")}}<br>{{jsxref("Temporal/PlainDateTime/daysInYear", "daysInYear")}}</td>
<td>{{jsxref("Temporal/PlainDate/era", "era")}}<br>{{jsxref("Temporal/PlainDate/eraYear", "eraYear")}}<br>{{jsxref("Temporal/PlainDate/year", "year")}}<br>{{jsxref("Temporal/PlainDate/inLeapYear", "inLeapYear")}}<br>{{jsxref("Temporal/PlainDate/monthsInYear", "monthsInYear")}}<br>{{jsxref("Temporal/PlainDate/daysInYear", "daysInYear")}}</td>
<td>N/A</td>
<td>{{jsxref("Temporal/PlainYearMonth/era", "era")}}<br>{{jsxref("Temporal/PlainYearMonth/eraYear", "eraYear")}}<br>{{jsxref("Temporal/PlainYearMonth/year", "year")}}<br>{{jsxref("Temporal/PlainYearMonth/inLeapYear", "inLeapYear")}}<br>{{jsxref("Temporal/PlainYearMonth/monthsInYear", "monthsInYear")}}<br>{{jsxref("Temporal/PlainYearMonth/daysInYear", "daysInYear")}}</td>
<td>N/A</td>
</tr>
<tr>
<th>Liên quan đến tháng</th>
<td>N/A</td>
<td>{{jsxref("Temporal/ZonedDateTime/month", "month")}}<br>{{jsxref("Temporal/ZonedDateTime/monthCode", "monthCode")}}<br>{{jsxref("Temporal/ZonedDateTime/daysInMonth", "daysInMonth")}}</td>
<td>{{jsxref("Temporal/PlainDateTime/month", "month")}}<br>{{jsxref("Temporal/PlainDateTime/monthCode", "monthCode")}}<br>{{jsxref("Temporal/PlainDateTime/daysInMonth", "daysInMonth")}}</td>
<td>{{jsxref("Temporal/PlainDate/month", "month")}}<br>{{jsxref("Temporal/PlainDate/monthCode", "monthCode")}}<br>{{jsxref("Temporal/PlainDate/daysInMonth", "daysInMonth")}}</td>
<td>N/A</td>
<td>{{jsxref("Temporal/PlainYearMonth/month", "month")}}<br>{{jsxref("Temporal/PlainYearMonth/monthCode", "monthCode")}}<br>{{jsxref("Temporal/PlainYearMonth/daysInMonth", "daysInMonth")}}</td>
<td>{{jsxref("Temporal/PlainMonthDay/monthCode", "monthCode")}}</td>
</tr>
<tr>
<th>Liên quan đến tuần</th>
<td>N/A</td>
<td>{{jsxref("Temporal/ZonedDateTime/weekOfYear", "weekOfYear")}}<br>{{jsxref("Temporal/ZonedDateTime/yearOfWeek", "yearOfWeek")}}<br>{{jsxref("Temporal/ZonedDateTime/daysInWeek", "daysInWeek")}}</td>
<td>{{jsxref("Temporal/PlainDateTime/weekOfYear", "weekOfYear")}}<br>{{jsxref("Temporal/PlainDateTime/yearOfWeek", "yearOfWeek")}}<br>{{jsxref("Temporal/PlainDateTime/daysInWeek", "daysInWeek")}}</td>
<td>{{jsxref("Temporal/PlainDate/weekOfYear", "weekOfYear")}}<br>{{jsxref("Temporal/PlainDate/yearOfWeek", "yearOfWeek")}}<br>{{jsxref("Temporal/PlainDate/daysInWeek", "daysInWeek")}}</td>
<td>N/A</td>
<td>N/A</td>
<td>N/A</td>
</tr>
<tr>
<th>Liên quan đến ngày</th>
<td>N/A</td>
<td>{{jsxref("Temporal/ZonedDateTime/day", "day")}}<br>{{jsxref("Temporal/ZonedDateTime/dayOfWeek", "dayOfWeek")}}<br>{{jsxref("Temporal/ZonedDateTime/dayOfYear", "dayOfYear")}}</td>
<td>{{jsxref("Temporal/PlainDateTime/day", "day")}}<br>{{jsxref("Temporal/PlainDateTime/dayOfWeek", "dayOfWeek")}}<br>{{jsxref("Temporal/PlainDateTime/dayOfYear", "dayOfYear")}}</td>
<td>{{jsxref("Temporal/PlainDate/day", "day")}}<br>{{jsxref("Temporal/PlainDate/dayOfWeek", "dayOfWeek")}}<br>{{jsxref("Temporal/PlainDate/dayOfYear", "dayOfYear")}}</td>
<td>N/A</td>
<td>N/A</td>
<td>{{jsxref("Temporal/PlainMonthDay/day", "day")}}</td>
</tr>
<tr>
<th>Thành phần giờ</th>
<td>N/A</td>
<td>{{jsxref("Temporal/ZonedDateTime/hour", "hour")}}<br>{{jsxref("Temporal/ZonedDateTime/minute", "minute")}}<br>{{jsxref("Temporal/ZonedDateTime/second", "second")}}<br>{{jsxref("Temporal/ZonedDateTime/millisecond", "millisecond")}}<br>{{jsxref("Temporal/ZonedDateTime/microsecond", "microsecond")}}<br>{{jsxref("Temporal/ZonedDateTime/nanosecond", "nanosecond")}}</td>
<td>{{jsxref("Temporal/PlainDateTime/hour", "hour")}}<br>{{jsxref("Temporal/PlainDateTime/minute", "minute")}}<br>{{jsxref("Temporal/PlainDateTime/second", "second")}}<br>{{jsxref("Temporal/PlainDateTime/millisecond", "millisecond")}}<br>{{jsxref("Temporal/PlainDateTime/microsecond", "microsecond")}}<br>{{jsxref("Temporal/PlainDateTime/nanosecond", "nanosecond")}}</td>
<td>N/A</td>
<td>{{jsxref("Temporal/PlainTime/hour", "hour")}}<br>{{jsxref("Temporal/PlainTime/minute", "minute")}}<br>{{jsxref("Temporal/PlainTime/second", "second")}}<br>{{jsxref("Temporal/PlainTime/millisecond", "millisecond")}}<br>{{jsxref("Temporal/PlainTime/microsecond", "microsecond")}}<br>{{jsxref("Temporal/PlainTime/nanosecond", "nanosecond")}}</td>
<td>N/A</td>
<td>N/A</td>
</tr>
<tr>
<th>Múi giờ</th>
<td>N/A</td>
<td>{{jsxref("Temporal/ZonedDateTime/timeZoneId", "timeZoneId")}}<br>{{jsxref("Temporal/ZonedDateTime/offset", "offset")}}<br>{{jsxref("Temporal/ZonedDateTime/offsetNanoseconds", "offsetNanoseconds")}}<br>{{jsxref("Temporal/ZonedDateTime/hoursInDay", "hoursInDay")}}<br>{{jsxref("Temporal/ZonedDateTime/getTimeZoneTransition", "getTimeZoneTransition()")}}<br>{{jsxref("Temporal/ZonedDateTime/startOfDay", "startOfDay()")}}</td>
<td>N/A</td>
<td>N/A</td>
<td>N/A</td>
<td>N/A</td>
<td>N/A</td>
</tr>
<tr>
<th>Thời gian epoch</th>
<td>{{jsxref("Temporal/Instant/epochMilliseconds", "epochMilliseconds")}}<br>{{jsxref("Temporal/Instant/epochNanoseconds", "epochNanoseconds")}}</td>
<td>{{jsxref("Temporal/ZonedDateTime/epochMilliseconds", "epochMilliseconds")}}<br>{{jsxref("Temporal/ZonedDateTime/epochNanoseconds", "epochNanoseconds")}}</td>
<td>N/A</td>
<td>N/A</td>
<td>N/A</td>
<td>N/A</td>
<td>N/A</td>
</tr>
</tbody>
</table>

### Chuyển đổi giữa các lớp

Bảng dưới đây tóm tắt tất cả các phương thức chuyển đổi tồn tại trên mỗi lớp.

<table>
<tbody>
<tr>
<td rowspan="2" colspan="2"></td>
<td colspan="7">Cách chuyển đổi từ...</td>
</tr>
<tr>
<th><code>Instant</code></th>
<th><code>ZonedDateTime</code></th>
<th><code>PlainDateTime</code></th>
<th><code>PlainDate</code></th>
<th><code>PlainTime</code></th>
<th><code>PlainYearMonth</code></th>
<th><code>PlainMonthDay</code></th>
</tr>
<tr><td rowspan="7">sang...</td><th><code>Instant</code></th><td>/</td><td>{{jsxref("Temporal/ZonedDateTime/toInstant", "toInstant()")}}</td><td colspan="5">Chuyển đổi sang <code>ZonedDateTime</code> trước</td></tr>
<tr><th><code>ZonedDateTime</code></th><td>{{jsxref("Temporal/Instant/toZonedDateTimeISO", "toZonedDateTimeISO()")}}</td><td>/</td><td>{{jsxref("Temporal/PlainDateTime/toZonedDateTime", "toZonedDateTime()")}}</td><td>{{jsxref("Temporal/PlainDate/toZonedDateTime", "toZonedDateTime()")}}</td><td>{{jsxref("Temporal/PlainDate/toZonedDateTime", "PlainDate#toZonedDateTime()")}} (truyền như tham số)</td><td rowspan="2" colspan="2">Chuyển đổi sang <code>PlainDate</code> trước</td></tr>
<tr><th><code>PlainDateTime</code></th><td rowspan="5">Chuyển đổi sang <code>ZonedDateTime</code> trước</td><td>{{jsxref("Temporal/ZonedDateTime/toPlainDateTime", "toPlainDateTime()")}}</td><td>/</td><td>{{jsxref("Temporal/PlainDate/toPlainDateTime", "toPlainDateTime()")}}</td><td>{{jsxref("Temporal/PlainDate/toPlainDateTime", "PlainDate#toPlainDateTime()")}} (truyền như tham số)</td></tr>
<tr><th><code>PlainDate</code></th><td>{{jsxref("Temporal/ZonedDateTime/toPlainDate", "toPlainDate()")}}</td><td>{{jsxref("Temporal/PlainDateTime/toPlainDate", "toPlainDate()")}}</td><td>/</td><td>Không có thông tin chung</td><td>{{jsxref("Temporal/PlainYearMonth/toPlainDate", "toPlainDate()")}}</td><td>{{jsxref("Temporal/PlainMonthDay/toPlainDate", "toPlainDate()")}}</td></tr>
<tr><th><code>PlainTime</code></th><td>{{jsxref("Temporal/ZonedDateTime/toPlainTime", "toPlainTime()")}}</td><td>{{jsxref("Temporal/PlainDateTime/toPlainTime", "toPlainTime()")}}</td><td>Không có thông tin chung</td><td>/</td><td colspan="2">Không có thông tin chung</td></tr>
<tr><th><code>PlainYearMonth</code></th><td rowspan="2" colspan="2">Chuyển đổi sang <code>PlainDate</code> trước</td><td>{{jsxref("Temporal/PlainDate/toPlainYearMonth", "toPlainYearMonth()")}}</td><td rowspan="2">Không có thông tin chung</td><td>/</td><td>Chuyển đổi sang <code>PlainDate</code> trước</td></tr>
<tr><th><code>PlainMonthDay</code></th><td>{{jsxref("Temporal/PlainDate/toPlainMonthDay", "toPlainMonthDay()")}}</td><td>Chuyển đổi sang <code>PlainDate</code> trước</td><td>/</td></tr>
</tbody>
</table>

Với các bảng này, bạn sẽ có ý tưởng cơ bản về cách điều hướng API `Temporal`.

### Lịch

Lịch là một cách tổ chức các ngày, thường thành các khoảng tuần, tháng, năm và kỷ nguyên. Hầu hết thế giới sử dụng lịch Gregorian, nhưng có nhiều lịch khác đang được sử dụng, đặc biệt trong các bối cảnh tôn giáo và văn hóa. Theo mặc định, tất cả các đối tượng `Temporal` có nhận thức về lịch đều sử dụng hệ thống lịch ISO 8601, dựa trên lịch Gregorian và định nghĩa thêm các quy tắc đánh số tuần. [`Intl.supportedValuesOf()`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Intl/supportedValuesOf#supported_calendar_types) liệt kê hầu hết các lịch có thể được trình duyệt hỗ trợ. Ở đây chúng tôi cung cấp tổng quan ngắn gọn về cách hệ thống lịch được hình thành để giúp bạn nội tâm hóa những yếu tố nào có thể thay đổi giữa các lịch.

Có ba sự kiện tuần hoàn nổi bật trên Trái Đất: sự quay của nó quanh mặt trời (365,242 ngày cho một vòng quay), sự quay của mặt trăng quanh Trái Đất (29,53 ngày từ trăng non đến trăng non), và sự quay của nó quanh trục của mình (24 giờ từ bình minh đến bình minh). Mọi nền văn hóa đều có cùng độ đo "ngày", là 24 giờ. Những thay đổi thỉnh thoảng như giờ tiết kiệm ánh sáng ban ngày không phải là một phần của lịch, mà là một phần của thông tin [múi giờ](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Temporal/ZonedDateTime#time_zones_and_offsets).

- Một số lịch chủ yếu định nghĩa một năm là trung bình 365,242 ngày, bằng cách định nghĩa các năm có 365 ngày và thêm một ngày bổ sung, _ngày nhuận_, khoảng mỗi 4 năm. Sau đó, năm có thể được chia thêm thành các phần gọi là tháng. Những lịch này được gọi là _lịch dương_. Lịch Gregorian và lịch Hijri Mặt trời là lịch dương.
- Một số lịch chủ yếu định nghĩa một tháng là trung bình 29,5 ngày, bằng cách định nghĩa các tháng xen kẽ 29 và 30 ngày. Sau đó, 12 tháng có thể được nhóm thành một năm 354 ngày. Những lịch này được gọi là _lịch âm_. Lịch Hồi giáo là một lịch âm. Bởi vì năm âm lịch là nhân tạo và không tương quan với chu kỳ mùa, lịch âm nói chung hiếm hơn.
- Một số lịch cũng chủ yếu định nghĩa các tháng dựa trên chu kỳ mặt trăng, như lịch âm. Sau đó, để bù cho sự chênh lệch 11 ngày với năm dương, một tháng bổ sung, _tháng nhuận_, được thêm vào khoảng mỗi 3 năm. Những lịch này được gọi là _lịch âm dương_. Lịch Hebrew và lịch Trung Quốc là lịch âm dương.

Trong `Temporal`, mỗi ngày dưới một hệ thống lịch được xác định duy nhất bởi ba thành phần: `year`, `month` và `day`. Trong khi `year` thường là một số nguyên dương, nó cũng có thể bằng không hoặc âm, và tăng đơn điệu theo thời gian. Năm `1` (hoặc `0`, nếu tồn tại) được gọi là epoch của lịch, và là tùy ý đối với mỗi lịch. `month` là một số nguyên dương tăng thêm 1 mỗi lần, bắt đầu từ `1` và kết thúc ở `date.monthsInYear`, sau đó đặt lại về `1` khi năm tiến. `day` cũng là một số nguyên dương, nhưng nó có thể không bắt đầu từ 1 hoặc tăng thêm 1 mỗi lần, vì những thay đổi chính trị có thể khiến các ngày bị bỏ qua hoặc lặp lại. Nhưng nói chung, `day` tăng đơn điệu và đặt lại khi tháng tiến.

Ngoài `year`, một năm cũng có thể được xác định duy nhất bởi sự kết hợp của `era` và `eraYear`, đối với các lịch sử dụng kỷ nguyên. Ví dụ, lịch Gregorian sử dụng kỷ nguyên "CE" (Công Nguyên) và "BCE" (Trước Công Nguyên), và năm `-1` giống như `{ era: "bce", eraYear: 2 }` (lưu ý rằng năm `0` luôn tồn tại đối với tất cả các lịch; đối với lịch Gregorian, nó tương ứng với 1 BCE theo [đánh số năm thiên văn](https://en.wikipedia.org/wiki/Astronomical_year_numbering)). `era` là một chuỗi viết thường, và `eraYear` là một số nguyên tùy ý có thể bằng không hoặc âm, hoặc thậm chí giảm theo thời gian (thường là đối với kỷ nguyên cũ nhất).

> [!NOTE]
> Luôn sử dụng `era` và `eraYear` theo cặp; đừng sử dụng một thuộc tính mà không sử dụng thuộc tính kia. Ngoài ra, để tránh xung đột, đừng kết hợp `year` và `era`/`eraYear` khi chỉ định một năm. Chọn một biểu diễn năm và sử dụng nó nhất quán.
>
> Hãy cẩn thận với các giả định sai sau về năm:
>
> - Đừng giả định rằng `era` và `eraYear` luôn có mặt; chúng có thể là `undefined`.
> - Đừng giả định rằng `era` là một chuỗi thân thiện với người dùng; hãy sử dụng `toLocaleString()` để định dạng ngày của bạn thay thế.
> - Đừng giả định rằng hai giá trị `year` từ các lịch khác nhau có thể so sánh được; hãy sử dụng phương thức static `compare()` thay thế.
> - Đừng giả định rằng các năm có 365/366 ngày và 12 tháng; hãy sử dụng `daysInYear` và `monthsInYear` thay thế.
> - Đừng giả định rằng năm nhuận (`inLeapYear` là `true`) có thêm một ngày; chúng có thể có thêm một tháng.

Ngoài `month`, một tháng trong năm cũng có thể được xác định duy nhất bởi `monthCode`. `monthCode` thường ánh xạ đến tên của tháng, nhưng `month` thì không. Ví dụ, trong trường hợp lịch âm dương, hai tháng có cùng `monthCode`, một thuộc về năm nhuận và một thì không, sẽ có các giá trị `month` khác nhau nếu chúng đến sau tháng nhuận, do việc chèn thêm một tháng.

> [!NOTE]
> Để tránh xung đột, đừng kết hợp `month` và `monthCode` khi chỉ định một tháng. Chọn một biểu diễn tháng và sử dụng nó nhất quán. `month` hữu ích hơn nếu bạn cần thứ tự của các tháng trong một năm (ví dụ: khi lặp qua các tháng), trong khi `monthCode` hữu ích hơn nếu bạn cần tên của tháng (ví dụ: khi lưu trữ sinh nhật).
>
> Hãy cẩn thận với các giả định sai sau về tháng:
>
> - Đừng giả định rằng `monthCode` và `month` luôn tương ứng.
> - Đừng giả định số ngày trong một tháng; hãy sử dụng `daysInMonth` thay thế.
> - Đừng giả định rằng `monthCode` là một chuỗi thân thiện với người dùng; hãy sử dụng `toLocaleString()` để định dạng ngày của bạn thay thế.
> - Nói chung, đừng lưu tên các tháng vào một mảng hoặc đối tượng. Mặc dù `monthCode` thường ánh xạ đến tên tháng trong một lịch, chúng tôi khuyên bạn luôn tính toán tên tháng bằng cách sử dụng, ví dụ, `date.toLocaleString("en-US", { calendar: date.calendarId, month: "long" })`.

Ngoài `day` (là một chỉ số dựa trên tháng), một ngày trong năm cũng có thể được xác định duy nhất bởi `dayOfYear`. `dayOfYear` là một số nguyên dương tăng thêm 1 mỗi lần, bắt đầu từ `1` và kết thúc ở `date.daysInYear`.

Khái niệm "tuần" không liên quan đến bất kỳ sự kiện thiên văn nào, mà là một cấu trúc văn hóa. Trong khi độ dài phổ biến nhất là `7` ngày, các tuần cũng có thể có 4, 5, 6, 8 hoặc nhiều ngày hơn — hoặc thậm chí thiếu một số ngày cố định hoàn toàn. Để lấy số ngày cụ thể của tuần của một ngày, hãy sử dụng `daysInWeek` của ngày. `Temporal` xác định các tuần theo sự kết hợp của `weekOfYear` và `yearOfWeek`. `weekOfYear` là một số nguyên dương tăng thêm 1 mỗi lần, bắt đầu từ `1`, sau đó đặt lại về `1` khi năm tiến. `yearOfWeek` nhìn chung giống như `year`, nhưng có thể khác vào đầu hoặc cuối mỗi năm, bởi vì một tuần có thể trải dài hai năm, và `yearOfWeek` chọn một trong hai năm dựa trên các quy tắc của lịch.

> [!NOTE]
> Luôn sử dụng `weekOfYear` và `yearOfWeek` theo cặp; đừng sử dụng `weekOfYear` và `year`.
>
> Hãy cẩn thận với các giả định sai sau về tuần:
>
> - Đừng giả định rằng `weekOfYear` và `yearOfWeek` luôn có mặt; chúng có thể là `undefined`.
> - Đừng giả định rằng các tuần luôn dài 7 ngày; hãy sử dụng `daysInWeek` thay thế.
> - Lưu ý rằng API `Temporal` hiện tại không hỗ trợ ngày theo tuần-năm, vì vậy bạn không thể xây dựng các ngày bằng các thuộc tính này hoặc tuần tự hóa các ngày sang biểu diễn tuần-năm. Chúng chỉ là các thuộc tính thông tin.

### Định dạng RFC 9557

Tất cả các lớp `Temporal` có thể được tuần tự hóa và giải tuần tự hóa bằng định dạng được chỉ định trong [RFC 9557](https://datatracker.ietf.org/doc/html/rfc9557), dựa trên [ISO 8601 / RFC 3339](https://datatracker.ietf.org/doc/html/rfc3339). Định dạng, ở dạng đầy đủ, như sau (khoảng trắng chỉ để dễ đọc và không nên có mặt trong chuỗi thực tế):

```plain
YYYY-MM-DD T HH:mm:ss.sssssssss Z/±HH:mm [time_zone_id] [u-ca=calendar_id]
```

Các lớp khác nhau có các yêu cầu khác nhau về sự hiện diện của mỗi thành phần, vì vậy bạn sẽ tìm thấy một phần có tiêu đề "Định dạng RFC 9557" trong tài liệu của mỗi lớp, chỉ định định dạng được lớp đó nhận dạng.

Điều này rất giống với [định dạng chuỗi ngày giờ](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Date#date_time_string_format) được sử dụng bởi {{jsxref("Date")}}, cũng dựa trên ISO 8601. Bổ sung chính là khả năng chỉ định thành phần micro và nano giây, và khả năng chỉ định múi giờ và hệ thống lịch.

### Ngày có thể biểu diễn

Tất cả các đối tượng `Temporal` biểu diễn một ngày theo lịch cụ thể đều áp đặt giới hạn tương tự trên phạm vi ngày có thể biểu diễn, đó là ±10<sup>8</sup> ngày (bao gồm) từ epoch Unix, hoặc phạm vi các khoảnh khắc từ `-271821-04-20T00:00:00` đến `+275760-09-13T00:00:00`. Đây là cùng phạm vi như [ngày hợp lệ](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Date#the_epoch_timestamps_and_invalid_date). Cụ thể hơn:

- {{jsxref("Temporal.Instant")}} và {{jsxref("Temporal.ZonedDateTime")}} áp dụng giới hạn này trực tiếp trên giá trị `epochNanoseconds` của chúng.
- {{jsxref("Temporal.PlainDateTime")}} diễn giải ngày-giờ theo múi giờ UTC và yêu cầu nó phải là ±(10<sup>8</sup> + 1) ngày (không bao gồm) từ epoch Unix, vì vậy phạm vi hợp lệ của nó là `-271821-04-19T00:00:00` đến `+275760-09-14T00:00:00`, không bao gồm. Điều này cho phép bất kỳ `ZonedDateTime` nào được chuyển đổi sang `PlainDateTime` bất kể độ lệch của nó.
- {{jsxref("Temporal.PlainDate")}} áp dụng cùng kiểm tra như `PlainDateTime` đối với buổi trưa (`12:00:00`) của ngày đó, vì vậy phạm vi hợp lệ của nó là `-271821-04-19` đến `+275760-09-13`. Điều này cho phép bất kỳ `PlainDateTime` nào được chuyển đổi sang `PlainDate` bất kể thời gian của nó, và ngược lại.
- {{jsxref("Temporal.PlainYearMonth")}} có phạm vi hợp lệ là `-271821-04` đến `+275760-09`. Điều này cho phép bất kỳ `PlainDate` nào được chuyển đổi sang `PlainYearMonth` bất kể ngày của nó (ngoại trừ nếu ngày đầu tiên của một tháng không ISO nằm trong tháng ISO `-271821-03`).

Các đối tượng `Temporal` sẽ từ chối xây dựng một thực thể biểu diễn ngày/giờ ngoài giới hạn này. Điều này bao gồm:

- Sử dụng constructor hoặc phương thức static `from()`.
- Sử dụng phương thức `with()` để cập nhật các trường lịch.
- Sử dụng `add()`, `subtract()`, `round()`, hoặc bất kỳ phương thức nào khác để suy ra các thực thể mới.

## Thuộc tính tĩnh

- {{jsxref("Temporal.Duration")}}
  - : Biểu diễn sự khác biệt giữa hai điểm thời gian, có thể được sử dụng trong số học ngày/giờ. Về cơ bản, nó được biểu diễn như là tổ hợp các giá trị năm, tháng, tuần, ngày, giờ, phút, giây, mili giây, micro giây và nano giây.
- {{jsxref("Temporal.Instant")}}
  - : Biểu diễn một điểm duy nhất trong thời gian, với độ chính xác nano giây. Về cơ bản, nó được biểu diễn như là số nano giây kể từ epoch Unix (nửa đêm đầu ngày 1 tháng 1 năm 1970, UTC), không có múi giờ hay hệ thống lịch nào.
- {{jsxref("Temporal.Now")}}
  - : Cung cấp các phương thức để lấy thời gian hiện tại ở nhiều định dạng khác nhau.
- {{jsxref("Temporal.PlainDate")}}
  - : Biểu diễn một ngày theo lịch (một ngày không có thời gian hay múi giờ); ví dụ, một sự kiện trên lịch xảy ra trong suốt cả ngày bất kể múi giờ nào. Về cơ bản, nó được biểu diễn như là ngày theo lịch ISO 8601, với các trường năm, tháng và ngày, và một hệ thống lịch liên quan.
- {{jsxref("Temporal.PlainDateTime")}}
  - : Biểu diễn một ngày (ngày theo lịch) và giờ (giờ đồng hồ) không có múi giờ. Về cơ bản, nó được biểu diễn như là tổ hợp của một [ngày](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Temporal/PlainDate) (với hệ thống lịch liên quan) và một [giờ](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Temporal/PlainTime).
- {{jsxref("Temporal.PlainMonthDay")}}
  - : Biểu diễn tháng và ngày của một ngày theo lịch, không có năm hay múi giờ; ví dụ, một sự kiện trên lịch lặp lại mỗi năm và xảy ra trong suốt cả ngày. Về cơ bản, nó được biểu diễn như là ngày theo lịch ISO 8601, với các trường năm, tháng và ngày, và một hệ thống lịch liên quan. Năm được sử dụng để làm rõ ngày-tháng trong các hệ thống lịch không phải ISO.
- {{jsxref("Temporal.PlainTime")}}
  - : Biểu diễn một giờ không có ngày hay múi giờ; ví dụ, một sự kiện lặp lại xảy ra vào cùng một giờ mỗi ngày. Về cơ bản, nó được biểu diễn như là tổ hợp các giá trị giờ, phút, giây, mili giây, micro giây và nano giây.
- {{jsxref("Temporal.PlainYearMonth")}}
  - : Biểu diễn năm và tháng của một ngày theo lịch, không có ngày hay múi giờ; ví dụ, một sự kiện trên lịch xảy ra trong suốt cả tháng. Về cơ bản, nó được biểu diễn như là ngày theo lịch ISO 8601, với các trường năm, tháng và ngày, và một hệ thống lịch liên quan. Ngày được sử dụng để làm rõ năm-tháng trong các hệ thống lịch không phải ISO.
- {{jsxref("Temporal.ZonedDateTime")}}
  - : Biểu diễn một ngày và giờ với múi giờ. Về cơ bản, nó được biểu diễn như là tổ hợp của một [instant](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Temporal/Instant), một múi giờ và một hệ thống lịch.
- `Temporal[Symbol.toStringTag]`
  - : Giá trị ban đầu của thuộc tính [`[Symbol.toStringTag]`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Symbol/toStringTag) là chuỗi `"Temporal"`. Thuộc tính này được sử dụng trong {{jsxref("Object.prototype.toString()")}}.

## Đặc tả

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{jsxref("Intl.DateTimeFormat")}}
- {{jsxref("Intl.RelativeTimeFormat")}}
- {{jsxref("Intl.DurationFormat")}}
- [Temporal polyfill by proposal champions](https://www.npmjs.com/package/@js-temporal/polyfill)
- [Temporal polyfill by FullCalendar](https://www.npmjs.com/package/temporal-polyfill)
