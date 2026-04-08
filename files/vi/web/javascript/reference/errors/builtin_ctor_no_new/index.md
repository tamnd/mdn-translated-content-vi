---
title: "TypeError: calling a builtin X constructor without new is forbidden"
slug: Web/JavaScript/Reference/Errors/Builtin_ctor_no_new
page-type: javascript-error
sidebar: jssidebar
---

Ngoại lệ JavaScript "calling a builtin X constructor without new is forbidden" xảy ra khi bạn cố gắng gọi một constructor tích hợp mà không sử dụng từ khóa {{jsxref("Operators/new", "new")}}. Tất cả các constructor hiện đại, chẳng hạn như {{jsxref("Promise")}} và {{jsxref("Map")}}, phải được gọi với `new`.

## Thông báo

```plain
TypeError: Constructor X requires 'new' (V8-based)
TypeError: Promise constructor cannot be invoked without 'new' (V8-based)
TypeError: calling a builtin X constructor without new is forbidden (Firefox)
TypeError: calling X constructor without new is invalid (Safari)
```

## Loại lỗi

{{jsxref("TypeError")}}

## Nguyên nhân?

Trong JavaScript, _gọi_ một hàm mà không có `new` và _xây dựng_ một hàm với `new` là hai hoạt động khác nhau, và các hàm có thể hoạt động khác nhau tùy thuộc vào cách chúng được gọi.

Ngoài các constructor kế thừa sau đây, tất cả các constructor hiện đại phải được gọi với `new`:

- {{jsxref("Object/Object", "Object()")}}
- {{jsxref("Function/Function", "Function()")}} (và các lớp con của nó)
- {{jsxref("Error/Error", "Error()")}} (và các lớp con của nó)
- {{jsxref("RegExp/RegExp", "RegExp()")}}
- {{jsxref("Array/Array", "Array()")}}

Một số constructor khác, chẳng hạn như {{jsxref("Date/Date", "Date()")}}, và các wrapper nguyên thủy, chẳng hạn như {{jsxref("String/String", "String()")}}, {{jsxref("Number/Number", "Number()")}}, và {{jsxref("Boolean/Boolean", "Boolean()")}}, cũng có thể được gọi có hoặc không có `new`, nhưng các kiểu trả về khác nhau trong hai trường hợp.

Trên mỗi trang constructor, bạn có thể tìm thấy thông tin về việc constructor có phải được gọi với `new` hay không.

## Ví dụ

### Trường hợp không hợp lệ

```js example-bad
const m = Map(); // TypeError: calling a builtin Map constructor without new is forbidden
```

### Trường hợp hợp lệ

```js example-good
const m = new Map();
```

## Xem thêm

- {{jsxref("Operators/new", "new")}}
