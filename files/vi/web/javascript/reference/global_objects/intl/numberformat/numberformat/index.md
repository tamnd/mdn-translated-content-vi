---
title: Intl.NumberFormat() constructor
short-title: Intl.NumberFormat()
slug: Web/JavaScript/Reference/Global_Objects/Intl/NumberFormat/NumberFormat
page-type: javascript-constructor
browser-compat: javascript.builtins.Intl.NumberFormat.NumberFormat
sidebar: jsref
---

Hàm khởi tạo **`Intl.NumberFormat()`** tạo ra các đối tượng {{jsxref("Intl.NumberFormat")}}.

{{InteractiveExample("JavaScript Demo: Intl.NumberFormat() constructor", "taller")}}

```js interactive-example
const number = 123456.789;

console.log(
  new Intl.NumberFormat("de-DE", { style: "currency", currency: "EUR" }).format(
    number,
  ),
);
// Expected output: "123.456,79 €"

// The Japanese yen doesn't use a minor unit
console.log(
  new Intl.NumberFormat("ja-JP", { style: "currency", currency: "JPY" }).format(
    number,
  ),
);
// Expected output: "￥123,457"

// Limit to three significant digits
console.log(
  new Intl.NumberFormat("en-IN", { maximumSignificantDigits: 3 }).format(
    number,
  ),
);
// Expected output: "1,23,000"
```

## Cú pháp

```js-nolint
new Intl.NumberFormat()
new Intl.NumberFormat(locales)
new Intl.NumberFormat(locales, options)

Intl.NumberFormat()
Intl.NumberFormat(locales)
Intl.NumberFormat(locales, options)
```

> [!NOTE]
> `Intl.NumberFormat()` có thể được gọi có hoặc không có [`new`](/en-US/docs/Web/JavaScript/Reference/Operators/new). Cả hai đều tạo ra một instance `Intl.NumberFormat` mới. Tuy nhiên, có một hành vi đặc biệt khi nó được gọi mà không có `new` và giá trị `this` là một instance `Intl.NumberFormat` khác; xem [Giá trị trả về](#return_value).

### Tham số

- `locales` {{optional_inline}}
  - : Chuỗi với {{glossary("BCP 47 language tag")}} hoặc một instance {{jsxref("Intl.Locale")}}, hoặc một mảng các định danh locale như vậy. Locale mặc định của runtime được dùng khi `undefined` được truyền vào hoặc khi không có định danh locale nào được chỉ định được hỗ trợ. Để biết dạng chung và cách diễn giải đối số `locales`, xem [mô tả tham số trên trang chính `Intl`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Intl#locales_argument).

  Khóa mở rộng Unicode sau được phép:
  - `nu`
    - : Xem [`numberingSystem`](#numberingsystem).

  Khóa này cũng có thể được đặt bằng `options` (như liệt kê bên dưới). Khi cả hai được đặt, thuộc tính `options` có ưu tiên cao hơn.

- `options` {{optional_inline}}
  - : Đối tượng. Để dễ đọc, danh sách thuộc tính được chia thành các mục dựa trên mục đích của chúng, bao gồm [tùy chọn locale](#locale_options), [tùy chọn kiểu](#style_options), [tùy chọn chữ số](#digit_options) và [các tùy chọn khác](#other_options).

#### Tùy chọn locale

- `localeMatcher`
  - : Thuật toán khớp locale để sử dụng. Các giá trị có thể là `"lookup"` và `"best fit"`; mặc định là `"best fit"`. Để biết thông tin về tùy chọn này, xem [Nhận diện và thương lượng locale](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Intl#locale_identification_and_negotiation).
- `numberingSystem`
  - : Hệ thống đánh số để dùng trong định dạng số, chẳng hạn như `"arab"`, `"hans"`, `"mathsans"`, v.v. Để biết danh sách các loại hệ thống đánh số được hỗ trợ, xem [`Intl.supportedValuesOf()`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Intl/supportedValuesOf#supported_numbering_system_types); mặc định phụ thuộc vào locale. Tùy chọn này cũng có thể được đặt qua khóa mở rộng Unicode `nu`; nếu cả hai được cung cấp, thuộc tính `options` này có ưu tiên cao hơn.

#### Tùy chọn kiểu

Tùy thuộc vào `style` được dùng, một số tùy chọn có thể bị bỏ qua, và một số có thể là bắt buộc:

- `style`
  - : Kiểu định dạng để sử dụng.
    - `"decimal"` (mặc định)
      - : Để định dạng số thông thường.
    - `"currency"`
      - : Để định dạng tiền tệ.
    - `"percent"`
      - : Để định dạng phần trăm.
    - `"unit"`
      - : Để định dạng đơn vị.
- `currency`
  - : Tiền tệ để dùng trong định dạng tiền tệ. Các giá trị có thể là mã tiền tệ ISO 4217, chẳng hạn như `"USD"` cho đô la Mỹ, `"EUR"` cho euro, hoặc `"CNY"` cho nhân dân tệ — xem [`Intl.supportedValuesOf()`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Intl/supportedValuesOf#supported_currency_identifiers). Không có giá trị mặc định; nếu `style` là `"currency"`, thuộc tính `currency` phải được cung cấp. Nó được chuẩn hóa thành chữ hoa.
- `currencyDisplay`
  - : Cách hiển thị tiền tệ trong định dạng tiền tệ.
    - `"code"`
      - : Sử dụng mã ISO tiền tệ.
    - `"symbol"` (mặc định)
      - : Sử dụng ký hiệu tiền tệ đã được bản địa hóa như €.
    - `"narrowSymbol"`
      - : Sử dụng định dạng ký hiệu thu hẹp ("$100" thay vì "US$100").
    - `"name"`
      - : Sử dụng tên tiền tệ đã được bản địa hóa như `"dollar"`.
- `currencySign`
  - : Ở nhiều locale, định dạng kế toán có nghĩa là bao quanh số bằng dấu ngoặc đơn thay vì thêm dấu trừ. Các giá trị có thể là `"standard"` và `"accounting"`; mặc định là `"standard"`.
- `unit`
  - : Đơn vị để dùng trong định dạng `unit`. Các giá trị có thể được liệt kê trong [`Intl.supportedValuesOf()`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Intl/supportedValuesOf#supported_unit_identifiers). Các cặp đơn vị đơn giản có thể được nối với "-per-" để tạo đơn vị kép. Không có giá trị mặc định; nếu `style` là `"unit"`, thuộc tính `unit` phải được cung cấp.
- `unitDisplay`
  - : Kiểu định dạng đơn vị để dùng trong định dạng `unit`. Các giá trị có thể là:
    - `"short"` (mặc định)
      - : Ví dụ: `16 l`.
    - `"narrow"`
      - : Ví dụ: `16l`.
    - `"long"`
      - : Ví dụ: `16 litres`.

#### Tùy chọn chữ số

Các thuộc tính sau cũng được {{jsxref("Intl.PluralRules")}} hỗ trợ.

- `minimumIntegerDigits`
  - : Số chữ số nguyên tối thiểu để sử dụng. Một giá trị có số chữ số nguyên nhỏ hơn số này sẽ được đệm bằng số không ở bên trái (đến độ dài được chỉ định) khi định dạng. Các giá trị có thể từ `1` đến `21`; mặc định là `1`.
- `minimumFractionDigits`
  - : Số chữ số thập phân tối thiểu để sử dụng. Các giá trị có thể từ `0` đến `100`; mặc định cho định dạng số thông thường và phần trăm là `0`; mặc định cho định dạng tiền tệ là số chữ số đơn vị nhỏ nhất được cung cấp bởi [danh sách mã tiền tệ ISO 4217](https://www.six-group.com/dam/download/financial-information/data-center/iso-currrency/lists/list-one.xml) (2 nếu danh sách không cung cấp thông tin đó). Xem [Giá trị mặc định của SignificantDigits/FractionDigits](#significantdigitsfractiondigits_default_values) để biết khi nào giá trị mặc định này được áp dụng.
- `maximumFractionDigits`
  - : Số chữ số thập phân tối đa để sử dụng. Các giá trị có thể từ `0` đến `100`; mặc định cho định dạng số thông thường là giá trị lớn hơn của `minimumFractionDigits` và `3`; mặc định cho định dạng tiền tệ là giá trị lớn hơn của `minimumFractionDigits` và số chữ số đơn vị nhỏ nhất được cung cấp bởi [danh sách mã tiền tệ ISO 4217](https://www.six-group.com/dam/download/financial-information/data-center/iso-currrency/lists/list-one.xml) (2 nếu danh sách không cung cấp thông tin đó); mặc định cho định dạng phần trăm là giá trị lớn hơn của `minimumFractionDigits` và 0. Xem [Giá trị mặc định của SignificantDigits/FractionDigits](#significantdigitsfractiondigits_default_values) để biết khi nào giá trị mặc định này được áp dụng.
- `minimumSignificantDigits`
  - : Số chữ số có nghĩa tối thiểu để sử dụng. Các giá trị có thể từ `1` đến `21`; mặc định là `1`. Xem [Giá trị mặc định của SignificantDigits/FractionDigits](#significantdigitsfractiondigits_default_values) để biết khi nào giá trị mặc định này được áp dụng.
- `maximumSignificantDigits`
  - : Số chữ số có nghĩa tối đa để sử dụng. Các giá trị có thể từ `1` đến `21`; mặc định là `21`. Xem [Giá trị mặc định của SignificantDigits/FractionDigits](#significantdigitsfractiondigits_default_values) để biết khi nào giá trị mặc định này được áp dụng.
- `roundingPriority`
  - : Chỉ định cách giải quyết xung đột làm tròn nếu cả "FractionDigits" ([`minimumFractionDigits`](#minimumfractiondigits)/[`maximumFractionDigits`](#maximumfractiondigits)) và "SignificantDigits" ([`minimumSignificantDigits`](#minimumsignificantdigits)/[`maximumSignificantDigits`](#maximumsignificantdigits)) đều được chỉ định. Các giá trị có thể là:
    - `"auto"` (mặc định)
      - : Kết quả từ thuộc tính chữ số có nghĩa được sử dụng.
    - `"morePrecision"`
      - : Kết quả từ thuộc tính mang lại độ chính xác cao hơn được sử dụng.
    - `"lessPrecision"`
      - : Kết quả từ thuộc tính mang lại độ chính xác thấp hơn được sử dụng.

  Giá trị `"auto"` được chuẩn hóa thành `"morePrecision"` nếu `notation` là `"compact"` và không có tùy chọn "FractionDigits"/"SignificantDigits" nào được đặt.

  Lưu ý rằng đối với các giá trị khác `auto`, kết quả có độ chính xác cao hơn được tính từ [`maximumSignificantDigits`](#minimumsignificantdigits) và [`maximumFractionDigits`](#maximumfractiondigits) (cài đặt chữ số thập phân và chữ số có nghĩa tối thiểu bị bỏ qua).

- `roundingIncrement`
  - : Chỉ ra bước tăng mà tại đó làm tròn nên xảy ra so với độ lớn làm tròn được tính toán. Các giá trị có thể là `1`, `2`, `5`, `10`, `20`, `25`, `50`, `100`, `200`, `250`, `500`, `1000`, `2000`, `2500` và `5000`; mặc định là `1`. Không thể kết hợp với làm tròn chữ số có nghĩa hoặc bất kỳ cài đặt nào của `roundingPriority` khác `auto`.

- `roundingMode`
  - : Cách làm tròn số thập phân. Các giá trị có thể là:
    - `"ceil"`
      - : Làm tròn về phía +∞. Các giá trị dương làm tròn lên. Các giá trị âm làm tròn "dương hơn".
    - `"floor"`
      - : Làm tròn về phía -∞. Các giá trị dương làm tròn xuống. Các giá trị âm làm tròn "âm hơn".
    - `"expand"`
      - : Làm tròn ra xa 0. _Độ lớn_ của giá trị luôn tăng lên khi làm tròn. Các giá trị dương làm tròn lên. Các giá trị âm làm tròn "âm hơn".
    - `"trunc"`
      - : Làm tròn về phía 0. _Độ lớn_ của giá trị luôn giảm khi làm tròn. Các giá trị dương làm tròn xuống. Các giá trị âm làm tròn "ít âm hơn".
    - `"halfCeil"`
      - : Khi nằm đúng giữa, làm tròn về phía +∞. Các giá trị trên nửa bước tăng làm tròn như `"ceil"` (về phía +∞), và dưới như `"floor"` (về phía -∞). Khi nằm đúng giữa, làm tròn như `"ceil"`.
    - `"halfFloor"`
      - : Khi nằm đúng giữa, làm tròn về phía -∞. Các giá trị trên nửa bước tăng làm tròn như `"ceil"` (về phía +∞), và dưới như `"floor"` (về phía -∞). Khi nằm đúng giữa, làm tròn như `"floor"`.
    - `"halfExpand"` (mặc định)
      - : Khi nằm đúng giữa, làm tròn ra xa 0. Các giá trị trên nửa bước tăng làm tròn như `"expand"` (ra xa 0), và dưới như `"trunc"` (về phía 0). Khi nằm đúng giữa, làm tròn như `"expand"`.
    - `"halfTrunc"`
      - : Khi nằm đúng giữa, làm tròn về phía 0. Các giá trị trên nửa bước tăng làm tròn như `"expand"` (ra xa 0), và dưới như `"trunc"` (về phía 0). Khi nằm đúng giữa, làm tròn như `"trunc"`.
    - `"halfEven"`
      - : Khi nằm đúng giữa, làm tròn về phía số nguyên chẵn gần nhất. Các giá trị trên nửa bước tăng làm tròn như `"expand"` (ra xa 0), và dưới như `"trunc"` (về phía 0). Khi nằm đúng giữa, làm tròn về phía chữ số chẵn gần nhất.

  Các tùy chọn này phản ánh [hướng dẫn người dùng ICU](https://unicode-org.github.io/icu/userguide/format_parse/numbers/rounding-modes.html), trong đó "expand" và "trunc" tương ứng với "UP" và "DOWN" của ICU. Ví dụ về [chế độ làm tròn](#rounding_modes) bên dưới minh họa cách mỗi chế độ hoạt động.

- `trailingZeroDisplay`
  - : Chiến lược hiển thị số không theo sau trên số nguyên. Các giá trị có thể là:
    - `"auto"` (mặc định)
      - : Giữ số không theo sau theo `minimumFractionDigits` và `minimumSignificantDigits`.
    - `"stripIfInteger"`
      - : Xóa các chữ số thập phân _nếu_ tất cả chúng đều là số không. Đây giống với `"auto"` nếu bất kỳ chữ số thập phân nào khác không.

##### Giá trị mặc định của SignificantDigits/FractionDigits

Đối với bốn tùy chọn trên (các tùy chọn `FractionDigits` và `SignificantDigits`), chúng tôi đã đề cập đến các giá trị mặc định của chúng; tuy nhiên, các giá trị mặc định này _không được áp dụng vô điều kiện_. Chúng chỉ được áp dụng khi thuộc tính thực sự sẽ được sử dụng, điều này phụ thuộc vào cài đặt [`roundingPriority`](#roundingpriority) và [`notation`](#notation). Cụ thể:

- Nếu `roundingPriority` không phải `"auto"`, thì cả bốn tùy chọn đều được áp dụng.
- Nếu `roundingPriority` là `"auto"` và ít nhất một tùy chọn `SignificantDigits` được đặt, thì các tùy chọn `SignificantDigits` được áp dụng và các tùy chọn `FractionDigits` bị bỏ qua.
- Nếu `roundingPriority` là `"auto"`, và hoặc ít nhất một tùy chọn `FractionDigits` được đặt hoặc `notation` không phải `"compact"`, thì các tùy chọn `FractionDigits` được áp dụng và các tùy chọn `SignificantDigits` bị bỏ qua.
- Nếu `roundingPriority` là `"auto"`, `notation` là `"compact"`, và không có tùy chọn nào trong bốn tùy chọn được đặt, thì chúng được đặt thành `{ minimumFractionDigits: 0, maximumFractionDigits: 0, minimumSignificantDigits: 1, maximumSignificantDigits: 2 }`, bất kể các giá trị mặc định đã đề cập ở trên, và `roundingPriority` được đặt thành `"morePrecision"`.

#### Các tùy chọn khác

- `notation`
  - : Định dạng nên được hiển thị cho số. Các giá trị có thể là:
    - `"standard"` (mặc định)
      - : Định dạng số thông thường.
    - `"scientific"`
      - : Trả về bậc độ lớn cho số được định dạng.
    - `"engineering"`
      - : Trả về số mũ của mười khi chia hết cho ba.
    - `"compact"`
      - : Chuỗi đại diện cho số mũ; mặc định sử dụng dạng "short".
- `compactDisplay`
  - : Chỉ được dùng khi `notation` là `"compact"`. Các giá trị có thể là `"short"` và `"long"`; mặc định là `"short"`.
- `useGrouping`
  - : Có sử dụng dấu phân cách nhóm hay không, chẳng hạn như dấu phân cách hàng nghìn hoặc dấu phân cách nghìn/lakh/crore.
    - `"always"`
      - : Hiển thị dấu phân cách nhóm ngay cả khi locale ưa thích cách khác.
    - `"auto"`
      - : Hiển thị dấu phân cách nhóm dựa trên sở thích locale, có thể phụ thuộc vào tiền tệ.
    - `"min2"`
      - : Hiển thị dấu phân cách nhóm khi có ít nhất 2 chữ số trong một nhóm.
    - `true`
      - : Giống như `"always"`.
    - `false`
      - : Không hiển thị dấu phân cách nhóm.

  Mặc định là `"min2"` nếu `notation` là `"compact"`, và `"auto"` trong các trường hợp khác. Các giá trị chuỗi `"true"` và `"false"` được chấp nhận nhưng luôn được chuyển thành giá trị mặc định.

- `signDisplay`
  - : Khi nào hiển thị dấu cho số. Các giá trị có thể là:
    - `"auto"` (mặc định)
      - : Hiển thị dấu chỉ cho số âm, bao gồm số không âm.
    - `"always"`
      - : Luôn hiển thị dấu.
    - `"exceptZero"`
      - : Hiển thị dấu cho số dương và âm, nhưng không cho số không.
    - `"negative"`
      - : Hiển thị dấu chỉ cho số âm, không bao gồm số không âm.
    - `"never"`
      - : Không bao giờ hiển thị dấu.

### Giá trị trả về

Một đối tượng `Intl.NumberFormat` mới.

> [!NOTE]
> Văn bản dưới đây mô tả hành vi được đặc tả đánh dấu là "tùy chọn". Nó có thể không hoạt động trong tất cả các môi trường. Kiểm tra [bảng tương thích trình duyệt](#browser_compatibility).

Thông thường, `Intl.NumberFormat()` có thể được gọi có hoặc không có [`new`](/en-US/docs/Web/JavaScript/Reference/Operators/new), và một instance `Intl.NumberFormat` mới được trả về trong cả hai trường hợp. Tuy nhiên, nếu giá trị [`this`](/en-US/docs/Web/JavaScript/Reference/Operators/this) là một đối tượng là [`instanceof`](/en-US/docs/Web/JavaScript/Reference/Operators/instanceof) `Intl.NumberFormat` (không nhất thiết có nghĩa là nó được tạo qua `new Intl.NumberFormat`; chỉ cần có `Intl.NumberFormat.prototype` trong chuỗi prototype của nó), thì giá trị của `this` được trả về thay thế, với đối tượng `Intl.NumberFormat` mới tạo ra được ẩn trong thuộc tính `[Symbol(IntlLegacyConstructedSymbol)]` (một symbol duy nhất được tái sử dụng giữa các instance).

```js
const formatter = Intl.NumberFormat.call(
  { __proto__: Intl.NumberFormat.prototype },
  "en-US",
  { notation: "scientific" },
);
console.log(Object.getOwnPropertyDescriptors(formatter));
// {
//   [Symbol(IntlLegacyConstructedSymbol)]: {
//     value: NumberFormat [Intl.NumberFormat] {},
//     writable: false,
//     enumerable: false,
//     configurable: false
//   }
// }
```

Lưu ý rằng chỉ có một instance `Intl.NumberFormat` thực sự ở đây: cái ẩn trong `[Symbol(IntlLegacyConstructedSymbol)]`. Gọi các phương thức [`format()`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Intl/NumberFormat/format) và [`resolvedOptions()`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Intl/NumberFormat/resolvedOptions) trên `formatter` sẽ sử dụng đúng các tùy chọn được lưu trong instance đó, nhưng gọi tất cả các phương thức khác (ví dụ: [`formatRange()`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Intl/NumberFormat/formatRange)) sẽ thất bại với "TypeError: formatRange method called on incompatible Object", vì những phương thức đó không tham khảo các tùy chọn của instance ẩn.

Hành vi này, được gọi là `ChainNumberFormat`, không xảy ra khi `Intl.NumberFormat()` được gọi mà không có `new` nhưng với `this` được đặt thành bất cứ điều gì khác không phải là `instanceof Intl.NumberFormat`. Nếu bạn gọi nó trực tiếp như `Intl.NumberFormat()`, giá trị `this` là [`Intl`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Intl), và một instance `Intl.NumberFormat` mới được tạo bình thường.

### Ngoại lệ

- {{jsxref("RangeError")}}
  - : Được ném ra trong một trong các trường hợp sau:
    - Thuộc tính nhận giá trị liệt kê (chẳng hạn như `style`, `units`, `currency`, v.v.) được đặt thành giá trị không hợp lệ.
    - Cả `maximumFractionDigits` và `minimumFractionDigits` đều được đặt, và chúng được đặt thành các giá trị khác nhau. Lưu ý rằng tùy thuộc vào các tùy chọn định dạng khác nhau, các thuộc tính này có thể có giá trị mặc định. Do đó, có thể gặp lỗi này ngay cả khi bạn chỉ đặt một trong các thuộc tính.
- {{jsxref("TypeError")}}
  - : Được ném ra nếu thuộc tính `options.style` được đặt thành "unit" hoặc "currency", và không có giá trị nào được đặt cho thuộc tính tương ứng `options.unit` hoặc `options.currency`.

## Ví dụ

### Sử dụng cơ bản

Khi dùng mà không chỉ định locale, trả về chuỗi được định dạng theo locale mặc định và tùy chọn mặc định.

```js
const amount = 3500;

console.log(new Intl.NumberFormat().format(amount));
// '3,500' if in US English locale
```

### Định dạng số thập phân và phần trăm

```js
const amount = 3500;

new Intl.NumberFormat("en-US", {
  style: "decimal",
}).format(amount); // '3,500'
new Intl.NumberFormat("en-US", {
  style: "percent",
}).format(amount); // '350,000%'
```

### Định dạng đơn vị

Nếu `style` là `'unit'`, phải cung cấp thuộc tính `unit`. Tùy chọn, `unitDisplay` kiểm soát định dạng đơn vị.

```js
const amount = 3500;

new Intl.NumberFormat("en-US", {
  style: "unit",
  unit: "liter",
}).format(amount); // '3,500 L'

new Intl.NumberFormat("en-US", {
  style: "unit",
  unit: "liter",
  unitDisplay: "long",
}).format(amount); // '3,500 liters'
```

### Định dạng tiền tệ

Nếu `style` là `'currency'`, phải cung cấp thuộc tính `currency`. Tùy chọn, `currencyDisplay` và `currencySign` kiểm soát định dạng đơn vị.

```js
const amount = -3500;
new Intl.NumberFormat("en-US", {
  style: "currency",
  currency: "USD",
}).format(amount); // '-$3,500.00'

new Intl.NumberFormat("bn", {
  style: "currency",
  currency: "USD",
  currencyDisplay: "name",
}).format(amount); // '-3,500.00 US dollars'

new Intl.NumberFormat("bn", {
  style: "currency",
  currency: "USD",
  currencySign: "accounting",
}).format(amount); // '($3,500.00)'
```

### Ký hiệu khoa học, kỹ thuật hoặc compact

Ký hiệu khoa học và compact được đại diện bởi tùy chọn `notation` và có thể được định dạng như sau:

```js
new Intl.NumberFormat("en-US", {
  notation: "scientific",
}).format(987654321);
// 9.877E8

new Intl.NumberFormat("pt-PT", {
  notation: "scientific",
}).format(987654321);
// 9,877E8

new Intl.NumberFormat("en-GB", {
  notation: "engineering",
}).format(987654321);
// 987.654E6

new Intl.NumberFormat("de", {
  notation: "engineering",
}).format(987654321);
// 987,654E6

new Intl.NumberFormat("zh-CN", {
  notation: "compact",
}).format(987654321);
// 9.9亿

new Intl.NumberFormat("fr", {
  notation: "compact",
  compactDisplay: "long",
}).format(987654321);
// 988 millions

new Intl.NumberFormat("en-GB", {
  notation: "compact",
  compactDisplay: "short",
}).format(987654321);
// 988M
```

### Hiển thị dấu

Hiển thị dấu cho số dương và âm, nhưng không cho số không:

```js
new Intl.NumberFormat("en-US", {
  style: "percent",
  signDisplay: "exceptZero",
}).format(0.55);
// '+55%'
```

Lưu ý rằng khi dấu tiền tệ là "accounting", dấu ngoặc đơn có thể được dùng thay vì dấu trừ:

```js
new Intl.NumberFormat("bn", {
  style: "currency",
  currency: "USD",
  currencySign: "accounting",
  signDisplay: "always",
}).format(-3500);
// '($3,500.00)'
```

### FractionDigits, SignificantDigits và IntegerDigits

Bạn có thể chỉ định số tối thiểu hoặc tối đa của các chữ số thập phân, nguyên hoặc có nghĩa để hiển thị khi định dạng số.

> [!NOTE]
> Nếu cả giới hạn chữ số có nghĩa và thập phân đều được chỉ định, thì định dạng thực tế phụ thuộc vào [`roundingPriority`](#roundingpriority).

#### Sử dụng FractionDigits và IntegerDigits

Thuộc tính chữ số nguyên và thập phân chỉ ra số chữ số cần hiển thị trước và sau dấu thập phân, tương ứng. Nếu giá trị cần hiển thị có ít chữ số nguyên hơn số được chỉ định, nó sẽ được đệm bằng số không ở bên trái đến số mong đợi. Nếu nó có ít chữ số thập phân hơn, nó sẽ được đệm bằng số không ở bên phải. Cả hai trường hợp được hiển thị bên dưới:

```js
// Formatting adds zeros to display minimum integers and fractions
console.log(
  new Intl.NumberFormat("en", {
    minimumIntegerDigits: 3,
    minimumFractionDigits: 4,
  }).format(4.33),
);
// "004.3300"
```

Nếu giá trị có nhiều chữ số thập phân hơn số tối đa được chỉ định, nó sẽ được làm tròn. _Cách_ nó được làm tròn phụ thuộc vào thuộc tính [`roundingMode`](#roundingmode) (nhiều chi tiết hơn được cung cấp trong phần [chế độ làm tròn](#rounding_modes)). Dưới đây, giá trị được làm tròn từ năm chữ số thập phân (`4.33145`) xuống còn hai (`4.33`):

```js
// Display value shortened to maximum number of digits
console.log(
  new Intl.NumberFormat("en", {
    maximumFractionDigits: 2,
  }).format(4.33145),
);
// "4.33"
```

Các chữ số thập phân tối thiểu không có tác dụng nếu giá trị đã có nhiều hơn 2 chữ số thập phân:

```js
// Minimum fractions have no effect if value is higher precision.
console.log(
  new Intl.NumberFormat("en", {
    minimumFractionDigits: 2,
  }).format(4.33145),
);
// "4.331"
```

> [!WARNING]
> Chú ý đến các giá trị mặc định vì chúng có thể ảnh hưởng đến định dạng ngay cả khi không được chỉ định trong mã của bạn. Giá trị chữ số tối đa mặc định là `3` cho các giá trị thông thường, `2` cho tiền tệ, và có thể có giá trị khác cho các loại định sẵn khác.

Giá trị được định dạng ở trên được làm tròn thành 3 chữ số, mặc dù chúng tôi không chỉ định số chữ số tối đa! Điều này là vì giá trị mặc định của `maximumFractionDigits` được đặt khi chúng tôi chỉ định `minimumFractionDigits`, và ngược lại. Giá trị mặc định của `maximumFractionDigits` và `minimumFractionDigits` lần lượt là `3` và `0`.

Bạn có thể sử dụng [`resolvedOptions()`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Intl/NumberFormat/resolvedOptions) để kiểm tra bộ định dạng.

```js
console.log(
  new Intl.NumberFormat("en", {
    maximumFractionDigits: 2,
  }).resolvedOptions(),
);
// {
//   …
//   minimumIntegerDigits: 1,
//   minimumFractionDigits: 0,
//   maximumFractionDigits: 2,
//   …
// }

console.log(
  new Intl.NumberFormat("en", {
    minimumFractionDigits: 2,
  }).resolvedOptions(),
);
// {
//   …
//   minimumIntegerDigits: 1,
//   minimumFractionDigits: 2,
//   maximumFractionDigits: 3,
//   …
// }
```

#### Sử dụng SignificantDigits

Số _chữ số có nghĩa_ là tổng số chữ số bao gồm cả phần nguyên và thập phân. `maximumSignificantDigits` được dùng để chỉ ra tổng số chữ số từ giá trị gốc cần hiển thị.

Các ví dụ dưới đây minh họa cách thức hoạt động này. Đặc biệt lưu ý trường hợp cuối cùng: chỉ giữ lại chữ số đầu tiên và các chữ số khác bị loại bỏ/đặt thành không.

```js
// Display 5 significant digits
console.log(
  new Intl.NumberFormat("en", {
    maximumSignificantDigits: 5,
  }).format(54.33145),
);
// "54.331"

// Max 2 significant digits
console.log(
  new Intl.NumberFormat("en", {
    maximumSignificantDigits: 2,
  }).format(54.33145),
);
// "54"

// Max 1 significant digits
console.log(
  new Intl.NumberFormat("en", {
    maximumSignificantDigits: 1,
  }).format(54.33145),
);
// "50"
```

`minimumSignificantDigits` đảm bảo rằng ít nhất số chữ số được chỉ định được hiển thị, thêm số không vào cuối giá trị nếu cần.

```js
// Minimum 10 significant digits
console.log(
  new Intl.NumberFormat("en", {
    minimumSignificantDigits: 10,
  }).format(54.33145),
);
// "54.33145000"
```

> [!WARNING]
> Chú ý đến các giá trị mặc định vì chúng có thể ảnh hưởng đến định dạng. Nếu chỉ một thuộc tính `SignificantDigits` được sử dụng, thì thuộc tính đối ứng của nó sẽ tự động được áp dụng với giá trị mặc định. Các giá trị mặc định tối đa và tối thiểu của chữ số có nghĩa lần lượt là 21 và 1.

#### Chỉ định cùng lúc cả chữ số có nghĩa và thập phân

Các chữ số thập phân ([`minimumFractionDigits`](#minimumfractiondigits)/[`maximumFractionDigits`](#maximumfractiondigits)) và chữ số có nghĩa ([`minimumSignificantDigits`](#minimumsignificantdigits)/[`maximumSignificantDigits`](#maximumsignificantdigits)) đều là các cách kiểm soát số chữ số thập phân và chữ số đầu cần định dạng. Nếu cả hai được sử dụng cùng lúc, chúng có thể xung đột nhau.

Các xung đột này được giải quyết bằng thuộc tính [`roundingPriority`](#roundingpriority). Theo mặc định, nó có giá trị `"auto"`, nghĩa là nếu [`minimumSignificantDigits`](#minimumsignificantdigits) hoặc [`maximumSignificantDigits`](#minimumsignificantdigits) được chỉ định, các thuộc tính chữ số thập phân và nguyên sẽ bị bỏ qua.

Ví dụ, mã dưới đây định dạng giá trị `4.33145` với `maximumFractionDigits: 3`, rồi `maximumSignificantDigits: 2`, rồi cả hai. Giá trị với cả hai là giá trị được đặt với `maximumSignificantDigits`.

```js
console.log(
  new Intl.NumberFormat("en", {
    maximumFractionDigits: 3,
  }).format(4.33145),
);
// "4.331"
console.log(
  new Intl.NumberFormat("en", {
    maximumSignificantDigits: 2,
  }).format(4.33145),
);
// "4.3"
console.log(
  new Intl.NumberFormat("en", {
    maximumFractionDigits: 3,
    maximumSignificantDigits: 2,
  }).format(4.33145),
);
// "4.3"
```

Sử dụng [`resolvedOptions()`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Intl/NumberFormat/resolvedOptions) để kiểm tra bộ định dạng, chúng ta có thể thấy rằng đối tượng trả về không bao gồm `maximumFractionDigits` khi `maximumSignificantDigits` hoặc `minimumSignificantDigits` được chỉ định.

```js
console.log(
  new Intl.NumberFormat("en", {
    maximumFractionDigits: 3,
    maximumSignificantDigits: 2,
  }).resolvedOptions(),
);
// {
//   …
//   minimumIntegerDigits: 1,
//   minimumSignificantDigits: 1,
//   maximumSignificantDigits: 2,
//   …
// }
console.log(
  new Intl.NumberFormat("en", {
    maximumFractionDigits: 3,
    minimumSignificantDigits: 2,
  }).resolvedOptions(),
);
// {
//   …
//   minimumIntegerDigits: 1,
//   minimumSignificantDigits: 2,
//   maximumSignificantDigits: 21,
//   …
// }
```

Ngoài `"auto"`, bạn có thể giải quyết xung đột bằng cách chỉ định [`roundingPriority`](#roundingpriority) là `"morePrecision"` hoặc `"lessPrecision"`. Bộ định dạng tính toán độ chính xác bằng cách sử dụng các giá trị của `maximumSignificantDigits` và `maximumFractionDigits`.

Mã dưới đây hiển thị định dạng được chọn cho ba mức độ ưu tiên làm tròn khác nhau:

```js
const maxFracNF = new Intl.NumberFormat("en", {
  maximumFractionDigits: 3,
});
console.log(`maximumFractionDigits:3 - ${maxFracNF.format(1.23456)}`);
// "maximumFractionDigits:2 - 1.235"

const maxSigNS = new Intl.NumberFormat("en", {
  maximumSignificantDigits: 3,
});
console.log(`maximumSignificantDigits:3 - ${maxSigNS.format(1.23456)}`);
// "maximumSignificantDigits:3 - 1.23"

const bothAuto = new Intl.NumberFormat("en", {
  maximumSignificantDigits: 3,
  maximumFractionDigits: 3,
});
console.log(`auto - ${bothAuto.format(1.23456)}`);
// "auto - 1.23"

const bothLess = new Intl.NumberFormat("en", {
  roundingPriority: "lessPrecision",
  maximumSignificantDigits: 3,
  maximumFractionDigits: 3,
});
console.log(`lessPrecision - ${bothLess.format(1.23456)}`);
// "lessPrecision - 1.23"

const bothMore = new Intl.NumberFormat("en", {
  roundingPriority: "morePrecision",
  maximumSignificantDigits: 3,
  maximumFractionDigits: 3,
});
console.log(`morePrecision - ${bothMore.format(1.23456)}`);
// "morePrecision - 1.235"
```

Lưu ý rằng thuật toán có thể hoạt động theo cách không trực quan nếu giá trị tối thiểu được chỉ định mà không có giá trị tối đa. Ví dụ dưới đây định dạng giá trị `1` với `minimumFractionDigits: 2` (định dạng thành `1.00`) và `minimumSignificantDigits: 2` (định dạng thành `1.0`). Vì `1.00` có nhiều chữ số hơn `1.0`, đây lẽ ra phải là kết quả khi ưu tiên `morePrecision`, nhưng thực tế thì ngược lại:

```js
const bothLess = new Intl.NumberFormat("en", {
  roundingPriority: "lessPrecision",
  minimumFractionDigits: 2,
  minimumSignificantDigits: 2,
});
console.log(`lessPrecision - ${bothLess.format(1)}`);
// "lessPrecision - 1.00"

const bothMore = new Intl.NumberFormat("en", {
  roundingPriority: "morePrecision",
  minimumFractionDigits: 2,
  minimumSignificantDigits: 2,
});
console.log(`morePrecision - ${bothMore.format(1)}`);
// "morePrecision - 1.0"
```

Lý do cho điều này là chỉ các giá trị "độ chính xác tối đa" được sử dụng cho tính toán, và giá trị mặc định của `maximumSignificantDigits` cao hơn nhiều so với `maximumFractionDigits`.

> [!NOTE]
> Nhóm làm việc đã đề xuất sửa đổi thuật toán trong đó bộ định dạng nên đánh giá kết quả của việc sử dụng các chữ số thập phân và có nghĩa được chỉ định một cách độc lập (tính đến cả giá trị tối thiểu và tối đa). Sau đó, nó sẽ chọn tùy chọn hiển thị nhiều chữ số thập phân hơn nếu `morePrecision` được đặt, và ít hơn nếu `lessPrecision` được đặt. Điều này sẽ dẫn đến hành vi trực quan hơn cho trường hợp này.

### Chế độ làm tròn

Nếu một giá trị có nhiều chữ số thập phân hơn được phép bởi các tùy chọn hàm khởi tạo, giá trị được định dạng sẽ được _làm tròn_ đến số chữ số thập phân được chỉ định. _Cách thức_ làm tròn giá trị phụ thuộc vào thuộc tính [`roundingMode`](#roundingmode).

Bộ định dạng số sử dụng làm tròn `halfExpand` theo mặc định, làm tròn các giá trị "ra xa 0" ở nửa bước tăng (nói cách khác, _độ lớn_ của giá trị được làm tròn lên).

Đối với số dương, nếu các chữ số thập phân cần xóa gần hơn với bước tăng tiếp theo (hoặc ở điểm giữa) thì các chữ số thập phân còn lại sẽ được làm tròn lên, ngược lại chúng được làm tròn xuống. Điều này được hiển thị bên dưới: 2.23 làm tròn đến hai chữ số có nghĩa bị cắt thành 2.2 vì 2.23 nhỏ hơn nửa bước tăng 2.25, trong khi các giá trị từ 2.25 trở lên được làm tròn lên thành 2.3:

```js
// Value below half-increment: round down.
console.log(
  new Intl.NumberFormat("en", {
    maximumSignificantDigits: 2,
  }).format(2.23),
);
// "2.2"

// Value on or above half-increment: round up.
console.log(
  new Intl.NumberFormat("en", {
    maximumSignificantDigits: 2,
  }).format(2.25),
);
console.log(
  new Intl.NumberFormat("en", {
    maximumSignificantDigits: 2,
  }).format(2.28),
);
// "2.3"
// "2.3"
```

Số âm tại hoặc dưới điểm nửa bước tăng cũng được làm tròn ra xa 0 (trở nên âm hơn):

```js
// Value below half-increment: round down.
console.log(
  new Intl.NumberFormat("en", {
    maximumSignificantDigits: 2,
  }).format(-2.23),
);
// "-2.2"

// Value on or above half-increment: round up.
console.log(
  new Intl.NumberFormat("en", {
    maximumSignificantDigits: 2,
  }).format(-2.25),
);
console.log(
  new Intl.NumberFormat("en", {
    maximumSignificantDigits: 2,
  }).format(-2.28),
);
// "-2.3"
// "-2.3"
```

Bảng dưới đây cho thấy tác động của các chế độ làm tròn khác nhau đối với các giá trị dương và âm tại và xung quanh nửa bước tăng.

| chế độ làm tròn | 2.23 | 2.25 | 2.28 | -2.23 | -2.25 | -2.28 |
| --------------- | ---- | ---- | ---- | ----- | ----- | ----- |
| `ceil`          | 2.3  | 2.3  | 2.3  | -2.2  | -2.2  | -2.2  |
| `floor`         | 2.2  | 2.2  | 2.2  | -2.3  | -2.3  | -2.3  |
| `expand`        | 2.3  | 2.3  | 2.3  | -2.3  | -2.3  | -2.3  |
| `trunc`         | 2.2  | 2.2  | 2.2  | -2.2  | -2.2  | -2.2  |
| `halfCeil`      | 2.2  | 2.3  | 2.3  | -2.2  | -2.2  | -2.3  |
| `halfFloor`     | 2.2  | 2.2  | 2.3  | -2.2  | -2.3  | -2.3  |
| `halfExpand`    | 2.2  | 2.3  | 2.3  | -2.2  | -2.3  | -2.3  |
| `halfTrunc`     | 2.2  | 2.2  | 2.3  | -2.2  | -2.2  | -2.3  |
| `halfEven`      | 2.2  | 2.2  | 2.3  | -2.2  | -2.2  | -2.3  |

Khi sử dụng `halfEven`, hành vi của nó cũng phụ thuộc vào tính chẵn lẻ (số lẻ hay chẵn) của chữ số cuối cùng của số được làm tròn. Ví dụ, hành vi của `halfEven` trong bảng trên giống với `halfTrunc`, vì độ lớn của tất cả các số nằm giữa số "chẵn" nhỏ hơn (2.2) và số "lẻ" lớn hơn (2.3). Nếu các số nằm giữa ±2.3 và ±2.4, `halfEven` sẽ hoạt động như `halfExpand` thay thế. Hành vi này tránh việc liên tục ước lượng thấp hoặc cao các nửa bước tăng trong một mẫu dữ liệu lớn.

### Sử dụng roundingIncrement

Đôi khi chúng ta muốn làm tròn các chữ số thập phân còn lại theo một bước tăng khác so với số nguyên tiếp theo. Ví dụ, các loại tiền tệ có đồng tiền nhỏ nhất là 5 xu có thể muốn làm tròn giá trị theo bước 5, phản ánh các khoản tiền thực sự có thể thanh toán bằng tiền mặt. Loại làm tròn này có thể đạt được với thuộc tính [`roundingIncrement`](#roundingincrement).

Ví dụ, nếu `maximumFractionDigits` là 2 và `roundingIncrement` là 5, thì số được làm tròn đến bội số gần nhất của 0.05:

```js
const nf = new Intl.NumberFormat("en-US", {
  style: "currency",
  currency: "USD",
  maximumFractionDigits: 2,
  roundingIncrement: 5,
});

console.log(nf.format(11.29)); // "$11.30"
console.log(nf.format(11.25)); // "$11.25"
console.log(nf.format(11.22)); // "$11.20"
```

Mẫu này được gọi là "làm tròn nickel", trong đó nickel là tên thông dụng cho đồng tiền 5 xu của Mỹ. Để làm tròn đến 10 xu gần nhất ("làm tròn dime"), bạn có thể thay đổi `roundingIncrement` thành `10`.

```js
const nf = new Intl.NumberFormat("en-US", {
  style: "currency",
  currency: "USD",
  maximumFractionDigits: 2,
  roundingIncrement: 10,
});

console.log(nf.format(11.29)); // "$11.30"
console.log(nf.format(11.25)); // "$11.30"
console.log(nf.format(11.22)); // "$11.20"
```

Bạn cũng có thể sử dụng [`roundingMode`](#roundingmode) để thay đổi thuật toán làm tròn. Ví dụ dưới đây cho thấy cách làm tròn `halfCeil` có thể được dùng để làm tròn giá trị "ít dương hơn" khi dưới nửa bước tăng làm tròn và "dương hơn" nếu trên hoặc tại nửa bước. Chữ số tăng là "0.05" nên nửa bước là tại .025 (bên dưới, điều này được hiển thị tại 11.225).

```js
const nf = new Intl.NumberFormat("en-US", {
  style: "currency",
  currency: "USD",
  maximumFractionDigits: 2,
  roundingIncrement: 5,
  roundingMode: "halfCeil",
});

console.log(nf.format(11.21)); // "$11.20"
console.log(nf.format(11.22)); // "$11.20"
console.log(nf.format(11.224)); // "$11.20"
console.log(nf.format(11.225)); // "$11.25"
console.log(nf.format(11.23)); // "$11.25"
```

Nếu bạn cần thay đổi số chữ số, hãy nhớ rằng cả `minimumFractionDigits` và `maximumFractionDigits` phải được đặt thành cùng một giá trị, hoặc `RangeError` sẽ được ném ra.

`roundingIncrement` không thể kết hợp với làm tròn chữ số có nghĩa hoặc bất kỳ cài đặt nào của `roundingPriority` khác `auto`.

## Đặc tả kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{jsxref("Intl.NumberFormat")}}
- {{jsxref("Intl.supportedValuesOf()")}}
- {{jsxref("Intl")}}
