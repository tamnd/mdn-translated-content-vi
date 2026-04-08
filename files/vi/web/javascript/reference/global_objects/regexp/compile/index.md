---
title: RegExp.prototype.compile()
short-title: compile()
slug: Web/JavaScript/Reference/Global_Objects/RegExp/compile
page-type: javascript-instance-method
status:
  - deprecated
browser-compat: javascript.builtins.RegExp.compile
sidebar: jsref
---

{{Deprecated_Header}}

> [!NOTE]
> Phương thức `compile()` chỉ được quy định vì lý do tương thích. Việc sử dụng `compile()` khiến source và flags của regex vốn là bất biến trở nên có thể thay đổi, điều này có thể làm người dùng bất ngờ. Thay vào đó, bạn có thể dùng constructor [`RegExp()`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/RegExp/RegExp) để tạo một đối tượng regular expression mới.

Phương thức **`compile()`** của các instance {{jsxref("RegExp")}} được dùng để biên dịch lại một regular expression với source và flags mới sau khi đối tượng `RegExp` đã được tạo.

## Cú pháp

```js-nolint
compile(pattern, flags)
```

### Tham số

- `pattern`
  - : Văn bản của regular expression.
- `flags`
  - : Bất kỳ tổ hợp nào của [các giá trị flag](/en-US/docs/Web/JavaScript/Reference/Global_Objects/RegExp/RegExp#flags).

### Giá trị trả về

Không có ({{jsxref("undefined")}}).

### Ngoại lệ

- {{jsxref("TypeError")}}
  - : Được ném ra nếu giá trị `this` không phải là instance của constructor `RegExp` trong realm hiện tại. Bao gồm cả subclass của `RegExp` và constructor `RegExp` từ realm khác.

## Ví dụ

### Sử dụng compile()

Ví dụ sau đây minh họa cách biên dịch lại một regular expression với pattern và flag mới.

```js
const regexObj = /foo/gi;
regexObj.compile("new foo", "g");
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{jsxref("RegExp")}}
