---
title: Array.prototype.push()
short-title: push()
slug: Web/JavaScript/Reference/Global_Objects/Array/push
page-type: javascript-instance-method
browser-compat: javascript.builtins.Array.push
sidebar: jsref
---

Phương thức **`push()`** của các đối tượng {{jsxref("Array")}} thêm các phần tử được chỉ định vào cuối mảng và trả về độ dài mới của mảng.

{{InteractiveExample("JavaScript Demo: Array.prototype.push()")}}

```js interactive-example
const animals = ["pigs", "goats", "sheep"];

const count = animals.push("cows");
console.log(count);
// Expected output: 4
console.log(animals);
// Expected output: Array ["pigs", "goats", "sheep", "cows"]

animals.push("chickens", "cats", "dogs");
console.log(animals);
// Expected output: Array ["pigs", "goats", "sheep", "cows", "chickens", "cats", "dogs"]
```

## Cú pháp

```js-nolint
push()
push(element1)
push(element1, element2)
push(element1, element2, /* …, */ elementN)
```

### Tham số

- `element1`, …, `elementN`
  - : Các phần tử cần thêm vào cuối mảng.

### Giá trị trả về

Thuộc tính {{jsxref("Array/length", "length")}} mới của đối tượng mà phương thức được gọi.

## Mô tả

Phương thức `push()` thêm các giá trị vào cuối mảng.

{{jsxref("Array.prototype.unshift()")}} có hành vi tương tự với `push()`, nhưng áp dụng cho đầu mảng.

Phương thức `push()` là [phương thức thay đổi mảng](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Array#copying_methods_and_mutating_methods). Nó thay đổi độ dài và nội dung của `this`. Nếu bạn muốn giá trị của `this` giữ nguyên nhưng trả về mảng mới với các phần tử được thêm vào cuối, bạn có thể dùng [`arr.concat([element0, element1, /* ... ,*/ elementN])`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Array/concat) thay thế. Lưu ý rằng các phần tử được bọc trong một mảng bổ sung — nếu không, nếu phần tử là mảng, nó sẽ được trải ra thay vì được đẩy vào như một phần tử duy nhất do hành vi của `concat()`.

Phương thức `push()` là [phương thức tổng quát](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Array#generic_array_methods). Nó chỉ yêu cầu giá trị `this` có thuộc tính `length` và các thuộc tính có khóa là số nguyên. Mặc dù chuỗi cũng là dạng giống mảng, phương thức này không phù hợp để áp dụng cho chúng vì chuỗi là bất biến.

## Ví dụ

### Thêm phần tử vào mảng

Đoạn mã sau tạo mảng `sports` chứa hai phần tử, sau đó thêm hai phần tử vào nó. Biến `total` chứa độ dài mới của mảng.

```js
const sports = ["soccer", "baseball"];
const total = sports.push("football", "swimming");

console.log(sports); // ['soccer', 'baseball', 'football', 'swimming']
console.log(total); // 4
```

### Hợp nhất hai mảng

Ví dụ này dùng {{jsxref("Operators/Spread_syntax", "cú pháp spread", "", 1)}} để đẩy tất cả các phần tử từ mảng thứ hai vào mảng đầu tiên.

```js
const vegetables = ["parsnip", "potato"];
const moreVegs = ["celery", "beetroot"];

// Merge the second array into the first one
vegetables.push(...moreVegs);

console.log(vegetables); // ['parsnip', 'potato', 'celery', 'beetroot']
```

Việc hợp nhất hai mảng cũng có thể được thực hiện bằng phương thức {{jsxref("Array/concat", "concat()")}}.

### Gọi push() trên đối tượng không phải mảng

Phương thức `push()` đọc thuộc tính `length` của `this`. Sau đó nó đặt từng chỉ mục của `this` bắt đầu từ `length` với các đối số được truyền vào `push()`. Cuối cùng, nó đặt `length` bằng độ dài trước đó cộng với số phần tử được đẩy.

```js
const arrayLike = {
  length: 3,
  unrelated: "foo",
  2: 4,
};
Array.prototype.push.call(arrayLike, 1, 2);
console.log(arrayLike);
// { '2': 4, '3': 1, '4': 2, length: 5, unrelated: 'foo' }

const plainObj = {};
// There's no length property, so the length is 0
Array.prototype.push.call(plainObj, 1, 2);
console.log(plainObj);
// { '0': 1, '1': 2, length: 2 }
```

### Sử dụng đối tượng theo kiểu giống mảng

Như đã đề cập ở trên, `push` được thiết kế để có tính tổng quát, và chúng ta có thể tận dụng điều đó. `Array.prototype.push` có thể hoạt động trên đối tượng, như ví dụ này cho thấy.

Lưu ý rằng chúng ta không tạo mảng để lưu tập hợp đối tượng. Thay vào đó, chúng ta lưu tập hợp trên chính đối tượng và dùng `call` trên `Array.prototype.push` để đánh lừa phương thức nghĩ rằng chúng ta đang xử lý mảng — và nó vẫn hoạt động, nhờ cách JavaScript cho phép chúng ta thiết lập ngữ cảnh thực thi theo bất kỳ cách nào chúng ta muốn.

```js
const obj = {
  length: 0,

  addElem(elem) {
    // obj.length is automatically incremented
    // every time an element is added.
    [].push.call(this, elem);
  },
};

// Let's add some empty objects just to illustrate.
obj.addElem({});
obj.addElem({});
console.log(obj.length); // 2
```

Lưu ý rằng mặc dù `obj` không phải là mảng, phương thức `push` đã tăng thành công thuộc tính `length` của `obj` giống như khi chúng ta đang xử lý mảng thực sự.

## Thông số kỹ thuật

{{Specifications}}

## Khả năng tương thích với trình duyệt

{{Compat}}

## Xem thêm

- [Polyfill của `Array.prototype.push` trong `core-js` với các bản sửa lỗi của phương thức này](https://github.com/zloirock/core-js#ecmascript-array)
- [es-shims polyfill của `Array.prototype.push`](https://www.npmjs.com/package/array.prototype.push)
- Hướng dẫn [Indexed collections](/en-US/docs/Web/JavaScript/Guide/Indexed_collections)
- {{jsxref("Array")}}
- {{jsxref("Array.prototype.pop()")}}
- {{jsxref("Array.prototype.shift()")}}
- {{jsxref("Array.prototype.unshift()")}}
- {{jsxref("Array.prototype.concat()")}}
- {{jsxref("Array.prototype.splice()")}}
