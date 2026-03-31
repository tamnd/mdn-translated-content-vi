---
title: with
slug: Web/JavaScript/Reference/Statements/with
page-type: javascript-statement
status:
  - deprecated
browser-compat: javascript.statements.with
sidebar: jssidebar
---

{{Deprecated_Header}}

> [!NOTE]
> Không nên dùng câu lệnh `with` vì nó có thể là nguồn gốc của các lỗi khó hiểu và vấn đề tương thích, làm tối ưu hóa không thể thực hiện được, và bị cấm trong [strict mode](/en-US/docs/Web/JavaScript/Reference/Strict_mode). Cách thay thế được khuyến nghị là gán đối tượng mà bạn muốn truy cập thuộc tính của nó vào một biến tạm thời.

Câu lệnh **`with`** mở rộng chuỗi phạm vi (scope chain) cho một câu lệnh.

## Cú pháp

```js-nolint
with (expression)
  statement
```

- `expression`
  - : Thêm biểu thức đã cho vào chuỗi phạm vi được dùng khi đánh giá câu lệnh. Dấu ngoặc đơn quanh biểu thức là bắt buộc.
- `statement`
  - : Bất kỳ câu lệnh nào. Để thực thi nhiều câu lệnh, hãy dùng câu lệnh [block](/en-US/docs/Web/JavaScript/Reference/Statements/block) (`{ ... }`) để nhóm các câu lệnh đó lại.

## Mô tả

Có hai loại identifier: _qualified_ identifier và _unqualified_ identifier. Unqualified identifier là identifier không chỉ ra nguồn gốc của nó.

```js
foo; // unqualified identifier
foo.bar; // bar is a qualified identifier
```

Thông thường, unqualified identifier được giải quyết bằng cách tìm kiếm trong chuỗi phạm vi một biến có tên đó, trong khi qualified identifier được giải quyết bằng cách tìm kiếm trong chuỗi prototype của một đối tượng một thuộc tính có tên đó.

```js
const foo = { bar: 1 };
console.log(foo.bar);
// foo is found in the scope chain as a variable;
// bar is found in foo as a property
```

Một ngoại lệ là [global object](/en-US/docs/Glossary/Global_object), nằm ở đầu chuỗi phạm vi, và các thuộc tính của nó tự động trở thành biến toàn cục có thể được tham chiếu mà không cần qualifier.

```js
console.log(globalThis.Math === Math); // true
```

Câu lệnh `with` thêm đối tượng đã cho vào đầu chuỗi phạm vi này trong quá trình đánh giá thân câu lệnh của nó. Mọi tên chưa được qualified sẽ được tìm kiếm trong đối tượng trước (thông qua kiểm tra [`in`](/en-US/docs/Web/JavaScript/Reference/Operators/in)) trước khi tìm kiếm trong chuỗi phạm vi phía trên.

Lưu ý rằng nếu tham chiếu unqualified chỉ đến một phương thức của đối tượng, phương thức đó sẽ được gọi với đối tượng là giá trị `this` của nó.

```js
with ([1, 2, 3]) {
  console.log(toString()); // 1,2,3
}
```

Đối tượng có thể có thuộc tính [`[Symbol.unscopables]`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Symbol/unscopables), định nghĩa danh sách các thuộc tính không được thêm vào chuỗi phạm vi (để đảm bảo tương thích ngược). Xem tài liệu [`Symbol.unscopables`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Symbol/unscopables) để biết thêm thông tin.

Lý do để sử dụng câu lệnh `with` bao gồm tiết kiệm một biến tạm thời và giảm kích thước file bằng cách tránh lặp lại một tham chiếu đối tượng dài. Tuy nhiên, có nhiều lý do hơn để không nên dùng câu lệnh `with`:

- Hiệu suất: Câu lệnh `with` buộc đối tượng được chỉ định phải được tìm kiếm trước cho tất cả các tra cứu tên. Do đó, tất cả các identifier không phải thành viên của đối tượng được chỉ định sẽ được tìm thấy chậm hơn trong một block `with`. Hơn nữa, trình tối ưu hóa không thể giả định bất kỳ điều gì về mỗi identifier chưa được qualified chỉ đến điều gì, vì vậy nó phải lặp lại cùng việc tra cứu thuộc tính mỗi khi identifier được sử dụng.
- Tính dễ đọc: Câu lệnh `with` khiến cho người đọc hoặc trình biên dịch JavaScript khó quyết định liệu một tên chưa được qualified có được tìm thấy trong chuỗi phạm vi hay không, và nếu có thì trong đối tượng nào. Ví dụ:

  ```js
  function f(x, o) {
    with (o) {
      console.log(x);
    }
  }
  ```

  Nếu chỉ nhìn vào định nghĩa của `f`, không thể biết `x` trong thân `with` chỉ đến điều gì. Chỉ khi `f` được gọi, `x` mới có thể được xác định là `o.x` hoặc tham số hình thức đầu tiên của `f`. Nếu bạn quên định nghĩa `x` trong đối tượng bạn truyền làm tham số thứ hai, bạn sẽ không nhận được lỗi — thay vào đó bạn sẽ chỉ nhận được kết quả không mong đợi. Cũng không rõ ý định thực sự của đoạn code như vậy là gì.

- Tương thích tương lai: Code sử dụng `with` có thể không tương thích tương lai, đặc biệt khi được dùng với thứ khác ngoài một plain object, có thể có thêm thuộc tính trong tương lai. Xem ví dụ này:

  ```js
  function f(foo, values) {
    with (foo) {
      console.log(values);
    }
  }
  ```

  Nếu bạn gọi `f([1, 2, 3], obj)` trong môi trường ECMAScript 5, tham chiếu `values` trong câu lệnh `with` sẽ giải quyết thành `obj`. Tuy nhiên, ECMAScript 2015 giới thiệu thuộc tính [`values`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Array/values) trên `Array.prototype` (vì vậy nó sẽ có sẵn trên mọi mảng). Vì vậy, sau khi nâng cấp môi trường, tham chiếu `values` bên trong câu lệnh `with` sẽ giải quyết thành `[1, 2, 3].values` thay thế, và có thể gây ra lỗi.

  Trong ví dụ cụ thể này, `values` được định nghĩa là unscopable thông qua [`Array.prototype[Symbol.unscopables]`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Array/Symbol.unscopables), vì vậy nó vẫn giải quyết chính xác thành tham số `values`. Nếu nó không được định nghĩa là unscopable, người ta có thể thấy đây sẽ là một vấn đề khó debug như thế nào.

## Ví dụ

### Sử dụng câu lệnh with

Câu lệnh `with` sau chỉ định rằng đối tượng {{jsxref("Math")}} là đối tượng mặc định. Các câu lệnh theo sau câu lệnh `with` tham chiếu đến thuộc tính {{jsxref("Math/PI", "PI")}} và các phương thức {{jsxref("Math/cos", "cos")}} và {{jsxref("Math/sin", "sin")}}, mà không chỉ định đối tượng. JavaScript giả định đối tượng `Math` cho các tham chiếu này.

```js
let a, x, y;
const r = 10;

with (Math) {
  a = PI * r * r;
  x = r * cos(PI);
  y = r * sin(PI / 2);
}
```

### Tránh câu lệnh with bằng cách destructuring thuộc tính vào phạm vi hiện tại

Thông thường bạn có thể tránh dùng `with` thông qua [destructuring thuộc tính](/en-US/docs/Web/JavaScript/Reference/Operators/Destructuring). Ở đây chúng ta tạo một block bổ sung để mô phỏng hành vi của `with` khi tạo một phạm vi bổ sung — nhưng trong cách dùng thực tế, block này thường có thể được bỏ qua.

```js
let a, x, y;
const r = 10;

{
  const { PI, cos, sin } = Math;
  a = PI * r * r;
  x = r * cos(PI);
  y = r * sin(PI / 2);
}
```

### Tránh câu lệnh with bằng cách dùng IIFE

Nếu bạn đang tạo ra một biểu thức phải sử dụng lại nhiều lần một tham chiếu có tên dài, và mục tiêu của bạn là loại bỏ tên dài đó trong biểu thức, bạn có thể bọc biểu thức trong một [IIFE](/en-US/docs/Glossary/IIFE) và cung cấp tên dài như một đối số.

```js
const objectHavingAnEspeciallyLengthyName = { foo: true, bar: false };

if (((o) => o.foo && !o.bar)(objectHavingAnEspeciallyLengthyName)) {
  // This branch runs.
}
```

### Tạo namespace động bằng cách dùng câu lệnh with và proxy

`with` sẽ chuyển đổi mọi tra cứu biến thành tra cứu thuộc tính, trong khi [Proxy](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Proxy) cho phép bắt mọi lệnh gọi tra cứu thuộc tính. Bạn có thể tạo namespace động bằng cách kết hợp chúng.

```js
const namespace = new Proxy(
  {},
  {
    has(target, key) {
      // Avoid trapping global properties like `console`
      if (key in globalThis) {
        return false;
      }
      // Trap all property lookups
      return true;
    },
    get(target, key) {
      return key;
    },
  },
);

with (namespace) {
  console.log(a, b, c); // "a" "b" "c"
}
```

## Thông số kỹ thuật

{{Specifications}}

## Khả năng tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{jsxref("Statements/block", "block", "", 1)}}
- [Strict mode](/en-US/docs/Web/JavaScript/Reference/Strict_mode)
- {{jsxref("Symbol.unscopables")}}
- [`Array.prototype[Symbol.unscopables]`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Array/Symbol.unscopables)
