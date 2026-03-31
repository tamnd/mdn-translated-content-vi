---
title: Array.prototype.copyWithin()
short-title: copyWithin()
slug: Web/JavaScript/Reference/Global_Objects/Array/copyWithin
page-type: javascript-instance-method
browser-compat: javascript.builtins.Array.copyWithin
sidebar: jsref
---

Phương thức **`copyWithin()`** của các instance {{jsxref("Array")}} sao chép nông một phần của mảng này sang vị trí khác trong cùng mảng đó và trả về mảng này mà không thay đổi độ dài của nó.

{{InteractiveExample("JavaScript Demo: Array.prototype.copyWithin()")}}

```js interactive-example
const array = ["a", "b", "c", "d", "e"];

// Copy to index 0 the element at index 3
console.log(array.copyWithin(0, 3, 4));
// Expected output: Array ["d", "b", "c", "d", "e"]

// Copy to index 1 all elements from index 3 to the end
console.log(array.copyWithin(1, 3));
// Expected output: Array ["d", "d", "e", "d", "e"]
```

## Syntax

```js-nolint
copyWithin(target, start)
copyWithin(target, start, end)
```

### Parameters

- `target`
  - : Chỉ số dựa trên 0 để sao chép chuỗi đến, [được chuyển đổi thành số nguyên](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Number#integer_conversion). Đây là vị trí mà phần tử tại `start` sẽ được sao chép đến, và tất cả các phần tử giữa `start` và `end` được sao chép đến các chỉ số tiếp theo.
    - Chỉ số âm đếm ngược từ cuối mảng — nếu `-array.length <= target < 0`, thì `target + array.length` được dùng.
    - Nếu `target < -array.length`, thì `0` được dùng.
    - Nếu `target >= array.length`, thì không có gì được sao chép.
    - Nếu `target` nằm sau `start` sau khi chuẩn hóa, việc sao chép chỉ xảy ra đến cuối `array.length` (nói cách khác, `copyWithin()` không bao giờ mở rộng mảng).
- `start`
  - : Chỉ số dựa trên 0 để bắt đầu sao chép phần tử, [được chuyển đổi thành số nguyên](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Number#integer_conversion).
    - Chỉ số âm đếm ngược từ cuối mảng — nếu `-array.length <= start < 0`, thì `start + array.length` được dùng.
    - Nếu `start < -array.length`, thì `0` được dùng.
    - Nếu `start >= array.length`, thì không có gì được sao chép.
- `end` {{optional_inline}}
  - : Chỉ số dựa trên 0 để kết thúc việc sao chép phần tử, [được chuyển đổi thành số nguyên](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Number#integer_conversion). `copyWithin()` sao chép đến nhưng không bao gồm `end`.
    - Chỉ số âm đếm ngược từ cuối mảng — nếu `-array.length <= end < 0`, thì `end + array.length` được dùng.
    - Nếu `end < -array.length`, thì `0` được dùng.
    - Nếu `end >= array.length` hoặc `end` bị bỏ qua hoặc là `undefined`, thì `array.length` được dùng, khiến tất cả các phần tử đến cuối được sao chép.
    - Nếu `end` ngụ ý một vị trí trước hoặc tại vị trí mà `start` ngụ ý, thì không có gì được sao chép.

### Return value

Mảng đã được sửa đổi.

## Description

Phương thức `copyWithin()` hoạt động tương tự như `memmove` trong C và C++, và là một phương thức hiệu năng cao để dịch chuyển dữ liệu của một {{jsxref("Array")}}. Điều này đặc biệt áp dụng cho phương thức {{jsxref("TypedArray/copyWithin", "TypedArray")}} cùng tên. Chuỗi được sao chép và dán như một thao tác; chuỗi được dán sẽ có các giá trị đã sao chép ngay cả khi vùng sao chép và dán chồng lên nhau.

Vì `undefined` trở thành `0` khi được chuyển đổi thành số nguyên, việc bỏ qua tham số `start` có cùng tác dụng như truyền `0`, là sao chép toàn bộ mảng đến vị trí đích, tương đương với việc dịch phải trong đó phần bên phải bị cắt bỏ và phần bên trái được nhân đôi. Hành vi này có thể gây nhầm lẫn cho người đọc code của bạn, vì vậy bạn nên truyền `0` rõ ràng cho `start`.

```js
console.log([1, 2, 3, 4, 5].copyWithin(2));
// [1, 2, 1, 2, 3]; move all elements to the right by 2 positions
```

Phương thức `copyWithin()` là một [mutating method](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Array#copying_methods_and_mutating_methods). Nó không thay đổi độ dài của `this`, nhưng sẽ thay đổi nội dung của `this` và tạo các thuộc tính mới hoặc xóa các thuộc tính hiện có nếu cần thiết.

Phương thức `copyWithin()` bảo toàn các slot rỗng. Nếu vùng cần sao chép là [mảng thưa (sparse)](/en-US/docs/Web/JavaScript/Guide/Indexed_collections#sparse_arrays), các chỉ số mới tương ứng với slot rỗng sẽ bị [xóa](/en-US/docs/Web/JavaScript/Reference/Operators/delete) và cũng trở thành slot rỗng.

Phương thức `copyWithin()` là [generic](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Array#generic_array_methods). Nó chỉ yêu cầu giá trị `this` có thuộc tính `length` và các thuộc tính có khóa là số nguyên. Mặc dù chuỗi cũng giống mảng, phương thức này không phù hợp để áp dụng lên chúng vì chuỗi là bất biến.

## Examples

### Dùng copyWithin()

```js
console.log([1, 2, 3, 4, 5].copyWithin(0, 3));
// [4, 5, 3, 4, 5]

console.log([1, 2, 3, 4, 5].copyWithin(0, 3, 4));
// [4, 2, 3, 4, 5]

console.log([1, 2, 3, 4, 5].copyWithin(-2, -3, -1));
// [1, 2, 3, 3, 4]
```

### Dùng copyWithin() trên mảng thưa

`copyWithin()` sẽ truyền lan các slot rỗng.

```js
console.log([1, , 3].copyWithin(2, 1, 2)); // [1, empty, empty]
```

### Gọi copyWithin() trên các đối tượng không phải mảng

Phương thức `copyWithin()` đọc thuộc tính `length` của `this` và sau đó thao tác với các chỉ số số nguyên liên quan.

```js
const arrayLike = {
  length: 5,
  3: 1,
};
console.log(Array.prototype.copyWithin.call(arrayLike, 0, 3));
// { '0': 1, '3': 1, length: 5 }
console.log(Array.prototype.copyWithin.call(arrayLike, 3, 1));
// { '0': 1, length: 5 }
// The '3' property is deleted because the copied source is an empty slot
```

## Specifications

{{Specifications}}

## Browser compatibility

{{Compat}}

## See also

- [Polyfill of `Array.prototype.copyWithin` in `core-js`](https://github.com/zloirock/core-js#ecmascript-array)
- [es-shims polyfill of `Array.prototype.copyWithin`](https://www.npmjs.com/package/array.prototype.copywithin)
- [Indexed collections](/en-US/docs/Web/JavaScript/Guide/Indexed_collections) guide
- {{jsxref("Array")}}
- {{jsxref("TypedArray.prototype.copyWithin()")}}
