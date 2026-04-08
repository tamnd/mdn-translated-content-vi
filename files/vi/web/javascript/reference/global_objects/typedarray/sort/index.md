---
title: TypedArray.prototype.sort()
short-title: sort()
slug: Web/JavaScript/Reference/Global_Objects/TypedArray/sort
page-type: javascript-instance-method
browser-compat: javascript.builtins.TypedArray.sort
sidebar: jsref
---

Phương thức **`sort()`** của các thực thể {{jsxref("TypedArray")}} sắp xếp các phần tử của mảng được gõ kiểu _[tại chỗ](https://en.wikipedia.org/wiki/In-place_algorithm)_ và trả về tham chiếu đến cùng mảng được gõ kiểu đó, hiện đã được sắp xếp. Phương thức này có cùng thuật toán với {{jsxref("Array.prototype.sort()")}}, ngoại trừ nó sắp xếp các giá trị theo số thay vì theo chuỗi theo mặc định.

{{InteractiveExample("JavaScript Demo: TypedArray.prototype.sort()", "shorter")}}

```js interactive-example
const uint8 = new Uint8Array([40, 10, 50, 20, 30]);
uint8.sort();

console.log(uint8);
// Expected output: Uint8Array [10, 20, 30, 40, 50]
```

## Cú pháp

```js-nolint
sort()
sort(compareFn)
```

### Tham số

- `compareFn` {{optional_inline}}
  - : Hàm xác định thứ tự của các phần tử. Hàm được gọi với các đối số sau:
    - `a`
      - : Phần tử đầu tiên để so sánh.
    - `b`
      - : Phần tử thứ hai để so sánh.

    Nó phải trả về một số trong đó:
    - Giá trị âm cho biết `a` nên đứng trước `b`.
    - Giá trị dương cho biết `a` nên đứng sau `b`.
    - Số không hoặc `NaN` cho biết `a` và `b` được coi là bằng nhau.

    Để ghi nhớ điều này, hãy nhớ rằng `(a, b) => a - b` sắp xếp các số theo thứ tự tăng dần.

    Nếu bị bỏ qua, các phần tử mảng được gõ kiểu được sắp xếp theo giá trị số.

### Giá trị trả về

Tham chiếu đến mảng được gõ kiểu ban đầu, hiện đã được sắp xếp. Lưu ý rằng mảng được gõ kiểu được sắp xếp _[tại chỗ](https://en.wikipedia.org/wiki/In-place_algorithm)_, và không có bản sao nào được tạo.

## Mô tả

Xem {{jsxref("Array.prototype.sort()")}} để biết thêm chi tiết. Phương thức này không phải là phương thức tổng quát và chỉ có thể được gọi trên các thực thể mảng được gõ kiểu.

## Ví dụ

### Sử dụng sort()

Để biết thêm ví dụ, hãy xem phương thức {{jsxref("Array.prototype.sort()")}}.

```js
let numbers = new Uint8Array([40, 1, 5, 200]);
numbers.sort();
// Uint8Array [ 1, 5, 40, 200 ]
// Không giống như các mảng thông thường, không cần hàm so sánh
// để sắp xếp các số theo thứ tự số.

// Mảng thông thường cần hàm so sánh để sắp xếp theo số:
numbers = [40, 1, 5, 200];
numbers.sort();
// [1, 200, 40, 5]

numbers.sort((a, b) => a - b); // so sánh số
// [ 1, 5, 40, 200 ]
```

## Đặc tả kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Polyfill của `TypedArray.prototype.sort` với hành vi hiện đại như sắp xếp ổn định trong `core-js`](https://github.com/zloirock/core-js#ecmascript-typed-arrays)
- Hướng dẫn [Mảng được gõ kiểu JavaScript](/en-US/docs/Web/JavaScript/Guide/Typed_arrays)
- {{jsxref("TypedArray")}}
- {{jsxref("TypedArray.prototype.reverse()")}}
- {{jsxref("TypedArray.prototype.toSorted()")}}
- {{jsxref("Array.prototype.sort()")}}
