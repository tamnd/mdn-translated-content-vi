---
title: "Function: displayName"
short-title: displayName
slug: Web/JavaScript/Reference/Global_Objects/Function/displayName
page-type: javascript-instance-data-property
status:
  - non-standard
browser-compat: javascript.builtins.Function.displayName
sidebar: jsref
---

{{Non-standard_Header}}

Thuộc tính tùy chọn **`displayName`** của một instance {{jsxref("Function")}} xác định tên hiển thị của hàm.

## Value

Thuộc tính `displayName` ban đầu không có trên bất kỳ hàm nào — nó được thêm vào bởi các tác giả code. Để hiển thị, nó nên là một chuỗi.

## Description

Thuộc tính `displayName`, nếu có, có thể được console và profiler ưu tiên hơn thuộc tính {{jsxref("Function/name", "name")}} để hiển thị tên của hàm.

Trong số các trình duyệt, chỉ có console của Firefox sử dụng thuộc tính này. React devtools cũng sử dụng thuộc tính [`displayName`](https://legacy.reactjs.org/docs/higher-order-components.html#convention-wrap-the-display-name-for-easy-debugging) khi hiển thị cây component.

Firefox thực hiện một số thao tác giải mã cơ bản đối với `displayName` có thể được tạo ra bởi thuật toán [anonymous JavaScript functions naming convention](https://johnjbarton.github.io/nonymous/index.html). Các mẫu sau được phát hiện:

- Nếu `displayName` kết thúc bằng một chuỗi ký tự chữ-số, `_`, và `$`, hậu tố dài nhất như vậy sẽ được hiển thị.
- Nếu `displayName` kết thúc bằng một chuỗi ký tự được bao trong `[]`, chuỗi đó được hiển thị mà không có dấu ngoặc vuông.
- Nếu `displayName` kết thúc bằng một chuỗi ký tự chữ-số và `_` theo sau là một số `/`, `.`, hoặc `<`, chuỗi được trả về mà không có các ký tự cuối `/`, `.`, hoặc `<`.
- Nếu `displayName` kết thúc bằng một chuỗi ký tự chữ-số và `_` theo sau là `(^)`, chuỗi được hiển thị mà không có `(^)`.

Nếu không có mẫu nào ở trên khớp, toàn bộ `displayName` sẽ được hiển thị.

## Examples

### Đặt displayName

Bằng cách nhập nội dung sau vào console Firefox, nó sẽ hiển thị dạng `function MyFunction()`:

```js
function a() {}
a.displayName = "MyFunction";

a; // function MyFunction()
```

### Thay đổi displayName động

Bạn có thể thay đổi `displayName` của một hàm một cách động:

```js
const object = {
  // anonymous
  someMethod: function someMethod(value) {
    someMethod.displayName = `someMethod (${value})`;
  },
};

console.log(object.someMethod.displayName); // undefined

object.someMethod("123");
console.log(object.someMethod.displayName); // "someMethod (123)"
```

### Làm sạch displayName

Firefox devtools sẽ làm sạch một số mẫu phổ biến trong thuộc tính `displayName` trước khi hiển thị.

```js
function foo() {}

function testName(name) {
  foo.displayName = name;
  console.log(foo);
}

testName("$foo$"); // function $foo$()
testName("foo bar"); // function bar()
testName("Foo.prototype.add"); // function add()
testName("foo ."); // function foo .()
testName("foo <"); // function foo <()
testName("foo?"); // function foo?()
testName("foo()"); // function foo()()

testName("[...]"); // function ...()
testName("foo<"); // function foo()
testName("foo..."); // function foo()
testName("foo(^)"); // function foo()
```

## Specifications

Không phải là một phần của bất kỳ tiêu chuẩn nào.

## Browser compatibility

{{Compat}}

## See also

- {{jsxref("Function.prototype.name")}}
