---
title: RegExp.leftContext ($`)
short-title: leftContext ($`)
slug: Web/JavaScript/Reference/Global_Objects/RegExp/leftContext
page-type: javascript-static-accessor-property
status:
  - deprecated
browser-compat: javascript.builtins.RegExp.leftContext
sidebar: jsref
---

{{Deprecated_Header}}

> [!NOTE]
> Tất cả các thuộc tính tĩnh của `RegExp` hiển thị trạng thái khớp cuối cùng trên toàn cục đều đã bị deprecated. Xem [các tính năng RegExp deprecated](/en-US/docs/Web/JavaScript/Reference/Deprecated_and_obsolete_features#regexp) để biết thêm thông tin.

Thuộc tính accessor tĩnh **`RegExp.leftContext`** trả về chuỗi con đứng trước lần khớp gần nhất. ``RegExp["$`"]`` là bí danh của thuộc tính này.

## Mô tả

Vì `leftContext` là thuộc tính tĩnh của {{jsxref("RegExp")}}, bạn luôn dùng nó như `RegExp.leftContext` hoặc ``RegExp["$`"]``, thay vì như thuộc tính của một đối tượng `RegExp` bạn đã tạo.

Giá trị của `leftContext` cập nhật mỗi khi một instance `RegExp` (nhưng không phải subclass của `RegExp`) tạo ra một khớp thành công. Nếu chưa có khớp nào được thực hiện, `leftContext` là một chuỗi rỗng. Set accessor của `leftContext` là `undefined`, vì vậy bạn không thể thay đổi thuộc tính này trực tiếp.

Bạn không thể dùng bí danh viết tắt với dot property accessor (``RegExp.$` ``), vì `` ` `` không phải là một phần hợp lệ của identifier, nên điều này gây ra {{jsxref("SyntaxError")}}. Thay vào đó, hãy dùng [bracket notation](/en-US/docs/Web/JavaScript/Reference/Operators/Property_accessors).

`` $` `` cũng có thể được dùng trong chuỗi thay thế của {{jsxref("String.prototype.replace()")}}, nhưng điều đó không liên quan đến thuộc tính legacy ``RegExp["$`"]``.

## Ví dụ

### Sử dụng leftContext và $\`

```js
const re = /world/g;
re.test("hello world!");
RegExp.leftContext; // "hello "
RegExp["$`"]; // "hello "
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [`RegExp.input` (`$_`)](/en-US/docs/Web/JavaScript/Reference/Global_Objects/RegExp/input)
- [`RegExp.lastMatch` (`$&`)](/en-US/docs/Web/JavaScript/Reference/Global_Objects/RegExp/lastMatch)
- [`RegExp.lastParen` (`$+`)](/en-US/docs/Web/JavaScript/Reference/Global_Objects/RegExp/lastParen)
- [`RegExp.rightContext` (`$'`)](/en-US/docs/Web/JavaScript/Reference/Global_Objects/RegExp/rightContext)
- [`RegExp.$1`, …, `RegExp.$9`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/RegExp/n)
