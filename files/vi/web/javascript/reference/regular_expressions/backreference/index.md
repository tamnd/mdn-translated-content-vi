---
title: "Backreference: \\1, \\2"
slug: Web/JavaScript/Reference/Regular_expressions/Backreference
page-type: javascript-language-feature
browser-compat: javascript.regular_expressions.backreference
sidebar: jssidebar
---

Một **backreference** tham chiếu đến kết quả khớp con của một [capturing group](/en-US/docs/Web/JavaScript/Reference/Regular_expressions/Capturing_group) trước đó và khớp với cùng văn bản như nhóm đó. Đối với [named capturing groups](/en-US/docs/Web/JavaScript/Reference/Regular_expressions/Named_capturing_group), bạn có thể muốn sử dụng cú pháp [named backreference](/en-US/docs/Web/JavaScript/Reference/Regular_expressions/Named_backreference).

## Cú pháp

```regex
\N
```

> [!NOTE]
> `N` không phải là ký tự literal.

### Tham số

- `N`
  - : Một số nguyên dương tham chiếu đến số thứ tự của một capturing group.

## Mô tả

Một backreference là cách để khớp cùng văn bản mà đã được khớp trước đó bởi một capturing group. Các capturing groups được đếm từ 1, vì vậy kết quả của capturing group đầu tiên có thể được tham chiếu bằng `\1`, cái thứ hai bằng `\2`, v.v. `\0` là [character escape](/en-US/docs/Web/JavaScript/Reference/Regular_expressions/Character_escape) cho ký tự NUL.

Trong tìm kiếm [không phân biệt hoa/thường](/en-US/docs/Web/JavaScript/Reference/Global_Objects/RegExp/ignoreCase), backreference có thể khớp văn bản với chữ hoa/thường khác với văn bản gốc.

```js
/(b)\1/i.test("bB"); // true
```

Backreference phải tham chiếu đến một capturing group đã tồn tại. Nếu số mà nó chỉ định lớn hơn tổng số capturing groups, một lỗi cú pháp sẽ được ném ra.

```js-nolint example-bad
/(a)\2/u; // SyntaxError: Invalid regular expression: Invalid escape
```

Trong [Unicode-unaware mode](/en-US/docs/Web/JavaScript/Reference/Global_Objects/RegExp/unicode#unicode-aware_mode), các backreferences không hợp lệ trở thành chuỗi [legacy octal escape](/en-US/docs/Web/JavaScript/Reference/Deprecated_and_obsolete_features#escape_sequences). Đây là [cú pháp không dùng nữa để tương thích web](/en-US/docs/Web/JavaScript/Reference/Deprecated_and_obsolete_features#regexp), và bạn không nên dựa vào nó.

```js
/(a)\2/.test("a\x02"); // true
```

Nếu capturing group được tham chiếu không khớp (ví dụ: vì nó thuộc về một lựa chọn thay thế không khớp trong một [disjunction](/en-US/docs/Web/JavaScript/Reference/Regular_expressions/Disjunction)), hoặc nhóm chưa khớp (ví dụ: vì nó nằm ở bên phải của backreference), backreference luôn thành công (như thể nó khớp chuỗi rỗng).

```js
/(?:a|(b))\1c/.test("ac"); // true
/\1(a)/.test("a"); // true
```

## Ví dụ

### Ghép cặp dấu ngoặc kép

Hàm sau khớp các pattern `title='xxx'` và `title="xxx"` trong một chuỗi. Để đảm bảo các dấu ngoặc kép khớp nhau, chúng ta sử dụng backreference để tham chiếu đến dấu ngoặc kép đầu tiên. Truy cập vào capturing group thứ hai (`[2]`) trả về chuỗi giữa các ký tự dấu ngoặc kép khớp:

```js
function parseTitle(metastring) {
  return metastring.match(/title=(["'])(.*?)\1/)[2];
}

parseTitle('title="foo"'); // 'foo'
parseTitle("title='foo' lang='en'"); // 'foo'
parseTitle('title="Named capturing groups\' advantages"'); // "Named capturing groups' advantages"
```

### Khớp các từ trùng lặp

Hàm sau tìm các từ trùng lặp trong một chuỗi (thường là các lỗi đánh máy). Lưu ý rằng nó sử dụng `\w` [character class escape](/en-US/docs/Web/JavaScript/Reference/Regular_expressions/Character_class_escape), chỉ khớp với các chữ cái tiếng Anh nhưng không phải bất kỳ chữ cái có dấu hay bảng chữ cái khác nào. Nếu bạn muốn khớp chung hơn, bạn có thể muốn [tách](/en-US/docs/Web/JavaScript/Reference/Global_Objects/String/split) chuỗi theo khoảng trắng và lặp qua mảng kết quả.

```js
function findDuplicates(text) {
  return text.match(/\b(\w+)\s+\1\b/i)?.[1];
}

findDuplicates("foo foo bar"); // 'foo'
findDuplicates("foo bar foo"); // undefined
findDuplicates("Hello hello"); // 'Hello'
findDuplicates("Hello hellos"); // undefined
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- Hướng dẫn [Groups and backreferences](/en-US/docs/Web/JavaScript/Guide/Regular_expressions/Groups_and_backreferences)
- [Regular expressions](/en-US/docs/Web/JavaScript/Reference/Regular_expressions)
- [Capturing group: `(...)`](/en-US/docs/Web/JavaScript/Reference/Regular_expressions/Capturing_group)
- [Named capturing group: `(?<name>...)`](/en-US/docs/Web/JavaScript/Reference/Regular_expressions/Named_capturing_group)
- [Named backreference: `\k<name>`](/en-US/docs/Web/JavaScript/Reference/Regular_expressions/Named_backreference)
