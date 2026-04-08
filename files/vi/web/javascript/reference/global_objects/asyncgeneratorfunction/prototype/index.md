---
title: AsyncGeneratorFunction.prototype.prototype
short-title: prototype
slug: Web/JavaScript/Reference/Global_Objects/AsyncGeneratorFunction/prototype
page-type: javascript-instance-data-property
spec-urls:
  - https://tc39.es/ecma262/multipage/control-abstraction-objects.html#sec-asyncgeneratorfunction-prototype-prototype
  - https://tc39.es/ecma262/multipage/control-abstraction-objects.html#sec-asyncgeneratorfunction-instances-prototype
sidebar: jsref
---

Thuộc tính **`prototype`** của `AsyncGeneratorFunction.prototype` được chia sẻ bởi tất cả các hàm async generator. Giá trị của nó là [`AsyncGenerator.prototype`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/AsyncGenerator). Mỗi hàm async generator được tạo bằng cú pháp `async function*` hoặc hàm tạo `AsyncGeneratorFunction()` cũng có thuộc tính `prototype` riêng, có prototype là `AsyncGeneratorFunction.prototype.prototype`. Khi hàm async generator được gọi, thuộc tính `prototype` của nó trở thành prototype của đối tượng async generator được trả về.

## Giá trị

Cùng đối tượng với [`AsyncGenerator.prototype`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/AsyncGenerator). `AsyncGeneratorFunction.prototype.prototype` là tên chính xác hơn về mặt kỹ thuật, nhưng `AsyncGenerator.prototype` phù hợp với trực giác rằng đó là prototype của các đối tượng async generator.

{{js_property_attributes(0, 0, 1)}}

Thuộc tính `prototype` của mỗi thực thể `AsyncGeneratorFunction` là một đối tượng rỗng không có thuộc tính, có prototype là `AsyncGeneratorFunction.prototype.prototype`. Nó có các thuộc tính sau:

{{js_property_attributes(1, 0, 0)}}

## Mô tả

Một thực thể hàm async generator có hai thuộc tính `prototype`. Cái đầu tiên là thuộc tính `prototype` riêng của nó. Cái thứ hai là thuộc tính `prototype` trên prototype của nó, là `AsyncGeneratorFunction.prototype`. (Hãy nhớ rằng mọi hàm async generator là một thực thể của `AsyncGeneratorFunction`, vì vậy nó có `AsyncGeneratorFunction.prototype` là prototype của nó.)

```js
async function* genFunc() {}
const AsyncGeneratorFunctionPrototype = Object.getPrototypeOf(genFunc);
console.log(Object.hasOwn(genFunc, "prototype")); // true
console.log(Object.hasOwn(AsyncGeneratorFunctionPrototype, "prototype")); // true
```

Khi một hàm async generator được gọi, thuộc tính `prototype` của hàm async generator trở thành prototype của đối tượng async generator được trả về.

```js
const gen = genFunc();
const proto = Object.getPrototypeOf;
console.log(proto(gen) === genFunc.prototype); // true
console.log(proto(proto(gen)) === AsyncGeneratorFunctionPrototype.prototype); // true
```

Sơ đồ sau minh họa chuỗi prototype của hàm async generator và các thực thể của nó. Mỗi mũi tên rỗng chỉ ra quan hệ kế thừa (tức là một liên kết prototype), và mỗi mũi tên đặc chỉ ra quan hệ thuộc tính. Lưu ý rằng không có cách nào để truy cập `genFunc` từ `gen` — chúng chỉ có quan hệ `instanceof`.

![Sơ đồ kế thừa của async generators và async generator functions](https://mdn.github.io/shared-assets/images/diagrams/javascript/asyncgeneratorfunction/prototype-chain.svg)

## Đặc điểm kỹ thuật

{{Specifications}}

## Xem thêm

- [`async function*`](/en-US/docs/Web/JavaScript/Reference/Statements/async_function*)
- [Biểu thức `async function*`](/en-US/docs/Web/JavaScript/Reference/Operators/async_function*)
- {{jsxref("AsyncGeneratorFunction")}}
- {{jsxref("GeneratorFunction")}}
- [Kế thừa và chuỗi prototype](/en-US/docs/Web/JavaScript/Guide/Inheritance_and_the_prototype_chain)
- [Iterators và generators](/en-US/docs/Web/JavaScript/Guide/Iterators_and_generators)
