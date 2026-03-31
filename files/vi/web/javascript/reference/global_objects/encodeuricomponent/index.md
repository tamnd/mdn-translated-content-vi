---
title: encodeURIComponent()
slug: Web/JavaScript/Reference/Global_Objects/encodeURIComponent
page-type: javascript-function
browser-compat: javascript.builtins.encodeURIComponent
sidebar: jssidebar
---

Hàm **`encodeURIComponent()`** mã hóa một {{Glossary("URI")}} bằng cách thay thế mỗi trường hợp của một số ký tự nhất định bằng một, hai, ba hoặc bốn chuỗi thoát biểu thị mã hóa {{Glossary("UTF-8")}} của ký tự đó (chỉ có bốn chuỗi thoát cho các ký tự được tạo thành từ hai ký tự thay thế). So với {{jsxref("encodeURI()")}}, hàm này mã hóa nhiều ký tự hơn, bao gồm cả những ký tự là một phần của cú pháp URI.

{{InteractiveExample("JavaScript Demo: encodeURIComponent()", "shorter")}}

```js interactive-example
// Encodes characters such as ?,=,/,&,:
console.log(`?x=${encodeURIComponent("test?")}`);
// Expected output: "?x=test%3F"

console.log(`?x=${encodeURIComponent("шеллы")}`);
// Expected output: "?x=%D1%88%D0%B5%D0%BB%D0%BB%D1%8B"
```

## Cú pháp

```js-nolint
encodeURIComponent(uriComponent)
```

### Tham số

- `uriComponent`
  - : Một chuỗi được mã hóa dưới dạng thành phần URI (một đường dẫn, chuỗi truy vấn, fragment, v.v.). Các giá trị khác được [chuyển đổi thành chuỗi](/en-US/docs/Web/JavaScript/Reference/Global_Objects/String#string_coercion).

### Giá trị trả về

Một chuỗi mới biểu thị `uriComponent` đã cho được mã hóa dưới dạng thành phần URI.

### Ngoại lệ

- {{jsxref("URIError")}}
  - : Được ném ra nếu `uriComponent` chứa [lone surrogate](/en-US/docs/Web/JavaScript/Reference/Global_Objects/String#utf-16_characters_unicode_code_points_and_grapheme_clusters).

## Mô tả

`encodeURIComponent()` là thuộc tính hàm của đối tượng toàn cục.

`encodeURIComponent()` sử dụng cùng thuật toán mã hóa như được mô tả trong {{jsxref("encodeURI()")}}. Nó thoát tất cả các ký tự **ngoại trừ**:

```plain
A–Z a–z 0–9 - _ . ! ~ * ' ( )
```

So với {{jsxref("encodeURI()")}}, `encodeURIComponent()` thoát một tập ký tự lớn hơn. Sử dụng `encodeURIComponent()` trên các trường nhập liệu của người dùng từ biểu mẫu được gửi đến máy chủ — điều này sẽ mã hóa các ký hiệu `&` có thể vô tình được tạo ra trong quá trình nhập dữ liệu cho {{glossary("character reference", "character references")}} hoặc các ký tự khác yêu cầu mã hóa/giải mã. Ví dụ, nếu người dùng viết `Jack & Jill`, không có `encodeURIComponent()`, dấu và có thể được máy chủ hiểu là bắt đầu của một trường mới và làm hỏng tính toàn vẹn của dữ liệu.

Đối với [`application/x-www-form-urlencoded`](https://html.spec.whatwg.org/multipage/form-control-infrastructure.html#application/x-www-form-urlencoded-encoding-algorithm), các dấu cách cần được thay thế bằng `+`, vì vậy bạn có thể muốn thực hiện thêm một bước thay thế `%20` bằng `+` sau khi gọi `encodeURIComponent()`.

## Ví dụ

### Mã hóa cho tiêu đề Content-Disposition và Link

Ví dụ sau cung cấp mã hóa đặc biệt cần thiết trong các tham số tiêu đề phản hồi máy chủ UTF-8 {{HTTPHeader("Content-Disposition")}} và {{HTTPHeader("Link")}} (ví dụ: tên tệp UTF-8):

```js
const fileName = "my file(2).txt";
const header = `Content-Disposition: attachment; filename*=UTF-8''${encodeRFC5987ValueChars(
  fileName,
)}`;

console.log(header);
// "Content-Disposition: attachment; filename*=UTF-8''my%20file%282%29.txt"

function encodeRFC5987ValueChars(str) {
  return (
    encodeURIComponent(str)
      // The following creates the sequences %27 %28 %29 %2A (Note that
      // the valid encoding of "*" is %2A, which necessitates calling
      // toUpperCase() to properly encode). Although RFC3986 reserves "!",
      // RFC5987 does not, so we do not need to escape it.
      .replace(
        /['()*]/g,
        (c) => `%${c.charCodeAt(0).toString(16).toUpperCase()}`,
      )
      // The following are not required for percent-encoding per RFC5987,
      // so we can allow for a little better readability over the wire: |`^
      .replace(/%(7C|60|5E)/g, (str, hex) =>
        String.fromCharCode(parseInt(hex, 16)),
      )
  );
}
```

### Mã hóa theo RFC3986

[RFC3986](https://datatracker.ietf.org/doc/html/rfc3986) mới hơn dành riêm `!`, `'`, `(`, `)`, và `*`, ngay cả khi các ký tự này không có mục đích phân định URI chính thức. Hàm sau mã hóa một chuỗi theo định dạng thành phần URL tuân thủ RFC3986. Nó cũng mã hóa `[` và `]`, là một phần của cú pháp URI {{Glossary("IPv6")}}. Triển khai `encodeURI` tuân thủ RFC3986 không nên thoát chúng, như được minh họa trong [ví dụ `encodeURI()`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/encodeURI#encoding_for_rfc3986).

```js
function encodeRFC3986URIComponent(str) {
  return encodeURIComponent(str).replace(
    /[!'()*]/g,
    (c) => `%${c.charCodeAt(0).toString(16).toUpperCase()}`,
  );
}
```

### Mã hóa lone surrogate ném lỗi

{{jsxref("URIError")}} sẽ được ném ra nếu cố gắng mã hóa một surrogate không phải là một phần của cặp high-low. Ví dụ:

```js
// High-low pair OK
encodeURIComponent("\uD800\uDFFF"); // "%F0%90%8F%BF"

// Lone high-surrogate code unit throws "URIError: malformed URI sequence"
encodeURIComponent("\uD800");

// Lone high-surrogate code unit throws "URIError: malformed URI sequence"
encodeURIComponent("\uDFFF");
```

Bạn có thể sử dụng {{jsxref("String.prototype.toWellFormed()")}}, thay thế các lone surrogate bằng ký tự thay thế Unicode (U+FFFD), để tránh lỗi này. Bạn cũng có thể sử dụng {{jsxref("String.prototype.isWellFormed()")}} để kiểm tra xem một chuỗi có chứa lone surrogate trước khi truyền nó vào `encodeURIComponent()`.

## Đặc tả kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{jsxref("decodeURI()")}}
- {{jsxref("encodeURI()")}}
- {{jsxref("decodeURIComponent()")}}
