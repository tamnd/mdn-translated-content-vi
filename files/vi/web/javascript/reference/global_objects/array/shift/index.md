---
title: Array.prototype.shift()
short-title: shift()
slug: Web/JavaScript/Reference/Global_Objects/Array/shift
page-type: javascript-instance-method
browser-compat: javascript.builtins.Array.shift
sidebar: jsref
---

Phương thức **`shift()`** của các instance {{jsxref("Array")}} xóa phần tử **đầu tiên**
khỏi mảng và trả về phần tử đó. Phương thức này thay đổi độ dài của mảng.

{{InteractiveExample("JavaScript Demo: Array.prototype.shift()")}}

```js interactive-example
const array = [1, 2, 3];

const firstElement = array.shift();

console.log(array);
// Expected output: Array [2, 3]

console.log(firstElement);
// Expected output: 1
```

## Syntax

```js-nolint
shift()
```

### Parameters

Không có.

### Return value

Phần tử đã bị xóa khỏi mảng; {{jsxref("undefined")}} nếu mảng rỗng.

## Description

Phương thức `shift()` dịch chuyển tất cả các giá trị sang trái 1 vị trí và giảm độ dài đi 1, kết quả là phần tử đầu tiên bị xóa. Nếu thuộc tính {{jsxref("Array/length", "length")}} bằng 0, {{jsxref("undefined")}} sẽ được trả về.

Phương thức {{jsxref("Array/pop", "pop()")}} có hành vi tương tự `shift()`, nhưng áp dụng cho phần tử cuối cùng của mảng.

Phương thức `shift()` là một [mutating method](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Array#copying_methods_and_mutating_methods). Nó thay đổi độ dài và nội dung của `this`. Trong trường hợp bạn muốn giữ nguyên giá trị của `this` nhưng vẫn trả về một mảng mới với phần tử đầu tiên đã bị xóa, bạn có thể dùng [`arr.slice(1)`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Array/slice) thay thế.

Phương thức `shift()` là [generic](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Array#generic_array_methods). Nó chỉ yêu cầu giá trị `this` có thuộc tính `length` và các thuộc tính được đánh chỉ số nguyên. Mặc dù chuỗi cũng giống như mảng, phương thức này không phù hợp để áp dụng lên chúng vì chuỗi là bất biến.

## Examples

### Xóa một phần tử khỏi mảng

Đoạn code sau hiển thị mảng `myFish` trước và sau khi xóa phần tử đầu tiên. Nó cũng hiển thị phần tử đã bị xóa:

```js
const myFish = ["angel", "clown", "mandarin", "surgeon"];

console.log("myFish before:", myFish);
// myFish before: ['angel', 'clown', 'mandarin', 'surgeon']

const shifted = myFish.shift();

console.log("myFish after:", myFish);
// myFish after: ['clown', 'mandarin', 'surgeon']

console.log("Removed this element:", shifted);
// Removed this element: angel
```

### Sử dụng phương thức shift() trong vòng lặp while

Phương thức shift() thường được dùng trong điều kiện bên trong vòng lặp while. Trong ví dụ sau, mỗi vòng lặp sẽ xóa phần tử tiếp theo khỏi mảng, cho đến khi mảng trống:

```js
const names = ["Andrew", "Tyrone", "Paul", "Maria", "Gayatri"];

while (typeof (i = names.shift()) !== "undefined") {
  console.log(i);
}
// Andrew, Tyrone, Paul, Maria, Gayatri
```

### Gọi shift() trên các đối tượng không phải mảng

Phương thức `shift()` đọc thuộc tính `length` của `this`. Nếu [độ dài đã chuẩn hóa](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Array#normalization_of_the_length_property) bằng 0, `length` được đặt lại thành `0` (trong khi trước đó nó có thể là âm hoặc `undefined`). Ngược lại, thuộc tính tại vị trí `0` được trả về, và các thuộc tính còn lại được dịch chuyển sang trái một vị trí. Thuộc tính tại `length - 1` bị [xóa](/en-US/docs/Web/JavaScript/Reference/Operators/delete), và thuộc tính `length` được giảm đi một.

```js
const arrayLike = {
  length: 3,
  unrelated: "foo",
  2: 4,
};
console.log(Array.prototype.shift.call(arrayLike));
// undefined, because it is an empty slot
console.log(arrayLike);
// { '1': 4, length: 2, unrelated: 'foo' }

const plainObj = {};
// There's no length property, so the length is 0
Array.prototype.shift.call(plainObj);
console.log(plainObj);
// { length: 0 }
```

## Specifications

{{Specifications}}

## Browser compatibility

{{Compat}}

## See also

- Hướng dẫn [Indexed collections](/en-US/docs/Web/JavaScript/Guide/Indexed_collections)
- {{jsxref("Array")}}
- {{jsxref("Array.prototype.push()")}}
- {{jsxref("Array.prototype.pop()")}}
- {{jsxref("Array.prototype.unshift()")}}
- {{jsxref("Array.prototype.concat()")}}
- {{jsxref("Array.prototype.splice()")}}
