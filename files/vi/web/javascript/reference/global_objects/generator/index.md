---
title: Generator
slug: Web/JavaScript/Reference/Global_Objects/Generator
page-type: javascript-class
browser-compat: javascript.builtins.Generator
sidebar: jsref
---

Đối tượng **`Generator`** được trả về bởi {{jsxref("Statements/function*", "hàm generator", "", 1)}} và nó tuân theo cả [giao thức iterable](/en-US/docs/Web/JavaScript/Reference/Iteration_protocols#the_iterable_protocol) lẫn [giao thức iterator](/en-US/docs/Web/JavaScript/Reference/Iteration_protocols#the_iterator_protocol).

`Generator` là lớp con của lớp {{jsxref("Iterator")}}.

## Constructor

Không có thực thể JavaScript nào tương ứng với constructor `Generator`. Các instance của `Generator` phải được trả về từ [hàm generator](/en-US/docs/Web/JavaScript/Reference/Statements/function*):

```js
function* generator() {
  yield 1;
  yield 2;
  yield 3;
}

const gen = generator(); // "Generator { }"

console.log(gen.next().value); // 1
console.log(gen.next().value); // 2
console.log(gen.next().value); // 3
```

Chỉ có một đối tượng ẩn là đối tượng prototype được chia sẻ bởi tất cả các đối tượng được tạo bởi hàm generator. Đối tượng này thường được ký hiệu là `Generator.prototype` để trông giống lớp, nhưng nên được gọi chính xác hơn là {{jsxref("GeneratorFunction.prototype.prototype")}}, vì `GeneratorFunction` là một thực thể JavaScript thực sự. Để hiểu chuỗi prototype của các instance `Generator`, xem {{jsxref("GeneratorFunction.prototype.prototype")}}.

## Thuộc tính instance

Các thuộc tính này được định nghĩa trên `Generator.prototype` và được chia sẻ bởi tất cả các instance `Generator`.

- {{jsxref("Object/constructor", "Generator.prototype.constructor")}}
  - : Hàm constructor đã tạo đối tượng instance. Đối với các instance `Generator`, giá trị khởi tạo là [`GeneratorFunction.prototype`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/GeneratorFunction).

    > [!NOTE]
    > Các đối tượng `Generator` không lưu trữ tham chiếu đến hàm generator đã tạo ra chúng.

- `Generator.prototype[Symbol.toStringTag]`
  - : Giá trị khởi tạo của thuộc tính [`[Symbol.toStringTag]`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Symbol/toStringTag) là chuỗi `"Generator"`. Thuộc tính này được dùng trong {{jsxref("Object.prototype.toString()")}}.

## Phương thức instance

_Cũng kế thừa các phương thức instance từ lớp cha {{jsxref("Iterator")}}_.

- {{jsxref("Generator.prototype.next()")}}
  - : Trả về giá trị được tạo ra bởi biểu thức {{jsxref("Operators/yield", "yield")}}.
- {{jsxref("Generator.prototype.return()")}}
  - : Hoạt động như thể câu lệnh `return` được chèn vào thân generator tại vị trí đang tạm dừng hiện tại, kết thúc generator và cho phép generator thực hiện các tác vụ dọn dẹp khi kết hợp với khối [`try...finally`](/en-US/docs/Web/JavaScript/Reference/Statements/try...catch#the_finally_block).
- {{jsxref("Generator.prototype.throw()")}}
  - : Hoạt động như thể câu lệnh `throw` được chèn vào thân generator tại vị trí đang tạm dừng hiện tại, thông báo cho generator về điều kiện lỗi và cho phép nó xử lý lỗi, hoặc thực hiện dọn dẹp và tự đóng lại.

## Ví dụ

### Iterator vô hạn

Với hàm generator, các giá trị không được đánh giá cho đến khi chúng cần. Do đó, generator cho phép chúng ta định nghĩa cấu trúc dữ liệu có tiềm năng vô hạn.

```js
function* infinite() {
  let index = 0;

  while (true) {
    yield index++;
  }
}

const generator = infinite(); // "Generator { }"

console.log(generator.next().value); // 0
console.log(generator.next().value); // 1
console.log(generator.next().value); // 2
// …
```

## Đặc tả kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{jsxref("Statements/function*", "function*")}}
- [`function*` expression](/en-US/docs/Web/JavaScript/Reference/Operators/function*)
- {{jsxref("GeneratorFunction")}}
- [Iteration protocols](/en-US/docs/Web/JavaScript/Reference/Iteration_protocols)
