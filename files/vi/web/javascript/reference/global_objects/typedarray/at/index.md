---
title: TypedArray.prototype.at()
short-title: at()
slug: Web/JavaScript/Reference/Global_Objects/TypedArray/at
page-type: javascript-instance-method
browser-compat: javascript.builtins.TypedArray.at
sidebar: jsref
---

Phương thức **`at()`** của các thực thể {{jsxref("TypedArray")}} nhận một giá trị số nguyên và trả về phần tử tại chỉ số đó, cho phép cả số nguyên dương và âm. Số nguyên âm đếm ngược từ phần tử cuối cùng trong mảng được gõ kiểu. Phương thức này có cùng thuật toán với {{jsxref("Array.prototype.at()")}}.

{{InteractiveExample("JavaScript Demo: TypedArray.prototype.at()")}}

```js interactive-example
const int8 = new Int8Array([0, 10, -10, 20, -30, 40, -50]);

let index = 1;

console.log(`An index of ${index} returns the item ${int8.at(index)}`);
// Expected output: "An index of 1 returns the item 10"

index = -2;

console.log(`An index of ${index} returns the item ${int8.at(index)}`);
// Expected output: "An index of -2 returns the item 40"
```

## Cú pháp

```js-nolint
at(index)
```

### Tham số

- `index`
  - : Chỉ số dựa trên 0 của phần tử mảng được gõ kiểu cần trả về, [được chuyển đổi thành số nguyên](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Number#integer_conversion). Chỉ số âm đếm ngược từ cuối mảng được gõ kiểu — nếu `index < 0`, thì `index + array.length` sẽ được truy cập.

### Giá trị trả về

Phần tử trong mảng được gõ kiểu khớp với chỉ số đã cho. Luôn trả về {{jsxref("undefined")}} nếu `index < -array.length` hoặc `index >= array.length` mà không cố gắng truy cập thuộc tính tương ứng.

## Mô tả

Xem {{jsxref("Array.prototype.at()")}} để biết thêm chi tiết. Phương thức này không phải là phương thức tổng quát và chỉ có thể được gọi trên các thực thể mảng được gõ kiểu.

## Ví dụ

### Trả về giá trị cuối cùng của mảng được gõ kiểu

Ví dụ sau cung cấp một hàm trả về phần tử cuối cùng trong một mảng được chỉ định.

```js
const uint8 = new Uint8Array([1, 2, 4, 7, 11, 18]);

// Hàm trả về phần tử cuối cùng của mảng đã cho
function returnLast(arr) {
  return arr.at(-1);
}

const lastItem = returnLast(uint8);
console.log(lastItem); // 18
```

### So sánh các phương thức

Dưới đây chúng ta so sánh các cách khác nhau để chọn phần tử áp chót (phần tử cuối cùng nhưng một) của {{jsxref("TypedArray")}}. Mặc dù tất cả các phương thức dưới đây đều hợp lệ, nhưng chúng nêu bật sự ngắn gọn và dễ đọc của phương thức `at()`.

```js
// Mảng được gõ kiểu của chúng ta với các giá trị
const uint8 = new Uint8Array([1, 2, 4, 7, 11, 18]);

// Sử dụng thuộc tính length
const lengthWay = uint8[uint8.length - 2];
console.log(lengthWay); // 11

// Sử dụng phương thức slice(). Lưu ý một mảng được trả về
const sliceWay = uint8.slice(-2, -1);
console.log(sliceWay[0]); // 11

// Sử dụng phương thức at()
const atWay = uint8.at(-2);
console.log(atWay); // 11
```

## Đặc tả kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Polyfill của `TypedArray.prototype.at` trong `core-js`](https://github.com/zloirock/core-js#relative-indexing-method)
- [es-shims polyfill của `TypedArray.prototype.at`](https://www.npmjs.com/package/typedarray.prototype.at)
- Hướng dẫn [Mảng được gõ kiểu JavaScript](/en-US/docs/Web/JavaScript/Guide/Typed_arrays)
- {{jsxref("TypedArray")}}
- {{jsxref("TypedArray.prototype.findIndex()")}}
- {{jsxref("TypedArray.prototype.indexOf()")}}
- {{jsxref("TypedArray.prototype.with()")}}
- {{jsxref("Array.prototype.at()")}}
- {{jsxref("String.prototype.at()")}}
