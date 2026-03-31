---
title: Empty statement
slug: Web/JavaScript/Reference/Statements/Empty
page-type: javascript-statement
browser-compat: javascript.statements.empty
sidebar: jssidebar
---

**Câu lệnh rỗng** được dùng để không cung cấp câu lệnh nào, mặc dù cú pháp JavaScript yêu cầu phải có một câu lệnh.

{{InteractiveExample("JavaScript Demo: Empty statement")}}

```js interactive-example
const array = [1, 2, 3];

// Assign all array values to 0
for (let i = 0; i < array.length; array[i++] = 0 /* empty statement */);

console.log(array);
// Expected output: Array [0, 0, 0]
```

## Cú pháp

```js-nolint
;
```

## Mô tả

Câu lệnh rỗng là một dấu chấm phẩy (`;`) biểu thị rằng không có câu lệnh nào sẽ được thực thi, ngay cả khi cú pháp JavaScript yêu cầu phải có một câu lệnh.

Hành vi ngược lại, khi bạn muốn nhiều câu lệnh nhưng JavaScript chỉ cho phép một câu lệnh duy nhất, có thể thực hiện bằng [câu lệnh block](/en-US/docs/Web/JavaScript/Reference/Statements/block), câu lệnh này kết hợp nhiều câu lệnh thành một câu lệnh duy nhất.

## Ví dụ

### Thân vòng lặp rỗng

Câu lệnh rỗng đôi khi được dùng với các câu lệnh vòng lặp. Xem ví dụ sau với thân vòng lặp rỗng:

```js-nolint
const arr = [1, 2, 3];

// Assign all array values to 0
for (let i = 0; i < arr.length; arr[i++] = 0) /* empty statement */ ;

console.log(arr);
// [0, 0, 0]
```

### Sử dụng ngoài ý muốn

Bạn nên chú thích khi _cố ý_ dùng câu lệnh rỗng, vì thực sự khó phân biệt nó với một dấu chấm phẩy bình thường.

Trong ví dụ sau, cách dùng có lẽ không phải cố ý:

```js-nolint example-bad
if (condition);      // Caution, this "if" does nothing!
  killTheUniverse(); // So this always gets executed!!!
```

## Thông số kỹ thuật

{{Specifications}}

## Khả năng tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Block statement](/en-US/docs/Web/JavaScript/Reference/Statements/block)
