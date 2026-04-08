---
title: Array.prototype[Symbol.unscopables]
short-title: "[Symbol.unscopables]"
slug: Web/JavaScript/Reference/Global_Objects/Array/Symbol.unscopables
page-type: javascript-instance-data-property
browser-compat: javascript.builtins.Array.@@unscopables
sidebar: jsref
---

Thuộc tính dữ liệu **`[Symbol.unscopables]`** của `Array.prototype` được chia sẻ bởi tất cả các đối tượng {{jsxref("Array")}}. Nó chứa các tên thuộc tính không được đưa vào tiêu chuẩn ECMAScript trước phiên bản ES2015 và bị bỏ qua cho mục đích ràng buộc câu lệnh [`with`](/en-US/docs/Web/JavaScript/Reference/Statements/with).

## Giá trị

Một [đối tượng có prototype `null`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Object#null-prototype_objects) với các tên thuộc tính được liệt kê bên dưới và giá trị của chúng được đặt thành `true`.

{{js_property_attributes(0, 0, 1)}}

## Mô tả

Các thuộc tính `Array` mặc định bị bỏ qua cho mục đích ràng buộc câu lệnh `with` là:

- [`at()`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Array/at)
- [`copyWithin()`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Array/copyWithin)
- [`entries()`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Array/entries)
- [`fill()`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Array/fill)
- [`find()`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Array/find)
- [`findIndex()`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Array/findIndex)
- [`findLast()`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Array/findLast)
- [`findLastIndex()`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Array/findLastIndex)
- [`flat()`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Array/flat)
- [`flatMap()`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Array/flatMap)
- [`includes()`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Array/includes)
- [`keys()`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Array/keys)
- [`toReversed()`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Array/toReversed)
- [`toSorted()`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Array/toSorted)
- [`toSpliced()`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Array/toSpliced)
- [`values()`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Array/values)

`Array.prototype[Symbol.unscopables]` là một đối tượng rỗng chỉ chứa tất cả các tên thuộc tính trên với giá trị `true`. [Prototype của nó là `null`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Object#null-prototype_objects), vì vậy các thuộc tính `Object.prototype` như [`toString`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Object/toString) sẽ không vô tình bị đánh dấu là unscopable, và `toString()` trong câu lệnh `with` sẽ tiếp tục được gọi trên mảng.

Xem {{jsxref("Symbol.unscopables")}} để biết cách đặt thuộc tính unscopable cho các đối tượng của riêng bạn.

## Ví dụ

Hãy tưởng tượng lệnh gọi `values.push('something')` bên dưới là trong code được viết trước ECMAScript 2015.

```js
var values = [];

with (values) {
  values.push("something");
}
```

Khi ECMAScript 2015 giới thiệu phương thức {{jsxref("Array.prototype.values()")}}, câu lệnh `with` trong code trên bắt đầu hiểu `values` là phương thức mảng `values.values` thay vì biến `values` bên ngoài. Lệnh gọi `values.push('something')` sẽ bị lỗi vì nó hiện đang truy cập `push` trên phương thức `values.values`. Điều này gây ra một lỗi được báo cáo cho Firefox ([Firefox Bug 883914](https://bugzil.la/883914)).

Vì vậy, thuộc tính dữ liệu `[Symbol.unscopables]` cho `Array.prototype` khiến các thuộc tính `Array` được giới thiệu trong ECMAScript 2015 bị bỏ qua cho mục đích ràng buộc câu lệnh `with` — cho phép code được viết trước ECMAScript 2015 tiếp tục hoạt động như mong đợi, thay vì bị lỗi.

## Thông số kỹ thuật

{{Specifications}}

## Khả năng tương thích với trình duyệt

{{Compat}}

## Xem thêm

- [Polyfill của `Array.prototype[Symbol.unscopables]` trong `core-js`](https://github.com/zloirock/core-js#ecmascript-array)
- Hướng dẫn [Indexed collections](/en-US/docs/Web/JavaScript/Guide/Indexed_collections)
- {{jsxref("Array")}}
- {{jsxref("Statements/with", "with")}}
- {{jsxref("Symbol.unscopables")}}
