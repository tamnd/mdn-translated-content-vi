---
title: Date.parse()
short-title: parse()
slug: Web/JavaScript/Reference/Global_Objects/Date/parse
page-type: javascript-static-method
browser-compat: javascript.builtins.Date.parse
sidebar: jsref
---

Phương thức tĩnh **`Date.parse()`** phân tích một biểu diễn chuỗi của một ngày và trả về [timestamp](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Date#the_epoch_timestamps_and_invalid_date) của ngày đó.

{{InteractiveExample("JavaScript Demo: Date.parse()")}}

```js interactive-example
// Standard date-time string format
const unixTimeZero = Date.parse("1970-01-01T00:00:00Z");
// Non-standard format resembling toUTCString()
const javaScriptRelease = Date.parse("04 Dec 1995 00:12:00 GMT");

console.log(unixTimeZero);
// Expected output: 0

console.log(javaScriptRelease);
// Expected output: 818035920000
```

## Cú pháp

```js-nolint
Date.parse(dateString)
```

### Tham số

- `dateString`
  - : Một chuỗi theo [định dạng chuỗi ngày giờ](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Date#date_time_string_format). Xem tài liệu tham khảo được liên kết để biết các lưu ý khi sử dụng các định dạng khác nhau.

### Giá trị trả về

Một số đại diện cho [timestamp](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Date#the_epoch_timestamps_and_invalid_date) của ngày đã cho. Nếu `dateString` không thể được phân tích như một ngày hợp lệ, {{jsxref("NaN")}} sẽ được trả về.

## Mô tả

Hàm này hữu ích để thiết lập giá trị ngày dựa trên các giá trị chuỗi, ví dụ kết hợp với phương thức {{jsxref("Date/setTime", "setTime()")}}.

Các định dạng mà `parse()` có thể xử lý không được quy định rõ ràng, nhưng có một vài {{Glossary("invariant", "bất biến")}}:

- [Định dạng chuỗi ngày giờ](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Date#date_time_string_format) (được tạo bởi {{jsxref("Date/toISOString", "toISOString()")}}) phải được hỗ trợ.
- Nếu `x` là bất kỳ Date nào có lượng mili giây bằng không, thì `x.valueOf()` phải bằng bất kỳ giá trị nào trong số sau: `Date.parse(x.toString())`, `Date.parse(x.toUTCString())`, `Date.parse(x.toISOString())`. Điều này có nghĩa là các định dạng được tạo bởi {{jsxref("Date/toString", "toString()")}} và {{jsxref("Date/toUTCString", "toUTCString()")}} cũng phải được hỗ trợ.
- Đặc tả _không_ yêu cầu hỗ trợ định dạng được tạo bởi {{jsxref("Date/toLocaleString", "toLocaleString()")}}. Tuy nhiên, các engine chính đều cố gắng hỗ trợ định dạng `toLocaleString("en-US")`.

Các định dạng khác được xác định bởi triển khai và có thể không hoạt động trên tất cả các trình duyệt. Một thư viện có thể giúp ích nếu cần hỗ trợ nhiều định dạng khác nhau. Trên thực tế, sự không đáng tin cậy của `Date.parse()` là một trong những động lực để giới thiệu API {{jsxref("Temporal")}}.

Vì `parse()` là một phương thức tĩnh của `Date`, bạn luôn sử dụng nó như `Date.parse()`, chứ không phải như phương thức của một đối tượng `Date` mà bạn đã tạo.

## Ví dụ

### Sử dụng Date.parse()

Tất cả các lệnh gọi sau đây trả về `1546300800000`. Lệnh gọi đầu tiên sẽ ngầm định là giờ UTC vì nó chỉ có ngày, và các lệnh khác chỉ định rõ múi giờ UTC.

```js
Date.parse("2019-01-01");
Date.parse("2019-01-01T00:00:00.000Z");
Date.parse("2019-01-01T00:00:00.000+00:00");
```

Lệnh gọi sau không chỉ định múi giờ sẽ được đặt thành 2019-01-01 lúc 00:00:00 theo múi giờ địa phương của hệ thống, vì nó có cả ngày và giờ.

```js
Date.parse("2019-01-01T00:00:00");
```

### Định dạng toString() và toUTCString()

Ngoài định dạng chuỗi ngày giờ chuẩn, các định dạng {{jsxref("Date/toString", "toString()")}} và {{jsxref("Date/toUTCString", "toUTCString()")}} cũng được hỗ trợ:

```js
// định dạng toString()
Date.parse("Thu Jan 01 1970 00:00:00 GMT-0500 (Eastern Standard Time)");
// 18000000 trong tất cả các triển khai ở tất cả các múi giờ

// định dạng toUTCString()
Date.parse("Thu, 01 Jan 1970 00:00:00 GMT");
// 0 trong tất cả các triển khai ở tất cả các múi giờ
```

### Chuỗi ngày không chuẩn

> [!NOTE]
> Phần này chứa hành vi phụ thuộc triển khai có thể không nhất quán giữa các trình duyệt hoặc các phiên bản trình duyệt khác nhau. Đây không phải là bảng tương thích trình duyệt toàn diện và bạn nên luôn tự kiểm tra trước khi sử dụng bất kỳ định dạng nào trong mã của mình.

Các triển khai thường mặc định theo múi giờ địa phương khi chuỗi ngày không chuẩn. Để nhất quán, chúng ta sẽ giả định rằng runtime sử dụng múi giờ UTC, và trừ khi được chỉ định khác, đầu ra sẽ thay đổi theo múi giờ của thiết bị. [Giờ tiết kiệm ánh sáng ban ngày (DST), của múi giờ địa phương, cũng có thể ảnh hưởng đến điều này](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Date/getTimezoneOffset#varied_results_in_daylight_saving_time_dst_regions).

Dưới đây là một số ví dụ khác về chuỗi ngày không chuẩn. Các trình duyệt rất khoan nhượng khi phân tích chuỗi ngày và có thể bỏ qua bất kỳ phần nào của chuỗi mà chúng không thể phân tích. Vì lý do tương thích, các trình duyệt thường sao chép hành vi của nhau, vì vậy các mẫu xử lý này có xu hướng lan truyền giữa các trình duyệt. Như đã nói ở trên, các ví dụ sau chỉ để minh họa và không toàn diện:

<table>
<thead>
<tr>
<th>Mô tả</th>
<th>Ví dụ</th>
<th>Chrome</th>
<th>Firefox</th>
<th>Safari</th>
</tr>
</thead>
<tbody>
<tr>
<td rowspan="3">Số đơn</td>
<td><code>0</code> (một chữ số)</td>
<td colspan="2">946684800000 (Jan 01 2000); NaN trong Firefox ≤122</td>
<td>-62167219200000 (Jan 01 0000)</td>
</tr>
<tr>
<td><code>31</code> (hai chữ số)</td>
<td colspan="2">NaN</td>
<td>-61188912000000 (Jan 01 0031)</td>
</tr>
<tr>
<td><code>999</code> (ba/bốn chữ số)</td>
<td colspan="3">-30641733102000 (Jan 01 0999)</td>
</tr>
<tr>
<td rowspan="4">Chuỗi ngày sử dụng các dấu phân cách khác nhau</td>
<td><code>1970-01-01</code> (chuẩn)</td>
<td colspan="3">0 trong tất cả các múi giờ</td>
</tr>
<tr>
<td><code>1970/01/01</code></td>
<td colspan="3">0</td>
</tr>
<tr>
<td><code>1970,01,01</code></td>
<td colspan="2">0</td>
<td>NaN</td>
</tr>
<tr>
<td><code>1970 01 01</code></td>
<td colspan="2">0</td>
<td>NaN</td>
</tr>
<tr>
<td>Chuỗi trông giống <code>toString()</code></td>
<td><code>Thu&nbsp;Jan&nbsp;01&nbsp;1970&nbsp;00:00:00</code><br><code>Thu Jan 01 1970</code><br><code>Jan 01 1970 00:00:00</code><br><code>Jan 01 1970</code></td>
<td colspan="3">0</td>
</tr>
<tr>
<td>Chuỗi trông giống <code>toUTCString()</code></td>
<td><code>Thu, 01 Jan 1970 00:00:00</code><br><code>Thu, 01 Jan 1970</code><br><code>01 Jan 1970 00:00:00</code><br><code>01 Jan 1970</code></td>
<td colspan="3">0</td>
</tr>
<tr>
<td rowspan="4">Thành phần ngày đầu tiên là 2 chữ số</td>
<td><code>01-02-03</code> (phần đầu có thể là tháng hợp lệ)</td>
<td colspan="2">1041465600000 (Jan 02 2003)</td>
<td>-62132745600000 (Feb 03 0001)<br>Lưu ý: Safari luôn giả định YY-MM-DD, nhưng MM/DD/YY.</td>
</tr>
<tr>
<td><code>27-02-03</code> (phần đầu có thể là ngày hợp lệ nhưng không phải tháng)</td>
<td colspan="2">NaN</td>
<td>-61312291200000 (Feb 03 0027)</td>
</tr>
<tr>
<td><code>49-02-03</code> (phần đầu không thể là ngày hợp lệ và &lt;50)</td>
<td colspan="2">2495923200000 (Feb 03 2049)</td>
<td>-60617980800000 (Feb 03 0049)</td>
</tr>
<tr>
<td><code>50-02-03</code> (phần đầu không thể là ngày hợp lệ và ≥50)</td>
<td colspan="2">-628300800000 (Feb 03 1950)</td>
<td>-60586444800000 (Feb 03 0050)</td>
</tr>
<tr>
<td rowspan="3">Thành phần ngày ngoài phạm vi</td>
<td><code>2014-25-23</code><br><code>Mar 32, 2014</code><br><code>2014/25/23</code></td>
<td colspan="3">NaN</td>
</tr>
<tr>
<td><code>2014-02-30</code></td>
<td colspan="2">1393718400000 (Mar 02 2014)</td>
<td>NaN</td>
</tr>
<tr>
<td><code>02/30/2014</code></td>
<td colspan="3">1393718400000</td>
</tr>
<tr>
<td rowspan="5">Ký tự thừa sau tên tháng</td>
<td><code>04 Dec 1995</code><br><code>04 Decem 1995</code><br><code>04 December 1995</code></td>
<td colspan="3">818031600000</td>
</tr>
<tr>
<td><code>04 DecFoo 1995</code></td>
<td colspan="3">818031600000<br>Chỉ ba ký tự đầu tiên được đọc.<br>Firefox ≤121 đọc đến tên tháng hợp lệ, do đó trả về NaN khi gặp "F".</td>
</tr>
<tr>
<td><code>04 De 1995</code></td>
<td colspan="3">NaN</td>
</tr>
</tbody>
</table>

## Thông số kỹ thuật

{{Specifications}}

## Khả năng tương thích với trình duyệt

{{Compat}}

## Xem thêm

- {{jsxref("Date.UTC()")}}
