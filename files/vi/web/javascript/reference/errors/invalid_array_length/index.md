---
title: "RangeError: invalid array length"
slug: Web/JavaScript/Reference/Errors/Invalid_array_length
page-type: javascript-error
sidebar: jssidebar
---

Ngoại lệ JavaScript "Invalid array length" xảy ra khi chỉ định độ dài mảng là âm, số thực, hoặc vượt quá mức tối đa được hỗ trợ bởi nền tảng (tức là khi tạo {{jsxref("Array")}} hoặc {{jsxref("ArrayBuffer")}}, hoặc khi đặt thuộc tính {{jsxref("Array/length", "length")}}).

Độ dài mảng tối đa cho phép phụ thuộc vào nền tảng, trình duyệt và phiên bản trình duyệt. Đối với {{jsxref("Array")}}, độ dài tối đa là 2<sup>32</sup>-1. Đối với {{jsxref("ArrayBuffer")}}, tối đa là 2<sup>31</sup>-1 (2GiB-1) trên hệ thống 32-bit. Từ phiên bản Firefox 89, giá trị tối đa của {{jsxref("ArrayBuffer")}} là 2<sup>33</sup> (8GiB) trên hệ thống 64-bit.

> [!NOTE]
> `Array` và `ArrayBuffer` là các cấu trúc dữ liệu độc lập (việc triển khai cái này không ảnh hưởng đến cái kia).

## Thông báo

```plain
RangeError: invalid array length (V8-based & Firefox)
RangeError: Array size is not a small enough positive integer. (Safari)

RangeError: Invalid array buffer length (V8-based)
RangeError: length too large (Safari)
```

## Loại lỗi

{{jsxref("RangeError")}}

## Điều gì đã xảy ra?

Lỗi có thể xuất hiện khi cố gắng tạo {{jsxref("Array")}} hoặc {{jsxref("ArrayBuffer")}} với độ dài không hợp lệ, bao gồm:

- Độ dài âm, thông qua constructor hoặc đặt thuộc tính {{jsxref("Array/length", "length")}}.
- Độ dài không phải số nguyên, thông qua constructor hoặc đặt thuộc tính {{jsxref("Array/length", "length")}}. (Constructor `ArrayBuffer` ép kiểu độ dài thành số nguyên, nhưng constructor `Array` thì không.)
- Vượt quá độ dài tối đa được hỗ trợ bởi nền tảng. Đối với mảng, độ dài tối đa là 2<sup>32</sup>-1. Đối với `ArrayBuffer`, độ dài tối đa là 2<sup>31</sup>-1 (2GiB-1) trên hệ thống 32-bit, hoặc 2<sup>33</sup> (8GiB) trên hệ thống 64-bit. Điều này có thể xảy ra thông qua constructor, đặt thuộc tính `length`, hoặc các phương thức mảng ngầm đặt thuộc tính length (chẳng hạn như {{jsxref("Array/push", "push")}} và {{jsxref("Array/concat", "concat")}}).

Nếu bạn đang tạo `Array` bằng constructor, bạn có thể muốn sử dụng ký hiệu ký tự thay thế, vì đối số đầu tiên được hiểu là độ dài của `Array`. Nếu không, bạn có thể muốn kẹp giá trị độ dài trước khi đặt thuộc tính length, hoặc sử dụng nó làm đối số của constructor.

## Ví dụ

### Trường hợp không hợp lệ

```js example-bad
new Array(2 ** 40);
new Array(-1);
new ArrayBuffer(2 ** 32); // hệ thống 32-bit
new ArrayBuffer(-1);

const a = [];
a.length -= 1; // đặt thuộc tính length thành -1

const b = new Array(2 ** 32 - 1);
b.length += 1; // đặt thuộc tính length thành 2^32
b.length = 2.5; // đặt thuộc tính length thành số thực

const c = new Array(2.5); // truyền số thực

// Sửa đổi đồng thời vô tình làm mảng tăng trưởng vô hạn
const arr = [1, 2, 3];
for (const e of arr) {
  arr.push(e * 10);
}
```

### Trường hợp hợp lệ

```js example-good
[2 ** 40]; // [ 1099511627776 ]
[-1]; // [ -1 ]
new ArrayBuffer(2 ** 31 - 1);
new ArrayBuffer(2 ** 33); // hệ thống 64-bit sau Firefox 89
new ArrayBuffer(0);

const a = [];
a.length = Math.max(0, a.length - 1);

const b = new Array(2 ** 32 - 1);
b.length = Math.min(0xffffffff, b.length + 1);
// 0xffffffff là ký hiệu thập lục phân cho 2^32 - 1
// cũng có thể được viết là (-1 >>> 0)

b.length = 3;

const c = new Array(3);

// Vì các phương thức mảng lưu length trước khi lặp, nên an toàn khi
// tăng trưởng mảng trong quá trình lặp
const arr = [1, 2, 3];
arr.forEach((e) => arr.push(e * 10));
```

## Xem thêm

- {{jsxref("Array")}}
- {{jsxref("Array/length", "length")}}
- {{jsxref("ArrayBuffer")}}
