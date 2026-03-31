---
title: Temporal.Instant
slug: Web/JavaScript/Reference/Global_Objects/Temporal/Instant
page-type: javascript-class
browser-compat: javascript.builtins.Temporal.Instant
sidebar: jsref
---

Đối tượng **`Temporal.Instant`** biểu diễn một điểm duy nhất trong thời gian, với độ chính xác nano giây. Về cơ bản, nó được biểu diễn như là số nano giây kể từ epoch Unix (nửa đêm đầu ngày 1 tháng 1 năm 1970, UTC), không có múi giờ hay hệ thống lịch nào.

## Mô tả

`Temporal.Instant` về mặt ngữ nghĩa giống như {{jsxref("Date")}}. Cả hai đều đóng gói một điểm duy nhất trong thời gian, nhưng `Temporal.Instant` chính xác hơn vì nó lưu trữ nano giây thay vì mili giây. `Temporal.Instant` cũng tránh các bẫy của `Date` vì nó không giả định bất kỳ thông tin lịch hay múi giờ nào — nếu bạn muốn đọc bất kỳ thông tin ngày hoặc giờ nào như năm hoặc tháng, bạn cần chuyển đổi nó sang {{jsxref("Temporal.ZonedDateTime")}} trước, sử dụng {{jsxref("Temporal/Instant/toZonedDateTimeISO()", "toZonedDateTimeISO()")}}.

Bạn có thể chuyển đổi từ `Date` sang `Temporal.Instant` bằng phương thức {{jsxref("Date.prototype.toTemporalInstant()")}}, phương thức này nên được ưu tiên hơn các phương thức khác như {{jsxref("Temporal/Instant/fromEpochMilliseconds", "Temporal.Instant.fromEpochMilliseconds()")}} vì phương thức trước liên quan đến ít mã người dùng hơn và có thể được tối ưu hóa hơn. Bạn cũng có thể chuyển đổi từ `Temporal.Instant` sang `Date` bằng epoch mili giây của nó, chẳng hạn như `new Date(instant.epochMilliseconds)`.

### Định dạng RFC 9557

Các đối tượng `Instant` có thể được tuần tự hóa và phân tích cú pháp bằng định dạng [RFC 9557](https://datatracker.ietf.org/doc/html/rfc9557), một phần mở rộng của định dạng [ISO 8601 / RFC 3339](https://datatracker.ietf.org/doc/html/rfc3339). Chuỗi có dạng sau (khoảng trắng chỉ để dễ đọc và không nên có mặt trong chuỗi thực tế):

```plain
YYYY-MM-DD T HH:mm:ss.sssssssss Z/±HH:mm
```

- `YYYY`
  - : Một số bốn chữ số, hoặc một số sáu chữ số với dấu `+` hoặc `-`.
- `MM`
  - : Một số hai chữ số từ `01` đến `12`.
- `DD`
  - : Một số hai chữ số từ `01` đến `31`. Các thành phần `YYYY`, `MM` và `DD` có thể được phân tách bằng `-` hoặc không có gì.
- `T`
  - : Dấu phân tách ngày-giờ, có thể là `T`, `t`, hoặc dấu cách.
- `HH`
  - : Một số hai chữ số từ `00` đến `23`.
- `mm` {{optional_inline}}
  - : Một số hai chữ số từ `00` đến `59`. Mặc định là `00`.
- `ss.sssssssss` {{optional_inline}}
  - : Một số hai chữ số từ `00` đến `59`. Có thể tùy chọn theo sau là `.` hoặc `,` và một đến chín chữ số. Mặc định là `00`. Các thành phần `HH`, `mm` và `ss` có thể được phân tách bằng `:` hoặc không có gì. Bạn có thể bỏ qua chỉ `ss` hoặc cả `ss` và `mm`, vì vậy thời gian có thể ở một trong ba dạng: `HH`, `HH:mm`, hoặc `HH:mm:ss.sssssssss`.
- `Z/±HH:mm`
  - : Ký hiệu UTC `Z` hoặc `z`, hoặc độ lệch từ UTC theo dạng `+` hoặc `-` theo sau bởi cùng định dạng như thành phần thời gian. Lưu ý rằng độ chính xác dưới phút (`:ss.sssssssss`) có thể không được các hệ thống khác hỗ trợ, và được chấp nhận nhưng không bao giờ được xuất ra. Nếu độ lệch được cung cấp, thời gian được diễn giải theo độ lệch được chỉ định.

Khi nhập, bạn có thể tùy chọn bao gồm định danh múi giờ và lịch, theo cùng định dạng như [`ZonedDateTime`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Temporal/ZonedDateTime#rfc_9557_format), nhưng chúng sẽ bị bỏ qua. Các chú thích khác ở định dạng `[key=value]` cũng bị bỏ qua, và chúng không được có cờ critical.

Khi tuần tự hóa, bạn có thể cấu hình chữ số giây phân số và độ lệch.

## Constructor

- {{jsxref("Temporal/Instant/Instant", "Temporal.Instant()")}} {{experimental_inline}}
  - : Tạo một đối tượng `Temporal.Instant` mới bằng cách cung cấp trực tiếp dữ liệu cơ bản.

## Phương thức tĩnh

- {{jsxref("Temporal/Instant/compare", "Temporal.Instant.compare()")}}
  - : Trả về một số (-1, 0, hoặc 1) cho biết instant đầu tiên đến trước, bằng, hoặc sau instant thứ hai. Tương đương với việc so sánh {{jsxref("Temporal/Instant/epochNanoseconds", "epochNanoseconds")}} của hai instant.
- {{jsxref("Temporal/Instant/from", "Temporal.Instant.from()")}}
  - : Tạo một đối tượng `Temporal.Instant` mới từ đối tượng `Temporal.Instant` khác, hoặc một chuỗi [RFC 9557](#rfc_9557_format).
- {{jsxref("Temporal/Instant/fromEpochMilliseconds", "Temporal.Instant.fromEpochMilliseconds()")}}
  - : Tạo một đối tượng `Temporal.Instant` mới từ số mili giây kể từ epoch Unix (nửa đêm đầu ngày 1 tháng 1 năm 1970, UTC).
- {{jsxref("Temporal/Instant/fromEpochNanoseconds", "Temporal.Instant.fromEpochNanoseconds()")}}
  - : Tạo một đối tượng `Temporal.Instant` mới từ số nano giây kể từ epoch Unix (nửa đêm đầu ngày 1 tháng 1 năm 1970, UTC).

## Thuộc tính thực thể

Các thuộc tính này được định nghĩa trên `Temporal.Instant.prototype` và được chia sẻ bởi tất cả các thực thể `Temporal.Instant`.

- {{jsxref("Object/constructor", "Temporal.Instant.prototype.constructor")}}
  - : Hàm constructor đã tạo đối tượng thực thể. Đối với các thực thể `Temporal.Instant`, giá trị ban đầu là constructor {{jsxref("Temporal/Instant/Instant", "Temporal.Instant()")}}.
- {{jsxref("Temporal/Instant/epochMilliseconds", "Temporal.Instant.prototype.epochMilliseconds")}}
  - : Trả về một số nguyên biểu diễn số mili giây đã trôi qua kể từ epoch Unix (nửa đêm đầu ngày 1 tháng 1 năm 1970, UTC) đến instant này. Tương đương với việc chia `epochNanoseconds` cho `1e6` và làm tròn xuống.
- {{jsxref("Temporal/Instant/epochNanoseconds", "Temporal.Instant.prototype.epochNanoseconds")}}
  - : Trả về một {{jsxref("BigInt")}} biểu diễn số nano giây kể từ epoch Unix (nửa đêm đầu ngày 1 tháng 1 năm 1970, UTC) đến instant này.
- `Temporal.Instant.prototype[Symbol.toStringTag]`
  - : Giá trị ban đầu của thuộc tính [`[Symbol.toStringTag]`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Symbol/toStringTag) là chuỗi `"Temporal.Instant"`. Thuộc tính này được sử dụng trong {{jsxref("Object.prototype.toString()")}}.

## Phương thức thực thể

- {{jsxref("Temporal/Instant/add", "Temporal.Instant.prototype.add()")}}
  - : Trả về một đối tượng `Temporal.Instant` mới biểu diễn instant này tiến về phía trước một khoảng thời gian nhất định (ở dạng có thể chuyển đổi bằng {{jsxref("Temporal/Duration/from", "Temporal.Duration.from()")}}).
- {{jsxref("Temporal/Instant/equals", "Temporal.Instant.prototype.equals()")}}
  - : Trả về `true` nếu instant này tương đương về giá trị với một instant khác (ở dạng có thể chuyển đổi bằng {{jsxref("Temporal/Instant/from", "Temporal.Instant.from()")}}), và `false` nếu không. Chúng được so sánh bằng epoch nano giây của chúng. Tương đương với `Temporal.Instant.compare(this, other) === 0`.
- {{jsxref("Temporal/Instant/round", "Temporal.Instant.prototype.round()")}}
  - : Trả về một đối tượng `Temporal.Instant` mới biểu diễn instant này được làm tròn đến đơn vị đã cho.
- {{jsxref("Temporal/Instant/since", "Temporal.Instant.prototype.since()")}}
  - : Trả về một đối tượng {{jsxref("Temporal.Duration")}} mới biểu diễn khoảng thời gian từ một instant khác (ở dạng có thể chuyển đổi bằng {{jsxref("Temporal/Instant/from", "Temporal.Instant.from()")}}) đến instant này. Khoảng thời gian là dương nếu instant kia trước instant này, và âm nếu sau.
- {{jsxref("Temporal/Instant/subtract", "Temporal.Instant.prototype.subtract()")}}
  - : Trả về một đối tượng `Temporal.Instant` mới biểu diễn instant này lùi về phía sau một khoảng thời gian nhất định (ở dạng có thể chuyển đổi bằng {{jsxref("Temporal/Duration/from", "Temporal.Duration.from()")}}).
- {{jsxref("Temporal/Instant/toJSON", "Temporal.Instant.prototype.toJSON()")}}
  - : Trả về một chuỗi biểu diễn instant này theo cùng [định dạng RFC 9557](#rfc_9557_format) như khi gọi {{jsxref("Temporal/Instant/toString", "toString()")}}. Được thiết kế để được gọi ngầm định bởi {{jsxref("JSON.stringify()")}}.
- {{jsxref("Temporal/Instant/toLocaleString", "Temporal.Instant.prototype.toLocaleString()")}}
  - : Trả về một chuỗi với biểu diễn phụ thuộc ngôn ngữ của instant này. Trong các triển khai có hỗ trợ [API `Intl.DateTimeFormat`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Intl/DateTimeFormat), phương thức này ủy quyền cho `Intl.DateTimeFormat`.
- {{jsxref("Temporal/Instant/toString", "Temporal.Instant.prototype.toString()")}}
  - : Trả về một chuỗi biểu diễn instant này theo [định dạng RFC 9557](#rfc_9557_format) sử dụng múi giờ được chỉ định.
- {{jsxref("Temporal/Instant/toZonedDateTimeISO", "Temporal.Instant.prototype.toZonedDateTimeISO()")}}
  - : Trả về một đối tượng {{jsxref("Temporal.ZonedDateTime")}} mới biểu diễn instant này theo múi giờ được chỉ định sử dụng hệ thống lịch ISO 8601.
- {{jsxref("Temporal/Instant/until", "Temporal.Instant.prototype.until()")}}
  - : Trả về một đối tượng {{jsxref("Temporal.Duration")}} mới biểu diễn khoảng thời gian từ instant này đến một instant khác (ở dạng có thể chuyển đổi bằng {{jsxref("Temporal/Instant/from", "Temporal.Instant.from()")}}). Khoảng thời gian là dương nếu instant kia sau instant này, và âm nếu trước.
- {{jsxref("Temporal/Instant/valueOf", "Temporal.Instant.prototype.valueOf()")}}
  - : Ném một {{jsxref("TypeError")}}, ngăn chặn các thực thể `Temporal.Instant` bị [chuyển đổi ngầm định sang kiểu nguyên thủy](/en-US/docs/Web/JavaScript/Guide/Data_structures#primitive_coercion) khi được sử dụng trong các phép tính số học hoặc so sánh.

## Đặc tả

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{jsxref("Temporal")}}
- {{jsxref("Temporal.Duration")}}
- {{jsxref("Temporal.ZonedDateTime")}}
