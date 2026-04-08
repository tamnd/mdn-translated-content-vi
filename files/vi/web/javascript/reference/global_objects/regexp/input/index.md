---
title: RegExp.input ($_)
short-title: input ($_)
slug: Web/JavaScript/Reference/Global_Objects/RegExp/input
page-type: javascript-static-accessor-property
status:
  - deprecated
browser-compat: javascript.builtins.RegExp.input
sidebar: jsref
---

{{Deprecated_Header}}

> [!NOTE]
> Tất cả các thuộc tính tĩnh của `RegExp` hiển thị trạng thái khớp cuối cùng trên toàn cục đều đã bị deprecated. Xem [các tính năng RegExp deprecated](/en-US/docs/Web/JavaScript/Reference/Deprecated_and_obsolete_features#regexp) để biết thêm thông tin.

Thuộc tính accessor tĩnh **`RegExp.input`** trả về chuỗi mà regular expression được khớp với. `RegExp.$_` là bí danh của thuộc tính này.

## Mô tả

Vì `input` là thuộc tính tĩnh của {{jsxref("RegExp")}}, bạn luôn dùng nó như `RegExp.input` hoặc `RegExp.$_`, thay vì như thuộc tính của một đối tượng `RegExp` bạn đã tạo.

Giá trị của `input` cập nhật mỗi khi một instance `RegExp` (nhưng không phải subclass của `RegExp`) tạo ra một khớp thành công. Nếu chưa có khớp nào được thực hiện, `input` là một chuỗi rỗng. Bạn có thể đặt giá trị của `input`, nhưng điều này không ảnh hưởng đến các hành vi khác của regex, và giá trị sẽ bị ghi đè lại khi lần khớp thành công tiếp theo xảy ra.

## Ví dụ

### Sử dụng input và $\_

```js
const re = /hi/g;
re.test("hi there!");
RegExp.input; // "hi there!"
re.test("foo"); // new test, non-matching
RegExp.$_; // "hi there!"
re.test("hi world!"); // new test, matching
RegExp.$_; // "hi world!"
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [`RegExp.lastMatch` (`$&`)](/en-US/docs/Web/JavaScript/Reference/Global_Objects/RegExp/lastMatch)
- [`RegExp.lastParen` (`$+`)](/en-US/docs/Web/JavaScript/Reference/Global_Objects/RegExp/lastParen)
- [`RegExp.leftContext` (`` $` ``)](/en-US/docs/Web/JavaScript/Reference/Global_Objects/RegExp/leftContext)
- [`RegExp.rightContext` (`$'`)](/en-US/docs/Web/JavaScript/Reference/Global_Objects/RegExp/rightContext)
- [`RegExp.$1`, …, `RegExp.$9`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/RegExp/n)
