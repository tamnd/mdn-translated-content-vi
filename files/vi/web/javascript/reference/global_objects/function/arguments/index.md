---
title: Function.prototype.arguments
short-title: arguments
slug: Web/JavaScript/Reference/Global_Objects/Function/arguments
page-type: javascript-instance-accessor-property
status:
  - deprecated
  - non-standard
browser-compat: javascript.builtins.Function.arguments
sidebar: jsref
---

{{Deprecated_Header}}{{Non-standard_Header}}

> [!NOTE]
> Thuộc tính `arguments` của các đối tượng {{jsxref("Function")}} đã bị deprecated. Cách được khuyến nghị để truy cập đối tượng `arguments` là tham chiếu đến biến {{jsxref("Functions/arguments", "arguments")}} có sẵn bên trong các hàm.

Accessor property **`arguments`** của các instance {{jsxref("Function")}} trả về các đối số được truyền vào hàm này. Đối với các hàm [strict](/en-US/docs/Web/JavaScript/Reference/Strict_mode), arrow, async, và generator, việc truy cập thuộc tính `arguments` sẽ ném ra {{jsxref("TypeError")}}.

## Mô tả

Giá trị của `arguments` là một đối tượng dạng mảng tương ứng với các đối số được truyền vào hàm.

Trong trường hợp đệ quy, tức là nếu hàm `f` xuất hiện nhiều lần trên call stack, giá trị của `f.arguments` đại diện cho các đối số tương ứng với lần gọi gần nhất của hàm.

Giá trị của thuộc tính `arguments` thường là {{jsxref("Operators/null", "null")}} nếu không có lần gọi nào đang thực thi của hàm (tức là hàm đã được gọi nhưng chưa trả về).

Lưu ý rằng hành vi duy nhất được đặc tả bởi ECMAScript specification là `Function.prototype` có một accessor `arguments` ban đầu luôn ném ra {{jsxref("TypeError")}} cho bất kỳ yêu cầu `get` hay `set` nào (được gọi là "poison pill accessor"), và các implementation không được phép thay đổi ngữ nghĩa này cho bất kỳ hàm nào ngoài các hàm plain function không phải strict mode. Hành vi thực tế của thuộc tính `arguments`, nếu nó khác với việc ném lỗi, được định nghĩa bởi từng implementation. Ví dụ, Chrome định nghĩa nó là own data property, trong khi Firefox và Safari mở rộng accessor poison-pill `Function.prototype.arguments` ban đầu để xử lý đặc biệt các giá trị `this` là hàm không phải strict mode.

```js
(function f() {
  if (Object.hasOwn(f, "arguments")) {
    console.log(
      "arguments is an own property with descriptor",
      Object.getOwnPropertyDescriptor(f, "arguments"),
    );
  } else {
    console.log(
      "f doesn't have an own property named arguments. Trying to get f.[[Prototype]].arguments",
    );
    console.log(
      Object.getOwnPropertyDescriptor(
        Object.getPrototypeOf(f),
        "arguments",
      ).get.call(f),
    );
  }
})();

// In Chrome:
// arguments is an own property with descriptor {value: Arguments(0), writable: false, enumerable: false, configurable: false}

// In Firefox:
// f doesn't have an own property named arguments. Trying to get f.[[Prototype]].arguments
// Arguments { … }
```

## Ví dụ

### Sử dụng thuộc tính arguments

```js
function f(n) {
  g(n - 1);
}

function g(n) {
  console.log(`before: ${g.arguments[0]}`);
  if (n > 0) {
    f(n);
  }
  console.log(`after: ${g.arguments[0]}`);
}

f(2);

console.log(`returned: ${g.arguments}`);

// Logs:
// before: 1
// before: 0
// after: 0
// after: 1
// returned: null
```

## Đặc tả kỹ thuật

Không thuộc bất kỳ tiêu chuẩn nào.

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{jsxref("Functions/arguments", "arguments")}}
- [Functions](/en-US/docs/Web/JavaScript/Reference/Functions)
