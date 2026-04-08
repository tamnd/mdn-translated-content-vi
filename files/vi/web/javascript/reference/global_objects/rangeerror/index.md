---
title: RangeError
slug: Web/JavaScript/Reference/Global_Objects/RangeError
page-type: javascript-class
browser-compat: javascript.builtins.RangeError
sidebar: jsref
---

Đối tượng **`RangeError`** chỉ ra một lỗi khi một giá trị không nằm trong tập hợp hoặc phạm vi các giá trị được phép.

## Mô tả

`RangeError` được ném ra khi cố gắng truyền một giá trị làm đối số cho một hàm mà không cho phép phạm vi bao gồm giá trị đó.

Điều này có thể xảy ra khi:

- truyền một giá trị không phải là một trong các giá trị chuỗi được phép vào {{jsxref("String.prototype.normalize()")}}, hoặc
- khi cố gắng tạo một mảng có độ dài không hợp lệ bằng constructor {{jsxref("Array")}}, hoặc
- khi truyền các giá trị xấu vào các phương thức số {{jsxref("Number.prototype.toExponential()")}}, {{jsxref("Number.prototype.toFixed()")}} hoặc {{jsxref("Number.prototype.toPrecision()")}}.

`RangeError` là một {{Glossary("serializable object")}}, vì vậy nó có thể được nhân bản với {{DOMxRef("Window.structuredClone", "structuredClone()")}} hoặc sao chép giữa các [Worker](/en-US/docs/Web/API/Worker) bằng cách sử dụng {{domxref("Worker/postMessage()", "postMessage()")}}.

`RangeError` là lớp con của {{jsxref("Error")}}.

## Constructor

- {{jsxref("RangeError/RangeError", "RangeError()")}}
  - : Tạo một đối tượng `RangeError` mới.

## Thuộc tính instance

_Cũng kế thừa các thuộc tính instance từ lớp cha {{jsxref("Error")}}_.

Các thuộc tính này được định nghĩa trên `RangeError.prototype` và được chia sẻ bởi tất cả các instance `RangeError`.

- {{jsxref("Object/constructor", "RangeError.prototype.constructor")}}
  - : Hàm constructor đã tạo ra đối tượng instance. Đối với các instance `RangeError`, giá trị khởi tạo là constructor {{jsxref("RangeError/RangeError", "RangeError")}}.
- {{jsxref("Error/name", "RangeError.prototype.name")}}
  - : Đại diện cho tên của loại lỗi. Đối với `RangeError.prototype.name`, giá trị khởi tạo là `"RangeError"`.

## Phương thức instance

_Kế thừa các phương thức instance từ lớp cha {{jsxref("Error")}}_.

## Ví dụ

### Sử dụng RangeError (cho giá trị số)

```js
function check(n) {
  if (!(n >= -500 && n <= 500)) {
    throw new RangeError("The argument must be between -500 and 500.");
  }
}

try {
  check(2000);
} catch (error) {
  if (error instanceof RangeError) {
    // Handle the error
  }
}
```

### Sử dụng RangeError (cho giá trị không phải số)

```js
function check(value) {
  if (!["apple", "banana", "carrot"].includes(value)) {
    throw new RangeError(
      'The argument must be an "apple", "banana", or "carrot".',
    );
  }
}

try {
  check("cabbage");
} catch (error) {
  if (error instanceof RangeError) {
    // Handle the error
  }
}
```

## Đặc tả kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{jsxref("Error")}}
- {{jsxref("Array")}}
- {{jsxref("Number.prototype.toExponential()")}}
- {{jsxref("Number.prototype.toFixed()")}}
- {{jsxref("Number.prototype.toPrecision()")}}
- {{jsxref("String.prototype.normalize()")}}
