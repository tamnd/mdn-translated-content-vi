---
title: Template literals (Template strings)
slug: Web/JavaScript/Reference/Template_literals
page-type: javascript-language-feature
browser-compat: javascript.grammar.template_literals
sidebar: jssidebar
---

**Template literals** là các literal được phân định bằng ký tự backtick (`` ` ``), cho phép [chuỗi nhiều dòng](#multi-line_strings), [nội suy chuỗi](#string_interpolation) với các biểu thức nhúng, và các cấu trúc đặc biệt gọi là [tagged template](#tagged_templates).

Template literal đôi khi được gọi không chính thức là _template strings_, vì chúng được dùng phổ biến nhất cho [nội suy chuỗi](#string_interpolation) (để tạo chuỗi bằng cách thay thế placeholder). Tuy nhiên, tagged template literal có thể không tạo ra chuỗi; nó có thể được dùng với [tag function](#tagged_templates) tùy chỉnh để thực hiện bất kỳ thao tác nào bạn muốn trên các phần khác nhau của template literal.

## Cú pháp

```js-nolint
`string text`

`string text line 1
 string text line 2`

`string text ${expression} string text`

tagFunction`string text ${expression} string text`
```

### Tham số

- `string text`
  - : Văn bản chuỗi sẽ trở thành một phần của template literal. Hầu hết tất cả các ký tự đều được phép theo nghĩa đen, bao gồm [dấu ngắt dòng](/en-US/docs/Web/JavaScript/Reference/Lexical_grammar#line_terminators) và các [ký tự khoảng trắng](/en-US/docs/Web/JavaScript/Reference/Lexical_grammar#white_space) khác. Tuy nhiên, chuỗi thoát không hợp lệ sẽ gây ra lỗi cú pháp, trừ khi [tag function](#tagged_templates_and_escape_sequences) được sử dụng.
- `expression`
  - : Một biểu thức được chèn vào vị trí hiện tại, giá trị của nó được chuyển đổi thành chuỗi hoặc được truyền cho `tagFunction`.
- `tagFunction`
  - : Nếu được chỉ định, nó sẽ được gọi với mảng chuỗi template và các biểu thức thay thế, và giá trị trả về trở thành giá trị của template literal. Xem [tagged templates](#tagged_templates).

## Mô tả

Template literal được đặt trong dấu backtick (`` ` ``) thay vì dấu nháy đôi hoặc nháy đơn.

Ngoài các chuỗi thông thường, template literal cũng có thể chứa các phần khác gọi là _placeholder_, là các biểu thức nhúng được phân định bởi ký hiệu đô la và dấu ngoặc nhọn: `${expression}`. Các chuỗi và placeholder được truyền cho một hàm — hoặc là hàm mặc định, hoặc là hàm bạn cung cấp. Hàm mặc định (khi bạn không cung cấp hàm riêng) chỉ thực hiện [nội suy chuỗi](#string_interpolation) để thay thế placeholder và nối các phần thành một chuỗi duy nhất.

Để cung cấp hàm của riêng bạn, hãy đặt tên hàm trước template literal; kết quả được gọi là [**tagged template**](#tagged_templates). Trong trường hợp đó, template literal được truyền cho tag function của bạn, nơi bạn có thể thực hiện bất kỳ thao tác nào bạn muốn trên các phần khác nhau của template literal.

Để thoát backtick trong template literal, hãy đặt dấu gạch chéo ngược (`\`) trước backtick.

```js
`\`` === "`"; // true
```

Dấu đô la cũng có thể được thoát để ngăn nội suy.

```js
`\${1}` === "${1}"; // true
```

### Chuỗi nhiều dòng

Bất kỳ ký tự dòng mới nào được chèn vào nguồn đều là một phần của template literal.

Dùng chuỗi thông thường, bạn phải dùng cú pháp sau để có được chuỗi nhiều dòng:

```js
console.log("string text line 1\nstring text line 2");
// "string text line 1
// string text line 2"
```

Dùng template literal, bạn có thể làm điều tương tự với:

```js
console.log(`string text line 1
string text line 2`);
// "string text line 1
// string text line 2"
```

Giống như [string literal thông thường](/en-US/docs/Web/JavaScript/Reference/Lexical_grammar#escape_sequences), bạn có thể viết chuỗi một dòng trải dài nhiều dòng cho khả năng đọc mã nguồn, bằng cách thoát ký tự dòng mới bằng dấu gạch chéo ngược (`\`):

```js
console.log(`string text line 1 \
string text line 2`);
// "string text line 1 string text line 2"
```

### Nội suy chuỗi

Không có template literal, khi bạn muốn kết hợp đầu ra từ biểu thức với chuỗi, bạn sẽ [nối chúng](/en-US/docs/Learn_web_development/Core/Scripting/Strings#concatenation_using) bằng [toán tử cộng](/en-US/docs/Web/JavaScript/Reference/Operators/Addition) `+`:

```js
const a = 5;
const b = 10;
console.log("Fifteen is " + (a + b) + " and\nnot " + (2 * a + b) + ".");
// "Fifteen is 15 and
// not 20."
```

Điều đó có thể khó đọc — đặc biệt khi bạn có nhiều biểu thức.

Với template literal, bạn có thể tránh toán tử nối — và cải thiện khả năng đọc mã — bằng cách dùng placeholder dạng `${expression}` để thực hiện thay thế cho các biểu thức nhúng:

```js
const a = 5;
const b = 10;
console.log(`Fifteen is ${a + b} and
not ${2 * a + b}.`);
// "Fifteen is 15 and
// not 20."
```

Lưu ý rằng có sự khác biệt nhỏ giữa hai cú pháp. Template literal [ép buộc biểu thức thành chuỗi trực tiếp](/en-US/docs/Web/JavaScript/Reference/Global_Objects/String#string_coercion), trong khi phép cộng ép buộc toán hạng thành primitive trước. Để biết thêm thông tin, xem trang tham chiếu cho [toán tử `+`](/en-US/docs/Web/JavaScript/Reference/Operators/Addition).

### Lồng template

Trong một số trường hợp, lồng template là cách dễ nhất (và có thể dễ đọc hơn) để có chuỗi có thể cấu hình. Trong template được phân định bằng backtick, đơn giản là cho phép backtick bên trong bằng cách dùng chúng trong placeholder `${expression}` bên trong template.

Ví dụ, không có template literal, nếu bạn muốn trả về giá trị nhất định dựa trên điều kiện cụ thể, bạn có thể làm như sau:

```js example-bad
let classes = "header";
classes += isLargeScreen()
  ? ""
  : item.isCollapsed
    ? " icon-expander"
    : " icon-collapser";
```

Với template literal nhưng không lồng, bạn có thể làm điều này:

```js example-bad
const classes = `header ${
  isLargeScreen() ? "" : item.isCollapsed ? "icon-expander" : "icon-collapser"
}`;
```

Với lồng template literal, bạn có thể làm điều này:

```js example-good
const classes = `header ${
  isLargeScreen() ? "" : `icon-${item.isCollapsed ? "expander" : "collapser"}`
}`;
```

### Tagged templates

Một dạng nâng cao hơn của template literal là _tagged_ template.

Tag cho phép bạn phân tích cú pháp template literal bằng hàm. Đối số đầu tiên của tag function chứa mảng các giá trị chuỗi. Các đối số còn lại liên quan đến các biểu thức.

Tag function có thể thực hiện bất kỳ thao tác nào trên các đối số này và trả về chuỗi đã được thao tác. (Hoặc, nó có thể trả về thứ gì đó hoàn toàn khác, như được mô tả trong một trong các ví dụ sau.)

Tên hàm được dùng cho tag có thể là bất cứ điều gì bạn muốn.

```js
const person = "Mike";
const age = 28;

function myTag(strings, personExp, ageExp) {
  const str0 = strings[0]; // "That "
  const str1 = strings[1]; // " is a "
  const str2 = strings[2]; // "."

  const ageStr = ageExp < 100 ? "youngster" : "centenarian";

  // We can even return a string built using a template literal
  return `${str0}${personExp}${str1}${ageStr}${str2}`;
}

const output = myTag`That ${person} is a ${age}.`;

console.log(output);
// That Mike is a youngster.
```

Tag không cần phải là định danh thuần túy. Bạn có thể dùng bất kỳ biểu thức nào có [độ ưu tiên](/en-US/docs/Web/JavaScript/Reference/Operators/Operator_precedence#table) lớn hơn 16, bao gồm [truy cập thuộc tính](/en-US/docs/Web/JavaScript/Reference/Operators/Property_accessors), lời gọi hàm, [biểu thức new](/en-US/docs/Web/JavaScript/Reference/Operators/new), hoặc thậm chí một tagged template literal khác.

```js
console.log`Hello`; // [ 'Hello' ]
console.log.bind(1, 2)`Hello`; // 2 [ 'Hello' ]
new Function("console.log(arguments)")`Hello`; // [Arguments] { '0': [ 'Hello' ] }

function recursive(strings, ...values) {
  console.log(strings, values);
  return recursive;
}
recursive`Hello``World`;
// [ 'Hello' ] []
// [ 'World' ] []
```

Mặc dù được phép về mặt cú pháp, template literal _không được tag_ là chuỗi và sẽ ném {{jsxref("TypeError")}} khi được nối.

```js
console.log(`Hello``World`); // TypeError: "Hello" is not a function
```

Ngoại lệ duy nhất là optional chaining, sẽ ném lỗi cú pháp.

```js-nolint example-bad
console.log?.`Hello`; // SyntaxError: Invalid tagged template on optional chain
console?.log`Hello`; // SyntaxError: Invalid tagged template on optional chain
```

Lưu ý rằng hai biểu thức này vẫn có thể phân tích cú pháp được. Điều này có nghĩa là chúng sẽ không bị ảnh hưởng bởi [chèn dấu chấm phẩy tự động](/en-US/docs/Web/JavaScript/Reference/Lexical_grammar#automatic_semicolon_insertion), chỉ chèn dấu chấm phẩy để sửa mã không thể phân tích cú pháp.

```js-nolint example-bad
// Still a syntax error
const a = console?.log
`Hello`
```

Tag function thậm chí không cần trả về chuỗi!

```js
function template(strings, ...keys) {
  return (...values) => {
    const dict = values[values.length - 1] || {};
    const result = [strings[0]];
    keys.forEach((key, i) => {
      const value = Number.isInteger(key) ? values[key] : dict[key];
      result.push(value, strings[i + 1]);
    });
    return result.join("");
  };
}

const t1Closure = template`${0}${1}${0}!`;
// const t1Closure = template(["","","","!"],0,1,0);
t1Closure("Y", "A"); // "YAY!"

const t2Closure = template`${0} ${"foo"}!`;
// const t2Closure = template([""," ","!"],0,"foo");
t2Closure("Hello", { foo: "World" }); // "Hello World!"

const t3Closure = template`I'm ${"name"}. I'm almost ${"age"} years old.`;
// const t3Closure = template(["I'm ", ". I'm almost ", " years old."], "name", "age");
t3Closure("foo", { name: "MDN", age: 30 }); // "I'm MDN. I'm almost 30 years old."
t3Closure({ name: "MDN", age: 30 }); // "I'm MDN. I'm almost 30 years old."
```

Đối số đầu tiên nhận bởi tag function là mảng chuỗi. Đối với bất kỳ template literal nào, độ dài của nó bằng số thay thế (số lần xuất hiện của `${…}`) cộng một, và do đó luôn không rỗng.

Đối với bất kỳ tagged template literal expression cụ thể nào, tag function sẽ luôn được gọi với chính xác cùng một mảng literal, bất kể literal được đánh giá bao nhiêu lần.

```js
const callHistory = [];

function tag(strings, ...values) {
  callHistory.push(strings);
  // Return a freshly made object
  return {};
}

function evaluateLiteral() {
  return tag`Hello, ${"world"}!`;
}

console.log(evaluateLiteral() === evaluateLiteral()); // false; each time `tag` is called, it returns a new object
console.log(callHistory[0] === callHistory[1]); // true; all evaluations of the same tagged literal would pass in the same strings array
```

Điều này cho phép tag cache kết quả dựa trên danh tính của đối số đầu tiên. Để đảm bảo thêm tính ổn định của giá trị mảng, đối số đầu tiên và thuộc tính [`raw`](#raw_strings) của nó đều được [đóng băng](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Object/isFrozen), vì vậy bạn không thể thay đổi chúng theo bất kỳ cách nào.

### Chuỗi raw

Thuộc tính `raw` đặc biệt, có sẵn trên đối số đầu tiên cho tag function, cho phép bạn truy cập các chuỗi thô như chúng đã được nhập, không xử lý [chuỗi thoát](/en-US/docs/Web/JavaScript/Guide/Grammar_and_types#using_special_characters_in_strings).

```js
function tag(strings) {
  console.log(strings.raw[0]);
}

tag`string text line 1 \n string text line 2`;
// Logs "string text line 1 \n string text line 2",
// including the two characters '\' and 'n'
```

> [!NOTE]
> Cú pháp template literal vẫn được xử lý theo cùng cách, có nghĩa là backtick không được thoát và `${` có ý nghĩa cú pháp đặc biệt, nhưng thoát các ký tự này tạo ra thêm dấu gạch chéo ngược trong chuỗi raw. Xem [raw strings containing template literal syntax](/en-US/docs/Web/JavaScript/Reference/Global_Objects/String/raw#raw_strings_containing_template_literal_syntax) để biết thêm thông tin.

Ngoài ra, phương thức {{jsxref("String.raw()")}} tồn tại để tạo chuỗi raw giống như hàm template mặc định và nối chuỗi sẽ tạo ra.

```js
const str = String.raw`Hi\n${2 + 3}!`;
// "Hi\\n5!"

str.length;
// 6

Array.from(str).join(",");
// "H,i,\\,n,5,!"
```

`String.raw` hoạt động như tag "identity" nếu literal không chứa bất kỳ chuỗi thoát nào. Trong trường hợp bạn muốn tag identity thực sự luôn hoạt động như thể literal không được tag, bạn có thể tạo hàm tùy chỉnh truyền mảng literal "cooked" (tức là chuỗi thoát được xử lý) cho `String.raw`, giả vờ chúng là chuỗi raw.

```js
const identity = (strings, ...values) =>
  String.raw({ raw: strings }, ...values);
console.log(identity`Hi\n${2 + 3}!`);
// Hi
// 5!
```

Điều này hữu ích cho nhiều công cụ xử lý đặc biệt literal được tag bằng tên cụ thể.

```js
const html = (strings, ...values) => String.raw({ raw: strings }, ...values);
// Some formatters will format this literal's content as HTML
const doc = html`<!doctype html>
  <html lang="en-US">
    <head>
      <title>Hello</title>
    </head>
    <body>
      <h1>Hello world!</h1>
    </body>
  </html>`;
```

### Tagged templates và chuỗi thoát

Trong template literal thông thường, [chuỗi thoát trong string literal](/en-US/docs/Web/JavaScript/Reference/Lexical_grammar#escape_sequences) đều được phép. Bất kỳ chuỗi thoát không hợp lệ nào là lỗi cú pháp. Điều này bao gồm:

- `\` theo sau bởi bất kỳ chữ số thập phân nào khác `0`, hoặc `\0` theo sau bởi chữ số thập phân; ví dụ `\9` và `\07` (là [cú pháp đã bị deprecated](/en-US/docs/Web/JavaScript/Reference/Deprecated_and_obsolete_features#escape_sequences))
- `\x` theo sau bởi ít hơn hai chữ số hex (bao gồm không có); ví dụ `\xz`
- `\u` không theo sau bởi `{` và theo sau bởi ít hơn bốn chữ số hex (bao gồm không có); ví dụ `\uz`
- `\u{}` bao quanh code point Unicode không hợp lệ — nó chứa chữ số không phải hex, hoặc giá trị của nó lớn hơn `10FFFF`; ví dụ `\u{110000}` và `\u{z}`

> [!NOTE]
> `\` theo sau bởi các ký tự khác, mặc dù chúng có thể vô dụng vì không có gì được thoát, không phải là lỗi cú pháp.

Tuy nhiên, điều này có vấn đề với tagged template, bên cạnh literal "cooked", còn có quyền truy cập vào literal raw (chuỗi thoát được giữ nguyên).

Tagged template cho phép nhúng nội dung chuỗi tùy ý, nơi chuỗi thoát có thể theo cú pháp khác. Hãy xem xét ví dụ chúng ta nhúng văn bản nguồn [LaTeX](https://en.wikipedia.org/wiki/LaTeX) trong JavaScript qua `String.raw`. Chúng ta muốn vẫn có thể dùng LaTeX macro bắt đầu bằng `u` hoặc `x` mà không tuân theo hạn chế cú pháp JavaScript. Do đó, hạn chế cú pháp về chuỗi thoát hợp lệ được gỡ bỏ từ tagged template. Ví dụ dưới đây sử dụng [MathJax](https://www.mathjax.org/) để render LaTeX trong một phần tử:

```js
const node = document.getElementById("formula");
MathJax.typesetClear([node]);
// Throws in older ECMAScript versions (ES2016 and earlier)
// SyntaxError: malformed Unicode character escape sequence
node.textContent = String.raw`$\underline{u}$`;
MathJax.typesetPromise([node]);
```

Tuy nhiên, chuỗi thoát không hợp lệ vẫn phải được biểu diễn trong biểu diễn "cooked". Chúng sẽ xuất hiện là phần tử {{jsxref("undefined")}} trong mảng "cooked":

```js
function log(str) {
  console.log("Cooked:", str[0]);
  console.log("Raw:", str.raw[0]);
}

log`\unicode`;
// Cooked: undefined
// Raw: \unicode
```

Lưu ý rằng hạn chế chuỗi thoát chỉ được gỡ bỏ từ template _được tag_, không phải từ template literal _không được tag_:

```js-nolint example-bad
const bad = `bad escape sequence: \unicode`;
```

## Specifications

{{Specifications}}

## Browser compatibility

{{Compat}}

## See also

- [Numbers and strings](/en-US/docs/Web/JavaScript/Guide/Numbers_and_strings) guide
- {{jsxref("String")}}
- {{jsxref("String.raw()")}}
- [Lexical grammar](/en-US/docs/Web/JavaScript/Reference/Lexical_grammar)
- [ES6 in Depth: Template strings](https://hacks.mozilla.org/2015/05/es6-in-depth-template-strings-2/) on hacks.mozilla.org (2015)
