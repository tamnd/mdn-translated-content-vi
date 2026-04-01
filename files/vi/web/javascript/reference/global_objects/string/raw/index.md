---
title: String.raw()
short-title: raw()
slug: Web/JavaScript/Reference/Global_Objects/String/raw
page-type: javascript-static-method
browser-compat: javascript.builtins.String.raw
sidebar: jsref
---

Phương thức static **`String.raw()`** là một hàm tag của [template literal](/en-US/docs/Web/JavaScript/Reference/Template_literals). Điều này tương tự như tiền tố `r` trong Python, hoặc tiền tố `@` trong C# cho string literal. Nó được sử dụng để lấy dạng string thô của template literal — nghĩa là, các phép thay thế (ví dụ: `${foo}`) được xử lý, nhưng các chuỗi thoát (ví dụ: `\n`) thì không.

{{InteractiveExample("JavaScript Demo: String.raw()")}}

```js interactive-example
// Create a variable that uses a Windows
// path without escaping the backslashes:
const filePath = String.raw`C:\Development\profile\about.html`;

console.log(`The file was uploaded from: ${filePath}`);
// Expected output: "The file was uploaded from: C:\Development\profile\about.html"
```

## Cú pháp

```js-nolint
String.raw(strings)
String.raw(strings, sub1)
String.raw(strings, sub1, sub2)
String.raw(strings, sub1, sub2, /* …, */ subN)

String.raw`templateString`
```

### Tham số

- `strings`
  - : Đối tượng mảng template literal được định dạng tốt, như `{ raw: ['foo', 'bar', 'baz'] }`. Nên là một đối tượng với thuộc tính `raw` có giá trị là một đối tượng giống mảng của các string.
- `sub1`, …, `subN`
  - : Chứa các giá trị thay thế.
- `templateString`
  - : Một [template literal](/en-US/docs/Web/JavaScript/Reference/Template_literals), tùy chọn với các phép thay thế (`${...}`).

### Giá trị trả về

Dạng string thô của template literal đã cho.

### Ngoại lệ

- {{jsxref("TypeError")}}
  - : Ném ra nếu đối số đầu tiên không có thuộc tính `raw`, hoặc thuộc tính `raw` là `undefined` hoặc `null`.

## Mô tả

Trong hầu hết các trường hợp, `String.raw()` được sử dụng với template literal. Cú pháp đầu tiên được đề cập ở trên hiếm khi được sử dụng, vì JavaScript engine sẽ gọi nó với các đối số thích hợp cho bạn (giống như với các [hàm tag](/en-US/docs/Web/JavaScript/Reference/Template_literals#tagged_templates) khác).

`String.raw()` là tag template literal tích hợp duy nhất. Nó có ngữ nghĩa gần với một literal không được tag vì nó nối tất cả đối số và trả về một string. Bạn thậm chí có thể tái triển khai nó với code JavaScript thông thường.

> [!WARNING]
> Bạn không nên sử dụng `String.raw` trực tiếp như một tag "identity". Xem [Building an identity tag](#building_an_identity_tag) để biết cách triển khai điều này.

Nếu `String.raw()` được gọi với một đối tượng mà thuộc tính `raw` không có thuộc tính `length` hoặc `length` không dương, nó trả về string rỗng `""`. Nếu `substitutions.length < strings.raw.length - 1` (tức là, không đủ phép thay thế để điền vào các chỗ giữ chỗ — điều này không thể xảy ra trong một tagged template literal được định dạng tốt), phần còn lại của các chỗ giữ chỗ được điền bằng string rỗng.

## Ví dụ

### Sử dụng String.raw()

```js
String.raw`Hi\n${2 + 3}!`;
// 'Hi\\n5!', the character after 'Hi'
// is not a newline character,
// '\' and 'n' are two characters.

String.raw`Hi\u000A!`;
// 'Hi\\u000A!', same here, this time we will get the
// \, u, 0, 0, 0, A, 6 characters.
// All kinds of escape characters will be ineffective
// and backslashes will be present in the output string.
// You can confirm this by checking the .length property
// of the string.

const name = "Bob";
String.raw`Hi\n${name}!`;
// 'Hi\\nBob!', substitutions are processed.
```

### String thô chứa cú pháp template literal

`String.raw` là một hàm, vì vậy nó không thể vượt qua cú pháp template literal cơ bản như dấu backtick làm dấu phân cách và `${` cho các phép thay thế. Nếu bạn muốn bao gồm các ký tự này trong string đầu ra, bạn cần thoát chúng với dấu gạch chéo ngược. Tuy nhiên, vì `String.raw` xuất các string thô, các dấu gạch chéo ngược sẽ được giữ lại trong đầu ra.

```js
String.raw`Hi \${name}!`;
// 'Hi \\${name}!', the dollar sign is escaped; there's no interpolation.
// However, the backslash is still present in the output string.

String.raw`This is a backtick: \``;
// 'This is a backtick: \\`', the backslash is still present.

String.raw`A trailing backslash: \\`;
// 'A trailing backslash: \\\\', both backslashes are present.
// If you use a single backslash at the end, it escapes the ending backtick,
// causing subsequent code to be included in the string.
```

Để giải quyết vấn đề này, bạn có thể sử dụng phép thay thế để chèn các ký tự này.

```js
String.raw`Hi ${"$"}{name}!`;
// 'Hi ${name}!', the substitution inserts a single dollar sign.
String.raw`This is a backtick: ${"`"}`;
// 'This is a backtick: `', the substitution inserts a single backtick.
String.raw`A trailing backslash: ${"\\"}`;
// 'A trailing backslash: \\', the substitution inserts a single backslash.
```

Cách tiếp cận này hoạt động cho `String.raw` vì nó chỉ nối các string thô và các phép thay thế. Nhìn chung, thật không may, không có cách nào để một tag template literal nhận được string `raw` chứa cú pháp template literal không được thoát.

```js
function tag(strings) {
  console.log(strings.raw[0]); // This will never contain unescaped `${` or backticks
}
```

### Sử dụng String.raw với RegExp

Kết hợp template literal `String.raw` với constructor {{jsxref("RegExp/RegExp", "RegExp()")}} cho phép bạn tạo các biểu thức chính quy với các phần động (điều này không thể thực hiện với regex literal) mà không cần double-escaping (`\\`) các chuỗi thoát biểu thức chính quy (điều này không thể thực hiện với string literal thông thường). Điều này cũng có giá trị trong các string chứa nhiều dấu gạch chéo, chẳng hạn như đường dẫn file hoặc URL.

```js
// A String.raw template allows a fairly readable regular expression matching a URL:
const reRawTemplate = new RegExp(
  String.raw`https://developer\.mozilla\.org/en-US/docs/Web/JavaScript/Reference/`,
);

// The same thing with a regexp literal looks like this, with \/ for
// each forward slash:
const reRegexpLiteral =
  /https:\/\/developer\.mozilla\.org\/en-US\/docs\/Web\/JavaScript\/Reference\//;

// And the same thing written with the RegExp constructor and a
// traditional string literal, with \\. for each period:
const reStringLiteral = new RegExp(
  "https://developer\\.mozilla\\.org/en-US/docs/Web/JavaScript/Reference/",
);

// String.raw also allows dynamic parts to be included
function makeURLRegExp(path) {
  return new RegExp(String.raw`https://developer\.mozilla\.org/${path}`);
}

const reDynamic = makeURLRegExp("en-US/docs/Web/JavaScript/Reference/");
const reWildcard = makeURLRegExp(".*");
```

### Xây dựng identity tag

Nhiều công cụ xử lý đặc biệt các literal được tag bởi một tên cụ thể.

```js
// Some formatters will format this literal's content as HTML
const doc = html`<!doctype html>
  <html lang="en-US">
    <head>
      <title>Hello</title>
    </head>
    <body>
      <h1>Hello world!</h1>
    </body>
  </html>`;
```

Người ta có thể triển khai tag `html` một cách ngây thơ như:

```js
const html = String.raw;
```

Thực ra, điều này hoạt động cho trường hợp trên. Tuy nhiên, vì `String.raw` sẽ nối các string literal _thô_ thay vì các string "đã nấu chín", các chuỗi thoát sẽ không được xử lý.

```js-nolint
const doc = html`<canvas>\n</canvas>`;
// "<canvas>\\n</canvas>"
```

Đây có thể không phải là điều bạn muốn cho một tag "identity thực sự", nơi tag chỉ để đánh dấu và không thay đổi giá trị của literal. Trong trường hợp đó, bạn có thể tạo một tag tùy chỉnh và truyền mảng literal "đã nấu chín" (tức là các chuỗi thoát được xử lý) vào `String.raw`, giả vờ chúng là các string thô.

```js-nolint
const html = (strings, ...values) => String.raw({ raw: strings }, ...values);
// Some formatters will format this literal's content as HTML
const doc = html`<canvas>\n</canvas>`;
// "<canvas>\n</canvas>"; the "\n" becomes a line break
```

Lưu ý đối số đầu tiên là một đối tượng với thuộc tính `raw`, có giá trị là một đối tượng giống mảng (với thuộc tính `length` và các chỉ mục số nguyên) biểu diễn các string được phân tách trong template literal. Phần còn lại của các đối số là các phép thay thế. Vì giá trị `raw` có thể là bất kỳ đối tượng giống mảng nào, nó thậm chí có thể là một string! Ví dụ, `'test'` được xử lý như `['t', 'e', 's', 't']`. Sau đây tương đương với `` `t${0}e${1}s${2}t` ``:

```js
String.raw({ raw: "test" }, 0, 1, 2); // 't0e1s2t'
```

## Đặc tả

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Polyfill of `String.raw` in `core-js`](https://github.com/zloirock/core-js#ecmascript-string-and-regexp)
- [es-shims polyfill of `String.raw`](https://www.npmjs.com/package/string.raw)
- [Template literals](/en-US/docs/Web/JavaScript/Reference/Template_literals)
- {{jsxref("String")}}
- [Lexical grammar](/en-US/docs/Web/JavaScript/Reference/Lexical_grammar)
