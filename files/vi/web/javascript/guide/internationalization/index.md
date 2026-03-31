---
title: Internationalization
slug: Web/JavaScript/Guide/Internationalization
page-type: guide
sidebar: jssidebar
---

{{PreviousNext("Web/JavaScript/Guide/Resource_management", "Web/JavaScript/Guide/Modules")}}

Đối tượng {{jsxref("Intl")}} là namespace cho ECMAScript Internationalization API, cung cấp nhiều loại dữ liệu và thao tác nhạy cảm với locale và văn hóa.

## Tổng quan

Đối tượng `Intl` rất hướng theo use-case. Nó cung cấp một đối tượng riêng biệt cho từng use-case cần logic theo locale. Hiện tại, nó cung cấp các chức năng sau:

- [Lấy thông tin về locale](#locale_information) bằng {{jsxref("Intl.Locale")}}.
- [Định dạng dữ liệu](#formatting_data) bằng {{jsxref("Intl.DateTimeFormat")}}, {{jsxref("Intl.DurationFormat")}}, {{jsxref("Intl.ListFormat")}}, {{jsxref("Intl.NumberFormat")}}, và {{jsxref("Intl.RelativeTimeFormat")}}.
- [Collation](#collation) (tức là, so sánh chuỗi để sắp xếp hoặc tìm kiếm) bằng {{jsxref("Intl.Collator")}}.
- [Chọn dạng số nhiều](#plural_rules) bằng {{jsxref("Intl.PluralRules")}}.
- [Phân đoạn văn bản](#segmentation) thành các đơn vị như từ, câu, hoặc grapheme bằng {{jsxref("Intl.Segmenter")}}.
- [Lấy tên hiển thị](#display_names) cho tiền tệ, ngôn ngữ, script, vùng và múi giờ bằng {{jsxref("Intl.DisplayNames")}}.

Hầu hết các API `Intl` đều có thiết kế tương tự ({{jsxref("Intl.Locale")}} là trường hợp ngoại lệ duy nhất). Bạn bắt đầu bằng cách xây dựng một instance với locale và các tùy chọn mong muốn. Điều này xác định một tập hợp các quy tắc cho thao tác mong muốn (định dạng, collation, segmentation, v.v.). Sau đó, khi bạn gọi phương thức trên instance, chẳng hạn như `format()`, `compare()`, hay `segment()`, đối tượng áp dụng quy tắc đã chỉ định cho dữ liệu được truyền vào.

```js
// 1. Construct a formatter object, specifying the locale and formatting options:
const price = new Intl.NumberFormat("en-US", {
  style: "currency",
  currency: "USD",
});

// 2. Use the `format` method of the formatter object to format a number:
console.log(price.format(5.259)); // $5.26
```

Chữ ký chung của constructor là:

```js-nolint
new Intl.SomeObject(locales, options)
```

- `locales` {{optional_inline}}
  - : Một chuỗi với {{glossary("BCP 47 language tag")}} hoặc instance {{jsxref("Intl.Locale")}}, hoặc một mảng các identifier locale như vậy. Locale mặc định của runtime được sử dụng khi `undefined` được truyền hoặc khi không có identifier locale nào được chỉ định được hỗ trợ. Để biết dạng tổng quát và cách diễn giải đối số `locales`, xem [mô tả tham số trên trang chính `Intl`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Intl#locales_argument).
- `options` {{optional_inline}}
  - : Một đối tượng chứa các thuộc tính tùy chỉnh các khía cạnh cụ thể của thao tác, đây là điều cốt lõi để hiểu cách sử dụng từng đối tượng `Intl`.

## Thông tin locale

Các locale là nền tảng của mọi hành vi trong `Intl`. Một _locale_ là một tập hợp các quy ước, được đại diện trong `Intl` API bởi đối tượng {{jsxref("Intl.Locale")}}. Tất cả các constructor `Intl` chấp nhận language tag cũng chấp nhận các đối tượng `Intl.Locale`.

Mỗi locale chủ yếu được định nghĩa bởi bốn thứ: {{jsxref("Intl/Locale/language", "language")}}, {{jsxref("Intl/Locale/script", "script")}}, {{jsxref("Intl/Locale/region", "region")}}, và đôi khi một số {{jsxref("Intl/Locale/variants", "variants")}}. Khi kết hợp với nhau bằng `-` theo thứ tự đó, chúng tạo thành một {{glossary("BCP 47 language tag")}}.

- Ngôn ngữ là phần quan trọng nhất của locale và là bắt buộc. Khi chỉ cần một ngôn ngữ, như `en` hoặc `fr`, có các thuật toán để suy ra phần còn lại của thông tin (xem {{jsxref("Intl/Locale/maximize", "Intl.Locale.prototype.maximize()")}}).
- Tuy nhiên, bạn thường muốn chỉ định vùng nữa, vì các quy ước có thể khác nhau đáng kể giữa các vùng nói cùng ngôn ngữ. Ví dụ, định dạng ngày ở Mỹ là MM/DD/YYYY, trong khi ở Anh là DD/MM/YYYY, nên việc chỉ định `en-US` hoặc `en-GB` rất quan trọng.
- Bạn cũng có thể chỉ định script. Script là hệ thống chữ viết, hay các ký tự dùng để phiên âm ngôn ngữ. Trong thực tế, script thường không cần thiết, vì ngôn ngữ được sử dụng ở một vùng nhất định thường chỉ được viết bằng một script. Tuy nhiên, có những ngoại lệ như tiếng Serbia, có thể được viết bằng script Latin và Cyrillic (`sr-Latn` và `sr-Cyrl`), hoặc tiếng Trung, có thể được viết bằng cả script Giản thể và Phồn thể (`zh-Hans` và `zh-Hant`).
- Các variants hiếm khi được sử dụng. Thông thường, chúng biểu thị các cách viết chính tả khác nhau; ví dụ, tiếng Đức có hai biến thể chính tả `1901` và `1996`, được viết là `de-1901` và `de-1996`.

```js
// These two are equivalent when passed to other Intl APIs
const locale1 = new Intl.Locale("en-US");
const locale2 = new Intl.Locale("en-Latn-US");

console.log(locale1.language, locale1.script, locale1.region); // "en", undefined, "US"
console.log(locale2.language, locale2.script, locale2.region); // "en", "Latn", "US"
```

Locale cũng chứa một tập hợp các quy ước được sử dụng bởi nền văn hóa cụ thể đó:

<table>
<thead><tr><th>Use case</th><th>Thuộc tính</th><th>Mô tả</th><th>Extension subtag</th></tr></thead>
<tbody>
<tr>
<td rowspan="2">Định dạng ngày/giờ</td>
<td>{{jsxref("Intl/Locale/calendar", "calendar")}}</td>
<td>Được dùng để nhóm ngày thành năm, tháng và tuần, và đặt tên cho chúng. Ví dụ, ngày <code>gregory</code> "2022-01-01" trở thành "28 Tevet 5782" trong lịch <code>hebrew</code>.</td>
<td><code>ca</code></td>
</tr>
<tr>
<td>{{jsxref("Intl/Locale/hourCycle", "hourCycle")}}</td>
<td>Quyết định xem thời gian được hiển thị theo định dạng 12 giờ hay 24 giờ, và liệu số giờ nhỏ nhất là 0 hay 1.</td>
<td><code>hc</code></td>
</tr>
<tr>
<td>Định dạng số, bao gồm ngày tháng, thời gian, khoảng thời gian, v.v.</td>
<td>{{jsxref("Intl/Locale/numberingSystem", "numberingSystem")}}</td>
<td>Chuyển đổi số thành ký hiệu theo locale cụ thể. Hệ thống <code>0123456789</code> thông thường được gọi là <code>latn</code> (Latin). Thông thường, mỗi script có một hệ thống đánh số chỉ là bản dịch từng chữ số, nhưng một số script có nhiều hơn một hệ thống đánh số, một số có thể không thường viết số bằng script đó (ví dụ, tiếng Trung có hệ thống đánh số <code>hanidec</code> riêng, nhưng hầu hết văn bản dùng hệ thống <code>latn</code> tiêu chuẩn), và một số khác có thể yêu cầu các thuật toán chuyển đổi đặc biệt (ví dụ, chữ số La Mã — <code>roman</code>).</td>
<td><code>nu</code></td>
</tr>
<tr>
<td rowspan="3">Collation</td>
<td>{{jsxref("Intl/Locale/collation", "collation")}}</td>
<td>Xác định thuật toán collation chung. Ví dụ, nếu bạn dùng collation <code>phonebk</code> của tiếng Đức, thì "ä" được xử lý như "ae", và sẽ được sắp xếp giữa "ad" và "af".</td>
<td><code>co</code></td>
</tr>
<tr>
<td>{{jsxref("Intl/Locale/caseFirst", "caseFirst")}}</td>
<td>Quyết định xem chữ hoa hay chữ thường nên được sắp xếp trước, hoặc có bỏ qua casing hay không.</td>
<td><code>kf</code></td>
</tr>
<tr>
<td>{{jsxref("Intl/Locale/numeric", "numeric")}}</td>
<td>Quyết định xem các số có được sắp xếp như số hay như chuỗi. Ví dụ, nếu là true, "10" sẽ được sắp xếp sau "2".</td>
<td><code>kn</code></td>
</tr>
</tbody>
</table>

Bạn có thể chỉ định rõ ràng những thuộc tính này khi xây dựng `Intl.Locale` hoặc truyền language tag cho các constructor `Intl` khác. Có hai cách để làm điều này — thêm chúng vào language tag hoặc chỉ định chúng như các tùy chọn.

- Để thêm chúng vào language tag, trước tiên bạn thêm chuỗi `-u` (có nghĩa là "Unicode extension"), rồi extension subtag như đã nêu ở trên, rồi giá trị.
- Để chỉ định chúng như các tùy chọn, bạn chỉ cần thêm tên thuộc tính như đã nêu ở trên, cùng với giá trị của nó, vào đối tượng `options`.

Sử dụng `Intl.DateTimeFormat` làm ví dụ, cả hai dòng sau đây tạo một formatter định dạng ngày theo lịch Hebrew:

```js
const df1 = new Intl.DateTimeFormat("en-US-u-ca-hebrew");
const df2 = new Intl.DateTimeFormat("en-US", { calendar: "hebrew" });
```

Các thuộc tính không được nhận ra sẽ bị bỏ qua, nên bạn có thể sử dụng cú pháp tương tự như trên với `Intl.NumberFormat`, nhưng nó sẽ không làm gì khác so với chỉ truyền `en-US`, vì định dạng số không sử dụng thuộc tính `calendar`.

Việc lấy các giá trị mặc định của các quy ước locale này khá phức tạp. `new Intl.Locale("en-US").calendar` trả về `undefined`, vì đối tượng `Locale` chỉ chứa thông tin bạn đã truyền cho nó. Lịch mặc định về mặt lý thuyết phụ thuộc vào API nào bạn đang sử dụng lịch với, nên để lấy lịch mặc định của `en-US` như được dùng bởi `Intl.DateTimeFormat`, bạn có thể sử dụng phương thức {{jsxref("Intl/DateTimeFormat/resolvedOptions", "resolvedOptions()")}} của nó. Tương tự với các thuộc tính khác.

```js
const locale = new Intl.Locale("en-US");
console.log(locale.calendar); // undefined; it's not provided
console.log(new Intl.DateTimeFormat(locale).resolvedOptions().calendar); // "gregory"
```

Các đối tượng `Intl.Locale` làm hai việc đồng thời: chúng đại diện cho một BCP 47 language tag đã được phân tích (như được minh họa ở trên), và chúng cung cấp thông tin về locale đó. Tất cả các thuộc tính của nó, như `calendar`, chỉ được trích xuất từ đầu vào, mà không truy vấn bất kỳ nguồn dữ liệu nào về các giá trị mặc định. Mặt khác, nó có một nhóm phương thức để truy vấn thông tin thực tế về locale. Ví dụ, các phương thức {{jsxref("Intl/Locale/getCalendars", "getCalendars()")}}, {{jsxref("Intl/Locale/getHourCycles", "getHourCycles()")}}, {{jsxref("Intl/Locale/getNumberingSystems", "getNumberingSystems()")}}, và {{jsxref("Intl/Locale/getCollations", "getCollations()")}} bổ sung các thuộc tính `calendar`, `hourCycle`, `numberingSystem`, và `collation`, và mỗi thuộc tính trả về một mảng các giá trị ưu tiên cho thuộc tính đó.

```js
const locale = new Intl.Locale("ar-EG");
console.log(locale.getCalendars()); // ['gregory', 'coptic', 'islamic', 'islamic-civil', 'islamic-tbla']
```

Các instance `Intl.Locale` cũng chứa các phương thức khác cung cấp thông tin hữu ích, chẳng hạn như {{jsxref("Intl/Locale/getTextInfo", "getTextInfo()")}}, {{jsxref("Intl/Locale/getTimeZones", "getTimeZones()")}}, và {{jsxref("Intl/Locale/getWeekInfo", "getWeekInfo()")}}.

## Xác định locale

Một mối quan tâm chung khi internationalization là: tôi nên dùng locale nào?

Câu trả lời rõ ràng nhất là "những gì người dùng thích." Trình duyệt hiển thị sở thích ngôn ngữ của người dùng thông qua thuộc tính {{domxref("Navigator/languages", "navigator.languages")}}. Đây là một mảng các identifier ngôn ngữ có thể được truyền trực tiếp cho constructor formatter — sẽ nói thêm về điều này sau. Người dùng có thể cấu hình danh sách này trong cài đặt trình duyệt. Bạn cũng có thể truyền một mảng rỗng hoặc `undefined`, cả hai đều khiến locale mặc định của trình duyệt được sử dụng.

```js
const numberFormatter = new Intl.NumberFormat(navigator.languages);
console.log(numberFormatter.format(1234567.89));

const numberFormatter2 = new Intl.NumberFormat([]);
```

Tuy nhiên, điều này có thể không luôn cung cấp kết quả mong muốn nhất. Các chuỗi được định dạng bởi `Intl` formatters chỉ chiếm một phần nhỏ văn bản hiển thị trên trang web của bạn; hầu hết nội dung đã được địa phương hóa được cung cấp bởi bạn, nhà phát triển trang web. Ví dụ, giả sử trang web của bạn chỉ có hai ngôn ngữ: tiếng Anh và tiếng Pháp. Nếu một người dùng Nhật Bản truy cập trang web của bạn và mong muốn sử dụng trang web bằng tiếng Anh, họ sẽ bối rối khi thấy văn bản tiếng Anh xen kẽ với các con số và ngày tháng bằng tiếng Nhật!

Thông thường, bạn không muốn sử dụng ngôn ngữ mặc định của trình duyệt. Thay vào đó, bạn muốn sử dụng cùng ngôn ngữ mà phần còn lại của trang web được cung cấp. Giả sử trang web của bạn có một công tắc ngôn ngữ lưu trữ lựa chọn của người dùng ở đâu đó — bạn có thể sử dụng trực tiếp điều đó.

```js
// Suppose this can be changed by some site-wide control
const userSettings = {
  locale: "en-US",
  colorMode: "dark",
};
const numberFormatter = new Intl.NumberFormat(userSettings.locale);
console.log(numberFormatter.format(1234567.89));
```

Nếu trang web của bạn có backend động chọn ngôn ngữ dựa trên header {{httpheader("Accept-Language")}} của người dùng và gửi lại HTML khác dựa trên đó, bạn cũng có thể sử dụng thuộc tính {{domxref("HTMLElement.lang")}} của phần tử HTML: `new Intl.NumberFormat(document.documentElement.lang)`.

Nếu trang web của bạn chỉ có một ngôn ngữ, bạn cũng có thể hardcode locale trong code: `new Intl.NumberFormat("en-US")`.

Như đã đề cập trước đây, bạn cũng có thể truyền một mảng các locale cho constructor, đại diện cho danh sách các lựa chọn dự phòng. Ví dụ đầu tiên sử dụng `navigator.languages` là một ví dụ về điều này: nếu locale đầu tiên được cấu hình bởi người dùng không được hỗ trợ cho thao tác cụ thể, cái tiếp theo sẽ được thử, v.v., cho đến khi chúng ta tìm thấy một locale được yêu cầu mà runtime có dữ liệu. Bạn cũng có thể làm điều này thủ công. Trong ví dụ dưới đây, chúng ta chỉ định danh sách các locale theo thứ tự giảm dần về độ cụ thể, tất cả đại diện cho các ngôn ngữ mà người nói tiếng Trung Hồng Kông có thể hiểu được, nên formatter chọn cái cụ thể nhất mà nó hỗ trợ.

```js
const numberFormatter = new Intl.NumberFormat([
  "yue-Hant",
  "zh-Hant-HK",
  "zh-Hant",
  "zh",
]);
```

Không có API nào để liệt kê tất cả các locale được hỗ trợ, nhưng có một vài phương thức để xử lý danh sách locale:

- {{jsxref("Intl.getCanonicalLocales()")}}: Hàm này nhận một danh sách các identifier locale và trả về danh sách các identifier locale đã được chuẩn hóa. Điều này hữu ích để hiểu quá trình chuẩn hóa cho mỗi constructor `Intl`.
- Phương thức tĩnh `supportedLocalesOf()` trên mỗi đối tượng `Intl` (như {{jsxref("Intl.DateTimeFormat.supportedLocalesOf()")}}): Phương thức này nhận cùng đối số như constructor (`locales` và `options`) và trả về tập con của các language tag đã cho khớp với dữ liệu đã cho. Điều này hữu ích để hiểu các locale nào được runtime hỗ trợ cho một thao tác cụ thể, ví dụ để hiển thị công tắc ngôn ngữ chỉ chứa các ngôn ngữ được hỗ trợ.

## Hiểu giá trị trả về

Mối quan tâm chung thứ hai cho tất cả các đối tượng là "phương thức trả về gì?" Đây là câu hỏi khó trả lời ngoài cấu trúc hoặc kiểu của giá trị trả về vì không có đặc tả chuẩn mực nào nói _chính xác_ những gì nên được trả về. Hầu hết thời gian, kết quả của một phương thức là nhất quán. Tuy nhiên, đầu ra có thể khác nhau giữa các implementation, ngay cả trong cùng locale — các biến thể đầu ra được thiết kế và được phép bởi đặc tả. Nó cũng có thể không như bạn mong đợi. Ví dụ, chuỗi được trả về bởi `format()` có thể sử dụng khoảng trắng không ngắt hoặc được bao quanh bởi các ký tự điều khiển hai chiều. Bạn không nên so sánh kết quả của bất kỳ phương thức `Intl` nào với các hằng số hardcode; chúng chỉ nên được hiển thị cho người dùng.

Tất nhiên, câu trả lời này có vẻ không thỏa đáng, vì hầu hết các nhà phát triển đều muốn kiểm soát đầu ra trông như thế nào — ít nhất, bạn không muốn người dùng của mình bị nhầm lẫn bởi đầu ra vô nghĩa. Dưới đây là một số hướng dẫn nếu bạn muốn thực hiện kiểm tra, dù tự động hay thủ công:

- Kiểm tra tất cả các locale mà người dùng của bạn có thể sử dụng. Điều này dễ hơn nếu bạn có một tập hợp locale được hỗ trợ cố định (ví dụ qua công tắc ngôn ngữ). Nếu bạn đang sử dụng bất cứ thứ gì người dùng thích, bạn có thể chọn một vài cái phổ biến cho người dùng của mình, nhưng hãy lưu ý rằng những gì người dùng thấy có thể thay đổi. Bạn thường có thể giả lập sở thích người dùng qua cấu hình test runner hoặc mock các constructor `Intl`.
- Kiểm tra trên nhiều JavaScript engine. `Intl` API được implement trực tiếp bởi JavaScript engine, nên ví dụ bạn nên mong đợi Node.js và Chrome (cả hai đều dùng V8) có cùng đầu ra, trong khi Firefox (dùng SpiderMonkey) có thể có đầu ra khác. Mặc dù tất cả các engine thường dùng dữ liệu CLDR, họ thường xử lý hậu kỳ theo những cách khác nhau. Một số cài đặt build trình duyệt (ví dụ để giảm kích thước cài đặt) cũng có thể ảnh hưởng đến các locale và tùy chọn nào được hỗ trợ.
- Đừng giả định đầu ra. Điều này có nghĩa là bạn không nên viết đầu ra bằng tay, chẳng hạn `expect(result).toBe("foo")`. Thay vào đó, hãy sử dụng snapshot testing hoặc sao chép giá trị chuỗi từ đầu ra của một lần chạy test.

## Định dạng dữ liệu

Một use-case chính của `Intl` là xuất ra các văn bản theo locale cụ thể đại diện cho dữ liệu có cấu trúc. Điều này tương tự phần mềm dịch thuật, nhưng thay vì cho phép bạn dịch văn bản tùy ý, nó lấy dữ liệu như ngày tháng, số và danh sách, và định dạng chúng theo các quy tắc theo locale cụ thể.

Các đối tượng {{jsxref("Intl.DateTimeFormat")}}, {{jsxref("Intl.DurationFormat")}}, {{jsxref("Intl.ListFormat")}}, {{jsxref("Intl.NumberFormat")}}, và {{jsxref("Intl.RelativeTimeFormat")}} mỗi cái định dạng một loại dữ liệu. Mỗi instance cung cấp hai phương thức:

- `format()`: Nhận một dữ liệu và trả về một chuỗi sử dụng quy tắc định dạng được xác định bởi locale và các tùy chọn.
- `formatToParts()`: Nhận cùng dữ liệu và trả về cùng chuỗi, nhưng được chia thành các phần, mỗi phần là một đối tượng với `type` và `value`. Điều này hữu ích cho các use-case nâng cao hơn, chẳng hạn như xen kẽ văn bản được định dạng với các văn bản khác.

Ví dụ, đây là cách sử dụng điển hình của đối tượng {{jsxref("Intl.NumberFormat")}}:

```js
// 1. Construct a formatter object, specifying the locale and formatting options:
const price = new Intl.NumberFormat("en-US", {
  style: "currency",
  currency: "USD",
});

// 2. Use the `format` method of the formatter object to format a number:
console.log(price.format(5.259)); // $5.26

// Or, use the `formatToParts` method to get the formatted number
// broken down into parts:
console.table(price.formatToParts(5.259));
// |   | type       | value |
// | 0 | "currency" | "$"   |
// | 1 | "integer"  | "5"   |
// | 2 | "decimal"  | "."   |
// | 3 | "fraction" | "26"  |
```

Bạn không phải lúc nào cũng cần xây dựng đối tượng formatter để định dạng chuỗi. Để sử dụng thông thường, bạn cũng có thể gọi trực tiếp phương thức `toLocaleString()` trên dữ liệu, truyền locale và các tùy chọn làm đối số. Phương thức `toLocaleString()` được implement bởi {{jsxref("Temporal/PlainDate/toLocaleString", "Temporal.PlainDate.prototype.toLocaleString()")}}, {{jsxref("Temporal/Duration/toLocaleString", "Temporal.Duration.prototype.toLocaleString()")}}, {{jsxref("Number.prototype.toLocaleString()")}}, v.v. Đọc tài liệu cho dữ liệu bạn đang định dạng để xem nó có hỗ trợ `toLocaleString()` hay không, và các tùy chọn formatter nào nó tương ứng.

```js
console.log(
  (5.259).toLocaleString("en-US", {
    style: "currency",
    currency: "USD",
  }),
); // $5.26
```

Lưu ý rằng `toLocaleString()` có thể kém hiệu quả hơn so với sử dụng đối tượng formatter, vì mỗi lần `toLocaleString` được gọi, nó phải thực hiện tìm kiếm trong cơ sở dữ liệu chuỗi localization lớn. Khi phương thức được gọi nhiều lần với cùng đối số, tốt hơn là tạo đối tượng formatter và sử dụng phương thức `format()` của nó, vì đối tượng formatter ghi nhớ các đối số được truyền cho nó và có thể quyết định cache một phần cơ sở dữ liệu, để các lời gọi `format` trong tương lai có thể tìm kiếm chuỗi localization trong ngữ cảnh hạn chế hơn.

### Định dạng ngày và giờ

{{jsxref("Intl.DateTimeFormat")}} định dạng ngày và giờ, cũng như phạm vi ngày và giờ. Đối tượng `DateTimeFormat` nhận đầu vào ngày/giờ ở một trong các dạng sau: {{jsxref("Date")}}, {{jsxref("Temporal.PlainDateTime")}}, {{jsxref("Temporal.PlainTime")}}, {{jsxref("Temporal.PlainDate")}}, {{jsxref("Temporal.PlainYearMonth")}}, hoặc {{jsxref("Temporal.PlainMonthDay")}}.

> [!NOTE]
> Bạn không thể truyền đối tượng {{jsxref("Temporal.ZonedDateTime")}} trực tiếp, vì múi giờ đã được cố định trong đối tượng. Bạn nên sử dụng {{jsxref("Temporal/ZonedDateTime/toLocaleString", "Temporal.ZonedDateTime.prototype.toLocaleString()")}} hoặc chuyển đổi nó thành đối tượng {{jsxref("Temporal.PlainDateTime")}} trước.

Các use-case phổ biến của định dạng ngày và giờ theo locale như sau:

- Xuất cùng ngày và giờ trong một hệ lịch khác, chẳng hạn lịch Islamic, Hebrew hoặc Chinese.
- Xuất cùng thời gian thực tế (instant) nhưng theo múi giờ khác.
- Xuất một cách chọn lọc các thành phần nhất định của ngày và giờ, chẳng hạn chỉ năm và tháng, và cách biểu diễn cụ thể của chúng (chẳng hạn "Thursday" hay "Thu").
- Xuất ngày theo quy ước theo locale, chẳng hạn MM/DD/YYYY như ở Mỹ, DD/MM/YYYY như ở Anh, hoặc YYYY/MM/DD như ở Nhật.
- Xuất giờ theo quy ước theo locale, chẳng hạn đồng hồ 12 giờ hay 24 giờ.

Để quyết định chuỗi được định dạng trông như thế nào, trước tiên bạn chọn lịch (ảnh hưởng đến tính toán năm, tháng, tuần và ngày) và múi giờ (ảnh hưởng đến thời gian chính xác cũng như ngày). Điều này được thực hiện bằng tùy chọn `calendar` đã đề cập (hoặc extension key `-ca-` trong locale identifier), và tùy chọn `timeZone`.

- Các đối tượng `Date` đại diện cho một instant duy nhất theo múi giờ của người dùng và trong lịch ISO 8601 (như được báo cáo bởi các phương thức như {{jsxref("Date.prototype.getHours()")}} và {{jsxref("Date.prototype.getMonth()")}}). Chúng được chuyển đổi sang `calendar` và `timeZone` đã cho bằng cách bảo toàn instant, do đó các thành phần ngày và giờ có thể thay đổi.
- Các đối tượng {{jsxref("Temporal")}} khác nhau đã có lịch tích hợp, nên tùy chọn `calendar` phải nhất quán với lịch của đối tượng — trừ khi lịch của ngày là `"iso8601"`, trong trường hợp đó nó được chuyển đổi sang `calendar` được yêu cầu. Các đối tượng này không có múi giờ, nên chúng được hiển thị trực tiếp theo `timeZone` đã cho mà không cần chuyển đổi.

Ở đây chúng ta minh họa cách kết hợp cấu hình `calendar` và `timeZone` dẫn đến các biểu diễn khác nhau của cùng một instant.

```js
// Assume that the local time zone is UTC
const targetDate = new Date(2022, 0, 1); // 2022-01-01 midnight in the local time zone
const results = [];

for (const calendar of ["gregory", "hebrew"]) {
  for (const timeZone of ["America/New_York", "Asia/Tokyo"]) {
    const df = new Intl.DateTimeFormat("en-US", {
      calendar,
      timeZone,
      // More on these later
      dateStyle: "full",
      timeStyle: "full",
    });
    results.push({ calendar, timeZone, output: df.format(targetDate) });
  }
}

console.table(results);
```

Đầu ra trông như thế này:

| calendar  | timeZone           | output                                                          |
| --------- | ------------------ | --------------------------------------------------------------- |
| 'gregory' | 'America/New_York' | 'Friday, December 31, 2021 at 7:00:00 PM Eastern Standard Time' |
| 'gregory' | 'Asia/Tokyo'       | 'Saturday, January 1, 2022 at 9:00:00 AM Japan Standard Time'   |
| 'hebrew'  | 'America/New_York' | 'Friday, 27 Tevet 5782 at 7:00:00 PM Eastern Standard Time'     |
| 'hebrew'  | 'Asia/Tokyo'       | 'Saturday, 28 Tevet 5782 at 9:00:00 AM Japan Standard Time'     |

Ngày/giờ bao gồm các thành phần sau: `weekday`, `era`, `year`, `month`, `day`, `dayPeriod`, `hour`, `minute`, `second`, `fractionalSecondDigits`, và `timeZoneName`. Quyết định tiếp theo của bạn là những thành phần nào cần đưa vào đầu ra, và chúng nên có dạng nào. Bạn có hai lựa chọn:

- Bạn có thể cấu hình từng thành phần theo cách thủ công, sử dụng các tùy chọn có cùng tên với thành phần. Chỉ các thành phần bạn chỉ định mới được đưa vào đầu ra, với dạng đã chỉ định.
- Bạn có thể sử dụng các shortcut `dateStyle` và `timeStyle`, là các tập hợp thành phần được định nghĩa sẵn. Chúng mở rộng thành một tập hợp các tùy chọn thành phần phụ thuộc vào locale.

Bạn nên chọn một trong hai phương pháp này, vì chúng loại trừ lẫn nhau. Sử dụng cả hai phương pháp đồng thời sẽ dẫn đến lỗi.

Bên dưới, sau khi yêu cầu một tổ hợp thành phần, đối tượng `DateTimeFormat` tìm kiếm một "template" khớp với các thành phần được yêu cầu, nên nó chỉ cần điền các giá trị từng cái một. Không phải mọi tổ hợp thành phần đều có template được định nghĩa sẵn. `DateTimeFormat` có tùy chọn `formatMatcher` quyết định cách thương lượng, bằng cách làm cho các thành phần dài hơn hoặc ngắn hơn yêu cầu, hoặc bằng cách bỏ qua hoặc thêm thành phần. Điều này khá kỹ thuật, nên bạn nên đọc tài liệu tham khảo [`Intl.DateTimeFormat()`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Intl/DateTimeFormat/DateTimeFormat#date-time_component_options) để hiểu rõ hơn về cách xử lý này.

Ở đây, chúng ta minh họa một vài cách phổ biến để định dạng các thành phần:

```js
const df1 = new Intl.DateTimeFormat("en-US", {
  // Include all components (usually)
  dateStyle: "full",
  timeStyle: "full",
});

const df2 = new Intl.DateTimeFormat("en-US", {
  // Display the calendar date
  era: "short",
  year: "numeric",
  month: "long",
  day: "numeric",
});

const df3 = new Intl.DateTimeFormat("en-US", {
  // Display a time like on a digital clock
  hour: "2-digit",
  minute: "2-digit",
  second: "2-digit",
  timeZoneName: "shortOffset",
});

const targetDate = new Date(2022, 0, 1, 12, 34, 56); // 2022-01-01 12:34:56 in the local time zone
console.log(df1.format(targetDate));
// Saturday, January 1, 2022 at 12:34:56 PM Coordinated Universal Time
// January 1, 2022 AD
// 12:34:56 PM GMT
```

Có các tùy chọn tùy chỉnh khác. Ví dụ, bạn có thể sử dụng tùy chọn `hourCycle` để hiển thị thời gian ở 12 giờ hay 24 giờ và hiển thị nửa đêm/giữa trưa là 12:00 hay 0:00. Bạn cũng có thể sử dụng tùy chọn `numberingSystem` để hiển thị bất kỳ số nào trong một hệ thống đánh số khác.

Ngoài `format()`, còn có một phương thức quan trọng thứ hai, {{jsxref("Intl/DateTimeFormat/formatRange", "formatRange()")}}, định dạng một phạm vi ngày hoặc giờ. Nó nhận hai ngày-giờ cùng loại, định dạng từng cái, nối chúng với dấu phân cách phạm vi (như en-dash), và loại bỏ các phần chung trùng lặp.

```js
const springBreak = {
  start: new Date(2023, 2, 10),
  end: new Date(2023, 2, 26),
};

const df = new Intl.DateTimeFormat("en-US", { dateStyle: "long" });
console.log(df.formatRange(springBreak.start, springBreak.end));
// March 10 – 26, 2023
```

### Định dạng số

Định dạng số được thực hiện với đối tượng {{jsxref("Intl.NumberFormat")}}. Đối tượng `NumberFormat` chấp nhận đầu vào dưới dạng số, chuỗi, hoặc giá trị `BigInt`. Truyền chuỗi hoặc `BigInt` thay vì số cho phép bạn định dạng các số quá lớn hoặc quá nhỏ để biểu diễn chính xác như số JavaScript.

Các use-case phổ biến của định dạng số theo locale như sau:

- Xuất số trong một hệ thống đánh số (script) khác, chẳng hạn tiếng Trung, tiếng Ả Rập, hoặc La Mã.
- Xuất số với quy ước theo locale, chẳng hạn ký hiệu thập phân ("." trong tiếng Anh, nhưng "," trong nhiều nền văn hóa châu Âu), hoặc nhóm chữ số (3 chữ số trong tiếng Anh, nhưng có thể là 4 hoặc 2 trong các nền văn hóa khác, và có thể dùng ",", " ", hoặc ".").
- Xuất số với ký hiệu số mũ như "3.7 million" hoặc "2 thousand".
- Xuất số như tiền tệ, áp dụng các ký hiệu tiền tệ cụ thể và quy tắc làm tròn. Ví dụ, các giá trị tiền tệ dưới một xu ở Mỹ hay dưới một yên ở Nhật có thể không có ý nghĩa để hiển thị.
- Xuất số như phần trăm, áp dụng các quy tắc chuyển đổi và định dạng theo locale.
- Xuất số với đơn vị, chẳng hạn "meters" hoặc "liters", với tên đơn vị đã được dịch.

Để quyết định chuỗi được định dạng trông như thế nào, trước tiên bạn chọn hệ thống đánh số (ảnh hưởng đến các ký tự được dùng cho các chữ số). Mục đích của hệ thống đánh số đã được thảo luận trong [thông tin locale](#locale_information). Tùy chọn khác bạn cần quyết định là `style`, thiết lập ngữ cảnh cho những gì số đại diện, và có thể ảnh hưởng đến các giá trị mặc định của các tùy chọn khác. Nó là một trong `"decimal"`, `"percent"`, `"currency"`, hoặc `"unit"`. Nếu bạn muốn định dạng tiền tệ, bạn cũng cần cung cấp tùy chọn `currency`. Nếu bạn muốn định dạng đơn vị, bạn cũng cần cung cấp tùy chọn `unit`.

```js
const results = [];
for (const options of [
  { style: "decimal" }, // Format the number as a dimensionless decimal
  { style: "percent" }, // Format the number as a percentage; it is multiplied by 100
  { style: "currency", currency: "USD" }, // Format the number as a US dollar amount
  { style: "unit", unit: "meter" }, // Format the number as a length in meters
]) {
  const nf = new Intl.NumberFormat("en-US", options);
  results.push({ style: options.style, output: nf.format(1234567.89) });
}
console.table(results);
```

Đầu ra trông như:

| style      | output           |
| ---------- | ---------------- |
| 'decimal'  | '1,234,567.89'   |
| 'percent'  | '123,456,789%'   |
| 'currency' | '$1,234,567.89'  |
| 'unit'     | '1,234,567.89 m' |

Nhóm tùy chọn tiếp theo đều chỉ định phần số nên trông như thế nào. Trước tiên, bạn có thể muốn biểu diễn các giá trị cực lớn theo cách dễ đọc hơn. Bạn có thể đặt tùy chọn `notation` thành `"scientific"` hoặc `"engineering"`, cả hai đều sử dụng ký hiệu `1.23e+6`. Sự khác biệt là cái sau sử dụng bội số của 3 cho số mũ, giữ [mantissa](https://en.wikipedia.org/wiki/Scientific_notation) (phần trước ký hiệu `e`) giữa 1 và 1000, trong khi cái trước có thể sử dụng bất kỳ số nguyên nào cho số mũ, giữ mantissa giữa 1 và 10. Bạn cũng có thể đặt `notation` thành `"compact"` để sử dụng ký hiệu dễ đọc hơn cho con người.

```js
const results = [];
for (const options of [
  { notation: "scientific" },
  { notation: "engineering" },
  { notation: "compact", compactDisplay: "short" }, // "short" is default
  { notation: "compact", compactDisplay: "long" },
]) {
  const nf = new Intl.NumberFormat("en-US", options);
  results.push({
    notation: options.compactDisplay
      ? `${options.notation}-${options.compactDisplay}`
      : options.notation,
    output: nf.format(12000),
  });
}
console.table(results);
```

Đầu ra trông như:

| notation        | output        |
| --------------- | ------------- |
| 'scientific'    | '1.2E4'       |
| 'engineering'   | '12E3'        |
| 'compact-short' | '12K'         |
| 'compact-long'  | '12 thousand' |

Sau đó, bạn có thể muốn làm tròn số (nếu bạn đã chỉ định `notation`, thì chỉ phần mantissa), để bạn không hiển thị số quá dài. Đây là các tùy chọn chữ số, bao gồm:

- `minimumIntegerDigits`
- `minimumFractionDigits`
- `maximumFractionDigits`
- `minimumSignificantDigits`
- `maximumSignificantDigits`
- `roundingPriority`
- `roundingIncrement`
- `roundingMode`

Sự tương tác chính xác của các tùy chọn này khá phức tạp và không đáng đề cập ở đây. Bạn nên đọc tài liệu tham khảo [digit options](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Intl/NumberFormat/NumberFormat#digit_options) để biết thêm chi tiết. Tuy nhiên, ý tưởng chung rất đơn giản: chúng ta trước tiên tìm số chữ số thập phân chúng ta muốn giữ, sau đó làm tròn các chữ số thập phân thừa đi, hoặc làm tròn xuống hay lên, tùy thuộc vào giá trị của chữ số cuối cùng.

```js
const results = [];
for (const options of [
  { minimumFractionDigits: 4, maximumFractionDigits: 4 },
  { minimumSignificantDigits: 4, maximumSignificantDigits: 4 },
  { minimumFractionDigits: 0, maximumFractionDigits: 0, roundingMode: "floor" },
  {
    minimumFractionDigits: 0,
    maximumFractionDigits: 0,
    roundingMode: "floor",
    roundingIncrement: 10,
  },
]) {
  const nf = new Intl.NumberFormat("en-US", options);
  results.push({
    options,
    output: nf.format(1234.56789),
  });
}
console.table(results);
```

Đầu ra trông như thế này:

| options                                                                                                | output       |
| ------------------------------------------------------------------------------------------------------ | ------------ |
| `{ minimumFractionDigits: 4, maximumFractionDigits: 4 }`                                               | '1,234.5679' |
| `{ minimumSignificantDigits: 4, maximumSignificantDigits: 4 }`                                         | '1,235'      |
| `{ minimumFractionDigits: 0, maximumFractionDigits: 0, roundingMode: "floor" }`                        | '1,234'      |
| `{ minimumFractionDigits: 0, maximumFractionDigits: 0, roundingMode: "floor", roundingIncrement: 10 }` | '1,230'      |

Có các tùy chọn tùy chỉnh khác. Ví dụ, bạn có thể sử dụng các tùy chọn `useGrouping` và `signDisplay` để tùy chỉnh có hiển thị và hiển thị như thế nào các dấu phân cách nhóm (như "," trong "1,234,567.89") và dấu. Tuy nhiên, lưu ý rằng các ký tự được dùng cho dấu phân cách nhóm, dấu thập phân và dấu đều theo locale, nên bạn không thể tùy chỉnh chúng trực tiếp.

Ngoài `format()`, còn có một phương thức quan trọng thứ hai, {{jsxref("Intl/NumberFormat/formatRange", "formatRange()")}}, định dạng một phạm vi số. Nó nhận hai biểu diễn số, định dạng từng cái, nối chúng với dấu phân cách phạm vi (như en-dash), và có thể loại bỏ các phần chung trùng lặp.

```js
const heightRange = {
  min: 1.63,
  max: 1.95,
};

const nf = new Intl.NumberFormat("en-US", { style: "unit", unit: "meter" });
console.log(nf.formatRange(heightRange.min, heightRange.max));
// 1.63–1.95 m
```

### Định dạng danh sách

Bạn có thể đã viết code làm điều này:

```js example-bad
const fruits = ["apple", "banana", "cherry"];
console.log(`I like ${fruits.join(", ")}.`);
// I like apple, banana, cherry.
```

Code này không được internationalization. Trong một số ngôn ngữ, dấu phân cách danh sách không phải là dấu phẩy. Trong _hầu hết_ các ngôn ngữ (bao gồm tiếng Anh), bạn cần một liên từ trước phần tử cuối cùng. Nhưng ngay cả việc chỉ thêm "and" theo cách thủ công cũng không đúng cho tất cả người nói tiếng Anh, vì còn có cuộc tranh luận về [Oxford comma](https://en.wikipedia.org/wiki/Serial_comma) trong tiếng Anh: "apple, banana, and cherry" hay "apple, banana and cherry".

Đối tượng {{jsxref("Intl.ListFormat")}} giải quyết vấn đề này. Nó nhận một mảng chuỗi và nối chúng theo cách theo locale sao cho kết quả đại diện cho liên từ (and), disjunction (or), hoặc danh sách đơn vị.

```js
const fruits = ["apple", "banana", "cherry"];
const lf = new Intl.ListFormat("en-US", { style: "long", type: "conjunction" });
console.log(`I like ${lf.format(fruits)}.`);
// I like apple, banana, and cherry.

const lf = new Intl.ListFormat("en-US", { style: "long", type: "disjunction" });
console.log(`I can give you ${lf.format(fruits)}.`);
// I can give you apple, banana, or cherry.
```

Xem {{jsxref("Intl/ListFormat/ListFormat", "Intl.ListFormat()")}} để biết thêm ví dụ và tùy chọn.

### Định dạng thời gian tương đối

{{jsxref("Intl.RelativeTimeFormat")}} định dạng sự khác biệt thời gian. Đối tượng `RelativeTimeFormat` nhận thời gian tương đối dưới dạng hai đối số: một số (với bất kỳ dấu nào) và đơn vị thời gian, chẳng hạn `"day"`, `"hour"`, hoặc `"minute"`.

Nó thực hiện một số việc cùng một lúc:

- Nó địa phương hóa và tạo số nhiều cho đơn vị thời gian, chẳng hạn "1 day" hay "2 days", giống như trong định dạng số.
- Nó chọn cụm từ phù hợp cho thời gian quá khứ và tương lai, chẳng hạn "in 1 day" hay "1 day ago".
- Nó có thể chọn cụm từ đặc biệt cho một số đơn vị thời gian, chẳng hạn "1 day ago" hay "yesterday".

```js
const rtf = new Intl.RelativeTimeFormat("en-US", { numeric: "auto" });
console.log(rtf.format(1, "day")); // tomorrow
console.log(rtf.format(2, "day")); // in 2 days
console.log(rtf.format(-1, "hour")); // 1 hour ago
```

Xem {{jsxref("Intl/RelativeTimeFormat/RelativeTimeFormat", "Intl.RelativeTimeFormat()")}} để biết thêm ví dụ và tùy chọn.

### Định dạng khoảng thời gian

{{jsxref("Intl.DurationFormat")}} cung cấp định dạng khoảng thời gian, chẳng hạn "3 hours, 4 minutes, 5 seconds". Nó không phải là một thao tác nguyên thủy với formatter riêng: nó sử dụng {{jsxref("Intl.NumberFormat")}} và {{jsxref("Intl.ListFormat")}} nội bộ để định dạng từng thành phần khoảng thời gian, sau đó nối chúng với dấu phân cách danh sách. Đối tượng `DurationFormat` nhận khoảng thời gian dưới dạng đối tượng {{jsxref("Temporal.Duration")}}, hoặc đối tượng thuần túy có cùng thuộc tính.

Ngoài việc tùy chỉnh hệ thống đánh số, các tùy chọn định dạng khoảng thời gian quyết định có hiển thị hay không từng thành phần, và chúng dài đến mức nào.

```js
console.log(
  new Intl.DurationFormat("en-US", {
    style: "long",
  }).format({ hours: 3, minutes: 4, seconds: 5 }),
);
// 3 hours, 4 minutes, and 5 seconds
```

Xem {{jsxref("Intl/DurationFormat/DurationFormat", "Intl.DurationFormat()")}} để biết thêm ví dụ và tùy chọn.

## Collation

Đối tượng {{jsxref("Intl.Collator")}} hữu ích để so sánh và sắp xếp chuỗi. Nó nhận hai chuỗi và trả về một số chỉ thị thứ tự tương đối của chúng, theo cách tương tự như đối số `compareFn` của phương thức {{jsxref("Array.prototype.sort")}}.

Có nhiều lý do tại sao bạn không nên sử dụng các toán tử JavaScript như `===` hay `>` để so sánh các chuỗi hướng đến người dùng:

- Biến thể chính tả không liên quan: Ví dụ, trong tiếng Anh, "naïve" và "naive" chỉ là các cách viết thay thế của cùng một từ và nên được coi là bằng nhau.
- Bỏ qua casing: Thông thường, bạn muốn bỏ qua casing khi so sánh chuỗi. Ví dụ, "apple" và "Apple" nên được coi là bằng nhau.
- Thứ tự code point Unicode không có ý nghĩa: Các toán tử so sánh như `>` so sánh theo thứ tự code point Unicode, không giống với thứ tự ký tự trong từ điển. Ví dụ, "ï" đứng sau "z" trong thứ tự code point, nhưng bạn sẽ muốn nó được sắp xếp gần "i" trong từ điển.
- Chuẩn hóa Unicode: Cùng một ký tự có thể có nhiều biểu diễn trong Unicode. Ví dụ, "ñ" có thể được biểu diễn như một ký tự đơn hoặc như "n" theo sau bởi dấu ngã kết hợp. (Xem {{jsxref("String.prototype.normalize()")}}.) Chúng nên được coi là bằng nhau.
- So sánh số: Các số trong chuỗi nên được so sánh như số, không phải như chuỗi. Ví dụ, bạn sẽ muốn "test-10" đứng sau "test-2".

Có hai use-case riêng biệt cho collation: **sorting** (sắp xếp) và **searching** (tìm kiếm). Sorting là khi bạn có danh sách chuỗi và muốn sắp xếp chúng theo một quy tắc nào đó. Searching là khi bạn có danh sách chuỗi và muốn tìm chuỗi khớp với query. Khi tìm kiếm, bạn chỉ nên chú ý đến việc kết quả so sánh có bằng không (bằng nhau) hay không, chứ không phải dấu của kết quả.

Có nhiều cách sắp xếp khác nhau, ngay cả trong cùng locale. Ví dụ, có hai thứ tự sắp xếp khác nhau trong tiếng Đức, _phonebook_ và _dictionary_. Sắp xếp phonebook nhấn mạnh âm thanh — như thể "ä", "ö", v.v. được mở rộng thành "ae", "oe", v.v. trước khi sắp xếp.

```js
const names = ["Hochberg", "Hönigswald", "Holzman"];

const germanPhonebook = new Intl.Collator("de-DE-u-co-phonebk");

// as if sorting ["Hochberg", "Hoenigswald", "Holzman"]:
console.log(names.sort(germanPhonebook.compare));
// ['Hochberg', 'Hönigswald', 'Holzman']
```

Một số từ tiếng Đức biến cách với thêm dấu umlaut, nên trong từ điển thì hợp lý hơn khi sắp xếp bỏ qua dấu umlaut (ngoại trừ khi sắp xếp các từ chỉ khác nhau bởi dấu umlaut: _schon_ trước _schön_).

```js
const germanDictionary = new Intl.Collator("de-DE-u-co-dict");

// as if sorting ["Hochberg", "Honigswald", "Holzman"]:
console.log(names.sort(germanDictionary.compare).join(", "));
// "Hochberg, Holzman, Hönigswald"
```

## Quy tắc số nhiều

Đối tượng {{jsxref("Intl.PluralRules")}} hữu ích để chọn dạng số nhiều đúng của một từ. Nó không tự động tạo số nhiều cho các từ (ví dụ, bạn không thể truyền "apple" cho nó và mong đợi nhận lại "apples"), nhưng nó cho bạn biết dạng số nhiều nào cần sử dụng dựa trên một số. Bạn có thể đã làm điều này:

```js
function formatMessage(n) {
  return `You have ${n} ${n === 1 ? "apple" : "apples"}.`;
}
```

Nhưng điều này khó tổng quát hóa qua các ngôn ngữ, đặc biệt những ngôn ngữ có nhiều dạng số nhiều. Bạn có thể xem {{jsxref("Intl.PluralRules")}} để biết giới thiệu chung về quy tắc số nhiều. Ở đây, chúng ta chỉ minh họa một vài use-case phổ biến.

```js
const prCard = new Intl.PluralRules("en-US");
const prOrd = new Intl.PluralRules("en-US", { type: "ordinal" });

const englishOrdinalSuffixes = {
  one: "st",
  two: "nd",
  few: "rd",
  other: "th",
};

const catPlural = {
  one: "cat",
  other: "cats",
};

function formatMessage(n1, n2) {
  return `The ${n1}${englishOrdinalSuffixes[prOrd.select(n1)]} U.S. president had ${n2} ${catPlural[prCard.select(n2)]}.`;
}

console.log(formatMessage(42, 1)); // The 42nd U.S. president had 1 cat.
console.log(formatMessage(45, 0)); // The 45th U.S. president had 0 cats.
```

## Phân đoạn

Đối tượng {{jsxref("Intl.Segmenter")}} hữu ích để tách một chuỗi thành các đoạn. Nếu không có `Intl`, bạn đã có thể tách chuỗi theo [UTF-16 code units và Unicode code points](/en-US/docs/Web/JavaScript/Reference/Global_Objects/String#utf-16_characters_unicode_code_points_and_grapheme_clusters):

```js
const str = "🇺🇸🇨🇳🇷🇺🇬🇧🇫🇷";
console.log(str.split(""));
// Array(20) ['\uD83C', '\uDDFA', '\uD83C', ...]
console.log([...str]);
// Array(10) ['🇺', '🇸', '🇨', '🇳', '🇷', '🇺', '🇬', '🇧', '🇫', '🇷']
```

Nhưng như bạn thấy, Unicode code points không giống với những gì người dùng cảm nhận là các ký tự rời rạc. Điều này thường xảy ra với emoji, trong đó một emoji đơn có thể được biểu diễn bởi nhiều code point. Khi người dùng tương tác với văn bản, một grapheme là đơn vị văn bản nhỏ nhất họ có thể thao tác, chẳng hạn như xóa hoặc chọn. Đối tượng `Segmenter` cho phép phân đoạn ở cấp độ grapheme, hữu ích để đếm ký tự, đo độ rộng văn bản, v.v. Nó nhận một chuỗi và trả về một đối tượng [segments](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Intl/Segmenter/segment/Segments) có thể lặp, mỗi phần tử có thuộc tính `segment` đại diện cho văn bản của đoạn.

```js
const segmenter = new Intl.Segmenter("en-US", { granularity: "grapheme" });
console.log([...segmenter.segment("🇺🇸🇨🇳🇷🇺🇬🇧🇫🇷")].map((s) => s.segment));
// ['🇺🇸', '🇨🇳', '🇷🇺', '🇬🇧', '🇫🇷']
```

Segmenter cũng có thể thực hiện phân đoạn ở mức cao hơn, bao gồm tách theo từ và câu. Các use-case này nhất thiết phải theo ngôn ngữ. Ví dụ, đây là một implementation rất kém để đếm từ:

```js example-bad
const wordCount = (str) => str.split(/\s+/).length;
console.log(wordCount("Hello, world!")); // 2
```

Có một số vấn đề với điều này: không phải tất cả ngôn ngữ đều dùng khoảng trắng để phân tách từ, không phải tất cả khoảng trắng đều phân tách từ, và không phải tất cả từ đều được phân tách bởi khoảng trắng. Để giải quyết vấn đề này, hãy dùng `Segmenter` với `granularity: "word"`. Kết quả là chuỗi đầu vào, được tách thành các đoạn từ và không phải từ. Nếu bạn đang đếm từ, bạn nên lọc ra các phần không phải từ bằng cách kiểm tra thuộc tính `isWordLike` của mỗi đoạn.

```js
const segmenter = new Intl.Segmenter("en-US", { granularity: "word" });
const str = "It can even split non-space-separated words";
console.table([...segmenter.segment(str)]);
// ┌─────────────┬───────┬────────────┐
// │ segment     │ index │ isWordLike │
// ├─────────────┼───────┼────────────┤
// │ 'It'        │ 0     │ true       │
// │ ' '         │ 2     │ false      │
// │ 'can'       │ 3     │ true       │
// │ ' '         │ 6     │ false      │
// │ 'even'      │ 7     │ true       │
// │ ' '         │ 11    │ false      │
// │ 'split'     │ 12    │ true       │
// │ ' '         │ 17    │ false      │
// │ 'non'       │ 18    │ true       │
// │ '-'         │ 21    │ false      │
// │ 'space'     │ 22    │ true       │
// │ '-'         │ 27    │ false      │
// │ 'separated' │ 28    │ true       │
// │ ' '         │ 37    │ false      │
// │ 'words'     │ 38    │ true       │
// └─────────────┴───────┴────────────┘

console.log(
  [...segmenter.segment(str)].filter((s) => s.isWordLike).map((s) => s.segment),
);
// ['It', 'can', 'even', 'split', 'non', 'space', 'separated', 'words']
```

Phân đoạn theo từ cũng hoạt động cho các ngôn ngữ dựa trên ký tự. Ví dụ, trong tiếng Trung, nhiều ký tự có thể đại diện cho một từ, nhưng không có khoảng trắng giữa chúng. Segmenter implement cùng hành vi như phân đoạn từ tích hợp của trình duyệt, được kích hoạt bằng cách nhấp đúp vào một từ.

```js
const segmenter = new Intl.Segmenter("zh-Hans", { granularity: "word" });
console.log([...segmenter.segment("我是这篇文档的作者")].map((s) => s.segment));
// ['我是', '这', '篇', '文', '档', '的', '作者']
```

Phân đoạn câu cũng phức tạp tương tự. Ví dụ, trong tiếng Anh, có nhiều dấu câu có thể đánh dấu kết thúc câu (".", "!", "?", v.v.).

```js
const segmenter = new Intl.Segmenter("en-US", { granularity: "sentence" });
console.log(
  [...segmenter.segment("I ate a sandwich. Then I went to bed.")].map(
    (s) => s.segment,
  ),
);
// ['I ate a sandwich. ', 'Then I went to bed.']
```

Lưu ý rằng segmenter không xóa bất kỳ ký tự nào. Nó chỉ tách chuỗi thành các đoạn, mỗi đoạn là một câu. Sau đó bạn có thể xóa các dấu câu nếu muốn. Ngoài ra, implementation hiện tại của segmenter không hỗ trợ suppression phân đoạn câu (ngăn ngừa ngắt câu sau các dấu chấm như "Mr." hoặc "Approx."), nhưng có công việc đang tiến hành để hỗ trợ điều này.

## Tên hiển thị

Sau khi giới thiệu rất nhiều tùy chọn và hành vi, bạn có thể tự hỏi làm thế nào để trình bày chúng cho người dùng. `Intl` đi kèm với hai API hữu ích để xây dựng giao diện người dùng: {{jsxref("Intl.supportedValuesOf()")}} và {{jsxref("Intl.DisplayNames")}}.

Hàm {{jsxref("Intl.supportedValuesOf()")}} trả về một mảng các giá trị được hỗ trợ cho một tùy chọn nhất định. Ví dụ, bạn có thể dùng nó để điền vào danh sách thả xuống các lịch được hỗ trợ, mà từ đó người dùng có thể chọn để hiển thị ngày tháng.

```js
const supportedCal = Intl.supportedValuesOf("calendar");
console.log(supportedCal);
// ['buddhist', 'chinese', 'coptic', 'dangi', ...]
```

Nhưng thường thì các identifier này không thân thiện với người dùng. Ví dụ, bạn có thể muốn hiển thị các lịch bằng ngôn ngữ của người dùng, hoặc mở rộng chúng ra. Đối tượng {{jsxref("Intl.DisplayNames")}} hữu ích cho điều này. Nó giống như một formatter, nhưng không dựa trên template. Thay vào đó, nó là ánh xạ trực tiếp từ các identifier không theo ngôn ngữ sang tên đã được địa phương hóa. Nó hỗ trợ định dạng ngôn ngữ, vùng, script (ba trường con của BCP 47 language tag), tiền tệ, lịch và các trường ngày-giờ.

Thử demo dưới đây:

```html live-sample___display_names
<select id="lang"></select>
<select id="calendar"></select>
<output id="output"></output>
```

```css hidden live-sample___display_names
output {
  display: block;
  margin: 1em;
  font-size: x-large;
}

rt {
  font-weight: bold;
}

ruby {
  border-bottom: 1px dotted;
  ruby-position: under;
  ruby-align: center;
}
```

```js live-sample___display_names
const langSelect = document.getElementById("lang");
const calSelect = document.getElementById("calendar");
const fieldset = document.querySelector("fieldset");
const output = document.getElementById("output");

// A few examples
const langs = [
  "en-US",
  "zh-Hans-CN",
  "ja-JP",
  "ar-EG",
  "ru-RU",
  "es-ES",
  "fr-FR",
  "de-DE",
  "hi-IN",
  "pt-BR",
  "bn-BD",
  "he-IL",
];
const calendars = Intl.supportedValuesOf("calendar");

for (const lang of langs) {
  const option = document.createElement("option");
  option.value = lang;
  option.textContent = new Intl.DisplayNames(lang, { type: "language" }).of(
    lang,
  );
  langSelect.appendChild(option);
}

function renderCalSelect() {
  const lang = langSelect.value;
  calSelect.innerHTML = "";
  const dn = new Intl.DisplayNames(lang, { type: "calendar" });
  const preferredCalendars = new Intl.Locale(lang).getCalendars?.() ?? [
    "gregory",
  ];
  for (const cal of [
    ...preferredCalendars,
    ...calendars.filter((c) => !preferredCalendars.includes(c)),
  ]) {
    const option = document.createElement("option");
    option.value = cal;
    option.textContent = dn.of(cal);
    calSelect.appendChild(option);
  }
}

function renderFieldInputs() {
  const lang = langSelect.value;
  fieldset.querySelectorAll("label").forEach((label) => label.remove());
  const dn = new Intl.DisplayNames(lang, { type: "dateTimeField" });
  for (const field of fields) {
    const label = document.createElement("label");
    label.textContent = dn.of(field);
    const input = document.createElement("input");
    input.type = "checkbox";
    input.value = field;
    label.appendChild(input);
    fieldset.appendChild(label);
  }
}

function renderTime() {
  const lang = langSelect.value;
  const cal = calSelect.value;
  const df = new Intl.DateTimeFormat(lang, {
    calendar: cal,
    dateStyle: "full",
    timeStyle: "full",
  });
  const now = new Date();
  const dn = new Intl.DisplayNames(lang, { type: "dateTimeField" });
  output.innerHTML = "";
  for (const component of df.formatToParts(now)) {
    const text = document.createElement("span");
    text.textContent = component.value;
    if (
      ![
        "era",
        "year",
        "quarter",
        "month",
        "weekOfYear",
        "weekday",
        "day",
        "dayPeriod",
        "hour",
        "minute",
        "second",
        "timeZoneName",
      ].includes(component.type)
    ) {
      output.appendChild(text);
      continue;
    }
    const title = dn.of(component.type);
    const field = document.createElement("ruby");
    field.appendChild(text);
    const rt = document.createElement("rt");
    rt.textContent = title;
    field.appendChild(rt);
    output.appendChild(field);
  }
}

renderCalSelect();
renderTime();
langSelect.addEventListener("change", renderCalSelect);
langSelect.addEventListener("change", renderTime);
calSelect.addEventListener("change", renderTime);
setInterval(renderTime, 500);
```

{{EmbedLiveSample("display_names", "", 300)}}

{{PreviousNext("Web/JavaScript/Guide/Resource_management", "Web/JavaScript/Guide/Modules")}}
