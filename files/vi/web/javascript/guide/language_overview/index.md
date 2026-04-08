---
title: JavaScript language overview
slug: Web/JavaScript/Guide/Language_overview
page-type: guide
sidebar: jssidebar
---

JavaScript là ngôn ngữ đa mô hình, động với các kiểu và toán tử, các đối tượng tích hợp tiêu chuẩn, và các phương thức. Cú pháp của nó dựa trên ngôn ngữ Java và C — nhiều cấu trúc từ các ngôn ngữ đó cũng áp dụng cho JavaScript. JavaScript hỗ trợ lập trình hướng đối tượng với [object prototypes](/en-US/docs/Web/JavaScript/Guide/Inheritance_and_the_prototype_chain) và các lớp. Nó cũng hỗ trợ lập trình hàm vì các hàm là các đối tượng [first-class](/en-US/docs/Glossary/First-class_Function) có thể dễ dàng được tạo thông qua các biểu thức và được truyền đi như bất kỳ đối tượng nào khác.

Trang này đóng vai trò là tổng quan nhanh về các tính năng ngôn ngữ JavaScript khác nhau, được viết cho những độc giả có nền tảng về các ngôn ngữ khác, chẳng hạn như C hoặc Java.

## Kiểu dữ liệu

Hãy bắt đầu bằng cách xem xét các khối xây dựng của bất kỳ ngôn ngữ nào: các kiểu. Các chương trình JavaScript thao tác với các giá trị, và tất cả các giá trị đó đều thuộc một kiểu. JavaScript cung cấp bảy _kiểu nguyên thủy_:

- [Number](/en-US/docs/Web/JavaScript/Guide/Data_structures#number_type): được sử dụng cho tất cả các giá trị số (số nguyên và số thực dấu phẩy động) ngoại trừ các số nguyên _rất_ lớn.
- [BigInt](/en-US/docs/Web/JavaScript/Guide/Data_structures#bigint_type): được sử dụng cho các số nguyên tùy ý lớn.
- [String](/en-US/docs/Web/JavaScript/Guide/Data_structures#string_type): được sử dụng để lưu trữ văn bản.
- [Boolean](/en-US/docs/Web/JavaScript/Guide/Data_structures#boolean_type): `true` và `false` — thường được sử dụng cho logic có điều kiện.
- [Symbol](/en-US/docs/Web/JavaScript/Guide/Data_structures#symbol_type): được sử dụng để tạo các định danh duy nhất không bị xung đột.
- [Undefined](/en-US/docs/Web/JavaScript/Guide/Data_structures#undefined_type): cho biết một biến chưa được gán giá trị.
- [Null](/en-US/docs/Web/JavaScript/Guide/Data_structures#null_type): cho biết một giá trị không có chủ ý.

Mọi thứ khác được gọi là [Object](/en-US/docs/Web/JavaScript/Guide/Data_structures#objects). Các kiểu đối tượng phổ biến bao gồm:

- {{jsxref("Function")}}
- {{jsxref("Array")}}
- {{jsxref("Map")}}
- {{jsxref("RegExp")}}
- {{jsxref("Error")}}

Hàm không phải là cấu trúc dữ liệu đặc biệt trong JavaScript — chúng chỉ là một kiểu đối tượng đặc biệt có thể được gọi.

### Số

JavaScript có hai kiểu số tích hợp: Number và BigInt.

Kiểu Number là [giá trị dấu phẩy động 64-bit độ chính xác kép IEEE 754](https://en.wikipedia.org/wiki/Double_precision_floating-point_format), có nghĩa là các số nguyên có thể được biểu diễn an toàn giữa [-(2<sup>53</sup> − 1)](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Number/MIN_SAFE_INTEGER) và [2<sup>53</sup> − 1](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Number/MAX_SAFE_INTEGER) mà không mất độ chính xác, và các số thực dấu phẩy động có thể được lưu trữ lên đến [1.79 × 10<sup>308</sup>](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Number/MAX_VALUE). Trong các số, JavaScript không phân biệt giữa số thực dấu phẩy động và số nguyên.

```js
console.log(3 / 2); // 1.5, not 1
```

Vì vậy, một _số nguyên biểu kiến_ thực ra là _ngầm định là một số thực dấu phẩy động_. Do mã hóa IEEE 754, đôi khi phép tính dấu phẩy động có thể không chính xác.

```js
console.log(0.1 + 0.2); // 0.30000000000000004
```

Đối với các phép toán yêu cầu số nguyên, như phép toán bit, số sẽ được chuyển đổi thành số nguyên 32-bit.

[Number literals](/en-US/docs/Web/JavaScript/Reference/Lexical_grammar#numeric_literals) cũng có thể có tiền tố để chỉ định cơ số (nhị phân, bát phân, thập phân, hoặc thập lục phân), hoặc hậu tố số mũ.

```js
console.log(0b111110111); // 503
console.log(0o767); // 503
console.log(0x1f7); // 503
console.log(5.03e2); // 503
```

Kiểu [BigInt](/en-US/docs/Web/JavaScript/Reference/Global_Objects/BigInt) là số nguyên có độ dài tùy ý. Hành vi của nó tương tự như các kiểu số nguyên của C (ví dụ, phép chia cắt bỏ về 0), ngoại trừ nó có thể tăng vô hạn. BigInt được chỉ định bằng một literal số với hậu tố `n`.

```js
console.log(-3n / 2n); // -1n
```

Các [toán tử số học](/en-US/docs/Web/JavaScript/Reference/Operators#arithmetic_operators) tiêu chuẩn được hỗ trợ, bao gồm cộng, trừ, số dư, v.v. BigInt và Number không thể pha trộn trong các phép tính số học.

Đối tượng {{jsxref("Math")}} cung cấp các hàm và hằng số toán học tiêu chuẩn.

```js
Math.sin(3.5);
const circumference = 2 * Math.PI * r;
```

Có ba cách để chuyển đổi chuỗi thành số:

- {{jsxref("parseInt()")}}, phân tích chuỗi để lấy số nguyên.
- {{jsxref("parseFloat()")}}, phân tích chuỗi để lấy số thực dấu phẩy động.
- Hàm [`Number()`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Number/Number), phân tích chuỗi như thể nó là một literal số và hỗ trợ nhiều biểu diễn số khác nhau.

Bạn cũng có thể sử dụng [dấu cộng đơn nguyên `+`](/en-US/docs/Web/JavaScript/Reference/Operators/Unary_plus) như một cách viết tắt của `Number()`.

Các giá trị Number cũng bao gồm {{jsxref("NaN")}} (viết tắt của "Not a Number") và {{jsxref("Infinity")}}. Nhiều phép tính toán học "không hợp lệ" sẽ trả về `NaN` — ví dụ, nếu cố gắng phân tích một chuỗi không phải số, hoặc dùng [`Math.log()`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Math/log) trên một giá trị âm. Chia cho 0 tạo ra `Infinity` (dương hoặc âm).

`NaN` có tính lây lan: nếu bạn cung cấp nó như một toán hạng cho bất kỳ phép tính toán học nào, kết quả cũng sẽ là `NaN`. `NaN` là giá trị duy nhất trong JavaScript không bằng chính nó (theo đặc tả IEEE 754).

### Chuỗi

Chuỗi trong JavaScript là các chuỗi ký tự Unicode. Đây là tin tốt cho bất kỳ ai đã phải xử lý vấn đề quốc tế hóa. Chính xác hơn, chúng được [mã hóa UTF-16](/en-US/docs/Web/JavaScript/Reference/Global_Objects/String#utf-16_characters_unicode_code_points_and_grapheme_clusters).

```js
console.log("Hello, world");
console.log("你好，世界！"); // Nearly all Unicode characters can be written literally in string literals
```

Chuỗi có thể được viết với dấu nháy đơn hoặc dấu nháy kép — JavaScript không phân biệt giữa ký tự và chuỗi. Nếu bạn muốn biểu diễn một ký tự đơn, bạn chỉ cần dùng chuỗi gồm ký tự đơn đó.

```js
console.log("Hello"[1] === "e"); // true
```

Để tìm độ dài của một chuỗi (tính theo [đơn vị code](/en-US/docs/Glossary/Code_unit)), truy cập thuộc tính [`length`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/String/length) của nó.

Chuỗi có [các phương thức tiện ích](/en-US/docs/Web/JavaScript/Reference/Global_Objects/String#instance_methods) để thao tác chuỗi và truy cập thông tin về chuỗi. Vì tất cả các primitive đều không thể thay đổi theo thiết kế, những phương thức này trả về các chuỗi mới.

Toán tử `+` được nạp chồng cho chuỗi: khi một trong các toán hạng là chuỗi, nó thực hiện nối chuỗi thay vì cộng số. Cú pháp [template literal](/en-US/docs/Web/JavaScript/Reference/Template_literals) đặc biệt cho phép bạn viết chuỗi với các biểu thức nhúng một cách ngắn gọn hơn. Không như f-string của Python hay chuỗi nội suy của C#, template literal sử dụng dấu backtick (không phải dấu nháy đơn hay kép).

```js
const age = 25;
console.log("I am " + age + " years old."); // String concatenation
console.log(`I am ${age} years old.`); // Template literal
```

### Các kiểu khác

JavaScript phân biệt giữa [`null`](/en-US/docs/Web/JavaScript/Reference/Operators/null), cho biết giá trị không có chủ ý (và chỉ có thể truy cập thông qua từ khóa `null`), và {{jsxref("undefined")}}, cho biết sự vắng mặt của giá trị. Có nhiều cách để nhận được `undefined`:

- Câu lệnh [`return`](/en-US/docs/Web/JavaScript/Reference/Statements/return) không có giá trị (`return;`) ngầm trả về `undefined`.
- Truy cập thuộc tính [object](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Object) không tồn tại (`obj.iDontExist`) trả về `undefined`.
- Khai báo biến mà không khởi tạo (`let x;`) sẽ ngầm khởi tạo biến thành `undefined`.

JavaScript có kiểu Boolean, với các giá trị có thể là `true` và `false` — cả hai đều là từ khóa. Bất kỳ giá trị nào cũng có thể được chuyển đổi thành boolean theo các quy tắc sau:

1. `false`, `0`, chuỗi rỗng (`""`), `NaN`, `null`, và `undefined` đều trở thành `false`.
2. Tất cả các giá trị khác trở thành `true`.

Bạn có thể thực hiện chuyển đổi này tường minh bằng cách sử dụng hàm [`Boolean()`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Boolean/Boolean):

```js
Boolean(""); // false
Boolean(234); // true
```

Tuy nhiên, điều này hiếm khi cần thiết, vì JavaScript sẽ thực hiện chuyển đổi này một cách im lặng khi nó mong đợi một boolean, chẳng hạn trong câu lệnh `if` (xem [Cấu trúc điều khiển](#cấu-trúc-điều-khiển)). Vì lý do này, đôi khi chúng ta nói về "[truthy](/en-US/docs/Glossary/Truthy)" và "[falsy](/en-US/docs/Glossary/Falsy)", nghĩa là các giá trị trở thành `true` và `false` tương ứng khi được sử dụng trong ngữ cảnh boolean.

Các phép toán Boolean như `&&` (logic _và_), `||` (logic _hoặc_), và `!` (logic _không_) được hỗ trợ; xem [Toán tử](#toán-tử).

Kiểu Symbol thường được sử dụng để tạo các định danh duy nhất. Mỗi symbol được tạo bằng hàm [`Symbol()`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Symbol) được đảm bảo là duy nhất. Ngoài ra, còn có các registered symbol, là các hằng số chia sẻ, và các well-known symbol, được ngôn ngữ sử dụng như "giao thức" cho các hoạt động nhất định. Bạn có thể đọc thêm về chúng trong [symbol reference](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Symbol).

## Biến

Các biến trong JavaScript được khai báo bằng một trong ba từ khóa: [`let`](/en-US/docs/Web/JavaScript/Reference/Statements/let), [`const`](/en-US/docs/Web/JavaScript/Reference/Statements/const), hoặc [`var`](/en-US/docs/Web/JavaScript/Reference/Statements/var).

`let` cho phép bạn khai báo các biến cấp khối. Biến được khai báo có thể truy cập từ _khối_ nó được bao trong.

```js
let a;
let name = "Simon";

// myLetVariable is *not* visible out here

for (let myLetVariable = 0; myLetVariable < 5; myLetVariable++) {
  // myLetVariable is only visible in here
}

// myLetVariable is *not* visible out here
```

`const` cho phép bạn khai báo các biến có giá trị không bao giờ thay đổi. Biến có thể truy cập từ _khối_ nó được khai báo trong.

```js
const Pi = 3.14; // Declare variable Pi
console.log(Pi); // 3.14
```

Một biến được khai báo với `const` không thể được gán lại.

```js-nolint example-bad
const Pi = 3.14;
Pi = 1; // will throw an error because you cannot change a constant variable.
```

Khai báo `const` chỉ ngăn _gán lại_ — chúng không ngăn _đột biến_ giá trị của biến, nếu đó là một đối tượng.

```js
const obj = {};
obj.a = 1; // no error
console.log(obj); // { a: 1 }
```

Khai báo `var` có thể có các hành vi bất ngờ (ví dụ, chúng không có phạm vi khối), và chúng không được khuyến khích trong mã JavaScript hiện đại.

Nếu bạn khai báo một biến mà không gán bất kỳ giá trị nào cho nó, giá trị của nó là `undefined`. Bạn không thể khai báo biến `const` mà không có trình khởi tạo, vì bạn không thể thay đổi nó sau đó.

Các biến được khai báo bằng `let` và `const` vẫn chiếm toàn bộ phạm vi mà chúng được định nghĩa trong, và ở trong một vùng được gọi là [temporal dead zone](/en-US/docs/Web/JavaScript/Reference/Statements/let#temporal_dead_zone_tdz) trước dòng khai báo thực tế. Điều này có một số tương tác thú vị với shadowing biến, mà không xảy ra trong các ngôn ngữ khác.

```js
function foo(x, condition) {
  if (condition) {
    console.log(x);
    const x = 2;
    console.log(x);
  }
}

foo(1, true);
```

Trong hầu hết các ngôn ngữ khác, điều này sẽ ghi "1" và "2", vì trước dòng `const x = 2`, `x` vẫn nên tham chiếu đến tham số `x` trong phạm vi bên trên. Trong JavaScript, vì mỗi khai báo chiếm toàn bộ phạm vi, điều này sẽ ném ra lỗi trên `console.log` đầu tiên: "Cannot access 'x' before initialization". Để biết thêm thông tin, xem trang tham khảo của [`let`](/en-US/docs/Web/JavaScript/Reference/Statements/let).

JavaScript là _kiểu động_. Các kiểu (như được mô tả trong [phần trước](#kiểu-dữ-liệu)) chỉ được liên kết với các giá trị, không phải với các biến. Đối với các biến được khai báo bằng `let`, bạn luôn có thể thay đổi kiểu của nó thông qua gán lại.

```js
let a = 1;
a = "foo";
```

## Toán tử

Các toán tử số học của JavaScript bao gồm `+`, `-`, `*`, `/`, `%` (số dư), và `**` (lũy thừa). Các giá trị được gán bằng `=`. Mỗi toán tử nhị phân cũng có một đối tác gán ghép như `+=` và `-=`, mở rộng thành `x = x toán_tử y`.

```js
x += 5;
x = x + 5;
```

Bạn có thể dùng `++` và `--` để tăng và giảm tương ứng. Chúng có thể được dùng như toán tử tiền tố hoặc hậu tố.

[Toán tử `+`](/en-US/docs/Web/JavaScript/Reference/Operators/Addition) cũng thực hiện nối chuỗi:

```js
"hello" + " world"; // "hello world"
```

Nếu bạn cộng chuỗi với số (hoặc giá trị khác), mọi thứ sẽ được chuyển đổi thành chuỗi trước. Điều này có thể gây nhầm lẫn cho bạn:

```js
"3" + 4 + 5; // "345"
3 + 4 + "5"; // "75"
```

Cộng một chuỗi rỗng vào gì đó là một cách hữu ích để chuyển đổi nó thành chuỗi.

[So sánh](/en-US/docs/Web/JavaScript/Reference/Operators#relational_operators) trong JavaScript có thể được thực hiện bằng `<`, `>`, `<=` và `>=`, hoạt động cho cả chuỗi và số. Để kiểm tra bằng nhau, [toán tử double-equals](/en-US/docs/Web/JavaScript/Reference/Operators/Equality) thực hiện ép kiểu nếu bạn cho nó các kiểu khác nhau, đôi khi với kết quả thú vị. Mặt khác, [toán tử triple-equals](/en-US/docs/Web/JavaScript/Reference/Operators/Strict_equality) không cố gắng ép kiểu, và thường được ưu tiên hơn.

```js
123 == "123"; // true
1 == true; // true

123 === "123"; // false
1 === true; // false
```

Double-equals và triple-equals cũng có các đối tác kiểm tra bất bằng: `!=` và `!==`.

JavaScript cũng có [toán tử bit](/en-US/docs/Web/JavaScript/Reference/Operators#bitwise_shift_operators) và [toán tử logic](/en-US/docs/Web/JavaScript/Reference/Operators#binary_logical_operators). Đáng chú ý, các toán tử logic không chỉ hoạt động với các giá trị boolean — chúng hoạt động theo "tính truthy" của giá trị.

```js
const a = 0 && "Hello"; // 0 because 0 is "falsy"
const b = "Hello" || "world"; // "Hello" because both "Hello" and "world" are "truthy"
```

Các toán tử `&&` và `||` sử dụng logic ngắn mạch, nghĩa là việc chúng có thực thi toán hạng thứ hai hay không phụ thuộc vào toán hạng đầu tiên. Điều này hữu ích để kiểm tra các đối tượng null trước khi truy cập các thuộc tính của chúng:

```js
const name = o && o.getName();
```

Hoặc để lưu vào bộ đệm các giá trị (khi các giá trị falsy không hợp lệ):

```js
const name = cachedName || (cachedName = getName());
```

Để có danh sách toàn diện về các toán tử, hãy xem [trang hướng dẫn](/en-US/docs/Web/JavaScript/Guide/Expressions_and_operators) hoặc [phần tham khảo](/en-US/docs/Web/JavaScript/Reference/Operators). Bạn có thể đặc biệt quan tâm đến [thứ tự ưu tiên của toán tử](/en-US/docs/Web/JavaScript/Reference/Operators/Operator_precedence).

## Ngữ pháp

Ngữ pháp JavaScript rất giống với họ ngôn ngữ C. Có một số điểm đáng lưu ý:

- [Identifiers](/en-US/docs/Web/JavaScript/Reference/Lexical_grammar#identifiers) có thể có ký tự Unicode, nhưng chúng không thể là một trong số các [từ dành riêng](/en-US/docs/Web/JavaScript/Reference/Lexical_grammar#keywords).
- [Comments](/en-US/docs/Web/JavaScript/Reference/Lexical_grammar#comments) thường là `//` hoặc `/* */`, trong khi nhiều ngôn ngữ scripting khác như Perl, Python, và Bash sử dụng `#`.
- Dấu chấm phẩy là tùy chọn trong JavaScript — ngôn ngữ [tự động thêm chúng](/en-US/docs/Web/JavaScript/Reference/Lexical_grammar#automatic_semicolon_insertion) khi cần. Tuy nhiên, có một số lưu ý cần chú ý, vì không như Python, dấu chấm phẩy vẫn là một phần của cú pháp.

Để tìm hiểu sâu hơn về ngữ pháp JavaScript, hãy xem [trang tham khảo về lexical grammar](/en-US/docs/Web/JavaScript/Reference/Lexical_grammar).

## Cấu trúc điều khiển

JavaScript có một tập hợp cấu trúc điều khiển tương tự các ngôn ngữ khác trong họ C. Các câu lệnh điều kiện được hỗ trợ bởi [`if` và `else`](/en-US/docs/Web/JavaScript/Reference/Statements/if...else); bạn có thể nối chúng lại:

```js
let name = "kittens";
if (name === "puppies") {
  name += " woof";
} else if (name === "kittens") {
  name += " meow";
} else {
  name += "!";
}
name === "kittens meow";
```

JavaScript không có `elif`, và `else if` thực ra chỉ là nhánh `else` bao gồm một câu lệnh `if` đơn.

JavaScript có vòng lặp [`while`](/en-US/docs/Web/JavaScript/Reference/Statements/while) và vòng lặp [`do...while`](/en-US/docs/Web/JavaScript/Reference/Statements/do...while). Cái đầu phù hợp cho các vòng lặp cơ bản; cái thứ hai dành cho các vòng lặp mà bạn muốn đảm bảo thân vòng lặp được thực thi ít nhất một lần:

```js
while (true) {
  // an infinite loop!
}

let input;
do {
  input = get_input();
} while (inputIsNotValid(input));
```

[Vòng lặp `for`](/en-US/docs/Web/JavaScript/Reference/Statements/for) của JavaScript giống như trong C và Java: nó cho phép bạn cung cấp thông tin điều khiển cho vòng lặp trên một dòng.

```js
for (let i = 0; i < 5; i++) {
  // Will execute 5 times
}
```

JavaScript cũng có hai vòng lặp for nổi bật khác: [`for...of`](/en-US/docs/Web/JavaScript/Reference/Statements/for...of), lặp qua các [iterable](/en-US/docs/Web/JavaScript/Reference/Iteration_protocols), đặc biệt là mảng, và [`for...in`](/en-US/docs/Web/JavaScript/Reference/Statements/for...in), duyệt tất cả các thuộc tính [enumerable](/en-US/docs/Web/JavaScript/Guide/Enumerability_and_ownership_of_properties) của một đối tượng.

```js
for (const value of array) {
  // do something with value
}

for (const property in object) {
  // do something with object property
}
```

Câu lệnh `switch` có thể được sử dụng cho nhiều nhánh dựa trên kiểm tra bằng nhau.

```js
switch (action) {
  case "draw":
    drawIt();
    break;
  case "eat":
    eatIt();
    break;
  default:
    doNothing();
}
```

Tương tự như C, các mệnh đề case về mặt khái niệm giống như [nhãn](/en-US/docs/Web/JavaScript/Reference/Statements/label), vì vậy nếu bạn không thêm câu lệnh `break`, việc thực thi sẽ "rơi xuống" cấp độ tiếp theo. Tuy nhiên, chúng không thực sự là các bảng nhảy — bất kỳ biểu thức nào cũng có thể là một phần của mệnh đề `case`, không chỉ các literal chuỗi hoặc số, và chúng sẽ được đánh giá lần lượt cho đến khi một cái bằng giá trị đang được khớp. Việc so sánh diễn ra giữa hai cái sử dụng toán tử `===`.

Không như một số ngôn ngữ như Rust, các cấu trúc luồng điều khiển là các câu lệnh trong JavaScript, nghĩa là bạn không thể gán chúng cho một biến, như `const a = if (x) { 1 } else { 2 }`.

Lỗi JavaScript được xử lý bằng câu lệnh [`try...catch`](/en-US/docs/Web/JavaScript/Reference/Statements/try...catch).

```js
try {
  buildMySite("./website");
} catch (e) {
  console.error("Building site failed:", e);
}
```

Lỗi có thể được ném bằng câu lệnh [`throw`](/en-US/docs/Web/JavaScript/Reference/Statements/throw). Nhiều thao tác tích hợp cũng có thể ném.

```js
function buildMySite(siteDirectory) {
  if (!pathExists(siteDirectory)) {
    throw new Error("Site directory does not exist");
  }
}
```

Nhìn chung, bạn không thể biết loại lỗi mà bạn vừa bắt được, vì bất kỳ thứ gì cũng có thể được ném từ câu lệnh `throw`. Tuy nhiên, bạn thường có thể giả định nó là một thực thể [`Error`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Error), như ví dụ trên. Có một số lớp con của `Error` tích hợp sẵn, như [`TypeError`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/TypeError) và [`RangeError`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/RangeError), mà bạn có thể sử dụng để cung cấp thêm ngữ nghĩa về lỗi. Không có catch có điều kiện trong JavaScript — nếu bạn chỉ muốn xử lý một loại lỗi, bạn cần bắt tất cả mọi thứ, xác định loại lỗi bằng [`instanceof`](/en-US/docs/Web/JavaScript/Reference/Operators/instanceof), và sau đó ném lại các trường hợp khác.

```js
try {
  buildMySite("./website");
} catch (e) {
  if (e instanceof RangeError) {
    console.error("Seems like a parameter is out of range:", e);
    console.log("Retrying...");
    buildMySite("./website");
  } else {
    // Don't know how to handle other error types; throw them so
    // something else up in the call stack may catch and handle it
    throw e;
  }
}
```

Nếu một lỗi không được bắt bởi bất kỳ `try...catch` nào trong call stack, chương trình sẽ thoát.

Để có danh sách toàn diện về các câu lệnh luồng điều khiển, hãy xem [phần tham khảo](/en-US/docs/Web/JavaScript/Reference/Statements).

## Đối tượng

Các đối tượng JavaScript có thể được coi là các tập hợp các cặp key-value. Như vậy, chúng tương tự:

- Dictionaries trong Python.
- Hashes trong Perl và Ruby.
- Hash tables trong C và C++.
- HashMaps trong Java.
- Associative arrays trong PHP.

Các đối tượng JavaScript là hash. Không giống như các đối tượng trong các ngôn ngữ kiểu tĩnh, các đối tượng trong JavaScript không có hình dạng cố định — các thuộc tính có thể được thêm, xóa, sắp xếp lại, thay đổi, hoặc truy vấn động bất cứ lúc nào. Các khóa đối tượng luôn là [chuỗi](/en-US/docs/Web/JavaScript/Reference/Global_Objects/String) hoặc [symbol](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Symbol) — ngay cả các chỉ mục mảng, vốn là số nguyên theo quy ước, thực sự là chuỗi bên dưới.

Các đối tượng thường được tạo bằng cú pháp literal:

```js
const obj = {
  name: "Carrot",
  for: "Max",
  details: {
    color: "orange",
    size: 12,
  },
};
```

Các thuộc tính đối tượng có thể được [truy cập](/en-US/docs/Web/JavaScript/Reference/Operators/Property_accessors) bằng dấu chấm (`.`) hoặc dấu ngoặc vuông (`[]`). Khi sử dụng ký hiệu dấu chấm, khóa phải là một [identifier](/en-US/docs/Web/JavaScript/Reference/Lexical_grammar#identifiers) hợp lệ. Dấu ngoặc vuông, mặt khác, cho phép đánh chỉ mục đối tượng với giá trị khóa động.

```js
// Dot notation
obj.name = "Simon";
const name = obj.name;

// Bracket notation
obj["name"] = "Simon";
const name = obj["name"];

// Can use a variable to define a key
const userName = prompt("what is your key?");
obj[userName] = prompt("what is its value?");
```

Truy cập thuộc tính có thể được nối lại với nhau:

```js
obj.details.color; // orange
obj["details"]["size"]; // 12
```

Các đối tượng luôn là tham chiếu, vì vậy trừ khi thứ gì đó đang sao chép tường minh đối tượng, các đột biến cho một đối tượng sẽ hiển thị ra bên ngoài.

```js
const obj = {};
function doSomething(o) {
  o.x = 1;
}
doSomething(obj);
console.log(obj.x); // 1
```

Điều này cũng có nghĩa là hai đối tượng được tạo riêng biệt sẽ không bao giờ bằng nhau (`!==`), vì chúng là các tham chiếu khác nhau. Nếu bạn giữ hai tham chiếu của cùng một đối tượng, việc thay đổi một cái sẽ có thể quan sát được thông qua cái kia.

```js
const me = {};
const stillMe = me;
me.x = 1;
console.log(stillMe.x); // 1
```

Để biết thêm về các đối tượng và prototype, hãy xem [trang tham khảo `Object`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Object). Để biết thêm thông tin về cú pháp trình khởi tạo đối tượng, hãy xem [trang tham khảo](/en-US/docs/Web/JavaScript/Reference/Operators/Object_initializer) của nó.

Trang này đã bỏ qua tất cả chi tiết về object prototype và kế thừa vì bạn thường có thể đạt được kế thừa với [các lớp](#các-lớp) mà không cần chạm vào cơ chế bên dưới (mà bạn có thể nghe nói là phức tạp). Để tìm hiểu về chúng, hãy xem [Inheritance and the prototype chain](/en-US/docs/Web/JavaScript/Guide/Inheritance_and_the_prototype_chain).

## Mảng

Mảng trong JavaScript thực ra là một loại đối tượng đặc biệt. Chúng hoạt động rất giống với các đối tượng thông thường (các thuộc tính số tự nhiên chỉ có thể được truy cập bằng cú pháp `[]`) nhưng chúng có một thuộc tính kỳ diệu gọi là `length`. Đây luôn lớn hơn một so với chỉ mục cao nhất trong mảng.

Mảng thường được tạo bằng các literal mảng:

```js
const a = ["dog", "cat", "hen"];
a.length; // 3
```

Mảng JavaScript vẫn là các đối tượng — bạn có thể gán bất kỳ thuộc tính nào cho chúng, bao gồm các chỉ mục số tùy ý. "Phép màu" duy nhất là `length` sẽ được tự động cập nhật khi bạn đặt một chỉ mục cụ thể.

```js
const a = ["dog", "cat", "hen"];
a[100] = "fox";
console.log(a.length); // 101
console.log(a); // ['dog', 'cat', 'hen', empty × 97, 'fox']
```

Mảng chúng ta nhận được ở trên được gọi là [_sparse array_](/en-US/docs/Web/JavaScript/Guide/Indexed_collections#sparse_arrays) vì có các slot không được lấp đầy ở giữa, và sẽ khiến engine tối giảm hiệu suất từ mảng sang hash table. Hãy đảm bảo mảng của bạn được lấp đầy!

Việc đánh chỉ mục ngoài phạm vi không ném ra lỗi. Nếu bạn truy vấn một chỉ mục mảng không tồn tại, bạn sẽ nhận được `undefined`:

```js
const a = ["dog", "cat", "hen"];
console.log(typeof a[90]); // undefined
```

Mảng có thể có bất kỳ phần tử nào và có thể tăng hoặc giảm tùy ý.

```js
const arr = [1, "foo", true];
arr.push({});
// arr = [1, "foo", true, {}]
```

Mảng có thể được lặp bằng vòng lặp `for`, như trong các ngôn ngữ C-like khác:

```js
for (let i = 0; i < a.length; i++) {
  // Do something with a[i]
}
```

Hoặc, vì mảng là iterable, bạn có thể dùng vòng lặp [`for...of`](/en-US/docs/Web/JavaScript/Reference/Statements/for...of), tương đương với cú pháp `for (int x : arr)` của C++/Java:

```js
for (const currentValue of a) {
  // Do something with currentValue
}
```

Mảng đi kèm với nhiều [phương thức mảng](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Array). Nhiều trong số chúng sẽ lặp qua mảng — ví dụ, [`map()`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Array/map) sẽ áp dụng một callback cho mỗi phần tử mảng, và trả về một mảng mới:

```js
const babies = ["dog", "cat", "hen"].map((name) => `baby ${name}`);
// babies = ['baby dog', 'baby cat', 'baby hen']
```

## Hàm

Cùng với các đối tượng, hàm là thành phần cốt lõi trong việc hiểu JavaScript. Khai báo hàm cơ bản nhất trông như thế này:

```js
function add(x, y) {
  const total = x + y;
  return total;
}
```

Một hàm JavaScript có thể nhận 0 hoặc nhiều tham số. Thân hàm có thể chứa bao nhiêu câu lệnh tùy thích và có thể khai báo các biến cục bộ cho hàm đó. Câu lệnh [`return`](/en-US/docs/Web/JavaScript/Reference/Statements/return) có thể được dùng để trả về một giá trị bất cứ lúc nào, kết thúc hàm. Nếu không có câu lệnh return nào được dùng (hoặc return rỗng không có giá trị), JavaScript trả về `undefined`.

Hàm có thể được gọi với nhiều hoặc ít tham số hơn số lượng nó chỉ định. Nếu bạn gọi một hàm mà không truyền các tham số mà nó mong đợi, chúng sẽ được đặt thành `undefined`. Nếu bạn truyền nhiều tham số hơn mong đợi, hàm sẽ bỏ qua các tham số thừa.

```js
add(); // NaN
// Equivalent to add(undefined, undefined)

add(2, 3, 4); // 5
// added the first two; 4 was ignored
```

Có một số cú pháp tham số khác có sẵn. Ví dụ, [cú pháp rest parameter](/en-US/docs/Web/JavaScript/Reference/Functions/rest_parameters) cho phép thu thập tất cả các tham số thêm được truyền bởi người gọi vào một mảng, tương tự `*args` của Python. (Vì JS không có named parameters ở cấp độ ngôn ngữ, không có `**kwargs`.)

```js
function avg(...args) {
  let sum = 0;
  for (const item of args) {
    sum += item;
  }
  return sum / args.length;
}

avg(2, 3, 4, 5); // 3.5
```

Trong đoạn mã trên, biến `args` giữ tất cả các giá trị được truyền vào hàm.

Rest parameter sẽ lưu trữ tất cả các đối số _sau_ vị trí nó được khai báo, nhưng không phải trước đó. Nói cách khác, `function avg(firstValue, ...args)` sẽ lưu giá trị đầu tiên được truyền vào hàm trong biến `firstValue` và các đối số còn lại trong `args`.

Nếu một hàm nhận danh sách các đối số và bạn đã giữ chúng trong một mảng, bạn có thể dùng [cú pháp spread](/en-US/docs/Web/JavaScript/Reference/Operators/Spread_syntax) trong lời gọi hàm để _trải_ mảng thành một danh sách các phần tử. Ví dụ: `avg(...numbers)`.

Chúng tôi đã đề cập rằng JavaScript không có named parameters. Tuy nhiên, có thể triển khai chúng bằng cách sử dụng [object destructuring](/en-US/docs/Web/JavaScript/Reference/Operators/Destructuring), cho phép các đối tượng được đóng gói và giải nén một cách thuận tiện.

```js
// Note the { } braces: this is destructuring an object
function area({ width, height }) {
  return width * height;
}

// The { } braces here create a new object
console.log(area({ width: 2, height: 3 }));
```

Cũng có cú pháp [_default parameter_](/en-US/docs/Web/JavaScript/Reference/Functions/Default_parameters), cho phép các tham số bị bỏ qua (hoặc những cái được truyền là `undefined`) có giá trị mặc định.

```js
function avg(firstValue, secondValue, thirdValue = 0) {
  return (firstValue + secondValue + thirdValue) / 3;
}

avg(1, 2); // 1, instead of NaN
```

### Hàm ẩn danh

JavaScript cho phép bạn tạo các hàm ẩn danh — tức là các hàm không có tên. Trong thực tế, các hàm ẩn danh thường được sử dụng như đối số cho các hàm khác, được gán ngay lập tức cho một biến có thể được dùng để gọi hàm, hoặc được trả về từ một hàm khác.

```js
// Note that there's no function name before the parentheses
const avg = function (...args) {
  let sum = 0;
  for (const item of args) {
    sum += item;
  }
  return sum / args.length;
};
```

Điều đó làm cho hàm ẩn danh có thể được gọi bằng cách gọi `avg()` với một số đối số — tức là, nó tương đương về mặt ngữ nghĩa với việc khai báo hàm bằng cú pháp khai báo `function avg() {}`.

Có một cách khác để định nghĩa hàm ẩn danh — sử dụng [biểu thức arrow function](/en-US/docs/Web/JavaScript/Reference/Functions/Arrow_functions).

```js
// Note that there's no function name before the parentheses
const avg = (...args) => {
  let sum = 0;
  for (const item of args) {
    sum += item;
  }
  return sum / args.length;
};

// You can omit the `return` when simply returning an expression
const sum = (a, b, c) => a + b + c;
```

Arrow function không tương đương về mặt ngữ nghĩa với các biểu thức hàm — để biết thêm thông tin, hãy xem [trang tham khảo](/en-US/docs/Web/JavaScript/Reference/Functions/Arrow_functions) của nó.

Có một cách khác mà các hàm ẩn danh có thể hữu ích: nó có thể được khai báo và gọi đồng thời trong một biểu thức duy nhất, được gọi là [Immediately invoked function expression (IIFE)](/en-US/docs/Glossary/IIFE):

```js
(function () {
  // …
})();
```

Để biết các trường hợp sử dụng của IIFE, bạn có thể đọc [emulating private methods with closures](/en-US/docs/Web/JavaScript/Guide/Closures#emulating_private_methods_with_closures).

### Hàm đệ quy

JavaScript cho phép bạn gọi hàm theo cách đệ quy. Điều này đặc biệt hữu ích khi xử lý các cấu trúc cây, chẳng hạn như những cái được tìm thấy trong DOM của trình duyệt.

```js
function countChars(elm) {
  if (elm.nodeType === 3) {
    // TEXT_NODE
    return elm.nodeValue.length;
  }
  let count = 0;
  for (let i = 0, child; (child = elm.childNodes[i]); i++) {
    count += countChars(child);
  }
  return count;
}
```

Các biểu thức hàm cũng có thể được đặt tên, cho phép chúng đệ quy.

```js
const charsInBody = (function counter(elm) {
  if (elm.nodeType === 3) {
    // TEXT_NODE
    return elm.nodeValue.length;
  }
  let count = 0;
  for (let i = 0, child; (child = elm.childNodes[i]); i++) {
    count += counter(child);
  }
  return count;
})(document.body);
```

Tên được cung cấp cho một biểu thức hàm như ở trên chỉ có sẵn trong phạm vi của chính hàm. Điều này cho phép engine thực hiện nhiều tối ưu hóa hơn và dẫn đến mã dễ đọc hơn. Tên cũng hiển thị trong debugger và một số stack traces, có thể tiết kiệm thời gian khi gỡ lỗi.

Nếu bạn quen với lập trình hàm, hãy cẩn thận với các tác động hiệu suất của đệ quy trong JavaScript. Mặc dù đặc tả ngôn ngữ chỉ định [tối ưu hóa tail-call](https://en.wikipedia.org/wiki/Tail_call), chỉ có JavaScriptCore (được sử dụng bởi Safari) đã triển khai nó, do khó khăn trong việc khôi phục stack traces và khả năng gỡ lỗi. Đối với đệ quy sâu, hãy cân nhắc sử dụng lặp để tránh tràn stack.

### Hàm là đối tượng first-class

Các hàm JavaScript là các đối tượng first-class. Điều này có nghĩa là chúng có thể được gán cho các biến, được truyền như đối số cho các hàm khác, và được trả về từ các hàm khác. Ngoài ra, JavaScript hỗ trợ [closures](/en-US/docs/Web/JavaScript/Guide/Closures) ngay từ đầu mà không cần capturing tường minh, cho phép bạn thuận tiện áp dụng các phong cách lập trình hàm.

```js
// Function returning function
const add = (x) => (y) => x + y;
// Function accepting function
const babies = ["dog", "cat", "hen"].map((name) => `baby ${name}`);
```

Lưu ý rằng các hàm JavaScript tự chúng là các đối tượng — như mọi thứ khác trong JavaScript — và bạn có thể thêm hoặc thay đổi các thuộc tính trên chúng giống như chúng ta đã thấy trong phần Đối tượng.

### Hàm lồng nhau

Các khai báo hàm JavaScript được phép bên trong các hàm khác. Một chi tiết quan trọng của các hàm lồng nhau trong JavaScript là chúng có thể truy cập các biến trong phạm vi của hàm cha:

```js
function parentFunc() {
  const a = 1;

  function nestedFunc() {
    const b = 4; // parentFunc can't use this
    return a + b;
  }
  return nestedFunc(); // 5
}
```

Điều này cung cấp rất nhiều tiện ích trong việc viết mã dễ bảo trì hơn. Nếu một hàm được gọi phụ thuộc vào một hoặc hai hàm khác không hữu ích cho bất kỳ phần nào khác của mã, bạn có thể lồng các hàm tiện ích đó bên trong nó. Điều này giữ cho số lượng hàm trong phạm vi toàn cục ở mức thấp.

Đây cũng là một đối trọng tốt với sức hút của các biến toàn cục. Khi viết mã phức tạp, thường rất hấp dẫn khi sử dụng các biến toàn cục để chia sẻ giá trị giữa nhiều hàm, điều này dẫn đến mã khó bảo trì. Các hàm lồng nhau có thể chia sẻ các biến trong hàm cha, vì vậy bạn có thể sử dụng cơ chế đó để kết hợp các hàm với nhau mà không gây ô nhiễm không gian tên toàn cục.

## Các lớp

JavaScript cung cấp cú pháp [class](/en-US/docs/Web/JavaScript/Reference/Classes) rất giống với các ngôn ngữ như Java.

```js
class Person {
  constructor(name) {
    this.name = name;
  }
  sayHello() {
    return `Hello, I'm ${this.name}!`;
  }
}

const p = new Person("Maria");
console.log(p.sayHello());
```

Các lớp JavaScript chỉ là các hàm phải được khởi tạo bằng toán tử [`new`](/en-US/docs/Web/JavaScript/Reference/Operators/new). Mỗi lần một lớp được khởi tạo, nó trả về một đối tượng chứa các phương thức và thuộc tính mà lớp đã chỉ định. Các lớp không bắt buộc bất kỳ tổ chức mã nào — ví dụ, bạn có thể có các hàm trả về các lớp, hoặc bạn có thể có nhiều lớp trong mỗi tệp. Đây là ví dụ về cách tạo lớp có thể tùy ý: nó chỉ là một biểu thức được trả về từ một arrow function. Pattern này được gọi là [mixin](/en-US/docs/Web/JavaScript/Reference/Classes/extends#mix-ins).

```js
const withAuthentication = (cls) =>
  class extends cls {
    authenticate() {
      // …
    }
  };

class Admin extends withAuthentication(Person) {
  // …
}
```

Các thuộc tính static được tạo bằng cách thêm tiền tố `static`. Các trường và phương thức private được tạo bằng cách thêm hash `#` (không phải `private`). Hash là một phần không thể thiếu của tên phần tử, và phân biệt nó với một thuộc tính khóa chuỗi thông thường. (Hãy nghĩ về `#` như `_` trong Python.) Không giống như hầu hết các ngôn ngữ khác, hoàn toàn không có cách nào để đọc một phần tử private bên ngoài thân lớp — ngay cả trong các lớp kế thừa.

Để có hướng dẫn chi tiết về các tính năng lớp khác nhau, bạn có thể đọc [trang hướng dẫn](/en-US/docs/Web/JavaScript/Guide/Using_classes).

## Lập trình bất đồng bộ

JavaScript là đơn luồng theo bản chất. Không có [song song hóa](https://en.wikipedia.org/wiki/Parallel_computing); chỉ có [đồng thời](https://en.wikipedia.org/wiki/Concurrent_computing). Lập trình bất đồng bộ được hỗ trợ bởi một [event loop](/en-US/docs/Web/JavaScript/Reference/Execution_model), cho phép một tập hợp các task được xếp hàng và được thăm dò để hoàn thành.

Có ba cách thành ngữ để viết mã bất đồng bộ trong JavaScript:

- Dựa trên callback (như {{domxref("Window.setTimeout", "setTimeout()")}})
- Dựa trên {{jsxref("Global_Objects/Promise", "Promise")}}
- {{jsxref("Statements/async_function", "async")}}/{{jsxref("Operators/await", "await")}}, là cú pháp gọn gàng cho Promises

Ví dụ, đây là một thao tác đọc file có thể trông như thế nào trong JavaScript:

```js
// Callback-based
fs.readFile(filename, (err, content) => {
  // This callback is invoked when the file is read, which could be after a while
  if (err) {
    throw err;
  }
  console.log(content);
});
// Code here will be executed while the file is waiting to be read

// Promise-based
fs.readFile(filename)
  .then((content) => {
    // What to do when the file is read
    console.log(content);
  })
  .catch((err) => {
    throw err;
  });
// Code here will be executed while the file is waiting to be read

// Async/await
async function readFile(filename) {
  const content = await fs.readFile(filename);
  console.log(content);
}
```

Ngôn ngữ lõi không chỉ định bất kỳ tính năng lập trình bất đồng bộ nào, nhưng nó là rất quan trọng khi tương tác với môi trường bên ngoài — từ [yêu cầu quyền người dùng](/en-US/docs/Web/API/Permissions_API), đến [lấy dữ liệu](/en-US/docs/Web/API/Fetch_API/Using_Fetch), đến [đọc tệp](https://nodejs.org/api/fs.html). Giữ các thao tác có thể chạy lâu ở chế độ async đảm bảo các quy trình khác vẫn có thể chạy trong khi cái này đang chờ đợi — ví dụ, trình duyệt sẽ không bị đóng băng khi chờ người dùng nhấp vào một nút để cấp quyền.

Nếu bạn có một giá trị async, không thể lấy giá trị của nó đồng bộ. Ví dụ, nếu bạn có một promise, bạn chỉ có thể truy cập kết quả cuối cùng thông qua phương thức [`then()`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Promise/then). Tương tự, {{jsxref("Operators/await", "await")}} chỉ có thể được sử dụng trong một ngữ cảnh async, thường là một hàm async hoặc một module. Các promise _không bao giờ chặn_ — chỉ logic phụ thuộc vào kết quả của promise sẽ bị trì hoãn; mọi thứ khác tiếp tục thực thi trong thời gian đó. Nếu bạn là lập trình viên hàm, bạn có thể nhận ra promises là [monads](<https://en.wikipedia.org/wiki/Monad_(functional_programming)>) có thể được ánh xạ bằng `then()` (tuy nhiên, chúng không phải là _monad thực sự_ vì chúng tự động làm phẳng; tức là bạn không thể có `Promise<Promise<T>>`).

Thực tế, mô hình đơn luồng đã làm cho Node.js trở thành lựa chọn phổ biến cho lập trình phía máy chủ do IO không chặn của nó, làm cho việc xử lý một số lượng lớn các yêu cầu cơ sở dữ liệu hoặc hệ thống tệp rất hiệu quả. Tuy nhiên, các task CPU-bound (tính toán nặng) là JavaScript thuần túy vẫn sẽ chặn luồng chính. Để đạt được song song hóa thực sự, bạn có thể cần sử dụng [workers](/en-US/docs/Web/API/Web_Workers_API/Using_web_workers).

Để tìm hiểu thêm về lập trình bất đồng bộ, bạn có thể đọc về [sử dụng promises](/en-US/docs/Web/JavaScript/Guide/Using_promises) hoặc theo dõi hướng dẫn [asynchronous JavaScript](/en-US/docs/Learn_web_development/Extensions/Async_JS).

## Module

JavaScript cũng chỉ định một hệ thống module được hầu hết các runtime hỗ trợ. Một module thường là một tệp, được xác định bởi đường dẫn tệp hoặc URL của nó. Bạn có thể dùng các câu lệnh {{jsxref("Statements/import", "import")}} và {{jsxref("Statements/export", "export")}} để trao đổi dữ liệu giữa các module:

```js
import { foo } from "./foo.js";

// Unexported variables are local to the module
const b = 2;

export const a = 1;
```

Không giống như Haskell, Python, Java, v.v., việc phân giải module JavaScript hoàn toàn phụ thuộc vào host — thường dựa trên URL hoặc đường dẫn tệp, vì vậy các đường dẫn tệp tương đối "chỉ hoạt động" và là tương đối so với đường dẫn của module hiện tại thay vì một đường dẫn gốc dự án nào đó.

Tuy nhiên, ngôn ngữ JavaScript không cung cấp các module thư viện chuẩn — tất cả các chức năng cốt lõi được hỗ trợ bởi các biến toàn cục như [`Math`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Math) và [`Intl`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Intl) thay thế. Điều này là do lịch sử lâu dài của JavaScript thiếu hệ thống module, và thực tế là việc chọn tham gia hệ thống module liên quan đến một số thay đổi trong cài đặt runtime.

Các runtime khác nhau có thể sử dụng các hệ thống module khác nhau. Ví dụ, [Node.js](https://nodejs.org/en/) sử dụng trình quản lý gói [npm](https://www.npmjs.com/) và chủ yếu dựa trên hệ thống tệp, trong khi [Deno](https://deno.com/) và trình duyệt hoàn toàn dựa trên URL và các module có thể được phân giải từ HTTP URL.

Để biết thêm thông tin, hãy xem [trang hướng dẫn modules](/en-US/docs/Web/JavaScript/Guide/Modules).

## Ngôn ngữ và runtime

Xuyên suốt trang này, chúng tôi đã liên tục đề cập rằng một số tính năng là _cấp độ ngôn ngữ_ trong khi những tính năng khác là _cấp độ runtime_.

JavaScript là ngôn ngữ scripting đa mục đích. [Đặc tả ngôn ngữ lõi](/en-US/docs/Web/JavaScript/Reference/JavaScript_technologies_overview#javascript_the_core_language_ecmascript) tập trung vào logic tính toán thuần túy. Nó không xử lý bất kỳ đầu vào/đầu ra nào — thực tế, không có API cấp runtime bổ sung nào (đặc biệt nhất là [`console.log()`](/en-US/docs/Web/API/console/log_static)), hành vi của chương trình JavaScript hoàn toàn không thể quan sát được.

Một runtime, hay host, là thứ cung cấp dữ liệu cho JavaScript engine (trình thông dịch), cung cấp các thuộc tính toàn cục bổ sung, và cung cấp các hook để engine tương tác với thế giới bên ngoài. Phân giải module, đọc dữ liệu, in thông điệp, gửi yêu cầu mạng, v.v. đều là các thao tác cấp runtime. Kể từ khi ra đời, JavaScript đã được áp dụng trong nhiều môi trường khác nhau, chẳng hạn như trình duyệt (cung cấp các API như [DOM](/en-US/docs/Web/API/Document_Object_Model)), Node.js (cung cấp các API như [file system access](https://nodejs.org/api/fs.html)), v.v. JavaScript đã được tích hợp thành công trong web (đó là mục đích chính của nó), ứng dụng di động, ứng dụng desktop, ứng dụng phía máy chủ, serverless, hệ thống nhúng, và nhiều hơn nữa. Trong khi bạn học về các tính năng cốt lõi của JavaScript, điều quan trọng là cũng phải hiểu các tính năng được cung cấp bởi host để áp dụng kiến thức vào thực tế. Ví dụ, bạn có thể đọc về tất cả [web platform APIs](/en-US/docs/Web/API), được triển khai bởi các trình duyệt, và đôi khi cả non-browser.

## Khám phá thêm

Trang này cung cấp cái nhìn tổng quan rất cơ bản về cách các tính năng JavaScript khác nhau so sánh với các ngôn ngữ khác. Nếu bạn muốn tìm hiểu thêm về bản thân ngôn ngữ và các sắc thái của từng tính năng, bạn có thể đọc [JavaScript guide](/en-US/docs/Web/JavaScript/Guide) và [JavaScript reference](/en-US/docs/Web/JavaScript/Reference).

Có một số phần thiết yếu của ngôn ngữ mà chúng tôi đã bỏ qua do hạn chế về không gian và độ phức tạp, nhưng bạn có thể tự khám phá:

- [Inheritance and the prototype chain](/en-US/docs/Web/JavaScript/Guide/Inheritance_and_the_prototype_chain)
- [Closures](/en-US/docs/Web/JavaScript/Guide/Closures)
- [Regular expressions](/en-US/docs/Web/JavaScript/Guide/Regular_expressions)
- [Iteration](/en-US/docs/Web/JavaScript/Guide/Iterators_and_generators)
