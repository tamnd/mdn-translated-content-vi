---
title: Intl.PluralRules
slug: Web/JavaScript/Reference/Global_Objects/Intl/PluralRules
page-type: javascript-class
browser-compat: javascript.builtins.Intl.PluralRules
sidebar: jsref
---

Đối tượng **`Intl.PluralRules`** cho phép định dạng theo số nhiều và các quy tắc ngôn ngữ liên quan đến số nhiều.

## Mô tả

Các ngôn ngữ sử dụng các mẫu khác nhau để biểu đạt số lượng các mục (số đếm) và để biểu đạt thứ tự của các mục (số thứ tự). Tiếng Anh có hai dạng để biểu đạt số đếm: một dạng cho số ít "item" (1 hour, 1 dog, 1 fish) và dạng kia cho số không hoặc bất kỳ số lượng nào khác của "items" (0 hours, 2 lemmings, 100000.5 fish), trong khi tiếng Trung chỉ có một dạng, và tiếng Ả Rập có tới sáu dạng! Tương tự, tiếng Anh có bốn dạng để biểu đạt số thứ tự: "th", "st", "nd", "rd", tạo thành chuỗi: 0th, 1st, 2nd, 3rd, 4th, 5th, ..., 21st, 22nd, 23rd, 24th, 25th, v.v., trong khi cả tiếng Trung và tiếng Ả Rập chỉ có một dạng cho số thứ tự.

Với một ngôn ngữ và tập hợp tùy chọn định dạng nhất định, các phương thức [`Intl.PluralRules.prototype.select()`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Intl/PluralRules/select) và [`Intl.PluralRules.prototype.selectRange()`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Intl/PluralRules/selectRange) trả về một _tag_ đại diện cho dạng số nhiều của một số đơn lẻ hoặc một khoảng số, dạng đếm hoặc thứ tự. Code có thể sử dụng các tag được trả về để biểu diễn số một cách phù hợp cho ngôn ngữ đã cho. Tập hợp đầy đủ các tag có thể được trả về là: `zero`, `one`, `two`, `few`, `many` và `other` (dạng số nhiều "chung", cũng được dùng nếu ngôn ngữ chỉ có một dạng).

Vì tiếng Anh chỉ có hai dạng cho số đếm, phương thức `select()` chỉ trả về hai tag: `"one"` cho trường hợp số ít, và `"other"` cho tất cả các số đếm khác. Điều này cho phép xây dựng các câu có nghĩa trong tiếng Anh cho mỗi trường hợp, chẳng hạn: "1 dog is happy; do you want to play with it?" và "10 dogs are happy; do you want to play with them?".

Việc tạo các câu phù hợp cho mỗi dạng phụ thuộc vào ngôn ngữ, và ngay cả trong tiếng Anh cũng có thể không đơn giản như chỉ thêm "s" vào danh từ để tạo dạng số nhiều. Sử dụng ví dụ trên, chúng ta thấy rằng dạng có thể ảnh hưởng đến:

- **Danh từ**: 1 dog, 2 dogs (nhưng không phải "fish" hay "sheep", vốn có cùng dạng số ít và số nhiều).
- **Động từ**: 1 dog _is_ happy, 2 dogs _are_ happy.
- **Đại từ** (và các từ tham chiếu khác): Do you want to play with _it_ / _them_.

Các ngôn ngữ khác có nhiều dạng hơn, và việc chọn câu phù hợp có thể còn phức tạp hơn.

`select()` có thể trả về bất kỳ trong bốn tag nào cho số thứ tự trong tiếng Anh, đại diện cho mỗi dạng được phép: `one` cho số "st" (1, 21, 31, ...), `two` cho số "nd" (2, 22, 32, ...), `few` cho số "rd" (3, 33, 43, ...) và `other` cho số "th" (0, 4-20, v.v.). Một lần nữa, các tag được trả về cho phép định dạng phù hợp các chuỗi mô tả số thứ tự.

Để biết thêm thông tin về các quy tắc và cách sử dụng, xem [Plural Rules](https://cldr.unicode.org/index/cldr-spec/plural-rules). Để biết danh sách các quy tắc và cách áp dụng cho các ngôn ngữ khác nhau, xem [LDML Language Plural Rules](https://www.unicode.org/cldr/charts/43/supplemental/language_plural_rules.html).

## Hàm khởi tạo

- {{jsxref("Intl/PluralRules/PluralRules", "Intl.PluralRules()")}}
  - : Tạo một đối tượng `Intl.PluralRules` mới.

## Phương thức tĩnh

- {{jsxref("Intl/PluralRules/supportedLocalesOf", "Intl.PluralRules.supportedLocalesOf()")}}
  - : Trả về một mảng chứa các locale được cung cấp mà được hỗ trợ mà không phải dùng locale mặc định của runtime.

## Thuộc tính instance

Các thuộc tính này được định nghĩa trên `Intl.PluralRules.prototype` và dùng chung cho tất cả các instance `Intl.PluralRules`.

- {{jsxref("Object/constructor", "Intl.PluralRules.prototype.constructor")}}
  - : Hàm khởi tạo đã tạo ra đối tượng instance. Với các instance `Intl.PluralRules`, giá trị khởi tạo là hàm khởi tạo {{jsxref("Intl/PluralRules/PluralRules", "Intl.PluralRules")}}.
- `Intl.PluralRules.prototype[Symbol.toStringTag]`
  - : Giá trị khởi tạo của thuộc tính [`[Symbol.toStringTag]`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Symbol/toStringTag) là chuỗi `"Intl.PluralRules"`. Thuộc tính này được dùng trong {{jsxref("Object.prototype.toString()")}}.

## Phương thức instance

- {{jsxref("Intl/PluralRules/resolvedOptions", "Intl.PluralRules.prototype.resolvedOptions()")}}
  - : Trả về một đối tượng mới với các thuộc tính phản ánh locale và tùy chọn sắp xếp được tính toán trong quá trình khởi tạo đối tượng.
- {{jsxref("Intl/PluralRules/select", "Intl.PluralRules.prototype.select()")}}
  - : Trả về chuỗi chỉ ra quy tắc số nhiều nào cần dùng cho định dạng theo locale.
- {{jsxref("Intl/PluralRules/selectRange", "Intl.PluralRules.prototype.selectRange()")}}
  - : Phương thức này nhận hai giá trị và trả về chuỗi chỉ ra quy tắc số nhiều nào cần dùng cho định dạng khoảng số theo locale.

## Ví dụ

### Sử dụng locale

Ví dụ này cho thấy một số biến thể trong các quy tắc số nhiều được bản địa hóa cho số đếm.

Để có định dạng của ngôn ngữ được dùng trong giao diện người dùng của ứng dụng, hãy đảm bảo chỉ định ngôn ngữ đó (và có thể một số ngôn ngữ dự phòng) bằng đối số [hàm khởi tạo `locales`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Intl/PluralRules/PluralRules#locales):

```js
// US English
const enCardinalRules = new Intl.PluralRules("en-US");
console.log(enCardinalRules.select(0)); // "other"
console.log(enCardinalRules.select(1)); // "one"
console.log(enCardinalRules.select(2)); // "other"
console.log(enCardinalRules.select(3)); // "other"

// Arabic
const arCardinalRules = new Intl.PluralRules("ar-EG");
console.log(arCardinalRules.select(0)); // "zero"
console.log(arCardinalRules.select(1)); // "one"
console.log(arCardinalRules.select(2)); // "two"
console.log(arCardinalRules.select(6)); // "few"
console.log(arCardinalRules.select(18)); // "many"
```

### Sử dụng tùy chọn

Dạng số nhiều của số được chỉ định cũng có thể phụ thuộc vào [hàm khởi tạo `options`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Intl/PluralRules/PluralRules#options), chẳng hạn như số được làm tròn như thế nào, và liệu đó là số đếm hay số thứ tự.

Ví dụ này cho thấy cách bạn có thể đặt loại quy tắc là "ordinal", và cách điều này ảnh hưởng đến dạng cho một số con số trong tiếng Anh Mỹ.

```js
// US English - ordinal
const enOrdinalRules = new Intl.PluralRules("en-US", { type: "ordinal" });
console.log(enOrdinalRules.select(0)); // "other" (0th)
console.log(enOrdinalRules.select(1)); // "one"   (1st)
console.log(enOrdinalRules.select(2)); // "two"   (2nd)
console.log(enOrdinalRules.select(3)); // "few"   (3rd)
console.log(enOrdinalRules.select(4)); // "other" (4th)
console.log(enOrdinalRules.select(21)); // "one"  (21st)
```

### Định dạng văn bản sử dụng tag được trả về

Đoạn mã dưới đây mở rộng ví dụ trước, cho thấy cách bạn có thể sử dụng tag được trả về cho số thứ tự để định dạng văn bản trong tiếng Anh.

```js
const enOrdinalRules = new Intl.PluralRules("en-US", { type: "ordinal" });

const suffixes = new Map([
  ["one", "st"],
  ["two", "nd"],
  ["few", "rd"],
  ["other", "th"],
]);
const formatOrdinals = (n) => {
  const rule = enOrdinalRules.select(n);
  const suffix = suffixes.get(rule);
  return `${n}${suffix}`;
};

formatOrdinals(0); // '0th'
formatOrdinals(1); // '1st'
formatOrdinals(2); // '2nd'
formatOrdinals(3); // '3rd'
formatOrdinals(4); // '4th'
formatOrdinals(11); // '11th'
formatOrdinals(21); // '21st'
formatOrdinals(42); // '42nd'
formatOrdinals(103); // '103rd'
```

## Đặc tả kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Polyfill của `Intl.PluralRules` trong FormatJS](https://formatjs.github.io/docs/polyfills/intl-pluralrules/)
- {{jsxref("Intl")}}
