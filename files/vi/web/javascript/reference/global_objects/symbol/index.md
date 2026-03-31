---
title: Symbol
slug: Web/JavaScript/Reference/Global_Objects/Symbol
page-type: javascript-class
browser-compat: javascript.builtins.Symbol
sidebar: jsref
---

**`Symbol`** là một đối tượng tích hợp sẵn mà constructor của nó trả về một [kiểu nguyên thủy](/en-US/docs/Glossary/Primitive) `symbol` — còn được gọi là **Symbol value** hoặc đơn giản là **Symbol** — được đảm bảo là duy nhất. Symbol thường được dùng để thêm các khóa thuộc tính duy nhất vào một đối tượng mà sẽ không xung đột với các khóa mà bất kỳ đoạn mã nào khác có thể thêm vào đối tượng đó, và ẩn khỏi các cơ chế mà đoạn mã khác thường dùng để truy cập đối tượng. Điều này cho phép một dạng {{Glossary("encapsulation")}} yếu, hoặc một dạng [ẩn thông tin](https://en.wikipedia.org/wiki/Information_hiding) yếu.

Mỗi lần gọi `Symbol()` đều được đảm bảo trả về một Symbol duy nhất. Mỗi lần gọi `Symbol.for("key")` sẽ luôn trả về cùng một Symbol cho một giá trị `"key"` nhất định. Khi `Symbol.for("key")` được gọi, nếu một Symbol với key đã cho có thể tìm thấy trong global Symbol registry, Symbol đó sẽ được trả về. Nếu không, một Symbol mới sẽ được tạo, thêm vào global Symbol registry với key đã cho, và trả về.

## Mô tả

Để tạo một Symbol nguyên thủy mới, bạn viết `Symbol()` với một chuỗi tùy chọn làm mô tả:

```js
const sym1 = Symbol();
const sym2 = Symbol("foo");
const sym3 = Symbol("foo");
```

Đoạn mã trên tạo ra ba Symbol mới. Lưu ý rằng `Symbol("foo")` không ép kiểu chuỗi `"foo"` thành một Symbol. Nó tạo một Symbol mới mỗi lần:

```js
Symbol("foo") === Symbol("foo"); // false
```

Cú pháp sau với toán tử {{jsxref("Operators/new", "new")}} sẽ ném ra {{jsxref("TypeError")}}:

```js example-bad
const sym = new Symbol(); // TypeError
```

Điều này ngăn các tác giả tạo một đối tượng bao bọc `Symbol` rõ ràng thay vì một Symbol value mới và có thể gây bất ngờ vì việc tạo các đối tượng bao bọc rõ ràng xung quanh các kiểu dữ liệu nguyên thủy thường là có thể (ví dụ: `new Boolean`, `new String` và `new Number`).

Nếu bạn thực sự muốn tạo một đối tượng bao bọc `Symbol`, bạn có thể dùng hàm `Object()`:

```js
const sym = Symbol("foo");
typeof sym; // "symbol"
const symObj = Object(sym);
typeof symObj; // "object"
```

Vì symbol là kiểu dữ liệu nguyên thủy duy nhất có tính đồng nhất tham chiếu (nghĩa là bạn không thể tạo cùng một symbol hai lần), chúng hoạt động giống như đối tượng theo một số cách. Ví dụ, chúng có thể được thu gom bởi garbage collector và do đó có thể được lưu trữ trong các đối tượng {{jsxref("WeakMap")}}, {{jsxref("WeakSet")}}, {{jsxref("WeakRef")}}, và {{jsxref("FinalizationRegistry")}}.

### Symbol dùng chung trong global Symbol registry

Cú pháp trên sử dụng hàm `Symbol()` sẽ tạo một Symbol có giá trị vẫn là duy nhất trong suốt thời gian tồn tại của chương trình. Để tạo các Symbol có thể dùng chung qua nhiều file và thậm chí qua nhiều realm (mỗi realm có phạm vi toàn cục riêng), hãy dùng các phương thức {{jsxref("Symbol.for()")}} và {{jsxref("Symbol.keyFor()")}} để thiết lập và lấy Symbol từ global Symbol registry.

Lưu ý rằng "global Symbol registry" chỉ là một khái niệm giả định và có thể không tương ứng với bất kỳ cấu trúc dữ liệu nội bộ nào trong JavaScript engine — và ngay cả khi registry như vậy tồn tại, nội dung của nó không có sẵn cho mã JavaScript, ngoại trừ thông qua các phương thức `for()` và `keyFor()`.

Phương thức `Symbol.for(tokenString)` nhận một key chuỗi và trả về một giá trị symbol từ registry, trong khi `Symbol.keyFor(symbolValue)` nhận một giá trị symbol và trả về key chuỗi tương ứng với nó. Mỗi cái là nghịch đảo của cái kia, vì vậy kết quả sau là `true`:

```js
Symbol.keyFor(Symbol.for("tokenString")) === "tokenString"; // true
```

Vì các registered symbol có thể được tạo tùy ý ở bất kỳ đâu, chúng hoạt động gần giống như các chuỗi mà chúng bao bọc. Do đó, chúng không được đảm bảo là duy nhất và không thể được thu gom bởi garbage collector. Vì vậy, các registered symbol không được phép trong các đối tượng {{jsxref("WeakMap")}}, {{jsxref("WeakSet")}}, {{jsxref("WeakRef")}}, và {{jsxref("FinalizationRegistry")}}.

### Well-known Symbol

Tất cả các thuộc tính tĩnh của constructor `Symbol` đều là Symbol, có giá trị không thay đổi qua các realm. Chúng được gọi là _well-known Symbol_, và mục đích của chúng là đóng vai trò như "giao thức" cho một số thao tác JavaScript tích hợp sẵn, cho phép người dùng tùy chỉnh hành vi của ngôn ngữ. Ví dụ, nếu một hàm constructor có một phương thức với {{jsxref("Symbol.hasInstance")}} là tên của nó, phương thức này sẽ mã hóa hành vi của nó với toán tử {{jsxref("Operators/instanceof", "instanceof")}}.

Trước khi có well-known Symbol, JavaScript dùng các thuộc tính thông thường để triển khai một số thao tác tích hợp sẵn. Ví dụ, hàm [`JSON.stringify`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/JSON/stringify) sẽ cố gắng gọi phương thức `toJSON()` của từng đối tượng, và hàm [`String`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/String/String) sẽ gọi các phương thức `toString()` và `valueOf()` của đối tượng. Tuy nhiên, khi nhiều thao tác được thêm vào ngôn ngữ, việc chỉ định mỗi thao tác là một "thuộc tính ma thuật" có thể phá vỡ khả năng tương thích ngược và khiến hành vi của ngôn ngữ khó lý giải hơn. Well-known Symbol cho phép các tùy chỉnh trở nên "vô hình" đối với mã thông thường, thứ thường chỉ đọc các thuộc tính chuỗi.

> [!NOTE]
> Đặc tả trước đây dùng ký hiệu `@@<symbol-name>` để biểu thị các well-known symbol. Ví dụ, {{jsxref("Symbol.hasInstance")}} được viết là `@@hasInstance`, và phương thức `Array.prototype[Symbol.iterator]()` sẽ được gọi là `Array.prototype[@@iterator]()`. Ký hiệu này không còn được dùng trong đặc tả, nhưng bạn vẫn có thể thấy nó trong các tài liệu hoặc thảo luận cũ hơn.

Well-known symbol không có khái niệm về khả năng thu gom bởi garbage collector, vì chúng đến từ một tập cố định và là duy nhất trong suốt thời gian tồn tại của chương trình, tương tự như các đối tượng nội tại như `Array.prototype`, vì vậy chúng cũng được phép trong các đối tượng {{jsxref("WeakMap")}}, {{jsxref("WeakSet")}}, {{jsxref("WeakRef")}}, và {{jsxref("FinalizationRegistry")}}.

### Tìm thuộc tính Symbol trên đối tượng

Phương thức {{jsxref("Object.getOwnPropertySymbols()")}} trả về một mảng các Symbol và cho phép bạn tìm các thuộc tính Symbol trên một đối tượng nhất định. Lưu ý rằng mọi đối tượng đều được khởi tạo không có thuộc tính Symbol nào, vì vậy mảng này sẽ trống trừ khi bạn đã thiết lập các thuộc tính Symbol trên đối tượng.

## Constructor

- {{jsxref("Symbol/Symbol", "Symbol()")}}
  - : Trả về các giá trị nguyên thủy kiểu Symbol. Ném lỗi khi được gọi với `new`.

## Thuộc tính tĩnh

Các thuộc tính tĩnh đều là well-known Symbol. Trong mô tả của các Symbol này, chúng ta sẽ dùng ngôn ngữ như "`Symbol.hasInstance` là một phương thức xác định...", nhưng hãy nhớ rằng điều này đề cập đến ngữ nghĩa của một phương thức đối tượng có Symbol này là tên phương thức (vì well-known Symbol hoạt động như "giao thức"), không mô tả giá trị của bản thân Symbol.

- {{jsxref("Symbol.asyncDispose")}}
  - : Một phương thức giải phóng tài nguyên của đối tượng một cách bất đồng bộ khi đối tượng đi ra khỏi phạm vi. Được dùng bởi khai báo [`await using`](/en-US/docs/Web/JavaScript/Reference/Statements/await_using).
- {{jsxref("Symbol.asyncIterator")}}
  - : Một phương thức trả về AsyncIterator mặc định cho một đối tượng. Được dùng bởi [`for await...of`](/en-US/docs/Web/JavaScript/Reference/Statements/for-await...of).
- {{jsxref("Symbol.dispose")}}
  - : Một phương thức giải phóng tài nguyên của đối tượng khi đối tượng đi ra khỏi phạm vi. Được dùng bởi khai báo [`using`](/en-US/docs/Web/JavaScript/Reference/Statements/using).
- {{jsxref("Symbol.hasInstance")}}
  - : Một phương thức xác định xem một đối tượng constructor có nhận dạng một đối tượng là instance của nó không. Được dùng bởi {{jsxref("Operators/instanceof", "instanceof")}}.
- {{jsxref("Symbol.isConcatSpreadable")}}
  - : Một giá trị Boolean cho biết liệu một đối tượng có nên được làm phẳng thành các phần tử mảng của nó không. Được dùng bởi {{jsxref("Array.prototype.concat()")}}.
- {{jsxref("Symbol.iterator")}}
  - : Một phương thức trả về iterator mặc định cho một đối tượng. Được dùng bởi [`for...of`](/en-US/docs/Web/JavaScript/Reference/Statements/for...of).
- {{jsxref("Symbol.match")}}
  - : Một phương thức khớp với một chuỗi, cũng được dùng để xác định xem một đối tượng có thể được dùng như một biểu thức chính quy không. Được dùng bởi {{jsxref("String.prototype.match()")}}.
- {{jsxref("Symbol.matchAll")}}
  - : Một phương thức trả về một iterator, cho ra các kết quả khớp của biểu thức chính quy với một chuỗi. Được dùng bởi {{jsxref("String.prototype.matchAll()")}}.
- {{jsxref("Symbol.replace")}}
  - : Một phương thức thay thế các chuỗi con khớp của một chuỗi. Được dùng bởi {{jsxref("String.prototype.replace()")}}.
- {{jsxref("Symbol.search")}}
  - : Một phương thức trả về chỉ mục trong một chuỗi khớp với biểu thức chính quy. Được dùng bởi {{jsxref("String.prototype.search()")}}.
- {{jsxref("Symbol.species")}}
  - : Một hàm constructor được dùng để tạo các đối tượng dẫn xuất.
- {{jsxref("Symbol.split")}}
  - : Một phương thức chia chuỗi tại các chỉ mục khớp với biểu thức chính quy. Được dùng bởi {{jsxref("String.prototype.split()")}}.
- {{jsxref("Symbol.toPrimitive")}}
  - : Một phương thức chuyển đổi một đối tượng thành một giá trị nguyên thủy.
- {{jsxref("Symbol.toStringTag")}}
  - : Một giá trị chuỗi được dùng cho mô tả mặc định của một đối tượng. Được dùng bởi {{jsxref("Object.prototype.toString()")}}.
- {{jsxref("Symbol.unscopables")}}
  - : Một đối tượng có tên thuộc tính riêng và kế thừa được loại trừ khỏi các ràng buộc môi trường [`with`](/en-US/docs/Web/JavaScript/Reference/Statements/with) của đối tượng liên kết.

## Phương thức tĩnh

- {{jsxref("Symbol.for()")}}
  - : Tìm kiếm các Symbol đã đăng ký hiện có trong global Symbol registry với `key` đã cho và trả về nó nếu tìm thấy. Nếu không, một Symbol mới được tạo và đăng ký với `key`.
- {{jsxref("Symbol.keyFor()")}}
  - : Lấy một key Symbol dùng chung từ global Symbol registry cho Symbol đã cho.

## Thuộc tính instance

Các thuộc tính này được định nghĩa trên `Symbol.prototype` và được chia sẻ bởi tất cả các instance `Symbol`.

- {{jsxref("Object/constructor", "Symbol.prototype.constructor")}}
  - : Hàm constructor đã tạo ra đối tượng instance. Đối với các instance `Symbol`, giá trị ban đầu là constructor {{jsxref("Symbol/Symbol", "Symbol")}}.
- {{jsxref("Symbol.prototype.description")}}
  - : Một chuỗi chỉ đọc chứa mô tả của Symbol.
- `Symbol.prototype[Symbol.toStringTag]`
  - : Giá trị ban đầu của thuộc tính [`[Symbol.toStringTag]`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Symbol/toStringTag) là chuỗi `"Symbol"`. Thuộc tính này được dùng trong {{jsxref("Object.prototype.toString()")}}. Tuy nhiên, vì `Symbol` cũng có phương thức [`toString()`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Symbol/toString) riêng, thuộc tính này không được dùng trừ khi bạn gọi [`Object.prototype.toString.call()`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Function/call) với một symbol làm `thisArg`.

## Phương thức instance

- {{jsxref("Symbol.prototype.toString()")}}
  - : Trả về một chuỗi chứa mô tả của Symbol. Ghi đè phương thức {{jsxref("Object.prototype.toString()")}}.
- {{jsxref("Symbol.prototype.valueOf()")}}
  - : Trả về Symbol. Ghi đè phương thức {{jsxref("Object.prototype.valueOf()")}}.
- [`Symbol.prototype[Symbol.toPrimitive]()`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Symbol/Symbol.toPrimitive)
  - : Trả về Symbol.

## Ví dụ

### Sử dụng toán tử typeof với Symbol

Toán tử {{jsxref("Operators/typeof", "typeof")}} có thể giúp bạn xác định Symbol.

```js
typeof Symbol() === "symbol";
typeof Symbol("foo") === "symbol";
typeof Symbol.iterator === "symbol";
```

### Chuyển đổi kiểu Symbol

Một số điều cần lưu ý khi làm việc với chuyển đổi kiểu của Symbol.

- Khi cố gắng chuyển đổi một Symbol thành số, {{jsxref("TypeError")}} sẽ được ném ra
  (ví dụ: `+sym` hoặc `sym | 0`).
- Khi sử dụng so sánh lỏng lẻo, `Object(sym) == sym` trả về `true`.
- `Symbol("foo") + "bar"` ném ra {{jsxref("TypeError")}} (không thể chuyển đổi Symbol thành chuỗi). Điều này ngăn bạn vô tình tạo tên thuộc tính chuỗi mới từ một Symbol, chẳng hạn.
- [Chuyển đổi `String(sym)` "an toàn hơn"](/en-US/docs/Web/JavaScript/Reference/Global_Objects/String#string_conversion) hoạt động giống như một lời gọi đến {{jsxref("Symbol.prototype.toString()")}} với Symbol, nhưng lưu ý rằng `new String(sym)` sẽ ném lỗi.

### Symbol và vòng lặp for...in

Symbol không thể liệt kê trong các vòng lặp [`for...in`](/en-US/docs/Web/JavaScript/Reference/Statements/for...in). Ngoài ra, {{jsxref("Object.getOwnPropertyNames()")}} sẽ không trả về các thuộc tính đối tượng Symbol, tuy nhiên bạn có thể dùng {{jsxref("Object.getOwnPropertySymbols()")}} để lấy chúng.

```js
const obj = {};

obj[Symbol("a")] = "a";
obj[Symbol.for("b")] = "b";
obj["c"] = "c";
obj.d = "d";

for (const i in obj) {
  console.log(i);
}
// "c" "d"
```

### Symbol và JSON.stringify()

Các thuộc tính có khóa là Symbol sẽ bị bỏ qua hoàn toàn khi dùng `JSON.stringify()`:

```js
JSON.stringify({ [Symbol("foo")]: "foo" });
// '{}'
```

Để biết thêm chi tiết, xem {{jsxref("JSON.stringify()")}}.

### Đối tượng bao bọc Symbol làm khóa thuộc tính

Khi một đối tượng bao bọc Symbol được dùng làm khóa thuộc tính, đối tượng này sẽ bị ép kiểu thành Symbol được bao bọc:

```js
const sym = Symbol("foo");
const obj = { [sym]: 1 };
obj[sym]; // 1
obj[Object(sym)]; // still 1
```

## Đặc tả

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Polyfill của `Symbol` trong `core-js`](https://github.com/zloirock/core-js#ecmascript-symbol)
- {{jsxref("Operators/typeof", "typeof")}}
- [Kiểu dữ liệu và cấu trúc dữ liệu JavaScript](/en-US/docs/Web/JavaScript/Guide/Data_structures)
- [ES6 In Depth: Symbols](https://hacks.mozilla.org/2015/06/es6-in-depth-symbols/) trên hacks.mozilla.org (2015)
