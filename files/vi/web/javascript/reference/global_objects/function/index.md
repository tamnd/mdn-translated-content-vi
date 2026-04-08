---
title: Function
slug: Web/JavaScript/Reference/Global_Objects/Function
page-type: javascript-class
browser-compat: javascript.builtins.Function
sidebar: jsref
---

Đối tượng **`Function`** cung cấp các phương thức cho [hàm (function)](/en-US/docs/Web/JavaScript/Reference/Functions). Trong JavaScript, mọi hàm thực chất đều là một đối tượng `Function`.

## Constructor

- {{jsxref("Function/Function", "Function()")}}
  - : Tạo một đối tượng `Function` mới. Gọi constructor trực tiếp có thể tạo hàm động, nhưng gặp phải vấn đề bảo mật và hiệu suất tương tự (nhưng ít nghiêm trọng hơn đáng kể) so với {{jsxref("Global_Objects/eval", "eval()")}}. Tuy nhiên, khác với `eval()`, constructor `Function` tạo ra các hàm chỉ thực thi trong phạm vi toàn cục (global scope).

## Instance properties

Các thuộc tính này được định nghĩa trên `Function.prototype` và chia sẻ cho tất cả các instance của `Function`.

- {{jsxref("Function.prototype.arguments")}} {{deprecated_inline}} {{non-standard_inline}}
  - : Đại diện cho các đối số được truyền vào hàm. Với các hàm [strict](/en-US/docs/Web/JavaScript/Reference/Strict_mode), arrow, async và generator, việc truy cập thuộc tính `arguments` sẽ ném {{jsxref("TypeError")}}. Hãy dùng đối tượng {{jsxref("Functions/arguments", "arguments")}} bên trong các closure của hàm thay thế.
- {{jsxref("Function.prototype.caller")}} {{deprecated_inline}} {{non-standard_inline}}
  - : Đại diện cho hàm đã gọi hàm hiện tại. Với các hàm [strict](/en-US/docs/Web/JavaScript/Reference/Strict_mode), arrow, async và generator, việc truy cập thuộc tính `caller` sẽ ném {{jsxref("TypeError")}}.
- {{jsxref("Object/constructor", "Function.prototype.constructor")}}
  - : Hàm constructor đã tạo ra đối tượng instance. Với các instance của `Function`, giá trị ban đầu là constructor {{jsxref("Function/Function", "Function")}}.

Các thuộc tính sau là thuộc tính riêng của từng instance `Function`.

- {{jsxref("Function/displayName", "displayName")}} {{non-standard_inline}} {{optional_inline}}
  - : Tên hiển thị của hàm.
- {{jsxref("Function/length", "length")}}
  - : Chỉ định số lượng đối số mà hàm mong đợi.
- {{jsxref("Function/name", "name")}}
  - : Tên của hàm.
- {{jsxref("Function/prototype", "prototype")}}
  - : Được dùng khi hàm được sử dụng như một constructor với toán tử [`new`](/en-US/docs/Web/JavaScript/Reference/Operators/new). Nó sẽ trở thành prototype của đối tượng mới tạo ra.

## Instance methods

- {{jsxref("Function.prototype.apply()")}}
  - : Gọi một hàm với giá trị `this` cho trước và các đối số tùy chọn được truyền dưới dạng mảng (hoặc [đối tượng giống mảng](/en-US/docs/Web/JavaScript/Guide/Indexed_collections#working_with_array-like_objects)).
- {{jsxref("Function.prototype.bind()")}}
  - : Tạo một hàm mới mà khi được gọi, từ khóa `this` của nó được đặt thành giá trị đã cung cấp, kèm theo một chuỗi đối số tùy chọn đứng trước bất kỳ đối số nào được cung cấp khi hàm mới được gọi.
- {{jsxref("Function.prototype.call()")}}
  - : Gọi một hàm với giá trị `this` cho trước và các đối số tùy chọn.
- {{jsxref("Function.prototype.toString()")}}
  - : Trả về một chuỗi biểu diễn mã nguồn của hàm.
    Ghi đè phương thức {{jsxref("Object.prototype.toString")}}.
- [`Function.prototype[Symbol.hasInstance]()`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Function/Symbol.hasInstance)
  - : Chỉ định quy trình mặc định để xác định xem một hàm constructor có nhận biết một đối tượng là instance của constructor đó hay không. Được gọi bởi toán tử [`instanceof`](/en-US/docs/Web/JavaScript/Reference/Operators/instanceof).

## Examples

### Sự khác biệt giữa Function constructor và khai báo hàm

Các hàm được tạo bằng constructor `Function` không tạo closure gắn với ngữ cảnh tạo ra chúng; chúng luôn được tạo trong phạm vi toàn cục. Khi chạy, chúng chỉ có thể truy cập các biến cục bộ của chính mình và các biến toàn cục, không thể truy cập các biến từ phạm vi mà constructor `Function` được gọi. Điều này khác với việc dùng {{jsxref("Global_Objects/eval", "eval()")}} với mã của một hàm expression.

```js
// Create a global property with `var`
var x = 10;

function createFunction1() {
  const x = 20;
  return new Function("return x;"); // this `x` refers to global `x`
}

function createFunction2() {
  const x = 20;
  function f() {
    return x; // this `x` refers to the local `x` above
  }
  return f;
}

const f1 = createFunction1();
console.log(f1()); // 10
const f2 = createFunction2();
console.log(f2()); // 20
```

Mặc dù code này hoạt động trên trình duyệt web, `f1()` sẽ gây ra `ReferenceError` trong Node.js vì `x` không được tìm thấy. Nguyên nhân là phạm vi cấp cao nhất trong Node không phải là phạm vi toàn cục, và `x` sẽ là cục bộ của module.

## Specifications

{{Specifications}}

## Browser compatibility

{{Compat}}

## See also

- [`function`](/en-US/docs/Web/JavaScript/Reference/Statements/function)
- [`function` expression](/en-US/docs/Web/JavaScript/Reference/Operators/function)
- {{jsxref("AsyncFunction")}}
- {{jsxref("AsyncGeneratorFunction")}}
- {{jsxref("GeneratorFunction")}}
- {{jsxref("Functions", "Functions", "", 1)}}
