---
title: JavaScript reference
slug: Web/JavaScript/Reference
page-type: landing-page
sidebar: jssidebar
---

Tài liệu tham khảo JavaScript đóng vai trò là kho lưu trữ các thông tin về ngôn ngữ JavaScript. Toàn bộ ngôn ngữ được mô tả chi tiết ở đây. Khi viết mã JavaScript, bạn sẽ thường xuyên tham khảo các trang này (do đó có tên "JavaScript reference").

Ngôn ngữ JavaScript được thiết kế để sử dụng trong một môi trường lớn hơn, có thể là trình duyệt, script phía máy chủ hoặc tương tự. Phần lớn, tài liệu tham khảo này cố gắng không phụ thuộc vào môi trường cụ thể và không nhắm đến môi trường trình duyệt web.

Nếu bạn mới làm quen với JavaScript, hãy bắt đầu với [hướng dẫn](/en-US/docs/Web/JavaScript/Guide). Sau khi đã nắm vững các nguyên tắc cơ bản, bạn có thể sử dụng tài liệu tham khảo để tìm hiểu chi tiết hơn về các đối tượng và cấu trúc ngôn ngữ riêng lẻ.

## Tích hợp sẵn

[Các đối tượng tích hợp sẵn tiêu chuẩn của JavaScript](/en-US/docs/Web/JavaScript/Reference/Global_Objects), cùng với các phương thức và thuộc tính của chúng.

### Thuộc tính giá trị

- {{jsxref("globalThis")}}
- {{jsxref("Infinity")}}
- {{jsxref("NaN")}}
- {{jsxref("undefined")}}

### Thuộc tính hàm

- {{jsxref("Global_Objects/eval", "eval()")}}
- {{jsxref("isFinite()")}}
- {{jsxref("isNaN()")}}
- {{jsxref("parseFloat()")}}
- {{jsxref("parseInt()")}}
- {{jsxref("decodeURI()")}}
- {{jsxref("decodeURIComponent()")}}
- {{jsxref("encodeURI()")}}
- {{jsxref("encodeURIComponent()")}}
- {{jsxref("escape()")}} {{deprecated_inline}}
- {{jsxref("unescape()")}} {{deprecated_inline}}

### Đối tượng cơ bản

- {{jsxref("Object")}}
- {{jsxref("Function")}}
- {{jsxref("Boolean")}}
- {{jsxref("Symbol")}}

### Đối tượng lỗi

- {{jsxref("Error")}}
- {{jsxref("AggregateError")}}
- {{jsxref("EvalError")}}
- {{jsxref("RangeError")}}
- {{jsxref("ReferenceError")}}
- {{jsxref("SuppressedError")}}
- {{jsxref("SyntaxError")}}
- {{jsxref("TypeError")}}
- {{jsxref("URIError")}}
- {{jsxref("InternalError")}} {{non-standard_inline}}

### Số và ngày giờ

- {{jsxref("Number")}}
- {{jsxref("BigInt")}}
- {{jsxref("Math")}}
- {{jsxref("Date")}}
- {{jsxref("Temporal")}}

### Xử lý văn bản

- {{jsxref("String")}}
- {{jsxref("RegExp")}}

### Tập hợp có chỉ mục

- {{jsxref("Array")}}
- {{jsxref("Int8Array")}}
- {{jsxref("Uint8Array")}}
- {{jsxref("Uint8ClampedArray")}}
- {{jsxref("Int16Array")}}
- {{jsxref("Uint16Array")}}
- {{jsxref("Int32Array")}}
- {{jsxref("Uint32Array")}}
- {{jsxref("BigInt64Array")}}
- {{jsxref("BigUint64Array")}}
- {{jsxref("Float16Array")}}
- {{jsxref("Float32Array")}}
- {{jsxref("Float64Array")}}

### Tập hợp có khóa

- {{jsxref("Map")}}
- {{jsxref("Set")}}
- {{jsxref("WeakMap")}}
- {{jsxref("WeakSet")}}

### Dữ liệu có cấu trúc

- {{jsxref("ArrayBuffer")}}
- {{jsxref("SharedArrayBuffer")}}
- {{jsxref("DataView")}}
- {{jsxref("Atomics")}}
- {{jsxref("JSON")}}

### Quản lý bộ nhớ

- {{jsxref("WeakRef")}}
- {{jsxref("FinalizationRegistry")}}

### Đối tượng trừu tượng hóa điều khiển

- {{jsxref("Iterator")}}
- {{jsxref("AsyncIterator")}}
- {{jsxref("Promise")}}
- {{jsxref("GeneratorFunction")}}
- {{jsxref("AsyncGeneratorFunction")}}
- {{jsxref("Generator")}}
- {{jsxref("AsyncGenerator")}}
- {{jsxref("AsyncFunction")}}
- {{jsxref("DisposableStack")}}
- {{jsxref("AsyncDisposableStack")}}

### Reflection

- {{jsxref("Reflect")}}
- {{jsxref("Proxy")}}

### Quốc tế hóa

- {{jsxref("Intl")}}
- {{jsxref("Intl.Collator")}}
- {{jsxref("Intl.DateTimeFormat")}}
- {{jsxref("Intl.DisplayNames")}}
- {{jsxref("Intl.DurationFormat")}}
- {{jsxref("Intl.ListFormat")}}
- {{jsxref("Intl.Locale")}}
- {{jsxref("Intl.NumberFormat")}}
- {{jsxref("Intl.PluralRules")}}
- {{jsxref("Intl.RelativeTimeFormat")}}
- {{jsxref("Intl.Segmenter")}}

## Câu lệnh

[Các câu lệnh và khai báo JavaScript](/en-US/docs/Web/JavaScript/Reference/Statements)

### Luồng điều khiển

- {{jsxref("Statements/return", "return")}}
- {{jsxref("Statements/break", "break")}}
- {{jsxref("Statements/continue", "continue")}}
- {{jsxref("Statements/throw", "throw")}}
- {{jsxref("Statements/if...else", "if...else")}}
- {{jsxref("Statements/switch", "switch")}}
- {{jsxref("Statements/try...catch", "try...catch")}}

### Khai báo biến

- {{jsxref("Statements/var", "var")}}
- {{jsxref("Statements/let", "let")}}
- {{jsxref("Statements/const", "const")}}
- {{jsxref("Statements/using", "using")}}
- {{jsxref("Statements/await_using", "await using")}}

### Hàm và lớp

- {{jsxref("Statements/function", "function")}}
- {{jsxref("Statements/function*", "function*")}}
- {{jsxref("Statements/async_function", "async function")}}
- {{jsxref("Statements/async_function*", "async function*")}}
- {{jsxref("Statements/class", "class")}}

### Lặp

- {{jsxref("Statements/do...while", "do...while")}}
- {{jsxref("Statements/for", "for")}}
- {{jsxref("Statements/for...in", "for...in")}}
- {{jsxref("Statements/for...of", "for...of")}}
- {{jsxref("Statements/for-await...of", "for await...of")}}
- {{jsxref("Statements/while", "while")}}

### Khác

- {{jsxref("Statements/Empty", "Empty", "", 1)}}
- {{jsxref("Statements/block", "Block", "", 1)}}
- {{jsxref("Statements/Expression_statement", "Expression statement", "", 1)}}
- {{jsxref("Statements/debugger", "debugger")}}
- {{jsxref("Statements/export", "export")}}
- {{jsxref("Statements/import", "import")}}
- {{jsxref("Statements/label", "label", "", 1)}}
- {{jsxref("Statements/with", "with")}} {{deprecated_inline}}

## Biểu thức và toán tử

[Các biểu thức và toán tử JavaScript](/en-US/docs/Web/JavaScript/Reference/Operators).

### Biểu thức sơ cấp

- {{jsxref("Operators/this", "this")}}
- [Literals](/en-US/docs/Web/JavaScript/Reference/Lexical_grammar#literals)
- {{jsxref("Array", "[]")}}
- {{jsxref("Operators/Object_initializer", "{}")}}
- {{jsxref("Operators/function", "function")}}
- {{jsxref("Operators/class", "class")}}
- {{jsxref("Operators/function*", "function*")}}
- {{jsxref("Operators/async_function", "async function")}}
- {{jsxref("Operators/async_function*", "async function*")}}
- {{jsxref("RegExp", "/ab+c/i")}}
- {{jsxref("Template_literals", "`string`")}}
- {{jsxref("Operators/Grouping", "( )")}}

### Biểu thức vế trái

- {{jsxref("Operators/Property_accessors", "Property accessors", "", 1)}}
- {{jsxref("Operators/Optional_chaining", "?.")}}
- {{jsxref("Operators/new", "new")}}
- {{jsxref("Operators/new.target", "new.target")}}
- {{jsxref("Operators/import.meta", "import.meta")}}
- {{jsxref("Operators/super", "super")}}
- {{jsxref("Operators/import", "import()")}}

### Tăng và giảm

- {{jsxref("Operators/Increment", "A++")}}
- {{jsxref("Operators/Decrement", "A--")}}
- {{jsxref("Operators/Increment", "++A")}}
- {{jsxref("Operators/Decrement", "--A")}}

### Toán tử một ngôi

- {{jsxref("Operators/delete", "delete")}}
- {{jsxref("Operators/void", "void")}}
- {{jsxref("Operators/typeof", "typeof")}}
- {{jsxref("Operators/Unary_plus", "+")}}
- {{jsxref("Operators/Unary_negation", "-")}}
- {{jsxref("Operators/Bitwise_NOT", "~")}}
- {{jsxref("Operators/Logical_NOT", "!")}}
- {{jsxref("Operators/await", "await")}}

### Toán tử số học

- {{jsxref("Operators/Exponentiation", "**")}}
- {{jsxref("Operators/Multiplication", "*")}}
- {{jsxref("Operators/Division", "/")}}
- {{jsxref("Operators/Remainder", "%")}}
- {{jsxref("Operators/Addition", "+")}} (Plus)
- {{jsxref("Operators/Subtraction", "-")}}

### Toán tử quan hệ

- {{jsxref("Operators/Less_than", "&lt;")}} (Less than)
- {{jsxref("Operators/Greater_than", "&gt;")}} (Greater than)
- {{jsxref("Operators/Less_than_or_equal", "&lt;=")}}
- {{jsxref("Operators/Greater_than_or_equal", "&gt;=")}}
- {{jsxref("Operators/instanceof", "instanceof")}}
- {{jsxref("Operators/in", "in")}}

### Toán tử bằng nhau

- {{jsxref("Operators/Equality", "==")}}
- {{jsxref("Operators/Inequality", "!=")}}
- {{jsxref("Operators/Strict_equality", "===")}}
- {{jsxref("Operators/Strict_inequality", "!==")}}

### Toán tử dịch chuyển bit

- {{jsxref("Operators/Left_shift", "&lt;&lt;")}}
- {{jsxref("Operators/Right_shift", "&gt;&gt;")}}
- {{jsxref("Operators/Unsigned_right_shift", "&gt;&gt;&gt;")}}

### Toán tử bit nhị phân

- {{jsxref("Operators/Bitwise_AND", "&amp;")}}
- {{jsxref("Operators/Bitwise_OR", "|")}}
- {{jsxref("Operators/Bitwise_XOR", "^")}}

### Toán tử logic nhị phân

- {{jsxref("Operators/Logical_AND", "&amp;&amp;")}}
- {{jsxref("Operators/Logical_OR", "||")}}
- {{jsxref("Operators/Nullish_coalescing", "??")}}

### Toán tử điều kiện (ternary)

- {{jsxref("Operators/Conditional_operator", "(condition ? ifTrue : ifFalse)")}}

### Toán tử gán

- {{jsxref("Operators/Assignment", "=")}}
- {{jsxref("Operators/Multiplication_assignment", "*=")}}
- {{jsxref("Operators/Division_assignment", "/=")}}
- {{jsxref("Operators/Remainder_assignment", "%=")}}
- {{jsxref("Operators/Addition_assignment", "+=")}}
- {{jsxref("Operators/Subtraction_assignment", "-=")}}
- {{jsxref("Operators/Left_shift_assignment", "&lt;&lt;=")}}
- {{jsxref("Operators/Right_shift_assignment", "&gt;&gt;=")}}
- {{jsxref("Operators/Unsigned_right_shift_assignment", "&gt;&gt;&gt;=")}}
- {{jsxref("Operators/Bitwise_AND_assignment", "&amp;=")}}
- {{jsxref("Operators/Bitwise_XOR_assignment", "^=")}}
- {{jsxref("Operators/Bitwise_OR_assignment", "|=")}}
- {{jsxref("Operators/Exponentiation_assignment", "**=")}}
- {{jsxref("Operators/Logical_AND_assignment", "&amp;&amp;=")}}
- {{jsxref("Operators/Logical_OR_assignment", "||=")}}
- {{jsxref("Operators/Nullish_coalescing_assignment", "??=")}}
- [`[a, b] = arr`, `{ a, b } = obj`](/en-US/docs/Web/JavaScript/Reference/Operators/Destructuring)

### Toán tử yield

- {{jsxref("Operators/yield", "yield")}}
- {{jsxref("Operators/yield*", "yield*")}}

### Cú pháp spread

- {{jsxref("Operators/Spread_syntax", "...obj")}}

### Toán tử dấu phẩy

- {{jsxref("Operators/Comma_operator", ",")}}

## Hàm

[Các hàm JavaScript.](/en-US/docs/Web/JavaScript/Reference/Functions)

- {{jsxref("Functions/Arrow_functions", "Arrow Functions", "", 1)}}
- {{jsxref("Functions/Default_parameters", "Default parameters", "", 1)}}
- {{jsxref("Functions/rest_parameters", "Rest parameters", "", 1)}}
- {{jsxref("Functions/arguments", "arguments")}}
- {{jsxref("Functions/Method_definitions", "Method definitions", "", 1)}}
- {{jsxref("Functions/get", "getter", "", 1)}}
- {{jsxref("Functions/set", "setter", "", 1)}}

## Lớp

[Các lớp JavaScript.](/en-US/docs/Web/JavaScript/Reference/Classes)

- {{jsxref("Classes/Constructor", "constructor")}}
- {{jsxref("Classes/extends", "extends")}}
- [Private elements](/en-US/docs/Web/JavaScript/Reference/Classes/Private_elements)
- [Public class fields](/en-US/docs/Web/JavaScript/Reference/Classes/Public_class_fields)
- {{jsxref("Classes/static", "static")}}
- [Static initialization blocks](/en-US/docs/Web/JavaScript/Reference/Classes/Static_initialization_blocks)

## Biểu thức chính quy

[Các biểu thức chính quy JavaScript.](/en-US/docs/Web/JavaScript/Reference/Regular_expressions)

- [Backreference: `\1`, `\2`](/en-US/docs/Web/JavaScript/Reference/Regular_expressions/Backreference)
- [Capturing group: `(...)`](/en-US/docs/Web/JavaScript/Reference/Regular_expressions/Capturing_group)
- [Character class: `[...]`, `[^...]`](/en-US/docs/Web/JavaScript/Reference/Regular_expressions/Character_class)
- [Character class escape: `\d`, `\D`, `\w`, `\W`, `\s`, `\S`](/en-US/docs/Web/JavaScript/Reference/Regular_expressions/Character_class_escape)
- [Character escape: `\n`, `\u{...}`](/en-US/docs/Web/JavaScript/Reference/Regular_expressions/Character_escape)
- [Disjunction: `|`](/en-US/docs/Web/JavaScript/Reference/Regular_expressions/Disjunction)
- [Input boundary assertion: `^`, `$`](/en-US/docs/Web/JavaScript/Reference/Regular_expressions/Input_boundary_assertion)
- [Literal character: `a`, `b`](/en-US/docs/Web/JavaScript/Reference/Regular_expressions/Literal_character)
- [Lookahead assertion: `(?=...)`, `(?!...)`](/en-US/docs/Web/JavaScript/Reference/Regular_expressions/Lookahead_assertion)
- [Lookbehind assertion: `(?<=...)`, `(?<!...)`](/en-US/docs/Web/JavaScript/Reference/Regular_expressions/Lookbehind_assertion)
- [Modifier: `(?ims-ims:...)`](/en-US/docs/Web/JavaScript/Reference/Regular_expressions/Modifier)
- [Named backreference: `\k<name>`](/en-US/docs/Web/JavaScript/Reference/Regular_expressions/Named_backreference)
- [Named capturing group: `(?<name>...)`](/en-US/docs/Web/JavaScript/Reference/Regular_expressions/Named_capturing_group)
- [Non-capturing group: `(?:...)`](/en-US/docs/Web/JavaScript/Reference/Regular_expressions/Non-capturing_group)
- [Quantifier: `*`, `+`, `?`, `{n}`, `{n,}`, `{n,m}`](/en-US/docs/Web/JavaScript/Reference/Regular_expressions/Quantifier)
- [Unicode character class escape: `\p{...}`, `\P{...}`](/en-US/docs/Web/JavaScript/Reference/Regular_expressions/Unicode_character_class_escape)
- [Wildcard: `.`](/en-US/docs/Web/JavaScript/Reference/Regular_expressions/Wildcard)
- [Word boundary assertion: `\b`, `\B`](/en-US/docs/Web/JavaScript/Reference/Regular_expressions/Word_boundary_assertion)

## Các trang tham khảo bổ sung

- [JavaScript technologies overview](/en-US/docs/Web/JavaScript/Reference/JavaScript_technologies_overview)
- [Execution model](/en-US/docs/Web/JavaScript/Reference/Execution_model)
- {{jsxref("Lexical_grammar", "Lexical grammar", "", 1)}}
- [Data types and data structures](/en-US/docs/Web/JavaScript/Guide/Data_structures)
- [Iteration protocols](/en-US/docs/Web/JavaScript/Reference/Iteration_protocols)
- [Trailing commas](/en-US/docs/Web/JavaScript/Reference/Trailing_commas)
- [Errors](/en-US/docs/Web/JavaScript/Reference/Errors)
- {{jsxref("Strict_mode", "Strict mode", "", 1)}}
- {{jsxref("Deprecated_and_obsolete_features", "Deprecated features", "", 1)}}
