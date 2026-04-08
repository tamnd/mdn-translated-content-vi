---
title: RegExp.escape()
short-title: escape()
slug: Web/JavaScript/Reference/Global_Objects/RegExp/escape
page-type: javascript-static-method
browser-compat: javascript.builtins.RegExp.escape
sidebar: jsref
---

Phương thức tĩnh **`RegExp.escape()`** [escape](/en-US/docs/Web/JavaScript/Reference/Regular_expressions#escape_sequences) mọi ký tự có thể là cú pháp regex trong một chuỗi, và trả về một chuỗi mới có thể được dùng an toàn như một pattern [literal](/en-US/docs/Web/JavaScript/Reference/Regular_expressions/Literal_character) cho constructor {{jsxref("RegExp/RegExp", "RegExp()")}}.

Khi tạo động một {{jsxref("RegExp")}} từ nội dung do người dùng cung cấp, hãy cân nhắc dùng hàm này để làm sạch đầu vào (trừ khi đầu vào thực sự được thiết kế để chứa cú pháp regex). Ngoài ra, đừng cố tái tạo chức năng của nó bằng cách, ví dụ, dùng {{jsxref("String.prototype.replaceAll()")}} để chèn `\` trước mọi ký tự cú pháp. `RegExp.escape()` được thiết kế để sử dụng các escape sequence hoạt động đúng trong nhiều trường hợp biên/ngữ cảnh hơn những gì code viết tay có thể đạt được.

## Cú pháp

```js-nolint
RegExp.escape(string)
```

### Tham số

- `string`
  - : Chuỗi cần escape.

### Giá trị trả về

Một chuỗi mới có thể được dùng an toàn như một pattern literal cho constructor {{jsxref("RegExp/RegExp", "RegExp()")}}. Cụ thể, các thành phần sau trong chuỗi đầu vào sẽ được thay thế:

- Ký tự đầu tiên của chuỗi, nếu là chữ số thập phân (0–9) hoặc chữ cái ASCII (a–z, A–Z), được escape bằng cú pháp [character escape](/en-US/docs/Web/JavaScript/Reference/Regular_expressions/Character_escape) `\x`. Ví dụ, `RegExp.escape("foo")` trả về `"\\x66oo"` (ở đây và sau đây, hai dấu gạch chéo ngược trong chuỗi literal biểu thị một ký tự gạch chéo ngược đơn). Bước này đảm bảo rằng nếu chuỗi đã escape này được nhúng vào một pattern lớn hơn mà ngay trước nó là `\1`, `\x0`, `\u000`, v.v., ký tự đầu không bị hiểu là một phần của escape sequence.
- [Ký tự cú pháp](/en-US/docs/Web/JavaScript/Reference/Regular_expressions/Literal_character#description) regex, bao gồm `^`, `$`, `\`, `.`, `*`, `+`, `?`, `(`, `)`, `[`, `]`, `{`, `}`, và `|`, cũng như dấu phân cách `/`, được escape bằng cách chèn ký tự `\` trước chúng. Ví dụ, `RegExp.escape("foo.bar")` trả về `"\\x66oo\\.bar"`, và `RegExp.escape("(foo)")` trả về `"\\(foo\\)"`.
- Các dấu câu khác, bao gồm `,`, `-`, `=`, `<`, `>`, `#`, `&`, `!`, `%`, `:`, `;`, `@`, `~`, `'`, `` ` ``, và `"`, được escape bằng cú pháp `\x`. Ví dụ, `RegExp.escape("foo-bar")` trả về `"\\x66oo\\x2dbar"`. Các ký tự này không thể escape bằng cách thêm `\` vì, ví dụ, `/foo\-bar/u` là lỗi cú pháp.
- Các ký tự có [character escape](/en-US/docs/Web/JavaScript/Reference/Regular_expressions/Character_escape) riêng: `\f` (U+000C FORM FEED), `\n` (U+000A LINE FEED), `\r` (U+000D CARRIAGE RETURN), `\t` (U+0009 CHARACTER TABULATION), và `\v` (U+000B LINE TABULATION), được thay thế bằng escape sequence tương ứng. Ví dụ, `RegExp.escape("foo\nbar")` trả về `"\\x66oo\\nbar"`.
- Ký tự khoảng trắng được escape thành `"\\x20"`.
- Các ký tự [ngắt dòng và khoảng trắng](/en-US/docs/Web/JavaScript/Reference/Lexical_grammar#white_space) non-ASCII khác được thay thế bằng một hoặc hai escape sequence `\uXXXX` biểu thị các đơn vị mã UTF-16 của chúng. Ví dụ, `RegExp.escape("foo\u2028bar")` trả về `"\\x66oo\\u2028bar"`.
- [Lone surrogate](/en-US/docs/Web/JavaScript/Reference/Global_Objects/String#utf-16_characters_unicode_code_points_and_grapheme_clusters) được thay thế bằng escape sequence `\uXXXX`. Ví dụ, `RegExp.escape("foo\uD800bar")` trả về `"\\x66oo\\ud800bar"`.

### Ngoại lệ

- {{jsxref("TypeError")}}
  - : Được ném ra nếu `string` không phải là chuỗi.

## Ví dụ

### Sử dụng RegExp.escape()

Các ví dụ sau minh họa nhiều đầu vào và đầu ra khác nhau của phương thức `RegExp.escape()`.

```js
RegExp.escape("Buy it. use it. break it. fix it.");
// "\\x42uy\\x20it\\.\\x20use\\x20it\\.\\x20break\\x20it\\.\\x20fix\\x20it\\."
RegExp.escape("foo.bar"); // "\\x66oo\\.bar"
RegExp.escape("foo-bar"); // "\\x66oo\\x2dbar"
RegExp.escape("foo\nbar"); // "\\x66oo\\nbar"
RegExp.escape("foo\uD800bar"); // "\\x66oo\\ud800bar"
RegExp.escape("foo\u2028bar"); // "\\x66oo\\u2028bar"
```

### Sử dụng RegExp.escape() với constructor RegExp

Trường hợp sử dụng chính của `RegExp.escape()` là khi bạn muốn nhúng một chuỗi vào một pattern regex lớn hơn và muốn đảm bảo chuỗi đó được xử lý như một pattern literal, không phải cú pháp regex. Xem xét ví dụ đơn giản sau đây thay thế URL:

```js
function removeDomain(text, domain) {
  return text.replace(new RegExp(`https?://${domain}(?=/)`, "g"), "");
}

const input =
  "Consider using [RegExp.escape()](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/RegExp/escape) to escape special characters in a string.";
const domain = "developer.mozilla.org";
console.log(removeDomain(input, domain));
// Consider using [RegExp.escape()](/en-US/docs/Web/JavaScript/Reference/Global_Objects/RegExp/escape) to escape special characters in a string.
```

Việc chèn `domain` ở trên tạo ra regex literal `https?://developer.mozilla.org(?=/)`, trong đó ký tự "." là ký tự [wildcard](/en-US/docs/Web/JavaScript/Reference/Regular_expressions/Wildcard) của regex. Điều này có nghĩa là chuỗi sẽ khớp với chuỗi có bất kỳ ký tự nào thay cho ".", chẳng hạn `developer-mozilla-org`. Do đó, nó sẽ cũng thay đổi nhầm đoạn văn bản sau:

```js
const input =
  "This is not an MDN link: https://developer-mozilla.org/, be careful!";
const domain = "developer.mozilla.org";
console.log(removeDomain(input, domain));
// This is not an MDN link: /, be careful!
```

Để sửa lỗi này, chúng ta có thể dùng `RegExp.escape()` để đảm bảo mọi đầu vào từ người dùng được xử lý như pattern literal:

```js
function removeDomain(text, domain) {
  return text.replace(
    new RegExp(`https?://${RegExp.escape(domain)}(?=/)`, "g"),
    "",
  );
}
```

Bây giờ hàm này sẽ thực hiện đúng như dự kiến và sẽ không biến đổi các URL `developer-mozilla.org`.

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Polyfill của `RegExp.escape` trong `core-js`](https://github.com/zloirock/core-js#regexp-escaping)
- [Polyfill es-shims của `Reflect.escape`](https://www.npmjs.com/package/regexp.escape)
- {{jsxref("RegExp")}}
