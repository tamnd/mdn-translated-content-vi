---
title: Array.prototype.pop()
short-title: pop()
slug: Web/JavaScript/Reference/Global_Objects/Array/pop
page-type: javascript-instance-method
browser-compat: javascript.builtins.Array.pop
sidebar: jsref
---

Phương thức **`pop()`** của các đối tượng {{jsxref("Array")}} xóa phần tử **cuối cùng** khỏi mảng và trả về phần tử đó. Phương thức này thay đổi độ dài của mảng.

{{InteractiveExample("JavaScript Demo: Array.prototype.pop()")}}

```js interactive-example
const plants = ["broccoli", "cauliflower", "cabbage", "kale", "tomato"];

console.log(plants.pop());
// Expected output: "tomato"

console.log(plants);
// Expected output: Array ["broccoli", "cauliflower", "cabbage", "kale"]

plants.pop();

console.log(plants);
// Expected output: Array ["broccoli", "cauliflower", "cabbage"]
```

## Cú pháp

```js-nolint
pop()
```

### Tham số

Không có.

### Giá trị trả về

Phần tử đã bị xóa khỏi mảng; {{jsxref("undefined")}} nếu mảng rỗng.

## Mô tả

Phương thức `pop()` xóa phần tử cuối cùng khỏi mảng và trả về giá trị đó cho người gọi. Nếu bạn gọi `pop()` trên mảng rỗng, nó trả về {{jsxref("undefined")}}.

{{jsxref("Array.prototype.shift()")}} có hành vi tương tự với `pop()`, nhưng áp dụng cho phần tử đầu tiên trong mảng.

Phương thức `pop()` là phương thức thay đổi mảng. Nó thay đổi độ dài và nội dung của `this`. Nếu bạn muốn giá trị của `this` giữ nguyên nhưng trả về mảng mới với phần tử cuối bị xóa, bạn có thể dùng [`arr.slice(0, -1)`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Array/slice) thay thế.

Phương thức `pop()` là [phương thức tổng quát](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Array#generic_array_methods). Nó chỉ yêu cầu giá trị `this` có thuộc tính `length` và các thuộc tính có khóa là số nguyên. Mặc dù chuỗi cũng là dạng giống mảng, phương thức này không phù hợp để áp dụng cho chúng vì chuỗi là bất biến.

## Ví dụ

### Xóa phần tử cuối của mảng

Đoạn mã sau tạo mảng `myFish` chứa bốn phần tử, sau đó xóa phần tử cuối.

```js
const myFish = ["angel", "clown", "mandarin", "sturgeon"];

const popped = myFish.pop();

console.log(myFish); // ['angel', 'clown', 'mandarin' ]

console.log(popped); // 'sturgeon'
```

### Gọi pop() trên đối tượng không phải mảng

Phương thức `pop()` đọc thuộc tính `length` của `this`. Nếu [độ dài đã chuẩn hóa](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Array#normalization_of_the_length_property) là 0, `length` được đặt lại thành `0` (trong khi có thể là âm hoặc `undefined` trước đó). Nếu không, thuộc tính tại `length - 1` được trả về và [xóa](/en-US/docs/Web/JavaScript/Reference/Operators/delete).

```js
const arrayLike = {
  length: 3,
  unrelated: "foo",
  2: 4,
};
console.log(Array.prototype.pop.call(arrayLike));
// 4
console.log(arrayLike);
// { length: 2, unrelated: 'foo' }

const plainObj = {};
// There's no length property, so the length is 0
Array.prototype.pop.call(plainObj);
console.log(plainObj);
// { length: 0 }
```

### Sử dụng đối tượng theo kiểu giống mảng

`push` và `pop` được thiết kế để có tính tổng quát, và chúng ta có thể tận dụng điều đó — như ví dụ sau cho thấy.

Lưu ý rằng trong ví dụ này, chúng ta không tạo mảng để lưu tập hợp đối tượng. Thay vào đó, chúng ta lưu tập hợp trên chính đối tượng và dùng `call` trên `Array.prototype.push` và `Array.prototype.pop` để đánh lừa các phương thức này nghĩ rằng chúng ta đang xử lý mảng.

```js
const collection = {
  length: 0,
  addElements(...elements) {
    // obj.length will be incremented automatically
    // every time an element is added.

    // Returning what push returns; that is
    // the new value of length property.
    return [].push.call(this, ...elements);
  },
  removeElement() {
    // obj.length will be decremented automatically
    // every time an element is removed.

    // Returning what pop returns; that is
    // the removed element.
    return [].pop.call(this);
  },
};

collection.addElements(10, 20, 30);
console.log(collection.length); // 3
collection.removeElement();
console.log(collection.length); // 2
```

## Thông số kỹ thuật

{{Specifications}}

## Khả năng tương thích với trình duyệt

{{Compat}}

## Xem thêm

- Hướng dẫn [Indexed collections](/en-US/docs/Web/JavaScript/Guide/Indexed_collections)
- {{jsxref("Array")}}
- {{jsxref("Array.prototype.push()")}}
- {{jsxref("Array.prototype.shift()")}}
- {{jsxref("Array.prototype.unshift()")}}
- {{jsxref("Array.prototype.concat()")}}
- {{jsxref("Array.prototype.splice()")}}
