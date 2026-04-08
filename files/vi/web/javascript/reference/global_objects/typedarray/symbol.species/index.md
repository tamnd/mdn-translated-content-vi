---
title: TypedArray[Symbol.species]
short-title: "[Symbol.species]"
slug: Web/JavaScript/Reference/Global_Objects/TypedArray/Symbol.species
page-type: javascript-static-accessor-property
browser-compat: javascript.builtins.TypedArray.@@species
sidebar: jsref
---

Thuộc tính truy cập tĩnh **`TypedArray[Symbol.species]`** trả về constructor được sử dụng để xây dựng các giá trị trả về từ các phương thức mảng được gõ kiểu.

> [!WARNING]
> Sự tồn tại của `[Symbol.species]` cho phép thực thi mã tùy ý và có thể tạo ra các lỗ hổng bảo mật. Nó cũng làm cho một số tối ưu hóa nhất định trở nên khó khăn hơn nhiều. Các nhà triển khai Engine đang [điều tra liệu có nên loại bỏ tính năng này không](https://github.com/tc39/proposal-rm-builtin-subclassing). Tránh phụ thuộc vào nó nếu có thể.

## Cú pháp

```js-nolint
TypedArray[Symbol.species]
```

### Giá trị trả về

Giá trị của constructor (`this`) mà `get [Symbol.species]` được gọi trên. Giá trị trả về được sử dụng để xây dựng các giá trị trả về từ các phương thức mảng được gõ kiểu tạo ra mảng được gõ kiểu mới.

## Mô tả

Thuộc tính truy cập `[Symbol.species]` trả về constructor mặc định cho các đối tượng [mảng được gõ kiểu](/en-US/docs/Web/JavaScript/Reference/Global_Objects/TypedArray#typedarray_objects). Các constructor lớp con có thể ghi đè nó để thay đổi việc gán constructor. Cài đặt mặc định về cơ bản là:

```js
// Cài đặt bên dưới giả định để minh họa
class TypedArray {
  static get [Symbol.species]() {
    return this;
  }
}
```

Do cài đặt đa hình này, `[Symbol.species]` của các lớp con dẫn xuất cũng sẽ trả về chính constructor theo mặc định.

```js
class SubTypedArray extends Int8Array {}
SubTypedArray[Symbol.species] === SubTypedArray; // true
```

Khi gọi các phương thức mảng được gõ kiểu không thay đổi mảng hiện có nhưng trả về một thực thể mảng mới (ví dụ: [`filter()`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/TypedArray/filter) và [`map()`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/TypedArray/map)), `constructor[Symbol.species]` của mảng sẽ được truy cập. Constructor được trả về sẽ được sử dụng để xây dựng giá trị trả về của phương thức mảng được gõ kiểu.

Tuy nhiên, không giống như [`Array[Symbol.species]`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Array/Symbol.species), khi sử dụng `[Symbol.species]` để tạo mảng được gõ kiểu mới, ngôn ngữ sẽ đảm bảo rằng mảng mới được tạo là mảng được gõ kiểu đúng và có cùng kiểu nội dung với mảng ban đầu — ví dụ: bạn không thể tạo {{jsxref("BigInt64Array")}} từ {{jsxref("Float64Array")}}, hoặc tạo mảng không phải BigInt từ mảng BigInt. Thực hiện điều đó sẽ ném {{jsxref("TypeError")}}.

```js
class BadArray extends Int8Array {
  static get [Symbol.species]() {
    return Array;
  }
}
new BadArray(1).map(() => 0); // TypeError: Method %TypedArray%.prototype.map called on incompatible receiver [object Array]

class BadArray2 extends Int8Array {
  static get [Symbol.species]() {
    return BigInt64Array;
  }
}
new BadArray2(1).map(() => 0n); // TypeError: TypedArray.prototype.map constructed typed array of different content type from |this|
```

> [!NOTE]
> Do lỗi trong cả [SpiderMonkey](https://bugzil.la/1640194) và V8, việc kiểm tra khớp kiểu nội dung không được thực hiện. Chỉ Safari mới ném {{jsxref("TypeError")}} trong ví dụ thứ hai.

## Ví dụ

### Species trong các đối tượng thông thường

Thuộc tính `[Symbol.species]` trả về hàm constructor mặc định, là một trong các constructor mảng được gõ kiểu chính nó cho bất kỳ constructor [mảng được gõ kiểu](/en-US/docs/Web/JavaScript/Reference/Global_Objects/TypedArray#typedarray_objects) nào.

```js
Int8Array[Symbol.species]; // function Int8Array()
Uint8Array[Symbol.species]; // function Uint8Array()
Float32Array[Symbol.species]; // function Float32Array()
```

### Species trong các đối tượng dẫn xuất

Trong một thực thể của lớp con `TypedArray` tùy chỉnh, chẳng hạn như `MyTypedArray`, species của `MyTypedArray` là constructor `MyTypedArray`. Tuy nhiên, bạn có thể muốn ghi đè điều này, để trả về đối tượng [mảng được gõ kiểu](/en-US/docs/Web/JavaScript/Reference/Global_Objects/TypedArray#typedarray_objects) cha trong các phương thức lớp dẫn xuất của bạn:

```js
class MyTypedArray extends Uint8Array {
  // Ghi đè species của MyTypedArray thành constructor Uint8Array cha
  static get [Symbol.species]() {
    return Uint8Array;
  }
}
```

## Đặc tả kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{jsxref("TypedArray")}}
- {{jsxref("Symbol.species")}}
