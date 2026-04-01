---
title: Array.prototype.forEach()
short-title: forEach()
slug: Web/JavaScript/Reference/Global_Objects/Array/forEach
page-type: javascript-instance-method
browser-compat: javascript.builtins.Array.forEach
sidebar: jsref
---

Phương thức **`forEach()`** của các instance {{jsxref("Array")}} thực thi một hàm được cung cấp một lần cho mỗi phần tử mảng.

{{InteractiveExample("JavaScript Demo: Array.prototype.forEach()")}}

```js interactive-example
const array = ["a", "b", "c"];

array.forEach((element) => console.log(element));

// Expected output: "a"
// Expected output: "b"
// Expected output: "c"
```

## Syntax

```js-nolint
forEach(callbackFn)
forEach(callbackFn, thisArg)
```

### Parameters

- `callbackFn`
  - : Hàm để thực thi cho mỗi phần tử trong mảng. Giá trị trả về của nó bị bỏ qua. Hàm được gọi với các đối số sau:
    - `element`
      - : Phần tử hiện tại đang được xử lý trong mảng.
    - `index`
      - : Chỉ số của phần tử hiện tại đang được xử lý trong mảng.
    - `array`
      - : Mảng mà `forEach()` được gọi trên đó.
- `thisArg` {{optional_inline}}
  - : Giá trị để dùng làm `this` khi thực thi `callbackFn`. Xem [iterative methods](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Array#iterative_methods).

### Return value

Không có ({{jsxref("undefined")}}).

## Description

Phương thức `forEach()` là một [iterative method](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Array#iterative_methods). Nó gọi hàm `callbackFn` được cung cấp một lần cho mỗi phần tử trong mảng theo thứ tự chỉ số tăng dần. Khác với {{jsxref("Array/map", "map()")}}, `forEach()` luôn trả về {{jsxref("undefined")}} và không thể kết hợp chuỗi. Trường hợp sử dụng điển hình là thực thi các hiệu ứng phụ ở cuối chuỗi. Đọc phần [iterative methods](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Array#iterative_methods) để biết thêm thông tin về cách các phương thức này hoạt động nói chung.

`callbackFn` chỉ được gọi cho các chỉ số mảng đã được gán giá trị. Nó không được gọi cho các slot rỗng trong [mảng thưa (sparse arrays)](/en-US/docs/Web/JavaScript/Guide/Indexed_collections#sparse_arrays).

Phương thức `forEach()` là [generic](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Array#generic_array_methods). Nó chỉ yêu cầu giá trị `this` có thuộc tính `length` và các thuộc tính có khóa là số nguyên.

Không có cách nào để dừng hoặc thoát khỏi vòng lặp `forEach()` ngoại trừ bằng cách ném ra một ngoại lệ. Nếu bạn cần hành vi như vậy, phương thức `forEach()` không phải là công cụ phù hợp.

Có thể kết thúc sớm bằng các câu lệnh lặp như [`for`](/en-US/docs/Web/JavaScript/Reference/Statements/for), [`for...of`](/en-US/docs/Web/JavaScript/Reference/Statements/for...of) và [`for...in`](/en-US/docs/Web/JavaScript/Reference/Statements/for...in). Các phương thức mảng như {{jsxref("Array/every", "every()")}}, {{jsxref("Array/some", "some()")}}, {{jsxref("Array/find", "find()")}} và {{jsxref("Array/findIndex", "findIndex()")}} cũng dừng lặp ngay lập tức khi không cần tiếp tục lặp nữa.

`forEach()` mong đợi một hàm đồng bộ — nó không chờ đợi các promise. Hãy chắc chắn rằng bạn nhận thức được các hệ quả khi dùng promise (hoặc hàm async) như là callback `forEach`.

```js
const ratings = [5, 4, 5];
let sum = 0;

const sumFunction = async (a, b) => a + b;

ratings.forEach(async (rating) => {
  sum = await sumFunction(sum, rating);
});

console.log(sum);
// Naively expected output: 14
// Actual output: 0
```

Để chạy một loạt thao tác bất đồng bộ tuần tự hoặc song song, xem [promise composition](/en-US/docs/Web/JavaScript/Guide/Using_promises#composition).

## Examples

### Chuyển đổi vòng lặp for sang forEach

```js
const items = ["item1", "item2", "item3"];
const copyItems = [];

// before
for (let i = 0; i < items.length; i++) {
  copyItems.push(items[i]);
}

// after
items.forEach((item) => {
  copyItems.push(item);
});
```

### In nội dung của mảng

> [!NOTE]
> Để hiển thị nội dung của mảng trong console,
> bạn có thể dùng {{domxref("console/table_static", "console.table()")}}, phương thức này in một
> phiên bản được định dạng của mảng.
>
> Ví dụ sau minh họa một cách tiếp cận thay thế, dùng
> `forEach()`.

Đoạn code sau ghi lại một dòng cho mỗi phần tử trong mảng:

```js
const logArrayElements = (element, index /*, array */) => {
  console.log(`a[${index}] = ${element}`);
};

// Notice that index 2 is skipped, since there is no item at
// that position in the array.
[2, 5, , 9].forEach(logArrayElements);
// Logs:
// a[0] = 2
// a[1] = 5
// a[3] = 9
```

### Dùng thisArg

Ví dụ sau (được tạo ra) cập nhật các thuộc tính của một object từ mỗi mục trong mảng:

```js
class Counter {
  constructor() {
    this.sum = 0;
    this.count = 0;
  }
  add(array) {
    // Only function expressions have their own this bindings.
    array.forEach(function countEntry(entry) {
      this.sum += entry;
      ++this.count;
    }, this);
  }
}

const obj = new Counter();
obj.add([2, 5, 9]);
console.log(obj.count); // 3
console.log(obj.sum); // 16
```

Vì tham số `thisArg` (`this`) được cung cấp cho `forEach()`, nó được truyền vào `callback` mỗi khi nó được gọi. Callback dùng nó làm giá trị `this` của nó.

> [!NOTE]
> Nếu truyền hàm callback dùng
> [biểu thức arrow function](/en-US/docs/Web/JavaScript/Reference/Functions/Arrow_functions),
> tham số `thisArg` có thể bị bỏ qua,
> vì tất cả các arrow function đều liên kết từ vựng giá trị {{jsxref("Operators/this", "this")}}.

### Hàm sao chép đối tượng

Đoạn code sau tạo ra một bản sao của object đã cho.

Có nhiều cách khác nhau để tạo bản sao của một object. Cách sau chỉ là một cách và được trình bày để giải thích cách `Array.prototype.forEach()` hoạt động bằng cách dùng các hàm tiện ích `Object.*`.

```js
const copy = (obj) => {
  const copy = Object.create(Object.getPrototypeOf(obj));
  const propNames = Object.getOwnPropertyNames(obj);
  propNames.forEach((name) => {
    const desc = Object.getOwnPropertyDescriptor(obj, name);
    Object.defineProperty(copy, name, desc);
  });
  return copy;
};

const obj1 = { a: 1, b: 2 };
const obj2 = copy(obj1); // obj2 looks like obj1 now
```

### Làm phẳng mảng

Ví dụ sau chỉ có mục đích học tập. Nếu bạn muốn làm phẳng một mảng bằng các phương thức tích hợp sẵn, bạn có thể dùng {{jsxref("Array.prototype.flat()")}}.

```js
const flatten = (arr) => {
  const result = [];
  arr.forEach((item) => {
    if (Array.isArray(item)) {
      result.push(...flatten(item));
    } else {
      result.push(item);
    }
  });
  return result;
};

// Usage
const nested = [1, 2, 3, [4, 5, [6, 7], 8, 9]];
console.log(flatten(nested)); // [1, 2, 3, 4, 5, 6, 7, 8, 9]
```

### Dùng đối số thứ ba của callbackFn

Đối số `array` hữu ích khi bạn muốn truy cập một phần tử khác trong mảng, đặc biệt khi bạn không có biến hiện có nào tham chiếu đến mảng. Ví dụ sau trước tiên dùng `filter()` để trích xuất các giá trị dương và sau đó dùng `forEach()` để ghi lại các láng giềng của nó.

```js
const numbers = [3, -1, 1, 4, 1, 5];
numbers
  .filter((num) => num > 0)
  .forEach((num, idx, arr) => {
    // Without the arr argument, there's no way to easily access the
    // intermediate array without saving it to a variable.
    console.log(arr[idx - 1], num, arr[idx + 1]);
  });
// undefined 3 1
// 3 1 4
// 1 4 1
// 4 1 5
// 1 5 undefined
```

### Dùng forEach() trên mảng thưa

```js-nolint
const arraySparse = [1, 3, /* empty */, 7];
let numCallbackRuns = 0;

arraySparse.forEach((element) => {
  console.log({ element });
  numCallbackRuns++;
});

console.log({ numCallbackRuns });

// { element: 1 }
// { element: 3 }
// { element: 7 }
// { numCallbackRuns: 3 }
```

Hàm callback không được gọi cho giá trị bị thiếu tại chỉ số 2.

### Gọi forEach() trên các đối tượng không phải mảng

Phương thức `forEach()` đọc thuộc tính `length` của `this` và sau đó truy cập từng thuộc tính có khóa là số nguyên không âm nhỏ hơn `length`.

```js
const arrayLike = {
  length: 3,
  0: 2,
  1: 3,
  2: 4,
  3: 5, // ignored by forEach() since length is 3
};
Array.prototype.forEach.call(arrayLike, (x) => console.log(x));
// 2
// 3
// 4
```

## Specifications

{{Specifications}}

## Browser compatibility

{{Compat}}

## See also

- [Polyfill of `Array.prototype.forEach` in `core-js`](https://github.com/zloirock/core-js#ecmascript-array)
- [es-shims polyfill of `Array.prototype.forEach`](https://www.npmjs.com/package/array.prototype.foreach)
- [Indexed collections](/en-US/docs/Web/JavaScript/Guide/Indexed_collections) guide
- {{jsxref("Array")}}
- {{jsxref("Array.prototype.find()")}}
- {{jsxref("Array.prototype.map()")}}
- {{jsxref("Array.prototype.filter()")}}
- {{jsxref("Array.prototype.every()")}}
- {{jsxref("Array.prototype.some()")}}
- {{jsxref("TypedArray.prototype.forEach()")}}
- {{jsxref("Map.prototype.forEach()")}}
- {{jsxref("Set.prototype.forEach()")}}
