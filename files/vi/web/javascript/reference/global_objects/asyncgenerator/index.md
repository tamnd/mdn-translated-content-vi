---
title: AsyncGenerator
slug: Web/JavaScript/Reference/Global_Objects/AsyncGenerator
page-type: javascript-class
browser-compat: javascript.builtins.AsyncGenerator
sidebar: jsref
---

Đối tượng **`AsyncGenerator`** được trả về bởi {{jsxref("Statements/async_function*", "hàm generator bất đồng bộ", "", 1)}} và nó tuân theo cả [giao thức async iterable và giao thức async iterator](/en-US/docs/Web/JavaScript/Reference/Iteration_protocols#the_async_iterator_and_async_iterable_protocols).

Các phương thức của async generator luôn tạo ra các đối tượng {{jsxref("Promise")}}.

`AsyncGenerator` là lớp con của lớp ẩn {{jsxref("AsyncIterator")}}.

## Constructor

Không có thực thể JavaScript nào tương ứng với constructor `AsyncGenerator`. Các instance của `AsyncGenerator` phải được trả về từ [hàm generator bất đồng bộ](/en-US/docs/Web/JavaScript/Reference/Statements/async_function*):

```js
async function* createAsyncGenerator() {
  yield Promise.resolve(1);
  yield await Promise.resolve(2);
  yield 3;
}
const asyncGen = createAsyncGenerator();
asyncGen.next().then((res) => console.log(res.value)); // 1
asyncGen.next().then((res) => console.log(res.value)); // 2
asyncGen.next().then((res) => console.log(res.value)); // 3
```

Chỉ có một đối tượng ẩn là đối tượng prototype được chia sẻ bởi tất cả các đối tượng được tạo bởi hàm generator bất đồng bộ. Đối tượng này thường được ký hiệu là `AsyncGenerator.prototype` để trông giống lớp, nhưng nên được gọi chính xác hơn là {{jsxref("AsyncGeneratorFunction.prototype.prototype")}}, vì `AsyncGeneratorFunction` là một thực thể JavaScript thực sự. Để hiểu chuỗi prototype của các instance `AsyncGenerator`, xem {{jsxref("AsyncGeneratorFunction.prototype.prototype")}}.

## Thuộc tính instance

Các thuộc tính này được định nghĩa trên `AsyncGenerator.prototype` và được chia sẻ bởi tất cả các instance `AsyncGenerator`.

- {{jsxref("Object/constructor", "AsyncGenerator.prototype.constructor")}}
  - : Hàm constructor đã tạo đối tượng instance. Đối với các instance `AsyncGenerator`, giá trị khởi tạo là [`AsyncGeneratorFunction.prototype`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/AsyncGeneratorFunction).

    > [!NOTE]
    > Các đối tượng `AsyncGenerator` không lưu trữ tham chiếu đến hàm generator bất đồng bộ đã tạo ra chúng.

- `AsyncGenerator.prototype[Symbol.toStringTag]`
  - : Giá trị khởi tạo của thuộc tính [`[Symbol.toStringTag]`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Symbol/toStringTag) là chuỗi `"AsyncGenerator"`. Thuộc tính này được dùng trong {{jsxref("Object.prototype.toString()")}}.

## Phương thức instance

_Cũng kế thừa các phương thức instance từ lớp cha {{jsxref("AsyncIterator")}}_.

- {{jsxref("AsyncGenerator.prototype.next()")}}
  - : Trả về {{jsxref("Promise")}} sẽ được giải quyết với giá trị đã cho được tạo ra bởi biểu thức {{jsxref("Operators/yield", "yield")}}.
- {{jsxref("AsyncGenerator.prototype.return()")}}
  - : Hoạt động như thể câu lệnh `return` được chèn vào thân generator tại vị trí đang tạm dừng hiện tại, kết thúc generator và cho phép generator thực hiện các tác vụ dọn dẹp khi kết hợp với khối [`try...finally`](/en-US/docs/Web/JavaScript/Reference/Statements/try...catch#the_finally_block).
- {{jsxref("AsyncGenerator.prototype.throw()")}}
  - : Hoạt động như thể câu lệnh `throw` được chèn vào thân generator tại vị trí đang tạm dừng hiện tại, thông báo cho generator về điều kiện lỗi và cho phép nó xử lý lỗi, hoặc thực hiện dọn dẹp và tự đóng lại.

## Ví dụ

### Lặp async generator

Ví dụ sau đây lặp trên async generator, ghi các giá trị 1–6 ra console tại các khoảng thời gian giảm dần. Lưu ý rằng mỗi lần một Promise được tạo ra, nhưng nó được giải quyết tự động trong vòng lặp `for await...of`.

```js
// An async task. Pretend it's doing something more useful
// in practice.
function delayedValue(time, value) {
  return new Promise((resolve /*, reject */) => {
    setTimeout(() => resolve(value), time);
  });
}

async function* generate() {
  yield delayedValue(2000, 1);
  yield delayedValue(1000, 2);
  yield delayedValue(500, 3);
  yield delayedValue(250, 4);
  yield delayedValue(125, 5);
  yield delayedValue(50, 6);
  console.log("All done!");
}

async function main() {
  for await (const value of generate()) {
    console.log("value", value);
  }
}

main().catch((e) => console.error(e));
```

## Đặc tả kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{jsxref("Statements/function*", "function*", "", 1)}}
- {{jsxref("Statements/async_function*", "async function*", "", 1)}}
- [`function*` expression](/en-US/docs/Web/JavaScript/Reference/Operators/function*)
- {{jsxref("GeneratorFunction", "Generator Function", "", 1)}}
- {{jsxref("AsyncGeneratorFunction", "Async Generator Function", "", 1)}}
- Hướng dẫn [Iterators and generators](/en-US/docs/Web/JavaScript/Guide/Iterators_and_generators)
