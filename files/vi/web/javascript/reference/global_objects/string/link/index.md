---
title: String.prototype.link()
short-title: link()
slug: Web/JavaScript/Reference/Global_Objects/String/link
page-type: javascript-instance-method
status:
  - deprecated
browser-compat: javascript.builtins.String.link
sidebar: jsref
---

{{Deprecated_Header}}

Phương thức **`link()`** của các giá trị {{jsxref("String")}} tạo ra một chuỗi nhúng chuỗi này vào trong phần tử {{HTMLElement("a")}} (`<a href="...">str</a>`), để sử dụng làm liên kết hypertext đến một URL khác.

> [!NOTE]
> Tất cả [các phương thức bọc HTML](/en-US/docs/Web/JavaScript/Reference/Global_Objects/String#html_wrapper_methods) đều đã bị deprecated và chỉ được chuẩn hóa cho mục đích tương thích. Hãy sử dụng [DOM APIs](/en-US/docs/Web/API/Document_Object_Model) như [`document.createElement()`](/en-US/docs/Web/API/Document/createElement) thay thế.

## Cú pháp

```js-nolint
link(url)
```

### Tham số

- `url`
  - : Bất kỳ chuỗi nào chỉ định thuộc tính `href` của phần tử `<a>`; nó phải là một URL hợp lệ (tương đối hoặc tuyệt đối), với các ký tự `&` được escape thành `&amp;`.

### Giá trị trả về

Một chuỗi bắt đầu bằng thẻ mở `<a href="url">` (dấu ngoặc kép trong `url` được thay thế bằng `&quot;`), sau đó là văn bản `str`, và cuối cùng là thẻ đóng `</a>`.

## Ví dụ

### Sử dụng link()

Đoạn code dưới đây tạo ra một chuỗi HTML rồi thay thế nội dung body của document bằng chuỗi đó:

```js
const contentString = "MDN Web Docs";

document.body.innerHTML = contentString.link("https://developer.mozilla.org/");
```

Đoạn code này sẽ tạo ra HTML sau:

```html
<a href="https://developer.mozilla.org/">MDN Web Docs</a>
```

Thay vì sử dụng `link()` và tạo văn bản HTML trực tiếp, bạn nên sử dụng DOM APIs như [`document.createElement()`](/en-US/docs/Web/API/Document/createElement). Ví dụ:

```js
const contentString = "MDN Web Docs";
const elem = document.createElement("a");
elem.href = "https://developer.mozilla.org/";
elem.innerText = contentString;
document.body.appendChild(elem);
```

## Đặc tả

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Polyfill của `String.prototype.link` trong `core-js`](https://github.com/zloirock/core-js#ecmascript-string-and-regexp)
- [Polyfill es-shims của `String.prototype.link`](https://www.npmjs.com/package/es-string-html-methods)
- [Các phương thức bọc HTML](/en-US/docs/Web/JavaScript/Reference/Global_Objects/String#html_wrapper_methods)
- {{HTMLElement("a")}}
