---
title: arguments.callee
short-title: callee
slug: Web/JavaScript/Reference/Functions/arguments/callee
page-type: javascript-instance-data-property
status:
  - deprecated
browser-compat: javascript.functions.arguments.callee
sidebar: jssidebar
---

{{Deprecated_Header}}

> [!NOTE]
> Truy cập `arguments.callee` trong [strict mode](/en-US/docs/Web/JavaScript/Reference/Strict_mode) sẽ ném ra {{jsxref("TypeError")}}. Nếu một hàm phải tham chiếu đến chính nó, hãy đặt tên cho [function expression](/en-US/docs/Web/JavaScript/Reference/Operators/function) hoặc sử dụng [khai báo hàm](/en-US/docs/Web/JavaScript/Reference/Statements/function).

Thuộc tính dữ liệu **`arguments.callee`** chứa hàm đang thực thi hiện tại mà các đối số thuộc về.

## Giá trị

Một tham chiếu đến hàm đang thực thi hiện tại.

{{js_property_attributes(1, 0, 1)}}

> [!NOTE]
> `callee` là thuộc tính dữ liệu chỉ trong các hàm không nghiêm ngặt với tham số đơn giản (trong trường hợp này đối tượng `arguments` cũng [tự động đồng bộ](/en-US/docs/Web/JavaScript/Reference/Functions/arguments#assigning_to_indices)). Ngược lại, đây là thuộc tính accessor mà getter và setter của nó đều ném ra {{jsxref("TypeError")}}.

## Mô tả

`callee` là thuộc tính của đối tượng `arguments`. Nó có thể được dùng để tham chiếu đến hàm đang thực thi hiện tại bên trong thân hàm đó. Điều này hữu ích khi tên của hàm không được biết, chẳng hạn trong một function expression không có tên (còn gọi là "anonymous function").

(Văn bản dưới đây phần lớn được điều chỉnh từ [câu trả lời Stack Overflow của olliej](https://stackoverflow.com/questions/103598/why-was-the-arguments-callee-caller-property-deprecated-in-javascript/235760))

Các phiên bản JavaScript ban đầu không cho phép named function expression, và vì lý do này bạn không thể tạo function expression đệ quy.

Ví dụ, cú pháp này hoạt động:

```js
function factorial(n) {
  return n <= 1 ? 1 : factorial(n - 1) * n;
}

[1, 2, 3, 4, 5].map(factorial);
```

nhưng:

```js
[1, 2, 3, 4, 5].map(function (n) {
  return n <= 1 ? 1 : /* what goes here? */ (n - 1) * n;
});
```

không hoạt động. Để giải quyết vấn đề này, `arguments.callee` đã được thêm vào để bạn có thể làm

```js
[1, 2, 3, 4, 5].map(function (n) {
  return n <= 1 ? 1 : arguments.callee(n - 1) * n;
});
```

Tuy nhiên, thiết kế của `arguments.callee` có nhiều vấn đề. Vấn đề đầu tiên là lời gọi đệ quy sẽ nhận được giá trị `this` khác. Ví dụ:

```js
function sillyFunction(recursed) {
  if (this !== globalThis) {
    console.log("This is:", this);
  } else {
    console.log("This is the global");
  }

  if (!recursed) {
    return arguments.callee(true);
  }
}

sillyFunction();
// This is the global
// This is: [object Arguments]
```

Ngoài ra, các tham chiếu đến `arguments.callee` làm cho việc inlining và tail recursion không thể trong trường hợp chung. (Bạn có thể đạt được điều đó trong một số trường hợp được chọn thông qua tracing, v.v., nhưng ngay cả code tốt nhất cũng không tối ưu do các kiểm tra không cần thiết khác.)

ECMAScript 3 đã giải quyết những vấn đề này bằng cách cho phép named function expression. Ví dụ:

```js
[1, 2, 3, 4, 5].map(function factorial(n) {
  return n <= 1 ? 1 : factorial(n - 1) * n;
});
```

Điều này có nhiều lợi ích:

- hàm có thể được gọi như bất kỳ hàm nào khác từ bên trong code của bạn
- nó không tạo ra biến trong phạm vi bên ngoài ([ngoại trừ IE 8 trở xuống](https://kangax.github.io/nfe/#example_1_function_expression_identifier_leaks_into_an_enclosing_scope))
- hiệu suất tốt hơn so với việc truy cập đối tượng arguments

Strict mode đã cấm các thuộc tính khác rò rỉ thông tin call stack, như thuộc tính [`caller`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Function/caller) của hàm. Đó là vì việc nhìn vào call stack có một hiệu ứng chính: nó làm cho một số lượng lớn các tối ưu hóa không thể, hoặc khó hơn nhiều. Ví dụ, nếu bạn không thể đảm bảo rằng hàm `f` sẽ không gọi một hàm không xác định, thì không thể inline `f`.

```js
function f(a, b, c, d, e) {
  return a ? b * c : d * e;
}
```

Nếu trình thông dịch JavaScript không thể đảm bảo rằng tất cả các đối số được cung cấp đều là số tại điểm lời gọi được thực hiện, nó cần chèn kiểm tra cho tất cả các đối số trước code được inline, hoặc không thể inline hàm. Điều này có nghĩa là bất kỳ call site nào có thể đã được inline một cách tầm thường sẽ tích lũy một số lượng lớn các guard. Trong trường hợp cụ thể này, trình thông dịch thông minh nên có thể sắp xếp lại các kiểm tra để tối ưu hơn và không kiểm tra bất kỳ giá trị nào sẽ không được sử dụng. Tuy nhiên trong nhiều trường hợp điều đó là không thể và do đó nó trở thành không thể inline.

## Ví dụ

### Sử dụng arguments.callee trong hàm đệ quy ẩn danh

Một hàm đệ quy phải có thể tự tham chiếu. Thông thường, một hàm tham chiếu đến chính nó theo tên của nó. Tuy nhiên, một hàm ẩn danh (có thể được tạo bởi [function expression](/en-US/docs/Web/JavaScript/Reference/Operators/function) hoặc [constructor `Function`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Function)) không có tên. Vì vậy nếu không có biến nào có thể truy cập tham chiếu đến nó, cách duy nhất để hàm tham chiếu đến chính nó là thông qua `arguments.callee`.

Ví dụ sau định nghĩa một hàm, lần lượt định nghĩa và trả về một hàm giai thừa. Ví dụ này không thực tế lắm, và hầu như không có trường hợp nào mà kết quả tương tự không thể đạt được với [named function expression](/en-US/docs/Web/JavaScript/Reference/Operators/function).

```js
function create() {
  return function (n) {
    if (n <= 1) {
      return 1;
    }
    return n * arguments.callee(n - 1);
  };
}

const result = create()(5); // returns 120 (5 * 4 * 3 * 2 * 1)
```

### Đệ quy của hàm ẩn danh với Y-combinator

Mặc dù function expression hiện có thể được đặt tên, [arrow function](/en-US/docs/Web/JavaScript/Reference/Functions/Arrow_functions) luôn ẩn danh, có nghĩa là chúng không thể tham chiếu đến chính mình mà không được gán cho một biến trước. May mắn thay, trong tính toán Lambda có một giải pháp rất tốt cho phép một hàm vừa ẩn danh vừa tự tham chiếu. Kỹ thuật này được gọi là [Y-combinator](https://en.wikipedia.org/wiki/Fixed-point_combinator#Y_combinator). Ở đây chúng ta sẽ không giải thích _cách_ nó hoạt động, chỉ _rằng_ nó hoạt động.

```js
// The Y-combinator: a utility function!
const Y = (hof) => ((x) => x(x))((x) => hof((y) => x(x)(y)));

console.log(
  [1, 2, 3, 4, 5].map(
    // Wrap the higher-order function in the Y-combinator
    // "factorial" is not a function's name: it's introduced as a parameter
    Y((factorial) => (n) => (n <= 1 ? 1 : factorial(n - 1) * n)),
  ),
);
// [ 1, 2, 6, 24, 120 ]
```

> [!NOTE]
> Phương pháp này cấp phát một closure mới cho mỗi lần lặp, điều này có thể tăng đáng kể mức sử dụng bộ nhớ. Nó chỉ ở đây để minh họa khả năng, nhưng nên tránh trong môi trường production. Hãy sử dụng biến tạm thời hoặc named function expression thay thế.

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- Hướng dẫn [Functions](/en-US/docs/Web/JavaScript/Guide/Functions)
- [Functions](/en-US/docs/Web/JavaScript/Reference/Functions)
- {{jsxref("Functions/arguments", "arguments")}}
- {{jsxref("Function.prototype.caller")}}
