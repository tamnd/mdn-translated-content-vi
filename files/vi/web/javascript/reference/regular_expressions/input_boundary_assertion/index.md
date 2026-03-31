---
title: "Input boundary assertion: ^, $"
slug: Web/JavaScript/Reference/Regular_expressions/Input_boundary_assertion
page-type: javascript-language-feature
browser-compat: javascript.regular_expressions.input_boundary_assertion
sidebar: jssidebar
---

Một **input boundary assertion** kiểm tra xem vị trí hiện tại trong chuỗi có phải là ranh giới đầu vào không. Ranh giới đầu vào là đầu hoặc cuối của chuỗi; hoặc, nếu flag `m` được đặt, đầu hoặc cuối của một dòng.

## Cú pháp

```regex
^
$
```

## Mô tả

`^` xác nhận rằng vị trí hiện tại là đầu của đầu vào. `$` xác nhận rằng vị trí hiện tại là cuối của đầu vào. Cả hai đều là _assertions_, vì vậy chúng không tiêu thụ bất kỳ ký tự nào.

Chính xác hơn, `^` xác nhận rằng ký tự ở bên trái vượt ra ngoài giới hạn của chuỗi; `$` xác nhận rằng ký tự ở bên phải vượt ra ngoài giới hạn của chuỗi. Nếu flag [`m`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/RegExp/multiline) được đặt, `^` cũng khớp nếu ký tự ở bên trái là ký tự [kết thúc dòng](/en-US/docs/Web/JavaScript/Reference/Lexical_grammar#line_terminators), và `$` cũng khớp nếu ký tự ở bên phải là ký tự kết thúc dòng.

Trừ khi flag `m` được đặt, các assertions `^` và `$` chỉ có ý nghĩa khi được đặt ở ranh giới của pattern, vì bất kỳ ký tự nào khác ở bên trái hoặc bên phải của chúng chắc chắn sẽ khiến assertion thất bại.

Flag `y` không thay đổi ý nghĩa của các assertions này — xem thêm [anchored sticky flag](/en-US/docs/Web/JavaScript/Reference/Global_Objects/RegExp/sticky#anchored_sticky_flag).

## Ví dụ

### Xóa dấu gạch chéo ở cuối

Ví dụ sau xóa các dấu gạch chéo ở cuối từ một URL string:

```js
function removeTrailingSlash(url) {
  return url.replace(/\/$/, "");
}

removeTrailingSlash("https://example.com/"); // "https://example.com"
removeTrailingSlash("https://example.com/docs/"); // "https://example.com/docs"
```

### Khớp phần mở rộng file

Ví dụ sau kiểm tra các loại file bằng cách khớp phần mở rộng file, luôn nằm ở cuối chuỗi:

```js
function isImage(filename) {
  return /\.(?:png|jpe?g|webp|avif|gif)$/i.test(filename);
}

isImage("image.png"); // true
isImage("image.jpg"); // true
isImage("image.pdf"); // false
```

### Khớp toàn bộ đầu vào

Đôi khi bạn muốn đảm bảo rằng regex của bạn khớp toàn bộ đầu vào, không chỉ một chuỗi con của đầu vào. Ví dụ, nếu bạn xác định xem một chuỗi có phải là [identifier](/en-US/docs/Web/JavaScript/Reference/Lexical_grammar#identifiers) hợp lệ không, bạn có thể thêm các input boundary assertions vào cả hai đầu của pattern:

```js
function isValidIdentifier(str) {
  return /^[$_\p{ID_Start}][$_\p{ID_Continue}]*$/u.test(str);
}

isValidIdentifier("foo"); // true
isValidIdentifier("$1"); // true
isValidIdentifier("1foo"); // false
isValidIdentifier("  foo  "); // false
```

Hàm này hữu ích khi thực hiện codegen (tạo mã bằng mã), vì bạn có thể sử dụng các identifier hợp lệ khác với các thuộc tính chuỗi khác, chẳng hạn như [dot notation](/en-US/docs/Web/JavaScript/Reference/Operators/Property_accessors#dot_notation) thay vì [bracket notation](/en-US/docs/Web/JavaScript/Reference/Operators/Property_accessors#bracket_notation):

```js
const variables = ["foo", "foo:bar", "  foo  "];

function toAssignment(key) {
  if (isValidIdentifier(key)) {
    return `globalThis.${key} = undefined;`;
  }
  // JSON.stringify() escapes quotes and other special characters
  return `globalThis[${JSON.stringify(key)}] = undefined;`;
}

const statements = variables.map(toAssignment).join("\n");

console.log(statements);
// globalThis.foo = undefined;
// globalThis["foo:bar"] = undefined;
// globalThis["  foo  "] = undefined;
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- Hướng dẫn [Assertions](/en-US/docs/Web/JavaScript/Guide/Regular_expressions/Assertions)
- [Regular expressions](/en-US/docs/Web/JavaScript/Reference/Regular_expressions)
- [Word boundary assertion: `\b`, `\B`](/en-US/docs/Web/JavaScript/Reference/Regular_expressions/Word_boundary_assertion)
- [Lookahead assertion: `(?=...)`, `(?!...)`](/en-US/docs/Web/JavaScript/Reference/Regular_expressions/Lookahead_assertion)
- [Lookbehind assertion: `(?<=...)`, `(?<!...)`](/en-US/docs/Web/JavaScript/Reference/Regular_expressions/Lookbehind_assertion)
