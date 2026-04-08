---
title: Date
slug: Web/JavaScript/Reference/Global_Objects/Date
page-type: javascript-class
browser-compat: javascript.builtins.Date
sidebar: jsref
---

Các đối tượng **`Date`** trong JavaScript đại diện cho một thời điểm duy nhất theo định dạng độc lập với nền tảng. Các đối tượng `Date` bao gói một số nguyên đại diện cho mili giây tính từ nửa đêm đầu ngày 1 tháng 1 năm 1970, UTC (_epoch_).

> [!NOTE]
> Với sự ra đời của API {{jsxref("Temporal")}}, đối tượng `Date` được coi là tính năng kế thừa (legacy). Hãy cân nhắc sử dụng `Temporal` cho code mới và chuyển đổi code hiện có sang nó nếu có thể (kiểm tra [khả năng tương thích trình duyệt](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Temporal#browser_compatibility)). Chúng tôi sẽ sớm viết hướng dẫn sử dụng!

## Mô tả

### Epoch, timestamp và ngày không hợp lệ

Một ngày JavaScript về cơ bản được xác định là thời gian tính bằng mili giây đã trôi qua kể từ [epoch](https://tc39.es/ecma262/multipage/numbers-and-dates.html#sec-time-values-and-time-range), được định nghĩa là nửa đêm đầu ngày 1 tháng 1 năm 1970, UTC (tương đương với [UNIX epoch](/en-US/docs/Glossary/Unix_time)). Timestamp này _không phụ thuộc vào múi giờ_ và xác định duy nhất một thời điểm trong lịch sử.

> [!NOTE]
> Mặc dù giá trị thời gian cốt lõi của đối tượng Date là UTC, các phương thức cơ bản để lấy ngày và giờ hoặc các thành phần của chúng đều hoạt động theo múi giờ cục bộ (tức là hệ thống máy chủ) và offset.

Timestamp tối đa có thể biểu diễn bởi đối tượng `Date` nhỏ hơn một chút so với số nguyên an toàn tối đa ({{jsxref("Number.MAX_SAFE_INTEGER")}}, là 9.007.199.254.740.991). Đối tượng `Date` có thể biểu diễn tối đa ±8.640.000.000.000.000 mili giây, hay ±100.000.000 (một trăm triệu) ngày, tương đối so với epoch. Đây là khoảng từ ngày 20 tháng 4 năm 271821 TCN đến ngày 13 tháng 9 năm 275760 SCN. Bất kỳ nỗ lực nào biểu diễn thời gian ngoài phạm vi này đều dẫn đến đối tượng `Date` giữ giá trị timestamp là [`NaN`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/NaN), là "Invalid Date".

```js
console.log(new Date(8.64e15).toString()); // "Sat Sep 13 275760 00:00:00 GMT+0000 (Coordinated Universal Time)"
console.log(new Date(8.64e15 + 1).toString()); // "Invalid Date"
```

Có nhiều phương thức cho phép bạn tương tác với timestamp được lưu trong date:

- Bạn có thể tương tác trực tiếp với giá trị timestamp bằng cách sử dụng các phương thức {{jsxref("Date/getTime", "getTime()")}} và {{jsxref("Date/setTime", "setTime()")}}.
- Các phương thức {{jsxref("Date/valueOf", "valueOf()")}} và [`[Symbol.toPrimitive]()`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Date/Symbol.toPrimitive) (khi truyền `"number"`) — được tự động gọi trong [ép kiểu number](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Number#number_coercion) — trả về timestamp, khiến các đối tượng `Date` hoạt động như timestamp của chúng khi được sử dụng trong ngữ cảnh số.
- Tất cả các phương thức tĩnh ({{jsxref("Date.now()")}}, {{jsxref("Date.parse()")}}, và {{jsxref("Date.UTC()")}}) trả về timestamp thay vì các đối tượng `Date`.
- Constructor {{jsxref("Date/Date", "Date()")}} có thể được gọi với timestamp là đối số duy nhất.

### Các thành phần ngày và múi giờ

Một ngày được biểu diễn nội bộ là một số duy nhất, _timestamp_. Khi tương tác với nó, timestamp cần được diễn giải thành một biểu diễn ngày-và-giờ có cấu trúc. Luôn có hai cách để diễn giải timestamp: là giờ địa phương hoặc là Giờ phối hợp quốc tế (UTC), tiêu chuẩn thời gian toàn cầu do World Time Standard định nghĩa. Múi giờ địa phương không được lưu trong đối tượng date, mà được xác định bởi môi trường máy chủ (thiết bị của người dùng).

> [!NOTE]
> UTC không nên nhầm lẫn với [Giờ trung bình Greenwich](https://en.wikipedia.org/wiki/Greenwich_Mean_Time) (GMT), vì chúng không phải lúc nào cũng bằng nhau — điều này được giải thích chi tiết hơn trong trang Wikipedia được liên kết.

Ví dụ, timestamp 0 đại diện cho một thời điểm duy nhất trong lịch sử, nhưng có thể được diễn giải theo hai cách:

- Là giờ UTC, đó là nửa đêm đầu ngày 1 tháng 1 năm 1970, UTC,
- Là giờ địa phương tại New York (UTC-5), đó là 19:00:00 ngày 31 tháng 12 năm 1969.

Phương thức {{jsxref("Date/getTimezoneOffset", "getTimezoneOffset()")}} trả về sự khác biệt giữa UTC và giờ địa phương tính bằng phút. Lưu ý rằng timezone offset không chỉ phụ thuộc vào múi giờ hiện tại, mà còn phụ thuộc vào thời gian được biểu diễn bởi đối tượng `Date`, do tiết kiệm ánh sáng ban ngày và các thay đổi lịch sử. Về bản chất, timezone offset là offset so với giờ UTC, tại thời điểm được biểu diễn bởi đối tượng `Date` và tại vị trí của môi trường máy chủ.

Có hai nhóm phương thức `Date`: một nhóm lấy và đặt các thành phần ngày khác nhau bằng cách diễn giải timestamp như giờ địa phương, trong khi nhóm kia sử dụng UTC.

<table class="standard-table">
  <thead>
    <tr>
      <th rowspan="2">Thành phần</th>
      <th colspan="2">Địa phương</th>
      <th colspan="2">UTC</th>
    </tr>
    <tr>
      <th>Lấy</th>
      <th>Đặt</th>
      <th>Lấy</th>
      <th>Đặt</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td>Year</td>
      <td>{{jsxref("Date/getFullYear", "getFullYear()")}}</td>
      <td>{{jsxref("Date/setFullYear", "setFullYear()")}}</td>
      <td>{{jsxref("Date/getUTCFullYear", "getUTCFullYear()")}}</td>
      <td>{{jsxref("Date/setUTCFullYear", "setUTCFullYear()")}}</td>
    </tr>
    <tr>
      <td>Month</td>
      <td>{{jsxref("Date/getMonth", "getMonth()")}}</td>
      <td>{{jsxref("Date/setMonth", "setMonth()")}}</td>
      <td>{{jsxref("Date/getUTCMonth", "getUTCMonth()")}}</td>
      <td>{{jsxref("Date/setUTCMonth", "setUTCMonth()")}}</td>
    </tr>
    <tr>
      <td>Date (of month)</td>
      <td>{{jsxref("Date/getDate", "getDate()")}}</td>
      <td>{{jsxref("Date/setDate", "setDate()")}}</td>
      <td>{{jsxref("Date/getUTCDate", "getUTCDate()")}}</td>
      <td>{{jsxref("Date/setUTCDate", "setUTCDate()")}}</td>
    </tr>
    <tr>
      <td>Hours</td>
      <td>{{jsxref("Date/getHours", "getHours()")}}</td>
      <td>{{jsxref("Date/setHours", "setHours()")}}</td>
      <td>{{jsxref("Date/getUTCHours", "getUTCHours()")}}</td>
      <td>{{jsxref("Date/setUTCHours", "setUTCHours()")}}</td>
    </tr>
    <tr>
      <td>Minutes</td>
      <td>{{jsxref("Date/getMinutes", "getMinutes()")}}</td>
      <td>{{jsxref("Date/setMinutes", "setMinutes()")}}</td>
      <td>{{jsxref("Date/getUTCMinutes", "getUTCMinutes()")}}</td>
      <td>{{jsxref("Date/setUTCMinutes", "setUTCMinutes()")}}</td>
    </tr>
    <tr>
      <td>Seconds</td>
      <td>{{jsxref("Date/getSeconds", "getSeconds()")}}</td>
      <td>{{jsxref("Date/setSeconds", "setSeconds()")}}</td>
      <td>{{jsxref("Date/getUTCSeconds", "getUTCSeconds()")}}</td>
      <td>{{jsxref("Date/setUTCSeconds", "setUTCSeconds()")}}</td>
    </tr>
    <tr>
      <td>Milliseconds</td>
      <td>{{jsxref("Date/getMilliseconds", "getMilliseconds()")}}</td>
      <td>{{jsxref("Date/setMilliseconds", "setMilliseconds()")}}</td>
      <td>{{jsxref("Date/getUTCMilliseconds", "getUTCMilliseconds()")}}</td>
      <td>{{jsxref("Date/setUTCMilliseconds", "setUTCMilliseconds()")}}</td>
    </tr>
    <tr>
      <td>Day (of week)</td>
      <td>{{jsxref("Date/getDay", "getDay()")}}</td>
      <td>N/A</td>
      <td>{{jsxref("Date/getUTCDay", "getUTCDay()")}}</td>
      <td>N/A</td>
    </tr>
  </tbody>
</table>

Constructor {{jsxref("Date/Date", "Date()")}} có thể được gọi với hai hoặc nhiều đối số, trong trường hợp đó chúng được diễn giải lần lượt là năm, tháng, ngày, giờ, phút, giây và mili giây theo giờ địa phương. {{jsxref("Date.UTC()")}} hoạt động tương tự, nhưng nó diễn giải các thành phần theo giờ UTC và cũng chấp nhận một đối số duy nhất đại diện cho năm.

> [!NOTE]
> Một số phương thức, bao gồm constructor `Date()`, `Date.UTC()`, và các phương thức không dùng nữa {{jsxref("Date/getYear", "getYear()")}}/{{jsxref("Date/setYear", "setYear()")}}, diễn giải năm có hai chữ số là năm trong thập niên 1900. Ví dụ, `new Date(99, 5, 24)` được diễn giải là ngày 24 tháng 6 năm 1999, không phải ngày 24 tháng 6 năm 99. Xem [Diễn giải năm có hai chữ số](#interpretation_of_two-digit_years) để biết thêm thông tin.

Khi một phân đoạn tràn hoặc thiếu so với phạm vi mong đợi, nó thường "chuyển sang" hoặc "mượn từ" phân đoạn cao hơn. Ví dụ, nếu tháng được đặt thành 12 (tháng được đánh số từ 0, vì vậy December là 11), nó sẽ trở thành tháng Một của năm tiếp theo. Nếu ngày trong tháng được đặt thành 0, nó sẽ trở thành ngày cuối cùng của tháng trước. Điều này cũng áp dụng cho các ngày được chỉ định theo [định dạng chuỗi ngày giờ](#date_time_string_format).

Khi cố gắng đặt giờ địa phương thành một thời gian nằm trong quá trình chuyển đổi offset (thường là giờ tiết kiệm ánh sáng ban ngày), thời gian chính xác được suy ra bằng cách sử dụng hành vi tương tự như tùy chọn [`disambiguation: "compatible"`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Temporal/ZonedDateTime#ambiguity_and_gaps_from_local_time_to_utc_time) của `Temporal`. Nghĩa là, nếu giờ địa phương tương ứng với hai thời điểm, thời điểm sớm hơn được chọn; nếu giờ địa phương không tồn tại (có khoảng trống), ta tiến về phía trước theo khoảng thời gian của khoảng trống.

```js
// Assume America/New_York local time zone
// 2024-03-10 02:30 is within the spring-forward transition and does not exist
// 01:59 (UTC-5) jumps to 03:00 (UTC-4), so 02:30 moves forward by one hour
console.log(new Date(2024, 2, 10, 2, 30).toString());
// Sun Mar 10 2024 03:30:00 GMT-0400 (Eastern Daylight Time)

// 2024-11-03 01:30 is within the fall-back transition and exists twice
// 01:59 (UTC-4) jumps to 01:00 (UTC-5), so the earlier 01:30 (UTC-4) is chosen
console.log(new Date(2024, 10, 3, 1, 30).toString());
// Sun Nov 03 2024 01:30:00 GMT-0400 (Eastern Daylight Time)
```

### Định dạng chuỗi ngày giờ

Có nhiều cách để định dạng một ngày thành chuỗi. Đặc tả JavaScript chỉ chỉ định một định dạng được hỗ trợ chung: [_định dạng chuỗi ngày giờ_](https://tc39.es/ecma262/multipage/numbers-and-dates.html#sec-date-time-string-format), một đơn giản hóa của định dạng mở rộng ngày lịch ISO 8601. Định dạng như sau:

```plain
YYYY-MM-DDTHH:mm:ss.sssZ
```

- `YYYY` là năm, với bốn chữ số (`0000` đến `9999`), hoặc là _năm mở rộng_ gồm `+` hoặc `-` theo sau bởi sáu chữ số. Dấu là bắt buộc cho năm mở rộng. `-000000` bị cấm rõ ràng là năm hợp lệ.
- `MM` là tháng, với hai chữ số (`01` đến `12`). Mặc định là `01`.
- `DD` là ngày trong tháng, với hai chữ số (`01` đến `31`). Mặc định là `01`.
- `T` là ký tự literal, cho biết sự bắt đầu của phần _thời gian_ của chuỗi. `T` là bắt buộc khi chỉ định phần thời gian.
- `HH` là giờ, với hai chữ số (`00` đến `23`). Là trường hợp đặc biệt, `24:00:00` được phép, và được diễn giải là nửa đêm đầu ngày hôm sau. Mặc định là `00`.
- `mm` là phút, với hai chữ số (`00` đến `59`). Mặc định là `00`.
- `ss` là giây, với hai chữ số (`00` đến `59`). Mặc định là `00`.
- `sss` là mili giây, với ba chữ số (`000` đến `999`). Mặc định là `000`.
- `Z` là timezone offset, có thể là ký tự literal `Z` (chỉ UTC), hoặc `+` hoặc `-` theo sau bởi `HH:mm`, offset tính bằng giờ và phút so với UTC.

Nhiều thành phần có thể bị bỏ qua, vì vậy những định dạng sau đây đều hợp lệ:

- Dạng chỉ có ngày: `YYYY`, `YYYY-MM`, `YYYY-MM-DD`
- Dạng ngày giờ: một trong các dạng chỉ có ngày ở trên, theo sau bởi `T`, theo sau bởi `HH:mm`, `HH:mm:ss`, hoặc `HH:mm:ss.sss`. Mỗi kết hợp có thể được theo sau bởi một timezone offset.

Ví dụ, `"2011-10-10"` (dạng _chỉ có ngày_), `"2011-10-10T14:48:00"` (dạng _ngày giờ_), hoặc `"2011-10-10T14:48:00.000+09:00"` (dạng _ngày giờ_ với mili giây và múi giờ) đều là các chuỗi ngày giờ hợp lệ.

Khi timezone offset vắng mặt, **các dạng chỉ có ngày được diễn giải là giờ UTC và các dạng ngày giờ được diễn giải là giờ địa phương.** Việc diễn giải theo giờ UTC là do lỗi đặc tả lịch sử không nhất quán với ISO 8601 nhưng không thể thay đổi do tính tương thích web. Xem [Broken Parser – A Web Reality Issue](https://maggiepint.com/2017/04/11/fixing-javascript-date-web-compatibility-and-reality/).

{{jsxref("Date.parse()")}} và constructor {{jsxref("Date/Date", "Date()")}} đều chấp nhận chuỗi theo định dạng chuỗi ngày giờ làm đầu vào. Ngoài ra, các triển khai được phép hỗ trợ các định dạng ngày khác khi đầu vào không khớp với định dạng này.

Phương thức {{jsxref("Date/toISOString", "toISOString()")}} trả về chuỗi biểu diễn ngày theo định dạng chuỗi ngày giờ, với timezone offset luôn được đặt thành `Z` (UTC).

> [!NOTE]
> Bạn được khuyến khích đảm bảo đầu vào của mình tuân theo định dạng chuỗi ngày giờ ở trên để đạt tính tương thích tối đa, vì hỗ trợ cho các định dạng khác không được đảm bảo. Tuy nhiên, có một số định dạng được hỗ trợ trong tất cả các triển khai chính — như định dạng {{rfc(2822)}} — trong trường hợp đó việc sử dụng chúng có thể chấp nhận được. Luôn thực hiện [kiểm tra trên nhiều trình duyệt](/en-US/docs/Learn_web_development/Extensions/Testing) để đảm bảo code của bạn hoạt động trong tất cả các trình duyệt mục tiêu. Một thư viện có thể hữu ích nếu cần hỗ trợ nhiều định dạng khác nhau.

Các chuỗi không chuẩn có thể được phân tích theo bất kỳ cách nào mà triển khai mong muốn, bao gồm múi giờ — hầu hết các triển khai sử dụng múi giờ địa phương theo mặc định. Các triển khai không bắt buộc phải trả về ngày không hợp lệ cho các thành phần ngày ngoài phạm vi, mặc dù chúng thường làm vậy. Một chuỗi có thể có các thành phần ngày trong phạm vi (với phạm vi được định nghĩa ở trên), nhưng không đại diện cho một ngày trong thực tế (ví dụ: "February 30"). Các triển khai hoạt động không nhất quán trong trường hợp này. Trang [`Date.parse()`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Date/parse#examples) cung cấp thêm ví dụ về các trường hợp không chuẩn này.

### Các cách khác để định dạng ngày

- {{jsxref("Date/toISOString", "toISOString()")}} trả về chuỗi theo định dạng `1970-01-01T00:00:00.000Z` (định dạng chuỗi ngày giờ được giới thiệu ở trên, là đơn giản hóa của [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601)). {{jsxref("Date/toJSON", "toJSON()")}} gọi `toISOString()` và trả về kết quả.
- {{jsxref("Date/toString", "toString()")}} trả về chuỗi theo định dạng `Thu Jan 01 1970 00:00:00 GMT+0000 (Coordinated Universal Time)`, trong khi {{jsxref("Date/toDateString", "toDateString()")}} và {{jsxref("Date/toTimeString", "toTimeString()")}} lần lượt trả về phần ngày và phần giờ của chuỗi. [`[Symbol.toPrimitive]()`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Date/Symbol.toPrimitive) (khi truyền `"string"` hoặc `"default"`) gọi `toString()` và trả về kết quả.
- {{jsxref("Date/toUTCString", "toUTCString()")}} trả về chuỗi theo định dạng `Thu, 01 Jan 1970 00:00:00 GMT` ({{rfc(7231)}} tổng quát).
- {{jsxref("Date/toLocaleDateString", "toLocaleDateString()")}}, {{jsxref("Date/toLocaleTimeString", "toLocaleTimeString()")}}, và {{jsxref("Date/toLocaleString", "toLocaleString()")}} sử dụng các định dạng ngày và giờ theo ngôn ngữ địa phương, thường được cung cấp bởi API [`Intl`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Intl).

Xem phần [Định dạng của các giá trị trả về của phương thức `toString`](#formats_of_tostring_method_return_values) để biết ví dụ.

## Constructor

- {{jsxref("Date/Date", "Date()")}}
  - : Khi được gọi như một constructor, trả về một đối tượng `Date` mới. Khi được gọi như một function, trả về chuỗi biểu diễn ngày và giờ hiện tại.

## Phương thức tĩnh

- {{jsxref("Date.now()")}}
  - : Trả về giá trị số tương ứng với thời gian hiện tại — số mili giây kể từ ngày 1 tháng 1 năm 1970 00:00:00 UTC, bỏ qua giây nhuận.
- {{jsxref("Date.parse()")}}
  - : Phân tích chuỗi biểu diễn ngày và trả về số mili giây kể từ ngày 1 tháng 1 năm 1970 00:00:00 UTC, bỏ qua giây nhuận.
- {{jsxref("Date.UTC()")}}
  - : Chấp nhận các tham số tương tự như dạng dài nhất của constructor (tức là 2 đến 7) và trả về số mili giây kể từ ngày 1 tháng 1 năm 1970 00:00:00 UTC, bỏ qua giây nhuận.

## Thuộc tính instance

Các thuộc tính này được định nghĩa trên `Date.prototype` và được chia sẻ bởi tất cả các instance `Date`.

- {{jsxref("Object/constructor", "Date.prototype.constructor")}}
  - : Hàm constructor đã tạo ra đối tượng instance. Đối với các instance `Date`, giá trị khởi tạo là constructor {{jsxref("Date/Date", "Date")}}.

## Phương thức instance

- {{jsxref("Date.prototype.getDate()")}}
  - : Trả về ngày trong tháng (`1` – `31`) cho ngày được chỉ định theo giờ địa phương.
- {{jsxref("Date.prototype.getDay()")}}
  - : Trả về ngày trong tuần (`0` – `6`) cho ngày được chỉ định theo giờ địa phương.
- {{jsxref("Date.prototype.getFullYear()")}}
  - : Trả về năm (4 chữ số cho năm 4 chữ số) của ngày được chỉ định theo giờ địa phương.
- {{jsxref("Date.prototype.getHours()")}}
  - : Trả về giờ (`0` – `23`) trong ngày được chỉ định theo giờ địa phương.
- {{jsxref("Date.prototype.getMilliseconds()")}}
  - : Trả về mili giây (`0` – `999`) trong ngày được chỉ định theo giờ địa phương.
- {{jsxref("Date.prototype.getMinutes()")}}
  - : Trả về phút (`0` – `59`) trong ngày được chỉ định theo giờ địa phương.
- {{jsxref("Date.prototype.getMonth()")}}
  - : Trả về tháng (`0` – `11`) trong ngày được chỉ định theo giờ địa phương.
- {{jsxref("Date.prototype.getSeconds()")}}
  - : Trả về giây (`0` – `59`) trong ngày được chỉ định theo giờ địa phương.
- {{jsxref("Date.prototype.getTime()")}}
  - : Trả về giá trị số của ngày được chỉ định là số mili giây kể từ ngày 1 tháng 1 năm 1970 00:00:00 UTC. (Các giá trị âm được trả về cho các thời gian trước đó.)
- {{jsxref("Date.prototype.getTimezoneOffset()")}}
  - : Trả về timezone offset tính bằng phút cho ngôn ngữ địa phương hiện tại.
- {{jsxref("Date.prototype.getUTCDate()")}}
  - : Trả về ngày (date) trong tháng (`1` – `31`) trong ngày được chỉ định theo giờ quốc tế.
- {{jsxref("Date.prototype.getUTCDay()")}}
  - : Trả về ngày trong tuần (`0` – `6`) trong ngày được chỉ định theo giờ quốc tế.
- {{jsxref("Date.prototype.getUTCFullYear()")}}
  - : Trả về năm (4 chữ số cho năm 4 chữ số) trong ngày được chỉ định theo giờ quốc tế.
- {{jsxref("Date.prototype.getUTCHours()")}}
  - : Trả về giờ (`0` – `23`) trong ngày được chỉ định theo giờ quốc tế.
- {{jsxref("Date.prototype.getUTCMilliseconds()")}}
  - : Trả về mili giây (`0` – `999`) trong ngày được chỉ định theo giờ quốc tế.
- {{jsxref("Date.prototype.getUTCMinutes()")}}
  - : Trả về phút (`0` – `59`) trong ngày được chỉ định theo giờ quốc tế.
- {{jsxref("Date.prototype.getUTCMonth()")}}
  - : Trả về tháng (`0` – `11`) trong ngày được chỉ định theo giờ quốc tế.
- {{jsxref("Date.prototype.getUTCSeconds()")}}
  - : Trả về giây (`0` – `59`) trong ngày được chỉ định theo giờ quốc tế.
- {{jsxref("Date.prototype.getYear()")}} {{deprecated_inline}}
  - : Trả về năm (thường là 2–3 chữ số) trong ngày được chỉ định theo giờ địa phương. Sử dụng {{jsxref("Date/getFullYear", "getFullYear()")}} thay thế.
- {{jsxref("Date.prototype.setDate()")}}
  - : Đặt ngày trong tháng cho ngày được chỉ định theo giờ địa phương.
- {{jsxref("Date.prototype.setFullYear()")}}
  - : Đặt năm đầy đủ (ví dụ: 4 chữ số cho năm 4 chữ số) cho ngày được chỉ định theo giờ địa phương.
- {{jsxref("Date.prototype.setHours()")}}
  - : Đặt giờ cho ngày được chỉ định theo giờ địa phương.
- {{jsxref("Date.prototype.setMilliseconds()")}}
  - : Đặt mili giây cho ngày được chỉ định theo giờ địa phương.
- {{jsxref("Date.prototype.setMinutes()")}}
  - : Đặt phút cho ngày được chỉ định theo giờ địa phương.
- {{jsxref("Date.prototype.setMonth()")}}
  - : Đặt tháng cho ngày được chỉ định theo giờ địa phương.
- {{jsxref("Date.prototype.setSeconds()")}}
  - : Đặt giây cho ngày được chỉ định theo giờ địa phương.
- {{jsxref("Date.prototype.setTime()")}}
  - : Đặt đối tượng `Date` thành thời gian được biểu diễn bởi số mili giây kể từ ngày 1 tháng 1 năm 1970 00:00:00 UTC. Sử dụng số âm cho các thời gian trước đó.
- {{jsxref("Date.prototype.setUTCDate()")}}
  - : Đặt ngày trong tháng cho ngày được chỉ định theo giờ quốc tế.
- {{jsxref("Date.prototype.setUTCFullYear()")}}
  - : Đặt năm đầy đủ (ví dụ: 4 chữ số cho năm 4 chữ số) cho ngày được chỉ định theo giờ quốc tế.
- {{jsxref("Date.prototype.setUTCHours()")}}
  - : Đặt giờ cho ngày được chỉ định theo giờ quốc tế.
- {{jsxref("Date.prototype.setUTCMilliseconds()")}}
  - : Đặt mili giây cho ngày được chỉ định theo giờ quốc tế.
- {{jsxref("Date.prototype.setUTCMinutes()")}}
  - : Đặt phút cho ngày được chỉ định theo giờ quốc tế.
- {{jsxref("Date.prototype.setUTCMonth()")}}
  - : Đặt tháng cho ngày được chỉ định theo giờ quốc tế.
- {{jsxref("Date.prototype.setUTCSeconds()")}}
  - : Đặt giây cho ngày được chỉ định theo giờ quốc tế.
- {{jsxref("Date.prototype.setYear()")}} {{deprecated_inline}}
  - : Đặt năm (thường là 2–3 chữ số) cho ngày được chỉ định theo giờ địa phương. Sử dụng {{jsxref("Date/setFullYear", "setFullYear()")}} thay thế.
- {{jsxref("Date.prototype.toDateString()")}}
  - : Trả về phần "ngày" của `Date` dưới dạng chuỗi dễ đọc như `'Thu Apr 12 2018'`.
- {{jsxref("Date.prototype.toISOString()")}}
  - : Chuyển đổi ngày thành chuỗi theo định dạng ISO 8601 Extended Format.
- {{jsxref("Date.prototype.toJSON()")}}
  - : Trả về chuỗi biểu diễn `Date` bằng cách sử dụng {{jsxref("Date/toISOString", "toISOString()")}}. Được dùng để gọi ẩn bởi {{jsxref("JSON.stringify()")}}.
- {{jsxref("Date.prototype.toLocaleDateString()")}}
  - : Trả về chuỗi với biểu diễn nhạy cảm với ngôn ngữ địa phương của phần ngày của ngày này dựa trên cài đặt hệ thống.
- {{jsxref("Date.prototype.toLocaleString()")}}
  - : Trả về chuỗi với biểu diễn nhạy cảm với ngôn ngữ địa phương của ngày này. Ghi đè phương thức {{jsxref("Object.prototype.toLocaleString()")}}.
- {{jsxref("Date.prototype.toLocaleTimeString()")}}
  - : Trả về chuỗi với biểu diễn nhạy cảm với ngôn ngữ địa phương của phần thời gian của ngày này, dựa trên cài đặt hệ thống.
- {{jsxref("Date.prototype.toString()")}}
  - : Trả về chuỗi biểu diễn đối tượng `Date` được chỉ định. Ghi đè phương thức {{jsxref("Object.prototype.toString()")}}.
- {{jsxref("Date.prototype.toTemporalInstant()")}}
  - : Trả về một đối tượng {{jsxref("Temporal.Instant")}} mới với giá trị {{jsxref("Temporal/Instant/epochMilliseconds", "epochMilliseconds")}} giống như [timestamp](#the_epoch_timestamps_and_invalid_date) của ngày này.
- {{jsxref("Date.prototype.toTimeString()")}}
  - : Trả về phần "thời gian" của `Date` dưới dạng chuỗi dễ đọc.
- {{jsxref("Date.prototype.toUTCString()")}}
  - : Chuyển đổi ngày thành chuỗi sử dụng múi giờ UTC.
- {{jsxref("Date.prototype.valueOf()")}}
  - : Trả về giá trị nguyên thủy của đối tượng `Date`. Ghi đè phương thức {{jsxref("Object.prototype.valueOf()")}}.
- [`Date.prototype[Symbol.toPrimitive]()`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Date/Symbol.toPrimitive)
  - : Chuyển đổi đối tượng `Date` này thành giá trị nguyên thủy.

## Ví dụ

### Nhiều cách để tạo đối tượng Date

Các ví dụ sau đây cho thấy nhiều cách để tạo ngày JavaScript:

> [!NOTE]
> Tạo ngày từ chuỗi có nhiều hành vi không nhất quán. Xem [định dạng chuỗi ngày giờ](#date_time_string_format) để biết các lưu ý khi sử dụng các định dạng khác nhau.

```js
const today = new Date();
const birthday = new Date("December 17, 1995 03:24:00"); // DISCOURAGED: may not work in all runtimes
const birthday2 = new Date("1995-12-17T03:24:00"); // This is standardized and will work reliably
const birthday3 = new Date(1995, 11, 17); // the month is 0-indexed
const birthday4 = new Date(1995, 11, 17, 3, 24, 0);
const birthday5 = new Date(628021800000); // passing epoch timestamp
```

### Định dạng của các giá trị trả về của phương thức toString

```js
const date = new Date("2020-05-12T23:50:21.817Z");
date.toString(); // Tue May 12 2020 18:50:21 GMT-0500 (Central Daylight Time)
date.toDateString(); // Tue May 12 2020
date.toTimeString(); // 18:50:21 GMT-0500 (Central Daylight Time)
date[Symbol.toPrimitive]("string"); // Tue May 12 2020 18:50:21 GMT-0500 (Central Daylight Time)

date.toISOString(); // 2020-05-12T23:50:21.817Z
date.toJSON(); // 2020-05-12T23:50:21.817Z

date.toUTCString(); // Tue, 12 May 2020 23:50:21 GMT

date.toLocaleString(); // 5/12/2020, 6:50:21 PM
date.toLocaleDateString(); // 5/12/2020
date.toLocaleTimeString(); // 6:50:21 PM
```

### Lấy ngày, tháng, năm hoặc thời gian

```js
const date = new Date("2000-01-17T16:45:30");
const [month, day, year] = [
  date.getMonth(),
  date.getDate(),
  date.getFullYear(),
];
// [0, 17, 2000] as month are 0-indexed
const [hour, minutes, seconds] = [
  date.getHours(),
  date.getMinutes(),
  date.getSeconds(),
];
// [16, 45, 30]
```

### Diễn giải năm có hai chữ số

`new Date()` có hành vi kế thừa không mong muốn, không nhất quán với các giá trị năm có hai chữ số; cụ thể, khi một lệnh gọi `new Date()` được cung cấp giá trị năm có hai chữ số, giá trị năm đó không được coi là năm literal và sử dụng nguyên văn mà thay vào đó được diễn giải là offset tương đối — trong một số trường hợp là offset từ năm `1900`, nhưng trong các trường hợp khác, là offset từ năm `2000`.

```js
let date = new Date(98, 1); // Sun Feb 01 1998 00:00:00 GMT+0000 (GMT)
date = new Date(22, 1); // Wed Feb 01 1922 00:00:00 GMT+0000 (GMT)
date = new Date("2/1/22"); // Tue Feb 01 2022 00:00:00 GMT+0000 (GMT)

// Legacy method; always interprets two-digit year values as relative to 1900
date.setYear(98);
date.toString(); // Sun Feb 01 1998 00:00:00 GMT+0000 (GMT)
date.setYear(22);
date.toString(); // Wed Feb 01 1922 00:00:00 GMT+0000 (GMT)
```

Vì vậy, để tạo và lấy các ngày giữa năm `0` và `99`, hãy sử dụng các phương thức {{jsxref("Date/setFullYear", "setFullYear()")}} và {{jsxref("Date/getFullYear", "getFullYear()")}} được ưu tiên:

```js
// Preferred method; never interprets any value as being a relative offset,
// but instead uses the year value as-is
date.setFullYear(98);
date.getFullYear(); // 98 (not 1998)
date.setFullYear(22);
date.getFullYear(); // 22 (not 1922, not 2022)
```

### Tính thời gian đã trôi qua

Các ví dụ sau đây cho thấy cách xác định thời gian đã trôi qua giữa hai ngày JavaScript tính bằng mili giây.

Do độ dài khác nhau của ngày (do thay đổi tiết kiệm ánh sáng ban ngày), tháng và năm, việc biểu diễn thời gian đã trôi qua theo đơn vị lớn hơn giờ, phút và giây đòi hỏi phải giải quyết một số vấn đề và nên được nghiên cứu kỹ trước khi thực hiện.

```js
// Using Date objects
const start = Date.now();

// The event to time goes here:
doSomethingForALongTime();
const end = Date.now();
const elapsed = end - start; // elapsed time in milliseconds
```

```js
// Using built-in methods
const start = new Date();

// The event to time goes here:
doSomethingForALongTime();
const end = new Date();
const elapsed = end.getTime() - start.getTime(); // elapsed time in milliseconds
```

```js
// To test a function and get back its return
function printElapsedTime(testFn) {
  const startTime = Date.now();
  const result = testFn();
  const endTime = Date.now();

  console.log(`Elapsed time: ${String(endTime - startTime)} milliseconds`);
  return result;
}

const yourFunctionReturn = printElapsedTime(yourFunction);
```

> [!NOTE]
> Trong các trình duyệt hỗ trợ tính năng thời gian độ phân giải cao của {{domxref("Performance API", "", "", "nocode")}}, {{domxref("Performance.now()")}} có thể cung cấp các phép đo thời gian đã trôi qua đáng tin cậy và chính xác hơn {{jsxref("Date.now()")}}.

### Lấy số giây kể từ ECMAScript Epoch

```js
const seconds = Math.floor(Date.now() / 1000);
```

Trong trường hợp này, điều quan trọng là chỉ trả về một số nguyên — vì vậy phép chia đơn giản sẽ không đủ. Điều quan trọng cũng là chỉ trả về số giây thực sự đã trôi qua. (Đó là lý do tại sao code này sử dụng {{jsxref("Math.floor()")}}, và _không_ dùng {{jsxref("Math.round()")}})

## Đặc tả kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{jsxref("Date/Date", "Date()")}}
