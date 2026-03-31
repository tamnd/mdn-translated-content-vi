---
title: "Named capturing group: (?<name>...)"
slug: Web/JavaScript/Reference/Regular_expressions/Named_capturing_group
page-type: javascript-language-feature
browser-compat: javascript.regular_expressions.named_capturing_group
sidebar: jssidebar
---

Một **named capturing group** là một loại [capturing group](/en-US/docs/Web/JavaScript/Reference/Regular_expressions/Capturing_group) đặc biệt cho phép đặt tên cho nhóm. Kết quả khớp của nhóm sau này có thể được xác định bằng tên này thay vì chỉ số của nó trong pattern.

## Cú pháp

```regex
(?<name>pattern)
```

### Tham số

- `pattern`
  - : Một pattern bao gồm bất cứ thứ gì bạn có thể sử dụng trong một regex literal, bao gồm cả [disjunction](/en-US/docs/Web/JavaScript/Reference/Regular_expressions/Disjunction).
- `name`
  - : Tên của nhóm. Phải là [identifier](/en-US/docs/Web/JavaScript/Reference/Lexical_grammar#identifiers) hợp lệ.

## Mô tả

Named capturing groups có thể được sử dụng giống như các capturing groups — chúng cũng có chỉ số kết quả khớp của mình trong mảng kết quả, và chúng có thể được tham chiếu qua `\1`, `\2`, v.v. Sự khác biệt duy nhất là chúng có thể được _thêm vào_ tham chiếu bằng tên của chúng. Thông tin về kết quả khớp của capturing group có thể được truy cập qua:

- Thuộc tính `groups` của giá trị trả về của {{jsxref("RegExp.prototype.exec()")}}, {{jsxref("String.prototype.match()")}}, và {{jsxref("String.prototype.matchAll()")}}
- Tham số `groups` của hàm callback `replacement` của các phương thức {{jsxref("String.prototype.replace()")}} và {{jsxref("String.prototype.replaceAll()")}}
- [Named backreferences](/en-US/docs/Web/JavaScript/Reference/Regular_expressions/Named_backreference) trong cùng một pattern

Tất cả các tên phải là duy nhất trong cùng một pattern. Nhiều named capturing groups với cùng tên dẫn đến lỗi cú pháp.

```js-nolint example-bad
/(?<name>)(?<name>)/; // SyntaxError: Invalid regular expression: Duplicate capture group name
```

Hạn chế này được nới lỏng nếu các named capturing groups trùng lặp không nằm trong cùng một [disjunction alternative](/en-US/docs/Web/JavaScript/Reference/Regular_expressions/Disjunction), vì vậy đối với bất kỳ đầu vào chuỗi nào, chỉ có một named capturing group thực sự có thể được khớp. Đây là tính năng mới hơn nhiều, vì vậy hãy kiểm tra [tương thích trình duyệt](#browser_compatibility) trước khi sử dụng.

```js
/(?<year>\d{4})-\d{2}|\d{2}-(?<year>\d{4})/;
// Works; "year" can either come before or after the hyphen
```

Named capturing groups sẽ đều có mặt trong kết quả. Nếu một named capturing group không khớp (ví dụ: nó thuộc về một lựa chọn thay thế không khớp trong một [disjunction](/en-US/docs/Web/JavaScript/Reference/Regular_expressions/Disjunction)), thuộc tính tương ứng trên đối tượng `groups` có giá trị `undefined`.

```js
/(?<ab>ab)|(?<cd>cd)/.exec("cd").groups; // [Object: null prototype] { ab: undefined, cd: 'cd' }
```

Bạn có thể lấy chỉ số bắt đầu và kết thúc của mỗi named capturing group trong chuỗi đầu vào bằng cách sử dụng flag [`d`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/RegExp/hasIndices). Ngoài việc truy cập chúng trên thuộc tính `indices` trên mảng được trả về bởi `exec()`, bạn cũng có thể truy cập chúng theo tên trên `indices.groups`.

So với các unnamed capturing groups, named capturing groups có các ưu điểm sau:

- Chúng cho phép bạn cung cấp tên mô tả cho mỗi kết quả khớp con.
- Chúng cho phép bạn truy cập các kết quả khớp con mà không cần nhớ thứ tự chúng xuất hiện trong pattern.
- Khi tái cấu trúc mã, bạn có thể thay đổi thứ tự của các capturing groups mà không lo lắng về việc làm hỏng các tham chiếu khác.

## Ví dụ

### Sử dụng named capturing groups

Ví dụ sau phân tích một timestamp và tên tác giả từ một mục Git log (đầu ra với `git log --format=%ct,%an -- filename`):

```js
function parseLog(entry) {
  const { author, timestamp } = /^(?<timestamp>\d+),(?<author>.+)$/.exec(
    entry,
  ).groups;
  return `${author} committed on ${new Date(
    parseInt(timestamp, 10) * 1000,
  ).toLocaleString()}`;
}

parseLog("1560979912,Caroline"); // "Caroline committed on 6/19/2019, 5:31:52 PM"
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Polyfill of named capturing groups in `core-js`](https://github.com/zloirock/core-js#ecmascript-string-and-regexp)
- Hướng dẫn [Groups and backreferences](/en-US/docs/Web/JavaScript/Guide/Regular_expressions/Groups_and_backreferences)
- [Regular expressions](/en-US/docs/Web/JavaScript/Reference/Regular_expressions)
- [Capturing group: `(...)`](/en-US/docs/Web/JavaScript/Reference/Regular_expressions/Capturing_group)
- [Non-capturing group: `(?:...)`](/en-US/docs/Web/JavaScript/Reference/Regular_expressions/Non-capturing_group)
- [Named backreference: `\k<name>`](/en-US/docs/Web/JavaScript/Reference/Regular_expressions/Named_backreference)
- [ESLint rule: `prefer-named-capture-group`](https://eslint.org/docs/latest/rules/prefer-named-capture-group)
