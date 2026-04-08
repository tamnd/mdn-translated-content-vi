---
title: Grammar and types
slug: Web/JavaScript/Guide/Grammar_and_types
page-type: guide
sidebar: jssidebar
---

{{PreviousNext("Web/JavaScript/Guide/Introduction", "Web/JavaScript/Guide/Control_flow_and_error_handling")}}

Chương này thảo luận về ngữ pháp cơ bản của JavaScript, cách khai báo biến, kiểu dữ liệu và literals.

## Cơ bản

JavaScript vay mượn phần lớn cú pháp từ Java, C, và C++, nhưng cũng chịu ảnh hưởng của Awk, Perl và Python.

JavaScript **phân biệt chữ hoa/thường** và sử dụng bộ ký tự **Unicode**. Ví dụ, từ Früh (có nghĩa là "sớm" trong tiếng Đức) có thể được dùng làm tên biến.

```js
const Früh = "foobar";
```

Tuy nhiên, biến `früh` không giống với `Früh` vì JavaScript phân biệt chữ hoa/thường.

Trong JavaScript, các lệnh được gọi là {{Glossary("Statement", "statements")}} và được phân tách bằng dấu chấm phẩy (;).

Dấu chấm phẩy không cần thiết sau một câu lệnh nếu nó được viết trên dòng riêng. Nhưng nếu muốn có nhiều hơn một câu lệnh trên một dòng, chúng _phải_ được phân tách bằng dấu chấm phẩy.

> [!NOTE]
> ECMAScript cũng có quy tắc về tự động chèn dấu chấm phẩy ([ASI](/en-US/docs/Web/JavaScript/Reference/Lexical_grammar#automatic_semicolon_insertion)) để kết thúc câu lệnh. (Để biết thêm thông tin, hãy xem tài liệu tham khảo chi tiết về [ngữ pháp từ vựng](/en-US/docs/Web/JavaScript/Reference/Lexical_grammar) của JavaScript.)

Tuy nhiên, thực hành tốt nhất là luôn viết dấu chấm phẩy sau mỗi câu lệnh, ngay cả khi không thực sự cần thiết. Thực hành này giúp giảm khả năng xuất hiện lỗi trong code.

Văn bản nguồn của script JavaScript được quét từ trái sang phải và được chuyển đổi thành một chuỗi các phần tử đầu vào gồm _tokens_, _ký tự điều khiển_, _ký tự kết thúc dòng_, _chú thích_, hoặc {{Glossary("whitespace")}}. (Dấu cách, tab và ký tự xuống dòng được coi là khoảng trắng.)

## Chú thích

Cú pháp của **chú thích** giống như trong C++ và nhiều ngôn ngữ khác:

```js
// a one line comment

/* this is a longer,
 * multi-line comment
 */
```

Bạn không thể lồng các chú thích khối. Điều này thường xảy ra khi bạn vô tình đưa chuỗi `*/` vào chú thích, điều này sẽ kết thúc chú thích.

```js-nolint example-bad
/* You can't, however, /* nest comments */ SyntaxError */
```

Trong trường hợp này, bạn cần chia nhỏ mẫu `*/`. Ví dụ, bằng cách chèn một dấu gạch chéo ngược:

```js
/* You can /* nest comments *\/ by escaping slashes */
```

Chú thích hoạt động như khoảng trắng và bị loại bỏ trong quá trình thực thi script.

> [!NOTE]
> Bạn cũng có thể gặp loại cú pháp chú thích thứ ba ở đầu một số tệp JavaScript, trông giống như sau: `#!/usr/bin/env node`.
>
> Đây được gọi là cú pháp **hashbang comment**, là một chú thích đặc biệt dùng để chỉ định đường dẫn đến JavaScript engine cụ thể sẽ thực thi script. Xem [Hashbang comments](/en-US/docs/Web/JavaScript/Reference/Lexical_grammar#hashbang_comments) để biết thêm chi tiết.

## Khai báo

JavaScript có ba loại khai báo biến.

- {{jsxref("Statements/var", "var")}}
  - : Khai báo một biến, có thể khởi tạo với một giá trị.
- {{jsxref("Statements/let", "let")}}
  - : Khai báo một biến cục bộ có phạm vi block, có thể khởi tạo với một giá trị.
- {{jsxref("Statements/const", "const")}}
  - : Khai báo một hằng số được đặt tên chỉ đọc có phạm vi block.

### Biến

Bạn sử dụng biến như các tên ký hiệu cho các giá trị trong ứng dụng. Tên biến, được gọi là {{Glossary("Identifier", "identifiers")}}, phải tuân theo một số quy tắc nhất định.

Một identifier JavaScript thường bắt đầu bằng một chữ cái, dấu gạch dưới (`_`), hoặc ký hiệu đô la (`$`). Các ký tự tiếp theo cũng có thể là chữ số (`0` – `9`). Vì JavaScript phân biệt chữ hoa/thường, chữ cái bao gồm các ký tự từ `A` đến `Z` (chữ hoa) cũng như từ `a` đến `z` (chữ thường).

Bạn có thể sử dụng hầu hết các chữ cái Unicode như `å` và `ü` trong identifier. (Để biết thêm chi tiết, hãy xem tài liệu tham khảo [ngữ pháp từ vựng](/en-US/docs/Web/JavaScript/Reference/Lexical_grammar#identifiers).) Bạn cũng có thể sử dụng [chuỗi thoát Unicode](/en-US/docs/Web/JavaScript/Reference/Lexical_grammar#string_literals) để biểu diễn các ký tự trong identifier.

Một số ví dụ về tên hợp lệ là `Number_hits`, `temp99`, `$credit`, và `_name`.

### Khai báo biến

Bạn có thể khai báo biến theo hai cách:

- Với từ khóa {{jsxref("Statements/var", "var")}}. Ví dụ: `var x = 42`. Cú pháp này có thể dùng để khai báo biến **cục bộ** và **toàn cục**, tùy thuộc vào _ngữ cảnh thực thi_.
- Với từ khóa {{jsxref("Statements/const", "const")}} hoặc {{jsxref("Statements/let", "let")}}. Ví dụ: `let y = 13`. Cú pháp này có thể dùng để khai báo biến cục bộ có phạm vi block. (Xem [Phạm vi biến](#variable_scope) bên dưới.)

Bạn có thể khai báo biến để giải nén các giá trị bằng cú pháp [destructuring](/en-US/docs/Web/JavaScript/Reference/Operators/Destructuring). Ví dụ: `const { bar } = foo`. Điều này sẽ tạo một biến có tên `bar` và gán cho nó giá trị tương ứng với khóa cùng tên từ đối tượng `foo`.

Biến nên luôn được khai báo trước khi sử dụng. JavaScript trước đây cho phép gán giá trị cho các biến chưa khai báo, điều này tạo ra một biến toàn cục **[chưa khai báo](/en-US/docs/Web/JavaScript/Reference/Statements/var#description)**. Đây là lỗi trong [strict mode](/en-US/docs/Web/JavaScript/Reference/Strict_mode#assigning_to_undeclared_variables) và nên tránh hoàn toàn.

### Khai báo và khởi tạo

Trong một câu lệnh như `let x = 42`, phần `let x` được gọi là _khai báo_ (declaration), và phần `= 42` được gọi là _khởi tạo_ (initializer). Khai báo cho phép biến được truy cập sau này trong code mà không ném ra {{jsxref("ReferenceError")}}, trong khi phần khởi tạo gán giá trị cho biến. Trong các khai báo `var` và `let`, phần khởi tạo là tùy chọn. Nếu biến được khai báo mà không có phần khởi tạo, nó được gán giá trị [`undefined`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/undefined).

```js
let x;
console.log(x); // logs "undefined"
```

Về bản chất, `let x = 42` tương đương với `let x; x = 42`.

Các khai báo `const` luôn cần có phần khởi tạo, vì chúng không cho phép bất kỳ phép gán nào sau khai báo, và việc ngầm định khởi tạo với `undefined` có khả năng là lỗi của lập trình viên.

```js-nolint example-bad
const x; // SyntaxError: Missing initializer in const declaration
```

### Phạm vi biến

Một biến có thể thuộc một trong các [phạm vi](/en-US/docs/Glossary/Scope) sau:

- Global scope: Phạm vi mặc định cho tất cả code chạy trong chế độ script.
- Module scope: Phạm vi cho code chạy trong chế độ module.
- Function scope: Phạm vi được tạo ra bởi một {{Glossary("function")}}.

Ngoài ra, các biến được khai báo bằng [`let`](/en-US/docs/Web/JavaScript/Reference/Statements/let) hoặc [`const`](/en-US/docs/Web/JavaScript/Reference/Statements/const) có thể thuộc một phạm vi bổ sung:

- Block scope: Phạm vi được tạo ra bởi một cặp dấu ngoặc nhọn (một [block](/en-US/docs/Web/JavaScript/Reference/Statements/block)).

Khi bạn khai báo một biến bên ngoài bất kỳ hàm nào, nó được gọi là biến _toàn cục_ (global), vì nó có thể được sử dụng bởi bất kỳ code nào khác trong tài liệu hiện tại. Khi bạn khai báo một biến trong một hàm, nó được gọi là biến _cục bộ_ (local), vì nó chỉ có thể được sử dụng trong hàm đó.

Các khai báo `let` và `const` cũng có thể được giới hạn trong [câu lệnh block](/en-US/docs/Web/JavaScript/Guide/Control_flow_and_error_handling#block_statement) mà chúng được khai báo.

```js
if (Math.random() > 0.5) {
  const y = 5;
}
console.log(y); // ReferenceError: y is not defined
```

Tuy nhiên, các biến được tạo bằng `var` không có phạm vi block mà chỉ cục bộ trong _hàm (hoặc phạm vi toàn cục)_ chứa block đó.

Ví dụ, code sau sẽ in ra `5`, vì phạm vi của `x` là ngữ cảnh toàn cục (hoặc ngữ cảnh hàm nếu code là một phần của hàm). Phạm vi của `x` không bị giới hạn trong block `if` ngay trước đó.

```js
if (true) {
  var x = 5;
}
console.log(x); // x is 5
```

### Variable hoisting

Các biến được khai báo bằng `var` được [hoisted](/en-US/docs/Glossary/Hoisting), nghĩa là bạn có thể tham chiếu đến biến ở bất cứ đâu trong phạm vi của nó, ngay cả khi khai báo chưa được thực thi. Bạn có thể coi các khai báo `var` như được "nâng lên" đầu hàm hoặc phạm vi toàn cục. Tuy nhiên, nếu bạn truy cập biến trước khi nó được khai báo, giá trị luôn là `undefined`, vì chỉ có _khai báo_ và _khởi tạo mặc định (với `undefined`)_ được hoisted, không phải _phép gán giá trị_.

```js
console.log(x === undefined); // true
var x = 3;

(function () {
  console.log(x); // undefined
  var x = "local value";
})();
```

Các ví dụ trên sẽ được hiểu giống như:

```js
var x;
console.log(x === undefined); // true
x = 3;

(function () {
  var x;
  console.log(x); // undefined
  x = "local value";
})();
```

Do hoisting, tất cả các câu lệnh `var` trong một hàm nên được đặt gần đầu hàm nhất có thể. Thực hành tốt nhất này giúp tăng tính rõ ràng của code.

Việc `let` và `const` có được hoisted hay không là vấn đề còn tranh luận. Tham chiếu đến biến trong block trước khai báo biến luôn dẫn đến {{jsxref("ReferenceError")}}, vì biến ở trong "[temporal dead zone](/en-US/docs/Web/JavaScript/Reference/Statements/let#temporal_dead_zone_tdz)" từ đầu block cho đến khi khai báo được xử lý.

```js
console.log(x); // ReferenceError
const x = 3;

console.log(y); // ReferenceError
let y = 3;
```

Không giống như khai báo `var` chỉ hoisted khai báo nhưng không hoisted giá trị, [khai báo hàm](/en-US/docs/Web/JavaScript/Guide/Functions#function_hoisting) được hoisted hoàn toàn — bạn có thể gọi hàm an toàn ở bất cứ đâu trong phạm vi của nó. Xem mục [hoisting](/en-US/docs/Glossary/Hoisting) trong glossary để tìm hiểu thêm.

### Biến toàn cục

Các biến toàn cục thực chất là các thuộc tính của _đối tượng toàn cục_.

Trong các trang web, đối tượng toàn cục là {{domxref("window")}}, vì vậy bạn có thể đọc và thiết lập biến toàn cục bằng cú pháp `window.variable`. Trong tất cả các môi trường, biến [`globalThis`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/globalThis) (bản thân nó cũng là một biến toàn cục) có thể được sử dụng để đọc và thiết lập biến toàn cục. Điều này nhằm cung cấp giao diện nhất quán giữa các JavaScript runtime khác nhau.

Do đó, bạn có thể truy cập các biến toàn cục được khai báo trong một window hoặc frame từ một window hoặc frame khác bằng cách chỉ định tên `window` hoặc `frame`. Ví dụ, nếu một biến tên `phoneNumber` được khai báo trong tài liệu, bạn có thể tham chiếu đến biến này từ `iframe` bằng cách dùng `parent.phoneNumber`.

### Hằng số

Bạn có thể tạo một hằng số chỉ đọc có tên với từ khóa {{jsxref("Statements/const", "const")}}. Cú pháp của identifier hằng số giống như bất kỳ identifier biến nào: phải bắt đầu bằng chữ cái, dấu gạch dưới, hoặc ký hiệu đô la (`$`), và có thể chứa các ký tự chữ, số, hoặc dấu gạch dưới.

```js
const PI = 3.14;
```

Hằng số không thể thay đổi giá trị thông qua phép gán hoặc được khai báo lại trong khi script đang chạy. Nó phải được khởi tạo với một giá trị. Các quy tắc phạm vi cho hằng số giống như cho các biến block-scope của `let`.

Bạn không thể khai báo một hằng số có cùng tên với một hàm hoặc biến trong cùng phạm vi. Ví dụ:

```js-nolint example-bad
// THIS WILL CAUSE AN ERROR
function f() {}
const f = 5;

// THIS WILL CAUSE AN ERROR TOO
function f() {
  const g = 5;
  var g;
}
```

Tuy nhiên, `const` chỉ ngăn _phép gán lại_, nhưng không ngăn _thay đổi_. Các thuộc tính của đối tượng được gán cho hằng số không được bảo vệ, vì vậy câu lệnh sau được thực thi mà không có vấn đề gì.

```js
const MY_OBJECT = { key: "value" };
MY_OBJECT.key = "otherValue";
```

Ngoài ra, nội dung của mảng cũng không được bảo vệ, vì vậy câu lệnh sau được thực thi mà không có vấn đề gì.

```js
const MY_ARRAY = ["HTML", "CSS"];
MY_ARRAY.push("JAVASCRIPT");
console.log(MY_ARRAY); // ['HTML', 'CSS', 'JAVASCRIPT'];
```

## Cấu trúc dữ liệu và kiểu dữ liệu

### Kiểu dữ liệu

Tiêu chuẩn ECMAScript mới nhất định nghĩa tám kiểu dữ liệu:

- Bảy kiểu dữ liệu là {{Glossary("Primitive", "primitives")}}:
  1. {{Glossary("Boolean")}}. `true` và `false`.
  2. {{Glossary("null")}}. Một từ khóa đặc biệt biểu thị giá trị null. (Vì JavaScript phân biệt chữ hoa/thường, `null` không giống với `Null`, `NULL`, hoặc bất kỳ biến thể nào khác.)
  3. {{Glossary("undefined")}}. Một thuộc tính cấp cao nhất có giá trị chưa được định nghĩa.
  4. {{Glossary("Number")}}. Một số nguyên hoặc số thực. Ví dụ: `42` hoặc `3.14159`.
  5. {{Glossary("BigInt")}}. Một số nguyên với độ chính xác tùy ý. Ví dụ: `9007199254740992n`.
  6. {{Glossary("String")}}. Một chuỗi ký tự đại diện cho một giá trị văn bản. Ví dụ: `"Howdy"`.
  7. [Symbol](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Symbol). Một kiểu dữ liệu mà các instance của nó là duy nhất và bất biến.

- và {{Glossary("Object")}}

Mặc dù các kiểu dữ liệu này tương đối ít, chúng cho phép bạn thực hiện các thao tác hữu ích với ứng dụng. [Hàm](/en-US/docs/Web/JavaScript/Guide/Functions) là các yếu tố cơ bản khác của ngôn ngữ. Mặc dù hàm về mặt kỹ thuật là một loại đối tượng, bạn có thể coi đối tượng như các container được đặt tên cho các giá trị, và hàm như các thủ tục mà script của bạn có thể thực hiện.

### Chuyển đổi kiểu dữ liệu

JavaScript là ngôn ngữ _kiểu động_. Điều này có nghĩa là bạn không cần chỉ định kiểu dữ liệu của biến khi khai báo. Nó cũng có nghĩa là kiểu dữ liệu được tự động chuyển đổi khi cần thiết trong quá trình thực thi script.

Ví dụ, bạn có thể định nghĩa biến như sau:

```js
let answer = 42;
```

Và sau đó, bạn có thể gán cho cùng biến đó một giá trị chuỗi, ví dụ:

```js
answer = "Thanks for all the fish!";
```

Vì JavaScript có kiểu động, phép gán này không gây ra thông báo lỗi.

### Số và toán tử '+'

Trong các biểu thức liên quan đến giá trị số và chuỗi với toán tử `+`, JavaScript chuyển đổi giá trị số thành chuỗi. Ví dụ, xem xét các câu lệnh sau:

```js
x = "The answer is " + 42; // "The answer is 42"
y = 42 + " is the answer"; // "42 is the answer"
z = "37" + 7; // "377"
```

Với tất cả các toán tử khác, JavaScript _không_ chuyển đổi giá trị số thành chuỗi. Ví dụ:

```js
"37" - 7; // 30
"37" * 7; // 259
```

### Chuyển đổi chuỗi thành số

Trong trường hợp một giá trị đại diện cho số được lưu trong bộ nhớ dưới dạng chuỗi, có các phương thức để chuyển đổi.

- {{jsxref("parseInt()")}}
- {{jsxref("parseFloat()")}}
- {{jsxref("Number()")}}

`parseInt` chỉ trả về số nguyên, vì vậy việc sử dụng nó cho số thập phân bị hạn chế.

> [!NOTE]
> Ngoài ra, thực hành tốt nhất cho `parseInt` là luôn bao gồm tham số _radix_. Tham số radix được dùng để chỉ định hệ số nào được sử dụng.

```js
parseInt("101", 2); // 5
```

Một phương thức thay thế để lấy số từ chuỗi là dùng toán tử `+` (unary plus). Điều này ngầm thực hiện [chuyển đổi số](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Number#number_coercion), giống như hàm {{jsxref("Number()")}}.

```js-nolint
"1.1" + "1.1"; // '1.11.1'
(+"1.1") + (+"1.1"); // 2.2
// Note: the parentheses are added for clarity, not required.
```

## Literals

_Literals_ đại diện cho các giá trị trong JavaScript. Đây là các giá trị cố định — không phải biến — mà bạn _trực tiếp_ cung cấp trong script. Phần này mô tả các loại literals sau:

- [Array literals](#array_literals)
- [Boolean literals](#boolean_literals)
- [Numeric literals](#numeric_literals)
- [Object literals](#object_literals)
- [RegExp literals](#regexp_literals)
- [String literals](#string_literals)

### Array literals

Một array literal là danh sách không hoặc nhiều biểu thức, mỗi biểu thức đại diện cho một phần tử mảng, được đặt trong dấu ngoặc vuông (`[]`). Khi bạn tạo một mảng bằng array literal, nó được khởi tạo với các giá trị được chỉ định làm phần tử của nó, và `length` của nó được đặt bằng số đối số được chỉ định.

Ví dụ sau tạo mảng `coffees` với ba phần tử và `length` là ba:

```js
const coffees = ["French Roast", "Colombian", "Kona"];
```

Một array literal tạo ra một đối tượng mảng mới mỗi khi literal được đánh giá. Ví dụ, một mảng được định nghĩa bằng literal trong phạm vi toàn cục được tạo một lần khi script tải. Tuy nhiên, nếu array literal nằm trong một hàm, một mảng mới được khởi tạo mỗi khi hàm đó được gọi.

> [!NOTE]
> Array literals tạo ra các đối tượng `Array`. Xem {{jsxref("Array")}} và [Indexed collections](/en-US/docs/Web/JavaScript/Guide/Indexed_collections) để biết thêm chi tiết về đối tượng `Array`.

#### Dấu phẩy thừa trong array literals

Nếu bạn đặt hai dấu phẩy liên tiếp trong một array literal, mảng sẽ để trống vị trí đó cho phần tử không được chỉ định. Ví dụ sau tạo mảng `fish`:

```js
const fish = ["Lion", , "Angel"];
```

Khi bạn in mảng này, bạn sẽ thấy:

```js
console.log(fish);
// [ 'Lion', <1 empty item>, 'Angel' ]
```

Lưu ý rằng phần tử thứ hai là "trống", không hoàn toàn giống như giá trị `undefined` thực sự. Khi sử dụng các phương thức duyệt mảng như [`Array.prototype.map`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Array/map), các vị trí trống bị bỏ qua. Tuy nhiên, truy cập theo chỉ mục `fish[1]` vẫn trả về `undefined`.

Nếu bạn bao gồm dấu phẩy cuối ở cuối danh sách phần tử, dấu phẩy đó sẽ bị bỏ qua.

Trong ví dụ sau, `length` của mảng là ba. Không có `myList[3]` và `myList[1]` trống. Tất cả các dấu phẩy khác trong danh sách chỉ ra một phần tử mới.

```js
const myList = ["home", , "school"];
```

Trong ví dụ sau, `length` của mảng là bốn, và `myList[0]` và `myList[2]` bị thiếu.

```js
const myList = [, "home", , "school"];
```

Trong ví dụ sau, `length` của mảng là bốn, và `myList[1]` và `myList[3]` bị thiếu. **Chỉ dấu phẩy cuối cùng bị bỏ qua.**

```js
const myList = ["home", , "school", ,];
```

> [!NOTE]
> [Dấu phẩy cuối](/en-US/docs/Web/JavaScript/Reference/Trailing_commas) giúp giữ cho git diff sạch hơn khi bạn có một mảng nhiều dòng, vì thêm một phần tử vào cuối chỉ thêm một dòng mà không thay đổi dòng trước đó.
>
> ```diff
> const myList = [
>   "home",
>   "school",
> + "hospital",
> ];
> ```

Hiểu hành vi của các dấu phẩy thừa là quan trọng để hiểu JavaScript như một ngôn ngữ.

Tuy nhiên, khi viết code của bạn, hãy khai báo tường minh các phần tử bị thiếu là `undefined`, hoặc ít nhất chèn một chú thích để làm nổi bật sự vắng mặt của nó. Làm vậy tăng tính rõ ràng và khả năng bảo trì của code.

```js-nolint
const myList = ["home", /* empty */, "school", /* empty */, ];
```

### Boolean literals

Kiểu Boolean có hai giá trị literal: `true` và `false`.

> [!NOTE]
> Đừng nhầm lẫn các giá trị Boolean primitive `true` và `false` với các giá trị true và false của đối tượng {{jsxref("Boolean")}}.
>
> Đối tượng Boolean là một wrapper bao quanh kiểu dữ liệu Boolean primitive. Xem {{jsxref("Boolean")}} để biết thêm thông tin.

### Numeric literals

Các numeric literals trong JavaScript bao gồm integer literals trong các hệ cơ số khác nhau cũng như floating-point literals trong hệ thập phân.

Lưu ý rằng đặc tả ngôn ngữ yêu cầu numeric literals phải không có dấu. Tuy nhiên, các đoạn code như `-123.4` vẫn hoàn toàn hợp lệ, được hiểu là toán tử `-` một ngôi được áp dụng cho numeric literal `123.4`.

#### Integer literals

Các integer và {{jsxref("BigInt")}} literal có thể được viết ở hệ thập phân (cơ số 10), thập lục phân (cơ số 16), bát phân (cơ số 8) và nhị phân (cơ số 2).

- Một _decimal_ integer literal là một chuỗi chữ số không có số `0` (zero) đứng đầu.
- Số `0` (zero) đứng đầu một integer literal, hoặc `0o` (hoặc `0O`) đứng đầu cho biết đó là số _bát phân_. Các integer literal bát phân chỉ có thể bao gồm các chữ số `0` – `7`.
- Tiền tố `0x` (hoặc `0X`) cho biết đó là integer literal _thập lục phân_. Các số nguyên thập lục phân có thể bao gồm các chữ số (`0` – `9`) và chữ cái `a` – `f` và `A` – `F`. (Hoa/thường không thay đổi giá trị. Do đó: `0xa` = `0xA` = `10` và `0xf` = `0xF` = `15`.)
- Tiền tố `0b` (hoặc `0B`) cho biết đó là integer literal _nhị phân_. Các integer literal nhị phân chỉ có thể bao gồm các chữ số `0` và `1`.
- Hậu tố `n` ở cuối một integer literal cho biết đó là {{jsxref("BigInt")}} literal. {{jsxref("BigInt")}} literal có thể sử dụng bất kỳ cơ số nào ở trên. Lưu ý rằng cú pháp bát phân với số 0 đứng đầu như `0123n` không được phép, nhưng `0o123n` thì được.

Một số ví dụ về integer literals:

```plain
0, 117, 123456789123456789n             (decimal, base 10)
015, 0001, 0o777777777777n              (octal, base 8)
0x1123, 0x00111, 0x123456789ABCDEFn     (hexadecimal, "hex" or base 16)
0b11, 0b0011, 0b11101001010101010101n   (binary, base 2)
```

Để biết thêm thông tin, hãy xem [Numeric literals trong tài liệu tham khảo Lexical grammar](/en-US/docs/Web/JavaScript/Reference/Lexical_grammar#numeric_literals).

#### Floating-point literals

Một floating-point literal có thể có các phần sau:

- Một số nguyên thập phân không có dấu,
- Dấu chấm thập phân (`.`),
- Phần thập phân (một số thập phân khác),
- Số mũ.

Phần số mũ là `e` hoặc `E` theo sau bởi một số nguyên, có thể có dấu (đứng trước bởi `+` hoặc `-`). Một floating-point literal phải có ít nhất một chữ số, và hoặc là dấu chấm thập phân hoặc `e` (hoặc `E`).

Tóm lại, cú pháp là:

```plain
[digits].[digits][(E|e)[(+|-)]digits]
```

Ví dụ:

```js-nolint
3.1415926
.123456789
3.1E+12
.1e-23
```

### Object literals

Một object literal là danh sách không hoặc nhiều cặp tên thuộc tính và giá trị liên kết của một đối tượng, được đặt trong dấu ngoặc nhọn (`{}`).

> [!WARNING]
> Đừng sử dụng object literal ở đầu câu lệnh! Điều này sẽ dẫn đến lỗi (hoặc hoạt động không như mong đợi), vì `{` sẽ được hiểu là bắt đầu của một block.

Sau đây là ví dụ về object literal. Phần tử đầu tiên của đối tượng `car` định nghĩa thuộc tính `myCar` và gán cho nó chuỗi mới `"Saturn"`; phần tử thứ hai, thuộc tính `getCar`, được gán ngay kết quả gọi hàm `(carTypes("Honda"))`; phần tử thứ ba, thuộc tính `special`, sử dụng biến hiện có (`sales`).

```js
const sales = "Toyota";

function carTypes(name) {
  return name === "Honda" ? name : `Sorry, we don't sell ${name}.`;
}

const car = { myCar: "Saturn", getCar: carTypes("Honda"), special: sales };

console.log(car.myCar); // Saturn
console.log(car.getCar); // Honda
console.log(car.special); // Toyota
```

Ngoài ra, bạn có thể sử dụng số hoặc chuỗi literal làm tên thuộc tính, hoặc lồng một đối tượng bên trong đối tượng khác. Ví dụ sau sử dụng các tùy chọn này.

```js
const car = { manyCars: { a: "Saab", b: "Jeep" }, 7: "Mazda" };

console.log(car.manyCars.b); // Jeep
console.log(car[7]); // Mazda
```

Tên thuộc tính của đối tượng có thể là bất kỳ chuỗi nào, kể cả chuỗi rỗng. Nếu tên thuộc tính không phải là {{Glossary("Identifier", "identifier")}} hay số hợp lệ trong JavaScript, nó phải được đặt trong dấu ngoặc kép.

Các tên thuộc tính không phải identifier hợp lệ không thể được truy cập bằng ký hiệu dấu chấm (`.`).

```js-nolint example-bad
const unusualPropertyNames = {
  "": "An empty string",
  "!": "Bang!",
};
console.log(unusualPropertyNames.""); // SyntaxError: Unexpected string
console.log(unusualPropertyNames.!); // SyntaxError: Unexpected token !
```

Thay vào đó, chúng phải được truy cập bằng ký hiệu ngoặc vuông (`[]`).

```js example-good
console.log(unusualPropertyNames[""]); // An empty string
console.log(unusualPropertyNames["!"]); // Bang!
```

#### Enhanced Object literals

Object literals hỗ trợ một loạt các cú pháp rút gọn bao gồm thiết lập prototype khi xây dựng, rút gọn cho các phép gán `foo: foo`, định nghĩa phương thức, thực hiện các lời gọi `super`, và tính toán tên thuộc tính bằng biểu thức.

Tổng hợp lại, những cú pháp này cũng đưa object literal và khai báo class lại gần nhau hơn, và cho phép thiết kế dựa trên đối tượng hưởng lợi từ một số tiện ích tương tự.

```js
const obj = {
  // __proto__
  __proto__: theProtoObj,
  // Shorthand for 'handler: handler'
  handler,
  // Methods
  toString() {
    // Super calls
    return `d ${super.toString()}`;
  },
  // Computed (dynamic) property names
  ["prop_" + (() => 42)()]: 42,
};
```

### RegExp literals

Một regex literal (được định nghĩa chi tiết [sau này](/en-US/docs/Web/JavaScript/Guide/Regular_expressions)) là một mẫu được đặt giữa các dấu gạch chéo. Sau đây là ví dụ về regex literal.

```js
const re = /ab+c/;
```

### String literals

Một string literal là không hoặc nhiều ký tự được đặt trong dấu ngoặc kép (`"`) hoặc dấu ngoặc đơn (`'`). Một chuỗi phải được giới hạn bởi dấu ngoặc cùng loại (nghĩa là, hoặc cả hai là ngoặc đơn, hoặc cả hai là ngoặc kép).

Sau đây là các ví dụ về string literal:

```js-nolint
'foo'
"bar"
'1234'
'one line \n another line'
"Joyo's cat"
```

Bạn nên sử dụng string literal trừ khi bạn đặc biệt cần sử dụng đối tượng `String`. Xem {{jsxref("String")}} để biết thêm chi tiết về đối tượng `String`.

Bạn có thể gọi bất kỳ phương thức nào của đối tượng {{jsxref("String")}} trên giá trị string literal. JavaScript tự động chuyển đổi string literal thành đối tượng String tạm thời, gọi phương thức, sau đó loại bỏ đối tượng String tạm thời đó. Bạn cũng có thể sử dụng thuộc tính `length` với string literal:

```js
// Will print the number of symbols in the string including whitespace.
console.log("Joyo's cat".length); // In this case, 10.
```

[Template literals](/en-US/docs/Web/JavaScript/Reference/Template_literals) cũng có sẵn. Template literals được đặt trong ký tự backtick (`` ` ``) ([dấu huyền](https://en.wikipedia.org/wiki/Grave_accent)) thay vì dấu ngoặc kép hoặc đơn.

Template literals cung cấp cú pháp đường cho việc xây dựng chuỗi. (Điều này tương tự với các tính năng nội suy chuỗi trong Perl, Python và nhiều ngôn ngữ khác.)

```js
// Basic literal string creation
`In JavaScript '\n' is a line-feed.`;

// Multiline strings
`In JavaScript, template strings can run
 over multiple lines, but double and single
 quoted strings cannot.`;

// String interpolation
const name = "Lev",
  time = "today";
`Hello ${name}, how are you ${time}?`;
```

[Tagged templates](/en-US/docs/Web/JavaScript/Reference/Template_literals#tagged_templates) là cú pháp ngắn gọn để chỉ định một template literal cùng với lời gọi đến hàm "tag" để phân tích nó. Một tagged template chỉ là cách ngắn gọn và có ngữ nghĩa hơn để gọi một hàm xử lý một chuỗi và một tập hợp các giá trị liên quan. Tên của hàm template tag đứng trước template literal — như trong ví dụ sau, nơi hàm template tag được đặt tên là `print`. Hàm `print` sẽ nội suy các đối số và tuần tự hóa bất kỳ đối tượng hoặc mảng nào xuất hiện, tránh vấn đề `[object Object]` phiền phức.

```js
const formatArg = (arg) => {
  if (Array.isArray(arg)) {
    // Print a bulleted list
    return arg.map((part) => `- ${part}`).join("\n");
  }
  if (arg.toString === Object.prototype.toString) {
    // This object will be serialized to "[object Object]".
    // Let's print something nicer.
    return JSON.stringify(arg);
  }
  return arg;
};

const print = (segments, ...args) => {
  // For any well-formed template literal, there will always be N args and
  // (N+1) string segments.
  let message = segments[0];
  segments.slice(1).forEach((segment, index) => {
    message += formatArg(args[index]) + segment;
  });
  console.log(message);
};

const todos = [
  "Learn JavaScript",
  "Learn Web APIs",
  "Set up my website",
  "Profit!",
];

const progress = { javascript: 20, html: 50, css: 10 };

print`I need to do:
${todos}
My current progress is: ${progress}
`;

// I need to do:
// - Learn JavaScript
// - Learn Web APIs
// - Set up my website
// - Profit!
// My current progress is: {"javascript":20,"html":50,"css":10}
```

Vì tagged template literals chỉ là cú pháp đường cho các lời gọi hàm, bạn có thể viết lại ví dụ trên thành lời gọi hàm tương đương:

```js
print(["I need to do:\n", "\nMy current progress is: ", "\n"], todos, progress);
```

Điều này có thể gợi nhớ đến kiểu nội suy của `console.log`:

```js
console.log("I need to do:\n%o\nMy current progress is: %o\n", todos, progress);
```

Bạn có thể thấy cách tagged template đọc tự nhiên hơn so với hàm "formatter" truyền thống, nơi các biến và bản thân template phải được khai báo riêng.

#### Sử dụng ký tự đặc biệt trong chuỗi

Ngoài các ký tự thông thường, bạn cũng có thể bao gồm các ký tự đặc biệt trong chuỗi, như được hiển thị trong ví dụ sau.

```js
"one line \n another line";
```

Bảng sau liệt kê các ký tự đặc biệt mà bạn có thể sử dụng trong chuỗi JavaScript.

| Ký tự       | Ý nghĩa                                                                                                                                                                                                                        |
| ----------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------ |
| `\0`        | Null Byte                                                                                                                                                                                                                      |
| `\b`        | Backspace                                                                                                                                                                                                                      |
| `\f`        | Form Feed                                                                                                                                                                                                                      |
| `\n`        | New Line                                                                                                                                                                                                                       |
| `\r`        | Carriage Return                                                                                                                                                                                                                |
| `\t`        | Tab                                                                                                                                                                                                                            |
| `\v`        | Vertical tab                                                                                                                                                                                                                   |
| `\'`        | Dấu nháy đơn hoặc apostrophe                                                                                                                                                                                                   |
| `\"`        | Dấu nháy kép                                                                                                                                                                                                                   |
| `\\`        | Ký tự gạch chéo ngược                                                                                                                                                                                                          |
| `\XXX`      | Ký tự với mã hóa Latin-1 được chỉ định bởi tối đa ba chữ số bát phân `XXX` trong khoảng từ `0` đến `377`. Ví dụ, `\251` là chuỗi bát phân cho ký hiệu bản quyền.                                                               |
| `\xXX`      | Ký tự với mã hóa Latin-1 được chỉ định bởi hai chữ số thập lục phân `XX` trong khoảng từ `00` đến `FF`. Ví dụ, `\xA9` là chuỗi thập lục phân cho ký hiệu bản quyền.                                                            |
| `\uXXXX`    | Ký tự Unicode được chỉ định bởi bốn chữ số thập lục phân `XXXX`. Ví dụ, `\u00A9` là chuỗi Unicode cho ký hiệu bản quyền. Xem [Unicode escape sequences](/en-US/docs/Web/JavaScript/Reference/Lexical_grammar#string_literals). |
| `\u{XXXXX}` | Unicode code point escapes. Ví dụ, `\u{2F804}` giống với Unicode escapes `\uD87E\uDC04`.                                                                                                                                       |

#### Thoát ký tự

Đối với các ký tự không có trong bảng, dấu gạch chéo ngược đứng trước sẽ bị bỏ qua, nhưng cách dùng này đã lỗi thời và nên tránh.

Bạn có thể chèn dấu ngoặc kép bên trong chuỗi bằng cách đặt dấu gạch chéo ngược trước nó. Đây được gọi là _thoát_ dấu ngoặc kép. Ví dụ:

```js-nolint
const quote = "He read \"The Cremation of Sam McGee\" by R.W. Service.";
console.log(quote);
```

Kết quả sẽ là:

```plain
He read "The Cremation of Sam McGee" by R.W. Service.
```

Để bao gồm dấu gạch chéo ngược thực sự trong chuỗi, bạn phải thoát ký tự gạch chéo ngược. Ví dụ, để gán đường dẫn tệp `c:\temp` cho một chuỗi, hãy dùng:

```js
const home = "c:\\temp";
```

Bạn cũng có thể thoát ký tự xuống dòng bằng cách đặt dấu gạch chéo ngược trước chúng. Dấu gạch chéo ngược và ký tự xuống dòng đều bị loại bỏ khỏi giá trị của chuỗi.

```js
const str =
  "this string \
is broken \
across multiple \
lines.";
console.log(str); // this string is broken across multiple lines.
```

## Tìm hiểu thêm

Chương này tập trung vào cú pháp cơ bản cho khai báo và kiểu dữ liệu. Để tìm hiểu thêm về các cấu trúc ngôn ngữ JavaScript, hãy xem các chương sau trong hướng dẫn này:

- Hướng dẫn [Luồng điều khiển và xử lý lỗi](/en-US/docs/Web/JavaScript/Guide/Control_flow_and_error_handling)
- [Vòng lặp và lặp lại](/en-US/docs/Web/JavaScript/Guide/Loops_and_iteration)
- [Hàm](/en-US/docs/Web/JavaScript/Guide/Functions)
- Hướng dẫn [Biểu thức và toán tử](/en-US/docs/Web/JavaScript/Guide/Expressions_and_operators)

Trong chương tiếp theo, chúng ta sẽ xem xét các cấu trúc luồng điều khiển và xử lý lỗi.

{{PreviousNext("Web/JavaScript/Guide/Introduction", "Web/JavaScript/Guide/Control_flow_and_error_handling")}}
