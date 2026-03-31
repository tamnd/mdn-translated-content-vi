---
title: String.prototype.blink()
short-title: blink()
slug: Web/JavaScript/Reference/Global_Objects/String/blink
page-type: javascript-instance-method
status:
  - deprecated
browser-compat: javascript.builtins.String.blink
sidebar: jsref
---

{{Deprecated_Header}}

Phương thức **`blink()`** của các giá trị {{jsxref("String")}} tạo ra một chuỗi nhúng chuỗi này vào trong phần tử `<blink>` (`<blink>str</blink>`), phần tử này trước đây khiến chuỗi nhấp nháy trên các trình duyệt cũ.

> [!NOTE]
> Tất cả [các phương thức bọc HTML](/en-US/docs/Web/JavaScript/Reference/Global_Objects/String#html_wrapper_methods) đều đã bị deprecated và chỉ được chuẩn hóa cho mục đích tương thích. Đối với trường hợp của `blink()`, bản thân phần tử `<blink>` đã bị loại bỏ khỏi các trình duyệt hiện đại, và văn bản nhấp nháy bị coi là xấu theo một số tiêu chuẩn khả năng tiếp cận. Hãy tránh sử dụng phần tử này theo bất kỳ cách nào.

## Cú pháp

```js-nolint
blink()
```

### Tham số

Không có.

### Giá trị trả về

Một chuỗi bắt đầu bằng thẻ mở `<blink>`, sau đó là văn bản `str`, và cuối cùng là thẻ đóng `</blink>`.

## Ví dụ

### Sử dụng blink()

Đoạn code dưới đây tạo ra một chuỗi HTML rồi thay thế nội dung body của document bằng chuỗi đó:

```js
const contentString = "Hello, world";

document.body.innerHTML = contentString.blink();
```

Đoạn code này sẽ tạo ra HTML sau:

```html
<blink>Hello, world</blink>
```

> [!WARNING]
> Markup này không hợp lệ, vì `blink` không còn là phần tử hợp lệ nữa.

Bạn nên tránh hoàn toàn việc sử dụng các phần tử nhấp nháy.

## Đặc tả

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Polyfill của `String.prototype.blink` trong `core-js`](https://github.com/zloirock/core-js#ecmascript-string-and-regexp)
- [Polyfill es-shims của `String.prototype.blink`](https://www.npmjs.com/package/es-string-html-methods)
- [Các phương thức bọc HTML](/en-US/docs/Web/JavaScript/Reference/Global_Objects/String#html_wrapper_methods)
