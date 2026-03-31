---
title: "SyntaxError: duplicate capture group name in regular expression"
slug: Web/JavaScript/Reference/Errors/Regex_duplicate_capture_group_name
page-type: javascript-error
sidebar: jssidebar
---

Ngoại lệ JavaScript "duplicate capture group name in regular expression" xảy ra khi một mẫu biểu thức chính quy chứa hai hoặc nhiều [named capturing group](/en-US/docs/Web/JavaScript/Reference/Regular_expressions/Named_capturing_group) có cùng tên, và các nhóm bắt này có thể khớp cùng một lúc.

## Thông báo

```plain
SyntaxError: Invalid regular expression: /(?<a>)(?<a>)/: Duplicate capture group name (V8-based)
SyntaxError: duplicate capture group name in regular expression (Firefox)
SyntaxError: Invalid regular expression: duplicate group specifier name (Safari)
```

## Loại lỗi

{{jsxref("SyntaxError")}}

## Điều gì đã xảy ra?

Tất cả các [named capturing group](/en-US/docs/Web/JavaScript/Reference/Regular_expressions/Named_capturing_group) trong một mẫu biểu thức chính quy phải có tên duy nhất. Một tính năng mới hơn cho phép các named capturing group chia sẻ tên, miễn là chúng thuộc các [disjunction alternative](/en-US/docs/Web/JavaScript/Reference/Regular_expressions/Disjunction) khác nhau và không thể khớp cùng một lúc (xem [khả năng tương thích trình duyệt](/en-US/docs/Web/JavaScript/Reference/Regular_expressions/Named_capturing_group#browser_compatibility) cho tính năng này). Tuy nhiên, vẫn là lỗi nếu các named capturing group có cùng tên có thể khớp cùng một lúc, vì điều đó sẽ làm cho các tính năng khác như [named backreference](/en-US/docs/Web/JavaScript/Reference/Regular_expressions/Named_backreference) trở nên mơ hồ.

## Ví dụ

### Các trường hợp không hợp lệ

```js example-bad
/(?<name>\w+) (?<name>\w+)/;
```

### Các trường hợp hợp lệ

```js example-good
/(?<firstName>\w+) (?<lastName>\w+)/;
/(?<year>\d{4})-\d{2}|\d{2}-(?<year>\d{4})/;
```

## Xem thêm

- [Regular expressions](/en-US/docs/Web/JavaScript/Reference/Regular_expressions)
- [Named capturing group: `(?<name>...)`](/en-US/docs/Web/JavaScript/Reference/Regular_expressions/Named_capturing_group)
