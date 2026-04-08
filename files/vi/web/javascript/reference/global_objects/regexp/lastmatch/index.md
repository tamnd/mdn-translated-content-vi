---
title: RegExp.lastMatch ($&)
short-title: lastMatch ($&)
slug: Web/JavaScript/Reference/Global_Objects/RegExp/lastMatch
page-type: javascript-static-accessor-property
status:
  - deprecated
browser-compat: javascript.builtins.RegExp.lastMatch
sidebar: jsref
---

{{Deprecated_Header}}

> [!NOTE]
> Tất cả các thuộc tính tĩnh của `RegExp` hiển thị trạng thái khớp cuối cùng trên toàn cục đều đã bị deprecated. Xem [các tính năng RegExp deprecated](/en-US/docs/Web/JavaScript/Reference/Deprecated_and_obsolete_features#regexp) để biết thêm thông tin.

Thuộc tính accessor tĩnh **`RegExp.lastMatch`** trả về chuỗi con được khớp gần nhất. `RegExp["$&"]` là bí danh của thuộc tính này.

## Mô tả

Vì `lastMatch` là thuộc tính tĩnh của {{jsxref("RegExp")}}, bạn luôn dùng nó như `RegExp.lastMatch` hoặc `RegExp["$&"]`, thay vì như thuộc tính của một đối tượng `RegExp` bạn đã tạo.

Giá trị của `lastMatch` cập nhật mỗi khi một instance `RegExp` (nhưng không phải subclass của `RegExp`) tạo ra một khớp thành công. Nếu chưa có khớp nào được thực hiện, `lastMatch` là một chuỗi rỗng. Set accessor của `lastMatch` là `undefined`, vì vậy bạn không thể thay đổi thuộc tính này trực tiếp.

Bạn không thể dùng bí danh viết tắt với dot property accessor (`RegExp.$&`), vì `&` không phải là một phần hợp lệ của identifier, nên điều này gây ra {{jsxref("SyntaxError")}}. Thay vào đó, hãy dùng [bracket notation](/en-US/docs/Web/JavaScript/Reference/Operators/Property_accessors).

`$&` cũng có thể được dùng trong chuỗi thay thế của {{jsxref("String.prototype.replace()")}}, nhưng điều đó không liên quan đến thuộc tính legacy `RegExp["$&"]`.

## Ví dụ

### Sử dụng lastMatch và $&

```js
const re = /hi/g;
re.test("hi there!");
RegExp.lastMatch; // "hi"
RegExp["$&"]; // "hi"
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [`RegExp.input` (`$_`)](/en-US/docs/Web/JavaScript/Reference/Global_Objects/RegExp/input)
- [`RegExp.lastParen` (`$+`)](/en-US/docs/Web/JavaScript/Reference/Global_Objects/RegExp/lastParen)
- [`RegExp.leftContext` (`` $` ``)](/en-US/docs/Web/JavaScript/Reference/Global_Objects/RegExp/leftContext)
- [`RegExp.rightContext` (`$'`)](/en-US/docs/Web/JavaScript/Reference/Global_Objects/RegExp/rightContext)
- [`RegExp.$1`, …, `RegExp.$9`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/RegExp/n)
