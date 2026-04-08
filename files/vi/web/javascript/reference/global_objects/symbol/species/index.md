---
title: Symbol.species
short-title: species
slug: Web/JavaScript/Reference/Global_Objects/Symbol/species
page-type: javascript-static-data-property
browser-compat: javascript.builtins.Symbol.species
sidebar: jsref
---

Thuộc tính dữ liệu tĩnh **`Symbol.species`** đại diện cho [well-known symbol](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Symbol#well-known_symbols) `Symbol.species`. Các phương thức tạo bản sao của một đối tượng có thể tra cứu symbol này trên đối tượng để tìm hàm constructor dùng khi tạo bản sao.

> [!WARNING]
> Sự tồn tại của `[Symbol.species]` cho phép thực thi mã tùy ý và có thể tạo ra lỗ hổng bảo mật. Nó cũng làm cho một số tối ưu hóa trở nên khó hơn nhiều. Các nhà triển khai engine đang [điều tra xem có nên bỏ tính năng này không](https://github.com/tc39/proposal-rm-builtin-subclassing). Tránh dựa vào nó nếu có thể.

{{InteractiveExample("JavaScript Demo: Symbol.species")}}

```js interactive-example
class Array1 extends Array {
  static get [Symbol.species]() {
    return Array;
  }
}

const a = new Array1(1, 2, 3);
const mapped = a.map((x) => x * x);

console.log(mapped instanceof Array1);
// Expected output: false

console.log(mapped instanceof Array);
// Expected output: true
```

## Giá trị

Well-known symbol `Symbol.species`.

{{js_property_attributes(0, 0, 0)}}

## Mô tả

Thuộc tính accessor `[Symbol.species]` cho phép các lớp con ghi đè constructor mặc định cho các đối tượng. Nó chỉ định một giao thức về cách các instance nên được sao chép. Ví dụ, khi bạn dùng các phương thức sao chép mảng, như {{jsxref("Array/map", "map()")}}, phương thức `map()` dùng `instance.constructor[Symbol.species]` để lấy constructor để xây dựng mảng mới. Để biết thêm thông tin, xem [subclassing built-ins](/en-US/docs/Web/JavaScript/Reference/Classes/extends#subclassing_built-ins).

Tất cả các triển khai tích hợp sẵn của `[Symbol.species]` đều trả về giá trị `this`, là constructor của instance hiện tại. Điều này cho phép các phương thức sao chép tạo các instance của lớp dẫn xuất thay vì lớp cơ sở — ví dụ, `map()` sẽ trả về một mảng cùng kiểu với mảng gốc.

## Ví dụ

### Sử dụng species

Bạn có thể muốn trả về các đối tượng {{jsxref("Array")}} trong lớp mảng dẫn xuất `MyArray`. Ví dụ, khi dùng các phương thức như {{jsxref("Array/map", "map()")}} trả về constructor mặc định, bạn muốn các phương thức này trả về đối tượng `Array` cha, thay vì đối tượng `MyArray`. Symbol `species` cho phép bạn làm điều này:

```js
class MyArray extends Array {
  // Ghi đè species thành constructor Array cha
  static get [Symbol.species]() {
    return Array;
  }
}
const a = new MyArray(1, 2, 3);
const mapped = a.map((x) => x * x);

console.log(mapped instanceof MyArray); // false
console.log(mapped instanceof Array); // true
```

## Đặc tả

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [`Array[Symbol.species]`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Array/Symbol.species)
- [`ArrayBuffer[Symbol.species]`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/ArrayBuffer/Symbol.species)
- [`Map[Symbol.species]`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Map/Symbol.species)
- [`Promise[Symbol.species]`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Promise/Symbol.species)
- [`RegExp[Symbol.species]`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/RegExp/Symbol.species)
- [`Set[Symbol.species]`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Set/Symbol.species)
- [`TypedArray[Symbol.species]`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/TypedArray/Symbol.species)
