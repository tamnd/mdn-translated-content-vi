---
title: Date() constructor
short-title: Date()
slug: Web/JavaScript/Reference/Global_Objects/Date/Date
page-type: javascript-constructor
browser-compat: javascript.builtins.Date.Date
sidebar: jsref
---

Hàm tạo **`Date()`** tạo các đối tượng {{jsxref("Date")}}. Khi được gọi như một hàm thông thường, nó trả về một chuỗi đại diện cho thời gian hiện tại.

{{InteractiveExample("JavaScript Demo: Date() constructor")}}

```js interactive-example
const date1 = new Date("December 17, 1995 03:24:00");
// Sun Dec 17 1995 03:24:00 GMT...

const date2 = new Date("1995-12-17T03:24:00");
// Sun Dec 17 1995 03:24:00 GMT...

console.log(date1.getTime() === date2.getTime());
// Expected output: true
```

## Cú pháp

```js-nolint
new Date()
new Date(value)
new Date(dateString)
new Date(dateObject)

new Date(year, monthIndex)
new Date(year, monthIndex, day)
new Date(year, monthIndex, day, hours)
new Date(year, monthIndex, day, hours, minutes)
new Date(year, monthIndex, day, hours, minutes, seconds)
new Date(year, monthIndex, day, hours, minutes, seconds, milliseconds)

Date()
```

> [!NOTE]
> `Date()` có thể được gọi có hoặc không có [`new`](/en-US/docs/Web/JavaScript/Reference/Operators/new), nhưng với các hiệu ứng khác nhau. Xem [Giá trị trả về](#giá_trị_trả_về).

### Tham số

Có năm dạng cơ bản cho hàm tạo `Date()`:

#### Không có tham số

Khi không có tham số nào được cung cấp, đối tượng `Date` mới tạo sẽ đại diện cho ngày và giờ hiện tại tại thời điểm khởi tạo. [Timestamp](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Date#the_epoch_timestamps_and_invalid_date) của ngày được trả về giống với số được trả về bởi {{jsxref("Date.now()")}}.

#### Giá trị thời gian hoặc số timestamp

- `value`
  - : Một giá trị số nguyên đại diện cho [timestamp](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Date#the_epoch_timestamps_and_invalid_date) (số mili giây kể từ nửa đêm đầu ngày 1 tháng 1 năm 1970, UTC — còn gọi là [epoch](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Date#the_epoch_timestamps_and_invalid_date)).

#### Chuỗi ngày tháng

- `dateString`
  - : Một giá trị chuỗi đại diện cho một ngày, được phân tích và giải thích bằng thuật toán được triển khai bởi {{jsxref("Date.parse()")}}. Xem [định dạng chuỗi ngày giờ](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Date#date_time_string_format) để biết các lưu ý khi sử dụng các định dạng khác nhau.

#### Đối tượng Date

- `dateObject`
  - : Một đối tượng `Date` đã tồn tại. Điều này thực chất tạo một bản sao của đối tượng `Date` hiện có với cùng ngày và giờ. Điều này tương đương với `new Date(dateObject.valueOf())`, ngoại trừ phương thức `valueOf()` không được gọi.

Khi một tham số được truyền vào hàm tạo `Date()`, các đối tượng `Date` được xử lý đặc biệt. Tất cả các giá trị khác được [chuyển đổi thành kiểu nguyên thủy](/en-US/docs/Web/JavaScript/Guide/Data_structures#primitive_coercion). Nếu kết quả là một chuỗi, nó sẽ được phân tích như một chuỗi ngày tháng. Nếu không, kiểu nguyên thủy kết quả sẽ tiếp tục được ép buộc thành một số và được coi là timestamp.

#### Các giá trị thành phần ngày và giờ riêng lẻ

Cho ít nhất một năm và tháng, dạng này của `Date()` trả về một đối tượng `Date` mà các giá trị thành phần (năm, tháng, ngày, giờ, phút, giây và mili giây) đều đến từ các tham số sau đây. Bất kỳ trường nào bị thiếu sẽ được gán giá trị thấp nhất có thể (`1` cho `day` và `0` cho mọi thành phần khác). Các giá trị tham số được đánh giá theo múi giờ địa phương, chứ không phải UTC. {{jsxref("Date.UTC()")}} chấp nhận các tham số tương tự nhưng giải thích các thành phần là UTC và trả về một timestamp.

Nếu bất kỳ tham số nào vượt quá giới hạn được xác định, nó sẽ "tràn sang". Ví dụ, nếu một `monthIndex` lớn hơn `11` được truyền vào, những tháng đó sẽ làm tăng năm; nếu một `minutes` lớn hơn `59` được truyền vào, `hours` sẽ tăng theo tương ứng, v.v. Do đó, `new Date(1990, 12, 1)` sẽ trả về ngày 1 tháng 1 năm 1991; `new Date(2020, 5, 19, 25, 65)` sẽ trả về 2:05 SA ngày 20 tháng 6 năm 2020.

Tương tự, nếu bất kỳ tham số nào thiếu, nó sẽ "mượn" từ các vị trí cao hơn. Ví dụ, `new Date(2020, 5, 0)` sẽ trả về ngày 31 tháng 5 năm 2020.

- `year`
  - : Giá trị số nguyên đại diện cho năm. Các giá trị từ `0` đến `99` tương ứng với các năm `1900` đến `1999`. Tất cả các giá trị khác là năm thực tế. Xem [ví dụ](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Date#interpretation_of_two-digit_years).
- `monthIndex`
  - : Giá trị số nguyên đại diện cho tháng, bắt đầu với `0` cho tháng Giêng đến `11` cho tháng Mười Hai.
- `day` {{optional_inline}}
  - : Giá trị số nguyên đại diện cho ngày trong tháng. Mặc định là `1`.
- `hours` {{optional_inline}}
  - : Giá trị số nguyên từ `0` đến `23` đại diện cho giờ trong ngày. Mặc định là `0`.
- `minutes` {{optional_inline}}
  - : Giá trị số nguyên đại diện cho phần phút của thời gian. Mặc định là `0`.
- `seconds` {{optional_inline}}
  - : Giá trị số nguyên đại diện cho phần giây của thời gian. Mặc định là `0`.
- `milliseconds` {{optional_inline}}
  - : Giá trị số nguyên đại diện cho phần mili giây của thời gian. Mặc định là `0`.

### Giá trị trả về

Gọi `new Date()` (hàm tạo `Date()`) trả về một đối tượng [`Date`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Date). Nếu được gọi với một chuỗi ngày tháng không hợp lệ, hoặc nếu ngày cần xây dựng có timestamp nhỏ hơn `-8,640,000,000,000,000` hoặc lớn hơn `8,640,000,000,000,000` mili giây, nó trả về một [ngày không hợp lệ](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Date#the_epoch_timestamps_and_invalid_date) (một đối tượng `Date` mà phương thức {{jsxref("Date/toString", "toString()")}} trả về `"Invalid Date"` và phương thức {{jsxref("Date/valueOf", "valueOf()")}} trả về `NaN`).

Gọi hàm `Date()` (không có từ khóa `new`) trả về một biểu diễn chuỗi của ngày và giờ hiện tại, giống như `new Date().toString()` thực hiện. Bất kỳ đối số nào được truyền trong một lệnh gọi hàm `Date()` (không có từ khóa `new`) đều bị bỏ qua; bất kể nó được gọi với một chuỗi ngày tháng không hợp lệ hay thậm chí được gọi với bất kỳ đối tượng tùy ý hoặc kiểu nguyên thủy nào khác làm đối số — nó luôn trả về một biểu diễn chuỗi của ngày và giờ hiện tại.

## Mô tả

### Độ chính xác thời gian giảm

Để bảo vệ chống lại các cuộc tấn công định thời và [lấy dấu vân tay](/en-US/docs/Glossary/Fingerprinting), độ chính xác của `new Date()` có thể bị làm tròn tùy thuộc vào cài đặt trình duyệt. Trong Firefox, tùy chọn `privacy.reduceTimerPrecision` được bật theo mặc định và mặc định là 2ms. Bạn cũng có thể bật `privacy.resistFingerprinting`, trong trường hợp đó độ chính xác sẽ là 100ms hoặc giá trị của `privacy.resistFingerprinting.reduceTimerPrecision.microseconds`, tùy thuộc vào giá trị nào lớn hơn.

Ví dụ, với độ chính xác thời gian giảm, kết quả của `new Date().getTime()` sẽ luôn là bội số của 2, hoặc bội số của 100 (hoặc `privacy.resistFingerprinting.reduceTimerPrecision.microseconds`) khi `privacy.resistFingerprinting` được bật.

```js
// độ chính xác thời gian giảm (2ms) trong Firefox 60
new Date().getTime();
// Có thể là:
// 1519211809934
// 1519211810362
// 1519211811670
// …

// độ chính xác thời gian giảm với `privacy.resistFingerprinting` được bật
new Date().getTime();
// Có thể là:
// 1519129853500
// 1519129858900
// 1519129864400
// …
```

## Ví dụ

### Nhiều cách tạo đối tượng Date

Các ví dụ sau đây minh họa nhiều cách để tạo ngày JavaScript:

```js
const today = new Date();
const birthday = new Date("December 17, 1995 03:24:00"); // KHÔNG KHUYẾN KHÍCH: có thể không hoạt động trong tất cả các runtime
const birthday = new Date("1995-12-17T03:24:00"); // Đây là chuẩn và sẽ hoạt động đáng tin cậy
const birthday = new Date(1995, 11, 17); // tháng được đánh chỉ số từ 0
const birthday = new Date(1995, 11, 17, 3, 24, 0);
const birthday = new Date(628021800000); // truyền epoch timestamp
```

### Truyền giá trị không phải Date, không phải chuỗi, không phải số

Nếu hàm tạo `Date()` được gọi với một tham số không phải là đối tượng `Date`, nó sẽ bị ép buộc thành kiểu nguyên thủy và sau đó được kiểm tra xem có phải là chuỗi không. Ví dụ, `new Date(undefined)` khác với `new Date()`:

```js
console.log(new Date(undefined)); // Invalid Date
```

Điều này là do `undefined` đã là một kiểu nguyên thủy nhưng không phải chuỗi, vì vậy nó sẽ bị ép buộc thành một số, là [`NaN`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/NaN) và do đó không phải là timestamp hợp lệ. Mặt khác, `null` sẽ bị ép buộc thành `0`.

```js
console.log(new Date(null)); // 1970-01-01T00:00:00.000Z
```

[Mảng](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Array) sẽ bị ép buộc thành chuỗi qua [`Array.prototype.toString()`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Array/toString), nối các phần tử bằng dấu phẩy. Tuy nhiên, chuỗi kết quả cho bất kỳ mảng nào có nhiều hơn một phần tử không phải là chuỗi ngày ISO 8601 hợp lệ, vì vậy hành vi phân tích của nó sẽ phụ thuộc vào triển khai. **Đừng truyền mảng vào hàm tạo `Date()`.**

```js
console.log(new Date(["2020-06-19", "17:13"]));
// 2020-06-19T17:13:00.000Z trong Chrome, vì nó nhận ra "2020-06-19,17:13"
// "Invalid Date" trong Firefox
```

## Thông số kỹ thuật

{{Specifications}}

## Khả năng tương thích với trình duyệt

{{Compat}}

## Xem thêm

- {{jsxref("Date")}}
