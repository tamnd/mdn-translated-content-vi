---
title: Function.prototype[Symbol.hasInstance]()
short-title: "[Symbol.hasInstance]()"
slug: Web/JavaScript/Reference/Global_Objects/Function/Symbol.hasInstance
page-type: javascript-instance-method
browser-compat: javascript.builtins.Function.@@hasInstance
sidebar: jsref
---

Phương thức **`[Symbol.hasInstance]()`** của các instance {{jsxref("Function")}} chỉ định quy trình mặc định để xác định xem một hàm constructor có nhận ra một đối tượng là instance của constructor đó hay không. Nó được gọi bởi toán tử [`instanceof`](/en-US/docs/Web/JavaScript/Reference/Operators/instanceof).

## Cú pháp

```js-nolint
func[Symbol.hasInstance](value)
```

### Tham số

- `value`
  - : Đối tượng cần kiểm tra. Các giá trị primitive luôn trả về `false`.

### Giá trị trả về

`true` nếu `func.prototype` nằm trong chuỗi prototype của `value`; ngược lại là `false`. Luôn trả về `false` nếu `value` không phải đối tượng hoặc `this` không phải hàm. Nếu `this` là một [bound function](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Function/bind), trả về kết quả của kiểm tra `instanceof` trên `value` và hàm mục tiêu bên dưới.

### Ngoại lệ

- {{jsxref("TypeError")}}
  - : Ném ra nếu `this` không phải bound function và `this.prototype` không phải đối tượng.

## Mô tả

Toán tử [`instanceof`](/en-US/docs/Web/JavaScript/Reference/Operators/instanceof) gọi phương thức [`[Symbol.hasInstance]()`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Symbol/hasInstance) của vế phải bất cứ khi nào phương thức đó tồn tại. Vì tất cả các hàm đều kế thừa từ `Function.prototype` theo mặc định, chúng đều có phương thức `[Symbol.hasInstance]()`, do đó hầu hết thời gian, phương thức `Function.prototype[Symbol.hasInstance]()` chỉ định hành vi của `instanceof` khi vế phải là một hàm. Phương thức này triển khai hành vi mặc định của toán tử `instanceof` (cùng thuật toán khi `constructor` không có phương thức `[Symbol.hasInstance]()`).

Không giống hầu hết các phương thức, thuộc tính `Function.prototype[Symbol.hasInstance]()` là non-configurable và non-writable. Đây là tính năng bảo mật để ngăn hàm mục tiêu cơ bản của bound function bị lộ ra ngoài. Xem [câu trả lời Stack Overflow này](https://stackoverflow.com/questions/38215027/trying-to-understand-the-official-es6-spec-regarding-symbol-hasinstance/38215392#38215392) để biết ví dụ.

## Ví dụ

### Quay lại hành vi instanceof mặc định

Bạn hiếm khi cần gọi phương thức này trực tiếp. Thay vào đó, phương thức này được gọi bởi toán tử `instanceof`. Bạn nên mong đợi hai kết quả thường tương đương nhau.

```js
class Foo {}
const foo = new Foo();
console.log(foo instanceof Foo === Foo[Symbol.hasInstance](foo)); // true
```

Bạn có thể muốn dùng phương thức này nếu muốn gọi hành vi `instanceof` mặc định, nhưng không biết liệu một constructor có phương thức `[Symbol.hasInstance]()` tùy chỉnh hay không.

```js
class Foo {
  static [Symbol.hasInstance](value) {
    // A custom implementation
    return false;
  }
}

const foo = new Foo();
console.log(foo instanceof Foo); // false
console.log(Function.prototype[Symbol.hasInstance].call(Foo, foo)); // true
```

## Đặc tả

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [`instanceof`](/en-US/docs/Web/JavaScript/Reference/Operators/instanceof)
- {{jsxref("Symbol.hasInstance")}}
