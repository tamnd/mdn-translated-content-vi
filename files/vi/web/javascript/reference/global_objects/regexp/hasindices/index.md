---
title: RegExp.prototype.hasIndices
short-title: hasIndices
slug: Web/JavaScript/Reference/Global_Objects/RegExp/hasIndices
page-type: javascript-instance-accessor-property
browser-compat: javascript.builtins.RegExp.hasIndices
sidebar: jsref
---

Thuộc tính accessor **`hasIndices`** của các instance {{jsxref("RegExp")}} trả về liệu cờ `d` có được sử dụng với biểu thức chính quy này hay không.

{{InteractiveExample("JavaScript Demo: RegExp.prototype.hasIndices")}}

```js interactive-example
const regex1 = /foo/d;

console.log(regex1.hasIndices);
// Expected output: true

const regex2 = /bar/;

console.log(regex2.hasIndices);
// Expected output: false
```

## Mô tả

`RegExp.prototype.hasIndices` có giá trị `true` nếu cờ `d` được sử dụng; ngược lại là `false`. Cờ `d` chỉ ra rằng kết quả của một kết quả khớp biểu thức chính quy nên chứa các chỉ mục bắt đầu và kết thúc của các chuỗi con của mỗi nhóm bắt. Nó không thay đổi cách diễn giải hoặc hành vi khớp của regex theo bất kỳ cách nào, mà chỉ cung cấp thông tin bổ sung trong kết quả khớp.

Cờ này chủ yếu ảnh hưởng đến giá trị trả về của [`exec()`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/RegExp/exec). Nếu cờ `d` có mặt, mảng được trả về bởi `exec()` có thuộc tính `indices` bổ sung như được mô tả trong [giá trị trả về](/en-US/docs/Web/JavaScript/Reference/Global_Objects/RegExp/exec#return_value) của phương thức `exec()`. Vì tất cả các phương thức liên quan đến regex khác (như {{jsxref("String.prototype.match()")}}) gọi `exec()` nội bộ, chúng cũng sẽ trả về các chỉ mục nếu regex có cờ `d`.

Accessor set của `hasIndices` là `undefined`. Bạn không thể thay đổi thuộc tính này trực tiếp.

## Ví dụ

Có một ví dụ sử dụng chi tiết hơn tại [Nhóm và tham chiếu ngược > Sử dụng nhóm và chỉ mục kết quả khớp](/en-US/docs/Web/JavaScript/Guide/Regular_expressions/Groups_and_backreferences#using_groups_and_match_indices).

### Sử dụng hasIndices

```js
const str1 = "foo bar foo";

const regex1 = /foo/dg;

console.log(regex1.hasIndices); // true

console.log(regex1.exec(str1).indices[0]); // [0, 3]
console.log(regex1.exec(str1).indices[0]); // [8, 11]

const str2 = "foo bar foo";

const regex2 = /foo/;

console.log(regex2.hasIndices); // false

console.log(regex2.exec(str2).indices); // undefined
```

## Đặc tả kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{jsxref("RegExp.prototype.lastIndex")}}
- {{jsxref("RegExp.prototype.exec()")}}
- {{jsxref("RegExp.prototype.dotAll")}}
- {{jsxref("RegExp.prototype.global")}}
- {{jsxref("RegExp.prototype.ignoreCase")}}
- {{jsxref("RegExp.prototype.multiline")}}
- {{jsxref("RegExp.prototype.source")}}
- {{jsxref("RegExp.prototype.sticky")}}
- {{jsxref("RegExp.prototype.unicode")}}
