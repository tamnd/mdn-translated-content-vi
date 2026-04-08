---
title: Object.getOwnPropertyNames()
short-title: getOwnPropertyNames()
slug: Web/JavaScript/Reference/Global_Objects/Object/getOwnPropertyNames
page-type: javascript-static-method
browser-compat: javascript.builtins.Object.getOwnPropertyNames
sidebar: jsref
---

Phương thức tĩnh **`Object.getOwnPropertyNames()`** trả về một mảng gồm tất cả các thuộc tính (bao gồm cả các thuộc tính không đếm được ngoại trừ các thuộc tính sử dụng Symbol) được tìm thấy trực tiếp trong một đối tượng đã cho.

{{InteractiveExample("JavaScript Demo: Object.getOwnPropertyNames()")}}

```js interactive-example
const object = {
  a: 1,
  b: 2,
  c: 3,
};

console.log(Object.getOwnPropertyNames(object));
// Expected output: Array ["a", "b", "c"]
```

## Cú pháp

```js-nolint
Object.getOwnPropertyNames(obj)
```

### Tham số

- `obj`
  - : Đối tượng mà các thuộc tính có thể đếm và không đếm được sẽ được trả về.

### Giá trị trả về

Một mảng các chuỗi tương ứng với các thuộc tính được tìm thấy trực tiếp trong đối tượng đã cho.

## Mô tả

`Object.getOwnPropertyNames()` trả về một mảng mà các phần tử là các chuỗi tương ứng với các thuộc tính có thể đếm và không đếm được tìm thấy trực tiếp trong đối tượng `obj` đã cho. Thứ tự của các thuộc tính có thể đếm trong mảng nhất quán với thứ tự được hiển thị bởi vòng lặp {{jsxref("Statements/for...in", "for...in")}} (hoặc bởi {{jsxref("Object.keys()")}}) trên các thuộc tính của đối tượng. Các khóa số nguyên không âm của đối tượng (cả có thể đếm và không đếm được) được thêm theo thứ tự tăng dần vào mảng trước, theo sau là các khóa chuỗi theo thứ tự chèn.

Trong ES5, nếu đối số của phương thức này không phải là đối tượng (một giá trị nguyên thủy), nó sẽ gây ra {{jsxref("TypeError")}}. Trong ES2015, đối số không phải đối tượng sẽ được ép kiểu thành đối tượng.

```js
Object.getOwnPropertyNames("foo");
// TypeError: "foo" is not an object (ES5 code)

Object.getOwnPropertyNames("foo");
// ["0", "1", "2", "length"]  (ES2015 code)
```

## Ví dụ

### Sử dụng Object.getOwnPropertyNames()

```js
const arr = ["a", "b", "c"];
console.log(Object.getOwnPropertyNames(arr).sort());
// ["0", "1", "2", "length"]

// Đối tượng giống mảng
const obj = { 0: "a", 1: "b", 2: "c" };
console.log(Object.getOwnPropertyNames(obj).sort());
// ["0", "1", "2"]

Object.getOwnPropertyNames(obj).forEach((val, idx, array) => {
  console.log(`${val} -> ${obj[val]}`);
});
// 0 -> a
// 1 -> b
// 2 -> c

// thuộc tính không đếm được
const myObj = Object.create(
  {},
  {
    getFoo: {
      value() {
        return this.foo;
      },
      enumerable: false,
    },
  },
);
myObj.foo = 1;

console.log(Object.getOwnPropertyNames(myObj).sort()); // ["foo", "getFoo"]
```

Nếu bạn chỉ muốn các thuộc tính có thể đếm, hãy xem {{jsxref("Object.keys()")}} hoặc sử dụng vòng lặp {{jsxref("Statements/for...in", "for...in")}} (lưu ý rằng điều này cũng sẽ trả về các thuộc tính có thể đếm được tìm thấy dọc theo chuỗi prototype cho đối tượng trừ khi được lọc bằng {{jsxref("Object.hasOwn()")}}).

Các mục trên chuỗi prototype không được liệt kê:

```js
function ParentClass() {}
ParentClass.prototype.inheritedMethod = function () {};

function ChildClass() {
  this.prop = 5;
  this.method = function () {};
}
ChildClass.prototype = new ParentClass();
ChildClass.prototype.prototypeMethod = function () {};

console.log(Object.getOwnPropertyNames(new ChildClass()));
// ["prop", "method"]
```

### Chỉ lấy các thuộc tính không đếm được

Đoạn code này sử dụng hàm {{jsxref("Array.prototype.filter()")}} để xóa các khóa có thể đếm (lấy bằng {{jsxref("Object.keys()")}}) khỏi danh sách tất cả các khóa (lấy bằng `Object.getOwnPropertyNames()`) để chỉ xuất ra các khóa không đếm được.

```js
const target = myObject;
const enumAndNonEnum = Object.getOwnPropertyNames(target);
const enumOnly = new Set(Object.keys(target));
const nonEnumOnly = enumAndNonEnum.filter((key) => !enumOnly.has(key));

console.log(nonEnumOnly);
```

## Đặc tả

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Polyfill of `Object.getOwnPropertyNames` in `core-js`](https://github.com/zloirock/core-js#ecmascript-object)
- [Enumerability and ownership of properties](/en-US/docs/Web/JavaScript/Guide/Enumerability_and_ownership_of_properties)
- {{jsxref("Object.hasOwn()")}}
- {{jsxref("Object.prototype.propertyIsEnumerable()")}}
- {{jsxref("Object.create()")}}
- {{jsxref("Object.keys()")}}
- {{jsxref("Array.prototype.forEach()")}}
