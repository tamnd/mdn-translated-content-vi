---
title: Function.prototype.toString()
short-title: toString()
slug: Web/JavaScript/Reference/Global_Objects/Function/toString
page-type: javascript-instance-method
browser-compat: javascript.builtins.Function.toString
sidebar: jsref
---

Phương thức **`toString()`** của các instance {{jsxref("Function")}} trả về một chuỗi biểu diễn mã nguồn của hàm này.

{{InteractiveExample("JavaScript Demo: Function.prototype.toString()")}}

```js interactive-example
function sum(a, b) {
  return a + b;
}

console.log(sum.toString());
// Expected output: "function sum(a, b) {
//                     return a + b;
//                   }"

console.log(Math.abs.toString());
// Expected output: "function abs() { [native code] }"
```

## Cú pháp

```js-nolint
toString()
```

### Tham số

Không có.

### Giá trị trả về

Một chuỗi biểu diễn mã nguồn của hàm.

## Mô tả

Đối tượng {{jsxref("Function")}} ghi đè phương thức `toString()` kế thừa từ {{jsxref("Object")}}; nó không kế thừa {{jsxref("Object.prototype.toString")}}. Đối với các đối tượng `Function` do người dùng định nghĩa, phương thức `toString` trả về một chuỗi chứa đoạn văn bản nguồn dùng để định nghĩa hàm.

JavaScript tự động gọi phương thức `toString` khi một `Function` cần được biểu diễn dưới dạng giá trị văn bản, ví dụ khi hàm được nối với một chuỗi.

Phương thức `toString()` sẽ ném ngoại lệ {{jsxref("TypeError")}} ("Function.prototype.toString called on incompatible object") nếu giá trị `this` của nó không phải đối tượng `Function`.

```js example-bad
Function.prototype.toString.call("foo"); // throws TypeError
```

Nếu phương thức `toString()` được gọi trên các đối tượng hàm tích hợp, một hàm được tạo bởi {{jsxref("Function.prototype.bind()")}}, hoặc các hàm không phải JavaScript khác, thì `toString()` trả về một _chuỗi hàm native_ trông như:

```plain
function someName() { [native code] }
```

Đối với các phương thức và hàm đối tượng nội tại, `someName` là tên ban đầu của hàm; ngược lại nội dung của nó có thể do cài đặt xác định, nhưng luôn ở dạng cú pháp tên thuộc tính, như `[1 + 1]`, `someName`, hoặc `1`.

> [!NOTE]
> Điều này có nghĩa là sử dụng [`eval()`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/eval) trên các chuỗi hàm native là lỗi cú pháp được đảm bảo.

Nếu phương thức `toString()` được gọi trên một hàm được tạo bởi constructor `Function`, `toString()` trả về mã nguồn của một khai báo hàm tổng hợp có tên "anonymous" sử dụng các tham số và thân hàm được cung cấp. Ví dụ, `Function("a", "b", "return a + b").toString()` sẽ trả về:

```plain
function anonymous(a,b
) {
return a + b
}
```

Kể từ ES2018, đặc tả yêu cầu giá trị trả về của `toString()` phải là mã nguồn chính xác như khi được khai báo, bao gồm mọi khoảng trắng và/hoặc comment — hoặc, nếu host không có mã nguồn vì lý do nào đó, yêu cầu trả về chuỗi hàm native. Hỗ trợ cho hành vi sửa đổi này có thể tìm thấy trong [bảng tương thích](#browser_compatibility).

## Ví dụ

### So sánh mã nguồn thực tế và kết quả toString

```js
function test(fn) {
  console.log(fn.toString());
}

function f() {}
class A {
  a() {}
}
function* g() {}

test(f); // "function f() {}"
test(A); // "class A { a() {} }"
test(g); // "function* g() {}"
test((a) => a); // "(a) => a"
test({ a() {} }.a); // "a() {}"
test({ *a() {} }.a); // "*a() {}"
test({ [0]() {} }[0]); // "[0]() {}"
test(Object.getOwnPropertyDescriptor({ get a() {} }, "a").get); // "get a() {}"
test(Object.getOwnPropertyDescriptor({ set a(x) {} }, "a").set); // "set a(x) {}"
test(Function.prototype.toString); // "function toString() { [native code] }"
test(function f() {}.bind(0)); // "function () { [native code] }"
test(Function("a", "b")); // function anonymous(a\n) {\nb\n}
```

Lưu ý rằng sau khi sửa đổi `Function.prototype.toString()`, khi `toString()` được gọi, các cài đặt không bao giờ được phép tổng hợp mã nguồn của hàm nếu không phải là chuỗi hàm native. Phương thức luôn trả về mã nguồn chính xác được dùng để tạo hàm — bao gồm các ví dụ [getter](/en-US/docs/Web/JavaScript/Reference/Functions/get) và [setter](/en-US/docs/Web/JavaScript/Reference/Functions/set) ở trên. Constructor [`Function`](/en-US/docs/Web/JavaScript/Reference/Functions) tự thân có khả năng tổng hợp mã nguồn của hàm (và do đó là một dạng [`eval()`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/eval) ngầm định).

### Lấy văn bản nguồn của một hàm

Có thể lấy văn bản nguồn của một hàm bằng cách ép nó thành chuỗi — ví dụ, bằng cách bao nó trong template literal:

```js
function foo() {
  return "bar";
}
console.log(`${foo}`);
// function foo() {
//   return "bar";
// }
```

Văn bản nguồn này là _chính xác_, bao gồm mọi comment xen kẽ (vốn sẽ không được lưu trữ bởi biểu diễn nội bộ của engine).

```js
function foo /* a comment */() {
  return "bar";
}
console.log(foo.toString());
// function foo /* a comment */() {
//   return "bar";
// }
```

## Đặc tả

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{jsxref("Object.prototype.toString()")}}
