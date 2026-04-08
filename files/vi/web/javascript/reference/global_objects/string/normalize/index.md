---
title: String.prototype.normalize()
short-title: normalize()
slug: Web/JavaScript/Reference/Global_Objects/String/normalize
page-type: javascript-instance-method
browser-compat: javascript.builtins.String.normalize
sidebar: jsref
---

Phương thức **`normalize()`** của các giá trị {{jsxref("String")}} trả về Dạng Chuẩn hóa Unicode của string này.

{{InteractiveExample("JavaScript Demo: String.prototype.normalize()", "taller")}}

```js interactive-example
const name1 = "\u0041\u006d\u00e9\u006c\u0069\u0065";
const name2 = "\u0041\u006d\u0065\u0301\u006c\u0069\u0065";

console.log(`${name1}, ${name2}`);
// Expected output: "Amélie, Amélie"
console.log(name1 === name2);
// Expected output: false
console.log(name1.length === name2.length);
// Expected output: false

const name1NFC = name1.normalize("NFC");
const name2NFC = name2.normalize("NFC");

console.log(`${name1NFC}, ${name2NFC}`);
// Expected output: "Amélie, Amélie"
console.log(name1NFC === name2NFC);
// Expected output: true
console.log(name1NFC.length === name2NFC.length);
// Expected output: true
```

## Cú pháp

```js-nolint
normalize()
normalize(form)
```

### Tham số

- `form` {{optional_inline}}
  - : Một trong `"NFC"`, `"NFD"`, `"NFKC"`, hoặc `"NFKD"`, chỉ định Dạng Chuẩn hóa Unicode. Nếu bỏ qua hoặc là {{jsxref("undefined")}}, `"NFC"` được sử dụng.

    Các giá trị này có ý nghĩa sau:
    - `"NFC"`
      - : Phân tách Canonical, tiếp theo là Kết hợp Canonical.
    - `"NFD"`
      - : Phân tách Canonical.
    - `"NFKC"`
      - : Phân tách Compatibility, tiếp theo là Kết hợp Canonical.
    - `"NFKD"`
      - : Phân tách Compatibility.

### Giá trị trả về

Một string chứa Dạng Chuẩn hóa Unicode của string đã cho.

### Ngoại lệ

- {{jsxref("RangeError")}}
  - : Ném ra nếu `form` không phải là một trong các giá trị được chỉ định ở trên.

## Mô tả

Unicode gán một giá trị số duy nhất, gọi là _code point_, cho mỗi ký tự. Ví dụ, code point cho `"A"` được cho là U+0041. Tuy nhiên, đôi khi nhiều hơn một code point, hoặc chuỗi code point, có thể biểu diễn cùng một ký tự trừu tượng — ký tự `"ñ"` chẳng hạn có thể được biểu diễn bởi một trong hai:

- Code point đơn U+00F1.
- Code point cho `"n"` (U+006E) theo sau bởi code point cho dấu ngã kết hợp (U+0303).

```js
const string1 = "\u00F1";
const string2 = "\u006E\u0303";

console.log(string1); // ñ
console.log(string2); // ñ
```

Tuy nhiên, vì các code point khác nhau, so sánh string sẽ không coi chúng là bằng nhau. Và vì số code point trong mỗi phiên bản khác nhau, chúng thậm chí có độ dài khác nhau.

```js
const string1 = "\u00F1"; // ñ
const string2 = "\u006E\u0303"; // ñ

console.log(string1 === string2); // false
console.log(string1.length); // 1
console.log(string2.length); // 2
```

Phương thức `normalize()` giúp giải quyết vấn đề này bằng cách chuyển đổi một string thành một dạng chuẩn hóa chung cho tất cả các chuỗi code point biểu diễn cùng ký tự. Có hai dạng chuẩn hóa chính, một dựa trên **tương đương canonical** và một dựa trên **tương đương compatibility**.

### Chuẩn hóa tương đương canonical

Trong Unicode, hai chuỗi code point có tương đương canonical nếu chúng biểu diễn cùng ký tự trừu tượng, và nên luôn có cùng hình thức trực quan và hành vi (ví dụ: chúng nên luôn được sắp xếp theo cùng một cách).

Bạn có thể sử dụng `normalize()` với đối số `"NFD"` hoặc `"NFC"` để tạo ra một dạng của string sẽ giống nhau cho tất cả các string tương đương canonical. Trong ví dụ bên dưới, chúng ta chuẩn hóa hai biểu diễn của ký tự `"ñ"`:

```js
let string1 = "\u00F1"; // ñ
let string2 = "\u006E\u0303"; // ñ

string1 = string1.normalize("NFD");
string2 = string2.normalize("NFD");

console.log(string1 === string2); // true
console.log(string1.length); // 2
console.log(string2.length); // 2
```

#### Dạng kết hợp và phân tách

Lưu ý rằng độ dài của dạng chuẩn hóa dưới `"NFD"` là `2`. Đó là vì `"NFD"` cho bạn phiên bản **phân tách** của dạng canonical, trong đó các code point đơn được phân tách thành nhiều code point kết hợp. Dạng canonical phân tách cho `"ñ"` là `"\u006E\u0303"`.

Bạn có thể chỉ định `"NFC"` để lấy dạng canonical **kết hợp**, trong đó nhiều code point được thay thế bằng các code point đơn khi có thể. Dạng canonical kết hợp cho `"ñ"` là `"\u00F1"`:

```js
let string1 = "\u00F1"; // ñ
let string2 = "\u006E\u0303"; // ñ

string1 = string1.normalize("NFC");
string2 = string2.normalize("NFC");

console.log(string1 === string2); // true
console.log(string1.length); // 1
console.log(string2.length); // 1
console.log(string2.codePointAt(0).toString(16)); // f1
```

### Chuẩn hóa compatibility

Trong Unicode, hai chuỗi code point tương thích nếu chúng biểu diễn cùng ký tự trừu tượng, và nên được xử lý như nhau trong một số — nhưng không nhất thiết tất cả — ứng dụng.

Tất cả các chuỗi tương đương canonical cũng tương thích, nhưng không phải ngược lại.

Ví dụ:

- code point U+FB00 biểu diễn [chữ ghép](/en-US/docs/Glossary/Ligature) `"ﬀ"`. Nó tương thích với hai code point U+0066 liên tiếp (`"ff"`).
- code point U+24B9 biểu diễn ký hiệu `"Ⓓ"`. Nó tương thích với code point U+0044 (`"D"`).

Trong một số khía cạnh (như sắp xếp) chúng nên được xử lý như tương đương — và trong một số khía cạnh (như hình thức trực quan) chúng không nên, vì vậy chúng không tương đương canonical.

Bạn có thể sử dụng `normalize()` với đối số `"NFKD"` hoặc `"NFKC"` để tạo ra một dạng của string sẽ giống nhau cho tất cả các string tương thích:

```js
let string1 = "\uFB00";
let string2 = "\u0066\u0066";

console.log(string1); // ﬀ
console.log(string2); // ff
console.log(string1 === string2); // false
console.log(string1.length); // 1
console.log(string2.length); // 2

string1 = string1.normalize("NFKD");
string2 = string2.normalize("NFKD");

console.log(string1); // ff <- visual appearance changed
console.log(string2); // ff
console.log(string1 === string2); // true
console.log(string1.length); // 2
console.log(string2.length); // 2
```

Khi áp dụng chuẩn hóa compatibility, điều quan trọng là cân nhắc những gì bạn dự định làm với các string, vì dạng chuẩn hóa có thể không phù hợp cho tất cả các ứng dụng. Trong ví dụ trên, chuẩn hóa phù hợp cho tìm kiếm, vì nó cho phép người dùng tìm kiếm string bằng cách tìm kiếm `"f"`. Nhưng nó có thể không phù hợp cho việc hiển thị, vì hình thức trực quan khác nhau.

Như với chuẩn hóa canonical, bạn có thể yêu cầu các dạng tương thích phân tách hoặc kết hợp bằng cách truyền `"NFKD"` hoặc `"NFKC"`, tương ứng.

## Ví dụ

### Sử dụng normalize()

```js
// Initial string

// U+1E9B: LATIN SMALL LETTER LONG S WITH DOT ABOVE
// U+0323: COMBINING DOT BELOW
const str = "\u1E9B\u0323";

// Canonically-composed form (NFC)

// U+1E9B: LATIN SMALL LETTER LONG S WITH DOT ABOVE
// U+0323: COMBINING DOT BELOW
str.normalize("NFC"); // '\u1E9B\u0323'
str.normalize(); // same as above

// Canonically-decomposed form (NFD)

// U+017F: LATIN SMALL LETTER LONG S
// U+0323: COMBINING DOT BELOW
// U+0307: COMBINING DOT ABOVE
str.normalize("NFD"); // '\u017F\u0323\u0307'

// Compatibly-composed (NFKC)

// U+1E69: LATIN SMALL LETTER S WITH DOT BELOW AND DOT ABOVE
str.normalize("NFKC"); // '\u1E69'

// Compatibly-decomposed (NFKD)

// U+0073: LATIN SMALL LETTER S
// U+0323: COMBINING DOT BELOW
// U+0307: COMBINING DOT ABOVE
str.normalize("NFKD"); // '\u0073\u0323\u0307'
```

## Đặc tả

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Unicode Standard Annex #15, Unicode Normalization Forms](https://www.unicode.org/reports/tr15/)
- [Unicode equivalence](https://en.wikipedia.org/wiki/Unicode_equivalence) on Wikipedia
