---
title: "Character class: [...], [^...]"
slug: Web/JavaScript/Reference/Regular_expressions/Character_class
page-type: javascript-language-feature
browser-compat: javascript.regular_expressions.character_class
sidebar: jssidebar
---

Một **character class** khớp bất kỳ ký tự nào trong hoặc không trong một tập hợp ký tự tùy chỉnh. Khi flag [`v`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/RegExp/unicodeSets) được bật, nó cũng có thể được sử dụng để khớp các chuỗi có độ dài hữu hạn.

## Cú pháp

```regex
[]
[abc]
[A-Z]

[^]
[^abc]
[^A-Z]

// Chỉ trong chế độ `v`
[operand1&&operand2]
[operand1--operand2]
[\q{substring}]
```

### Tham số

- `operand1`, `operand2`
  - : Có thể là một ký tự đơn lẻ, một character class được bao trong dấu ngoặc vuông khác, một [character class escape](/en-US/docs/Web/JavaScript/Reference/Regular_expressions/Character_class_escape), một [Unicode character class escape](/en-US/docs/Web/JavaScript/Reference/Regular_expressions/Unicode_character_class_escape), hoặc một chuỗi sử dụng cú pháp `\q`.
- `substring`
  - : Một chuỗi literal.

## Mô tả

Một character class chỉ định một danh sách ký tự giữa các dấu ngoặc vuông và khớp bất kỳ ký tự nào trong danh sách. Flag [`v`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/RegExp/unicodeSets) thay đổi đáng kể cách các character classes được phân tích và diễn giải. Các cú pháp sau có sẵn trong cả chế độ `v` và chế độ non-`v`:

- Một ký tự đơn lẻ: khớp chính ký tự đó.
- Một dải ký tự: khớp bất kỳ ký tự nào trong dải bao gồm hai đầu. Dải được chỉ định bởi hai ký tự được phân tách bởi dấu gạch ngang (`-`). Ký tự đầu tiên phải có giá trị ký tự nhỏ hơn ký tự thứ hai. _Giá trị ký tự_ là code point Unicode của ký tự. Vì các code point Unicode thường được gán cho các bảng chữ cái theo thứ tự, `[a-z]` chỉ định tất cả các ký tự Latin chữ thường, trong khi `[α-ω]` chỉ định tất cả các ký tự Hy Lạp chữ thường. Trong [Unicode-unaware mode](/en-US/docs/Web/JavaScript/Reference/Global_Objects/RegExp/unicode#unicode-aware_mode), regexes được diễn giải như một chuỗi các ký tự [BMP](/en-US/docs/Web/JavaScript/Reference/Global_Objects/String#utf-16_characters_unicode_code_points_and_grapheme_clusters). Do đó, các surrogate pairs trong character classes đại diện cho hai ký tự thay vì một; xem chi tiết bên dưới.
- Escape sequences: `\b`, `\-`, [character class escapes](/en-US/docs/Web/JavaScript/Reference/Regular_expressions/Character_class_escape), [Unicode character class escapes](/en-US/docs/Web/JavaScript/Reference/Regular_expressions/Unicode_character_class_escape), và các [character escapes](/en-US/docs/Web/JavaScript/Reference/Regular_expressions/Character_escape) khác.

Các cú pháp này có thể xuất hiện bất kỳ số lần nào, và các tập hợp ký tự chúng đại diện được hợp nhất. Ví dụ, `/[a-zA-Z0-9]/` khớp bất kỳ chữ cái hoặc chữ số nào.

Tiền tố `^` trong một character class tạo ra một _complement class_. Ví dụ, `[^abc]` khớp bất kỳ ký tự nào trừ `a`, `b`, hoặc `c`. Ký tự `^` là một ký tự literal khi nó xuất hiện ở giữa một character class — ví dụ, `[a^b]` khớp các ký tự `a`, `^`, và `b`.

[Ngữ pháp từ vựng](/en-US/docs/Web/JavaScript/Reference/Lexical_grammar#regular_expression_literals) thực hiện phân tích cú pháp rất thô của các regex literals, để nó không kết thúc regex literal tại một ký tự `/` xuất hiện trong một character class. Điều này có nghĩa là `/[/]/` hợp lệ mà không cần thoát `/`.

Ranh giới của một dải ký tự không được chỉ định nhiều hơn một ký tự, điều này xảy ra nếu bạn sử dụng [character class escape](/en-US/docs/Web/JavaScript/Reference/Regular_expressions/Character_class_escape). Ví dụ:

```js-nolint example-bad
/[\s-9]/u; // SyntaxError: Invalid regular expression: Invalid character class
```

Trong [Unicode-unaware mode](/en-US/docs/Web/JavaScript/Reference/Global_Objects/RegExp/unicode#unicode-aware_mode), các dải ký tự mà một ranh giới là một character class làm cho `-` trở thành ký tự literal. Đây là [cú pháp không dùng nữa để tương thích web](/en-US/docs/Web/JavaScript/Reference/Deprecated_and_obsolete_features#regexp), và bạn không nên dựa vào nó.

```js
/[\s-9]/.test("-"); // true
```

Trong [Unicode-unaware mode](/en-US/docs/Web/JavaScript/Reference/Global_Objects/RegExp/unicode#unicode-aware_mode), regexes được diễn giải như một chuỗi các ký tự BMP. Do đó, các surrogate pairs trong character classes đại diện cho hai ký tự thay vì một.

```js
/[😄]/.test("\ud83d"); // true
/[😄]/u.test("\ud83d"); // false

/[😄-😛]/.test("😑"); // SyntaxError: Invalid regular expression: /[😄-😛]/: Range out of order in character class
/[😄-😛]/u.test("😑"); // true
```

Ngay cả khi pattern [bỏ qua chữ hoa/thường](/en-US/docs/Web/JavaScript/Reference/Global_Objects/RegExp/ignoreCase), chữ hoa/thường của hai đầu của một dải quan trọng trong việc xác định các ký tự nào thuộc về dải. Ví dụ, pattern `/[E-F]/i` chỉ khớp `E`, `F`, `e`, và `f`, trong khi pattern `/[E-f]/i` khớp tất cả các chữ cái {{Glossary("ASCII")}} viết hoa và viết thường (vì nó trải dài qua `E–Z` và `a–f`), cũng như `[`, `\`, `]`, `^`, `_`, và `` ` ``.

### Character class chế độ non-v

Các character classes chế độ non-`v` diễn giải hầu hết các ký tự [theo nghĩa đen](/en-US/docs/Web/JavaScript/Reference/Regular_expressions/Literal_character) và có ít hạn chế hơn về các ký tự chúng có thể chứa. Ví dụ, `.` là ký tự chấm literal, không phải [wildcard](/en-US/docs/Web/JavaScript/Reference/Regular_expressions/Wildcard). Các ký tự duy nhất không thể xuất hiện theo nghĩa đen là `\`, `]`, và `-`.

- Trong character classes, hầu hết các escape sequences được hỗ trợ, ngoại trừ `\b`, `\B`, và [backreferences](/en-US/docs/Web/JavaScript/Reference/Regular_expressions/Backreference). `\b` chỉ ra một ký tự backspace thay vì [word boundary](/en-US/docs/Web/JavaScript/Reference/Regular_expressions/Word_boundary_assertion), trong khi hai ký tự kia gây ra lỗi cú pháp. Để sử dụng `\` theo nghĩa đen, hãy thoát nó như `\\`.
- Ký tự `]` chỉ ra sự kết thúc của character class. Để sử dụng nó theo nghĩa đen, hãy thoát nó như `\]`.
- Ký tự gạch ngang (`-`), khi được sử dụng giữa hai ký tự, chỉ ra một dải. Khi nó xuất hiện ở đầu hoặc cuối của một character class, nó là một ký tự literal. Nó cũng là ký tự literal khi nó được sử dụng ở ranh giới của một dải. Ví dụ, `[a-]` khớp các ký tự `a` và `-`, `[!--]` khớp các ký tự `!` đến `-`, và `[--9]` khớp các ký tự `-` đến `9`. Bạn cũng có thể thoát nó như `\-` nếu bạn muốn sử dụng nó theo nghĩa đen ở bất kỳ đâu.

### Character class chế độ v

Ý tưởng cơ bản của character classes trong chế độ `v` vẫn giữ nguyên: bạn vẫn có thể sử dụng hầu hết các ký tự theo nghĩa đen, sử dụng `-` để chỉ ra các dải ký tự, và sử dụng escape sequences. Một trong những tính năng quan trọng nhất của flag `v` là _ký hiệu tập hợp_ trong character classes. Như đã đề cập trước đây, các character classes bình thường có thể biểu diễn các hợp bằng cách nối hai dải, chẳng hạn như sử dụng `[A-Z0-9]` để có nghĩa là "hợp của tập hợp `[A-Z]` và tập hợp `[0-9]`". Tuy nhiên, không có cách dễ dàng nào để biểu diễn các phép toán khác với các tập hợp ký tự, chẳng hạn như giao và hiệu.

Với flag `v`, giao được biểu diễn bằng `&&`, và hiệu bằng `--`. Sự vắng mặt của cả hai ngụ ý hợp. Hai toán hạng của `&&` hoặc `--` có thể là một ký tự, character escape, character class escape, hoặc thậm chí là một character class khác. Ví dụ, để biểu diễn "một ký tự từ không phải là dấu gạch dưới", bạn có thể sử dụng `[\w--_]`. Bạn không thể trộn các toán tử ở cùng một cấp độ. Ví dụ, `[\w&&[A-z]--_]` là lỗi cú pháp. Tuy nhiên, vì bạn có thể lồng các character classes, bạn có thể rõ ràng bằng cách viết `[\w&&[[A-z]--_]]` hoặc `[[\w&&[A-z]]--_]` (cả hai đều có nghĩa là `[A-Za-z]`). Tương tự, `[AB--C]` không hợp lệ và bạn cần viết `[A[B--C]]` (chỉ có nghĩa là `[AB]`).

Trong chế độ `v`, [Unicode character class escape](/en-US/docs/Web/JavaScript/Reference/Regular_expressions/Unicode_character_class_escape) `\p` có thể khớp các chuỗi có độ dài hữu hạn, chẳng hạn như emojis. Để đối xứng, các character classes thông thường cũng có thể khớp nhiều hơn một ký tự. Để viết một "chuỗi literal" trong một character class, bạn bao bọc chuỗi trong `\q{...}`. Cú pháp regex duy nhất được hỗ trợ ở đây là [disjunction](/en-US/docs/Web/JavaScript/Reference/Regular_expressions/Disjunction) — ngoài điều này, `\q` phải bao hoàn toàn các literals (bao gồm các ký tự đã thoát). Điều này đảm bảo rằng các character classes chỉ có thể khớp các chuỗi có độ dài hữu hạn với các khả năng hữu hạn.

Vì cú pháp character class bây giờ phức tạp hơn, nhiều ký tự hơn được dành riêng và bị cấm xuất hiện theo nghĩa đen.

- Ngoài `]` và `\`, các ký tự sau phải được thoát trong character classes nếu chúng đại diện cho các ký tự literal: `(`, `)`, `[`, `{`, `}`, `/`, `-`, `|`. Danh sách này hơi giống với danh sách [ký tự cú pháp](/en-US/docs/Web/JavaScript/Reference/Regular_expressions/Literal_character), ngoại trừ `^`, `$`, `*`, `+`, và `?` không được dành riêng bên trong character classes, trong khi `/` và `-` không được dành riêng bên ngoài character classes (mặc dù `/` có thể phân giới một regex literal và do đó vẫn cần được thoát). Tất cả các ký tự này cũng có thể tùy chọn được thoát trong các character classes chế độ `u`.
- Các chuỗi "dấu câu kép" sau cũng phải được thoát (nhưng chúng không có nhiều ý nghĩa nếu không có flag `v`): `&&`, `!!`, `##`, `$$`, `%%`, `**`, `++`, `,,`, `..`, `::`, `;;`, `<<`, `==`, `>>`, `??`, `@@`, `^^`, ` `` `, `~~`. Trong chế độ `u`, một số ký tự này chỉ có thể xuất hiện theo nghĩa đen bên trong character classes và gây ra lỗi cú pháp khi được thoát. Trong chế độ `v`, chúng phải được thoát khi xuất hiện theo cặp, nhưng có thể tùy chọn được thoát khi xuất hiện đơn lẻ. Tài liệu tham chiếu [literal character](/en-US/docs/Web/JavaScript/Reference/Regular_expressions/Literal_character) có bảng chi tiết về những ký tự nào có thể xuất hiện đã thoát hoặc chưa thoát.

Complement character classes `[^...]` có thể không thể khớp các chuỗi dài hơn một ký tự. Ví dụ, `[\q{ab|c}]` hợp lệ và khớp chuỗi `"ab"`, nhưng `[^\q{ab|c}]` không hợp lệ vì không rõ bao nhiêu ký tự sẽ được tiêu thụ. Việc kiểm tra được thực hiện bằng cách kiểm tra xem tất cả `\q` có chứa các ký tự đơn lẻ và tất cả `\p` chỉ định các thuộc tính ký tự — đối với các hợp, tất cả các toán hạng phải thuần túy là ký tự; đối với các giao, ít nhất một toán hạng phải thuần túy là ký tự; đối với phép hiệu, toán hạng ngoài cùng bên trái phải thuần túy là ký tự. Việc kiểm tra là cú pháp mà không xem xét tập hợp ký tự thực tế được chỉ định, có nghĩa là mặc dù `/[^\q{ab|c}--\q{ab}]/v` tương đương với `/[^c]/v`, nhưng nó vẫn bị từ chối.

### Complement classes và khớp không phân biệt hoa/thường

Khớp [không phân biệt hoa/thường](/en-US/docs/Web/JavaScript/Reference/Global_Objects/RegExp/ignoreCase) hoạt động bằng cách fold chữ hoa/thường cả tập hợp ký tự mong đợi và chuỗi được khớp. Khi chỉ định complement classes, thứ tự mà JavaScript thực hiện case-folding và bổ sung là quan trọng. Tóm lại, `[^...]` trong chế độ `u` khớp `allCharacters - caseFold(original)`, trong khi trong chế độ `v` khớp `caseFold(allCharacters) - caseFold(original)`. Điều này đảm bảo rằng tất cả các cú pháp complement class, bao gồm `[^...]`, `\P`, `\W`, v.v., triệt tiêu nhau.

Xem xét hai regexes sau (để đơn giản hóa, hãy giả sử rằng các ký tự Unicode là một trong ba loại: chữ thường, chữ hoa, và không phân biệt hoa/thường, và mỗi chữ hoa có một đối tác chữ thường duy nhất, và ngược lại):

```js
const r1 = /\p{Lowercase_Letter}/iu;
const r2 = /[^\P{Lowercase_Letter}]/iu;
```

`r2` là phủ định kép và có vẻ tương đương với `r1`. Nhưng thực tế, `r1` khớp tất cả các chữ cái ASCII viết hoa và viết thường, trong khi `r2` không khớp gì cả. Đây là giải thích từng bước:

- Trong `r1`, `\p{Lowercase_Letter}` xây dựng một tập hợp tất cả các ký tự chữ thường. Các ký tự trong tập hợp này sau đó được fold sang dạng chữ thường, vì vậy chúng vẫn giữ nguyên. Chuỗi đầu vào cũng được fold sang chữ thường. Do đó, cả `"A"` và `"a"` đều được fold sang `"a"` và được khớp bởi `r1`.
- Trong `r2`, `\P{Lowercase_Letter}` trước tiên xây dựng một tập hợp tất cả các ký tự không phải chữ thường, tức là các chữ cái viết hoa và các ký tự không phân biệt hoa/thường. Các ký tự trong tập hợp này sau đó được fold sang dạng chữ thường, vì vậy tập hợp ký tự trở thành tất cả các chữ cái viết thường và các ký tự không phân biệt hoa/thường. `[^...]` phủ định kết quả khớp, khiến nó khớp bất cứ thứ gì _không_ nằm trong tập hợp này, tức là một chữ cái viết hoa. Tuy nhiên, đầu vào vẫn được fold sang chữ thường, vì vậy `"A"` được fold sang `"a"` và không được khớp bởi `r2`.

Quan sát chính ở đây là sau khi `[^...]` phủ định kết quả khớp, tập hợp ký tự mong đợi có thể không phải là tập con của tập hợp các ký tự Unicode được fold, khiến đầu vào được fold không nằm trong tập hợp ký tự mong đợi. Trong chế độ `v`, tập hợp tất cả các ký tự cũng được fold. `\P` character class cũng hoạt động hơi khác trong chế độ `v` (xem [Unicode character class escape](/en-US/docs/Web/JavaScript/Reference/Regular_expressions/Unicode_character_class_escape)). Tất cả những điều này đảm bảo rằng `[^\P{Lowercase_Letter}]` và `\p{Lowercase_Letter}` hoàn toàn tương đương.

## Ví dụ

### Khớp các chữ số thập lục phân

Hàm sau xác định xem một chuỗi có chứa số thập lục phân hợp lệ không:

```js
function isHexadecimal(str) {
  return /^[0-9A-F]+$/i.test(str);
}

isHexadecimal("2F3"); // true
isHexadecimal("beef"); // true
isHexadecimal("undefined"); // false
```

### Sử dụng giao

Hàm sau khớp các chữ cái Hy Lạp.

```js
function greekLetters(str) {
  return str.match(/[\p{Script_Extensions=Greek}&&\p{Letter}]/gv);
}

// 𐆊 is U+1018A GREEK ZERO SIGN
greekLetters("π𐆊P0零αAΣ"); // [ 'π', 'α', 'Σ' ]
```

### Sử dụng hiệu

Hàm sau khớp tất cả các số không phải ASCII.

```js
function nonASCIINumbers(str) {
  return str.match(/[\p{Decimal_Number}--\d]/gv);
}

// 𑜹 is U+11739 AHOM DIGIT NINE
nonASCIINumbers("𐆊0零1𝟜𑜹a"); // [ '𝟜', '𑜹' ]
```

### Khớp chuỗi

Hàm sau khớp tất cả các chuỗi kết thúc dòng, bao gồm [các ký tự kết thúc dòng](/en-US/docs/Web/JavaScript/Reference/Lexical_grammar#line_terminators) và chuỗi `\r\n` (CRLF).

```js
function getLineTerminators(str) {
  return str.match(/[\r\n\u2028\u2029\q{\r\n}]/gv);
}

getLineTerminators(`
A poem\r
Is split\r\n
Into many
Stanzas
`); // [ '\r', '\r\n', '\n' ]
```

Ví dụ này hoàn toàn tương đương với `/(?:\r|\n|\u2028|\u2029|\r\n)/gu` hoặc `/(?:[\r\n\u2028\u2029]|\r\n)/gu`, ngoại trừ ngắn hơn.

Trường hợp hữu ích nhất của `\q{}` là khi thực hiện phép hiệu và giao. Trước đây, điều này có thể thực hiện được với [nhiều lookaheads](/en-US/docs/Web/JavaScript/Reference/Regular_expressions/Lookahead_assertion#pattern_subtraction_and_intersection). Hàm sau khớp các cờ không phải là một trong các cờ của Mỹ, Trung Quốc, Nga, Anh và Pháp.

```js
function notUNSCPermanentMember(flag) {
  return /^[\p{RGI_Emoji_Flag_Sequence}--\q{🇺🇸|🇨🇳|🇷🇺|🇬🇧|🇫🇷}]$/v.test(flag);
}

notUNSCPermanentMember("🇺🇸"); // false
notUNSCPermanentMember("🇩🇪"); // true
```

Ví dụ này về cơ bản tương đương với `/^(?!🇺🇸|🇨🇳|🇷🇺|🇬🇧|🇫🇷)\p{RGI_Emoji_Flag_Sequence}$/v`, ngoại trừ có thể hiệu quả hơn.

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- Hướng dẫn [Character classes](/en-US/docs/Web/JavaScript/Guide/Regular_expressions/Character_classes)
- [Regular expressions](/en-US/docs/Web/JavaScript/Reference/Regular_expressions)
- [Character class escape: `\d`, `\D`, `\w`, `\W`, `\s`, `\S`](/en-US/docs/Web/JavaScript/Reference/Regular_expressions/Character_class_escape)
- [Unicode character class escape: `\p{...}`, `\P{...}`](/en-US/docs/Web/JavaScript/Reference/Regular_expressions/Unicode_character_class_escape)
- [Literal character: `a`, `b`](/en-US/docs/Web/JavaScript/Reference/Regular_expressions/Literal_character)
- [Character escape: `\n`, `\u{...}`](/en-US/docs/Web/JavaScript/Reference/Regular_expressions/Character_escape)
- [Disjunction: `|`](/en-US/docs/Web/JavaScript/Reference/Regular_expressions/Disjunction)
- [RegExp v flag with set notation and properties of strings](https://v8.dev/features/regexp-v-flag) on v8.dev (2022)
