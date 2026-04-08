---
title: 'TypeError: "x" is not a function'
slug: Web/JavaScript/Reference/Errors/Not_a_function
page-type: javascript-error
sidebar: jssidebar
---

Ngoại lệ JavaScript "is not a function" xảy ra khi có cố gắng gọi một giá trị như một hàm, nhưng giá trị đó thực tế không phải là hàm.

## Thông báo

```plain
TypeError: "x" is not a function. (V8-based & Firefox & Safari)
```

## Loại lỗi

{{jsxref("TypeError")}}

## Nguyên nhân?

Đã cố gắng gọi một giá trị như một hàm, nhưng giá trị đó thực tế không phải là hàm. Một số code yêu cầu bạn cung cấp một hàm, nhưng điều đó đã không xảy ra.

Có thể có lỗi đánh máy trong tên hàm? Có thể đối tượng bạn đang gọi phương thức không có hàm này? Ví dụ, JavaScript `Object` không có hàm `map`, nhưng JavaScript `Array` thì có.

Có nhiều hàm tích hợp sẵn cần một hàm (callback). Bạn sẽ phải cung cấp một hàm để các phương thức này hoạt động đúng cách:

- Khi làm việc với các đối tượng {{jsxref("Array")}} hoặc {{jsxref("TypedArray")}}:
  - {{jsxref("Array.prototype.every()")}}, {{jsxref("Array.prototype.some()")}},
    {{jsxref("Array.prototype.forEach()")}}, {{jsxref("Array.prototype.map()")}},
    {{jsxref("Array.prototype.filter()")}}, {{jsxref("Array.prototype.reduce()")}},
    {{jsxref("Array.prototype.reduceRight()")}}, {{jsxref("Array.prototype.find()")}}

- Khi làm việc với các đối tượng {{jsxref("Map")}} và {{jsxref("Set")}}:
  - {{jsxref("Map.prototype.forEach()")}} và {{jsxref("Set.prototype.forEach()")}}

## Ví dụ

### Lỗi đánh máy trong tên hàm

Trong trường hợp này, xảy ra quá thường, có lỗi đánh máy trong tên phương thức:

```js example-bad
const x = document.getElementByID("foo");
// TypeError: document.getElementByID is not a function
```

Tên hàm đúng là `getElementById`:

```js example-good
const x = document.getElementById("foo");
```

### Hàm được gọi trên đối tượng sai

Đối với một số phương thức, bạn phải cung cấp một hàm (callback) và nó sẽ chỉ hoạt động trên các đối tượng cụ thể. Trong ví dụ này, {{jsxref("Array.prototype.map()")}} được sử dụng, nhưng chỉ hoạt động với đối tượng {{jsxref("Array")}}.

```js example-bad
const obj = { a: 13, b: 37, c: 42 };

obj.map((num) => num * 2);

// TypeError: obj.map is not a function
```

Hãy dùng mảng thay thế:

```js example-good
const numbers = [1, 4, 9];

numbers.map((num) => num * 2); // [2, 8, 18]
```

### Hàm có cùng tên với thuộc tính đã có

Đôi khi khi tạo một class, bạn có thể có một thuộc tính và một hàm cùng tên. Khi gọi hàm, trình biên dịch nghĩ rằng hàm không còn tồn tại nữa.

```js example-bad
function Dog() {
  this.age = 11;
  this.color = "black";
  this.name = "Ralph";
  return this;
}

Dog.prototype.name = function (name) {
  this.name = name;
  return this;
};

const myNewDog = new Dog();
myNewDog.name("Cassidy"); // TypeError: myNewDog.name is not a function
```

Hãy dùng tên thuộc tính khác thay thế:

```js example-good
function Dog() {
  this.age = 11;
  this.color = "black";
  this.dogName = "Ralph"; // Dùng this.dogName thay vì .name
  return this;
}

Dog.prototype.name = function (name) {
  this.dogName = name;
  return this;
};

const myNewDog = new Dog();
myNewDog.name("Cassidy"); // Dog { age: 11, color: 'black', dogName: 'Cassidy' }
```

### Dùng dấu ngoặc đơn để nhân

Trong toán học, bạn có thể viết 2 × (3 + 5) là 2\*(3 + 5) hoặc chỉ 2(3 + 5).

Dùng cách sau sẽ ném ra lỗi:

```js example-bad
const sixteen = 2(3 + 5);
console.log(`2 x (3 + 5) is ${sixteen}`);
// Uncaught TypeError: 2 is not a function
```

Bạn có thể sửa code bằng cách thêm toán tử `*`:

```js example-good
const sixteen = 2 * (3 + 5);
console.log(`2 x (3 + 5) is ${sixteen}`);
// 2 x (3 + 5) is 16
```

### Import module được export đúng cách

Hãy đảm bảo bạn đang import module đúng cách.

Ví dụ về thư viện helpers (`helpers.js`)

```js
function helpers() {}

helpers.groupBy = function (objectArray, property) {
  return objectArray.reduce((acc, obj) => {
    const key = obj[property];
    acc[key] ??= [];
    acc[key].push(obj);
    return acc;
  }, {});
};

export default helpers;
```

Cách import đúng (`App.js`):

```js
import helpers from "./helpers";
```

## Xem thêm

- [Functions](/en-US/docs/Web/JavaScript/Reference/Functions)
