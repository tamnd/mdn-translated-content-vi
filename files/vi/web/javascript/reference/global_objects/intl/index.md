---
title: Intl
slug: Web/JavaScript/Reference/Global_Objects/Intl
page-type: javascript-namespace
browser-compat: javascript.builtins.Intl
sidebar: jsref
---

Đối tượng không gian tên **`Intl`** chứa một số constructor cũng như chức năng chung cho các constructor quốc tế hóa và các hàm nhạy cảm ngôn ngữ khác. Tổng thể, chúng tạo thành API Quốc tế hóa ECMAScript, cung cấp so sánh chuỗi nhạy cảm ngôn ngữ, định dạng số, định dạng ngày và giờ, v.v.

## Mô tả

Không giống hầu hết các đối tượng toàn cục, `Intl` không phải là constructor. Bạn không thể sử dụng nó với [toán tử `new`](/en-US/docs/Web/JavaScript/Reference/Operators/new) hay gọi đối tượng `Intl` như một hàm. Tất cả thuộc tính và phương thức của `Intl` đều là tĩnh (giống như đối tượng {{jsxref("Math")}}).

Các constructor quốc tế hóa cũng như một số phương thức nhạy cảm ngôn ngữ của các constructor khác (được liệt kê trong [Xem thêm](#see_also)) sử dụng một mẫu chung để xác định ngôn ngữ và xác định ngôn ngữ sẽ được sử dụng thực tế: tất cả chúng đều chấp nhận đối số `locales` và `options`, và thương lượng (các) ngôn ngữ được yêu cầu so với các ngôn ngữ chúng hỗ trợ bằng thuật toán được chỉ định trong thuộc tính `options.localeMatcher`.

### Đối số locales

Đối số `locales` được dùng để xác định ngôn ngữ sử dụng trong một thao tác nhất định. Việc triển khai JavaScript sẽ kiểm tra `locales`, rồi tính toán ngôn ngữ mà nó hiểu và đáp ứng tốt nhất tùy chọn được biểu đạt. `locales` có thể là:

- `undefined` (hoặc bị bỏ qua): Ngôn ngữ mặc định của việc triển khai sẽ được sử dụng.
- Một ngôn ngữ: Một mã định danh ngôn ngữ hoặc đối tượng [`Intl.Locale`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Intl/Locale) bao bọc mã định danh ngôn ngữ.
- Danh sách ngôn ngữ: Bất kỳ giá trị nào khác sẽ được chuyển đổi thành đối tượng và sau đó được xử lý như một mảng ngôn ngữ.

Trong hai trường hợp sau, ngôn ngữ thực sự được sử dụng là ngôn ngữ được hỗ trợ tốt nhất được xác định bởi [thương lượng ngôn ngữ](#locale_identification_and_negotiation). Nếu mã định danh ngôn ngữ không phải là chuỗi hay đối tượng, một {{jsxref("TypeError")}} sẽ được ném ra. Nếu mã định danh ngôn ngữ là chuỗi không hợp lệ về mặt cú pháp, một {{jsxref("RangeError")}} sẽ được ném ra. Nếu mã định danh ngôn ngữ được định dạng tốt nhưng việc triển khai không nhận ra nó, nó sẽ bị bỏ qua và ngôn ngữ tiếp theo trong danh sách sẽ được xem xét, cuối cùng quay lại ngôn ngữ của hệ thống. Tuy nhiên, bạn không nên dựa vào tên ngôn ngữ cụ thể nào đó bị bỏ qua, vì việc triển khai có thể thêm dữ liệu cho bất kỳ ngôn ngữ nào trong tương lai. Ví dụ, `new Intl.DateTimeFormat("default")` chỉ sử dụng ngôn ngữ mặc định của việc triển khai vì `"default"` hợp lệ về mặt cú pháp nhưng không được nhận ra là ngôn ngữ nào.

Mã định danh ngôn ngữ là chuỗi bao gồm:

1. Thẻ con ngôn ngữ với 2–3 hoặc 5–8 chữ cái
2. Thẻ con chữ viết với 4 chữ cái {{optional_inline}}
3. Thẻ con vùng với 2 chữ cái hoặc 3 chữ số {{optional_inline}}
4. Một hay nhiều thẻ con biến thể (mỗi thẻ phải là duy nhất), mỗi thẻ có 5–8 ký tự chữ và số hoặc một chữ số theo sau bởi 3 ký tự chữ và số {{optional_inline}}
5. Một hay nhiều chuỗi mở rộng {{glossary("BCP 47 language tag", "BCP 47")}} {{optional_inline}}
6. Một chuỗi mở rộng dùng riêng {{optional_inline}}

Mỗi thẻ con và chuỗi được phân tách bằng dấu gạch ngang. Mã định danh ngôn ngữ không phân biệt chữ hoa chữ thường {{Glossary("ASCII")}}. Tuy nhiên, theo quy ước, dùng chữ hoa đầu (chữ cái đầu viết hoa, các chữ cái tiếp theo viết thường) cho thẻ con chữ viết, chữ hoa cho thẻ con vùng, và chữ thường cho mọi thứ khác. Ví dụ:

- `"hi"`: Hindi (ngôn ngữ)
- `"de-AT"`: tiếng Đức (ngôn ngữ) như được dùng ở Áo (vùng)
- `"zh-Hans-CN"`: tiếng Trung (ngôn ngữ) viết bằng chữ giản thể (chữ viết) như được dùng ở Trung Quốc (vùng)
- `"en-emodeng"`: tiếng Anh (ngôn ngữ) theo phương ngữ "tiếng Anh cận đại sơ kỳ" (biến thể)

Các thẻ con xác định ngôn ngữ, chữ viết, vùng (bao gồm quốc gia), và biến thể (ít được dùng) được đăng ký trong [Sổ đăng ký thẻ con ngôn ngữ IANA](https://www.iana.org/assignments/language-subtag-registry/language-subtag-registry). Sổ đăng ký này được cập nhật định kỳ theo thời gian, và các triển khai không phải lúc nào cũng cập nhật, vì vậy đừng phụ thuộc quá nhiều vào việc các thẻ con được hỗ trợ phổ quát.

Các chuỗi mở rộng BCP 47 bao gồm một chữ số hoặc chữ cái (khác `"x"`) và một hay nhiều thẻ con từ hai đến tám chữ cái hoặc chữ số được phân tách bằng dấu gạch ngang. Chỉ được phép có một chuỗi cho mỗi chữ số hoặc chữ cái: `"de-a-foo-a-foo"` là không hợp lệ. Các thẻ con mở rộng BCP 47 được định nghĩa trong [Dự án Unicode CLDR](https://github.com/unicode-org/cldr/tree/main/common/bcp47). Hiện tại chỉ có hai mở rộng có ngữ nghĩa được định nghĩa:

- Mở rộng `"u"` (Unicode) có thể được dùng để yêu cầu tùy chỉnh thêm cho các đối tượng API `Intl`. Ví dụ:
  - `"de-DE-u-co-phonebk"`: Sử dụng biến thể sách điện thoại của thứ tự sắp xếp tiếng Đức, diễn giải các nguyên âm có umlaut thành các cặp ký tự tương ứng: ä → ae, ö → oe, ü → ue.
  - `"th-TH-u-nu-thai"`: Sử dụng chữ số Thái (๐, ๑, ๒, ๓, ๔, ๕, ๖, ๗, ๘, ๙) trong định dạng số.
  - `"ja-JP-u-ca-japanese"`: Sử dụng lịch Nhật Bản trong định dạng ngày và giờ, sao cho 2013 được biểu thị là năm 25 của thời kỳ Heisei, hay 平成 25.
  - `"en-GB-u-ca-islamic-umalqura"`: Sử dụng tiếng Anh Anh với lịch Umm al-Qura (Hijri), trong đó ngày Gregorian 14 tháng 10, 2017 là ngày Hijri 24 Muharram, 1439.

- Mở rộng `"t"` (đã được biến đổi) chỉ ra nội dung đã được biến đổi: ví dụ, văn bản được dịch từ ngôn ngữ khác. Hiện tại không có chức năng `Intl` nào xem xét mở rộng `"t"`. Tuy nhiên, mở rộng này đôi khi chứa một ngôn ngữ lồng nhau (không có mở rộng): ví dụ, mở rộng biến đổi trong `"de-t-en"` chứa mã định danh ngôn ngữ cho tiếng Anh. Nếu có ngôn ngữ lồng nhau, nó phải là mã định danh ngôn ngữ hợp lệ. Ví dụ, vì `"en-emodeng-emodeng"` không hợp lệ (vì chứa thẻ con biến thể `emodeng` trùng lặp), `"de-t-en-emodeng-emodeng"` cũng không hợp lệ.

Cuối cùng, một chuỗi mở rộng dùng riêng sử dụng chữ cái `"x"` có thể xuất hiện, theo sau bởi một hay nhiều thẻ con từ một đến tám chữ cái hoặc chữ số được phân tách bằng dấu gạch ngang. Điều này cho phép các ứng dụng mã hóa thông tin để sử dụng riêng, và sẽ bị tất cả các thao tác `Intl` bỏ qua.

### Đối số options

Đối số `options` phải là đối tượng với các thuộc tính khác nhau tùy theo constructor và hàm. Nếu đối số `options` không được cung cấp hoặc là undefined, các giá trị mặc định sẽ được dùng cho tất cả thuộc tính.

Có một thuộc tính được hỗ trợ bởi tất cả các constructor và hàm nhạy cảm ngôn ngữ: Thuộc tính `localeMatcher`, có giá trị phải là chuỗi `"lookup"` hoặc `"best fit"` và chọn một trong các thuật toán khớp ngôn ngữ được mô tả bên dưới.

### Xác định và thương lượng ngôn ngữ

Danh sách các ngôn ngữ được chỉ định bởi đối số `locales`, sau khi đã loại bỏ các mở rộng Unicode khỏi chúng, được hiểu là yêu cầu ưu tiên từ ứng dụng. Runtime so sánh nó với các ngôn ngữ nó có sẵn và chọn ngôn ngữ tốt nhất. Có hai thuật toán khớp: trình khớp `"lookup"` tuân theo thuật toán Lookup được chỉ định trong [BCP 47](https://datatracker.ietf.org/doc/html/rfc4647#section-3.4); trình khớp `"best fit"` cho phép runtime cung cấp ngôn ngữ phù hợp ít nhất là bằng, nhưng có thể phù hợp hơn, so với kết quả của thuật toán Lookup. Nếu ứng dụng không cung cấp đối số `locales`, hoặc runtime không có ngôn ngữ nào khớp với yêu cầu, thì ngôn ngữ mặc định của runtime sẽ được sử dụng. Trình khớp có thể được chọn bằng một thuộc tính của đối số `options` (xem bên dưới).

Nếu mã định danh ngôn ngữ đã chọn có chuỗi mở rộng Unicode, mở rộng đó sẽ được sử dụng để tùy chỉnh đối tượng được xây dựng hoặc hành vi của hàm. Mỗi constructor hay hàm chỉ hỗ trợ một tập con các khóa được định nghĩa cho mở rộng Unicode, và các giá trị được hỗ trợ thường phụ thuộc vào mã định danh ngôn ngữ. Ví dụ, khóa `"co"` (đối chiếu) chỉ được hỗ trợ bởi {{jsxref("Intl.Collator")}}, và giá trị `"phonebk"` của nó chỉ được hỗ trợ cho tiếng Đức.

## Thuộc tính tĩnh

- {{jsxref("Intl.Collator")}}
  - : Constructor cho các đối chiếu viên, là các đối tượng cho phép so sánh chuỗi nhạy cảm ngôn ngữ.
- {{jsxref("Intl.DateTimeFormat")}}
  - : Constructor cho các đối tượng cho phép định dạng ngày và giờ nhạy cảm ngôn ngữ.
- {{jsxref("Intl.DisplayNames")}}
  - : Constructor cho các đối tượng cho phép dịch nhất quán tên hiển thị ngôn ngữ, vùng và chữ viết.
- {{jsxref("Intl.DurationFormat")}}
  - : Constructor cho các đối tượng cho phép định dạng thời lượng nhạy cảm ngôn ngữ.
- {{jsxref("Intl.ListFormat")}}
  - : Constructor cho các đối tượng cho phép định dạng danh sách nhạy cảm ngôn ngữ.
- {{jsxref("Intl.Locale")}}
  - : Constructor cho các đối tượng biểu diễn mã định danh ngôn ngữ Unicode.
- {{jsxref("Intl.NumberFormat")}}
  - : Constructor cho các đối tượng cho phép định dạng số nhạy cảm ngôn ngữ.
- {{jsxref("Intl.PluralRules")}}
  - : Constructor cho các đối tượng cho phép định dạng nhạy cảm số nhiều và các quy tắc ngôn ngữ cụ thể cho số nhiều.
- {{jsxref("Intl.RelativeTimeFormat")}}
  - : Constructor cho các đối tượng cho phép định dạng thời gian tương đối nhạy cảm ngôn ngữ.
- {{jsxref("Intl.Segmenter")}}
  - : Constructor cho các đối tượng cho phép phân đoạn văn bản nhạy cảm ngôn ngữ.
- `Intl[Symbol.toStringTag]`
  - : Giá trị khởi tạo của thuộc tính [`[Symbol.toStringTag]`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Symbol/toStringTag) là chuỗi `"Intl"`. Thuộc tính này được dùng trong {{jsxref("Object.prototype.toString()")}}.

## Phương thức tĩnh

- {{jsxref("Intl.getCanonicalLocales()")}}
  - : Trả về các tên ngôn ngữ chuẩn tắc.
- {{jsxref("Intl.supportedValuesOf()")}}
  - : Trả về mảng được sắp xếp chứa các giá trị lịch, đối chiếu, tiền tệ, hệ thống đánh số hoặc đơn vị duy nhất được hỗ trợ bởi việc triển khai.

## Ví dụ

### Định dạng ngày và số

Bạn có thể dùng `Intl` để định dạng ngày và số theo dạng thông thường cho một ngôn ngữ và vùng cụ thể:

```js
const count = 26254.39;
const date = new Date("2012-05-24");

function log(locale) {
  console.log(
    `${new Intl.DateTimeFormat(locale).format(date)} ${new Intl.NumberFormat(
      locale,
    ).format(count)}`,
  );
}

log("en-US"); // 5/24/2012 26,254.39

log("de-DE"); // 24.5.2012 26.254,39
```

### Sử dụng ngôn ngữ ưu tiên của trình duyệt

Thay vì truyền tên ngôn ngữ được mã cứng vào các phương thức `Intl`, bạn có thể sử dụng ngôn ngữ ưu tiên của người dùng được cung cấp bởi {{domxref("navigator.language")}}:

```js
const date = new Date("2012-05-24");

const formattedDate = new Intl.DateTimeFormat(navigator.language).format(date);
```

Ngoài ra, thuộc tính {{domxref("navigator.languages")}} cung cấp danh sách được sắp xếp theo thứ tự ưu tiên của các ngôn ngữ ưu tiên của người dùng. Danh sách này có thể được truyền trực tiếp đến các constructor `Intl` để triển khai lựa chọn dự phòng dựa trên sở thích của ngôn ngữ. Quá trình [thương lượng ngôn ngữ](#locale_identification_and_negotiation) được sử dụng để chọn ngôn ngữ phù hợp nhất có sẵn:

```js
const count = 26254.39;

const formattedCount = new Intl.NumberFormat(navigator.languages).format(count);
```

## Đặc tả kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("Keyboard.getLayoutMap()")}}
- {{domxref("navigator.language")}}
- {{domxref("navigator.languages")}}
- [The ECMAScript Internationalization API](https://norbertlindenberg.com/2012/12/ecmascript-internationalization-api/index.html) by Norbert Lindenberg (2012)
