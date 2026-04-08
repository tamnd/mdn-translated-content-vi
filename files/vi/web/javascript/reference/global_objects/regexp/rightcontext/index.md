---
title: RegExp.rightContext ($')
short-title: rightContext ($')
slug: Web/JavaScript/Reference/Global_Objects/RegExp/rightContext
page-type: javascript-static-accessor-property
status:
  - deprecated
browser-compat: javascript.builtins.RegExp.rightContext
sidebar: jsref
---

{{Deprecated_Header}}

> [!NOTE]
> Tất cả các thuộc tính static của `RegExp` hiển thị trạng thái match cuối cùng một cách toàn cục đều đã bị deprecated. Xem [các tính năng RegExp đã deprecated](/en-US/docs/Web/JavaScript/Reference/Deprecated_and_obsolete_features#regexp) để biết thêm thông tin.

Thuộc tính accessor static **`RegExp.rightContext`** trả về chuỗi con nằm sau lần match gần nhất. `RegExp["$'"]` là bí danh của thuộc tính này.

## Mô tả

Vì `rightContext` là thuộc tính static của {{jsxref("RegExp")}}, bạn luôn sử dụng nó dưới dạng `RegExp.rightContext` hoặc `RegExp["$'"]`, thay vì là thuộc tính của một đối tượng `RegExp` mà bạn đã tạo.

Giá trị của `rightContext` được cập nhật mỗi khi một instance của `RegExp` (nhưng không phải subclass của `RegExp`) thực hiện match thành công. Nếu chưa có match nào được thực hiện, `rightContext` là một chuỗi rỗng. Set accessor của `rightContext` là `undefined`, vì vậy bạn không thể thay đổi thuộc tính này trực tiếp.

Bạn không thể sử dụng bí danh tốc ký với dot property accessor (`RegExp.$'`), vì `'` không phải là ký tự hợp lệ trong tên định danh, điều này sẽ gây ra {{jsxref("SyntaxError")}}. Hãy dùng [bracket notation](/en-US/docs/Web/JavaScript/Reference/Operators/Property_accessors) thay thế.

`$'` cũng có thể được dùng trong chuỗi thay thế của {{jsxref("String.prototype.replace()")}}, nhưng điều đó không liên quan đến thuộc tính legacy `RegExp["$'"]`.

## Ví dụ

### Sử dụng rightContext và $'

```js
const re = /hello/g;
re.test("hello world!");
RegExp.rightContext; // " world!"
RegExp["$'"]; // " world!"
```

## Đặc tả

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [`RegExp.input` (`$_`)](/en-US/docs/Web/JavaScript/Reference/Global_Objects/RegExp/input)
- [`RegExp.lastMatch` (`$&`)](/en-US/docs/Web/JavaScript/Reference/Global_Objects/RegExp/lastMatch)
- [`RegExp.lastParen` (`$+`)](/en-US/docs/Web/JavaScript/Reference/Global_Objects/RegExp/lastParen)
- [`RegExp.leftContext` (`` $` ``)](/en-US/docs/Web/JavaScript/Reference/Global_Objects/RegExp/leftContext)
- [`RegExp.$1`, …, `RegExp.$9`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/RegExp/n)
