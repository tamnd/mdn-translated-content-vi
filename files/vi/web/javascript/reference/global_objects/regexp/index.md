---
title: RegExp
slug: Web/JavaScript/Reference/Global_Objects/RegExp
page-type: javascript-class
browser-compat: javascript.builtins.RegExp
sidebar: jsref
---

Đối tượng **`RegExp`** được dùng để so khớp văn bản với một mẫu (pattern).

Để có phần giới thiệu về biểu thức chính quy, hãy đọc [chương về biểu thức chính quy](/en-US/docs/Web/JavaScript/Guide/Regular_expressions) trong hướng dẫn JavaScript. Để biết thông tin chi tiết về cú pháp biểu thức chính quy, hãy đọc [tài liệu tham khảo biểu thức chính quy](/en-US/docs/Web/JavaScript/Reference/Regular_expressions).

## Mô tả

### Ký hiệu literal và constructor

Có hai cách để tạo đối tượng `RegExp`: _ký hiệu literal_ và _constructor_.

- _Ký hiệu literal_ nhận một mẫu giữa hai dấu gạch chéo, theo sau là các [flags](/en-US/docs/Web/JavaScript/Guide/Regular_expressions#advanced_searching_with_flags) tùy chọn, sau dấu gạch chéo thứ hai.
- _Hàm constructor_ nhận một chuỗi hoặc đối tượng `RegExp` làm tham số đầu tiên và một chuỗi [flags](/en-US/docs/Web/JavaScript/Guide/Regular_expressions#advanced_searching_with_flags) tùy chọn làm tham số thứ hai.

Ba biểu thức sau tạo ra cùng một đối tượng biểu thức chính quy:

```js
const re = /ab+c/i; // literal notation
// OR
const re = new RegExp("ab+c", "i"); // constructor with string pattern as first argument
// OR
const re = new RegExp(/ab+c/, "i"); // constructor with regular expression literal as first argument
```

Trước khi biểu thức chính quy có thể được sử dụng, chúng phải được biên dịch. Quá trình này cho phép chúng thực hiện so khớp hiệu quả hơn. Thông tin thêm về quá trình này có thể được tìm thấy trong [dotnet docs](https://learn.microsoft.com/en-us/dotnet/standard/base-types/compilation-and-reuse-in-regular-expressions).

Ký hiệu literal dẫn đến biên dịch biểu thức chính quy khi biểu thức được đánh giá. Mặt khác, constructor của đối tượng `RegExp`, `new RegExp('ab+c')`, dẫn đến biên dịch biểu thức chính quy tại runtime.

Sử dụng chuỗi làm đối số đầu tiên của constructor `RegExp()` khi bạn muốn [xây dựng biểu thức chính quy từ đầu vào động](#building_a_regular_expression_from_dynamic_inputs).

### Flags trong constructor

Biểu thức `new RegExp(/ab+c/, flags)` sẽ tạo một `RegExp` mới sử dụng source của tham số đầu tiên và các [flags](/en-US/docs/Web/JavaScript/Guide/Regular_expressions#advanced_searching_with_flags) được cung cấp bởi tham số thứ hai.

Khi sử dụng hàm constructor, các quy tắc escape chuỗi thông thường (đặt `\` trước các ký tự đặc biệt khi bao gồm trong chuỗi) là cần thiết.

Ví dụ, hai biểu thức sau tương đương:

```js
const re = /\w+/;
// OR
const re = new RegExp("\\w+");
```

### Xử lý đặc biệt cho regex

> [!NOTE]
> Liệu có gì đó là "regex" có thể được kiểm tra theo kiểu [duck-typed](https://en.wikipedia.org/wiki/Duck_typing). Nó không nhất thiết phải là `RegExp`!

Một số phương thức dựng sẵn sẽ xử lý regex theo cách đặc biệt. Chúng quyết định liệu `x` có phải là regex hay không thông qua [nhiều bước](https://tc39.es/ecma262/multipage/abstract-operations.html#sec-isregexp):

1. `x` phải là một đối tượng (không phải kiểu nguyên thủy).
2. Nếu [`x[Symbol.match]`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Symbol/match) không phải là `undefined`, kiểm tra xem nó có [truthy](/en-US/docs/Glossary/Truthy) không.
3. Ngược lại, nếu `x[Symbol.match]` là `undefined`, kiểm tra xem `x` có được tạo bằng constructor `RegExp` không. (Bước này hiếm khi xảy ra, vì nếu `x` là đối tượng `RegExp` không bị can thiệp, nó phải có thuộc tính `Symbol.match`.)

Lưu ý rằng trong hầu hết các trường hợp, nó sẽ đi qua kiểm tra `Symbol.match`, có nghĩa là:

- Một đối tượng `RegExp` thực sự có giá trị thuộc tính `Symbol.match` là [falsy](/en-US/docs/Glossary/Falsy) nhưng không phải `undefined` (kể cả khi mọi thứ khác còn nguyên vẹn, như [`exec`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/RegExp/exec) và [`[Symbol.replace]()`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/RegExp/Symbol.replace)) có thể được dùng như thể nó không phải là regex.
- Một đối tượng không phải `RegExp` có thuộc tính `Symbol.match` sẽ được coi như thể nó là regex.

Sự lựa chọn này được thực hiện vì `[Symbol.match]()` là thuộc tính chỉ định nhất rằng một thứ gì đó được dùng để so khớp. (`exec` cũng có thể được dùng, nhưng vì nó không phải là thuộc tính symbol, sẽ có quá nhiều false positive.) Các nơi xử lý regex theo cách đặc biệt bao gồm:

- [`String.prototype.endsWith()`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/String/endsWith), [`startsWith()`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/String/startsWith), và [`includes()`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/String/includes) ném {{jsxref("TypeError")}} nếu đối số đầu tiên là regex.
- [`String.prototype.matchAll()`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/String/matchAll) và [`replaceAll()`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/String/replaceAll) kiểm tra xem flag [global](/en-US/docs/Web/JavaScript/Reference/Global_Objects/RegExp/global) có được đặt không nếu đối số đầu tiên là regex trước khi gọi phương thức [`[Symbol.matchAll]()`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Symbol/matchAll) hoặc [`[Symbol.replace]()`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Symbol/replace) của nó.
- Constructor [`RegExp()`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/RegExp/RegExp) trực tiếp trả về đối số `pattern` chỉ khi `pattern` là regex (trong số một vài điều kiện khác). Nếu `pattern` là regex, nó cũng sẽ truy vấn các thuộc tính `source` và `flags` của `pattern` thay vì ép kiểu `pattern` thành chuỗi.

Ví dụ, [`String.prototype.endsWith()`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/String/endsWith) sẽ ép tất cả đầu vào thành chuỗi, nhưng sẽ ném lỗi nếu đối số là regex, vì nó chỉ được thiết kế để so khớp chuỗi, và việc sử dụng regex có thể là lỗi của developer.

```js
"foobar".endsWith({ toString: () => "bar" }); // true
"foobar".endsWith(/bar/); // TypeError: First argument to String.prototype.endsWith must not be a regular expression
```

Bạn có thể vượt qua kiểm tra bằng cách đặt `[Symbol.match]` thành giá trị [falsy](/en-US/docs/Glossary/Falsy) không phải `undefined`. Điều này có nghĩa là regex không thể được dùng cho `String.prototype.match()` (vì không có `[Symbol.match]`, `match()` sẽ tạo một đối tượng `RegExp` mới với hai dấu gạch chéo bao quanh được thêm bởi [`re.toString()`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/RegExp/toString)), nhưng nó có thể được dùng cho hầu hết mọi thứ khác.

```js
const re = /bar/g;
re[Symbol.match] = false;
"/bar/g".endsWith(re); // true
re.exec("bar"); // [ 'bar', index: 0, input: 'bar', groups: undefined ]
"bar & bar".replace(re, "foo"); // 'foo & foo'
```

### Các thuộc tính RegExp kiểu Perl

Lưu ý rằng một số thuộc tính `RegExp` có cả tên dài và ngắn (kiểu Perl). Cả hai tên luôn tham chiếu đến cùng một giá trị. (Perl là ngôn ngữ lập trình mà JavaScript mô phỏng biểu thức chính quy.) Xem thêm [các thuộc tính `RegExp` không dùng nữa](/en-US/docs/Web/JavaScript/Reference/Deprecated_and_obsolete_features#regexp).

## Constructor

- {{jsxref("RegExp/RegExp", "RegExp()")}}
  - : Tạo một đối tượng `RegExp` mới.

## Thuộc tính tĩnh

- [`RegExp.$1`, …, `RegExp.$9`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/RegExp/n) {{deprecated_inline}}
  - : Các thuộc tính tĩnh chỉ đọc chứa các kết quả so khớp chuỗi con trong ngoặc đơn.
- [`RegExp.input` (`$_`)](/en-US/docs/Web/JavaScript/Reference/Global_Objects/RegExp/input) {{deprecated_inline}}
  - : Thuộc tính tĩnh chứa chuỗi cuối cùng mà biểu thức chính quy được so khớp thành công.
- [`RegExp.lastMatch` (`$&`)](/en-US/docs/Web/JavaScript/Reference/Global_Objects/RegExp/lastMatch) {{deprecated_inline}}
  - : Thuộc tính tĩnh chỉ đọc chứa chuỗi con được so khớp cuối cùng.
- [`RegExp.lastParen` (`$+`)](/en-US/docs/Web/JavaScript/Reference/Global_Objects/RegExp/lastParen) {{deprecated_inline}}
  - : Thuộc tính tĩnh chỉ đọc chứa kết quả so khớp chuỗi con trong ngoặc đơn cuối cùng.
- [`RegExp.leftContext` (`` $` ``)](/en-US/docs/Web/JavaScript/Reference/Global_Objects/RegExp/leftContext) {{deprecated_inline}}
  - : Thuộc tính tĩnh chỉ đọc chứa chuỗi con đứng trước kết quả so khớp gần nhất.
- [`RegExp.rightContext` (`$'`)](/en-US/docs/Web/JavaScript/Reference/Global_Objects/RegExp/rightContext) {{deprecated_inline}}
  - : Thuộc tính tĩnh chỉ đọc chứa chuỗi con đứng sau kết quả so khớp gần nhất.
- [`RegExp[Symbol.species]`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/RegExp/Symbol.species)
  - : Hàm constructor được dùng để tạo các đối tượng dẫn xuất.

## Phương thức tĩnh

- {{jsxref("RegExp.escape()")}}
  - : [Escape](/en-US/docs/Web/JavaScript/Reference/Regular_expressions#escape_sequences) bất kỳ ký tự cú pháp regex tiềm năng nào trong chuỗi, và trả về chuỗi mới có thể được sử dụng an toàn làm mẫu [literal](/en-US/docs/Web/JavaScript/Reference/Regular_expressions/Literal_character) cho constructor {{jsxref("RegExp/RegExp", "RegExp()")}}.

## Thuộc tính instance

Các thuộc tính này được định nghĩa trên `RegExp.prototype` và được chia sẻ bởi tất cả các instance `RegExp`.

- {{jsxref("Object/constructor", "RegExp.prototype.constructor")}}
  - : Hàm constructor đã tạo ra đối tượng instance. Đối với các instance `RegExp`, giá trị khởi tạo là constructor {{jsxref("RegExp/RegExp", "RegExp")}}.
- {{jsxref("RegExp.prototype.dotAll")}}
  - : Liệu `.` có so khớp ký tự xuống dòng hay không.
- {{jsxref("RegExp.prototype.flags")}}
  - : Chuỗi chứa các flags của đối tượng `RegExp`.
- {{jsxref("RegExp.prototype.global")}}
  - : Liệu có kiểm tra biểu thức chính quy với tất cả các kết quả khớp có thể có trong chuỗi hay chỉ với kết quả đầu tiên.
- {{jsxref("RegExp.prototype.hasIndices")}}
  - : Liệu kết quả biểu thức chính quy có hiển thị chỉ số bắt đầu và kết thúc của các chuỗi con được chụp hay không.
- {{jsxref("RegExp.prototype.ignoreCase")}}
  - : Liệu có bỏ qua phân biệt chữ hoa chữ thường khi cố gắng so khớp trong chuỗi hay không.
- {{jsxref("RegExp.prototype.multiline")}}
  - : Liệu có tìm kiếm trong chuỗi trên nhiều dòng hay không.
- {{jsxref("RegExp.prototype.source")}}
  - : Văn bản của mẫu.
- {{jsxref("RegExp.prototype.sticky")}}
  - : Liệu tìm kiếm có sticky hay không.
- {{jsxref("RegExp.prototype.unicode")}}
  - : Liệu các tính năng Unicode có được bật hay không.
- {{jsxref("RegExp.prototype.unicodeSets")}}
  - : Liệu flag `v`, nâng cấp của chế độ `u`, có được bật hay không.

Các thuộc tính này là thuộc tính riêng của mỗi instance `RegExp`.

- {{jsxref("RegExp/lastIndex", "lastIndex")}}
  - : Chỉ số để bắt đầu tìm kiếm kết quả so khớp tiếp theo.

## Phương thức instance

- {{jsxref("RegExp.prototype.compile()")}} {{deprecated_inline}}
  - : (Tái-)biên dịch biểu thức chính quy trong quá trình thực thi script.
- {{jsxref("RegExp.prototype.exec()")}}
  - : Thực thi tìm kiếm kết quả so khớp trong tham số chuỗi của nó.
- {{jsxref("RegExp.prototype.test()")}}
  - : Kiểm tra kết quả so khớp trong tham số chuỗi của nó.
- {{jsxref("RegExp.prototype.toString()")}}
  - : Trả về chuỗi biểu diễn đối tượng được chỉ định. Ghi đè phương thức {{jsxref("Object.prototype.toString()")}}.
- [`RegExp.prototype[Symbol.match]()`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/RegExp/Symbol.match)
  - : Thực hiện so khớp với chuỗi đã cho và trả về kết quả so khớp.
- [`RegExp.prototype[Symbol.matchAll]()`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/RegExp/Symbol.matchAll)
  - : Trả về tất cả các kết quả so khớp của biểu thức chính quy với một chuỗi.
- [`RegExp.prototype[Symbol.replace]()`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/RegExp/Symbol.replace)
  - : Thay thế các kết quả so khớp trong chuỗi đã cho bằng chuỗi con mới.
- [`RegExp.prototype[Symbol.search]()`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/RegExp/Symbol.search)
  - : Tìm kiếm kết quả so khớp trong chuỗi đã cho và trả về chỉ số mà mẫu được tìm thấy trong chuỗi.
- [`RegExp.prototype[Symbol.split]()`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/RegExp/Symbol.split)
  - : Tách chuỗi đã cho thành mảng bằng cách phân tách chuỗi thành các chuỗi con.

## Ví dụ

### Sử dụng biểu thức chính quy để thay đổi định dạng dữ liệu

Script sau sử dụng phương thức {{jsxref("String.prototype.replace()")}} để so khớp tên theo định dạng _họ tên_ và xuất ra theo định dạng _tên, họ_.

Trong văn bản thay thế, script sử dụng `$1` và `$2` để chỉ kết quả của các ngoặc đơn so khớp tương ứng trong mẫu biểu thức chính quy.

```js
const re = /(\w+)\s(\w+)/;
const str = "Maria Cruz";
const newStr = str.replace(re, "$2, $1");
console.log(newStr);
```

Kết quả hiển thị là `"Cruz, Maria"`.

### Sử dụng biểu thức chính quy để tách dòng với các ký tự xuống dòng khác nhau

Ký tự xuống dòng mặc định khác nhau tùy theo nền tảng (Unix, Windows, v.v.). Cách tách dòng trong ví dụ này hoạt động trên tất cả các nền tảng.

```js
const text = "Some text\nAnd some more\r\nAnd yet\nThis is the end";
const lines = text.split(/\r?\n/);
console.log(lines); // [ 'Some text', 'And some more', 'And yet', 'This is the end' ]
```

Lưu ý rằng thứ tự của các mẫu trong biểu thức chính quy quan trọng.

### Sử dụng biểu thức chính quy trên nhiều dòng

Theo mặc định, ký tự `.` không so khớp ký tự xuống dòng. Để làm cho nó so khớp ký tự xuống dòng, hãy sử dụng flag `s` (chế độ `dotAll`).

```js
const s = "Please yes\nmake my day!";

s.match(/yes.*day/);
// Returns null

s.match(/yes.*day/s);
// Returns ["yes\nmake my day"]
```

### Sử dụng biểu thức chính quy với flag sticky

Flag {{jsxref("RegExp/sticky", "sticky")}} cho biết rằng biểu thức chính quy thực hiện so khớp sticky trong chuỗi đích bằng cách cố gắng so khớp bắt đầu từ {{jsxref("RegExp.prototype.lastIndex")}}.

```js
const str = "#foo#";
const regex = /foo/y;

regex.lastIndex = 1;
regex.test(str); // true
regex.lastIndex = 5;
regex.test(str); // false (lastIndex is taken into account with sticky flag)
regex.lastIndex; // 0 (reset after match failure)
```

### Sự khác biệt giữa flag sticky và flag global

Với flag sticky `y`, kết quả so khớp tiếp theo phải xảy ra tại vị trí `lastIndex`, trong khi với flag global `g`, kết quả so khớp có thể xảy ra tại vị trí `lastIndex` hoặc sau đó:

```js
const re = /\d/y;
let r;
while ((r = re.exec("123 456"))) {
  console.log(r, "AND re.lastIndex", re.lastIndex);
}

// [ '1', index: 0, input: '123 456', groups: undefined ] AND re.lastIndex 1
// [ '2', index: 1, input: '123 456', groups: undefined ] AND re.lastIndex 2
// [ '3', index: 2, input: '123 456', groups: undefined ] AND re.lastIndex 3
//  … and no more match.
```

Với flag global `g`, tất cả 6 chữ số sẽ được so khớp, không chỉ 3.

### Biểu thức chính quy và ký tự Unicode

`\w` và `\W` chỉ so khớp các ký tự dựa trên ASCII; ví dụ, `a` đến `z`, `A` đến `Z`, `0` đến `9`, và `_`.

Để so khớp các ký tự từ các ngôn ngữ khác như Cyrillic hoặc Hebrew, hãy sử dụng `\uHHHH`, trong đó `HHHH` là giá trị Unicode của ký tự theo hệ thập lục phân.

Ví dụ này minh họa cách tách ký tự Unicode ra khỏi một từ.

```js
const text = "Образец text на русском языке";
const regex = /[\u0400-\u04ff]+/g;

const match = regex.exec(text);
console.log(match[0]); // 'Образец'
console.log(regex.lastIndex); // 7

const match2 = regex.exec(text);
console.log(match2[0]); // 'на' (did not log 'text')
console.log(regex.lastIndex); // 15

// and so on
```

Tính năng [Unicode property escapes](/en-US/docs/Web/JavaScript/Reference/Regular_expressions/Unicode_character_class_escape) cung cấp cách đơn giản hơn để nhắm mục tiêu vào các phạm vi Unicode cụ thể, bằng cách cho phép các câu lệnh như `\p{scx=Cyrl}` (để so khớp bất kỳ chữ Cyrillic nào), hoặc `\p{L}/u` (để so khớp một chữ cái từ bất kỳ ngôn ngữ nào).

### Trích xuất tên subdomain từ URL

```js
const url = "http://xxx.example.com";
console.log(/^https?:\/\/(.+?)\./.exec(url)[1]); // 'xxx'
```

> [!NOTE]
> Thay vì sử dụng biểu thức chính quy để phân tích URL, thường tốt hơn khi sử dụng trình phân tích URL dựng sẵn của trình duyệt bằng cách sử dụng [URL API](/en-US/docs/Web/API/URL_API).

### Xây dựng biểu thức chính quy từ đầu vào động

```js
const breakfasts = ["bacon", "eggs", "oatmeal", "toast", "cereal"];
const order = "Let me get some bacon and eggs, please";

order.match(new RegExp(`\\b(${breakfasts.join("|")})\\b`, "g"));
// Returns ['bacon', 'eggs']
```

## Đặc tả kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

### Ghi chú dành riêng cho Firefox

Bắt đầu từ Firefox 34, trong trường hợp nhóm chụp (capturing group) có quantifier ngăn nhóm đó thực thi, văn bản so khớp cho nhóm chụp bây giờ là `undefined` thay vì chuỗi rỗng:

```js
// Firefox 33 or older
"x".replace(/x(.)?/g, (m, group) => {
  console.log(`group: ${JSON.stringify(group)}`);
});
// group: ""

// Firefox 34 or newer
"x".replace(/x(.)?/g, (m, group) => {
  console.log(`group: ${group}`);
});
// group: undefined
```

Lưu ý rằng do tính tương thích web, `RegExp.$N` vẫn sẽ trả về chuỗi rỗng thay vì `undefined` ([bug 1053944](https://bugzil.la/1053944)).

## Xem thêm

- [Polyfill của nhiều tính năng `RegExp` hiện đại (`dotAll`, flag `sticky`, named capture groups, v.v.) trong `core-js`](https://github.com/zloirock/core-js#ecmascript-string-and-regexp)
- Hướng dẫn [Biểu thức chính quy](/en-US/docs/Web/JavaScript/Guide/Regular_expressions)
- [Biểu thức chính quy](/en-US/docs/Web/JavaScript/Reference/Regular_expressions)
- {{jsxref("String.prototype.match()")}}
- {{jsxref("String.prototype.replace()")}}
- {{jsxref("String.prototype.split()")}}
