---
title: "TypeError: matchAll/replaceAll must be called with a global RegExp"
slug: Web/JavaScript/Reference/Errors/Requires_global_RegExp
page-type: javascript-error
sidebar: jssidebar
---

Ngoại lệ JavaScript "TypeError: matchAll/replaceAll must be called with a global RegExp" xảy ra khi phương thức {{jsxref("String.prototype.matchAll()")}} hoặc {{jsxref("String.prototype.replaceAll()")}} được sử dụng với một đối tượng {{jsxref("RegExp")}} không có cờ {{jsxref("RegExp/global", "global")}} được đặt.

## Thông báo

```plain
TypeError: String.prototype.matchAll called with a non-global RegExp argument (V8-based)
TypeError: String.prototype.replaceAll called with a non-global RegExp argument (V8-based)
TypeError: matchAll must be called with a global RegExp (Firefox)
TypeError: replaceAll must be called with a global RegExp (Firefox)
TypeError: String.prototype.matchAll argument must not be a non-global regular expression (Safari)
TypeError: String.prototype.replaceAll argument must not be a non-global regular expression (Safari)
```

## Loại lỗi

{{jsxref("TypeError")}}

## Điều gì đã xảy ra?

Các phương thức {{jsxref("String.prototype.matchAll()")}} và {{jsxref("String.prototype.replaceAll()")}} yêu cầu một đối tượng {{jsxref("RegExp")}} với cờ {{jsxref("RegExp/global", "global")}} được đặt. Cờ này chỉ ra rằng biểu thức chính quy có thể khớp với tất cả các vị trí của chuỗi đầu vào, thay vì dừng lại ở kết quả khớp đầu tiên. Mặc dù cờ `g` là thừa khi sử dụng các phương thức này (vì các phương thức này luôn thực hiện thay thế toàn cục), chúng vẫn được yêu cầu để làm rõ ý định.

Điều đáng chú ý là việc kiểm tra cờ `g` được thực hiện trong các phương thức `matchAll` và `replaceAll`. Nếu bạn sử dụng phương thức [`[Symbol.matchAll]()`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/RegExp/Symbol.matchAll) của `RegExp` thay thế, bạn sẽ không gặp lỗi này, nhưng sẽ chỉ có một kết quả khớp duy nhất.

## Ví dụ

### Các trường hợp không hợp lệ

```js example-bad
"abc".matchAll(/./); // TypeError
"abc".replaceAll(/./, "f"); // TypeError
```

### Các trường hợp hợp lệ

Nếu bạn muốn thực hiện khớp/thay thế toàn cục: hãy thêm cờ `g`, hoặc tạo một đối tượng `RegExp` mới với cờ `g`, nếu bạn muốn giữ nguyên regex gốc.

```js example-good
[..."abc".matchAll(/./g)]; // [[ "a" ], [ "b" ], [ "c" ]]
"abc".replaceAll(/./g, "f"); // "fff"

const existingPattern = /./;
const newPattern = new RegExp(
  existingPattern.source,
  `${existingPattern.flags}g`,
);
"abc".replaceAll(newPattern, "f"); // "fff"
```

Nếu bạn chỉ muốn thực hiện một lần khớp/thay thế: hãy sử dụng {{jsxref("String.prototype.match()")}} hoặc {{jsxref("String.prototype.replace()")}} thay thế. Bạn cũng có thể sử dụng phương thức `[Symbol.matchAll]()` nếu bạn muốn một iterator như `matchAll` trả về chỉ chứa một kết quả khớp, nhưng làm vậy sẽ rất khó hiểu.

```js example-good
"abc".match(/./); // [ "a" ]
"abc".replace(/./, "f"); // "fbc"

[..././[Symbol.matchAll]("abc")]; // [[ "a" ]]
```

## Xem thêm

- {{jsxref("String.prototype.matchAll()")}}
- {{jsxref("String.prototype.replaceAll()")}}
- {{jsxref("RegExp.prototype.global")}}
