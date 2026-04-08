---
title: RegExp.prototype.flags
short-title: flags
slug: Web/JavaScript/Reference/Global_Objects/RegExp/flags
page-type: javascript-instance-accessor-property
browser-compat: javascript.builtins.RegExp.flags
sidebar: jsref
---

Thuộc tính accessor **`flags`** của các instance {{jsxref("RegExp")}} trả về các [cờ](/en-US/docs/Web/JavaScript/Guide/Regular_expressions#advanced_searching_with_flags) của biểu thức chính quy này.

{{InteractiveExample("JavaScript Demo: RegExp.prototype.flags")}}

```js interactive-example
// Outputs RegExp flags in alphabetical order

console.log(/foo/gi.flags);
// Expected output: "gi"

console.log(/^bar/muy.flags);
// Expected output: "muy"
```

## Mô tả

`RegExp.prototype.flags` có một chuỗi là giá trị của nó. Các cờ trong thuộc tính `flags` được sắp xếp theo thứ tự bảng chữ cái (từ trái sang phải, ví dụ: `"dgimsuvy"`). Nó thực sự gọi các accessor cờ khác ([`hasIndices`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/RegExp/hasIndices), [`global`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/RegExp/global), v.v.) lần lượt và nối các kết quả.

Tất cả các hàm dựng sẵn đọc thuộc tính `flags` thay vì đọc các accessor cờ riêng lẻ.

Accessor set của `flags` là `undefined`. Bạn không thể thay đổi thuộc tính này trực tiếp.

## Ví dụ

### Sử dụng flags

```js-nolint
/foo/ig.flags; // "gi"
/^bar/myu.flags; // "muy"
```

## Đặc tả kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Polyfill của `RegExp.prototype.flags` trong `core-js`](https://github.com/zloirock/core-js#ecmascript-string-and-regexp)
- [Polyfill es-shims của `RegExp.prototype.flags`](https://www.npmjs.com/package/regexp.prototype.flags)
- [Tìm kiếm nâng cao với cờ](/en-US/docs/Web/JavaScript/Guide/Regular_expressions#advanced_searching_with_flags) trong hướng dẫn Biểu thức chính quy
- {{jsxref("RegExp.prototype.source")}}
