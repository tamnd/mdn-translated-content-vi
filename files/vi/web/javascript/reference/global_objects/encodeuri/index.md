---
title: encodeURI()
slug: Web/JavaScript/Reference/Global_Objects/encodeURI
page-type: javascript-function
browser-compat: javascript.builtins.encodeURI
sidebar: jssidebar
---

Hàm **`encodeURI()`** mã hóa một {{Glossary("URI")}} bằng cách thay thế mỗi trường hợp của một số ký tự nhất định bằng một, hai, ba hoặc bốn chuỗi thoát biểu thị mã hóa {{Glossary("UTF-8")}} của ký tự đó (chỉ có bốn chuỗi thoát cho các ký tự được tạo thành từ hai ký tự thay thế). So với {{jsxref("encodeURIComponent()")}}, hàm này mã hóa ít ký tự hơn, giữ lại những ký tự là một phần của cú pháp URI.

{{InteractiveExample("JavaScript Demo: encodeURI()")}}

```js interactive-example
const uri = "https://mozilla.org/?x=шеллы";
const encoded = encodeURI(uri);
console.log(encoded);
// Expected output: "https://mozilla.org/?x=%D1%88%D0%B5%D0%BB%D0%BB%D1%8B"

try {
  console.log(decodeURI(encoded));
  // Expected output: "https://mozilla.org/?x=шеллы"
} catch (e) {
  // Catches a malformed URI
  console.error(e);
}
```

## Cú pháp

```js-nolint
encodeURI(uri)
```

### Tham số

- `uri`
  - : Một chuỗi được mã hóa dưới dạng URI.

### Giá trị trả về

Một chuỗi mới biểu thị chuỗi đã cho được mã hóa dưới dạng URI.

### Ngoại lệ

- {{jsxref("URIError")}}
  - : Được ném ra nếu `uri` chứa [lone surrogate](/en-US/docs/Web/JavaScript/Reference/Global_Objects/String#utf-16_characters_unicode_code_points_and_grapheme_clusters).

## Mô tả

`encodeURI()` là thuộc tính hàm của đối tượng toàn cục.

Hàm `encodeURI()` thoát các ký tự theo các đơn vị mã UTF-8, với mỗi octet được mã hóa theo định dạng `%XX`, đệm bằng 0 ở bên trái nếu cần. Vì các lone surrogate trong UTF-16 không mã hóa bất kỳ ký tự Unicode hợp lệ nào, chúng khiến `encodeURI()` ném ra {{jsxref("URIError")}}.

`encodeURI()` thoát tất cả các ký tự **ngoại trừ**:

```plain
A–Z a–z 0–9 - _ . ! ~ * ' ( )

; / ? : @ & = + $ , #
```

Các ký tự ở dòng thứ hai là các ký tự có thể là một phần của cú pháp URI, và chỉ được thoát bởi `encodeURIComponent()`. Cả `encodeURI()` và `encodeURIComponent()` đều không mã hóa các ký tự `-.!~*'()`, được gọi là "unreserved marks" (ký tự không dành riêng), không có mục đích dành riêng nhưng được phép trong URI "như hiện tại". (Xem [RFC2396](https://datatracker.ietf.org/doc/html/rfc2396))

Hàm `encodeURI()` không mã hóa các ký tự có ý nghĩa đặc biệt (ký tự dành riêng) cho URI. Ví dụ sau đây hiển thị tất cả các phần mà một URI có thể chứa. Lưu ý cách các ký tự nhất định được dùng để biểu thị ý nghĩa đặc biệt:

```url
http://username:password@www.example.com:80/path/to/file.php?foo=316&bar=this+has+spaces#anchor
```

`encodeURI`, như tên gọi của nó, được dùng để mã hóa một URL như một tổng thể, giả định rằng nó đã có định dạng tốt. Nếu bạn muốn lắp ráp động các giá trị chuỗi vào URL, bạn có thể muốn sử dụng {{jsxref("encodeURIComponent()")}} trên mỗi đoạn động thay thế, để tránh các ký tự cú pháp URL ở những nơi không mong muốn.

```js
const name = "Ben & Jerry's";

// This is bad:
const link = encodeURI(`https://example.com/?choice=${name}`); // "https://example.com/?choice=Ben%20&%20Jerry's"
console.log([...new URL(link).searchParams]); // [['choice', 'Ben '], [" Jerry's", '']

// Instead:
const link = encodeURI(
  `https://example.com/?choice=${encodeURIComponent(name)}`,
);
// "https://example.com/?choice=Ben%2520%2526%2520Jerry's"
console.log([...new URL(link).searchParams]); // [['choice', "Ben%20%26%20Jerry's"]]
```

## Ví dụ

### encodeURI() và encodeURIComponent()

`encodeURI()` khác với {{jsxref("encodeURIComponent()")}} như sau:

```js
const set1 = ";/?:@&=+$,#"; // Reserved Characters
const set2 = "-.!~*'()"; // Unreserved Marks
const set3 = "ABC abc 123"; // Alphanumeric Characters + Space

console.log(encodeURI(set1)); // ;/?:@&=+$,#
console.log(encodeURI(set2)); // -.!~*'()
console.log(encodeURI(set3)); // ABC%20abc%20123 (the space gets encoded as %20)

console.log(encodeURIComponent(set1)); // %3B%2C%2F%3F%3A%40%26%3D%2B%24%23
console.log(encodeURIComponent(set2)); // -.!~*'()
console.log(encodeURIComponent(set3)); // ABC%20abc%20123 (the space gets encoded as %20)
```

### Mã hóa lone surrogate ném lỗi

{{jsxref("URIError")}} sẽ được ném ra nếu cố gắng mã hóa một surrogate không phải là một phần của cặp high-low. Ví dụ:

```js
// High-low pair OK
encodeURI("\uD800\uDFFF"); // "%F0%90%8F%BF"

// Lone high-surrogate code unit throws "URIError: malformed URI sequence"
encodeURI("\uD800");

// Lone low-surrogate code unit throws "URIError: malformed URI sequence"
encodeURI("\uDFFF");
```

Bạn có thể sử dụng {{jsxref("String.prototype.toWellFormed()")}}, thay thế các lone surrogate bằng ký tự thay thế Unicode (U+FFFD), để tránh lỗi này. Bạn cũng có thể sử dụng {{jsxref("String.prototype.isWellFormed()")}} để kiểm tra xem một chuỗi có chứa lone surrogate trước khi truyền nó vào `encodeURI()`.

### Mã hóa theo RFC3986

[RFC3986](https://datatracker.ietf.org/doc/html/rfc3986) mới hơn đặt dấu ngoặc vuông là dành riêng (cho {{Glossary("IPv6")}}) và do đó không được mã hóa khi tạo thứ gì đó có thể là một phần của URL (chẳng hạn như host). Nó cũng dành riêng !, ', (, ), và \*, ngay cả khi các ký tự này không có mục đích phân định URI chính thức. Hàm sau mã hóa một chuỗi theo định dạng URL tuân thủ RFC3986.

```js
function encodeRFC3986URI(str) {
  return encodeURI(str)
    .replace(/%5B/g, "[")
    .replace(/%5D/g, "]")
    .replace(
      /[!'()*]/g,
      (c) => `%${c.charCodeAt(0).toString(16).toUpperCase()}`,
    );
}
```

## Đặc tả kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{jsxref("decodeURI()")}}
- {{jsxref("encodeURIComponent()")}}
- {{jsxref("decodeURIComponent()")}}
