---
title: Intl.DateTimeFormat() constructor
short-title: Intl.DateTimeFormat()
slug: Web/JavaScript/Reference/Global_Objects/Intl/DateTimeFormat/DateTimeFormat
page-type: javascript-constructor
browser-compat: javascript.builtins.Intl.DateTimeFormat.DateTimeFormat
sidebar: jsref
---

Constructor **`Intl.DateTimeFormat()`** tạo các đối tượng {{jsxref("Intl.DateTimeFormat")}}.

{{InteractiveExample("JavaScript Demo: Intl.DateTimeFormat() constructor", "taller")}}

```js interactive-example
const date = new Date(Date.UTC(2020, 11, 20, 3, 23, 16, 738));
// Results below assume UTC timezone - your results may vary

// Specify default date formatting for language (locale)
console.log(new Intl.DateTimeFormat("en-US").format(date));
// Expected output: "12/20/2020"

// Specify default date formatting for language with a fallback language (in this case Indonesian)
console.log(new Intl.DateTimeFormat(["ban", "id"]).format(date));
// Expected output: "20/12/2020"

// Specify date and time format using "style" options (i.e. full, long, medium, short)
console.log(
  new Intl.DateTimeFormat("en-GB", {
    dateStyle: "full",
    timeStyle: "long",
    timeZone: "Australia/Sydney",
  }).format(date),
);
// Expected output: "Sunday, 20 December 2020 at 14:23:16 GMT+11"
```

## Cú pháp

```js-nolint
new Intl.DateTimeFormat()
new Intl.DateTimeFormat(locales)
new Intl.DateTimeFormat(locales, options)

Intl.DateTimeFormat()
Intl.DateTimeFormat(locales)
Intl.DateTimeFormat(locales, options)
```

> [!NOTE]
> `Intl.DateTimeFormat()` có thể được gọi có hoặc không có [`new`](/en-US/docs/Web/JavaScript/Reference/Operators/new). Cả hai đều tạo ra một instance `Intl.DateTimeFormat` mới. Tuy nhiên, có một hành vi đặc biệt khi nó được gọi không có `new` và giá trị `this` là một instance `Intl.DateTimeFormat` khác; xem [Giá trị trả về](#return_value).

### Tham số

- `locales` {{optional_inline}}
  - : Một chuỗi với {{glossary("BCP 47 language tag")}} hoặc một instance {{jsxref("Intl.Locale")}}, hoặc một mảng các mã định danh ngôn ngữ như vậy. Ngôn ngữ mặc định của runtime được sử dụng khi `undefined` được truyền vào hoặc khi không có mã định danh ngôn ngữ nào được chỉ định được hỗ trợ. Để biết dạng chung và cách diễn giải đối số `locales`, xem [mô tả tham số trên trang chính `Intl`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Intl#locales_argument).

    Các khóa mở rộng Unicode sau được phép:
    - `nu`
      - : Xem [`numberingSystem`](#numberingsystem).
    - `ca`
      - : Xem [`calendar`](#calendar).
    - `hc`
      - : Xem [`hourCycle`](#hourcycle).

    Các khóa này cũng có thể được đặt với `options` (như liệt kê bên dưới). Khi cả hai được đặt, thuộc tính `options` sẽ được ưu tiên.

- `options` {{optional_inline}}
  - : Một đối tượng. Để dễ đọc, danh sách thuộc tính được chia theo mục đích, bao gồm [tùy chọn ngôn ngữ](#locale_options), [tùy chọn thành phần ngày giờ](#date-time_component_options), và [phím tắt kiểu dáng](#style_shortcuts).

#### Tùy chọn ngôn ngữ

- `localeMatcher`
  - : Thuật toán khớp ngôn ngữ cần sử dụng. Các giá trị có thể là `"lookup"` và `"best fit"`; mặc định là `"best fit"`. Để biết thêm thông tin về tùy chọn này, xem [Xác định và thương lượng ngôn ngữ](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Intl#locale_identification_and_negotiation).
- `calendar`
  - : Lịch cần sử dụng, chẳng hạn `"chinese"`, `"gregory"`, `"persian"`, v.v. Để biết danh sách các kiểu lịch được hỗ trợ, xem [`Intl.supportedValuesOf()`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Intl/supportedValuesOf#supported_calendar_types); mặc định phụ thuộc vào ngôn ngữ. Tùy chọn này cũng có thể được đặt thông qua khóa mở rộng Unicode `ca`; nếu cả hai được cung cấp, thuộc tính `options` này sẽ được ưu tiên.
- `numberingSystem`
  - : Hệ thống đánh số cần dùng để định dạng số, chẳng hạn `"arab"`, `"hans"`, `"mathsans"`, v.v. Để biết danh sách các kiểu hệ thống đánh số được hỗ trợ, xem [`Intl.supportedValuesOf()`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Intl/supportedValuesOf#supported_numbering_system_types); mặc định phụ thuộc vào ngôn ngữ. Tùy chọn này cũng có thể được đặt thông qua khóa mở rộng Unicode `nu`; nếu cả hai được cung cấp, thuộc tính `options` này sẽ được ưu tiên.
- `hour12`
  - : Liệu có sử dụng thời gian 12 giờ (thay vì 24 giờ). Các giá trị có thể là `true` và `false`; mặc định phụ thuộc vào ngôn ngữ. Khi `true`, tùy chọn này đặt `hourCycle` thành `"h11"` hoặc `"h12"`, tùy thuộc vào ngôn ngữ. Khi `false`, nó đặt `hourCycle` thành `"h23"`. `hour12` ghi đè cả thẻ mở rộng ngôn ngữ `hc` lẫn tùy chọn `hourCycle`, nếu có bất kỳ hoặc cả hai giá trị đó.
- `hourCycle`
  - : Chu kỳ giờ cần sử dụng. Các giá trị có thể là `"h11"`, `"h12"`, `"h23"`, và `"h24"`; mặc định được suy ra từ `hour12` và ngôn ngữ. Tùy chọn này cũng có thể được đặt thông qua khóa mở rộng Unicode `hc`; nếu cả hai được cung cấp, thuộc tính `options` này sẽ được ưu tiên.
- `timeZone`
  - : Múi giờ cần sử dụng. Có thể là bất kỳ [tên múi giờ IANA](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Temporal/ZonedDateTime#time_zones_and_offsets) nào, bao gồm các mã định danh có tên như `"UTC"`, `"America/New_York"`, và `"Etc/GMT+8"`, cũng như các mã định danh offset như `"+01:00"`, `"-2359"`, và `"+23"`. Mặc định là múi giờ của runtime, cùng múi giờ được sử dụng bởi {{jsxref("Date.prototype.toString()")}}.

#### Tùy chọn thành phần ngày giờ

- `weekday`
  - : Cách biểu diễn ngày trong tuần. Các giá trị có thể là:
    - `"long"`
      - : Ví dụ: `Thursday`
    - `"short"`
      - : Ví dụ: `Thu`
    - `"narrow"`
      - : Ví dụ: `T`. Hai ngày trong tuần có thể có cùng kiểu narrow đối với một số ngôn ngữ (ví dụ: cả `Tuesday` và `Thursday` đều có kiểu narrow là `T` trong ngôn ngữ `en-US`).
- `era`
  - : Cách biểu diễn kỷ nguyên. Các giá trị có thể là:
    - `"long"`
      - : Ví dụ: `Anno Domini`
    - `"short"`
      - : Ví dụ: `AD`
    - `"narrow"`
      - : Ví dụ: `A`
- `year`
  - : Cách biểu diễn năm. Các giá trị có thể là `"numeric"` và `"2-digit"`.
- `month`
  - : Cách biểu diễn tháng. Các giá trị có thể là:
    - `"numeric"`
      - : Ví dụ: `3`
    - `"2-digit"`
      - : Ví dụ: `03`
    - `"long"`
      - : Ví dụ: `March`
    - `"short"`
      - : Ví dụ: `Mar`
    - `"narrow"`
      - : Ví dụ: `M`. Hai tháng có thể có cùng kiểu narrow đối với một số ngôn ngữ (ví dụ: cả `March` và `May` đều có kiểu narrow là `M` trong ngôn ngữ `en-US`).
- `day`
  - : Cách biểu diễn ngày. Các giá trị có thể là `"numeric"` và `"2-digit"`.
- `dayPeriod`
  - : Kiểu định dạng dùng cho các khoảng thời gian trong ngày như "in the morning", "am", "noon", "n", v.v. Các giá trị có thể là `"narrow"`, `"short"`, và `"long"`.

    > [!NOTE]
    > Tùy chọn này chỉ có hiệu lực nếu sử dụng đồng hồ 12 giờ (`hourCycle: "h12"` hoặc `hourCycle: "h11"`). Nhiều ngôn ngữ sử dụng cùng một chuỗi bất kể giá trị độ rộng được chỉ định.

- `hour`
  - : Cách biểu diễn giờ. Các giá trị có thể là `"numeric"` và `"2-digit"`.
- `minute`
  - : Cách biểu diễn phút. Các giá trị có thể là `"numeric"` và `"2-digit"`.
- `second`
  - : Cách biểu diễn giây. Các giá trị có thể là `"numeric"` và `"2-digit"`.
- `fractionalSecondDigits`
  - : Số chữ số dùng để biểu diễn phần lẻ của giây (các chữ số thừa bị cắt bỏ). Các giá trị có thể là từ `1` đến `3`.
- `timeZoneName`
  - : Cách biểu diễn được bản địa hóa của tên múi giờ. Các giá trị có thể là:
    - `"long"`
      - : Dạng đầy đủ được bản địa hóa (ví dụ: `Pacific Standard Time`, `Nordamerikanische Westküsten-Normalzeit`)
    - `"short"`
      - : Dạng ngắn được bản địa hóa (ví dụ: `PST`, `GMT-8`)
    - `"shortOffset"`
      - : Định dạng GMT ngắn được bản địa hóa (ví dụ: `GMT-8`)
    - `"longOffset"`
      - : Định dạng GMT dài được bản địa hóa (ví dụ: `GMT-08:00`)
    - `"shortGeneric"`
      - : Định dạng ngắn chung không theo vị trí (ví dụ: `PT`, `Los Angeles Zeit`).
    - `"longGeneric"`
      - : Định dạng dài chung không theo vị trí (ví dụ: `Pacific Time`, `Nordamerikanische Westküstenzeit`)

    > [!NOTE]
    > Hiển thị múi giờ có thể quay lại định dạng khác nếu chuỗi yêu cầu không có sẵn. Ví dụ, các định dạng không theo vị trí nên hiển thị múi giờ mà không có vị trí quốc gia/thành phố cụ thể như "Pacific Time", nhưng có thể quay lại một múi giờ như "Los Angeles Time".

##### Giá trị mặc định của thành phần ngày giờ

Nếu bất kỳ tùy chọn thành phần ngày giờ nào được chỉ định, thì `dateStyle` và `timeStyle` phải là `undefined`. Nếu tất cả tùy chọn thành phần ngày giờ và `dateStyle`/`timeStyle` đều là `undefined`, một số tùy chọn mặc định cho thành phần ngày giờ sẽ được đặt, phụ thuộc vào đối tượng mà phương thức định dạng được gọi:

- Khi định dạng {{jsxref("Temporal.PlainDate")}} và {{jsxref("Date")}}, `year`, `month`, và `day` mặc định là `"numeric"`.
- Khi định dạng {{jsxref("Temporal.PlainTime")}}, `hour`, `minute`, và `second` mặc định là `"numeric"`.
- Khi định dạng {{jsxref("Temporal.PlainYearMonth")}}, `year` và `month` mặc định là `"numeric"`.
- Khi định dạng {{jsxref("Temporal.PlainMonthDay")}}, `month` và `day` mặc định là `"numeric"`.
- Khi định dạng {{jsxref("Temporal.PlainDateTime")}} và {{jsxref("Temporal.Instant")}}, `year`, `month`, `day`, `hour`, `minute`, và `second` mặc định là `"numeric"`.

##### Khớp định dạng

Các triển khai được yêu cầu hỗ trợ hiển thị ít nhất các tập hợp con thành phần ngày giờ sau:

- `weekday`, `year`, `month`, `day`, `hour`, `minute`, `second`
- `weekday`, `year`, `month`, `day`
- `year`, `month`, `day`
- `year`, `month`
- `month`, `day`
- `hour`, `minute`, `second`
- `hour`, `minute`

Các kiểu thành phần ngày giờ được yêu cầu có thể không trực tiếp tương ứng với định dạng hợp lệ được hỗ trợ bởi ngôn ngữ, vì vậy trình khớp định dạng cho phép bạn chỉ định cách khớp các kiểu được yêu cầu với định dạng được hỗ trợ gần nhất.

- `formatMatcher`
  - : Thuật toán khớp định dạng cần sử dụng. Các giá trị có thể là `"basic"` và `"best fit"`; mặc định là `"best fit"`. Thuật toán cho `"best fit"` được định nghĩa bởi triển khai, và `"basic"` được [định nghĩa bởi đặc tả](https://tc39.es/ecma402/#sec-basicformatmatcher). Tùy chọn này chỉ được sử dụng khi cả `dateStyle` và `timeStyle` đều là `undefined` (để định dạng của từng thành phần ngày giờ có thể được tùy chỉnh riêng lẻ).

#### Phím tắt kiểu dáng

- `dateStyle`
  - : [Kiểu định dạng ngày](https://cldr.unicode.org/translation/date-time/date-time-patterns#h.aa5zjyepm6vh) cần sử dụng. Các giá trị có thể là `"full"`, `"long"`, `"medium"`, và `"short"`. Nó mở rộng thành các kiểu cho `weekday`, `day`, `month`, `year`, và `era`, với sự kết hợp cụ thể các giá trị tùy thuộc vào ngôn ngữ. Khi định dạng các đối tượng như {{jsxref("Temporal.PlainDate")}}, {{jsxref("Temporal.PlainYearMonth")}}, và {{jsxref("Temporal.PlainMonthDay")}}, `dateStyle` sẽ chỉ phân giải thành các trường liên quan đến đối tượng đó.
- `timeStyle`
  - : [Kiểu định dạng giờ](https://cldr.unicode.org/translation/date-time/date-time-patterns#h.588vo3awdscu) cần sử dụng. Các giá trị có thể là `"full"`, `"long"`, `"medium"`, và `"short"`. Nó mở rộng thành các kiểu cho `hour`, `minute`, `second`, và `timeZoneName`, với sự kết hợp cụ thể các giá trị tùy thuộc vào ngôn ngữ.

> [!NOTE]
> `dateStyle` và `timeStyle` có thể được sử dụng cùng nhau, nhưng không thể dùng với các tùy chọn thành phần ngày giờ khác (ví dụ: `weekday`, `hour`, `month`, v.v.).

Bạn có thể định dạng các kiểu đối tượng khác nhau tùy thuộc vào tùy chọn phím tắt kiểu dáng bạn bao gồm:

- Nếu `dateStyle` được chỉ định, bạn có thể định dạng các đối tượng {{jsxref("Temporal.PlainDate")}}, {{jsxref("Temporal.PlainYearMonth")}}, và {{jsxref("Temporal.PlainMonthDay")}}.
- Nếu `timeStyle` được chỉ định, bạn có thể định dạng các đối tượng {{jsxref("Temporal.PlainTime")}}.
- Nếu `dateStyle` hoặc `timeStyle` được chỉ định, bạn có thể định dạng các đối tượng {{jsxref("Temporal.PlainDateTime")}} và {{jsxref("Date")}}.

### Giá trị trả về

Một đối tượng `Intl.DateTimeFormat` mới.

> [!NOTE]
> Văn bản bên dưới mô tả hành vi được đặc tả đánh dấu là "tùy chọn". Nó có thể không hoạt động trong tất cả môi trường. Xem [bảng tương thích trình duyệt](#browser_compatibility).

Thông thường, `Intl.DateTimeFormat()` có thể được gọi có hoặc không có [`new`](/en-US/docs/Web/JavaScript/Reference/Operators/new), và một instance `Intl.DateTimeFormat` mới được trả về trong cả hai trường hợp. Tuy nhiên, nếu giá trị [`this`](/en-US/docs/Web/JavaScript/Reference/Operators/this) là một đối tượng thuộc loại [`instanceof`](/en-US/docs/Web/JavaScript/Reference/Operators/instanceof) `Intl.DateTimeFormat` (không nhất thiết có nghĩa là nó được tạo thông qua `new Intl.DateTimeFormat`; chỉ cần nó có `Intl.DateTimeFormat.prototype` trong chuỗi prototype của nó), thì giá trị `this` sẽ được trả về, với đối tượng `Intl.DateTimeFormat` mới được tạo ẩn trong thuộc tính `[Symbol(IntlLegacyConstructedSymbol)]` (một symbol duy nhất được tái sử dụng giữa các instance).

```js
const formatter = Intl.DateTimeFormat.call(
  { __proto__: Intl.DateTimeFormat.prototype },
  "en-US",
  { dateStyle: "full" },
);
console.log(Object.getOwnPropertyDescriptors(formatter));
// {
//   [Symbol(IntlLegacyConstructedSymbol)]: {
//     value: DateTimeFormat [Intl.DateTimeFormat] {},
//     writable: false,
//     enumerable: false,
//     configurable: false
//   }
// }
```

Lưu ý rằng chỉ có một instance `Intl.DateTimeFormat` thực sự ở đây: cái được ẩn trong `[Symbol(IntlLegacyConstructedSymbol)]`. Gọi các phương thức [`format()`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Intl/DateTimeFormat/format) và [`resolvedOptions()`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Intl/DateTimeFormat/resolvedOptions) trên `formatter` sẽ sử dụng đúng các tùy chọn được lưu trong instance đó, nhưng việc gọi tất cả các phương thức khác (ví dụ: [`formatRange()`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Intl/DateTimeFormat/formatRange)) sẽ thất bại: "TypeError: formatRange method called on incompatible Object", vì các phương thức đó không tham khảo các tùy chọn của instance ẩn.

Hành vi này, được gọi là `ChainDateTimeFormat`, không xảy ra khi `Intl.DateTimeFormat()` được gọi không có `new` nhưng với `this` được đặt thành bất kỳ thứ gì khác không phải là `instanceof Intl.DateTimeFormat`. Nếu bạn gọi trực tiếp là `Intl.DateTimeFormat()`, giá trị `this` là [`Intl`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Intl), và một instance `Intl.DateTimeFormat` mới được tạo bình thường.

### Ngoại lệ

- {{jsxref("RangeError")}}
  - : Được ném ra nếu `locales` hoặc `options` chứa các giá trị không hợp lệ.

## Ví dụ

### Sử dụng DateTimeFormat

Khi sử dụng cơ bản mà không chỉ định ngôn ngữ, `DateTimeFormat` sử dụng ngôn ngữ và các tùy chọn mặc định.

```js
const date = new Date(Date.UTC(2012, 11, 20, 3, 0, 0));

// toLocaleString without arguments depends on the implementation,
// the default locale, and the default time zone
console.log(new Intl.DateTimeFormat().format(date));
// "12/19/2012" if run with en-US locale (language) and time zone America/Los_Angeles (UTC-0800)
```

### Sử dụng timeStyle và dateStyle

`dateStyle` và `timeStyle` cung cấp phím tắt để đặt nhiều tùy chọn thành phần ngày giờ cùng một lúc. Ví dụ, đối với `en-US`, `dateStyle: "short"` tương đương với việc đặt `year: "2-digit", month: "numeric", day: "numeric"`, và `timeStyle: "short"` tương đương với việc đặt `hour: "numeric", minute: "numeric"`.

```js
const shortTime = new Intl.DateTimeFormat("en-US", {
  timeStyle: "short",
});
console.log(shortTime.format(Date.now())); // "1:31 PM"

const shortDate = new Intl.DateTimeFormat("en-US", {
  dateStyle: "short",
});
console.log(shortDate.format(Date.now())); // "7/7/20"

const mediumTime = new Intl.DateTimeFormat("en-US", {
  timeStyle: "medium",
  dateStyle: "short",
});
console.log(mediumTime.format(Date.now())); // "7/7/20, 1:31:55 PM"
```

Tuy nhiên, các kiểu thành phần cụ thể (phụ thuộc vào ngôn ngữ) mà chúng phân giải thành không được bao gồm trong [các tùy chọn đã phân giải](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Intl/DateTimeFormat/resolvedOptions). Điều này đảm bảo kết quả của `resolvedOptions()` có thể được truyền trực tiếp vào constructor `Intl.DateTimeFormat()` (vì một đối tượng `options` có cả `dateStyle` hoặc `timeStyle` lẫn các kiểu thành phần ngày hoặc giờ riêng lẻ là không hợp lệ).

```js
console.log(shortDate.resolvedOptions().year); // undefined
```

### Sử dụng dayPeriod

Sử dụng tùy chọn `dayPeriod` để xuất ra chuỗi cho các thời điểm trong ngày ("in the morning", "at night", "noon", v.v.). Lưu ý rằng điều này chỉ hoạt động khi định dạng cho đồng hồ 12 giờ (`hourCycle: 'h12'` hoặc `hourCycle: 'h11'`) và đối với nhiều ngôn ngữ, các chuỗi giống nhau bất kể giá trị được truyền cho `dayPeriod`.

```js
const date = Date.UTC(2012, 11, 17, 4, 0, 42);

console.log(
  new Intl.DateTimeFormat("en-GB", {
    hour: "numeric",
    hourCycle: "h12",
    dayPeriod: "short",
    timeZone: "UTC",
  }).format(date),
);
// 4 at night"  (same formatting in en-GB for all dayPeriod values)

console.log(
  new Intl.DateTimeFormat("fr", {
    hour: "numeric",
    hourCycle: "h12",
    dayPeriod: "narrow",
    timeZone: "UTC",
  }).format(date),
);
// "4 mat."  (same output in French for both narrow/short dayPeriod)

console.log(
  new Intl.DateTimeFormat("fr", {
    hour: "numeric",
    hourCycle: "h12",
    dayPeriod: "long",
    timeZone: "UTC",
  }).format(date),
);
// "4 du matin"
```

### Sử dụng timeZoneName

Sử dụng tùy chọn `timeZoneName` để xuất ra chuỗi cho múi giờ ("GMT", "Pacific Time", v.v.).

```js
const date = Date.UTC(2021, 11, 17, 3, 0, 42);
const timezoneNames = [
  "short",
  "long",
  "shortOffset",
  "longOffset",
  "shortGeneric",
  "longGeneric",
];

for (const zoneName of timezoneNames) {
  // Do something with currentValue
  const formatter = new Intl.DateTimeFormat("en-US", {
    timeZone: "America/Los_Angeles",
    timeZoneName: zoneName,
  });
  console.log(`${zoneName}: ${formatter.format(date)}`);
}

// Logs:
// short: 12/16/2021, PST
// long: 12/16/2021, Pacific Standard Time
// shortOffset: 12/16/2021, GMT-8
// longOffset: 12/16/2021, GMT-08:00
// shortGeneric: 12/16/2021, PT
// longGeneric: 12/16/2021, Pacific Time
```

## Đặc tả kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{jsxref("Intl.DateTimeFormat")}}
- {{jsxref("Intl.supportedValuesOf()")}}
- {{jsxref("Intl")}}
