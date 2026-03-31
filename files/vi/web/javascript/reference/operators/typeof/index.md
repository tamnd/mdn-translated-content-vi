---
title: typeof
slug: Web/JavaScript/Reference/Operators/typeof
page-type: javascript-operator
browser-compat: javascript.operators.typeof
sidebar: jssidebar
---

Toán tử **`typeof`** trả về một chuỗi cho biết kiểu của giá trị toán hạng.

{{InteractiveExample("JavaScript Demo: typeof operator")}}

```js interactive-example
console.log(typeof 42);
// Expected output: "number"

console.log(typeof "blubber");
// Expected output: "string"

console.log(typeof true);
// Expected output: "boolean"

console.log(typeof undeclaredVariable);
// Expected output: "undefined"
```

## Cú pháp

```js-nolint
typeof operand
```

### Tham số

- `operand`
  - : Một biểu thức đại diện cho đối tượng hoặc [giá trị nguyên thủy (primitive)](/en-US/docs/Glossary/Primitive) cần xác định kiểu.

## Mô tả

Bảng dưới đây tóm tắt các giá trị trả về có thể có của `typeof`. Để biết thêm thông tin về các kiểu và giá trị nguyên thủy, hãy xem trang [cấu trúc dữ liệu JavaScript](/en-US/docs/Web/JavaScript/Guide/Data_structures).

| Kiểu                                                                                                                                                                                      | Kết quả                            |
| ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | ---------------------------------- |
| [Undefined](/en-US/docs/Web/JavaScript/Reference/Global_Objects/undefined)                                                                                                                | `"undefined"`                      |
| [Null](/en-US/docs/Web/JavaScript/Reference/Operators/null)                                                                                                                               | `"object"` ([lý do](#typeof_null)) |
| [Boolean](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Boolean)                                                                                                                    | `"boolean"`                        |
| [Number](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Number)                                                                                                                      | `"number"`                         |
| [BigInt](/en-US/docs/Web/JavaScript/Reference/Global_Objects/BigInt)                                                                                                                      | `"bigint"`                         |
| [String](/en-US/docs/Web/JavaScript/Reference/Global_Objects/String)                                                                                                                      | `"string"`                         |
| [Symbol](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Symbol)                                                                                                                      | `"symbol"`                         |
| [Function](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Function) (có \[\[Call\]\] theo ECMA-262; [class](/en-US/docs/Web/JavaScript/Reference/Statements/class) cũng là function) | `"function"`                       |
| Bất kỳ đối tượng nào khác                                                                                                                                                                 | `"object"`                         |

Danh sách các giá trị này là đầy đủ. Không có engine nào tuân thủ đặc tả được báo cáo là tạo ra (hay từng tạo ra) các giá trị khác ngoài những giá trị được liệt kê.

## Ví dụ

### Sử dụng cơ bản

```js
// Số
typeof 37 === "number";
typeof 3.14 === "number";
typeof 42 === "number";
typeof Math.LN2 === "number";
typeof Infinity === "number";
typeof NaN === "number"; // Dù là "Not-A-Number"
typeof Number("1") === "number"; // Number cố gắng chuyển đổi giá trị thành số
typeof Number("shoe") === "number"; // kể cả các giá trị không thể ép kiểu thành số

typeof 42n === "bigint";

// Chuỗi
typeof "" === "string";
typeof "bla" === "string";
typeof `template literal` === "string";
typeof "1" === "string"; // lưu ý rằng một số trong chuỗi vẫn có typeof là string
typeof typeof 1 === "string"; // typeof luôn trả về chuỗi
typeof String(1) === "string"; // String chuyển đổi bất cứ thứ gì thành chuỗi, an toàn hơn toString

// Boolean
typeof true === "boolean";
typeof false === "boolean";
typeof Boolean(1) === "boolean"; // Boolean() chuyển đổi giá trị dựa trên tính truthy hoặc falsy
typeof !!1 === "boolean"; // hai lần dùng toán tử ! (NOT logic) tương đương với Boolean()

// Symbol
typeof Symbol() === "symbol";
typeof Symbol("foo") === "symbol";
typeof Symbol.iterator === "symbol";

// Undefined
typeof undefined === "undefined";
typeof declaredButUndefinedVariable === "undefined";
typeof undeclaredVariable === "undefined";

// Đối tượng
typeof { a: 1 } === "object";

// dùng Array.isArray hoặc Object.prototype.toString.call
// để phân biệt đối tượng thông thường với mảng
typeof [1, 2, 4] === "object";

typeof new Date() === "object";
typeof /regex/ === "object";

// Những ví dụ sau đây gây nhầm lẫn, nguy hiểm và lãng phí. Hãy tránh chúng.
typeof new Boolean(true) === "object";
typeof new Number(1) === "object";
typeof new String("abc") === "object";

// Hàm
typeof function () {} === "function";
typeof class C {} === "function";
typeof Math.sin === "function";
```

### typeof null

```js
// Điều này đúng từ thuở đầu của JavaScript
typeof null === "object";
```

Trong phiên bản thực thi đầu tiên của JavaScript, các giá trị JavaScript được biểu diễn bằng một thẻ kiểu và một giá trị. Thẻ kiểu cho đối tượng là `0`. `null` được biểu diễn bằng con trỏ NULL (`0x00` trên hầu hết các nền tảng). Kết quả là `null` có thẻ kiểu là `0`, do đó giá trị trả về của `typeof` là `"object"`. ([tham khảo](https://2ality.com/2013/10/typeof-null.html))

Một bản vá đã được đề xuất cho ECMAScript (thông qua lựa chọn tham gia), nhưng [đã bị từ chối](https://web.archive.org/web/20160331031419/http://wiki.ecmascript.org:80/doku.php?id=harmony:typeof_null). Nếu được chấp nhận, nó sẽ dẫn đến `typeof null === "null"`.

### Sử dụng toán tử new

Tất cả các hàm constructor khi gọi với [`new`](/en-US/docs/Web/JavaScript/Reference/Operators/new) sẽ trả về giá trị không phải nguyên thủy (`"object"` hoặc `"function"`). Hầu hết trả về đối tượng, ngoại trừ đáng chú ý là [`Function`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Function), trả về một hàm.

```js
const str = new String("String");
const num = new Number(100);

typeof str; // "object"
typeof num; // "object"

const func = new Function();

typeof func; // "function"
```

### Cần dấu ngoặc đơn trong cú pháp

Toán tử `typeof` có [độ ưu tiên](/en-US/docs/Web/JavaScript/Reference/Operators/Operator_precedence) cao hơn các toán tử nhị phân như cộng (`+`). Do đó, cần dấu ngoặc đơn để đánh giá kiểu của kết quả phép cộng.

```js
// Dấu ngoặc đơn có thể dùng để xác định kiểu dữ liệu của biểu thức.
const someData = 99;

typeof someData + " foo"; // "number foo"
typeof (someData + " foo"); // "string"
```

### Tương tác với các biến chưa khai báo và chưa khởi tạo

`typeof` hoạt động với các định danh chưa khai báo, trả về `"undefined"` thay vì ném ra lỗi.

```js
typeof undeclaredVariable; // "undefined"
```

Tuy nhiên, sử dụng `typeof` với các khai báo từ vựng ({{jsxref("Statements/let", "let")}} {{jsxref("Statements/const", "const")}}, {{jsxref("Statements/using", "using")}} {{jsxref("Statements/await_using", "await using")}}, và [`class`](/en-US/docs/Web/JavaScript/Reference/Statements/class)) trong cùng một khối trước vị trí khai báo sẽ ném ra {{jsxref("ReferenceError")}}. Các biến có phạm vi khối nằm trong _[vùng chết tạm thời (temporal dead zone)](/en-US/docs/Web/JavaScript/Reference/Statements/let#temporal_dead_zone_tdz)_ từ đầu khối cho đến khi quá trình khởi tạo được xử lý, trong thời gian đó việc truy cập sẽ ném ra lỗi.

```js example-bad
typeof newLetVariable; // ReferenceError
typeof newConstVariable; // ReferenceError
typeof newClass; // ReferenceError

let newLetVariable;
const newConstVariable = "hello";
class newClass {}
```

Xem [`typeof` operator and `undefined`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/undefined#typeof_operator_and_undefined) để biết thêm chi tiết.

### Hành vi đặc biệt của document.all

Tất cả các trình duyệt hiện tại đều cung cấp đối tượng host phi chuẩn [`document.all`](/en-US/docs/Web/API/Document/all) với kiểu là `undefined`.

```js
typeof document.all === "undefined";
```

Mặc dù `document.all` cũng là [falsy](/en-US/docs/Glossary/Falsy) và [bằng lỏng lẻo (loosely equal)](/en-US/docs/Web/JavaScript/Reference/Operators/Equality) với `undefined`, nhưng nó không phải là [`undefined`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/undefined). Trường hợp `document.all` có kiểu là `"undefined"` được phân loại trong các tiêu chuẩn web là một "vi phạm có chủ ý" đối với tiêu chuẩn ECMAScript gốc vì lý do tương thích web.

### Phương thức tùy chỉnh để lấy kiểu chính xác hơn

`typeof` rất hữu ích, nhưng không linh hoạt như có thể cần. Ví dụ, `typeof []` là `"object"`, cũng như `typeof new Date()`, `typeof /abc/`, v.v.

Để kiểm tra kiểu chính xác hơn, dưới đây là hàm tùy chỉnh `type(value)`, về cơ bản bắt chước hành vi của `typeof`, nhưng với các giá trị không phải nguyên thủy (tức là đối tượng và hàm), nó trả về tên kiểu chi tiết hơn khi có thể.

```js
function type(value) {
  if (value === null) {
    return "null";
  }
  const baseType = typeof value;
  // Các kiểu nguyên thủy
  if (!["object", "function"].includes(baseType)) {
    return baseType;
  }

  // Symbol.toStringTag thường chỉ định "tên hiển thị" của
  // lớp đối tượng. Nó được dùng trong Object.prototype.toString().
  const tag = value[Symbol.toStringTag];
  if (typeof tag === "string") {
    return tag;
  }

  // Nếu là hàm mà mã nguồn bắt đầu bằng từ khóa "class"
  if (
    baseType === "function" &&
    Function.prototype.toString.call(value).startsWith("class")
  ) {
    return "class";
  }

  // Tên của constructor; ví dụ `Array`, `GeneratorFunction`,
  // `Number`, `String`, `Boolean` hoặc `MyCustomClass`
  const className = value.constructor.name;
  if (typeof className === "string" && className !== "") {
    return className;
  }

  // Tại điểm này không có cách đáng tin cậy để lấy kiểu của value,
  // vì vậy ta dùng cách triển khai cơ bản.
  return baseType;
}
```

Để kiểm tra các biến có thể chưa tồn tại mà nếu không sẽ ném ra {{jsxref("ReferenceError")}}, hãy dùng `typeof nonExistentVar === "undefined"` vì hành vi này không thể bắt chước bằng code tùy chỉnh.

## Thông số kỹ thuật

{{Specifications}}

## Khả năng tương thích với trình duyệt

{{Compat}}

## Xem thêm

- {{jsxref("Operators/instanceof", "instanceof")}}
- [`document.all` willful violation of the standard](https://github.com/tc39/ecma262/issues/668)
