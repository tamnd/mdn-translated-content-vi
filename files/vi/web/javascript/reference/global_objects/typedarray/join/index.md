---
title: TypedArray.prototype.join()
short-title: join()
slug: Web/JavaScript/Reference/Global_Objects/TypedArray/join
page-type: javascript-instance-method
browser-compat: javascript.builtins.TypedArray.join
sidebar: jsref
---

Phương thức **`join()`** của các thực thể {{jsxref("TypedArray")}} tạo và trả về một chuỗi mới bằng cách nối tất cả các phần tử trong mảng được gõ kiểu này, được phân tách bằng dấu phẩy hoặc một chuỗi phân tách được chỉ định. Nếu mảng được gõ kiểu chỉ có một mục, thì mục đó sẽ được trả về mà không sử dụng dấu phân tách. Phương thức này có cùng thuật toán với {{jsxref("Array.prototype.join()")}}.

{{InteractiveExample("JavaScript Demo: TypedArray.prototype.join()")}}

```js interactive-example
const uint8 = new Uint8Array([10, 20, 30, 40, 50]);

console.log(uint8.join());
// Expected output: "10,20,30,40,50"

console.log(uint8.join(""));
// Expected output: "1020304050"

console.log(uint8.join("-"));
// Expected output: "10-20-30-40-50"
```

## Cú pháp

```js-nolint
join()
join(separator)
```

### Tham số

- `separator` {{optional_inline}}
  - : Chuỗi để phân tách từng cặp phần tử kề nhau trong mảng được gõ kiểu. Nếu bị bỏ qua, các phần tử mảng được gõ kiểu được phân tách bằng dấu phẩy (",").

### Giá trị trả về

Một chuỗi với tất cả các phần tử mảng được gõ kiểu được nối. Nếu `array.length` là `0`, chuỗi rỗng được trả về.

## Mô tả

Xem {{jsxref("Array.prototype.join()")}} để biết thêm chi tiết. Phương thức này không phải là phương thức tổng quát và chỉ có thể được gọi trên các thực thể mảng được gõ kiểu.

## Ví dụ

### Sử dụng join()

```js
const uint8 = new Uint8Array([1, 2, 3]);
uint8.join(); // '1,2,3'
uint8.join(" / "); // '1 / 2 / 3'
uint8.join(""); // '123'
```

## Đặc tả kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Polyfill của `TypedArray.prototype.join` trong `core-js`](https://github.com/zloirock/core-js#ecmascript-typed-arrays)
- Hướng dẫn [Mảng được gõ kiểu JavaScript](/en-US/docs/Web/JavaScript/Guide/Typed_arrays)
- {{jsxref("TypedArray")}}
- {{jsxref("TypedArray.prototype.toString()")}}
- {{jsxref("Array.prototype.join()")}}
- {{jsxref("String.prototype.split()")}}
