---
title: "Wildcard: ."
slug: Web/JavaScript/Reference/Regular_expressions/Wildcard
page-type: javascript-language-feature
browser-compat: javascript.regular_expressions.wildcard
sidebar: jssidebar
---

Một **wildcard** khớp tất cả các ký tự ngoại trừ các ký tự kết thúc dòng. Nó cũng khớp các ký tự kết thúc dòng nếu flag `s` được đặt.

## Cú pháp

```regex
.
```

## Mô tả

`.` khớp bất kỳ ký tự nào ngoại trừ [các ký tự kết thúc dòng](/en-US/docs/Web/JavaScript/Reference/Lexical_grammar#line_terminators). Nếu flag [`s`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/RegExp/dotAll) được đặt, `.` cũng khớp các ký tự kết thúc dòng.

Tập hợp ký tự chính xác được khớp bởi `.` phụ thuộc vào việc regex có [Unicode-aware](/en-US/docs/Web/JavaScript/Reference/Global_Objects/RegExp/unicode#unicode-aware_mode) hay không. Nếu nó là Unicode-aware, `.` khớp bất kỳ code point Unicode nào; nếu không, nó khớp bất kỳ UTF-16 code unit nào. Ví dụ:

```js
/../.test("😄"); // true; matches two UTF-16 code units as a surrogate pair
/../u.test("😄"); // false; input only has one Unicode character
```

## Ví dụ

### Sử dụng với quantifiers

Wildcards thường được sử dụng với [quantifiers](/en-US/docs/Web/JavaScript/Reference/Regular_expressions/Quantifier) để khớp bất kỳ chuỗi ký tự nào, cho đến khi ký tự tiếp theo cần tìm được tìm thấy. Ví dụ, đoạn sau trích xuất tiêu đề của một trang Markdown theo dạng `# Title`:

```js
function parseTitle(entry) {
  // Use multiline mode because the title may not be at the start of
  // the file. Note that the m flag does not make . match line
  // terminators, so the title must be on a single line
  // Return text matched by the first capturing group.
  return /^#[ \t]+(.+)$/m.exec(entry)?.[1];
}

parseTitle("# Hello world"); // "Hello world"
parseTitle("## Subsection"); // undefined
parseTitle(`
---
slug: Web/JavaScript/Reference/Regular_expressions/Wildcard
---

# Wildcard: .

A **wildcard** matches all characters except line terminators.
`); // "Wildcard: ."
```

### Khớp nội dung code block

Ví dụ sau khớp nội dung của một code block được bao bởi ba backticks trong Markdown. Nó sử dụng flag `s` để làm cho `.` khớp các ký tự kết thúc dòng, vì nội dung của một code block có thể trải dài nhiều dòng:

````js
function parseCodeBlock(entry) {
  return /^```.*?^(.+?)\n```/ms.exec(entry)?.[1];
}

parseCodeBlock(`
\`\`\`js
console.log("Hello world");
\`\`\`
`); // "console.log("Hello world");"

parseCodeBlock(`
A \`try...catch\` statement must have the blocks enclosed in curly braces.

\`\`\`js example-bad
try
  doSomething();
catch (e)
  console.log(e);
\`\`\`
`); // "try\n  doSomething();\ncatch (e)\n  console.log(e);"
````

> [!WARNING]
> Các ví dụ này chỉ để minh họa. Nếu bạn muốn phân tích Markdown, hãy sử dụng Markdown parser chuyên dụng vì có nhiều trường hợp đặc biệt cần xem xét.

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- Hướng dẫn [Character classes](/en-US/docs/Web/JavaScript/Guide/Regular_expressions/Character_classes)
- [Regular expressions](/en-US/docs/Web/JavaScript/Reference/Regular_expressions)
- [Character class: `[...]`, `[^...]`](/en-US/docs/Web/JavaScript/Reference/Regular_expressions/Character_class)
- [Character class escape: `\d`, `\D`, `\w`, `\W`, `\s`, `\S`](/en-US/docs/Web/JavaScript/Reference/Regular_expressions/Character_class_escape)
