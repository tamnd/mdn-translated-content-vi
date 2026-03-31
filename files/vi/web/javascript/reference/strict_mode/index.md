---
title: Strict mode
slug: Web/JavaScript/Reference/Strict_mode
page-type: guide
spec-urls: https://tc39.es/ecma262/multipage/strict-mode-of-ecmascript.html
sidebar: jssidebar
---

> [!NOTE]
> Đôi khi bạn sẽ thấy chế độ mặc định, không nghiêm ngặt được gọi là _[sloppy mode](/en-US/docs/Glossary/Sloppy_mode)_. Đây không phải là thuật ngữ chính thức, nhưng hãy lưu ý nó, phòng trường hợp bạn gặp phải.

Strict mode của JavaScript là cách để _opt in_ vào một biến thể bị hạn chế của JavaScript, từ đó ngầm định opt-out khỏi "[sloppy mode](/en-US/docs/Glossary/Sloppy_mode)". Strict mode không chỉ là một tập con: nó _cố ý_ có ngữ nghĩa khác với mã thông thường. Mã strict mode và mã non-strict mode có thể cùng tồn tại, vì vậy script có thể dần dần opt vào strict mode.

Strict mode thực hiện một số thay đổi đối với ngữ nghĩa JavaScript thông thường:

1. Loại bỏ một số lỗi im lặng của JavaScript bằng cách thay đổi chúng để ném lỗi.
2. Sửa các lỗi khiến JavaScript engine khó thực hiện tối ưu hóa: mã strict mode đôi khi có thể được chạy nhanh hơn mã giống hệt không phải strict mode.
3. Cấm một số cú pháp có thể sẽ được định nghĩa trong các phiên bản ECMAScript tương lai.

## Bật strict mode

Strict mode áp dụng cho _toàn bộ script_ hoặc _các hàm riêng lẻ_. Nó không áp dụng cho [block statement](/en-US/docs/Web/JavaScript/Reference/Statements/block) được đặt trong dấu ngoặc nhọn `{}`; cố gắng áp dụng nó cho các ngữ cảnh như vậy không có tác dụng gì. Mã [`eval`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/eval), mã [`Function`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Function/Function), thuộc tính [event handler](/en-US/docs/Web/HTML/Reference/Attributes#event_handler_attributes), chuỗi được truyền cho {{domxref("Window.setTimeout", "setTimeout()")}}, và các hàm liên quan là thân hàm hoặc toàn bộ script, và việc bật strict mode trong chúng hoạt động như mong đợi.

### Strict mode cho script

Để bật strict mode cho toàn bộ script, đặt câu lệnh _chính xác_ `"use strict";` (hoặc `'use strict';`) trước bất kỳ câu lệnh nào khác.

```js
// Whole-script strict mode syntax
"use strict";
const v = "Hi! I'm a strict mode script!";
```

### Strict mode cho hàm

Tương tự, để bật strict mode cho một hàm, đặt câu lệnh _chính xác_ `"use strict";` (hoặc `'use strict';`) trong thân hàm trước bất kỳ câu lệnh nào khác.

```js
function myStrictFunction() {
  // Function-level strict mode syntax
  "use strict";
  function nested() {
    return "And so am I!";
  }
  return `Hi! I'm a strict mode function! ${nested()}`;
}
function myNotStrictFunction() {
  return "I'm not strict.";
}
```

Chỉ thị `"use strict"` chỉ có thể được áp dụng cho thân hàm với tham số đơn giản. Sử dụng `"use strict"` trong hàm với tham số [rest](/en-US/docs/Web/JavaScript/Reference/Functions/rest_parameters), [default](/en-US/docs/Web/JavaScript/Reference/Functions/Default_parameters) hoặc [destructured](/en-US/docs/Web/JavaScript/Reference/Operators/Destructuring) là [lỗi cú pháp](/en-US/docs/Web/JavaScript/Reference/Errors/Strict_non_simple_params).

```js-nolint example-bad
function sum(a = 1, b = 2) {
  // SyntaxError: "use strict" not allowed in function with default parameter
  "use strict";
  return a + b;
}
```

### Strict mode cho module

Toàn bộ nội dung của [JavaScript module](/en-US/docs/Web/JavaScript/Guide/Modules) tự động ở chế độ strict mode, không cần câu lệnh nào để khởi tạo nó.

```js
function myStrictFunction() {
  // because this is a module, I'm strict by default
}
export default myStrictFunction;
```

### Strict mode cho lớp

Tất cả các phần của thân [lớp](/en-US/docs/Web/JavaScript/Reference/Classes) đều là mã strict mode, bao gồm cả [khai báo lớp](/en-US/docs/Web/JavaScript/Reference/Statements/class) và [biểu thức lớp](/en-US/docs/Web/JavaScript/Reference/Operators/class).

```js
class C1 {
  // All code here is evaluated in strict mode
  test() {
    delete Object.prototype;
  }
}
new C1().test(); // TypeError, because test() is in strict mode

const C2 = class {
  // All code here is evaluated in strict mode
};

// Code here may not be in strict mode
delete Object.prototype; // Will not throw error
```

## Thay đổi trong strict mode

Strict mode thay đổi cả cú pháp và hành vi runtime. Các thay đổi thường thuộc các danh mục sau:

- thay đổi chuyển đổi lỗi thành lỗi (dưới dạng lỗi cú pháp hoặc tại runtime)
- thay đổi đơn giản hóa cách tham chiếu biến được giải quyết
- thay đổi đơn giản hóa `eval` và `arguments`
- thay đổi giúp viết JavaScript "an toàn" dễ dàng hơn
- thay đổi dự đoán sự phát triển của ECMAScript trong tương lai.

### Chuyển đổi lỗi thành lỗi thực

Strict mode thay đổi một số lỗi được chấp nhận trước đây thành lỗi thực sự. JavaScript được thiết kế để dễ dàng cho các nhà phát triển mới, và đôi khi nó cho phép các thao tác mà lẽ ra phải là lỗi nhưng lại có ngữ nghĩa không phải lỗi. Đôi khi điều này sửa vấn đề ngay lập tức, nhưng đôi khi tạo ra vấn đề tồi tệ hơn trong tương lai. Strict mode coi những lỗi này là lỗi thực để chúng được phát hiện và sửa chữa kịp thời.

#### Gán cho biến chưa được khai báo

Strict mode khiến không thể vô tình tạo biến toàn cục. Trong sloppy mode, gõ nhầm một biến trong phép gán tạo ra một thuộc tính mới trên đối tượng toàn cục và tiếp tục "hoạt động". Các phép gán vô tình tạo ra biến toàn cục sẽ ném lỗi trong strict mode:

<!-- cSpell:ignore mistypeVarible -->

```js
"use strict";
let mistypeVariable;

// Assuming no global variable mistypeVarible exists
// this line throws a ReferenceError due to the
// misspelling of "mistypeVariable" (lack of an "a")
mistypeVarible = 17;
```

#### Không thể gán cho thuộc tính đối tượng

Trong strict mode, một số phép gán ném lỗi thay vì thất bại im lặng. Có ba cách để phép gán thuộc tính thất bại:

- gán cho thuộc tính dữ liệu non-writable
- gán cho thuộc tính accessor chỉ có getter
- gán thuộc tính mới cho đối tượng [non-extensible](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Object/isExtensible)

Ví dụ, [`NaN`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/NaN) là một biến toàn cục non-writable. Trong sloppy mode, gán cho `NaN` không làm gì; nhà phát triển không nhận được phản hồi lỗi. Trong strict mode, gán cho `NaN` ném một ngoại lệ.

```js
"use strict";

// Assignment to a non-writable global
undefined = 5; // TypeError
Infinity = 5; // TypeError

// Assignment to a non-writable property
const obj1 = {};
Object.defineProperty(obj1, "x", { value: 42, writable: false });
obj1.x = 9; // TypeError

// Assignment to a getter-only property
const obj2 = {
  get x() {
    return 17;
  },
};
obj2.x = 5; // TypeError

// Assignment to a new property on a non-extensible object
const fixed = {};
Object.preventExtensions(fixed);
fixed.newProp = "ohai"; // TypeError
```

#### Không thể xóa thuộc tính đối tượng

Các cố gắng [xóa](/en-US/docs/Web/JavaScript/Reference/Operators/delete) một thuộc tính non-configurable hoặc không thể xóa được (ví dụ như bị chặn bởi proxy's [`deleteProperty`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Proxy/Proxy/deleteProperty) handler trả về `false`) sẽ ném lỗi trong strict mode (trước đây thao tác này không có tác dụng):

```js
"use strict";
delete Object.prototype; // TypeError
delete [].length; // TypeError
```

Strict mode cũng cấm xóa tên thuần túy. `delete name` trong strict mode là lỗi cú pháp:

```js-nolint example-bad
"use strict";

var x;
delete x; // syntax error
```

Nếu tên là thuộc tính toàn cục có thể cấu hình, hãy đặt tiền tố [`globalThis`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/globalThis) để xóa nó.

```js example-good
"use strict";

delete globalThis.x;
```

#### Tên tham số trùng lặp

Strict mode yêu cầu tên tham số hàm phải là duy nhất. Trong sloppy mode, đối số trùng lặp cuối cùng ẩn các đối số có tên giống nhau trước đó. Những đối số trước đó vẫn có thể truy cập qua [`arguments`](/en-US/docs/Web/JavaScript/Reference/Functions/arguments), vì vậy chúng không hoàn toàn không thể truy cập. Tuy nhiên, việc ẩn này ít có ý nghĩa và có thể không mong muốn (ví dụ, nó có thể ẩn một lỗi đánh máy), vì vậy trong strict mode, tên đối số trùng lặp là lỗi cú pháp:

```js-nolint example-bad
function sum(a, a, c) {
  // syntax error
  "use strict";
  return a + a + c; // wrong if this code ran
}
```

Cũng là lỗi cú pháp trong non-strict mode khi có tên tham số trùng lặp, nếu hàm có tham số default, rest hoặc destructured.

#### Legacy octal literal

Strict mode [cấm octal literal có tiền tố `0`](/en-US/docs/Web/JavaScript/Reference/Errors/Deprecated_octal_literal). Trong sloppy mode, số bắt đầu bằng `0`, chẳng hạn như `0644`, được diễn giải là số bát phân (`0644 === 420`), nếu tất cả các chữ số nhỏ hơn 8. Các nhà phát triển mới đôi khi tin rằng tiền tố số không không có ý nghĩa ngữ nghĩa, vì vậy họ có thể dùng nó như thiết bị căn chỉnh — nhưng điều này thay đổi ý nghĩa của số! Cú pháp số không đứng đầu cho bát phân hiếm khi hữu ích và có thể bị sử dụng nhầm, vì vậy strict mode biến nó thành lỗi cú pháp:

```js-nolint example-bad
"use strict";
const sum =
  015 + // syntax error
  197 +
  142;
```

Cách chuẩn để ký hiệu bát phân literal là thông qua tiền tố `0o`. Ví dụ:

```js example-good
const sumWithOctal = 0o10 + 8;
console.log(sumWithOctal); // 16
```

Octal escape sequence, chẳng hạn như `"\45"`, bằng `"%"`, có thể được dùng để biểu diễn ký tự bằng số mã ký tự {{Glossary("ASCII")}} mở rộng trong hệ bát phân. Trong strict mode, đây là [lỗi cú pháp](/en-US/docs/Web/JavaScript/Reference/Errors/Deprecated_octal_escape_sequence). Chính thức hơn, không được phép có `\` theo sau bởi bất kỳ chữ số thập phân nào khác `0`, hoặc `\0` theo sau bởi chữ số thập phân; ví dụ `\9` và `\07`.

#### Đặt thuộc tính trên giá trị primitive

Strict mode cấm đặt thuộc tính trên các giá trị [primitive](/en-US/docs/Glossary/Primitive). Truy cập thuộc tính trên primitive ngầm tạo ra đối tượng wrapper không thể quan sát được, vì vậy trong sloppy mode, đặt thuộc tính bị bỏ qua (no-op). Trong strict mode, một {{jsxref("TypeError")}} được ném.

```js
"use strict";

false.true = ""; // TypeError
(14).sailing = "home"; // TypeError
"with".you = "far away"; // TypeError
```

#### Tên thuộc tính trùng lặp

Tên thuộc tính trùng lặp từng được coi là {{jsxref("SyntaxError")}} trong strict mode. Với sự ra đời của [tên thuộc tính được tính toán](/en-US/docs/Web/JavaScript/Reference/Operators/Object_initializer#computed_property_names), làm cho việc trùng lặp có thể xảy ra tại runtime, hạn chế này đã được gỡ bỏ trong ES2015.

```js
"use strict";
const o = { p: 1, p: 2 }; // syntax error prior to ECMAScript 2015
```

> [!NOTE]
> Việc làm cho mã từng báo lỗi trở nên không lỗi luôn được coi là tương thích ngược. Đây là một phần tốt của ngôn ngữ khi nghiêm ngặt về việc ném lỗi: nó để lại không gian cho các thay đổi ngữ nghĩa trong tương lai.

### Đơn giản hóa quản lý phạm vi

Strict mode đơn giản hóa cách tên biến ánh xạ đến định nghĩa biến cụ thể trong mã. Nhiều tối ưu hóa trình biên dịch phụ thuộc vào khả năng nói rằng biến _X_ được lưu trữ ở _vị trí_ đó: điều này quan trọng để tối ưu hóa hoàn toàn mã JavaScript. JavaScript đôi khi làm cho ánh xạ cơ bản này từ tên đến định nghĩa biến trong mã không thể thực hiện cho đến runtime. Strict mode loại bỏ hầu hết các trường hợp này, vì vậy trình biên dịch có thể tối ưu hóa mã strict mode tốt hơn.

#### Xóa câu lệnh with

Strict mode cấm [`with`](/en-US/docs/Web/JavaScript/Reference/Statements/with). Vấn đề với `with` là bất kỳ tên nào bên trong block có thể ánh xạ đến thuộc tính của đối tượng được truyền vào nó, hoặc đến biến trong phạm vi bao quanh (hoặc thậm chí toàn cục) tại runtime; không thể biết trước cái nào. Strict mode biến `with` thành lỗi cú pháp, vì vậy không có cơ hội cho tên trong `with` tham chiếu đến vị trí không xác định tại runtime:

```js-nolint example-bad
"use strict";
const x = 17;
with (obj) {
  // Syntax error
  // If this weren't strict mode, would this be const x, or
  // would it instead be obj.x? It's impossible in general
  // to say without running the code, so the name can't be
  // optimized.
  x;
}
```

Thay thế bằng cách gán đối tượng cho một biến tên ngắn, sau đó truy cập thuộc tính tương ứng trên biến đó, sẵn sàng thay thế `with`.

#### eval không rò rỉ

Trong strict mode, [`eval` không giới thiệu biến mới vào phạm vi bao quanh](https://whereswalden.com/2011/01/10/new-es5-strict-mode-support-new-vars-created-by-strict-mode-eval-code-are-local-to-that-code-only/). Trong sloppy mode, `eval("var x;")` giới thiệu biến `x` vào hàm bao quanh hoặc phạm vi toàn cục. Điều này có nghĩa là, trong general, trong hàm chứa lời gọi đến `eval`, mỗi tên không tham chiếu đến đối số hoặc biến cục bộ phải được ánh xạ đến một định nghĩa cụ thể tại runtime (vì `eval` đó có thể đã giới thiệu biến mới ẩn biến bên ngoài). Trong strict mode, `eval` chỉ tạo biến cho mã đang được đánh giá, vì vậy `eval` không thể ảnh hưởng đến việc tên tham chiếu đến biến bên ngoài hay biến cục bộ nào đó:

```js
var x = 17;
var evalX = eval("'use strict'; var x = 42; x;");
console.assert(x === 17);
console.assert(evalX === 42);
```

Liệu chuỗi được truyền cho `eval()` có được đánh giá trong strict mode hay không phụ thuộc vào cách `eval()` được gọi ([direct eval hoặc indirect eval](/en-US/docs/Web/JavaScript/Reference/Global_Objects/eval#direct_and_indirect_eval)).

#### Khai báo hàm phạm vi block

Đặc tả ngôn ngữ JavaScript, từ khi bắt đầu, đã không cho phép khai báo hàm lồng trong block statement. Tuy nhiên, nó rất trực quan đến mức hầu hết các trình duyệt đã triển khai nó như một phần mở rộng ngữ pháp. Thật không may, ngữ nghĩa của các triển khai này phân kỳ, và không thể cho đặc tả ngôn ngữ điều hòa tất cả các triển khai. Do đó, [khai báo hàm phạm vi block](/en-US/docs/Web/JavaScript/Reference/Statements/function#block-level_function_declaration) chỉ được chỉ định rõ ràng trong strict mode (trước đây chúng từng bị cấm trong strict mode), trong khi hành vi sloppy mode vẫn còn phân kỳ giữa các trình duyệt.

### Làm cho eval và arguments đơn giản hơn

Strict mode làm cho [`arguments`](/en-US/docs/Web/JavaScript/Reference/Functions/arguments) và [`eval`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/eval) ít kỳ diệu hơn. Cả hai đều liên quan đến một lượng hành vi kỳ diệu đáng kể trong sloppy mode: `eval` để thêm hoặc xóa binding và thay đổi giá trị binding, và `arguments` đồng bộ hóa các đối số được đặt tên với các thuộc tính được lập chỉ mục. Strict mode tiến một bước dài trong việc coi `eval` và `arguments` như từ khóa.

#### Ngăn chặn binding hoặc gán eval và arguments

Tên `eval` và `arguments` không thể được bind hoặc gán trong cú pháp ngôn ngữ. Tất cả các cố gắng này đều là lỗi cú pháp:

```js-nolint example-bad
"use strict";
eval = 17;
arguments++;
++eval;
const obj = { set p(arguments) {} };
let eval;
try {
} catch (arguments) {}
function x(eval) {}
function arguments() {}
const y = function eval() {};
const f = new Function("arguments", "'use strict'; return 17;");
```

#### Không đồng bộ hóa giữa tham số và chỉ mục arguments

Mã strict mode không đồng bộ chỉ mục của đối tượng `arguments` với mỗi binding tham số. Trong hàm sloppy mode mà đối số đầu tiên là `arg`, đặt `arg` cũng đặt `arguments[0]`, và ngược lại (trừ khi không có đối số nào được cung cấp hoặc `arguments[0]` bị xóa). Đối tượng `arguments` cho hàm strict mode lưu trữ các đối số gốc khi hàm được gọi. `arguments[i]` không theo dõi giá trị của đối số được đặt tên tương ứng, và ngược lại đối số được đặt tên cũng không theo dõi giá trị trong `arguments[i]` tương ứng.

```js
function f(a) {
  "use strict";
  a = 42;
  return [a, arguments[0]];
}
const pair = f(17);
console.assert(pair[0] === 42);
console.assert(pair[1] === 17);
```

### "Bảo mật" JavaScript

Strict mode làm cho việc viết JavaScript "an toàn" dễ dàng hơn. Một số trang web hiện cung cấp cách để người dùng viết JavaScript sẽ được trang web chạy _thay mặt cho người dùng khác_. JavaScript trong trình duyệt có thể truy cập thông tin riêng tư của người dùng, vì vậy JavaScript đó phải được biến đổi một phần trước khi chạy, để kiểm duyệt quyền truy cập vào chức năng bị cấm. Tính linh hoạt của JavaScript khiến nó thực tế không thể làm điều này nếu không có nhiều kiểm tra runtime. Một số chức năng ngôn ngữ quá phổ biến đến mức việc thực hiện kiểm tra runtime có chi phí hiệu suất đáng kể. Một vài điều chỉnh strict mode, cộng với việc yêu cầu JavaScript do người dùng gửi là mã strict mode và được gọi theo một cách nhất định, giảm đáng kể nhu cầu về những kiểm tra runtime đó.

#### Không thay thế this

Giá trị được truyền làm `this` cho hàm trong strict mode không bị buộc thành đối tượng (còn gọi là "boxed"). Đối với hàm sloppy mode, `this` luôn là đối tượng: hoặc là đối tượng được cung cấp, nếu được gọi với `this` có giá trị đối tượng; hoặc giá trị boxed của `this`, nếu được gọi với primitive làm `this`; hoặc đối tượng toàn cục, nếu được gọi với `undefined` hoặc `null` làm `this`. (Dùng [`call`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Function/call), [`apply`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Function/apply) hoặc [`bind`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Function/bind) để chỉ định `this` cụ thể.) Không chỉ boxing tự động là chi phí hiệu suất, mà exposing đối tượng toàn cục trong trình duyệt là nguy hiểm bảo mật vì đối tượng toàn cục cung cấp quyền truy cập vào chức năng mà môi trường JavaScript "an toàn" phải hạn chế. Do đó đối với hàm strict mode, `this` được chỉ định không bị boxed thành đối tượng, và nếu không được chỉ định, `this` là `undefined` thay vì [`globalThis`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/globalThis):

```js
"use strict";
function fun() {
  return this;
}
console.assert(fun() === undefined);
console.assert(fun.call(2) === 2);
console.assert(fun.apply(null) === null);
console.assert(fun.call(undefined) === undefined);
console.assert(fun.bind(true)() === true);
```

#### Xóa thuộc tính stack-walking

Trong strict mode, không còn có thể "đi bộ" theo JavaScript stack. Nhiều triển khai từng triển khai một số tính năng mở rộng làm cho có thể phát hiện caller upstream của hàm. Khi hàm `fun` đang được gọi, [`fun.caller`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Function/caller) là hàm gọi `fun` gần nhất, và [`fun.arguments`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Function/arguments) là `arguments` cho lần gọi `fun` đó. Cả hai phần mở rộng này đều có vấn đề cho JavaScript "an toàn" vì chúng cho phép mã "secured" truy cập các hàm "privileged" và các đối số (có thể không an toàn) của chúng. Nếu `fun` ở strict mode, cả `fun.caller` và `fun.arguments` đều là thuộc tính non-deletable ném lỗi khi được đặt hoặc lấy:

```js
function restricted() {
  "use strict";
  restricted.caller; // throws a TypeError
  restricted.arguments; // throws a TypeError
}
function privilegedInvoker() {
  return restricted();
}
privilegedInvoker();
```

Tương tự, [`arguments.callee`](/en-US/docs/Web/JavaScript/Reference/Functions/arguments/callee) không còn được hỗ trợ. Trong sloppy mode, `arguments.callee` tham chiếu đến hàm bao quanh. Trường hợp sử dụng này yếu: đặt tên cho hàm bao quanh! Ngoài ra, `arguments.callee` gây trở ngại đáng kể cho các tối ưu hóa như inlining hàm, vì phải có thể cung cấp tham chiếu đến hàm không được inline nếu `arguments.callee` được truy cập. `arguments.callee` cho hàm strict mode là thuộc tính non-deletable ném lỗi khi được đặt hoặc lấy:

```js
"use strict";
function f() {
  return arguments.callee;
}
f(); // throws a TypeError
```

### Future-proofing JavaScript

#### Từ dành riêng bổ sung

[Từ dành riêng](/en-US/docs/Web/JavaScript/Reference/Lexical_grammar#reserved_words) là định danh không thể được dùng làm tên biến. Strict mode dành riêng thêm một số tên hơn sloppy mode, một số đã được sử dụng trong ngôn ngữ và một số được dành riêng cho tương lai để làm cho việc triển khai các phần mở rộng cú pháp tương lai dễ dàng hơn.

- `implements`
- `interface`
- [`let`](/en-US/docs/Web/JavaScript/Reference/Statements/let)
- `package`
- `private`
- `protected`
- `public`
- [`static`](/en-US/docs/Web/JavaScript/Reference/Classes/static)
- [`yield`](/en-US/docs/Web/JavaScript/Reference/Operators/yield)

## Chuyển đổi sang strict mode

Strict mode được thiết kế để có thể chuyển đổi dần dần sang nó. Có thể thay đổi từng file và thậm chí chuyển mã sang strict mode theo từng đơn vị hàm.

Bạn có thể migrate codebase sang strict mode bằng cách đầu tiên thêm `"use strict"` vào một phần mã nguồn, sau đó sửa tất cả lỗi thực thi, trong khi chú ý đến sự khác biệt ngữ nghĩa.

### Lỗi cú pháp

Khi thêm `'use strict';`, các trường hợp sau sẽ ném {{jsxref("SyntaxError")}} trước khi script thực thi:

- Cú pháp bát phân `const n = 023;`
- Câu lệnh [`with`](/en-US/docs/Web/JavaScript/Reference/Statements/with)
- Dùng [`delete`](/en-US/docs/Web/JavaScript/Reference/Operators/delete) trên tên biến `delete myVariable`;
- Dùng [`eval`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/eval) hoặc [`arguments`](/en-US/docs/Web/JavaScript/Reference/Functions/arguments) làm tên biến hoặc đối số hàm
- Dùng một trong những [từ khóa dành riêng](/en-US/docs/Web/JavaScript/Reference/Lexical_grammar#reserved_words) mới (dự phòng cho tính năng ngôn ngữ tương lai): `implements`, `interface`, `let`, `package`, `private`, `protected`, `public`, `static` và `yield`
- Khai báo hai tham số hàm có cùng tên `function f(a, b, b) {}`
- Khai báo tên thuộc tính giống nhau hai lần trong object literal `{a: 1, b: 3, a: 7}`. Ràng buộc này đã được gỡ bỏ sau đó ([bug 1041128](https://bugzil.la/1041128)).

Những lỗi này tốt vì chúng tiết lộ lỗi rõ ràng hoặc thực hành xấu. Chúng xảy ra trước khi mã chạy, vì vậy chúng dễ dàng phát hiện miễn là mã được runtime phân tích cú pháp.

### Lỗi runtime mới

JavaScript từng thất bại im lặng trong các ngữ cảnh mà những gì đã được thực hiện đáng ra phải là lỗi. Strict mode ném lỗi trong những trường hợp như vậy. Nếu codebase của bạn chứa những trường hợp như vậy, việc kiểm tra sẽ cần thiết để đảm bảo không có gì bị hỏng. Bạn có thể kiểm tra lỗi như vậy ở cấp độ chi tiết hàm.

- Gán cho biến chưa được khai báo ném {{jsxref("ReferenceError")}}. Trước đây điều này đặt thuộc tính trên đối tượng toàn cục, đây hiếm khi là hiệu ứng mong đợi. Nếu bạn thực sự muốn đặt giá trị cho đối tượng toàn cục, hãy gán nó rõ ràng như thuộc tính trên `globalThis`.
- Không thể gán cho thuộc tính của đối tượng (ví dụ: chỉ đọc) ném {{jsxref("TypeError")}}. Trong sloppy mode, điều này sẽ thất bại im lặng.
- Xóa thuộc tính không thể xóa ném {{jsxref("TypeError")}}. Trong sloppy mode, điều này sẽ thất bại im lặng.
- Truy cập [`arguments.callee`](/en-US/docs/Web/JavaScript/Reference/Functions/arguments/callee), [`strictFunction.caller`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Function/caller) hoặc [`strictFunction.arguments`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Function/arguments) ném {{jsxref("TypeError")}} nếu hàm ở strict mode. Nếu bạn đang dùng `arguments.callee` để gọi hàm đệ quy, bạn có thể dùng biểu thức hàm được đặt tên thay thế.

### Sự khác biệt ngữ nghĩa

Đây là những sự khác biệt rất tinh tế. Có thể bộ kiểm tra không bắt được loại sự khác biệt tinh tế này. Cần xem xét cẩn thận codebase để đảm bảo những sự khác biệt này không ảnh hưởng đến ngữ nghĩa mã của bạn. May mắn thay, việc xem xét cẩn thận này có thể được thực hiện dần dần theo đơn vị hàm.

- `this`
  - : Trong sloppy mode, lời gọi hàm như `f()` sẽ truyền đối tượng toàn cục làm giá trị `this`. Trong strict mode, bây giờ là `undefined`. Khi hàm được gọi với [`call`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Function/call) hoặc [`apply`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Function/apply), nếu giá trị là primitive value, giá trị này được boxed thành đối tượng (hoặc đối tượng toàn cục cho `undefined` và `null`). Trong strict mode, giá trị được truyền trực tiếp không chuyển đổi hoặc thay thế.
- `arguments`
  - : Trong sloppy mode, sửa đổi giá trị trong đối tượng `arguments` sửa đổi đối số được đặt tên tương ứng. Điều này làm phức tạp các tối ưu hóa cho JavaScript engine và làm cho mã khó đọc/hiểu hơn. Trong strict mode, đối tượng `arguments` được tạo và khởi tạo với cùng giá trị như đối số được đặt tên, nhưng thay đổi đối với đối tượng `arguments` hoặc đối số được đặt tên không được phản ánh trong nhau.
- `eval`
  - : Trong mã strict mode, `eval` không tạo biến mới trong phạm vi từ đó nó được gọi. Ngoài ra, tất nhiên, trong strict mode, chuỗi được đánh giá với các quy tắc strict mode. Cần thực hiện kiểm tra kỹ lưỡng để đảm bảo không có gì bị hỏng. Không dùng eval nếu bạn không thực sự cần nó có thể là một giải pháp thực tế khác.
- Khai báo hàm phạm vi block
  - : Trong sloppy mode, khai báo hàm trong block có thể hiển thị bên ngoài block và thậm chí có thể gọi được. Trong strict mode, khai báo hàm trong block chỉ hiển thị bên trong block.

## Specifications

{{Specifications}}

## See also

- [JavaScript modules](/en-US/docs/Web/JavaScript/Guide/Modules) guide
- [Lexical grammar](/en-US/docs/Web/JavaScript/Reference/Lexical_grammar)
