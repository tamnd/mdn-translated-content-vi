---
title: "TypeError: X.prototype.y called on incompatible type"
slug: Web/JavaScript/Reference/Errors/Called_on_incompatible_type
page-type: javascript-error
sidebar: jssidebar
---

Ngoại lệ JavaScript "called on incompatible target (or object)" xảy ra khi một hàm
(trên một đối tượng nhất định) được gọi với `this` không tương ứng với
kiểu mà hàm mong đợi.

## Thông báo

```plain
TypeError: Method Set.prototype.add called on incompatible receiver undefined (V8-based)
TypeError: Bind must be called on a function (V8-based)
TypeError: Illegal invocation (V8-based)
TypeError: Function.prototype.toString requires that 'this' be a Function (V8-based)
TypeError: this is not a Date object. (V8-based)
TypeError: this is not a typed array. (V8-based)
TypeError: Function.prototype.toString called on incompatible object (Firefox)
TypeError: Function.prototype.bind called on incompatible target (Firefox)
TypeError: 'addEventListener' called on an object that does not implement interface EventTarget. (Firefox)
TypeError: Type error (Safari)
TypeError: undefined is not an object (Safari)
```

## Loại lỗi

{{jsxref("TypeError")}}

## Nguyên nhân?

Khi lỗi này được ném ra, một hàm (trên một đối tượng nhất định) được gọi với
`this` không tương ứng với kiểu mà hàm mong đợi.

Vấn đề này có thể phát sinh khi sử dụng các phương thức {{jsxref("Function.prototype.call()")}} hoặc
{{jsxref("Function.prototype.apply()")}}, và cung cấp đối số `this`
không có kiểu mong đợi.

Vấn đề này cũng có thể xảy ra khi cung cấp một hàm được lưu trữ như thuộc tính của một
đối tượng làm đối số cho một hàm khác. Trong trường hợp này, đối tượng lưu trữ
hàm sẽ không phải là đích `this` của hàm đó khi nó được gọi bởi
hàm khác. Để giải quyết vấn đề này, bạn sẽ cần bọc hàm callback trong một hàm khác, hoặc sử dụng phương thức {{jsxref("Function.prototype.bind()")}} để
buộc đối số `this` đến đối tượng mong đợi.

## Ví dụ

### Trường hợp không hợp lệ

```js example-bad
const mySet = new Set();
["bar", "baz"].forEach(mySet.add);
// mySet.add is a function, but "mySet" is not captured as this.

function myFun() {
  console.log(this);
}
["bar", "baz"].forEach(myFun.bind);
// myFun.bind is a function, but "myFun" is not captured as this.
```

### Trường hợp hợp lệ

```js example-good
const mySet = new Set();
["bar", "baz"].forEach(mySet.add.bind(mySet));
// This works due to binding "mySet" as this.

function myFun() {
  console.log(this);
}
["bar", "baz"].forEach((x) => myFun.bind(x));
// This works using the "bind" function. It creates a new function forwarding the argument.
```

## Xem thêm

- {{jsxref("Function.prototype.call()")}}
- {{jsxref("Function.prototype.apply()")}}
- {{jsxref("Function.prototype.bind()")}}
