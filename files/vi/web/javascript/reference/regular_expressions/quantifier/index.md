---
title: "Quantifier: *, +, ?, {n}, {n,}, {n,m}"
slug: Web/JavaScript/Reference/Regular_expressions/Quantifier
page-type: javascript-language-feature
browser-compat: javascript.regular_expressions.quantifier
sidebar: jssidebar
---

Một **quantifier** lặp lại một [atom](/en-US/docs/Web/JavaScript/Reference/Regular_expressions#atoms) một số lần nhất định. Quantifier được đặt sau atom mà nó áp dụng.

## Cú pháp

```regex
// Greedy
atom?
atom*
atom+
atom{count}
atom{min,}
atom{min,max}

// Non-greedy
atom??
atom*?
atom+?
atom{count}?
atom{min,}?
atom{min,max}?
```

> [!NOTE]
> Thêm `?` sau `{count}` là cú pháp hợp lệ nhưng thực tế vô dụng. Vì `{count}` luôn khớp đúng `count` lần, `atom{count}?` hoạt động giống như `atom{count}`.

### Tham số

- `atom`
  - : Một [atom](/en-US/docs/Web/JavaScript/Reference/Regular_expressions#atoms) đơn lẻ.
- `count`
  - : Một số nguyên không âm. Số lần atom sẽ được lặp lại.
- `min`
  - : Một số nguyên không âm. Số lần tối thiểu atom có thể được lặp lại.
- `max` {{optional_inline}}
  - : Một số nguyên không âm. Số lần tối đa atom có thể được lặp lại. Nếu bỏ qua, atom có thể được lặp lại bao nhiêu lần tùy ý.

## Mô tả

Một quantifier được đặt sau một [atom](/en-US/docs/Web/JavaScript/Reference/Regular_expressions#atoms) để lặp lại nó một số lần nhất định. Nó không thể tự xuất hiện một mình. Mỗi quantifier có thể chỉ định số tối thiểu và tối đa mà một pattern phải được lặp lại.

| Quantifier  | Tối thiểu | Tối đa   |
| ----------- | --------- | -------- |
| `?`         | 0         | 1        |
| `*`         | 0         | Infinity |
| `+`         | 1         | Infinity |
| `{count}`   | `count`   | `count`  |
| `{min,}`    | `min`     | Infinity |
| `{min,max}` | `min`     | `max`    |

Đối với cú pháp `{count}`, `{min,}`, và `{min,max}`, không thể có khoảng trắng xung quanh các số — nếu không, nó trở thành pattern [literal](/en-US/docs/Web/JavaScript/Reference/Regular_expressions/Literal_character).

```js example-bad
const re = /a{1, 3}/;
re.test("aa"); // false
re.test("a{1, 3}"); // true
```

Hành vi này được sửa trong [Unicode-aware mode](/en-US/docs/Web/JavaScript/Reference/Global_Objects/RegExp/unicode#unicode-aware_mode), trong đó các dấu ngoặc nhọn không thể xuất hiện theo nghĩa đen mà không cần [thoát](/en-US/docs/Web/JavaScript/Reference/Regular_expressions/Character_escape). Khả năng sử dụng `{` và `}` theo nghĩa đen mà không cần thoát là [cú pháp không dùng nữa để tương thích web](/en-US/docs/Web/JavaScript/Reference/Deprecated_and_obsolete_features#regexp), và bạn không nên dựa vào nó.

```js-nolint example-bad
/a{1, 3}/u; // SyntaxError: Invalid regular expression: Incomplete quantifier
```

Đây là lỗi cú pháp nếu số tối thiểu lớn hơn số tối đa.

```js-nolint example-bad
/a{3,2}/; // SyntaxError: Invalid regular expression: numbers out of order in {} quantifier
```

Quantifiers có thể khiến [capturing groups](/en-US/docs/Web/JavaScript/Reference/Regular_expressions/Capturing_group) khớp nhiều lần. Xem trang capturing groups để biết thêm thông tin về hành vi trong trường hợp này.

Mỗi kết quả khớp lặp lại không phải là cùng một chuỗi.

```js
/[ab]*/.exec("aba"); // ['aba']
```

Quantifiers mặc định là _greedy_ (tham lam), có nghĩa là chúng cố gắng khớp càng nhiều lần càng tốt cho đến khi đạt đến giá trị tối đa, hoặc cho đến khi không thể khớp thêm nữa. Bạn có thể làm cho một quantifier _non-greedy_ bằng cách thêm `?` sau nó. Trong trường hợp này, quantifier sẽ cố gắng khớp càng ít lần càng tốt, chỉ khớp thêm lần nếu không thể khớp phần còn lại của pattern với số lần lặp lại này.

```js
/a*/.exec("aaa"); // ['aaa']; the entire input is consumed
/a*?/.exec("aaa"); // ['']; it's possible to consume no characters and still match successfully
/^a*?$/.exec("aaa"); // ['aaa']; it's not possible to consume fewer characters and still match successfully
```

Tuy nhiên, ngay khi regex khớp thành công chuỗi tại một chỉ số nào đó, nó sẽ không thử các chỉ số tiếp theo, mặc dù điều đó có thể dẫn đến việc tiêu thụ ít ký tự hơn.

```js
/a*?$/.exec("aaa"); // ['aaa']; the match already succeeds at the first character, so the regex never attempts to start matching at the second character
```

Greedy quantifiers có thể thử ít lần lặp lại hơn nếu không thể khớp phần còn lại của pattern.

```js
/[ab]+[abc]c/.exec("abbc"); // ['abbc']
```

Trong ví dụ này, `[ab]+` trước tiên tham lam khớp `"abb"`, nhưng `[abc]c` không thể khớp phần còn lại của pattern (`"c"`), vì vậy quantifier bị giảm để chỉ khớp `"ab"`.

Greedy quantifiers tránh khớp vô hạn các chuỗi rỗng. Nếu số lần khớp tối thiểu đã đạt được và không có ký tự nào được tiêu thụ bởi atom tại vị trí này, quantifier dừng khớp. Đây là lý do tại sao `/(a*)*/.exec("b")` không dẫn đến vòng lặp vô hạn.

Greedy quantifiers cố gắng khớp càng nhiều _lần_ càng tốt; nó không tối đa hóa _độ dài_ của kết quả khớp. Ví dụ, `/(aa|aabaac|ba)*/.exec("aabaac")` khớp `"aa"` rồi `"ba"` thay vì `"aabaac"`.

Quantifiers áp dụng cho một atom đơn lẻ. Nếu bạn muốn lượng hóa một pattern dài hơn hoặc một disjunction, bạn phải [nhóm](/en-US/docs/Web/JavaScript/Reference/Regular_expressions/Non-capturing_group) nó. Quantifiers không thể được áp dụng cho [assertions](/en-US/docs/Web/JavaScript/Reference/Regular_expressions#assertions).

```js-nolint example-bad
/^*/; // SyntaxError: Invalid regular expression: nothing to repeat
```

Trong [Unicode-aware mode](/en-US/docs/Web/JavaScript/Reference/Global_Objects/RegExp/unicode#unicode-aware_mode), [lookahead assertions](/en-US/docs/Web/JavaScript/Reference/Regular_expressions/Lookahead_assertion) có thể được lượng hóa. Đây là [cú pháp không dùng nữa để tương thích web](/en-US/docs/Web/JavaScript/Reference/Deprecated_and_obsolete_features#regexp), và bạn không nên dựa vào nó.

```js
/(?=a)?b/.test("b"); // true; the lookahead is matched 0 time
```

## Ví dụ

### Xóa HTML tags

Ví dụ sau xóa các HTML tags được bao trong dấu ngoặc nhọn. Lưu ý việc sử dụng `?` để tránh tiêu thụ quá nhiều ký tự cùng một lúc.

```js
function stripTags(str) {
  return str.replace(/<.+?>/g, "");
}

stripTags("<p><em>lorem</em> <strong>ipsum</strong></p>"); // 'lorem ipsum'
```

Có thể đạt được hiệu ứng tương tự với kết quả khớp tham lam, nhưng không cho phép pattern lặp lại khớp `>`.

```js
function stripTags(str) {
  return str.replace(/<[^>]+>/g, "");
}

stripTags("<p><em>lorem</em> <strong>ipsum</strong></p>"); // 'lorem ipsum'
```

> [!WARNING]
> Đây chỉ để minh họa — nó không xử lý `>` trong giá trị thuộc tính. Hãy sử dụng HTML sanitizer phù hợp như [HTML sanitizer API](/en-US/docs/Web/API/HTML_Sanitizer_API) thay thế.

### Xác định vị trí các đoạn Markdown

Trong Markdown, các đoạn được phân cách bởi một hoặc nhiều dòng trống. Ví dụ sau đếm tất cả các đoạn trong một chuỗi bằng cách khớp hai hoặc nhiều ngắt dòng.

```js
function countParagraphs(str) {
  return str.match(/(?:\r?\n){2,}/g).length + 1;
}

countParagraphs(`
Paragraph 1

Paragraph 2
Containing some line breaks, but still the same paragraph

Another paragraph
`); // 3
```

> [!WARNING]
> Đây chỉ để minh họa — nó không xử lý ngắt dòng trong các khối mã hoặc các phần tử block Markdown khác như tiêu đề. Hãy sử dụng Markdown parser phù hợp thay thế.

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- Hướng dẫn [Quantifiers](/en-US/docs/Web/JavaScript/Guide/Regular_expressions/Quantifiers)
- [Regular expressions](/en-US/docs/Web/JavaScript/Reference/Regular_expressions)
- [Disjunction: `|`](/en-US/docs/Web/JavaScript/Reference/Regular_expressions/Disjunction)
- [Character class: `[...]`, `[^...]`](/en-US/docs/Web/JavaScript/Reference/Regular_expressions/Character_class)
