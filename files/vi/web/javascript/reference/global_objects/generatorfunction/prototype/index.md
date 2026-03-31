---
title: GeneratorFunction.prototype.prototype
short-title: prototype
slug: Web/JavaScript/Reference/Global_Objects/GeneratorFunction/prototype
page-type: javascript-instance-data-property
spec-urls:
  - https://tc39.es/ecma262/multipage/control-abstraction-objects.html#sec-generatorfunction.prototype.prototype
  - https://tc39.es/ecma262/multipage/control-abstraction-objects.html#sec-generatorfunction-instances-prototype
sidebar: jsref
---

Thuộc tính **`prototype`** của `GeneratorFunction.prototype` được chia sẻ bởi tất cả các hàm generator. Giá trị của nó là [`Generator.prototype`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Generator). Mỗi hàm generator được tạo bằng cú pháp `function*` hoặc hàm tạo `GeneratorFunction()` cũng có thuộc tính `prototype` riêng, có prototype là `GeneratorFunction.prototype.prototype`. Khi hàm generator được gọi, thuộc tính `prototype` của nó trở thành prototype của đối tượng generator được trả về.

## Giá trị

Cùng đối tượng với [`Generator.prototype`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Generator). `GeneratorFunction.prototype.prototype` là tên chính xác hơn về mặt kỹ thuật, nhưng `Generator.prototype` phù hợp với trực giác rằng đó là prototype của các đối tượng generator.

{{js_property_attributes(1, 0, 0)}}

Thuộc tính `prototype` của mỗi thực thể `GeneratorFunction` là một đối tượng rỗng không có thuộc tính, có prototype là `GeneratorFunction.prototype.prototype`. Nó có các thuộc tính sau:

{{js_property_attributes(0, 0, 1)}}

## Mô tả

Một thực thể hàm generator có hai thuộc tính `prototype`. Cái đầu tiên là thuộc tính `prototype` riêng của nó. Cái thứ hai là thuộc tính `prototype` trên prototype của nó, là `GeneratorFunction.prototype`. (Hãy nhớ rằng mọi hàm generator là một thực thể của `GeneratorFunction`, vì vậy nó có `GeneratorFunction.prototype` là prototype của nó.)

```js
function* genFunc() {}
const GeneratorFunctionPrototype = Object.getPrototypeOf(genFunc);
console.log(Object.hasOwn(genFunc, "prototype")); // true
console.log(Object.hasOwn(GeneratorFunctionPrototype, "prototype")); // true
```

Khi một hàm generator được gọi, thuộc tính `prototype` của hàm generator trở thành prototype của đối tượng generator được trả về.

```js
const gen = genFunc();
const proto = Object.getPrototypeOf;
console.log(proto(gen) === genFunc.prototype); // true
console.log(proto(proto(gen)) === GeneratorFunctionPrototype.prototype); // true
```

Sơ đồ sau minh họa chuỗi prototype của hàm generator và các thực thể của nó. Mỗi mũi tên rỗng chỉ ra quan hệ kế thừa (tức là một liên kết prototype), và mỗi mũi tên đặc chỉ ra quan hệ thuộc tính. Lưu ý rằng không có cách nào để truy cập `genFunc` từ `gen` — chúng chỉ có quan hệ `instanceof`.

![Sơ đồ kế thừa của generators và generator functions](https://mdn.github.io/shared-assets/images/diagrams/javascript/generatorfunction/prototype-chain.svg)

## Đặc điểm kỹ thuật

{{Specifications}}

## Xem thêm

- [`function*`](/en-US/docs/Web/JavaScript/Reference/Statements/function*)
- [Biểu thức `function*`](/en-US/docs/Web/JavaScript/Reference/Operators/function*)
- {{jsxref("AsyncGeneratorFunction")}}
- {{jsxref("GeneratorFunction")}}
- [Kế thừa và chuỗi prototype](/en-US/docs/Web/JavaScript/Guide/Inheritance_and_the_prototype_chain)
- [Iterators và generators](/en-US/docs/Web/JavaScript/Guide/Iterators_and_generators)
