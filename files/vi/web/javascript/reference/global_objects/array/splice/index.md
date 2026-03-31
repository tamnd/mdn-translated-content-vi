---
title: Array.prototype.splice()
short-title: splice()
slug: Web/JavaScript/Reference/Global_Objects/Array/splice
page-type: javascript-instance-method
browser-compat: javascript.builtins.Array.splice
sidebar: jsref
---

Phương thức **`splice()`** của các đối tượng {{jsxref("Array")}} thay đổi nội dung của một mảng bằng cách xóa hoặc thay thế các phần tử hiện có và/hoặc thêm các phần tử mới [tại chỗ](https://en.wikipedia.org/wiki/In-place_algorithm).

Để tạo một mảng mới với một đoạn bị xóa và/hoặc thay thế mà không thay đổi mảng gốc, hãy dùng {{jsxref("Array/toSpliced", "toSpliced()")}}. Để truy cập một phần của mảng mà không thay đổi nó, xem {{jsxref("Array/slice", "slice()")}}.

{{InteractiveExample("JavaScript Demo: Array.prototype.splice()")}}

```js interactive-example
const months = ["Jan", "March", "April", "June"];
months.splice(1, 0, "Feb");
// Inserts at index 1
console.log(months);
// Expected output: Array ["Jan", "Feb", "March", "April", "June"]

months.splice(4, 1, "May");
// Replaces 1 element at index 4
console.log(months);
// Expected output: Array ["Jan", "Feb", "March", "April", "May"]
```

## Cú pháp

```js-nolint
splice(start)
splice(start, deleteCount)
splice(start, deleteCount, item1)
splice(start, deleteCount, item1, item2)
splice(start, deleteCount, item1, item2, /* …, */ itemN)
```

### Tham số

- `start`
  - : Chỉ mục từ 0 để bắt đầu thay đổi mảng, [được chuyển đổi thành số nguyên](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Number#integer_conversion).
    - Chỉ mục âm đếm ngược từ cuối mảng — nếu `-array.length <= start < 0`, sẽ dùng `start + array.length`.
    - Nếu `start < -array.length`, sẽ dùng `0`.
    - Nếu `start >= array.length`, không phần tử nào bị xóa, nhưng phương thức sẽ hoạt động như một hàm thêm, thêm nhiều phần tử như được cung cấp.
    - Nếu `start` bị bỏ qua (và `splice()` được gọi không có đối số), không có gì bị xóa. Điều này khác với việc truyền `undefined`, được chuyển đổi thành `0`.

- `deleteCount` {{optional_inline}}
  - : Số nguyên chỉ ra số lượng phần tử trong mảng cần xóa từ `start`.

    Nếu `deleteCount` bị bỏ qua, hoặc nếu giá trị của nó lớn hơn hoặc bằng số lượng phần tử sau vị trí được chỉ định bởi `start`, thì tất cả các phần tử từ `start` đến cuối mảng sẽ bị xóa. Tuy nhiên, nếu bạn muốn truyền tham số `itemN`, bạn nên truyền `Infinity` làm `deleteCount` để xóa tất cả các phần tử sau `start`, vì `undefined` tường minh bị [chuyển đổi](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Number#integer_conversion) thành `0`.

    Nếu `deleteCount` là `0` hoặc âm, không có phần tử nào bị xóa. Trong trường hợp này, bạn nên chỉ định ít nhất một phần tử mới (xem bên dưới).

- `item1`, …, `itemN` {{optional_inline}}
  - : Các phần tử cần thêm vào mảng, bắt đầu từ `start`.

    Nếu bạn không chỉ định bất kỳ phần tử nào, `splice()` sẽ chỉ xóa các phần tử khỏi mảng.

### Giá trị trả về

Một mảng chứa các phần tử bị xóa.

Nếu chỉ có một phần tử bị xóa, một mảng gồm một phần tử được trả về.

Nếu không có phần tử nào bị xóa, một mảng rỗng được trả về.

## Mô tả

Phương thức `splice()` là một [phương thức thay đổi mảng](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Array#copying_methods_and_mutating_methods). Nó có thể thay đổi nội dung của `this`. Nếu số lượng phần tử được chèn khác với số lượng phần tử bị xóa, `length` của mảng cũng sẽ được thay đổi. Đồng thời, nó dùng [`[Symbol.species]`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Array/Symbol.species) để tạo một đối tượng mảng mới để trả về.

Nếu phần bị xóa là [mảng thưa](/en-US/docs/Web/JavaScript/Guide/Indexed_collections#sparse_arrays), mảng được trả về bởi `splice()` cũng thưa, với các chỉ mục tương ứng là các vị trí trống.

Phương thức `splice()` là [phương thức tổng quát](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Array#generic_array_methods). Nó chỉ yêu cầu giá trị `this` có thuộc tính `length` và các thuộc tính có khóa là số nguyên. Mặc dù chuỗi cũng là dạng giống mảng, phương thức này không phù hợp để áp dụng cho chúng vì chuỗi là bất biến.

## Ví dụ

### Xóa 0 phần tử trước chỉ mục 2 và chèn "drum"

```js
const myFish = ["angel", "clown", "mandarin", "sturgeon"];
const removed = myFish.splice(2, 0, "drum");

// myFish is ["angel", "clown", "drum", "mandarin", "sturgeon"]
// removed is [], no elements removed
```

### Xóa 0 phần tử trước chỉ mục 2 và chèn "drum" và "guitar"

```js
const myFish = ["angel", "clown", "mandarin", "sturgeon"];
const removed = myFish.splice(2, 0, "drum", "guitar");

// myFish is ["angel", "clown", "drum", "guitar", "mandarin", "sturgeon"]
// removed is [], no elements removed
```

### Xóa 0 phần tử tại chỉ mục 0 và chèn "angel"

`splice(0, 0, ...elements)` chèn các phần tử vào đầu mảng giống như {{jsxref("Array/unshift", "unshift()")}}.

```js
const myFish = ["clown", "mandarin", "sturgeon"];
const removed = myFish.splice(0, 0, "angel");

// myFish is ["angel", "clown", "mandarin", "sturgeon"]
// no items removed
```

### Xóa 0 phần tử tại chỉ mục cuối cùng và chèn "sturgeon"

`splice(array.length, 0, ...elements)` chèn các phần tử vào cuối mảng giống như {{jsxref("Array/push", "push()")}}.

```js
const myFish = ["angel", "clown", "mandarin"];
const removed = myFish.splice(myFish.length, 0, "sturgeon");

// myFish is ["angel", "clown", "mandarin", "sturgeon"]
// no items removed
```

### Xóa 1 phần tử tại chỉ mục 3

```js
const myFish = ["angel", "clown", "drum", "mandarin", "sturgeon"];
const removed = myFish.splice(3, 1);

// myFish is ["angel", "clown", "drum", "sturgeon"]
// removed is ["mandarin"]
```

### Xóa 1 phần tử tại chỉ mục 2 và chèn "trumpet"

```js
const myFish = ["angel", "clown", "drum", "sturgeon"];
const removed = myFish.splice(2, 1, "trumpet");

// myFish is ["angel", "clown", "trumpet", "sturgeon"]
// removed is ["drum"]
```

### Xóa 2 phần tử từ chỉ mục 0 và chèn "parrot", "anemone" và "blue"

```js
const myFish = ["angel", "clown", "trumpet", "sturgeon"];
const removed = myFish.splice(0, 2, "parrot", "anemone", "blue");

// myFish is ["parrot", "anemone", "blue", "trumpet", "sturgeon"]
// removed is ["angel", "clown"]
```

### Xóa 2 phần tử bắt đầu từ chỉ mục 2

```js
const myFish = ["parrot", "anemone", "blue", "trumpet", "sturgeon"];
const removed = myFish.splice(2, 2);

// myFish is ["parrot", "anemone", "sturgeon"]
// removed is ["blue", "trumpet"]
```

### Xóa 1 phần tử từ chỉ mục -2

```js
const myFish = ["angel", "clown", "mandarin", "sturgeon"];
const removed = myFish.splice(-2, 1);

// myFish is ["angel", "clown", "sturgeon"]
// removed is ["mandarin"]
```

### Xóa tất cả các phần tử bắt đầu từ chỉ mục 2

```js
const myFish = ["angel", "clown", "mandarin", "sturgeon"];
const removed = myFish.splice(2);

// myFish is ["angel", "clown"]
// removed is ["mandarin", "sturgeon"]
```

### Sử dụng splice() trên mảng thưa

Phương thức `splice()` bảo tồn tính thưa của mảng.

```js
const arr = [1, , 3, 4, , 6];
console.log(arr.splice(1, 2)); // [empty, 3]
console.log(arr); // [1, 4, empty, 6]
```

### Gọi splice() trên đối tượng không phải mảng

Phương thức `splice()` đọc thuộc tính `length` của `this`. Sau đó nó cập nhật các thuộc tính có khóa nguyên và thuộc tính `length` khi cần.

```js
const arrayLike = {
  length: 3,
  unrelated: "foo",
  0: 5,
  2: 4,
};
console.log(Array.prototype.splice.call(arrayLike, 0, 1, 2, 3));
// [ 5 ]
console.log(arrayLike);
// { '0': 2, '1': 3, '3': 4, length: 4, unrelated: 'foo' }
```

## Thông số kỹ thuật

{{Specifications}}

## Khả năng tương thích với trình duyệt

{{Compat}}

## Xem thêm

- Hướng dẫn [Indexed collections](/en-US/docs/Web/JavaScript/Guide/Indexed_collections)
- {{jsxref("Array")}}
- {{jsxref("Array.prototype.concat()")}}
- {{jsxref("Array.prototype.push()")}}
- {{jsxref("Array.prototype.pop()")}}
- {{jsxref("Array.prototype.shift()")}}
- {{jsxref("Array.prototype.slice()")}}
- {{jsxref("Array.prototype.toSpliced()")}}
- {{jsxref("Array.prototype.unshift()")}}
