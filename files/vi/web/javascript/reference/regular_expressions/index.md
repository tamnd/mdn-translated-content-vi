---
title: Regular expressions
slug: Web/JavaScript/Reference/Regular_expressions
page-type: landing-page
browser-compat: javascript.regular_expressions
sidebar: jssidebar
---

Một **regular expression** (viết tắt là _regex_) cho phép các nhà phát triển khớp chuỗi với một pattern, trích xuất thông tin khớp con, hoặc đơn giản là kiểm tra xem chuỗi có tuân theo pattern đó không. Regular expressions được sử dụng trong nhiều ngôn ngữ lập trình, và cú pháp của JavaScript được lấy cảm hứng từ [Perl](https://www.perl.org/).

Bạn được khuyến khích đọc [hướng dẫn về regular expressions](/en-US/docs/Web/JavaScript/Guide/Regular_expressions) để có cái nhìn tổng quan về các cú pháp regex có sẵn và cách chúng hoạt động.

## Mô tả

[_Regular expressions_](https://en.wikipedia.org/wiki/Regular_expression) là một khái niệm quan trọng trong lý thuyết ngôn ngữ hình thức. Chúng là cách mô tả một tập hợp có thể vô hạn các chuỗi ký tự (gọi là một _ngôn ngữ_). Về cơ bản, một regular expression cần các tính năng sau:

- Một tập hợp _ký tự_ có thể sử dụng trong ngôn ngữ, gọi là _bảng chữ cái_.
- _Nối chuỗi_: `ab` có nghĩa là "ký tự `a` theo sau là ký tự `b`".
- _Hợp_: `a|b` có nghĩa là "`a` hoặc `b`".
- _Kleene star_: `a*` có nghĩa là "không hoặc nhiều ký tự `a`".

Giả sử một bảng chữ cái hữu hạn (chẳng hạn như 26 chữ cái của bảng chữ cái tiếng Anh, hoặc toàn bộ bộ ký tự Unicode), tất cả các ngôn ngữ chính quy có thể được tạo ra bởi các tính năng trên. Tất nhiên, nhiều pattern rất tẻ nhạt khi biểu diễn theo cách này (chẳng hạn như "10 chữ số" hoặc "một ký tự không phải dấu cách"), vì vậy JavaScript regular expressions bao gồm nhiều cú pháp rút gọn, được giới thiệu bên dưới.

> [!NOTE]
> JavaScript regular expressions thực tế không chính quy, do sự tồn tại của [backreferences](/en-US/docs/Web/JavaScript/Reference/Regular_expressions/Backreference) (regular expressions phải có số trạng thái hữu hạn). Tuy nhiên, chúng vẫn là một tính năng rất hữu ích.

### Tạo regular expressions

Một regular expression thường được tạo dưới dạng literal bằng cách bao quanh một pattern trong các dấu gạch chéo (`/`):

```js
const regex1 = /ab+c/g;
```

Regular expressions cũng có thể được tạo với constructor {{jsxref("RegExp/RegExp", "RegExp()")}}:

```js
const regex2 = new RegExp("ab+c", "g");
```

Chúng không có sự khác biệt về thời gian chạy, mặc dù chúng có thể có ảnh hưởng đến hiệu suất, khả năng phân tích tĩnh, và các vấn đề ergonomic khi soạn thảo với việc thoát ký tự. Để biết thêm thông tin, xem tài liệu tham chiếu [`RegExp`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/RegExp#literal_notation_and_constructor).

### Flags của Regex

Flags là các tham số đặc biệt có thể thay đổi cách một regular expression được diễn giải hoặc cách nó tương tác với văn bản đầu vào. Mỗi flag tương ứng với một thuộc tính accessor trên đối tượng `RegExp`.

| Flag | Mô tả                                                                           | Thuộc tính tương ứng                            |
| ---- | ------------------------------------------------------------------------------- | ----------------------------------------------- |
| `d`  | Tạo chỉ số cho các kết quả khớp chuỗi con.                                      | {{jsxref("RegExp/hasIndices", "hasIndices")}}   |
| `g`  | Tìm kiếm toàn cục.                                                              | {{jsxref("RegExp/global", "global")}}           |
| `i`  | Tìm kiếm không phân biệt hoa/thường.                                            | {{jsxref("RegExp/ignoreCase", "ignoreCase")}}   |
| `m`  | Làm cho `^` và `$` khớp với đầu và cuối của mỗi dòng thay vì của toàn bộ chuỗi. | {{jsxref("RegExp/multiline", "multiline")}}     |
| `s`  | Cho phép `.` khớp với ký tự xuống dòng.                                         | {{jsxref("RegExp/dotAll", "dotAll")}}           |
| `u`  | "Unicode"; xử lý một pattern như một chuỗi các code point Unicode.              | {{jsxref("RegExp/unicode", "unicode")}}         |
| `v`  | Nâng cấp lên chế độ `u` với nhiều tính năng Unicode hơn.                        | {{jsxref("RegExp/unicodeSets", "unicodeSets")}} |
| `y`  | Thực hiện tìm kiếm "sticky" khớp bắt đầu từ vị trí hiện tại trong chuỗi đích.   | {{jsxref("RegExp/sticky", "sticky")}}           |

Các flags `i`, `m`, và `s` có thể được bật hoặc tắt cho các phần cụ thể của regex bằng cú pháp [modifier](/en-US/docs/Web/JavaScript/Reference/Regular_expressions/Modifier).

Các phần bên dưới liệt kê tất cả các cú pháp regex có sẵn, được nhóm theo bản chất cú pháp của chúng.

### Assertions

Assertions là các cấu trúc kiểm tra xem chuỗi có đáp ứng một điều kiện nhất định tại vị trí được chỉ định hay không, nhưng không tiêu thụ ký tự. Assertions không thể được [lượng hóa](/en-US/docs/Web/JavaScript/Reference/Regular_expressions/Quantifier).

- [Input boundary assertion: `^`, `$`](/en-US/docs/Web/JavaScript/Reference/Regular_expressions/Input_boundary_assertion)
  - : Xác nhận rằng vị trí hiện tại là đầu hoặc cuối đầu vào, hoặc đầu hoặc cuối dòng nếu flag `m` được đặt.
- [Lookahead assertion: `(?=...)`, `(?!...)`](/en-US/docs/Web/JavaScript/Reference/Regular_expressions/Lookahead_assertion)
  - : Xác nhận rằng vị trí hiện tại được theo sau hoặc không được theo sau bởi một pattern nhất định.
- [Lookbehind assertion: `(?<=...)`, `(?<!...)`](/en-US/docs/Web/JavaScript/Reference/Regular_expressions/Lookbehind_assertion)
  - : Xác nhận rằng vị trí hiện tại được đứng trước hoặc không được đứng trước bởi một pattern nhất định.
- [Word boundary assertion: `\b`, `\B`](/en-US/docs/Web/JavaScript/Reference/Regular_expressions/Word_boundary_assertion)
  - : Xác nhận rằng vị trí hiện tại là ranh giới từ.

### Atoms

Atoms là các đơn vị cơ bản nhất của một regular expression. Mỗi atom _tiêu thụ_ một hoặc nhiều ký tự trong chuỗi, và hoặc là thất bại trong việc khớp hoặc cho phép pattern tiếp tục khớp với atom tiếp theo.

- [Backreference: `\1`, `\2`](/en-US/docs/Web/JavaScript/Reference/Regular_expressions/Backreference)
  - : Khớp một subpattern đã khớp trước đó được ghi lại bởi một capturing group.
- [Capturing group: `(...)`](/en-US/docs/Web/JavaScript/Reference/Regular_expressions/Capturing_group)
  - : Khớp một subpattern và ghi nhớ thông tin về kết quả khớp.
- [Character class: `[...]`, `[^...]`](/en-US/docs/Web/JavaScript/Reference/Regular_expressions/Character_class)
  - : Khớp bất kỳ ký tự nào trong hoặc không trong một tập hợp ký tự. Khi flag [`v`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/RegExp/unicodeSets) được bật, nó cũng có thể được sử dụng để khớp các chuỗi có độ dài hữu hạn.
- [Character class escape: `\d`, `\D`, `\w`, `\W`, `\s`, `\S`](/en-US/docs/Web/JavaScript/Reference/Regular_expressions/Character_class_escape)
  - : Khớp bất kỳ ký tự nào trong hoặc không trong một tập hợp ký tự được định nghĩa sẵn.
- [Character escape: `\n`, `\u{...}`](/en-US/docs/Web/JavaScript/Reference/Regular_expressions/Character_escape)
  - : Khớp một ký tự mà có thể không thể biểu diễn thuận tiện ở dạng literal của nó.
- [Literal character: `a`, `b`](/en-US/docs/Web/JavaScript/Reference/Regular_expressions/Literal_character)
  - : Khớp một ký tự cụ thể.
- [Modifier: `(?ims-ims:...)`](/en-US/docs/Web/JavaScript/Reference/Regular_expressions/Modifier)
  - : Ghi đè các cài đặt flag trong một phần cụ thể của regular expression.
- [Named backreference: `\k<name>`](/en-US/docs/Web/JavaScript/Reference/Regular_expressions/Named_backreference)
  - : Khớp một subpattern đã khớp trước đó được ghi lại bởi một named capturing group.
- [Named capturing group: `(?<name>...)`](/en-US/docs/Web/JavaScript/Reference/Regular_expressions/Named_capturing_group)
  - : Khớp một subpattern và ghi nhớ thông tin về kết quả khớp. Nhóm có thể được xác định sau này bằng tên tùy chỉnh thay vì chỉ số của nó trong pattern.
- [Non-capturing group: `(?:...)`](/en-US/docs/Web/JavaScript/Reference/Regular_expressions/Non-capturing_group)
  - : Khớp một subpattern mà không ghi nhớ thông tin về kết quả khớp.
- [Unicode character class escape: `\p{...}`, `\P{...}`](/en-US/docs/Web/JavaScript/Reference/Regular_expressions/Unicode_character_class_escape)
  - : Khớp một tập hợp ký tự được chỉ định bởi một thuộc tính Unicode. Khi flag [`v`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/RegExp/unicodeSets) được bật, nó cũng có thể được sử dụng để khớp các chuỗi có độ dài hữu hạn.
- [Wildcard: `.`](/en-US/docs/Web/JavaScript/Reference/Regular_expressions/Wildcard)
  - : Khớp bất kỳ ký tự nào ngoại trừ ký tự kết thúc dòng, trừ khi flag `s` được đặt.

### Các tính năng khác

Các tính năng này không chỉ định bất kỳ pattern nào, nhưng được sử dụng để kết hợp các pattern.

- [Disjunction: `|`](/en-US/docs/Web/JavaScript/Reference/Regular_expressions/Disjunction)
  - : Khớp bất kỳ chuỗi thay thế nào được phân tách bởi ký tự `|`.
- [Quantifier: `*`, `+`, `?`, `{n}`, `{n,}`, `{n,m}`](/en-US/docs/Web/JavaScript/Reference/Regular_expressions/Quantifier)
  - : Khớp một atom một số lần nhất định.

### Escape sequences

_Escape sequences_ trong regexes đề cập đến bất kỳ loại cú pháp nào được tạo thành bởi `\` theo sau là một hoặc nhiều ký tự. Chúng có thể phục vụ các mục đích rất khác nhau tùy thuộc vào những gì theo sau `\`. Dưới đây là danh sách tất cả các "escape sequences" hợp lệ:

| Escape sequence | Theo sau                                                                   | Ý nghĩa                                                                                                      |
| --------------- | -------------------------------------------------------------------------- | ------------------------------------------------------------------------------------------------------------ |
| `\B`            | Không có                                                                   | [Assertion không phải ranh giới từ][WBA]                                                                     |
| `\D`            | Không có                                                                   | [Character class escape][CCE] đại diện cho các ký tự không phải chữ số                                       |
| `\P`            | `{`, thuộc tính Unicode và/hoặc giá trị, sau đó `}`                        | [Unicode character class escape][UCCE] đại diện cho các ký tự không có thuộc tính Unicode được chỉ định      |
| `\S`            | Không có                                                                   | [Character class escape][CCE] đại diện cho các ký tự không phải khoảng trắng                                 |
| `\W`            | Không có                                                                   | [Character class escape][CCE] đại diện cho các ký tự không phải ký tự từ                                     |
| `\b`            | Không có                                                                   | [Word boundary assertion][WBA]; bên trong [character classes][CC], đại diện cho U+0008 (BACKSPACE)           |
| `\c`            | Một chữ cái từ `A` đến `Z` hoặc `a` đến `z`                                | Một [character escape][CE] đại diện cho ký tự điều khiển có giá trị bằng giá trị ký tự của chữ cái modulo 32 |
| `\d`            | Không có                                                                   | [Character class escape][CCE] đại diện cho các ký tự chữ số (`0` đến `9`)                                    |
| `\f`            | Không có                                                                   | [Character escape][CE] đại diện cho U+000C (FORM FEED)                                                       |
| `\k`            | `<`, một định danh, sau đó `>`                                             | Một [named backreference][NBR]                                                                               |
| `\n`            | Không có                                                                   | [Character escape][CE] đại diện cho U+000A (LINE FEED)                                                       |
| `\p`            | `{`, thuộc tính Unicode và/hoặc giá trị, sau đó `}`                        | [Unicode character class escape][UCCE] đại diện cho các ký tự có thuộc tính Unicode được chỉ định            |
| `\q`            | `{`, một chuỗi, sau đó `}`                                                 | Chỉ hợp lệ bên trong [`v`-mode character classes][VCC]; đại diện cho chuỗi cần khớp theo nghĩa đen           |
| `\r`            | Không có                                                                   | [Character escape][CE] đại diện cho U+000D (CARRIAGE RETURN)                                                 |
| `\s`            | Không có                                                                   | [Character class escape][CCE] đại diện cho các ký tự khoảng trắng                                            |
| `\t`            | Không có                                                                   | [Character escape][CE] đại diện cho U+0009 (CHARACTER TABULATION)                                            |
| `\u`            | 4 chữ số thập lục phân; hoặc `{`, 1 đến 6 chữ số thập lục phân, sau đó `}` | [Character escape][CE] đại diện cho ký tự có code point đã cho                                               |
| `\v`            | Không có                                                                   | [Character escape][CE] đại diện cho U+000B (LINE TABULATION)                                                 |
| `\w`            | Không có                                                                   | [Character class escape][CCE] đại diện cho các ký tự từ (`A` đến `Z`, `a` đến `z`, `0` đến `9`, `_`)         |
| `\x`            | 2 chữ số thập lục phân                                                     | [Character escape][CE] đại diện cho ký tự có giá trị đã cho                                                  |
| `\0`            | Không có                                                                   | [Character escape][CE] đại diện cho U+0000 (NULL)                                                            |

[CC]: /en-US/docs/Web/JavaScript/Reference/Regular_expressions/Character_class
[CCE]: /en-US/docs/Web/JavaScript/Reference/Regular_expressions/Character_class_escape
[CE]: /en-US/docs/Web/JavaScript/Reference/Regular_expressions/Character_escape
[NBR]: /en-US/docs/Web/JavaScript/Reference/Regular_expressions/Named_backreference
[UCCE]: /en-US/docs/Web/JavaScript/Reference/Regular_expressions/Unicode_character_class_escape
[VCC]: /en-US/docs/Web/JavaScript/Reference/Regular_expressions/Character_class#v-mode_character_class
[WBA]: /en-US/docs/Web/JavaScript/Reference/Regular_expressions/Word_boundary_assertion

`\` theo sau là `0` và một chữ số khác trở thành [legacy octal escape sequence](/en-US/docs/Web/JavaScript/Reference/Deprecated_and_obsolete_features#escape_sequences), bị cấm trong [Unicode-aware mode](/en-US/docs/Web/JavaScript/Reference/Global_Objects/RegExp/unicode#unicode-aware_mode). `\` theo sau là bất kỳ chuỗi chữ số nào khác trở thành [backreference](/en-US/docs/Web/JavaScript/Reference/Regular_expressions/Backreference).

Ngoài ra, `\` có thể được theo sau bởi một số ký tự không phải chữ cái hay chữ số, trong trường hợp đó escape sequence luôn là [character escape](/en-US/docs/Web/JavaScript/Reference/Regular_expressions/Character_escape) đại diện cho ký tự được thoát:

<!-- Note: the {} need to be double-escaped, once for Yari -->

- `\$`, `\(`, `\)`, `\*`, `\+`, `\.`, `\/`, `\?`, `\[`, `\\`, `\]`, `\^`, `\\{`, `\|`, `\\}`: hợp lệ ở mọi nơi
- `\-`: chỉ hợp lệ bên trong [character classes](/en-US/docs/Web/JavaScript/Reference/Regular_expressions/Character_class)
- `\!`, `\#`, `\%`, `\&`, `\,`, `\:`, `\;`, `\<`, `\=`, `\>`, `\@`, `` \` ``, `\~`: chỉ hợp lệ bên trong [`v`-mode character classes](/en-US/docs/Web/JavaScript/Reference/Regular_expressions/Character_class#v-mode_character_class)

Các ký tự {{Glossary("ASCII")}} khác, cụ thể là ký tự dấu cách, `"`, `'`, `_`, và bất kỳ ký tự chữ cái nào không được đề cập ở trên, không phải là các escape sequences hợp lệ. Trong [Unicode-unaware mode](/en-US/docs/Web/JavaScript/Reference/Global_Objects/RegExp/unicode#unicode-aware_mode), các escape sequences không phải một trong số các trường hợp trên trở thành _identity escapes_: chúng đại diện cho ký tự theo sau dấu gạch chéo ngược. Ví dụ, `\a` đại diện cho ký tự `a`. Hành vi này giới hạn khả năng giới thiệu các escape sequences mới mà không gây ra các vấn đề tương thích ngược, và do đó bị cấm trong Unicode-aware mode.

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- Hướng dẫn [Regular expressions](/en-US/docs/Web/JavaScript/Guide/Regular_expressions)
- {{jsxref("RegExp")}}
