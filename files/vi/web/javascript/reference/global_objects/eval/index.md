---
title: eval()
slug: Web/JavaScript/Reference/Global_Objects/eval
page-type: javascript-function
browser-compat: javascript.builtins.eval
sidebar: jssidebar
---

> [!WARNING]
> Đối số truyền vào hàm này được phân tích cú pháp và thực thi động như JavaScript.
> Các API như thế này được gọi là [injection sinks](/en-US/docs/Web/API/Trusted_Types_API#concepts_and_usage), và là vector tiềm tàng cho các cuộc tấn công [cross-site-scripting (XSS)](/en-US/docs/Web/Security/Attacks/XSS).
>
> Bạn có thể giảm thiểu rủi ro này bằng cách luôn truyền đối tượng {{domxref("TrustedScript")}} thay vì chuỗi và [bắt buộc dùng trusted types](/en-US/docs/Web/API/Trusted_Types_API#using_a_csp_to_enforce_trusted_types).
>
> Xem phần [Cân nhắc về bảo mật](#cân_nhắc_về_bảo_mật) để biết thêm thông tin.

Hàm **`eval()`** đánh giá code JavaScript được biểu diễn dưới dạng chuỗi và trả về giá trị hoàn thành của nó. Nguồn được phân tích cú pháp như một script.

{{InteractiveExample("JavaScript Demo: eval()")}}

```js interactive-example
console.log(eval("2 + 2"));
// Expected output: 4

console.log(eval(new String("2 + 2")));
// Expected output: 2 + 2

console.log(eval("2 + 2") === eval("4"));
// Expected output: true

console.log(eval("2 + 2") === eval(new String("2 + 2")));
// Expected output: false
```

## Cú pháp

```js-nolint
eval(script)
```

### Tham số

- `script`
  - : Một instance {{domxref("TrustedScript")}} hoặc chuỗi đại diện cho một biểu thức, câu lệnh, hay dãy câu lệnh JavaScript. Biểu thức có thể bao gồm các biến và thuộc tính của các đối tượng hiện có. Nó sẽ được phân tích cú pháp như một script, vì vậy các khai báo [`import`](/en-US/docs/Web/JavaScript/Reference/Statements/import) (chỉ tồn tại trong module) không được phép.

### Giá trị trả về

Giá trị hoàn thành của việc đánh giá code đã cho. Nếu giá trị hoàn thành là rỗng, {{jsxref("undefined")}} được trả về. Nếu `script` không phải là {{domxref("TrustedScript")}} hay chuỗi nguyên thủy, `eval()` trả về đối số không thay đổi.

### Ngoại lệ

- {{jsxref("SyntaxError")}}
  - : Tham số `script` không thể được phân tích cú pháp như một script.
- {{jsxref("TypeError")}}
  - : `script` là chuỗi khi [Trusted Types](/en-US/docs/Web/API/Trusted_Types_API) được [bắt buộc bởi CSP](/en-US/docs/Web/API/Trusted_Types_API#using_a_csp_to_enforce_trusted_types) và không có chính sách mặc định nào được định nghĩa.

Phương thức cũng ném ra bất kỳ ngoại lệ nào xảy ra trong quá trình đánh giá code.

## Mô tả

`eval()` là một thuộc tính hàm của đối tượng toàn cục.

Đối số của hàm `eval()` là một chuỗi. Nó sẽ đánh giá chuỗi nguồn như một thân script, nghĩa là cả câu lệnh lẫn biểu thức đều được phép. Nó trả về giá trị hoàn thành của code. Đối với biểu thức, đó là giá trị mà biểu thức được đánh giá. Nhiều câu lệnh và khai báo cũng có giá trị hoàn thành, nhưng kết quả có thể gây bất ngờ (ví dụ: giá trị hoàn thành của một phép gán là giá trị được gán, nhưng giá trị hoàn thành của [`let`](/en-US/docs/Web/JavaScript/Reference/Statements/let) là undefined), vì vậy không nên dựa vào giá trị hoàn thành của câu lệnh.

Trong strict mode, khai báo biến tên `eval` hoặc gán lại `eval` là {{jsxref("SyntaxError")}}.

```js-nolint example-bad
"use strict";

const eval = 1; // SyntaxError: Unexpected eval or arguments in strict mode
```

Nếu đối số của `eval()` không phải là {{domxref("TrustedScript")}} hay chuỗi, `eval()` trả về đối số không thay đổi. Trong ví dụ sau, việc truyền đối tượng `String` thay vì kiểu nguyên thủy khiến `eval()` trả về đối tượng `String` thay vì đánh giá chuỗi.

```js
eval(new String("2 + 2")); // trả về đối tượng String chứa "2 + 2"
eval("2 + 2"); // trả về 4
```

Để giải quyết vấn đề theo cách chung, bạn có thể tự [ép kiểu đối số thành chuỗi](/en-US/docs/Web/JavaScript/Reference/Global_Objects/String#string_coercion) trước khi truyền vào `eval()`.

```js
const expression = new String("2 + 2");
eval(String(expression)); // trả về 4
```

### Eval trực tiếp và gián tiếp

Có hai chế độ gọi `eval()`: _trực tiếp_ và _gián tiếp_. Eval trực tiếp, như tên gọi, là việc _trực tiếp_ gọi hàm toàn cục `eval` với `eval(...)`. Tất cả các trường hợp khác, bao gồm gọi qua biến bí danh, qua truy cập thành viên hay biểu thức khác, hoặc qua toán tử optional chaining [`?.`](/en-US/docs/Web/JavaScript/Reference/Operators/Optional_chaining), đều là gián tiếp.

```js
// Gọi trực tiếp
eval("x + y");

// Gọi gián tiếp dùng toán tử dấu phẩy để trả về eval
(0, eval)("x + y");

// Gọi gián tiếp qua optional chaining
eval?.("x + y");

// Gọi gián tiếp qua biến lưu trữ và trả về eval
const myEval = eval;
myEval("x + y");

// Gọi gián tiếp qua truy cập thành viên
const obj = { eval };
obj.eval("x + y");
```

Eval gián tiếp có thể được coi như code được đánh giá trong một thẻ `<script>` riêng biệt. Điều này có nghĩa là:

- Eval gián tiếp hoạt động trong phạm vi toàn cục thay vì phạm vi cục bộ, và code được đánh giá không có quyền truy cập vào các biến cục bộ trong phạm vi nơi nó được gọi.

  ```js
  function test() {
    const x = 2;
    const y = 4;
    // Gọi trực tiếp, dùng phạm vi cục bộ
    console.log(eval("x + y")); // Kết quả là 6
    // Gọi gián tiếp, dùng phạm vi toàn cục
    console.log(eval?.("x + y")); // Ném lỗi vì x không được định nghĩa trong phạm vi toàn cục
  }
  ```

- Eval gián tiếp không kế thừa tính nghiêm ngặt của ngữ cảnh xung quanh, và chỉ ở [strict mode](/en-US/docs/Web/JavaScript/Reference/Strict_mode) nếu bản thân chuỗi nguồn có chỉ thị `"use strict"`.

  ```js
  function nonStrictContext() {
    eval?.(`with (Math) console.log(PI);`);
  }
  function strictContext() {
    "use strict";
    eval?.(`with (Math) console.log(PI);`);
  }
  function strictContextStrictEval() {
    "use strict";
    eval?.(`"use strict"; with (Math) console.log(PI);`);
  }
  nonStrictContext(); // Logs 3.141592653589793
  strictContext(); // Logs 3.141592653589793
  strictContextStrictEval(); // Uncaught SyntaxError: Strict mode code may not include a with statement
  ```

  Mặt khác, eval trực tiếp kế thừa tính nghiêm ngặt của ngữ cảnh gọi.

  ```js
  function nonStrictContext() {
    eval(`with (Math) console.log(PI);`);
  }
  function strictContext() {
    "use strict";
    eval(`with (Math) console.log(PI);`);
  }
  function strictContextStrictEval() {
    "use strict";
    eval(`"use strict"; with (Math) console.log(PI);`);
  }
  nonStrictContext(); // Logs 3.141592653589793
  strictContext(); // Uncaught SyntaxError: Strict mode code may not include a with statement
  strictContextStrictEval(); // Uncaught SyntaxError: Strict mode code may not include a with statement
  ```

- Các biến khai báo bằng `var` và [khai báo hàm](/en-US/docs/Web/JavaScript/Reference/Statements/function) sẽ đi vào phạm vi xung quanh nếu chuỗi nguồn không được diễn giải trong strict mode — đối với eval gián tiếp, chúng trở thành biến toàn cục. Nếu là eval trực tiếp trong ngữ cảnh strict mode, hoặc nếu chuỗi nguồn `eval` bản thân ở trong strict mode, thì các khai báo `var` và hàm không "rò rỉ" ra phạm vi xung quanh.

  ```js
  // Cả ngữ cảnh lẫn chuỗi nguồn đều không strict,
  // nên var tạo biến trong phạm vi xung quanh
  eval("var a = 1;");
  console.log(a); // 1
  // Ngữ cảnh không strict, nhưng nguồn eval là strict,
  // nên b chỉ thuộc phạm vi của script được đánh giá
  eval("'use strict'; var b = 1;");
  console.log(b); // ReferenceError: b is not defined

  function strictContext() {
    "use strict";
    // Ngữ cảnh strict, nhưng đây là gián tiếp và chuỗi nguồn
    // không strict, nên c vẫn là toàn cục
    eval?.("var c = 1;");
    // Eval trực tiếp trong ngữ cảnh strict, nên d bị giới hạn phạm vi
    eval("var d = 1;");
  }
  strictContext();
  console.log(c); // 1
  console.log(d); // ReferenceError: d is not defined
  ```

  Các khai báo [`let`](/en-US/docs/Web/JavaScript/Reference/Statements/let) và [`const`](/en-US/docs/Web/JavaScript/Reference/Statements/const) trong chuỗi được đánh giá luôn bị giới hạn phạm vi trong script đó.

- Eval trực tiếp có thể truy cập thêm các biểu thức ngữ cảnh. Ví dụ, trong thân hàm, người ta có thể dùng [`new.target`](/en-US/docs/Web/JavaScript/Reference/Operators/new.target):

  ```js
  function Ctor() {
    eval("console.log(new.target)");
  }
  new Ctor(); // [Function: Ctor]
  ```

### Đừng bao giờ dùng eval() trực tiếp!

Việc dùng `eval()` trực tiếp có nhiều vấn đề:

- `eval()` thực thi code được truyền vào với quyền của người gọi. Nếu bạn chạy `eval()` với chuỗi có thể bị tác động bởi một bên độc hại, bạn có thể kết thúc bằng việc chạy code độc hại trên máy của người dùng với quyền của trang web/extension của bạn. Quan trọng hơn, cho phép code của bên thứ ba truy cập phạm vi nơi `eval()` được gọi (nếu là eval trực tiếp) có thể dẫn đến các cuộc tấn công có thể đọc hoặc thay đổi biến cục bộ. Xem [Cân nhắc về bảo mật](#cân_nhắc_về_bảo_mật) để biết các phương pháp giảm thiểu các rủi ro này.
- `eval()` chậm hơn các phương án thay thế, vì nó phải gọi trình thông dịch JavaScript, trong khi nhiều cấu trúc khác được tối ưu hóa bởi các engine JS hiện đại.
- Các trình thông dịch JavaScript hiện đại chuyển đổi JavaScript thành mã máy. Điều này có nghĩa là bất kỳ khái niệm nào về đặt tên biến đều bị xóa bỏ. Do đó, bất kỳ cách dùng `eval()` nào sẽ buộc trình duyệt thực hiện các tìm kiếm tên biến tốn kém để tìm xem biến đó tồn tại ở đâu trong mã máy và đặt giá trị của nó. Ngoài ra, những thứ mới có thể được đưa vào biến đó thông qua `eval()`, chẳng hạn như thay đổi kiểu của biến đó, buộc trình duyệt phải đánh giá lại toàn bộ mã máy đã tạo ra.
- Các minifier bỏ qua mọi tối giản nếu phạm vi phụ thuộc bắc cầu vào `eval()`, vì nếu không thì `eval()` không thể đọc đúng biến tại thời điểm chạy.

Có nhiều trường hợp mà việc dùng `eval()` hoặc các phương thức liên quan có thể được tối ưu hóa hoặc tránh hoàn toàn.

#### Dùng eval() gián tiếp

Hãy xem đoạn code này:

```js
function looseJsonParse(obj) {
  return eval(`(${obj})`);
}
console.log(looseJsonParse("{ a: 4 - 1, b: function () {}, c: new Map() }"));
```

Chỉ cần dùng eval gián tiếp và bắt buộc strict mode có thể làm code tốt hơn nhiều:

```js
function looseJsonParse(obj) {
  return eval?.(`"use strict";(${obj})`);
}
console.log(looseJsonParse("{ a: 4 - 1, b: function () {}, c: new Map() }"));
```

Hai đoạn code trên có vẻ hoạt động theo cùng một cách, nhưng thực ra không; đoạn đầu tiên dùng eval trực tiếp có nhiều vấn đề.

- Nó chậm hơn nhiều, do kiểm tra phạm vi nhiều hơn. Chú ý `c: new Map()` trong chuỗi được đánh giá. Trong phiên bản eval gián tiếp, đối tượng đang được đánh giá trong phạm vi toàn cục, nên trình thông dịch có thể giả định an toàn rằng `Map` tham chiếu đến constructor toàn cục `Map()` thay vì biến cục bộ tên `Map`. Tuy nhiên, trong code dùng eval trực tiếp, trình thông dịch không thể giả định điều này. Ví dụ, trong code sau, `Map` trong chuỗi được đánh giá không tham chiếu đến `window.Map()`.

  ```js
  function looseJsonParse(obj) {
    class Map {}
    return eval(`(${obj})`);
  }
  console.log(looseJsonParse(`{ a: 4 - 1, b: function () {}, c: new Map() }`));
  ```

  Do đó, trong phiên bản code dùng `eval()`, trình duyệt bị buộc phải thực hiện lời gọi tra cứu tốn kém để kiểm tra xem có biến cục bộ nào tên `Map()` không.

- Nếu không dùng strict mode, các khai báo `var` trong nguồn `eval()` trở thành biến trong phạm vi xung quanh. Điều này dẫn đến các vấn đề khó debug nếu chuỗi được lấy từ đầu vào bên ngoài, đặc biệt nếu có biến hiện có cùng tên.
- Eval trực tiếp có thể đọc và thay đổi các binding trong phạm vi xung quanh, có thể dẫn đến việc đầu vào bên ngoài làm hỏng dữ liệu cục bộ.
- Khi dùng `eval` trực tiếp, đặc biệt khi nguồn eval không thể được chứng minh là ở strict mode, engine — và các build tool — phải vô hiệu hóa tất cả các tối ưu hóa liên quan đến inlining, vì nguồn `eval()` có thể phụ thuộc vào bất kỳ tên biến nào trong phạm vi xung quanh.

Tuy nhiên, việc dùng `eval()` gián tiếp không cho phép truyền các binding bổ sung ngoài các biến toàn cục hiện có để nguồn được đánh giá đọc. Nếu bạn cần chỉ định các biến bổ sung mà nguồn được đánh giá có quyền truy cập, hãy xem xét dùng constructor `Function()`.

#### Dùng constructor Function()

Constructor [`Function()`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Function) rất giống với ví dụ eval gián tiếp ở trên: nó cũng đánh giá nguồn JavaScript được truyền vào trong phạm vi toàn cục mà không đọc hay thay đổi bất kỳ binding cục bộ nào, và do đó cho phép engine thực hiện nhiều tối ưu hóa hơn so với `eval()` trực tiếp.

Sự khác biệt giữa `eval()` và `Function()` là chuỗi nguồn truyền vào `Function()` được phân tích cú pháp như thân hàm, không phải script. Có một vài sắc thái — ví dụ: bạn có thể dùng câu lệnh `return` ở cấp độ đầu trong thân hàm, nhưng không được trong script.

Constructor `Function()` hữu ích nếu bạn muốn tạo các binding cục bộ trong nguồn eval, bằng cách truyền các biến như các tham số binding.

```js
function add(a, b) {
  return a + b;
}
function runCodeWithAddFunction(obj) {
  return Function("add", `"use strict";return (${obj});`)(add);
}
console.log(runCodeWithAddFunction("add(5, 7)")); // 12
```

Cả `eval()` lẫn `Function()` đều ngầm đánh giá code tùy ý, và đều bị cấm trong các cài đặt [CSP](/en-US/docs/Web/HTTP/Guides/CSP) nghiêm ngặt. Cũng có các phương án thay thế an toàn hơn (và nhanh hơn!) cho `eval()` hoặc `Function()` đối với các trường hợp sử dụng phổ biến.

#### Dùng bracket accessors

Bạn không nên dùng `eval()` để truy cập thuộc tính động. Hãy xem ví dụ sau, trong đó thuộc tính của đối tượng cần truy cập không được biết cho đến khi code thực thi. Điều này có thể được thực hiện với `eval()`:

```js
const obj = { a: 20, b: 30 };
const propName = getPropName(); // returns "a" or "b"

const result = eval(`obj.${propName}`);
```

Tuy nhiên, `eval()` không cần thiết ở đây — thực ra, nó dễ gây lỗi hơn, vì nếu `propName` không phải là một định danh hợp lệ, nó dẫn đến lỗi cú pháp. Hơn nữa, nếu `getPropName` không phải là hàm bạn kiểm soát, điều này có thể dẫn đến thực thi code tùy ý. Thay vào đó, hãy dùng [property accessors](/en-US/docs/Web/JavaScript/Reference/Operators/Property_accessors), nhanh hơn và an toàn hơn nhiều:

```js
const obj = { a: 20, b: 30 };
const propName = getPropName(); // returns "a" or "b"
const result = obj[propName]; // obj["a"] is the same as obj.a
```

Bạn thậm chí có thể dùng phương pháp này để truy cập các thuộc tính con. Dùng `eval()`, điều này sẽ trông như sau:

```js
const obj = { a: { b: { c: 0 } } };
const propPath = getPropPath(); // suppose it returns "a.b.c"

const result = eval(`obj.${propPath}`); // 0
```

Có thể tránh `eval()` ở đây bằng cách tách đường dẫn thuộc tính và lặp qua các thuộc tính khác nhau:

```js
function getDescendantProp(obj, desc) {
  const arr = desc.split(".");
  while (arr.length) {
    obj = obj[arr.shift()];
  }
  return obj;
}

const obj = { a: { b: { c: 0 } } };
const propPath = getPropPath(); // suppose it returns "a.b.c"
const result = getDescendantProp(obj, propPath); // 0
```

Đặt thuộc tính theo cách đó cũng tương tự:

```js
function setDescendantProp(obj, desc, value) {
  const arr = desc.split(".");
  while (arr.length > 1) {
    obj = obj[arr.shift()];
  }
  return (obj[arr[0]] = value);
}

const obj = { a: { b: { c: 0 } } };
const propPath = getPropPath(); // suppose it returns "a.b.c"
const result = setDescendantProp(obj, propPath, 1); // obj.a.b.c is now 1
```

Tuy nhiên, hãy lưu ý rằng việc dùng bracket accessors với đầu vào không bị ràng buộc cũng không an toàn — nó có thể dẫn đến [các cuộc tấn công object injection](https://github.com/eslint-community/eslint-plugin-security/blob/main/docs/the-dangers-of-square-bracket-notation.md).

#### Dùng callbacks

JavaScript có [hàm hạng nhất](/en-US/docs/Glossary/First-class_Function), nghĩa là bạn có thể truyền hàm làm đối số cho các API khác, lưu chúng trong biến và thuộc tính của đối tượng, v.v. Nhiều DOM API được thiết kế với điều này, vì vậy bạn có thể (và nên) viết:

```js
// Thay vì setTimeout("…", 1000) hãy dùng:
setTimeout(() => {
  // …
}, 1000);

// Thay vì elt.setAttribute("onclick", "…") hãy dùng:
elt.addEventListener("click", () => {
  // …
});
```

[Closure](/en-US/docs/Web/JavaScript/Guide/Closures) cũng hữu ích như một cách tạo các hàm có tham số mà không cần nối chuỗi.

#### Dùng JSON

Nếu chuỗi bạn đang gọi `eval()` chứa dữ liệu (ví dụ: mảng: `"[1, 2, 3]"`), thay vì code, bạn nên xem xét chuyển sang {{Glossary("JSON")}}, cho phép chuỗi dùng tập con cú pháp JavaScript để biểu diễn dữ liệu.

Lưu ý rằng vì cú pháp JSON bị giới hạn hơn so với cú pháp JavaScript, nhiều literal JavaScript hợp lệ sẽ không phân tích cú pháp được như JSON. Ví dụ, dấu phẩy thừa không được phép trong JSON, và tên thuộc tính (key) trong object literal phải được đặt trong dấu ngoặc kép. Hãy chắc chắn dùng JSON serializer để tạo các chuỗi sẽ được phân tích cú pháp sau này như JSON.

Việc truyền dữ liệu được ràng buộc cẩn thận thay vì code tùy ý là một ý tưởng tốt nói chung. Ví dụ, một extension được thiết kế để scrape nội dung của các trang web có thể có các quy tắc scraping được định nghĩa trong [XPath](/en-US/docs/Web/XML/XPath) thay vì code JavaScript.

### Cân nhắc về bảo mật

Phương thức có thể được dùng để thực thi đầu vào tùy ý với quyền của người gọi. Nếu đầu vào là chuỗi có thể không an toàn được cung cấp bởi người dùng, đây là vector có thể cho các cuộc tấn công [Cross-site-scripting (XSS)](/en-US/docs/Web/Security/Attacks/XSS).

Ví dụ, đoạn code sau cho thấy `eval()` có thể thực thi `untrustedCode` được cung cấp bởi người dùng:

```js example-bad
const untrustedCode = "alert('Potentially evil code!');";
const adder = eval(untrustedCode);
```

Các website có [Content Security Policy (CSP)](/en-US/docs/Web/HTTP/Guides/CSP) chỉ định [`script-src`](/en-US/docs/Web/HTTP/Reference/Headers/Content-Security-Policy/script-src) hoặc [`default-src`](/en-US/docs/Web/HTTP/Reference/Headers/Content-Security-Policy/default-src) sẽ ngăn code như vậy chạy theo mặc định. Nếu bạn phải cho phép các script chạy qua `eval()`, bạn có thể giảm thiểu rủi ro bằng cách luôn gán instance {{domxref("TrustedScript")}} thay vì chuỗi, và [bắt buộc dùng trusted types](/en-US/docs/Web/API/Trusted_Types_API#using_a_csp_to_enforce_trusted_types) sử dụng chỉ thị CSP [`require-trusted-types-for`](/en-US/docs/Web/HTTP/Reference/Headers/Content-Security-Policy/require-trusted-types-for). Điều này đảm bảo rằng đầu vào được truyền qua hàm chuyển đổi.

Để cho phép `eval()` chạy, bạn cũng cần chỉ định [từ khóa `trusted-types-eval`](/en-US/docs/Web/HTTP/Reference/Headers/Content-Security-Policy#trusted-types-eval) trong chỉ thị `script-src` CSP của bạn. Từ khóa [`unsafe-eval`](/en-US/docs/Web/HTTP/Reference/Headers/Content-Security-Policy#unsafe-eval) cũng cho phép `eval()`, nhưng kém an toàn hơn nhiều so với `trusted-types-eval` vì nó sẽ cho phép thực thi ngay cả trên các trình duyệt không hỗ trợ trusted types.

Ví dụ, CSP cần thiết cho site của bạn có thể trông như sau:

```http
Content-Security-Policy: require-trusted-types-for 'script'; script-src '<your_allowlist>' 'trusted-types-eval'
```

Hành vi của hàm chuyển đổi được triển khai trong chính sách trusted types của bạn phụ thuộc vào trường hợp sử dụng cụ thể yêu cầu script do người dùng cung cấp. Nếu có thể, bạn nên khóa các script được phép chính xác là code mà bạn tin tưởng để chạy. Nếu điều đó không thể, bạn có thể cho phép hoặc chặn việc sử dụng các hàm nhất định trong đầu vào được cung cấp.

## Ví dụ

Lưu ý rằng ví dụ đầu tiên cho thấy cách dùng phương thức với trusted types. Các ví dụ khác bỏ qua bước này để ngắn gọn.

### Dùng TrustedScript

Để giảm thiểu rủi ro XSS, chúng ta nên luôn gán instance `TrustedScript` cho tham số `script`. Chúng ta cũng cần làm điều này nếu chúng ta đang bắt buộc trusted types vì các lý do khác và muốn cho phép một số nguồn script đã được cấp phép (bởi `CSP: script-src`).

Trusted types chưa được hỗ trợ trên tất cả các trình duyệt, vì vậy trước tiên chúng ta định nghĩa [trusted types tinyfill](/en-US/docs/Web/API/Trusted_Types_API#trusted_types_tinyfill). Nó hoạt động như một thay thế trong suốt cho Trusted Types JavaScript API:

```js
if (typeof trustedTypes === "undefined")
  trustedTypes = { createPolicy: (n, rules) => rules };
```

Tiếp theo chúng ta tạo {{domxref("TrustedTypePolicy")}} định nghĩa phương thức {{domxref("TrustedTypePolicy/createScript", "createScript()")}} để chuyển đổi chuỗi đầu vào thành instance {{domxref("TrustedScript")}}.

Với mục đích của ví dụ này, chúng ta giả sử có hàm `transformedScript()` định nghĩa logic chuyển đổi/lọc của chúng ta.

```js
const policy = trustedTypes.createPolicy("script-policy", {
  createScript(input) {
    const transformed = transformedScript(input); // Our filter method
    return transformed;
  },
});
```

Sau đó chúng ta dùng đối tượng `policy` để tạo đối tượng `TrustedScript` từ chuỗi đầu vào có thể không an toàn:

```js
// The potentially malicious string
const untrustedScript = "alert('Potentially evil code!');";

// Create a TrustedScriptURL instance using the policy
const trustedScript = policy.createScript(untrustedScript);
```

Đối tượng `TrustedScript` bây giờ có thể được truyền vào `eval()`:

```js
eval(trustedScript);
```

### Dùng eval()

Trong đoạn code sau, cả hai câu lệnh chứa `eval()` đều trả về 42.
Câu đầu tiên đánh giá chuỗi `"x + y + 1"`; câu thứ hai đánh giá chuỗi `"42"`.

```js
const x = 2;
const y = 39;
const z = "42";
eval("x + y + 1"); // 42
eval(z); // 42
```

### eval() trả về giá trị hoàn thành của câu lệnh

`eval()` trả về giá trị hoàn thành của câu lệnh. Đối với `if`, đó là biểu thức hoặc câu lệnh cuối cùng được đánh giá.

```js
const str = "if (a) { 1 + 1 } else { 1 + 2 }";
let a = true;
let b = eval(str);

console.log(`b is: ${b}`); // b is: 2

a = false;
b = eval(str);

console.log(`b is: ${b}`); // b is: 3
```

Ví dụ sau dùng `eval()` để đánh giá chuỗi `str`. Chuỗi này bao gồm các câu lệnh JavaScript gán cho `z` giá trị 42 nếu `x` là năm, và gán 0 cho `z` nếu không. Khi câu lệnh thứ hai được thực thi, `eval()` sẽ khiến các câu lệnh này được thực hiện, và nó cũng sẽ đánh giá tập hợp các câu lệnh và trả về giá trị được gán cho `z`, vì giá trị hoàn thành của một phép gán là giá trị được gán.

```js
const x = 5;
const str = `if (x === 5) {
  console.log("z is 42");
  z = 42;
} else {
  z = 0;
}`;

console.log("z is ", eval(str)); // z is 42  z is 42
```

Nếu bạn gán nhiều giá trị thì giá trị cuối cùng được trả về.

```js
let x = 5;
const str = `if (x === 5) {
  console.log("z is 42");
  z = 42;
  x = 420;
} else {
  z = 0;
}`;

console.log("x is", eval(str)); // z is 42  x is 420
```

### eval() như chuỗi định nghĩa hàm cần "(" và ")" làm tiền tố và hậu tố

```js
// This is a function declaration
const fctStr1 = "function a() {}";
// This is a function expression
const fctStr2 = "(function b() {})";
const fct1 = eval(fctStr1); // return undefined, but `a` is available as a global function now
const fct2 = eval(fctStr2); // return the function `b`
```

## Đặc tả kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Property accessors](/en-US/docs/Web/JavaScript/Reference/Operators/Property_accessors)
- [WebExtensions: Using eval in content scripts](/en-US/docs/Mozilla/Add-ons/WebExtensions/Content_scripts#using_eval_in_content_scripts)
