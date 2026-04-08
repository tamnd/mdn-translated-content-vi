---
title: Lexical grammar
slug: Web/JavaScript/Reference/Lexical_grammar
page-type: guide
browser-compat: javascript.grammar
spec-urls: https://tc39.es/ecma262/multipage/ecmascript-language-lexical-grammar.html
sidebar: jssidebar
---

Trang này mô tả ngữ pháp từ vựng của JavaScript. Văn bản nguồn JavaScript chỉ là một chuỗi ký tự — để trình thông dịch có thể hiểu được, chuỗi này phải được _phân tích cú pháp_ thành một biểu diễn có cấu trúc hơn. Bước đầu tiên của việc phân tích cú pháp được gọi là [phân tích từ vựng](https://en.wikipedia.org/wiki/Lexical_analysis), trong đó văn bản được quét từ trái sang phải và được chuyển đổi thành một chuỗi các phần tử đầu vào riêng lẻ, nguyên tử. Một số phần tử đầu vào không có ý nghĩa với trình thông dịch và sẽ bị loại bỏ sau bước này — chúng bao gồm [khoảng trắng](#white_space) và [chú thích](#comments). Những phần tử khác, bao gồm [định danh](#identifiers), [từ khóa](#keywords), [literal](#literals) và dấu câu (chủ yếu là [toán tử](/en-US/docs/Web/JavaScript/Reference/Operators)), sẽ được sử dụng để phân tích cú pháp tiếp theo. [Ký tự kết thúc dòng](#line_terminators) và chú thích nhiều dòng cũng không có ý nghĩa cú pháp, nhưng chúng hướng dẫn quá trình [chèn dấu chấm phẩy tự động](#automatic_semicolon_insertion) để làm cho một số chuỗi token không hợp lệ trở nên hợp lệ.

## Ký tự điều khiển định dạng

Các ký tự điều khiển định dạng không có biểu diễn trực quan nhưng được dùng để kiểm soát việc diễn giải văn bản.

| Code point | Name                  | Abbreviation | Description                                                                                                                                                                                                                    |
| ---------- | --------------------- | ------------ | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------ |
| U+200C     | Zero width non-joiner | \<ZWNJ>      | Placed between characters to prevent being connected into ligatures in certain languages ([Wikipedia](https://en.wikipedia.org/wiki/Zero-width_non-joiner)).                                                                   |
| U+200D     | Zero width joiner     | \<ZWJ>       | Placed between characters that would not normally be connected in order to cause the characters to be rendered using their connected form in certain languages ([Wikipedia](https://en.wikipedia.org/wiki/Zero-width_joiner)). |
| U+FEFF     | Byte order mark       | \<BOM>       | Used at the start of the script to mark it as Unicode and to allow detection of the text's encoding and byte order ([Wikipedia](https://en.wikipedia.org/wiki/Byte_order_mark)).                                               |

Trong văn bản nguồn JavaScript, \<ZWNJ> và \<ZWJ> được coi là phần của [định danh](#identifiers), trong khi \<BOM> (còn được gọi là khoảng trắng không ngắt dòng có độ rộng bằng không \<ZWNBSP> khi không ở đầu văn bản) được coi là [khoảng trắng](#white_space).

## Khoảng trắng

Các ký tự [khoảng trắng](/en-US/docs/Glossary/Whitespace) cải thiện khả năng đọc của văn bản nguồn và tách các token ra khỏi nhau. Những ký tự này thường không cần thiết cho chức năng của mã. [Các công cụ thu nhỏ](https://en.wikipedia.org/wiki/Minification_%28programming%29) thường được dùng để loại bỏ khoảng trắng nhằm giảm lượng dữ liệu cần truyền.

| Code point | Name                           | Abbreviation | Description                                                                                        | Escape sequence |
| ---------- | ------------------------------ | ------------ | -------------------------------------------------------------------------------------------------- | --------------- |
| U+0009     | Character tabulation           | \<TAB>       | Horizontal tabulation                                                                              | \t              |
| U+000B     | Line tabulation                | \<VT>        | Vertical tabulation                                                                                | \v              |
| U+000C     | Form feed                      | \<FF>        | Page breaking control character ([Wikipedia](https://en.wikipedia.org/wiki/Page_break#Form_feed)). | \f              |
| U+0020     | Space                          | \<SP>        | Normal space                                                                                       |                 |
| U+00A0     | No-break space                 | \<NBSP>      | Normal space, but no point at which a line may break                                               |                 |
| U+FEFF     | Zero-width no-break space      | \<ZWNBSP>    | When not at the start of a script, the BOM marker is a normal whitespace character.                |                 |
| Others     | Other Unicode space characters | \<USP>       | [Characters in the "Space_Separator" general category][space separator set]                        |                 |

[space separator set]: https://util.unicode.org/UnicodeJsps/list-unicodeset.jsp?a=%5Cp%7BGeneral_Category%3DSpace_Separator%7D

> [!NOTE]
> Trong số những [ký tự có thuộc tính "White_Space" nhưng không thuộc danh mục tổng quát "Space_Separator"](https://util.unicode.org/UnicodeJsps/list-unicodeset.jsp?a=%5Cp%7BWhite_Space%7D%26%5CP%7BGeneral_Category%3DSpace_Separator%7D), U+0009, U+000B và U+000C vẫn được coi là khoảng trắng trong JavaScript; U+0085 NEXT LINE không có vai trò đặc biệt; các ký tự khác trở thành tập hợp của [ký tự kết thúc dòng](#line_terminators).

> [!NOTE]
> Các thay đổi đối với tiêu chuẩn Unicode được JavaScript engine sử dụng có thể ảnh hưởng đến hành vi của chương trình. Ví dụ, ES2016 đã nâng cấp tiêu chuẩn Unicode tham chiếu từ 5.1 lên 8.0.0, khiến U+180E MONGOLIAN VOWEL SEPARATOR chuyển từ danh mục "Space_Separator" sang danh mục "Format (Cf)" và không còn là khoảng trắng. Kết quả là, kết quả của [`"\u180E".trim().length`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/String/trim) đã thay đổi từ `0` thành `1`.

## Ký tự kết thúc dòng

Ngoài các ký tự [khoảng trắng](#white_space), ký tự kết thúc dòng được dùng để cải thiện khả năng đọc của văn bản nguồn. Tuy nhiên, trong một số trường hợp, ký tự kết thúc dòng có thể ảnh hưởng đến việc thực thi mã JavaScript vì có một vài chỗ chúng bị cấm. Ký tự kết thúc dòng cũng ảnh hưởng đến quá trình [chèn dấu chấm phẩy tự động](#automatic_semicolon_insertion).

Ngoài bối cảnh ngữ pháp từ vựng, khoảng trắng và ký tự kết thúc dòng thường bị nhầm lẫn với nhau. Ví dụ, {{jsxref("String.prototype.trim()")}} loại bỏ tất cả khoảng trắng và ký tự kết thúc dòng ở đầu và cuối chuỗi. Chuỗi thoát lớp ký tự `\s` trong biểu thức chính quy khớp với tất cả khoảng trắng và ký tự kết thúc dòng.

Chỉ các code point Unicode sau đây được coi là ký tự kết thúc dòng trong ECMAScript; các ký tự ngắt dòng khác được coi là khoảng trắng (ví dụ, Next Line, NEL, U+0085 được coi là khoảng trắng).

| Code point | Name                | Abbreviation | Description                                            | Escape sequence |
| ---------- | ------------------- | ------------ | ------------------------------------------------------ | --------------- |
| U+000A     | Line Feed           | \<LF>        | New line character in UNIX systems.                    | \n              |
| U+000D     | Carriage Return     | \<CR>        | New line character in Commodore and early Mac systems. | \r              |
| U+2028     | Line Separator      | \<LS>        | [Wikipedia](https://en.wikipedia.org/wiki/Newline)     |                 |
| U+2029     | Paragraph Separator | \<PS>        | [Wikipedia](https://en.wikipedia.org/wiki/Newline)     |                 |

## Chú thích

Chú thích được dùng để thêm gợi ý, ghi chú, đề xuất hoặc cảnh báo vào mã JavaScript. Điều này có thể làm cho mã dễ đọc và hiểu hơn. Chúng cũng có thể được dùng để vô hiệu hóa mã nhằm ngăn không cho nó thực thi; đây có thể là một công cụ gỡ lỗi hữu ích.

JavaScript có hai cách truyền thống để thêm chú thích vào mã: chú thích dòng và chú thích khối. Ngoài ra, còn có cú pháp chú thích hashbang đặc biệt.

### Chú thích dòng

Cách đầu tiên là chú thích `//`; điều này biến tất cả văn bản sau nó trên cùng một dòng thành chú thích. Ví dụ:

```js
function comment() {
  // This is a one line JavaScript comment
  console.log("Hello world!");
}
comment();
```

### Chú thích khối

Cách thứ hai là kiểu `/* */`, linh hoạt hơn nhiều.

Ví dụ, bạn có thể dùng nó trên một dòng:

```js
function comment() {
  /* This is a one line JavaScript comment */
  console.log("Hello world!");
}
comment();
```

Bạn cũng có thể tạo chú thích nhiều dòng, như thế này:

```js
function comment() {
  /* This comment spans multiple lines. Notice
     that we don't need to end the comment until we're done. */
  console.log("Hello world!");
}
comment();
```

Bạn cũng có thể dùng nó ở giữa một dòng, mặc dù điều này có thể làm cho mã khó đọc hơn nên cần dùng cẩn thận:

```js
function comment(x) {
  console.log("Hello " + x /* insert the value of x */ + " !");
}
comment("world");
```

Ngoài ra, bạn có thể dùng nó để vô hiệu hóa mã để ngăn không cho nó chạy, bằng cách bọc mã trong một chú thích, như thế này:

```js
function comment() {
  /* console.log("Hello world!"); */
}
comment();
```

Trong trường hợp này, lệnh gọi `console.log()` không bao giờ được thực thi vì nó nằm trong chú thích. Bất kỳ số dòng mã nào cũng có thể bị vô hiệu hóa theo cách này.

Chú thích khối chứa ít nhất một ký tự kết thúc dòng hoạt động như [ký tự kết thúc dòng](#line_terminators) trong [chèn dấu chấm phẩy tự động](#automatic_semicolon_insertion).

### Chú thích hashbang

Có một cú pháp chú thích thứ ba đặc biệt, **chú thích hashbang**. Chú thích hashbang hoạt động giống hệt như chú thích dòng (`//`), ngoại trừ nó bắt đầu bằng `#!` và **chỉ hợp lệ ở vị trí tuyệt đối đầu của một script hoặc module**. Lưu ý rằng không có khoảng trắng nào được phép trước `#!`. Chú thích bao gồm tất cả các ký tự sau `#!` cho đến cuối dòng đầu tiên; chỉ cho phép một chú thích như vậy.

Chú thích hashbang trong JavaScript giống với [shebang trong Unix](<https://en.wikipedia.org/wiki/Shebang_(Unix)>), cung cấp đường dẫn đến một trình thông dịch JavaScript cụ thể mà bạn muốn dùng để thực thi script. Trước khi chú thích hashbang được chuẩn hóa, nó đã được triển khai trên thực tế trong các host không phải trình duyệt như Node.js, nơi nó bị loại bỏ khỏi văn bản nguồn trước khi được truyền cho engine. Ví dụ như sau:

```js
#!/usr/bin/env node

console.log("Hello world");
```

Trình thông dịch JavaScript sẽ coi nó như một chú thích thông thường — nó chỉ có ý nghĩa ngữ nghĩa với shell nếu script được chạy trực tiếp trong shell.

> [!WARNING]
> Nếu bạn muốn các script có thể chạy trực tiếp trong môi trường shell, hãy mã hóa chúng bằng UTF-8 không có [BOM](https://en.wikipedia.org/wiki/Byte_order_mark). Mặc dù BOM sẽ không gây ra bất kỳ sự cố nào cho mã chạy trong trình duyệt — vì nó bị loại bỏ trong quá trình giải mã UTF-8, trước khi văn bản nguồn được phân tích — shell Unix/Linux sẽ không nhận ra hashbang nếu nó đứng trước một ký tự BOM.

Bạn chỉ nên dùng kiểu chú thích `#!` để chỉ định trình thông dịch JavaScript. Trong tất cả các trường hợp khác, hãy dùng chú thích `//` (hoặc chú thích nhiều dòng).

## Định danh

Một _định danh_ được dùng để liên kết một giá trị với một tên. Định danh có thể được dùng ở nhiều chỗ:

```js
const decl = 1; // Variable declaration (may also be `let` or `var`)
function fn() {} // Function declaration
const obj = { key: "value" }; // Object keys
// Class declaration
class C {
  #priv = "value"; // Private field
}
lbl: console.log(1); // Label
```

Trong JavaScript, định danh thường được tạo bởi các ký tự chữ và số, dấu gạch dưới (`_`) và ký hiệu đô la (`$`). Định danh không được phép bắt đầu bằng số. Tuy nhiên, định danh JavaScript không chỉ giới hạn ở {{Glossary("ASCII")}} — nhiều code point Unicode cũng được phép. Cụ thể:

- Ký tự bắt đầu có thể là bất kỳ ký tự nào trong danh mục [ID_Start](https://util.unicode.org/UnicodeJsps/list-unicodeset.jsp?a=%5Cp%7BID_Start%7D) cộng với `_` và `$`.
- Sau ký tự đầu tiên, bạn có thể dùng bất kỳ ký tự nào trong danh mục [ID_Continue](https://util.unicode.org/UnicodeJsps/list-unicodeset.jsp?a=%5Cp%7BID_Continue%7D) cộng với U+200C (ZWNJ) và U+200D (ZWJ).

> [!NOTE]
> Nếu vì lý do nào đó bạn cần tự phân tích cú pháp mã JavaScript, đừng giả định rằng tất cả định danh đều theo mẫu `/[A-Za-z_$][\w$]*/` (tức là chỉ ASCII)! Phạm vi định danh có thể được mô tả bằng regex `/[$_\p{ID_Start}][$\p{ID_Continue}]*/u` (không bao gồm chuỗi thoát unicode).

Ngoài ra, JavaScript cho phép sử dụng [chuỗi thoát Unicode](#unicode_escape_sequences) dưới dạng `\u0000` hoặc `\u{000000}` trong định danh, mã hóa giá trị chuỗi giống như các ký tự Unicode thực tế. Ví dụ, `你好` và `\u4f60\u597d` là các định danh giống nhau:

```js-nolint
const 你好 = "Hello";
console.log(\u4f60\u597d); // Hello
```

Không phải tất cả các chỗ đều chấp nhận toàn bộ phạm vi định danh. Một số cú pháp nhất định, chẳng hạn như khai báo hàm, biểu thức hàm và khai báo biến yêu cầu sử dụng tên định danh không phải là [từ dành riêng](#reserved_words).

```js-nolint example-bad
function import() {} // Illegal: import is a reserved word.
```

Đặc biệt, phần tử private và thuộc tính đối tượng cho phép từ dành riêng.

```js
const obj = { import: "value" }; // Legal despite `import` being reserved
class C {
  #import = "value";
}
```

## Từ khóa

_Từ khóa_ là các token trông giống định danh nhưng có ý nghĩa đặc biệt trong JavaScript. Ví dụ, từ khóa [`async`](/en-US/docs/Web/JavaScript/Reference/Statements/async_function) trước một khai báo hàm cho biết hàm đó là bất đồng bộ.

Một số từ khóa được _dành riêng_, nghĩa là chúng không thể được dùng làm định danh cho khai báo biến, khai báo hàm, v.v. Chúng thường được gọi là _từ dành riêng_. [Danh sách các từ dành riêng này](#reserved_words) được cung cấp bên dưới. Không phải tất cả từ khóa đều dành riêng — ví dụ, `async` có thể được dùng làm định danh ở bất kỳ đâu. Một số từ khóa chỉ _dành riêng theo ngữ cảnh_ — ví dụ, `await` chỉ dành riêng trong thân hàm async, và `let` chỉ dành riêng trong mã [strict mode](/en-US/docs/Web/JavaScript/Reference/Strict_mode), hoặc khai báo `const` và `let`.

Định danh luôn được so sánh theo _giá trị chuỗi_, vì vậy chuỗi thoát được diễn giải. Ví dụ, đây vẫn là lỗi cú pháp:

```js-nolint example-bad
const els\u{65} = 1;
// `els\u{65}` encodes the same identifier as `else`
```

### Từ dành riêng

Những từ khóa này không thể được dùng làm định danh cho biến, hàm, lớp, v.v. ở bất kỳ đâu trong mã nguồn JavaScript.

- {{jsxref("Statements/break", "break")}}
- {{jsxref("Statements/switch", "case")}}
- {{jsxref("Statements/try...catch", "catch")}}
- {{jsxref("Statements/class", "class")}}
- {{jsxref("Statements/const", "const")}}
- {{jsxref("Statements/continue", "continue")}}
- {{jsxref("Statements/debugger", "debugger")}}
- {{jsxref("Statements/switch", "default")}}
- {{jsxref("Operators/delete", "delete")}}
- {{jsxref("Statements/do...while", "do")}}
- {{jsxref("Statements/if...else", "else")}}
- {{jsxref("Statements/export", "export")}}
- [`extends`](/en-US/docs/Web/JavaScript/Reference/Classes/extends)
- [`false`](#boolean_literal)
- {{jsxref("Statements/try...catch", "finally")}}
- {{jsxref("Statements/for", "for")}}
- {{jsxref("Statements/function", "function")}}
- {{jsxref("Statements/if...else", "if")}}
- {{jsxref("Statements/import", "import")}}
- {{jsxref("Operators/in", "in")}}
- {{jsxref("Operators/instanceof", "instanceof")}}
- {{jsxref("Operators/new", "new")}}
- {{jsxref("Operators/null", "null")}}
- {{jsxref("Statements/return", "return")}}
- {{jsxref("Operators/super", "super")}}
- {{jsxref("Statements/switch", "switch")}}
- {{jsxref("Operators/this", "this")}}
- {{jsxref("Statements/throw", "throw")}}
- [`true`](#boolean_literal)
- {{jsxref("Statements/try...catch", "try")}}
- {{jsxref("Operators/typeof", "typeof")}}
- {{jsxref("Statements/var", "var")}}
- {{jsxref("Operators/void", "void")}}
- {{jsxref("Statements/while", "while")}}
- {{jsxref("Statements/with", "with")}}

Các từ sau chỉ dành riêng khi được tìm thấy trong mã strict mode:

- {{jsxref("Statements/let", "let")}} (also reserved in `const`, `let`, and class declarations)
- [`static`](/en-US/docs/Web/JavaScript/Reference/Classes/static)
- {{jsxref("Operators/yield", "yield")}} (also reserved in generator function bodies)

Các từ sau chỉ dành riêng khi được tìm thấy trong mã module hoặc thân hàm async:

- [`await`](/en-US/docs/Web/JavaScript/Reference/Operators/await)

### Từ dành riêng trong tương lai

Các từ sau được dành riêng như từ khóa tương lai theo đặc tả ECMAScript. Hiện tại chúng không có chức năng đặc biệt, nhưng có thể có vào một thời điểm nào đó trong tương lai, vì vậy chúng không thể được dùng làm định danh.

Những từ này luôn được dành riêng:

- `enum`

Các từ sau chỉ dành riêng khi được tìm thấy trong mã strict mode:

- `implements`
- `interface`
- `package`
- `private`
- `protected`
- `public`

#### Từ dành riêng trong tương lai theo các tiêu chuẩn cũ hơn

Các từ sau được dành riêng như từ khóa tương lai theo các đặc tả ECMAScript cũ hơn (ECMAScript 1 đến 3).

- `abstract`
- `boolean`
- `byte`
- `char`
- `double`
- `final`
- `float`
- `goto`
- `int`
- `long`
- `native`
- `short`
- `synchronized`
- `throws`
- `transient`
- `volatile`

### Định danh có ý nghĩa đặc biệt

Một vài định danh có ý nghĩa đặc biệt trong một số ngữ cảnh mà không phải là từ dành riêng bất kỳ loại nào. Chúng bao gồm:

- {{jsxref("Functions/arguments", "arguments")}} (not a keyword, but cannot be declared as identifier in strict mode)
- `as` ([`import * as ns from "mod"`](/en-US/docs/Web/JavaScript/Reference/Statements/import#namespace_import))
- [`async`](/en-US/docs/Web/JavaScript/Reference/Statements/async_function)
- {{jsxref("Global_Objects/eval", "eval")}} (not a keyword, but cannot be declared as identifier in strict mode)
- `from` ([`import x from "mod"`](/en-US/docs/Web/JavaScript/Reference/Statements/import))
- {{jsxref("Functions/get", "get")}}
- [`of`](/en-US/docs/Web/JavaScript/Reference/Statements/for...of)
- {{jsxref("Functions/set", "set")}}

## Literal

> [!NOTE]
> Phần này thảo luận về các literal là token nguyên tử. [Object literals](/en-US/docs/Web/JavaScript/Reference/Operators/Object_initializer) và [array literals](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Array/Array#array_literal_notation) là [biểu thức](/en-US/docs/Web/JavaScript/Reference/Operators) bao gồm một chuỗi token.

### Null literal

Xem thêm [`null`](/en-US/docs/Web/JavaScript/Reference/Operators/null) để biết thêm thông tin.

```js-nolint
null
```

### Boolean literal

Xem thêm [kiểu boolean](/en-US/docs/Web/JavaScript/Guide/Data_structures#boolean_type) để biết thêm thông tin.

```js-nolint
true
false
```

### Numeric literals

Các kiểu [Number](/en-US/docs/Web/JavaScript/Guide/Data_structures#number_type) và [BigInt](/en-US/docs/Web/JavaScript/Guide/Data_structures#bigint_type) sử dụng numeric literal.

#### Decimal

```js-nolint
1234567890
42
```

Decimal literal có thể bắt đầu bằng số không (`0`) theo sau là một chữ số thập phân khác, nhưng nếu tất cả các chữ số sau `0` đứng đầu nhỏ hơn 8, số được diễn giải là số bát phân. Đây được coi là cú pháp kế thừa, và numeric literal có tiền tố `0`, dù được diễn giải là bát phân hay thập phân, đều gây ra lỗi cú pháp trong [strict mode](/en-US/docs/Web/JavaScript/Reference/Strict_mode#legacy_octal_literals) — vì vậy hãy dùng tiền tố `0o` thay thế.

```js-nolint example-bad
0888 // 888 parsed as decimal
0777 // parsed as octal, 511 in decimal
```

##### Exponential

Decimal exponential literal được chỉ định theo định dạng sau: `beN`; trong đó `b` là số cơ sở (số nguyên hoặc số thực), theo sau là ký tự `E` hoặc `e` (dùng làm dấu phân cách hoặc _chỉ số số mũ_) và `N`, là số _số mũ_ hay _lũy thừa_ — một số nguyên có dấu.

```js-nolint
0e-5   // 0
0e+5   // 0
5e1    // 50
175e-2 // 1.75
1e3    // 1000
1e-3   // 0.001
1E3    // 1000
```

#### Binary

Cú pháp số nhị phân sử dụng số không đứng đầu theo sau là chữ cái Latin viết thường hoặc viết hoa "B" (`0b` hoặc `0B`). Bất kỳ ký tự nào sau `0b` không phải là 0 hoặc 1 sẽ kết thúc chuỗi literal.

```js-nolint
0b10000000000000000000000000000000 // 2147483648
0b01111111100000000000000000000000 // 2139095040
0B00000000011111111111111111111111 // 8388607
```

#### Octal

Cú pháp số bát phân sử dụng số không đứng đầu theo sau là chữ cái Latin viết thường hoặc viết hoa "O" (`0o` hoặc `0O`). Bất kỳ ký tự nào sau `0o` nằm ngoài phạm vi (01234567) sẽ kết thúc chuỗi literal.

```js-nolint
0O755 // 493
0o644 // 420
```

#### Hexadecimal

Cú pháp số thập lục phân sử dụng số không đứng đầu theo sau là chữ cái Latin viết thường hoặc viết hoa "X" (`0x` hoặc `0X`). Bất kỳ ký tự nào sau `0x` nằm ngoài phạm vi (0123456789ABCDEF) sẽ kết thúc chuỗi literal.

```js-nolint
0xFFFFFFFFFFFFF // 4503599627370495
0xabcdef123456  // 188900967593046
0XA             // 10
```

#### BigInt literal

Kiểu [BigInt](/en-US/docs/Web/JavaScript/Guide/Data_structures#bigint_type) là một primitive số trong JavaScript có thể biểu diễn số nguyên với độ chính xác tùy ý. BigInt literal được tạo ra bằng cách thêm `n` vào cuối một số nguyên.

```js-nolint
123456789123456789n     // 123456789123456789
0o777777777777n         // 68719476735
0x123456789ABCDEFn      // 81985529216486895
0b11101001010101010101n // 955733
```

BigInt literal không thể bắt đầu bằng `0` để tránh nhầm lẫn với octal literal kế thừa.

```js-nolint example-bad
0755n; // SyntaxError: invalid BigInt syntax
```

Đối với số `BigInt` bát phân, luôn dùng số không theo sau là chữ cái "o" (viết hoa hoặc viết thường):

```js example-good
0o755n;
```

Để biết thêm thông tin về `BigInt`, xem thêm [cấu trúc dữ liệu JavaScript](/en-US/docs/Web/JavaScript/Guide/Data_structures#bigint_type).

#### Dấu phân cách số

Để cải thiện khả năng đọc cho numeric literal, dấu gạch dưới (`_`, `U+005F`) có thể được dùng làm dấu phân cách:

```js-nolint
1_000_000_000_000
1_050.95
0b1010_0001_1000_0101
0o2_2_5_6
0xA0_B0_C0
1_000_000_000_000_000_000_000n
```

Lưu ý các giới hạn sau:

```js-nolint example-bad
// More than one underscore in a row is not allowed
100__000; // SyntaxError

// Not allowed at the end of numeric literals
100_; // SyntaxError

// Can not be used after leading 0
0_1; // SyntaxError
```

### String literals

Một [string](/en-US/docs/Web/JavaScript/Guide/Data_structures#string_type) literal là không hoặc nhiều code point Unicode được đặt trong dấu nháy đơn hoặc kép. Code point Unicode cũng có thể được biểu diễn bằng chuỗi thoát. Tất cả code point đều có thể xuất hiện theo nghĩa đen trong string literal ngoại trừ các code point sau:

- U+005C \ (backslash)
- U+000D \<CR>
- U+000A \<LF>
- Loại dấu nháy bắt đầu string literal

Bất kỳ code point nào cũng có thể xuất hiện dưới dạng chuỗi thoát. String literal ước lượng thành giá trị ECMAScript String. Khi tạo ra các giá trị String này, code point Unicode được mã hóa UTF-16.

```js-nolint
'foo'
"bar"
```

Các phần con sau đây mô tả các chuỗi thoát khác nhau (`\` theo sau là một hoặc nhiều ký tự) có sẵn trong string literal. Bất kỳ chuỗi thoát nào không được liệt kê bên dưới trở thành "identity escape" — trở thành chính code point đó. Ví dụ, `\z` giống như `z`. Có cú pháp chuỗi thoát bát phân kế thừa được mô tả trong trang [Deprecated and obsolete features](/en-US/docs/Web/JavaScript/Reference/Deprecated_and_obsolete_features#escape_sequences). Nhiều chuỗi thoát này cũng hợp lệ trong biểu thức chính quy — xem [Character escape](/en-US/docs/Web/JavaScript/Reference/Regular_expressions/Character_escape).

#### Chuỗi thoát

Các ký tự đặc biệt có thể được mã hóa bằng chuỗi thoát:

| Escape sequence                                        | Unicode code point                           |
| ------------------------------------------------------ | -------------------------------------------- |
| `\0`                                                   | null character (U+0000 NULL)                 |
| `\'`                                                   | single quote (U+0027 APOSTROPHE)             |
| `\"`                                                   | double quote (U+0022 QUOTATION MARK)         |
| `\\`                                                   | backslash (U+005C REVERSE SOLIDUS)           |
| `\n`                                                   | newline (U+000A LINE FEED; LF)               |
| `\r`                                                   | carriage return (U+000D CARRIAGE RETURN; CR) |
| `\v`                                                   | vertical tab (U+000B LINE TABULATION)        |
| `\t`                                                   | tab (U+0009 CHARACTER TABULATION)            |
| `\b`                                                   | backspace (U+0008 BACKSPACE)                 |
| `\f`                                                   | form feed (U+000C FORM FEED)                 |
| `\` followed by a [line terminator](#line_terminators) | empty string                                 |

Chuỗi thoát cuối cùng, `\` theo sau là ký tự kết thúc dòng, hữu ích để chia string literal qua nhiều dòng mà không thay đổi ý nghĩa của nó.

```js
const longString =
  "This is a very long string which needs \
to wrap across multiple lines because \
otherwise my code is unreadable.";
```

Hãy đảm bảo không có khoảng trắng hoặc bất kỳ ký tự nào khác sau dấu gạch chéo ngược (ngoại trừ dấu ngắt dòng), nếu không sẽ không hoạt động. Nếu dòng tiếp theo được thụt vào, các khoảng trắng thêm cũng sẽ có trong giá trị chuỗi.

Bạn cũng có thể dùng toán tử [`+`](/en-US/docs/Web/JavaScript/Reference/Operators/Addition) để nối nhiều chuỗi lại với nhau, như thế này:

```js
const longString =
  "This is a very long string which needs " +
  "to wrap across multiple lines because " +
  "otherwise my code is unreadable.";
```

Cả hai phương pháp trên đều tạo ra các chuỗi giống hệt nhau.

#### Chuỗi thoát hexadecimal

Chuỗi thoát hexadecimal bao gồm `\x` theo sau là chính xác hai chữ số thập lục phân biểu diễn một code unit hoặc code point trong phạm vi 0x0000 đến 0x00FF.

```js
"\xA9"; // "©"
```

#### Chuỗi thoát Unicode

Chuỗi thoát Unicode bao gồm chính xác bốn chữ số thập lục phân theo sau `\u`. Nó biểu diễn một code unit trong mã hóa UTF-16. Đối với các code point U+0000 đến U+FFFF, code unit bằng code point. Code point U+10000 đến U+10FFFF yêu cầu hai chuỗi thoát biểu diễn hai code unit (cặp surrogate) được dùng để mã hóa ký tự; cặp surrogate phân biệt với code point.

Xem thêm {{jsxref("String.fromCharCode()")}} và {{jsxref("String.prototype.charCodeAt()")}}.

```js
"\u00A9"; // "©" (U+A9)
```

#### Chuỗi thoát code point Unicode

Chuỗi thoát code point Unicode bao gồm `\u{`, theo sau là code point trong cơ số thập lục phân, theo sau là `}`. Giá trị của các chữ số thập lục phân phải nằm trong phạm vi 0 đến 0x10FFFF bao gồm hai đầu. Code point trong phạm vi U+10000 đến U+10FFFF không cần được biểu diễn như cặp surrogate.

Xem thêm {{jsxref("String.fromCodePoint()")}} và {{jsxref("String.prototype.codePointAt()")}}.

```js
"\u{2F804}"; // CJK COMPATIBILITY IDEOGRAPH-2F804 (U+2F804)

// the same character represented as a surrogate pair
"\uD87E\uDC04";
```

### Regular expression literals

Regular expression literal được đặt trong hai dấu gạch chéo (`/`). Lexer tiêu thụ tất cả các ký tự cho đến dấu gạch chéo không được thoát tiếp theo hoặc cuối dòng, trừ khi dấu gạch chéo xuất hiện trong lớp ký tự (`[]`). Một số ký tự (cụ thể là những ký tự là [phần của định danh](#identifiers)) có thể xuất hiện sau dấu gạch chéo đóng, biểu thị các flag.

Ngữ pháp từ vựng rất dễ tính: không phải tất cả regular expression literal được xác định là một token đều là biểu thức chính quy hợp lệ.

Xem thêm {{jsxref("RegExp")}} để biết thêm thông tin.

```js
/ab+c/g;
/[/]/;
```

Regular expression literal không thể bắt đầu bằng hai dấu gạch chéo (`//`), vì điều đó sẽ là chú thích dòng. Để chỉ định biểu thức chính quy rỗng, hãy dùng `/(?:)/`.

### Template literals

Một template literal bao gồm nhiều token: `` `xxx${ `` (template head), `}xxx${` (template middle) và `` }xxx` `` (template tail) là các token riêng lẻ, trong khi bất kỳ biểu thức nào cũng có thể xuất hiện giữa chúng.

Xem thêm [template literals](/en-US/docs/Web/JavaScript/Reference/Template_literals) để biết thêm thông tin.

```js
`string text`;

`string text line 1
 string text line 2`;

`string text ${expression} string text`;

tag`string text ${expression} string text`;
```

## Chèn dấu chấm phẩy tự động

Định nghĩa cú pháp của một số [câu lệnh JavaScript](/en-US/docs/Web/JavaScript/Reference/Statements) yêu cầu dấu chấm phẩy (`;`) ở cuối. Chúng bao gồm:

- [`var`](/en-US/docs/Web/JavaScript/Reference/Statements/var), [`let`](/en-US/docs/Web/JavaScript/Reference/Statements/let), [`const`](/en-US/docs/Web/JavaScript/Reference/Statements/const), [`using`](/en-US/docs/Web/JavaScript/Reference/Statements/using), [`await using`](/en-US/docs/Web/JavaScript/Reference/Statements/await_using)
- [Expression statements](/en-US/docs/Web/JavaScript/Reference/Statements/Expression_statement)
- [`do...while`](/en-US/docs/Web/JavaScript/Reference/Statements/do...while)
- [`continue`](/en-US/docs/Web/JavaScript/Reference/Statements/continue), [`break`](/en-US/docs/Web/JavaScript/Reference/Statements/break), [`return`](/en-US/docs/Web/JavaScript/Reference/Statements/return), [`throw`](/en-US/docs/Web/JavaScript/Reference/Statements/throw)
- [`debugger`](/en-US/docs/Web/JavaScript/Reference/Statements/debugger)
- Class field declarations ([public](/en-US/docs/Web/JavaScript/Reference/Classes/Public_class_fields) or [private](/en-US/docs/Web/JavaScript/Reference/Classes/Private_elements))
- [`import`](/en-US/docs/Web/JavaScript/Reference/Statements/import), [`export`](/en-US/docs/Web/JavaScript/Reference/Statements/export)

Tuy nhiên, để làm cho ngôn ngữ dễ tiếp cận và thuận tiện hơn, JavaScript có khả năng tự động chèn dấu chấm phẩy khi xử lý luồng token, để một số chuỗi token không hợp lệ có thể được "sửa" thành cú pháp hợp lệ. Bước này xảy ra sau khi văn bản chương trình đã được phân tích cú pháp thành token theo ngữ pháp từ vựng. Có ba trường hợp dấu chấm phẩy được tự động chèn:

1\. Khi gặp token không được phép theo ngữ pháp, và nó được tách khỏi token trước đó bởi ít nhất một [ký tự kết thúc dòng](#line_terminators) (bao gồm chú thích khối chứa ít nhất một ký tự kết thúc dòng), hoặc token là "}", thì dấu chấm phẩy được chèn trước token.

```js-nolint
{ 1
2 } 3

// is transformed by ASI into:

{ 1
;2 ;} 3;

// Which is valid grammar encoding three statements,
// each consisting of a number literal
```

Dấu ")" kết thúc của [`do...while`](/en-US/docs/Web/JavaScript/Reference/Statements/do...while) cũng được xử lý như một trường hợp đặc biệt theo quy tắc này.

```js-nolint
do {
  // …
} while (condition) /* ; */ // ASI here
const a = 1
```

Tuy nhiên, dấu chấm phẩy không được chèn nếu dấu chấm phẩy đó sẽ trở thành dấu phân cách trong header của câu lệnh [`for`](/en-US/docs/Web/JavaScript/Reference/Statements/for).

```js-nolint example-bad
for (
  let a = 1 // No ASI here
  a < 10 // No ASI here
  a++
) {}
```

Dấu chấm phẩy cũng không bao giờ được chèn như [empty statement](/en-US/docs/Web/JavaScript/Reference/Statements/Empty). Ví dụ, trong mã bên dưới, nếu dấu chấm phẩy được chèn sau ")", thì mã sẽ hợp lệ, với một empty statement là thân của `if` và khai báo `const` là câu lệnh riêng biệt. Tuy nhiên, vì dấu chấm phẩy được chèn tự động không thể trở thành empty statement, điều này gây ra lỗi khi một [khai báo](/en-US/docs/Web/JavaScript/Reference/Statements#difference_between_statements_and_declarations) trở thành thân của câu lệnh `if`, điều này không hợp lệ.

```js-nolint example-bad
if (Math.random() > 0.5)
const x = 1 // SyntaxError: Unexpected token 'const'
```

2\. Khi đạt đến cuối luồng token đầu vào và parser không thể phân tích cú pháp luồng đầu vào đơn lẻ như một chương trình hoàn chỉnh, dấu chấm phẩy được chèn ở cuối.

```js-nolint
const a = 1 /* ; */ // ASI here
```

Quy tắc này bổ sung cho quy tắc trước, đặc biệt cho trường hợp không có "token vi phạm" nhưng đã đạt đến cuối luồng đầu vào.

3\. Khi ngữ pháp cấm ký tự kết thúc dòng ở một số chỗ nhưng tìm thấy ký tự kết thúc dòng, dấu chấm phẩy được chèn. Những chỗ này bao gồm:

- `expr <here> ++`, `expr <here> --`
- `continue <here> lbl`
- `break <here> lbl`
- `return <here> expr`
- `throw <here> expr`
- `yield <here> expr`
- `yield <here> * expr`
- `(param) <here> => {}`
- `async <here> function`, `async <here> prop()`, `async <here> function*`, `async <here> *prop()`, `async <here> (param) <here> => {}`
- `using <here> id`, `await <here> using <here> id`

Ở đây [`++`](/en-US/docs/Web/JavaScript/Reference/Operators/Increment) không được coi là toán tử postfix áp dụng cho biến `b`, vì ký tự kết thúc dòng xuất hiện giữa `b` và `++`.

```js-nolint
a = b
++c

// is transformed by ASI into

a = b;
++c;
```

Ở đây, câu lệnh `return` trả về `undefined`, và `a + b` trở thành câu lệnh không thể truy cập.

```js-nolint
return
a + b

// is transformed by ASI into

return;
a + b;
```

Lưu ý rằng ASI chỉ được kích hoạt nếu một dấu ngắt dòng tách các token mà nếu không sẽ tạo ra cú pháp không hợp lệ. Nếu token tiếp theo có thể được phân tích cú pháp như một phần của cấu trúc hợp lệ, dấu chấm phẩy sẽ không được chèn. Ví dụ:

```js-nolint example-bad
const a = 1
(1).toString()

const b = 1
[1, 2, 3].forEach(console.log)
```

Vì `()` có thể được xem là lời gọi hàm, nó thường không kích hoạt ASI. Tương tự, `[]` có thể là truy cập thành viên. Mã trên tương đương với:

```js-nolint example-bad
const a = 1(1).toString();

const b = 1[1, 2, 3].forEach(console.log);
```

Điều này là cú pháp hợp lệ. `1[1, 2, 3]` là [property accessor](/en-US/docs/Web/JavaScript/Reference/Operators/Property_accessors) với biểu thức kết hợp [comma](/en-US/docs/Web/JavaScript/Reference/Operators/Comma_operator). Do đó, bạn sẽ nhận được lỗi như "1 is not a function" và "Cannot read properties of undefined (reading 'forEach')" khi chạy mã.

Trong các lớp, class field và generator method cũng có thể là bẫy.

```js-nolint example-bad
class A {
  a = 1
  *gen() {}
}
```

Nó được hiểu là:

```js-nolint example-bad
class A {
  a = 1 * gen() {}
}
```

Và do đó sẽ là lỗi cú pháp xung quanh `{`.

Dưới đây là các quy tắc chung để xử lý ASI, nếu bạn muốn áp dụng kiểu không dùng dấu chấm phẩy:

- Viết postfix `++` và `--` trên cùng dòng với toán hạng của chúng.

  ```js-nolint example-bad
  const a = b
  ++
  console.log(a) // ReferenceError: Invalid left-hand side expression in prefix operation
  ```

  ```js-nolint example-good
  const a = b++
  console.log(a)
  ```

- Biểu thức sau `return`, `throw` hoặc `yield` phải nằm trên cùng dòng với từ khóa.

  ```js-nolint example-bad
  function foo() {
    return
      1 + 1 // Returns undefined; 1 + 1 is ignored
  }
  ```

  ```js-nolint example-good
  function foo() {
    return 1 + 1
  }

  function foo() {
    return (
      1 + 1
    )
  }
  ```

- Tương tự, định danh nhãn sau `break` hoặc `continue` phải nằm trên cùng dòng với từ khóa.

  ```js-nolint example-bad
  outerBlock: {
    innerBlock: {
      break
        outerBlock // SyntaxError: Illegal break statement
    }
  }
  ```

  ```js-nolint example-good
  outerBlock: {
    innerBlock: {
      break outerBlock
    }
  }
  ```

- Dấu `=>` của arrow function phải nằm trên cùng dòng với cuối phần tham số.

  ```js-nolint example-bad
  const foo = (a, b)
    => a + b
  ```

  ```js-nolint example-good
  const foo = (a, b) =>
    a + b
  ```

- Từ `async` của hàm async, phương thức, v.v. không thể ngay sau đó là ký tự kết thúc dòng.

  ```js-nolint example-bad
  async
  function foo() {}
  ```

  ```js-nolint example-good
  async function
  foo() {}
  ```

- Từ khóa `using` trong câu lệnh `using` và `await using` phải nằm trên cùng dòng với định danh đầu tiên nó khai báo.

  ```js-nolint example-bad
  using
  resource = acquireResource()
  ```

  ```js-nolint example-good
  using resource
    = acquireResource()
  ```

- Nếu một dòng bắt đầu bằng một trong `(`, `[`, `` ` ``, `+`, `-`, `/` (như trong regex literal), hãy đặt dấu chấm phẩy trước nó, hoặc kết thúc dòng trước bằng dấu chấm phẩy.

  ```js-nolint example-bad
  // The () may be merged with the previous line as a function call
  (() => {
    // …
  })()

  // The [ may be merged with the previous line as a property access
  [1, 2, 3].forEach(console.log)

  // The ` may be merged with the previous line as a tagged template literal
  `string text ${data}`.match(pattern).forEach(console.log)

  // The + may be merged with the previous line as a binary + expression
  +a.toString()

  // The - may be merged with the previous line as a binary - expression
  -a.toString()

  // The / may be merged with the previous line as a division expression
  /pattern/.exec(str).forEach(console.log)
  ```

  ```js-nolint example-good
  ;(() => {
    // …
  })()
  ;[1, 2, 3].forEach(console.log)
  ;`string text ${data}`.match(pattern).forEach(console.log)
  ;+a.toString()
  ;-a.toString()
  ;/pattern/.exec(str).forEach(console.log)
  ```

- Class field nên luôn kết thúc bằng dấu chấm phẩy — ngoài quy tắc trước (bao gồm khai báo field theo sau là [computed property](/en-US/docs/Web/JavaScript/Reference/Operators/Object_initializer#computed_property_names), vì cái sau bắt đầu bằng `[`), dấu chấm phẩy cũng bắt buộc giữa khai báo field và generator method.

  ```js-nolint example-bad
  class A {
    a = 1
    [b] = 2
    *gen() {} // Seen as a = 1[b] = 2 * gen() {}
  }
  ```

  ```js-nolint example-good
  class A {
    a = 1;
    [b] = 2;
    *gen() {}
  }
  ```

## Specifications

{{Specifications}}

## Browser compatibility

{{Compat}}

## See also

- [Grammar and types](/en-US/docs/Web/JavaScript/Guide/Grammar_and_types) guide
- [Micro-feature from ES6, now in Firefox Aurora and Nightly: binary and octal numbers](https://whereswalden.com/2013/08/12/micro-feature-from-es6-now-in-firefox-aurora-and-nightly-binary-and-octal-numbers/) by Jeff Walden (2013)
