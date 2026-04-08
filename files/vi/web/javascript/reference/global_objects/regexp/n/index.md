---
title: RegExp.$1, …, RegExp.$9
short-title: $1, …, $9
slug: Web/JavaScript/Reference/Global_Objects/RegExp/n
page-type: javascript-static-accessor-property
status:
  - deprecated
browser-compat: javascript.builtins.RegExp.n
sidebar: jsref
---

{{Deprecated_Header}}

> [!NOTE]
> Tất cả các thuộc tính tĩnh của `RegExp` hiển thị trạng thái khớp cuối cùng trên toàn cục đều đã bị deprecated. Xem [các tính năng RegExp deprecated](/en-US/docs/Web/JavaScript/Reference/Deprecated_and_obsolete_features#regexp) để biết thêm thông tin.

Các thuộc tính accessor tĩnh **`RegExp.$1, …, RegExp.$9`** trả về các chuỗi con khớp trong ngoặc đơn.

## Mô tả

Vì `$1`–`$9` là các thuộc tính tĩnh của {{jsxref("RegExp")}}, bạn luôn dùng chúng như `RegExp.$1`, `RegExp.$2`, v.v., thay vì như thuộc tính của một đối tượng `RegExp` bạn đã tạo.

Giá trị của `$1, …, $9` cập nhật mỗi khi một instance `RegExp` (nhưng không phải subclass của `RegExp`) tạo ra một khớp thành công. Nếu chưa có khớp nào được thực hiện, hoặc nếu lần khớp cuối không có capturing group tương ứng, thuộc tính đó là một chuỗi rỗng. Set accessor của mỗi thuộc tính là `undefined`, vì vậy bạn không thể thay đổi các thuộc tính này trực tiếp.

Số lượng chuỗi con trong ngoặc đơn có thể là không giới hạn, nhưng đối tượng `RegExp` chỉ có thể lưu chín cái đầu tiên. Bạn có thể truy cập tất cả các chuỗi con trong ngoặc đơn thông qua chỉ mục của mảng được trả về.

`$1, …, $9` cũng có thể được dùng trong chuỗi thay thế của {{jsxref("String.prototype.replace()")}}, nhưng điều đó không liên quan đến các thuộc tính legacy `RegExp.$n`.

## Ví dụ

### Sử dụng $n với RegExp.prototype.test()

Script sau sử dụng phương thức {{jsxref("RegExp.prototype.test()")}} để lấy một số trong một chuỗi tổng quát.

```js
const str = "Test 24";
const number = /(\d+)/.test(str) ? RegExp.$1 : "0";
number; // "24"
```

Lưu ý rằng bất kỳ thao tác nào liên quan đến việc sử dụng các regular expression khác giữa lời gọi `re.test(str)` và thuộc tính `RegExp.$n` đều có thể có tác dụng phụ, vì vậy việc truy cập các thuộc tính đặc biệt này cần được thực hiện ngay lập tức, nếu không kết quả có thể không như mong đợi.

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [`RegExp.input` (`$_`)](/en-US/docs/Web/JavaScript/Reference/Global_Objects/RegExp/input)
- [`RegExp.lastMatch` (`$&`)](/en-US/docs/Web/JavaScript/Reference/Global_Objects/RegExp/lastMatch)
- [`RegExp.lastParen` (`$+`)](/en-US/docs/Web/JavaScript/Reference/Global_Objects/RegExp/lastParen)
- [`RegExp.leftContext` (`` $` ``)](/en-US/docs/Web/JavaScript/Reference/Global_Objects/RegExp/leftContext)
- [`RegExp.rightContext` (`$'`)](/en-US/docs/Web/JavaScript/Reference/Global_Objects/RegExp/rightContext)
