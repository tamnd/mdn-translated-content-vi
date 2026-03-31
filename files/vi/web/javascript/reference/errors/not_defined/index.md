---
title: 'ReferenceError: "x" is not defined'
slug: Web/JavaScript/Reference/Errors/Not_defined
page-type: javascript-error
sidebar: jssidebar
---

Ngoại lệ JavaScript "_variable_ is not defined" xảy ra khi có tham chiếu đến một biến không tồn tại ở đâu đó.

## Thông báo

```plain
ReferenceError: "x" is not defined (V8-based & Firefox)
ReferenceError: Can't find variable: x (Safari)
```

## Loại lỗi

{{jsxref("ReferenceError")}}.

## Nguyên nhân?

Có tham chiếu đến một biến không tồn tại ở đâu đó. Biến này cần được khai báo, hoặc bạn cần đảm bảo rằng nó có sẵn trong script hoặc [scope](/en-US/docs/Glossary/Scope) hiện tại của bạn.

> [!NOTE]
> Khi tải một thư viện (chẳng hạn như jQuery), hãy đảm bảo rằng nó được tải trước khi bạn truy cập các biến của thư viện, chẳng hạn như "$". Đặt phần tử {{HTMLElement("script")}} tải thư viện trước code sử dụng nó.

## Ví dụ

### Biến chưa được khai báo

```js example-bad
foo.substring(1); // ReferenceError: foo is not defined
```

Biến "foo" chưa được định nghĩa ở bất kỳ đâu. Nó cần là một chuỗi để phương thức {{jsxref("String.prototype.substring()")}} hoạt động.

```js example-good
const foo = "bar";
foo.substring(1); // "ar"
```

### Sai scope

Một biến cần có sẵn trong ngữ cảnh thực thi hiện tại. Các biến được định nghĩa bên trong một [hàm](/en-US/docs/Web/JavaScript/Reference/Functions) không thể được truy cập từ bên ngoài hàm, vì biến chỉ được định nghĩa trong scope của hàm.

```js example-bad
function numbers() {
  const num1 = 2;
  const num2 = 3;
  return num1 + num2;
}

console.log(num1); // ReferenceError num1 is not defined.
```

Tuy nhiên, một hàm có thể truy cập tất cả các biến và hàm được định nghĩa trong scope mà nó được định nghĩa. Nói cách khác, một hàm được định nghĩa trong scope toàn cục có thể truy cập tất cả các biến được định nghĩa trong scope toàn cục.

```js example-good
const num1 = 2;
const num2 = 3;

function numbers() {
  return num1 + num2;
}

console.log(numbers()); // 5
```

## Xem thêm

- [Scope](/en-US/docs/Glossary/Scope)
- [Khai báo biến trong hướng dẫn JavaScript](/en-US/docs/Web/JavaScript/Guide/Grammar_and_types#declaring_variables)
- [Function scope trong hướng dẫn JavaScript](/en-US/docs/Web/JavaScript/Guide/Functions#function_scopes_and_closures)
