---
title: Promise[Symbol.species]
short-title: "[Symbol.species]"
slug: Web/JavaScript/Reference/Global_Objects/Promise/Symbol.species
page-type: javascript-static-accessor-property
browser-compat: javascript.builtins.Promise.@@species
sidebar: jsref
---

Thuộc tính truy cập tĩnh **`Promise[Symbol.species]`** trả về constructor được sử dụng để tạo các giá trị trả về từ các phương thức promise.

> [!WARNING]
> Sự tồn tại của `[Symbol.species]` cho phép thực thi mã tùy ý và có thể tạo ra các lỗ hổng bảo mật. Nó cũng khiến một số tối ưu hóa trở nên khó khăn hơn nhiều. Các nhà phát triển engine đang [xem xét việc loại bỏ tính năng này](https://github.com/tc39/proposal-rm-builtin-subclassing). Hãy tránh phụ thuộc vào nó nếu có thể.

## Cú pháp

```js-nolint
Promise[Symbol.species]
```

### Giá trị trả về

Giá trị của constructor (`this`) mà `get [Symbol.species]` được gọi trên đó. Giá trị trả về được sử dụng để tạo các giá trị trả về từ các phương thức chuỗi promise tạo ra promise mới.

## Mô tả

Thuộc tính truy cập `[Symbol.species]` trả về constructor mặc định cho các đối tượng `Promise`. Các constructor của lớp con có thể ghi đè nó để thay đổi việc gán constructor. Cài đặt mặc định về cơ bản là:

```js
// Cài đặt nền tảng giả định để minh họa
class Promise {
  static get [Symbol.species]() {
    return this;
  }
}
```

Do cài đặt đa hình này, `[Symbol.species]` của các lớp con kế thừa cũng sẽ trả về chính constructor đó theo mặc định.

```js
class SubPromise extends Promise {}
SubPromise[Symbol.species] === SubPromise; // true
```

Các phương thức chuỗi promise — [`then()`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Promise/then), [`catch()`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Promise/catch), và [`finally()`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Promise/finally) — trả về các đối tượng promise mới. Chúng lấy constructor để xây dựng promise mới thông qua `this.constructor[Symbol.species]`. Nếu `this.constructor` là `undefined`, hoặc nếu `this.constructor[Symbol.species]` là `undefined` hoặc `null`, constructor mặc định {{jsxref("Promise/Promise", "Promise()")}} sẽ được sử dụng. Ngược lại, constructor được trả về bởi `this.constructor[Symbol.species]` sẽ được sử dụng để xây dựng đối tượng promise mới.

## Ví dụ

### Species trong các đối tượng thông thường

Thuộc tính `Symbol.species` trả về hàm constructor mặc định, đó là constructor `Promise` cho `Promise`.

```js
Promise[Symbol.species]; // [Function: Promise]
```

### Species trong các đối tượng kế thừa

Trong một thực thể của lớp con `Promise` tùy chỉnh, chẳng hạn như `MyPromise`, species của `MyPromise` là constructor `MyPromise`. Tuy nhiên, bạn có thể muốn ghi đè điều này, để trả về các đối tượng `Promise` cha trong các phương thức của lớp con.

```js
class MyPromise extends Promise {
  // Override MyPromise species to the parent Promise constructor
  static get [Symbol.species]() {
    return Promise;
  }
}
```

Theo mặc định, các phương thức promise sẽ trả về promise với kiểu của lớp con.

```js
class MyPromise extends Promise {
  someValue = 1;
}

console.log(MyPromise.resolve(1).then(() => {}).someValue); // 1
```

Bằng cách ghi đè `[Symbol.species]`, các phương thức promise sẽ trả về kiểu `Promise` cơ sở.

```js
class MyPromise extends Promise {
  someValue = 1;
  static get [Symbol.species]() {
    return Promise;
  }
}

console.log(MyPromise.resolve(1).then(() => {}).someValue); // undefined
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{jsxref("Promise")}}
- {{jsxref("Symbol.species")}}
