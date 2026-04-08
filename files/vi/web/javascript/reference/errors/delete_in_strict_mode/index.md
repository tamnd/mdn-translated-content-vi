---
title: "SyntaxError: applying the 'delete' operator to an unqualified name is deprecated"
slug: Web/JavaScript/Reference/Errors/Delete_in_strict_mode
page-type: javascript-error
sidebar: jssidebar
---

Ngoại lệ JavaScript chỉ xảy ra trong [chế độ nghiêm ngặt](/en-US/docs/Web/JavaScript/Reference/Strict_mode) "applying the 'delete' operator to an unqualified name is deprecated" xảy ra khi cố gắng xóa biến bằng toán tử [`delete`](/en-US/docs/Web/JavaScript/Reference/Operators/delete).

## Thông báo

```plain
SyntaxError: Delete of an unqualified identifier in strict mode. (V8-based)
SyntaxError: applying the 'delete' operator to an unqualified name is deprecated (Firefox)
SyntaxError: Cannot delete unqualified property 'a' in strict mode. (Safari)
```

## Loại lỗi

{{jsxref("SyntaxError")}} chỉ trong [chế độ nghiêm ngặt](/en-US/docs/Web/JavaScript/Reference/Strict_mode).

## Nguyên nhân?

Các biến thông thường trong JavaScript không thể bị xóa bằng toán tử [`delete`](/en-US/docs/Web/JavaScript/Reference/Operators/delete). Trong chế độ nghiêm ngặt, việc cố gắng xóa một biến sẽ ném ra lỗi và không được phép.

Toán tử `delete` chỉ có thể xóa các thuộc tính trên một đối tượng. Các thuộc tính của đối tượng được gọi là "qualified" nếu chúng có thể cấu hình được.

Trái với niềm tin phổ biến, toán tử `delete` **không liên quan gì** đến việc trực tiếp giải phóng bộ nhớ. Quản lý bộ nhớ được thực hiện gián tiếp thông qua việc ngắt các tham chiếu, xem trang [quản lý bộ nhớ](/en-US/docs/Web/JavaScript/Guide/Memory_management) và trang toán tử [`delete`](/en-US/docs/Web/JavaScript/Reference/Operators/delete) để biết thêm chi tiết.

Lỗi này chỉ xảy ra trong [mã chế độ nghiêm ngặt](/en-US/docs/Web/JavaScript/Reference/Strict_mode). Trong mã không nghiêm ngặt, thao tác chỉ trả về `false`.

## Ví dụ

### Giải phóng nội dung của một biến

Việc cố gắng xóa một biến thông thường sẽ ném ra lỗi trong chế độ nghiêm ngặt:

```js-nolint example-bad
"use strict";

var x;

// …

delete x;

// SyntaxError: applying the 'delete' operator to an unqualified name
// is deprecated
```

Để giải phóng nội dung của một biến, bạn có thể đặt nó thành [`null`](/en-US/docs/Web/JavaScript/Reference/Operators/null):

```js example-good
"use strict";

var x;

// …

x = null;

// x có thể được thu gom rác
```

## Xem thêm

- [`delete`](/en-US/docs/Web/JavaScript/Reference/Operators/delete)
- [Memory management](/en-US/docs/Web/JavaScript/Guide/Memory_management)
- [TypeError: property "x" is non-configurable and can't be deleted](/en-US/docs/Web/JavaScript/Reference/Errors/Cant_delete)
