---
title: String
slug: Web/JavaScript/Reference/Global_Objects/String
page-type: javascript-class
browser-compat: javascript.builtins.String
sidebar: jsref
---

Đối tượng **`String`** được dùng để biểu diễn và thao tác với một chuỗi ký tự.

## Mô tả

String hữu ích để lưu trữ dữ liệu có thể biểu diễn dưới dạng văn bản. Một số thao tác phổ biến nhất trên string là kiểm tra {{jsxref("String/length", "length")}} của chúng, xây dựng và nối chuỗi bằng
[toán tử `+` và `+=`](/en-US/docs/Web/JavaScript/Guide/Expressions_and_operators#string_operators),
kiểm tra sự tồn tại hoặc vị trí của substring bằng phương thức
{{jsxref("String/indexOf", "indexOf()")}}, hoặc trích xuất substring bằng phương thức {{jsxref("String/substring", "substring()")}}.

### Tạo string

String có thể được tạo dưới dạng primitive từ string literal, hoặc dưới dạng object bằng cách sử dụng constructor
{{jsxref("String/String", "String()")}}:

```js-nolint
const string1 = "A string primitive";
const string2 = 'Also a string primitive';
const string3 = `Yet another string primitive`;
```

```js
const string4 = new String("A String object");
```

String primitive và string object có nhiều hành vi chung, nhưng cũng có những khác biệt và lưu ý quan trọng.
Xem "[String primitive và String object](#string_primitives_and_string_objects)" bên dưới.

String literal có thể được chỉ định bằng dấu nháy đơn hoặc dấu nháy kép, được xử lý giống nhau, hoặc bằng ký tự backtick <kbd>`</kbd>. Dạng cuối cùng xác định một [template literal](/en-US/docs/Web/JavaScript/Reference/Template_literals):
với dạng này, bạn có thể nội suy các biểu thức. Để biết thêm thông tin về cú pháp string literal, xem [lexical grammar](/en-US/docs/Web/JavaScript/Reference/Lexical_grammar#string_literals).

### Truy cập ký tự

Có hai cách để truy cập một ký tự riêng lẻ trong string. Cách đầu tiên là phương thức
{{jsxref("String/charAt", "charAt()")}}:

```js
"cat".charAt(1); // gives value "a"
```

Cách khác là coi string như một array-like object, trong đó các ký tự riêng lẻ tương ứng với chỉ số số:

```js
"cat"[1]; // gives value "a"
```

Khi sử dụng bracket notation để truy cập ký tự, việc cố xóa hoặc gán giá trị cho các thuộc tính này sẽ không thành công. Các thuộc tính liên quan không thể ghi lẫn không thể cấu hình. (Xem {{jsxref("Object.defineProperty()")}} để biết thêm thông tin.)

### So sánh string

Sử dụng [toán tử nhỏ hơn và lớn hơn](/en-US/docs/Web/JavaScript/Reference/Operators) để so sánh các string:

```js
const a = "a";
const b = "b";
if (a < b) {
  // true
  console.log(`${a} is less than ${b}`);
} else if (a > b) {
  console.log(`${a} is greater than ${b}`);
} else {
  console.log(`${a} and ${b} are equal.`);
}
```

Lưu ý rằng tất cả các toán tử so sánh, kể cả [`===`](/en-US/docs/Web/JavaScript/Reference/Operators/Strict_equality) và [`==`](/en-US/docs/Web/JavaScript/Reference/Operators/Equality), đều so sánh string có phân biệt chữ hoa/thường. Một cách phổ biến để so sánh string không phân biệt chữ hoa/thường là chuyển đổi cả hai về cùng kiểu chữ (hoa hoặc thường) trước khi so sánh.

```js
function areEqualCaseInsensitive(str1, str2) {
  return str1.toUpperCase() === str2.toUpperCase();
}
```

Việc chọn chuyển đổi bằng [`toUpperCase()`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/String/toUpperCase) hay [`toLowerCase()`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/String/toLowerCase) hầu như là tùy ý, và không cách nào thực sự robust khi mở rộng ra ngoài bảng chữ cái Latin. Ví dụ, chữ thường `ß` và `ss` trong tiếng Đức đều được `toUpperCase()` chuyển thành `SS`, trong khi chữ `ı` trong tiếng Thổ Nhĩ Kỳ sẽ bị báo nhầm là không bằng `I` bởi `toLowerCase()` trừ khi dùng cụ thể [`toLocaleLowerCase("tr")`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/String/toLocaleLowerCase).

```js
const areEqualInUpperCase = (str1, str2) =>
  str1.toUpperCase() === str2.toUpperCase();
const areEqualInLowerCase = (str1, str2) =>
  str1.toLowerCase() === str2.toLowerCase();

areEqualInUpperCase("ß", "ss"); // true; should be false
areEqualInLowerCase("ı", "I"); // false; should be true
```

Giải pháp nhận biết locale và robust để kiểm tra tính bằng nhau không phân biệt chữ hoa/thường là sử dụng API {{jsxref("Intl.Collator")}} hoặc phương thức [`localeCompare()`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/String/localeCompare) của string — chúng có cùng interface — với tùy chọn [`sensitivity`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Intl/Collator/Collator#sensitivity) được đặt thành `"accent"` hoặc `"base"`.

```js
const areEqual = (str1, str2, locale = "en-US") =>
  str1.localeCompare(str2, locale, { sensitivity: "accent" }) === 0;

areEqual("ß", "ss", "de"); // false
areEqual("ı", "I", "tr"); // true
```

Phương thức `localeCompare()` cho phép so sánh string theo cách tương tự như `strcmp()` — nó cho phép sắp xếp các string theo cách nhận biết locale.

### String primitive và String object

Lưu ý rằng JavaScript phân biệt giữa các `String` object và
giá trị {{Glossary("Primitive", "primitive string")}}. (Điều tương tự cũng đúng với
{{jsxref("Boolean")}} và {{jsxref("Number", "Numbers")}}.)

String literal (biểu thị bằng dấu nháy đôi hoặc đơn) và các string được trả về từ
lời gọi `String` trong ngữ cảnh không phải constructor (tức là được gọi mà không dùng
từ khóa {{jsxref("Operators/new", "new")}}) là các string primitive. Trong các ngữ cảnh mà
một phương thức cần được gọi trên một string primitive hoặc việc tra cứu thuộc tính xảy ra,
JavaScript sẽ tự động bọc string primitive lại và gọi phương thức hoặc thực hiện tra cứu
thuộc tính trên wrapper object thay thế.

```js
const strPrim = "foo"; // A literal is a string primitive
const strPrim2 = String(1); // Coerced into the string primitive "1"
const strPrim3 = String(true); // Coerced into the string primitive "true"
const strObj = new String(strPrim); // String with new returns a string wrapper object.

console.log(typeof strPrim); // "string"
console.log(typeof strPrim2); // "string"
console.log(typeof strPrim3); // "string"
console.log(typeof strObj); // "object"
```

> [!WARNING]
> Bạn hiếm khi cần sử dụng `String` như một constructor.

String primitive và các `String` object cũng cho kết quả khác nhau khi sử dụng
{{jsxref("Global_Objects/eval", "eval()")}}. Các primitive được truyền vào `eval` được
coi là mã nguồn; `String` object được coi như tất cả các object khác, bằng cách trả
về object. Ví dụ:

```js
const s1 = "2 + 2"; // creates a string primitive
const s2 = new String("2 + 2"); // creates a String object
console.log(eval(s1)); // returns the number 4
console.log(eval(s2)); // returns the string "2 + 2"
```

Vì những lý do này, code có thể bị hỏng khi gặp `String` object trong khi mong đợi một string primitive, mặc dù thông thường tác giả không cần lo lắng về sự phân biệt này.

Một `String` object luôn có thể được chuyển đổi về dạng primitive tương ứng bằng phương thức
{{jsxref("String/valueOf", "valueOf()")}}.

```js
console.log(eval(s2.valueOf())); // returns the number 4
```

### String coercion

Nhiều thao tác tích hợp sẵn mong đợi string trước tiên sẽ ép kiểu đối số của chúng sang string (đây là lý do tại sao các `String` object hoạt động tương tự như string primitive). [Thao tác](https://tc39.es/ecma262/multipage/abstract-operations.html#sec-tostring) có thể được tóm tắt như sau:

- String được trả về nguyên vẹn.
- [`undefined`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/undefined) chuyển thành `"undefined"`.
- [`null`](/en-US/docs/Web/JavaScript/Reference/Operators/null) chuyển thành `"null"`.
- `true` chuyển thành `"true"`; `false` chuyển thành `"false"`.
- Number được chuyển đổi với cùng thuật toán như [`toString(10)`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Number/toString).
- [BigInt](/en-US/docs/Web/JavaScript/Reference/Global_Objects/BigInt) được chuyển đổi với cùng thuật toán như [`toString(10)`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/BigInt/toString).
- [Symbol](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Symbol) ném ra {{jsxref("TypeError")}}.
- Object trước tiên được [chuyển đổi sang primitive](/en-US/docs/Web/JavaScript/Guide/Data_structures#primitive_coercion) bằng cách gọi các phương thức [`[Symbol.toPrimitive]()`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Symbol/toPrimitive) (với gợi ý `"string"`), `toString()`, và `valueOf()` theo thứ tự đó. Primitive kết quả sau đó được chuyển đổi sang string.

Có một số cách để đạt được hiệu ứng gần như tương tự trong JavaScript.

- [Template literal](/en-US/docs/Web/JavaScript/Reference/Template_literals): `` `${x}` `` thực hiện chính xác các bước ép kiểu string được giải thích ở trên cho biểu thức nhúng.
- Hàm [`String()`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/String/String): `String(x)` sử dụng cùng thuật toán để chuyển đổi `x`, ngoại trừ [Symbol](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Symbol) không ném ra {{jsxref("TypeError")}}, mà trả về `"Symbol(description)"`, trong đó `description` là [description](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Symbol/description) của Symbol.
- Sử dụng [toán tử `+`](/en-US/docs/Web/JavaScript/Reference/Operators/Addition): `"" + x` ép kiểu toán hạng của nó sang _primitive_ thay vì _string_, và với một số object, có hành vi hoàn toàn khác với string coercion thông thường. Xem [trang tham khảo](/en-US/docs/Web/JavaScript/Reference/Operators/Addition) để biết thêm chi tiết.

Tùy thuộc vào trường hợp sử dụng, bạn có thể muốn dùng `` `${x}` `` (để bắt chước hành vi tích hợp sẵn) hoặc `String(x)` (để xử lý symbol mà không ném lỗi), nhưng bạn không nên dùng `"" + x`.

### Ký tự UTF-16, Unicode code point và grapheme cluster

String về cơ bản được biểu diễn dưới dạng chuỗi các [UTF-16 code unit](https://en.wikipedia.org/wiki/UTF-16). Trong mã hóa UTF-16, mỗi code unit dài chính xác 16 bit. Điều này có nghĩa là có tối đa 2<sup>16</sup>, tức 65536 ký tự có thể biểu diễn dưới dạng UTF-16 code unit đơn. Bộ ký tự này được gọi là [basic multilingual plane (BMP)](<https://en.wikipedia.org/wiki/Plane_(Unicode)#Basic_Multilingual_Plane>), và bao gồm các ký tự phổ biến nhất như bảng chữ cái Latin, Hy Lạp, Cyrillic, cũng như nhiều ký tự Đông Á. Mỗi code unit có thể được viết trong string bằng `\u` theo sau bởi đúng bốn chữ số hex.

Tuy nhiên, toàn bộ bộ ký tự Unicode lớn hơn nhiều so với 65536. Các ký tự bổ sung được lưu trữ trong UTF-16 dưới dạng _surrogate pair_, là các cặp code unit 16-bit biểu diễn một ký tự đơn. Để tránh nhập nhằng, hai phần của cặp phải nằm trong khoảng từ `0xD800` đến `0xDFFF`, và các code unit này không được dùng để mã hóa các ký tự code unit đơn. (Chính xác hơn, leading surrogate, còn gọi là high-surrogate code unit, có giá trị từ `0xD800` đến `0xDBFF` bao gồm, trong khi trailing surrogate, còn gọi là low-surrogate code unit, có giá trị từ `0xDC00` đến `0xDFFF` bao gồm.) Mỗi ký tự Unicode, bao gồm một hoặc hai UTF-16 code unit, còn được gọi là _Unicode code point_. Mỗi Unicode code point có thể được viết trong string bằng `\u{xxxxxx}` trong đó `xxxxxx` đại diện cho 1–6 chữ số hex.

"Lone surrogate" là một code unit 16-bit thỏa mãn một trong các mô tả sau:

- Nằm trong khoảng `0xD800`–`0xDBFF` bao gồm (tức là là leading surrogate), nhưng là code unit cuối cùng trong string, hoặc code unit tiếp theo không phải trailing surrogate.
- Nằm trong khoảng `0xDC00`–`0xDFFF` bao gồm (tức là là trailing surrogate), nhưng là code unit đầu tiên trong string, hoặc code unit trước đó không phải leading surrogate.

Lone surrogate không biểu diễn bất kỳ ký tự Unicode nào. Mặc dù hầu hết các phương thức tích hợp của JavaScript xử lý chúng đúng cách vì chúng đều hoạt động dựa trên UTF-16 code unit, lone surrogate thường không phải là giá trị hợp lệ khi tương tác với các hệ thống khác — ví dụ, [`encodeURI()`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/encodeURI) sẽ ném ra {{jsxref("URIError")}} cho lone surrogate, vì URI encoding sử dụng mã hóa UTF-8, vốn không có mã hóa nào cho lone surrogate. Các string không chứa lone surrogate nào được gọi là string _well-formed_, và an toàn khi sử dụng với các hàm không xử lý UTF-16 (chẳng hạn như `encodeURI()` hoặc {{domxref("TextEncoder")}}). Bạn có thể kiểm tra xem một string có well-formed không bằng phương thức {{jsxref("String/isWellFormed", "isWellFormed()")}}, hoặc làm sạch lone surrogate bằng phương thức {{jsxref("String/toWellFormed", "toWellFormed()")}}.

Ngoài các ký tự Unicode, có một số chuỗi ký tự Unicode nên được coi như một đơn vị hiển thị duy nhất, được gọi là _grapheme cluster_. Trường hợp phổ biến nhất là emoji: nhiều emoji có nhiều biến thể thực chất được tạo thành từ nhiều emoji, thường được nối bằng ký tự \<ZWJ> (`U+200D`).

Bạn phải cẩn thận về mức ký tự nào bạn đang duyệt. Ví dụ, [`split("")`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/String/split) sẽ tách theo UTF-16 code unit và sẽ tách các surrogate pair. String index cũng tham chiếu đến chỉ số của mỗi UTF-16 code unit. Mặt khác, [`[Symbol.iterator]()`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/String/Symbol.iterator) duyệt theo Unicode code point. Để duyệt qua grapheme cluster sẽ cần một số code tùy chỉnh.

```js
"😄".split(""); // ['\ud83d', '\ude04']; splits into two lone surrogates

// "Backhand Index Pointing Right: Dark Skin Tone"
[..."👉🏿"]; // ['👉', '🏿']
// splits into the basic "Backhand Index Pointing Right" emoji and
// the "Dark skin tone" emoji

// "Family: Man, Boy"
[..."👨‍👦"]; // [ '👨', '‍', '👦' ]
// splits into the "Man" and "Boy" emoji, joined by a ZWJ

// The United Nations flag
[..."🇺🇳"]; // [ '🇺', '🇳' ]
// splits into two "region indicator" letters "U" and "N".
// All flag emojis are formed by joining two region indicator letters
```

## Constructor

- {{jsxref("String/String", "String()")}}
  - : Tạo các `String` object. Khi được gọi như một hàm, nó trả về giá trị primitive kiểu String.

## Phương thức tĩnh

- {{jsxref("String.fromCharCode()")}}
  - : Trả về một string được tạo bằng cách sử dụng chuỗi giá trị Unicode được chỉ định.
- {{jsxref("String.fromCodePoint()")}}
  - : Trả về một string được tạo bằng cách sử dụng chuỗi code point được chỉ định.
- {{jsxref("String.raw()")}}
  - : Trả về một string được tạo từ một raw template string.

## Thuộc tính instance

Các thuộc tính này được định nghĩa trên `String.prototype` và được chia sẻ bởi tất cả các instance của `String`.

- {{jsxref("Object/constructor", "String.prototype.constructor")}}
  - : Hàm constructor đã tạo ra instance object. Đối với các instance `String`, giá trị ban đầu là constructor {{jsxref("String/String", "String")}}.

Các thuộc tính này là thuộc tính riêng của mỗi instance `String`.

- {{jsxref("String/length", "length")}}
  - : Phản ánh `length` của string. Chỉ đọc.

## Phương thức instance

- {{jsxref("String.prototype.at()")}}
  - : Trả về ký tự (chính xác một UTF-16 code unit) tại `index` được chỉ định. Chấp nhận số nguyên âm, đếm ngược từ ký tự cuối của string.
- {{jsxref("String.prototype.charAt()")}}
  - : Trả về ký tự (chính xác một UTF-16 code unit) tại `index` được chỉ định.
- {{jsxref("String.prototype.charCodeAt()")}}
  - : Trả về một số là giá trị UTF-16 code unit tại `index` đã cho.
- {{jsxref("String.prototype.codePointAt()")}}
  - : Trả về một Number nguyên không âm là giá trị code point của UTF-16 encoded code point bắt đầu tại `pos` được chỉ định.
- {{jsxref("String.prototype.concat()")}}
  - : Kết hợp văn bản của hai (hoặc nhiều hơn) string và trả về một string mới.
- {{jsxref("String.prototype.endsWith()")}}
  - : Xác định xem một string có kết thúc bằng các ký tự của string `searchString` không.
- {{jsxref("String.prototype.includes()")}}
  - : Xác định xem string đang gọi có chứa `searchString` không.
- {{jsxref("String.prototype.indexOf()")}}
  - : Trả về chỉ số trong string này của lần xuất hiện đầu tiên của `searchValue`, hoặc `-1` nếu không tìm thấy.
- {{jsxref("String.prototype.isWellFormed()")}}
  - : Trả về một boolean cho biết string này có chứa bất kỳ [lone surrogate](#utf-16_characters_unicode_code_points_and_grapheme_clusters) nào không.
- {{jsxref("String.prototype.lastIndexOf()")}}
  - : Trả về chỉ số trong string này của lần xuất hiện cuối cùng của `searchValue`, hoặc `-1` nếu không tìm thấy.
- {{jsxref("String.prototype.localeCompare()")}}
  - : Trả về một số cho biết string tham chiếu `compareString` đứng trước, sau hay tương đương với string đã cho trong thứ tự sắp xếp.
- {{jsxref("String.prototype.match()")}}
  - : Được dùng để khớp regular expression `regexp` với một string.
- {{jsxref("String.prototype.matchAll()")}}
  - : Trả về một iterator của tất cả các kết quả khớp của `regexp`.
- {{jsxref("String.prototype.normalize()")}}
  - : Trả về Unicode Normalization Form của giá trị string đang gọi.
- {{jsxref("String.prototype.padEnd()")}}
  - : Đệm string hiện tại từ cuối bằng một string cho trước và trả về một string mới có độ dài `targetLength`.
- {{jsxref("String.prototype.padStart()")}}
  - : Đệm string hiện tại từ đầu bằng một string cho trước và trả về một string mới có độ dài `targetLength`.
- {{jsxref("String.prototype.repeat()")}}
  - : Trả về một string bao gồm các phần tử của object được lặp lại `count` lần.
- {{jsxref("String.prototype.replace()")}}
  - : Được dùng để thay thế các lần xuất hiện của `searchFor` bằng `replaceWith`. `searchFor` có thể là string hoặc Regular Expression, và `replaceWith` có thể là string hoặc function.
- {{jsxref("String.prototype.replaceAll()")}}
  - : Được dùng để thay thế tất cả các lần xuất hiện của `searchFor` bằng `replaceWith`. `searchFor` có thể là string hoặc Regular Expression, và `replaceWith` có thể là string hoặc function.
- {{jsxref("String.prototype.search()")}}
  - : Tìm kiếm kết quả khớp giữa regular expression `regexp` và string đang gọi.
- {{jsxref("String.prototype.slice()")}}
  - : Trích xuất một phần của string và trả về một string mới.
- {{jsxref("String.prototype.split()")}}
  - : Trả về một mảng các string được tạo ra bằng cách tách string đang gọi tại các vị trí xuất hiện của substring `sep`.
- {{jsxref("String.prototype.startsWith()")}}
  - : Xác định xem string đang gọi có bắt đầu bằng các ký tự của string `searchString` không.
- {{jsxref("String.prototype.substr()")}} {{deprecated_inline}}
  - : Trả về một phần của string, bắt đầu từ chỉ số được chỉ định và kéo dài thêm một số ký tự nhất định.
- {{jsxref("String.prototype.substring()")}}
  - : Trả về một string mới chứa các ký tự của string đang gọi từ (hoặc giữa) chỉ số (hoặc các chỉ số) được chỉ định.
- {{jsxref("String.prototype.toLocaleLowerCase()")}}
  - : Các ký tự trong string được chuyển đổi sang chữ thường trong khi tôn trọng locale hiện tại.

    Với hầu hết các ngôn ngữ, kết quả sẽ giống như
    {{jsxref("String/toLowerCase", "toLowerCase()")}}.

- {{jsxref("String.prototype.toLocaleUpperCase()")}}
  - : Các ký tự trong string được chuyển đổi sang chữ hoa trong khi tôn trọng locale hiện tại.

    Với hầu hết các ngôn ngữ, kết quả sẽ giống như
    {{jsxref("String/toUpperCase", "toUpperCase()")}}.

- {{jsxref("String.prototype.toLowerCase()")}}
  - : Trả về giá trị string đang gọi được chuyển đổi sang chữ thường.
- {{jsxref("String.prototype.toString()")}}
  - : Trả về một string đại diện cho object được chỉ định. Ghi đè phương thức {{jsxref("Object.prototype.toString()")}}.
- {{jsxref("String.prototype.toUpperCase()")}}
  - : Trả về giá trị string đang gọi được chuyển đổi sang chữ hoa.
- {{jsxref("String.prototype.toWellFormed()")}}
  - : Trả về một string trong đó tất cả [lone surrogate](#utf-16_characters_unicode_code_points_and_grapheme_clusters) của string này được thay thế bằng ký tự thay thế Unicode U+FFFD.
- {{jsxref("String.prototype.trim()")}}
  - : Xóa khoảng trắng ở đầu và cuối string.
- {{jsxref("String.prototype.trimEnd()")}}
  - : Xóa khoảng trắng ở cuối string.
- {{jsxref("String.prototype.trimStart()")}}
  - : Xóa khoảng trắng ở đầu string.
- {{jsxref("String.prototype.valueOf()")}}
  - : Trả về giá trị primitive của object được chỉ định. Ghi đè phương thức {{jsxref("Object.prototype.valueOf()")}}.
- [`String.prototype[Symbol.iterator]()`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/String/Symbol.iterator)
  - : Trả về một iterator object mới duyệt qua các code point của giá trị String, trả về mỗi code point dưới dạng giá trị String.

### Phương thức HTML wrapper

> [!WARNING]
> Đã lỗi thời. Tránh sử dụng các phương thức này.
>
> Chúng có giá trị sử dụng hạn chế, vì chúng dựa trên một tiêu chuẩn HTML rất cũ và chỉ cung cấp một tập hợp con nhỏ của các thẻ và thuộc tính HTML hiện có. Nhiều trong số chúng tạo ra markup đã lỗi thời hoặc không chuẩn hiện nay. Ngoài ra, chúng nối string mà không có bất kỳ xác thực hay làm sạch nào, điều này khiến chúng trở thành mối đe dọa bảo mật tiềm ẩn khi được chèn trực tiếp bằng [`innerHTML`](/en-US/docs/Web/API/Element/innerHTML). Hãy sử dụng [DOM API](/en-US/docs/Web/API/Document_Object_Model) chẳng hạn như [`document.createElement()`](/en-US/docs/Web/API/Document/createElement) thay thế.

- {{jsxref("String.prototype.anchor()")}} {{deprecated_inline}}
  - : [`<a name="name">`](/en-US/docs/Web/HTML/Reference/Elements/a#name) (hypertext target)
- {{jsxref("String.prototype.big()")}} {{deprecated_inline}}
  - : {{HTMLElement("big")}}
- {{jsxref("String.prototype.blink()")}} {{deprecated_inline}}
  - : `<blink>`
- {{jsxref("String.prototype.bold()")}} {{deprecated_inline}}
  - : {{HTMLElement("b")}}
- {{jsxref("String.prototype.fixed()")}} {{deprecated_inline}}
  - : {{HTMLElement("tt")}}
- {{jsxref("String.prototype.fontcolor()")}} {{deprecated_inline}}
  - : [`<font color="color">`](/en-US/docs/Web/HTML/Reference/Elements/font#color)
- {{jsxref("String.prototype.fontsize()")}} {{deprecated_inline}}
  - : [`<font size="size">`](/en-US/docs/Web/HTML/Reference/Elements/font#size)
- {{jsxref("String.prototype.italics()")}} {{deprecated_inline}}
  - : {{HTMLElement("i")}}
- {{jsxref("String.prototype.link()")}} {{deprecated_inline}}
  - : [`<a href="url">`](/en-US/docs/Web/HTML/Reference/Elements/a#href) (link to URL)
- {{jsxref("String.prototype.small()")}} {{deprecated_inline}}
  - : {{HTMLElement("small")}}
- {{jsxref("String.prototype.strike()")}} {{deprecated_inline}}
  - : {{HTMLElement("strike")}}
- {{jsxref("String.prototype.sub()")}} {{deprecated_inline}}
  - : {{HTMLElement("sub")}}
- {{jsxref("String.prototype.sup()")}} {{deprecated_inline}}
  - : {{HTMLElement("sup")}}

Lưu ý rằng các phương thức này không kiểm tra xem string có chứa thẻ HTML hay không, vì vậy có thể tạo ra HTML không hợp lệ:

```js
"</b>".bold(); // <b></b></b>
```

Phép thoát duy nhất chúng thực hiện là thay thế `"` trong giá trị thuộc tính (đối với {{jsxref("String/anchor", "anchor()")}}, {{jsxref("String/fontcolor", "fontcolor()")}}, {{jsxref("String/fontsize", "fontsize()")}}, và {{jsxref("String/link", "link()")}}) bằng `&quot;`.

```js
"foo".anchor('"Hello"'); // <a name="&quot;Hello&quot;">foo</a>
```

## Ví dụ

### Chuyển đổi string

Hàm `String()` là cách đáng tin cậy hơn để chuyển đổi các giá trị sang string so với việc gọi phương thức `toString()` của giá trị, vì hàm trước hoạt động được khi dùng với [`null`](/en-US/docs/Web/JavaScript/Reference/Operators/null) và {{jsxref("undefined")}}. Ví dụ:

```js
// You cannot access properties on null or undefined

const nullVar = null;
nullVar.toString(); // TypeError: Cannot read properties of null
String(nullVar); // "null"

const undefinedVar = undefined;
undefinedVar.toString(); // TypeError: Cannot read properties of undefined
String(undefinedVar); // "undefined"
```

## Đặc tả

{{Specifications}}

## Khả năng tương thích với trình duyệt

{{Compat}}

## Xem thêm

- Hướng dẫn [Numbers and strings](/en-US/docs/Web/JavaScript/Guide/Numbers_and_strings)
- {{jsxref("RegExp")}}
