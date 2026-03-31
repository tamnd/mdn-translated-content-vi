---
title: Array.prototype.some()
short-title: some()
slug: Web/JavaScript/Reference/Global_Objects/Array/some
page-type: javascript-instance-method
browser-compat: javascript.builtins.Array.some
sidebar: jsref
---

Phương thức **`some()`** của các đối tượng {{jsxref("Array")}} trả về `true` nếu tìm thấy ít nhất một phần tử trong mảng thỏa mãn hàm kiểm tra được cung cấp. Ngược lại, nó trả về `false`.

{{InteractiveExample("JavaScript Demo: Array.prototype.some()")}}

```js interactive-example
const array = [1, 2, 3, 4, 5];

// Checks whether an element is even
const even = (element) => element % 2 === 0;

console.log(array.some(even));
// Expected output: true
```

## Cú pháp

```js-nolint
some(callbackFn)
some(callbackFn, thisArg)
```

### Tham số

- `callbackFn`
  - : Hàm được thực thi cho mỗi phần tử trong mảng. Nó nên trả về một giá trị [truthy](/en-US/docs/Glossary/Truthy) để chỉ ra phần tử đã vượt qua bài kiểm tra, và một giá trị [falsy](/en-US/docs/Glossary/Falsy) trong trường hợp ngược lại. Hàm được gọi với các đối số sau:
    - `element`
      - : Phần tử hiện đang được xử lý trong mảng.
    - `index`
      - : Chỉ mục của phần tử hiện đang được xử lý trong mảng.
    - `array`
      - : Mảng mà `some()` được gọi trên đó.
- `thisArg` {{optional_inline}}
  - : Giá trị dùng làm `this` khi thực thi `callbackFn`. Xem [phương thức lặp](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Array#iterative_methods).

### Giá trị trả về

`false` trừ khi `callbackFn` trả về một giá trị {{Glossary("truthy")}} cho một phần tử mảng, trong trường hợp đó `true` được trả về ngay lập tức.

## Mô tả

Phương thức `some()` là một [phương thức lặp](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Array#iterative_methods). Nó gọi hàm `callbackFn` được cung cấp một lần cho mỗi phần tử trong mảng, cho đến khi `callbackFn` trả về một giá trị [truthy](/en-US/docs/Glossary/Truthy). Nếu tìm thấy phần tử như vậy, `some()` lập tức trả về `true` và dừng lặp qua mảng. Ngược lại, nếu `callbackFn` trả về giá trị [falsy](/en-US/docs/Glossary/Falsy) cho tất cả các phần tử, `some()` trả về `false`. Đọc phần [phương thức lặp](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Array#iterative_methods) để biết thêm thông tin về cách các phương thức này hoạt động nói chung.

`some()` hoạt động như lượng từ "tồn tại" trong toán học. Cụ thể, đối với mảng rỗng, nó trả về `false` cho bất kỳ điều kiện nào.

`callbackFn` chỉ được gọi cho các chỉ mục mảng đã được gán giá trị. Nó không được gọi cho các vị trí trống trong [mảng thưa](/en-US/docs/Web/JavaScript/Guide/Indexed_collections#sparse_arrays).

`some()` không thay đổi mảng mà nó được gọi trên, nhưng hàm được cung cấp là `callbackFn` có thể làm điều đó. Tuy nhiên, lưu ý rằng độ dài mảng được lưu lại _trước_ lần gọi đầu tiên của `callbackFn`. Do đó:

- `callbackFn` sẽ không ghé thăm bất kỳ phần tử nào được thêm vào ngoài độ dài ban đầu của mảng khi bắt đầu gọi `some()`.
- Các thay đổi đối với các chỉ mục đã được ghé thăm không khiến `callbackFn` được gọi lại trên chúng.
- Nếu một phần tử hiện có, chưa được ghé thăm của mảng bị thay đổi bởi `callbackFn`, giá trị của nó được truyền vào `callbackFn` sẽ là giá trị tại thời điểm phần tử đó được ghé thăm. Các phần tử bị [xóa](/en-US/docs/Web/JavaScript/Reference/Operators/delete) sẽ không được ghé thăm.

> [!WARNING]
> Các thay đổi đồng thời kiểu như mô tả ở trên thường dẫn đến code khó hiểu và nên tránh (ngoại trừ các trường hợp đặc biệt).

Phương thức `some()` là [phương thức tổng quát](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Array#generic_array_methods). Nó chỉ yêu cầu giá trị `this` có thuộc tính `length` và các thuộc tính có khóa là số nguyên.

## Ví dụ

### Kiểm tra giá trị của các phần tử mảng

Ví dụ sau kiểm tra xem có phần tử nào trong mảng lớn hơn 10 không.

```js
function isBiggerThan10(element, index, array) {
  return element > 10;
}

[2, 5, 8, 1, 4].some(isBiggerThan10); // false
[12, 5, 8, 1, 4].some(isBiggerThan10); // true
```

### Kiểm tra các phần tử mảng bằng hàm mũi tên

[Hàm mũi tên](/en-US/docs/Web/JavaScript/Reference/Functions/Arrow_functions) cung cấp cú pháp ngắn hơn cho cùng bài kiểm tra.

```js
[2, 5, 8, 1, 4].some((x) => x > 10); // false
[12, 5, 8, 1, 4].some((x) => x > 10); // true
```

### Kiểm tra xem một giá trị có tồn tại trong mảng không

Để mô phỏng chức năng của phương thức `includes()`, hàm tùy chỉnh này trả về `true` nếu phần tử tồn tại trong mảng:

```js
const fruits = ["apple", "banana", "mango", "guava"];

function checkAvailability(arr, val) {
  return arr.some((arrVal) => val === arrVal);
}

checkAvailability(fruits, "grapefruit"); // false
checkAvailability(fruits, "banana"); // true
```

### Chuyển đổi bất kỳ giá trị nào sang Boolean

```js
const TRUTHY_VALUES = [true, "true", 1];

function getBoolean(value) {
  if (typeof value === "string") {
    value = value.toLowerCase().trim();
  }

  return TRUTHY_VALUES.some((t) => t === value);
}

getBoolean(false); // false
getBoolean("false"); // false
getBoolean(1); // true
getBoolean("true"); // true
```

### Sử dụng đối số thứ ba của callbackFn

Đối số `array` hữu ích khi bạn muốn truy cập phần tử khác trong mảng, đặc biệt khi bạn không có biến hiện tại tham chiếu đến mảng. Ví dụ sau trước tiên dùng `filter()` để trích xuất các giá trị dương và sau đó dùng `some()` để kiểm tra xem mảng có tăng dần nghiêm ngặt không.

```js
const numbers = [3, -1, 1, 4, 1, 5];
const isIncreasing = !numbers
  .filter((num) => num > 0)
  .some((num, idx, arr) => {
    // Without the arr argument, there's no way to easily access the
    // intermediate array without saving it to a variable.
    if (idx === 0) return false;
    return num <= arr[idx - 1];
  });
console.log(isIncreasing); // false
```

### Sử dụng some() trên mảng thưa

`some()` sẽ không chạy hàm vị từ trên các vị trí trống.

```js
console.log([1, , 3].some((x) => x === undefined)); // false
console.log([1, , 1].some((x) => x !== 1)); // false
console.log([1, undefined, 1].some((x) => x !== 1)); // true
```

### Gọi some() trên đối tượng không phải mảng

Phương thức `some()` đọc thuộc tính `length` của `this` và sau đó truy cập từng thuộc tính có khóa là số nguyên không âm nhỏ hơn `length` cho đến khi tất cả được truy cập hoặc `callbackFn` trả về `true`.

```js
const arrayLike = {
  length: 3,
  0: "a",
  1: "b",
  2: "c",
  3: 3, // ignored by some() since length is 3
};
console.log(Array.prototype.some.call(arrayLike, (x) => typeof x === "number"));
// false
```

## Thông số kỹ thuật

{{Specifications}}

## Khả năng tương thích với trình duyệt

{{Compat}}

## Xem thêm

- [Polyfill của `Array.prototype.some` trong `core-js`](https://github.com/zloirock/core-js#ecmascript-array)
- [es-shims polyfill của `Array.prototype.some`](https://www.npmjs.com/package/array.prototype.some)
- Hướng dẫn [Indexed collections](/en-US/docs/Web/JavaScript/Guide/Indexed_collections)
- {{jsxref("Array")}}
- {{jsxref("Array.prototype.every()")}}
- {{jsxref("Array.prototype.forEach()")}}
- {{jsxref("Array.prototype.find()")}}
- {{jsxref("Array.prototype.includes()")}}
- {{jsxref("TypedArray.prototype.some()")}}
