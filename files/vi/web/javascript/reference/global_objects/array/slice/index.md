---
title: Array.prototype.slice()
short-title: slice()
slug: Web/JavaScript/Reference/Global_Objects/Array/slice
page-type: javascript-instance-method
browser-compat: javascript.builtins.Array.slice
sidebar: jsref
---

Phương thức **`slice()`** của các đối tượng {{jsxref("Array")}} trả về một [bản sao nông](/en-US/docs/Glossary/Shallow_copy) của một phần mảng vào một mảng mới được chọn từ `start` đến `end` (`end` không được bao gồm), trong đó `start` và `end` là các chỉ mục của các phần tử trong mảng đó. Mảng gốc sẽ không bị thay đổi.

{{InteractiveExample("JavaScript Demo: Array.prototype.slice()", "taller")}}

```js interactive-example
const animals = ["ant", "bison", "camel", "duck", "elephant"];

console.log(animals.slice(2));
// Expected output: Array ["camel", "duck", "elephant"]

console.log(animals.slice(2, 4));
// Expected output: Array ["camel", "duck"]

console.log(animals.slice(1, 5));
// Expected output: Array ["bison", "camel", "duck", "elephant"]

console.log(animals.slice(-2));
// Expected output: Array ["duck", "elephant"]

console.log(animals.slice(2, -1));
// Expected output: Array ["camel", "duck"]

console.log(animals.slice());
// Expected output: Array ["ant", "bison", "camel", "duck", "elephant"]
```

## Cú pháp

```js-nolint
slice()
slice(start)
slice(start, end)
```

### Tham số

- `start` {{optional_inline}}
  - : Chỉ mục từ 0 để bắt đầu trích xuất, [được chuyển đổi thành số nguyên](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Number#integer_conversion).
    - Chỉ mục âm đếm ngược từ cuối mảng — nếu `-array.length <= start < 0`, sẽ dùng `start + array.length`.
    - Nếu `start < -array.length` hoặc `start` bị bỏ qua, sẽ dùng `0`.
    - Nếu `start >= array.length`, trả về mảng rỗng.
- `end` {{optional_inline}}
  - : Chỉ mục từ 0 để kết thúc trích xuất, [được chuyển đổi thành số nguyên](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Number#integer_conversion). `slice()` trích xuất đến nhưng không bao gồm `end`.
    - Chỉ mục âm đếm ngược từ cuối mảng — nếu `-array.length <= end < 0`, sẽ dùng `end + array.length`.
    - Nếu `end < -array.length`, sẽ dùng `0`.
    - Nếu `end >= array.length` hoặc `end` bị bỏ qua hoặc là `undefined`, sẽ dùng `array.length`, khiến tất cả các phần tử đến cuối được trích xuất.
    - Nếu `end` chỉ đến vị trí trước hoặc bằng vị trí mà `start` chỉ đến, trả về mảng rỗng.

### Giá trị trả về

Một mảng mới chứa các phần tử được trích xuất.

## Mô tả

Phương thức `slice()` là một [phương thức sao chép](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Array#copying_methods_and_mutating_methods). Nó không thay đổi `this` mà thay vào đó trả về một [bản sao nông](/en-US/docs/Glossary/Shallow_copy) chứa một số phần tử giống với các phần tử của mảng gốc.

Phương thức `slice()` bảo tồn các vị trí trống. Nếu phần được cắt là [mảng thưa](/en-US/docs/Web/JavaScript/Guide/Indexed_collections#sparse_arrays), mảng trả về cũng sẽ thưa.

Phương thức `slice()` là [phương thức tổng quát](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Array#generic_array_methods). Nó chỉ yêu cầu giá trị `this` có thuộc tính `length` và các thuộc tính có khóa là số nguyên.

## Ví dụ

### Trả về một phần của mảng hiện có

```js
const fruits = ["Banana", "Orange", "Lemon", "Apple", "Mango"];
const citrus = fruits.slice(1, 3);

// fruits contains ['Banana', 'Orange', 'Lemon', 'Apple', 'Mango']
// citrus contains ['Orange','Lemon']
```

Trong ví dụ này, `slice(1, 3)` trích xuất các phần tử từ chỉ mục `1` đến, nhưng không bao gồm, chỉ mục `3`, tạo ra mảng mới `['Orange', 'Lemon']`.

### Bỏ qua tham số end

```js
const fruits = ["Apple", "Banana", "Orange", "Mango", "Pineapple"];

const tropical = fruits.slice(2);
console.log(tropical); // ['Orange', 'Mango', 'Pineapple']
```

Trong ví dụ này, `slice(2)` trích xuất các phần tử từ chỉ mục `2` đến cuối mảng.

### Sử dụng chỉ mục âm

```js
const fruits = ["Apple", "Banana", "Orange", "Mango", "Pineapple"];

const lastTwo = fruits.slice(-2);
console.log(lastTwo); // ['Mango', 'Pineapple']
```

Trong ví dụ này, `slice(-2)` trích xuất hai phần tử cuối của mảng. Khi sử dụng chỉ mục âm với phương thức `slice`, các chỉ mục âm được đếm từ cuối mảng, bắt đầu từ `-1` cho phần tử cuối cùng, `-2` cho phần tử thứ hai tính từ cuối, và cứ thế tiếp tục. Chỉ mục âm `-2` được bao gồm vì nó là điểm bắt đầu của quá trình trích xuất.

```plain
|     |     |     |     |     |
|  S  |  L  |  I  |  C  |  E  |
|     |     |     |     |     |
  -5    -4    -3    -2    -1

<--- read from reverse
```

### Sử dụng chỉ mục start dương và chỉ mục end âm

```js
const fruits = ["Apple", "Banana", "Orange", "Mango", "Pineapple"];

// Using positive start index and negative end index
const sliceExample = fruits.slice(1, -1);
console.log(sliceExample); // ['Banana', 'Orange', 'Mango']
```

Trong ví dụ này, `slice(1, -1)` bắt đầu trích xuất từ chỉ mục `1` và đi đến, nhưng không bao gồm, phần tử tại chỉ mục `-1` (là phần tử cuối cùng). Kết quả là mảng mới với `['Banana', 'Orange', 'Mango']`. Phương thức `slice` luôn loại trừ phần tử tại chỉ mục cuối được chỉ định, bất kể là dương hay âm.

```plain
read from start --->

   0     1     2     3     4
|     |     |     |     |     |
|  S  |  L  |  I  |  C  |  E  |
|     |     |     |     |     |
  -5    -4    -3    -2    -1

<--- read from reverse
```

### Sử dụng slice với mảng các đối tượng

Trong ví dụ sau, `slice` tạo một mảng mới, `newCar`, từ `myCar`. Cả hai đều bao gồm tham chiếu đến đối tượng `myHonda`. Khi màu của `myHonda` được đổi thành tím, cả hai mảng đều phản ánh sự thay đổi.

```js
// Using slice, create newCar from myCar.
const myHonda = {
  color: "red",
  wheels: 4,
  engine: { cylinders: 4, size: 2.2 },
};
const myCar = [myHonda, 2, "cherry condition", "purchased 1997"];
const newCar = myCar.slice(0, 2);

console.log("myCar =", myCar);
console.log("newCar =", newCar);
console.log("myCar[0].color =", myCar[0].color);
console.log("newCar[0].color =", newCar[0].color);

// Change the color of myHonda.
myHonda.color = "purple";
console.log("The new color of my Honda is", myHonda.color);

console.log("myCar[0].color =", myCar[0].color);
console.log("newCar[0].color =", newCar[0].color);
```

Script này sẽ xuất ra:

```plain
myCar = [
  { color: 'red', wheels: 4, engine: { cylinders: 4, size: 2.2 } },
  2,
  'cherry condition',
  'purchased 1997'
]
newCar = [ { color: 'red', wheels: 4, engine: { cylinders: 4, size: 2.2 } }, 2 ]
myCar[0].color = red
newCar[0].color = red
The new color of my Honda is purple
myCar[0].color = purple
newCar[0].color = purple
```

### Gọi slice() trên đối tượng không phải mảng

Phương thức `slice()` đọc thuộc tính `length` của `this`. Sau đó nó đọc các thuộc tính có khóa nguyên từ `start` đến `end` và định nghĩa chúng trên một mảng mới được tạo.

```js
const arrayLike = {
  length: 3,
  0: 2,
  1: 3,
  2: 4,
  3: 33, // ignored by slice() since length is 3
};
console.log(Array.prototype.slice.call(arrayLike, 1, 3));
// [ 3, 4 ]
```

### Sử dụng slice() để chuyển đổi đối tượng giống mảng thành mảng

Phương thức `slice()` thường được dùng cùng với {{jsxref("Function/bind", "bind()")}} và {{jsxref("Function/call", "call()")}} để tạo phương thức tiện ích chuyển đổi đối tượng giống mảng thành mảng.

```js
// slice() is called with `this` passed as the first argument
const slice = Function.prototype.call.bind(Array.prototype.slice);

function list() {
  return slice(arguments);
}

const listResult = list(1, 2, 3); // [1, 2, 3]
```

### Sử dụng slice() trên mảng thưa

Mảng được trả về từ `slice()` có thể thưa nếu mảng nguồn thưa.

```js
console.log([1, 2, , 4, 5].slice(1, 4)); // [2, empty, 4]
```

## Thông số kỹ thuật

{{Specifications}}

## Khả năng tương thích với trình duyệt

{{Compat}}

## Xem thêm

- [Polyfill của `Array.prototype.slice` trong `core-js`](https://github.com/zloirock/core-js#ecmascript-array)
- [es-shims polyfill của `Array.prototype.slice`](https://www.npmjs.com/package/array.prototype.slice)
- Hướng dẫn [Indexed collections](/en-US/docs/Web/JavaScript/Guide/Indexed_collections)
- {{jsxref("Array")}}
- {{jsxref("Array.prototype.pop()")}}
- {{jsxref("Array.prototype.shift()")}}
- {{jsxref("Array.prototype.concat()")}}
- {{jsxref("Array.prototype.splice()")}}
- {{jsxref("TypedArray.prototype.slice()")}}
- {{jsxref("String.prototype.slice()")}}
