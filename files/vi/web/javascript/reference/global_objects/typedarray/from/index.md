---
title: TypedArray.from()
short-title: from()
slug: Web/JavaScript/Reference/Global_Objects/TypedArray/from
page-type: javascript-static-method
browser-compat: javascript.builtins.TypedArray.from
sidebar: jsref
---

Phương thức tĩnh **`TypedArray.from()`** tạo một [mảng được gõ kiểu](/en-US/docs/Web/JavaScript/Reference/Global_Objects/TypedArray#typedarray_objects) mới từ một đối tượng giống mảng hoặc có thể lặp. Phương thức này gần giống như {{jsxref("Array.from()")}}.

{{InteractiveExample("JavaScript Demo: TypedArray.from()", "shorter")}}

```js interactive-example
const uint16 = Int16Array.from("12345");

console.log(uint16);
// Expected output: Int16Array [1, 2, 3, 4, 5]
```

## Cú pháp

```js-nolint
TypedArray.from(arrayLike, mapFn)
TypedArray.from(arrayLike, mapFn, thisArg)
```

Trong đó `TypedArray` là một trong số:

- {{jsxref("Int8Array")}}
- {{jsxref("Uint8Array")}}
- {{jsxref("Uint8ClampedArray")}}
- {{jsxref("Int16Array")}}
- {{jsxref("Uint16Array")}}
- {{jsxref("Int32Array")}}
- {{jsxref("Uint32Array")}}
- {{jsxref("Float16Array")}}
- {{jsxref("Float32Array")}}
- {{jsxref("Float64Array")}}
- {{jsxref("BigInt64Array")}}
- {{jsxref("BigUint64Array")}}

### Tham số

- `arrayLike`
  - : Một đối tượng có thể lặp hoặc giống mảng để chuyển đổi thành mảng được gõ kiểu.
- `mapFn` {{optional_inline}}
  - : Hàm để gọi trên mỗi phần tử của mảng được gõ kiểu. Nếu được cung cấp, mọi giá trị cần thêm vào mảng sẽ được truyền qua hàm này trước, và giá trị trả về của `mapFn` sẽ được thêm vào mảng được gõ kiểu. Hàm được gọi với các đối số sau:
    - `element`
      - : Phần tử hiện tại đang được xử lý trong mảng được gõ kiểu.
    - `index`
      - : Chỉ số của phần tử hiện tại đang được xử lý trong mảng được gõ kiểu.
- `thisArg` {{optional_inline}}
  - : Giá trị để sử dụng như `this` khi thực thi `mapFn`.

### Giá trị trả về

Một thực thể {{jsxref("TypedArray")}} mới.

## Mô tả

Xem {{jsxref("Array.from()")}} để biết thêm chi tiết.

Có một số khác biệt tinh tế giữa {{jsxref("Array.from()")}} và `TypedArray.from()` (lưu ý: giá trị `this` được đề cập dưới đây là giá trị `this` mà `TypedArray.from()` được gọi với, không phải là đối số `thisArg` dùng để gọi `mapFn`):

- Nếu giá trị `this` của `TypedArray.from()` không phải là constructor, `TypedArray.from()` sẽ ném {{jsxref("TypeError")}}, trong khi `Array.from()` mặc định tạo một {{jsxref("Array")}} mới.
- Đối tượng được xây dựng bởi `this` phải là thực thể `TypedArray`, trong khi `Array.from()` cho phép giá trị `this` của nó được xây dựng thành bất kỳ đối tượng nào.
- Khi tham số `source` là iterator, `TypedArray.from()` trước tiên thu thập tất cả giá trị từ iterator, sau đó tạo một thực thể của `this` sử dụng số lượng đó, và cuối cùng thiết lập các giá trị trên thực thể. `Array.from()` thiết lập mỗi giá trị khi nhận chúng từ iterator, rồi thiết lập `length` ở cuối.
- `TypedArray.from()` sử dụng `[[Set]]` trong khi `Array.from()` sử dụng `[[DefineOwnProperty]]`. Do đó, khi làm việc với các đối tượng {{jsxref("Proxy")}}, nó gọi [`handler.set()`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Proxy/Proxy/set) để tạo các phần tử mới thay vì [`handler.defineProperty()`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Proxy/Proxy/defineProperty).
- Khi `Array.from()` nhận một đối tượng giống mảng không phải iterator, nó tôn trọng các lỗ hổng. `TypedArray.from()` sẽ đảm bảo kết quả là dày đặc.

## Ví dụ

### Từ một đối tượng có thể lặp (Set)

```js
const s = new Set([1, 2, 3]);
Uint8Array.from(s);
// Uint8Array [ 1, 2, 3 ]
```

### Từ một chuỗi

```js
Int16Array.from("123");
// Int16Array [ 1, 2, 3 ]
```

### Sử dụng với hàm mũi tên và map

Sử dụng hàm mũi tên làm hàm map để thao tác các phần tử

```js
Float32Array.from([1, 2, 3], (x) => x + x);
// Float32Array [ 2, 4, 6 ]
```

### Tạo chuỗi số

```js
Uint8Array.from({ length: 5 }, (v, k) => k);
// Uint8Array [ 0, 1, 2, 3, 4 ]
```

### Gọi from() trên các constructor không phải TypedArray

Giá trị `this` của `from()` phải là một constructor trả về thực thể `TypedArray`.

```js
function NotArray(len) {
  console.log("NotArray called with length", len);
}

Int8Array.from.call({}, []); // TypeError: #<Object> is not a constructor
Int8Array.from.call(NotArray, []);
// NotArray called with length 0
// TypeError: Method %TypedArray%.from called on incompatible receiver #<NotArray>
```

```js
function NotArray2(len) {
  console.log("NotArray2 called with length", len);
  return new Uint8Array(len);
}
console.log(Int8Array.from.call(NotArray2, [1, 2, 3]));
// NotArray2 called with length 3
// Uint8Array(3) [ 1, 2, 3 ]
```

## Đặc tả kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Polyfill của `TypedArray.from` trong `core-js`](https://github.com/zloirock/core-js#ecmascript-typed-arrays)
- Hướng dẫn [Mảng được gõ kiểu JavaScript](/en-US/docs/Web/JavaScript/Guide/Typed_arrays)
- {{jsxref("TypedArray")}}
- {{jsxref("TypedArray.of()")}}
- {{jsxref("TypedArray.prototype.map()")}}
- {{jsxref("Array.from()")}}
