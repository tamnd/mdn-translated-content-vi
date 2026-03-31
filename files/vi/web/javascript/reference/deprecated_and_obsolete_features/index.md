---
title: Deprecated and obsolete features
slug: Web/JavaScript/Reference/Deprecated_and_obsolete_features
page-type: guide
sidebar: jssidebar
---

Trang này liệt kê các tính năng của JavaScript đã bị deprecated (tức là vẫn có sẵn nhưng được lên kế hoạch loại bỏ) và obsolete (tức là không còn có thể sử dụng được).

## Tính năng đã bị deprecated

Các tính năng deprecated này vẫn có thể sử dụng, nhưng nên dùng cẩn thận vì chúng không bắt buộc phải được triển khai bởi mọi JavaScript engine. Bạn nên cố gắng loại bỏ việc sử dụng chúng khỏi mã của mình.

Một số tính năng deprecated này được liệt kê trong phần [Annex B](https://tc39.es/ecma262/multipage/additional-ecmascript-features-for-web-browsers.html) của đặc tả ECMAScript. Phần này được mô tả là normative optional — tức là, host trình duyệt web phải triển khai các tính năng này, trong khi host không phải web có thể không triển khai. Những tính năng này có thể ổn định vì việc loại bỏ chúng sẽ gây ra vấn đề tương thích ngược và làm hỏng các trang web cũ. (JavaScript có mục tiêu thiết kế là "đừng phá vỡ web".) Tuy nhiên, chúng không thể chuyển đổi cross-platform và có thể không được hỗ trợ bởi tất cả các công cụ phân tích, vì vậy bạn được khuyên không sử dụng chúng, như phần giới thiệu của Annex B nêu:

> … Tất cả các tính năng ngôn ngữ và hành vi được chỉ định trong phụ lục này đều có một hoặc nhiều đặc điểm không mong muốn và nếu không có việc sử dụng kế thừa sẽ bị loại bỏ khỏi đặc tả này. …
>
> … Lập trình viên không nên sử dụng hoặc giả định sự tồn tại của các tính năng và hành vi này khi viết mã ECMAScript mới. …

Một số tính năng khác, mặc dù trong phần thân chính của đặc tả, cũng được đánh dấu là normative optional và không nên phụ thuộc vào.

### Chú thích HTML

Mã nguồn JavaScript, nếu được phân tích cú pháp như script, cho phép chú thích dạng HTML, như thể script là một phần của thẻ `<script>`.

Sau đây là JavaScript hợp lệ khi chạy trong trình duyệt web (hoặc Node.js, sử dụng V8 engine của Chrome):

```js
<!-- comment
console.log("a"); <!-- another comment
console.log("b");
--> More comment
// Logs "a" and "b"
```

`<!--` và `-->` đều hoạt động như `//`, tức là bắt đầu chú thích dòng. `-->` chỉ hợp lệ ở đầu dòng (để tránh nhầm lẫn với postfix decrement theo sau là toán tử lớn hơn), trong khi `<!--` có thể xuất hiện ở bất kỳ đâu trong dòng.

### RegExp

Các thuộc tính sau đây đã bị deprecated. Điều này không ảnh hưởng đến việc sử dụng chúng trong [replacement string](/en-US/docs/Web/JavaScript/Reference/Global_Objects/String/replace):

- [`$1–$9`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/RegExp/n)
  - : Parenthesized substring matches, if any.
- [`input`, `$_`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/RegExp/input)
  - : The string against which a regular expression is matched.
- [`lastMatch`, `$&`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/RegExp/lastMatch)
  - : The last matched substring.
- [`lastParen`, `$+`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/RegExp/lastParen)
  - : The last parenthesized substring match, if any.
- [`leftContext`, `` $` ``](/en-US/docs/Web/JavaScript/Reference/Global_Objects/RegExp/leftContext)
  - : The substring preceding the most recent match.
- [`rightContext`, `$'`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/RegExp/rightContext)
  - : The substring following the most recent match.

> [!WARNING]
> Tránh sử dụng các thuộc tính static này, vì chúng có thể gây ra [vấn đề khi tương tác với mã bên ngoài](https://github.com/tc39/proposal-regexp-legacy-features/blob/master/subclass-restriction-motivation.md#legacy-static-properties-regexp1-etc)!

Phương thức {{jsxref("RegExp/compile", "compile()")}} đã bị deprecated. Hãy tạo một instance `RegExp` mới thay thế.

Các cú pháp regex sau đây đã bị deprecated và chỉ có sẵn trong [Unicode-unaware mode](/en-US/docs/Web/JavaScript/Reference/Global_Objects/RegExp/unicode#unicode-aware_mode). Trong Unicode-aware mode, chúng đều là lỗi cú pháp:

- [Lookahead assertion](/en-US/docs/Web/JavaScript/Reference/Regular_expressions/Lookahead_assertion) có thể có [quantifier](/en-US/docs/Web/JavaScript/Reference/Regular_expressions/Quantifier).
- [Backreference](/en-US/docs/Web/JavaScript/Reference/Regular_expressions/Backreference) không tham chiếu đến capturing group hiện có trở thành [legacy octal escape](#escape_sequences).
- Trong [character class](/en-US/docs/Web/JavaScript/Reference/Regular_expressions/Character_class), phạm vi ký tự mà một boundary là character class biến `-` thành ký tự literal.
- Escape sequence không được nhận diện trở thành ["identity escape"](/en-US/docs/Web/JavaScript/Reference/Regular_expressions/Character_escape).
- Escape sequence trong [character class](/en-US/docs/Web/JavaScript/Reference/Regular_expressions/Character_class) có dạng `\cX` trong đó `X` là số hoặc `_` được giải mã giống như các escape sequence với chữ cái {{Glossary("ASCII")}}: `\c0` giống như `\cP` khi lấy modulo 32. Ngoài ra, nếu gặp dạng `\cX` ở bất kỳ đâu mà `X` không phải là một trong các ký tự được nhận diện, thì dấu gạch chéo ngược được coi là ký tự literal.
- Chuỗi `\k` trong regex không có [named capturing group](/en-US/docs/Web/JavaScript/Reference/Regular_expressions/Named_capturing_group) nào được coi là identity escape.
- Các ký tự cú pháp `]`, `{` và `}` có thể xuất hiện [theo nghĩa đen](/en-US/docs/Web/JavaScript/Reference/Regular_expressions/Literal_character) mà không cần thoát nếu chúng không thể được diễn giải là kết thúc character class hoặc dấu phân cách quantifier.

### Function

- Thuộc tính {{jsxref("Function/caller", "caller")}} của hàm và thuộc tính [`arguments.callee`](/en-US/docs/Web/JavaScript/Reference/Functions/arguments/callee) đã bị deprecated và không có sẵn trong strict mode.
- Thay vì truy cập `arguments` như thuộc tính của hàm, bạn nên dùng đối tượng {{jsxref("Functions/arguments", "arguments")}} bên trong function closure.

### Object

- Các accessor [`Object.prototype.__proto__`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Object/proto) đã bị deprecated. Hãy dùng [`Object.getPrototypeOf`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Object/getPrototypeOf) và [`Object.setPrototypeOf`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Object/setPrototypeOf) thay thế. Điều này không áp dụng cho khóa literal `__proto__` trong object literal.
- Các phương thức [`Object.prototype.__defineGetter__`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Object/__defineGetter__), [`Object.prototype.__defineSetter__`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Object/__defineSetter__), [`Object.prototype.__lookupGetter__`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Object/__lookupGetter__) và [`Object.prototype.__lookupSetter__`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Object/__lookupSetter__) đã bị deprecated. Hãy dùng [`Object.getOwnPropertyDescriptor`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Object/getOwnPropertyDescriptor) và [`Object.defineProperty`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Object/defineProperty) thay thế.

### String

- Các phương thức wrapper HTML như {{jsxref("String.prototype.fontsize")}} và {{jsxref("String.prototype.big")}}.
- {{jsxref("String.prototype.substr")}} có thể sẽ không bị loại bỏ sớm, nhưng nó được định nghĩa trong Annex B và do đó là normative optional.
- `String.prototype.trimLeft` và `String.prototype.trimRight` nên được thay thế bằng {{jsxref("String.prototype.trimStart")}} và {{jsxref("String.prototype.trimEnd")}}.

### Date

- Các phương thức {{jsxref("Date/getYear", "getYear()")}} và {{jsxref("Date/setYear", "setYear()")}} bị ảnh hưởng bởi Year-2000-Problem và đã được thay thế bởi {{jsxref("Date/getFullYear", "getFullYear")}} và {{jsxref("Date/setFullYear", "setFullYear")}}.
- Phương thức `toGMTString()` đã bị deprecated. Hãy dùng {{jsxref("Date/toUTCString", "toUTCString()")}} thay thế.

### Chuỗi thoát

- Octal escape sequence (\ theo sau là một, hai hoặc ba chữ số bát phân) đã bị deprecated trong string và regular expression literal.
- Các hàm {{jsxref("escape()")}} và {{jsxref("unescape()")}} đã bị deprecated. Hãy dùng {{jsxref("encodeURI()")}}, {{jsxref("encodeURIComponent()")}}, {{jsxref("decodeURI()")}} hoặc {{jsxref("decodeURIComponent()")}} để mã hóa và giải mã chuỗi thoát cho các ký tự đặc biệt.

### Câu lệnh

Câu lệnh [`with`](/en-US/docs/Web/JavaScript/Reference/Statements/with) đã bị deprecated và không có sẵn trong strict mode.

Initializer trong khai báo `var` của header vòng lặp [`for...in`](/en-US/docs/Web/JavaScript/Reference/Statements/for...in) đã bị deprecated và tạo ra [lỗi cú pháp](/en-US/docs/Web/JavaScript/Reference/Errors/Invalid_for-in_initializer) trong strict mode. Biểu thức initializer được đánh giá và gán cho biến, nhưng giá trị sẽ ngay lập tức bị gán lại trong lần lặp đầu tiên của vòng lặp.

Thông thường, khối `catch` của câu lệnh [`try...catch`](/en-US/docs/Web/JavaScript/Reference/Statements/try...catch) không thể chứa khai báo biến có cùng tên với các biến bound trong `catch()`. Một phần mở rộng ngữ pháp cho phép khối `catch` chứa biến được khai báo `var` có cùng tên với định danh catch-bound, nhưng chỉ khi catch binding là định danh đơn giản, không phải [destructuring pattern](/en-US/docs/Web/JavaScript/Reference/Operators/Destructuring). Tuy nhiên, việc khởi tạo và gán giá trị của biến này sẽ chỉ ảnh hưởng đến định danh catch-bound, không phải biến phạm vi trên, và hành vi có thể gây nhầm lẫn.

```js
var a = 2;
try {
  throw new Error();
} catch (a) {
  var a = 1; // This 1 is assigned to the caught `a`, not the outer `a`.
}
console.log(a); // 2

try {
  throw new Error();
  // Note: identifier changed to `err` to avoid conflict with
  // the inner declaration of `a`.
} catch (err) {
  var a = 1; // This 1 is assigned to the upper-scope `a`.
}
console.log(a); // 1
```

Điều này được liệt kê trong Annex B của đặc tả và do đó có thể không được triển khai ở mọi nơi. Tránh xung đột tên giữa định danh catch-bound và biến được khai báo trong khối catch.

## Tính năng đã obsolete

Những tính năng obsolete này đã bị loại bỏ hoàn toàn khỏi JavaScript và không thể sử dụng được nữa kể từ phiên bản JavaScript được chỉ định.

### RegExp

Các thuộc tính sau hiện là thuộc tính của các instance `RegExp`, không còn của constructor `RegExp`:

| Property                                                           | Description                                                                                                        |
| ------------------------------------------------------------------ | ------------------------------------------------------------------------------------------------------------------ |
| {{jsxref("RegExp/global", "global")}}                              | Whether or not to test the regular expression against all possible matches in a string, or only against the first. |
| {{jsxref("RegExp/ignoreCase", "ignoreCase")}}                      | Whether or not to ignore case while attempting a match in a string.                                                |
| {{jsxref("RegExp/lastIndex", "lastIndex")}}                        | The index at which to start the next match.                                                                        |
| {{jsxref("RegExp/multiline", "multiline")}} (also via `RegExp.$*`) | Whether or not to search in strings across multiple lines.                                                         |
| {{jsxref("RegExp/source", "source")}}                              | The text of the pattern.                                                                                           |

Phương thức `valueOf()` không còn chuyên biệt hóa cho `RegExp`. Nó dùng {{jsxref("Object.prototype.valueOf()")}}, trả về chính nó.

### Function

- Thuộc tính `arity` của hàm đã obsolete. Hãy dùng [`length`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Function/length) thay thế.

### Object

| Property                     | Description                                                                                                | Alternative                                                                                                                                                                          |
| ---------------------------- | ---------------------------------------------------------------------------------------------------------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------ |
| `__count__`                  | Returns the number of enumerable properties directly on a user-defined object.                             | [`Object.keys()`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Object/keys)                                                                                                   |
| `__parent__`                 | Points to an object's context.                                                                             | No direct replacement                                                                                                                                                                |
| `__iterator__`               | Used with [legacy iterators](#legacy_generator_and_iterator).                                              | [`Symbol.iterator`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Symbol/iterator) and the new [iteration protocols](/en-US/docs/Web/JavaScript/Reference/Iteration_protocols) |
| `__noSuchMethod__`           | A method called when a non-existent property is called as method.                                          | {{jsxref("Proxy")}}                                                                                                                                                                  |
| `Object.prototype.eval()`    | Evaluates a string of JavaScript code in the context of the specified object.                              | No direct replacement                                                                                                                                                                |
| `Object.observe()`           | Asynchronously observing the changes to an object.                                                         | {{jsxref("Proxy")}}                                                                                                                                                                  |
| `Object.unobserve()`         | Remove observers.                                                                                          | {{jsxref("Proxy")}}                                                                                                                                                                  |
| `Object.getNotifier()`       | Create a notifier object that allows to synthetically trigger a change observable with `Object.observe()`. | No direct replacement                                                                                                                                                                |
| `Object.prototype.watch()`   | Attach a handler callback to a property that gets called when the property is assigned.                    | {{jsxref("Proxy")}}                                                                                                                                                                  |
| `Object.prototype.unwatch()` | Remove watch handlers on a property.                                                                       | {{jsxref("Proxy")}}                                                                                                                                                                  |

### String

- Các phương thức String generic không chuẩn như `String.slice(myStr, 0, 12)`, `String.replace(myStr, /\./g, "!")`, v.v. đã được giới thiệu trong Firefox 1.5 (JavaScript 1.6), bị deprecated trong Firefox 53 và bị loại bỏ trong Firefox 68. Bạn có thể dùng các phương thức trên {{jsxref("String", "String.prototype", "instance_methods")}} cùng với {{jsxref("Function.call")}} thay thế.
- `String.prototype.quote` đã bị loại bỏ khỏi Firefox 37.
- Tham số `flags` không chuẩn trong {{jsxref("String.prototype.search")}}, {{jsxref("String.prototype.match")}} và {{jsxref("String.prototype.replace")}} đã obsolete.

### WeakMap

- `WeakMap.prototype.clear()` đã được thêm vào Firefox 20 và bị loại bỏ trong Firefox 46. Không thể duyệt tất cả key trong [`WeakMap`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/WeakMap).

### Date

- `Date.prototype.toLocaleFormat()`, dùng format string theo định dạng được mong đợi bởi hàm `strftime()` trong C, đã obsolete. Hãy dùng [`toLocaleString()`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Date/toLocaleString) hoặc [`Intl.DateTimeFormat`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Intl/DateTimeFormat) thay thế.

### Array

- Các phương thức Array generic không chuẩn như `Array.slice(myArr, 0, 12)`, `Array.forEach(myArr, myFn)`, v.v. đã được giới thiệu trong Firefox 1.5 (JavaScript 1.6), bị deprecated trong Firefox 68 và bị loại bỏ trong Firefox 71. Bạn có thể dùng các phương thức trên {{jsxref("Array", "Array.prototype", "instance_methods")}} cùng với {{jsxref("Function.call")}} thay thế.

| Property            | Description                                 | Alternative         |
| ------------------- | ------------------------------------------- | ------------------- |
| `Array.observe()`   | Asynchronously observing changes to Arrays. | {{jsxref("Proxy")}} |
| `Array.unobserve()` | Remove observers.                           | {{jsxref("Proxy")}} |

### Number

- `Number.toInteger()` đã obsolete. Hãy dùng [`Math.floor`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Math/floor), [`Math.round`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Math/round) hoặc các phương thức khác thay thế.

### Proxy

- `Proxy.create` và `Proxy.createFunction` đã obsolete. Hãy dùng constructor {{jsxref("Proxy/Proxy", "Proxy()")}} thay thế.
- Các trap sau đã obsolete:
  - `hasOwn` ([bug 980565](https://bugzil.la/980565), Firefox 33).
  - `getEnumerablePropertyKeys` ([bug 783829](https://bugzil.la/783829), Firefox 37)
  - `getOwnPropertyNames` ([bug 1007334](https://bugzil.la/1007334), Firefox 33)
  - `keys` ([bug 1007334](https://bugzil.la/1007334), Firefox 33)

### ParallelArray

- `ParallelArray` đã obsolete.

### Câu lệnh

- `for each...in` đã obsolete. Hãy dùng {{jsxref("Statements/for...of", "for...of")}} thay thế.
- let block và let expression đã obsolete.
- Expression closure (`function () 1` là tốc ký của `function () { return 1; }`) đã obsolete. Hãy dùng {{jsxref("Operators/function", "function")}} thông thường hoặc {{jsxref("Functions/Arrow_functions", "arrow function", "", 1)}} thay thế.

### Lấy văn bản nguồn

Các phương thức `toSource()` của array, number, string, v.v. và hàm toàn cục `uneval()` đã obsolete. Hãy dùng [`toString()`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Object/toString), hoặc viết phương thức serialization riêng của bạn thay thế.

### Legacy generator và iterator

Các câu lệnh legacy generator function và legacy generator function expression đã bị loại bỏ. Cú pháp legacy generator function tái sử dụng từ khóa `function`, tự động trở thành generator function khi có một hoặc nhiều biểu thức `yield` trong thân — đây bây giờ là lỗi cú pháp. Hãy dùng [`function*` statement](/en-US/docs/Web/JavaScript/Reference/Statements/function*) và [`function*` expression](/en-US/docs/Web/JavaScript/Reference/Operators/function*) thay thế.

Array comprehension và generator comprehension đã bị loại bỏ.

```js-nolint
// Legacy array comprehensions
[for (x of iterable) x]
[for (x of iterable) if (condition) x]
[for (x of iterable) for (y of iterable) x + y]

// Legacy generator comprehensions
(for (x of iterable) x)
(for (x of iterable) if (condition) x)
(for (x of iterable) for (y of iterable) x + y)
```

Firefox, trước phiên bản 26, đã triển khai một iterator protocol khác tương tự như [Iterator protocol](/en-US/docs/Web/JavaScript/Reference/Iteration_protocols) chuẩn. Một đối tượng là legacy iterator khi nó triển khai phương thức `next()`, tạo ra giá trị trên mỗi lần gọi và ném đối tượng `StopIteration` ở cuối lặp. Legacy iterator protocol này khác với iterator protocol chuẩn:

- Giá trị được trả về trực tiếp làm giá trị trả về của các lời gọi `next()`, thay vì thuộc tính `value` của đối tượng `IteratorResult`.
- Việc kết thúc lặp được biểu đạt bằng cách ném đối tượng `StopIteration`, thay vì thông qua thuộc tính `done` của đối tượng `IteratorResult`.

Tính năng này, cùng với constructor toàn cục `StopIteration`, đã bị loại bỏ trong Firefox 58+. Cho mục đích sử dụng trong tương lai, hãy xem xét dùng vòng lặp [`for...of`](/en-US/docs/Web/JavaScript/Reference/Statements/for...of) và [iterator protocol](/en-US/docs/Web/JavaScript/Reference/Iteration_protocols).

### Sharp variable

Sharp variable đã obsolete. Để tạo cấu trúc circular, hãy dùng biến tạm thay thế.
