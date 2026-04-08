---
title: "Named backreference: \\k<name>"
slug: Web/JavaScript/Reference/Regular_expressions/Named_backreference
page-type: javascript-language-feature
browser-compat: javascript.regular_expressions.named_backreference
sidebar: jssidebar
---

Một **named backreference** tham chiếu đến kết quả khớp con của một [named capturing group](/en-US/docs/Web/JavaScript/Reference/Regular_expressions/Named_capturing_group) trước đó và khớp với cùng văn bản như nhóm đó. Đối với [unnamed capturing groups](/en-US/docs/Web/JavaScript/Reference/Regular_expressions/Capturing_group), bạn cần sử dụng cú pháp [backreference](/en-US/docs/Web/JavaScript/Reference/Regular_expressions/Backreference) thông thường.

## Cú pháp

```regex
\k<name>
```

### Tham số

- `name`
  - : Tên của nhóm. Phải là [identifier](/en-US/docs/Web/JavaScript/Reference/Lexical_grammar#identifiers) hợp lệ và tham chiếu đến một named capturing group đã tồn tại.

## Mô tả

Named backreferences rất giống với các backreferences thông thường: nó tham chiếu đến văn bản được khớp bởi một capturing group và khớp với cùng văn bản. Sự khác biệt là bạn tham chiếu đến capturing group theo tên thay vì theo số. Điều này làm cho regular expression dễ đọc hơn và dễ tái cấu trúc và bảo trì hơn.

Trong [Unicode-unaware mode](/en-US/docs/Web/JavaScript/Reference/Global_Objects/RegExp/unicode#unicode-aware_mode), chuỗi `\k` chỉ bắt đầu một named backreference nếu regex chứa ít nhất một named capturing group. Nếu không, nó là [identity escape](/en-US/docs/Web/JavaScript/Reference/Regular_expressions/Character_escape) và giống như ký tự literal `k`. Đây là [cú pháp không dùng nữa để tương thích web](/en-US/docs/Web/JavaScript/Reference/Deprecated_and_obsolete_features#regexp), và bạn không nên dựa vào nó.

```js
/\k/.test("k"); // true
```

## Ví dụ

### Ghép cặp dấu ngoặc kép

Hàm sau khớp các pattern `title='xxx'` và `title="xxx"` trong một chuỗi. Để đảm bảo các dấu ngoặc kép khớp nhau, chúng ta sử dụng backreference để tham chiếu đến dấu ngoặc kép đầu tiên. Truy cập vào capturing group thứ hai (`[2]`) trả về chuỗi giữa các ký tự dấu ngoặc kép khớp:

```js
function parseTitle(metastring) {
  return metastring.match(/title=(?<quote>["'])(.*?)\k<quote>/)[2];
}

parseTitle('title="foo"'); // 'foo'
parseTitle("title='foo' lang='en'"); // 'foo'
parseTitle('title="Named capturing groups\' advantages"'); // "Named capturing groups' advantages"
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
- [Backreference: `\1`, `\2`](/en-US/docs/Web/JavaScript/Reference/Regular_expressions/Backreference)
