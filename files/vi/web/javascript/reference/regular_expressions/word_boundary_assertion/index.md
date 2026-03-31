---
title: "Word boundary assertion: \\b, \\B"
slug: Web/JavaScript/Reference/Regular_expressions/Word_boundary_assertion
page-type: javascript-language-feature
browser-compat: javascript.regular_expressions.word_boundary_assertion
sidebar: jssidebar
---

Một **word boundary assertion** kiểm tra xem vị trí hiện tại trong chuỗi có phải là ranh giới từ không. Ranh giới từ là nơi ký tự tiếp theo là ký tự từ và ký tự trước đó không phải là ký tự từ, hoặc ngược lại.

## Cú pháp

```regex
\b
\B
```

## Mô tả

`\b` xác nhận rằng vị trí hiện tại trong chuỗi là ranh giới từ. `\B` phủ định assertion: nó xác nhận rằng vị trí hiện tại không phải là ranh giới từ. Cả hai đều là _assertions_, vì vậy không giống như các [character escapes](/en-US/docs/Web/JavaScript/Reference/Regular_expressions/Character_escape) hoặc [character class escapes](/en-US/docs/Web/JavaScript/Reference/Regular_expressions/Character_class_escape) khác, `\b` và `\B` không tiêu thụ bất kỳ ký tự nào.

Một ký tự từ bao gồm những ký tự sau:

- Các chữ cái (A–Z, a–z), số (0–9), và dấu gạch dưới (\_).
- Nếu regex là [Unicode-aware](/en-US/docs/Web/JavaScript/Reference/Global_Objects/RegExp/unicode#unicode-aware_mode) và flag [`i`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/RegExp/ignoreCase) được đặt, các ký tự Unicode khác được chuẩn hóa thành một trong các ký tự trên thông qua [case folding](https://unicode.org/Public/UCD/latest/ucd/CaseFolding.txt).

Các ký tự từ cũng được khớp bởi character class escape `\w`.

Các vị trí đầu vào vượt ra ngoài giới hạn được coi là các ký tự không phải từ. Ví dụ, các kết quả khớp sau thành công:

```js
/\ba/.exec("abc");
/c\b/.exec("abc");

/\B /.exec(" abc");
/ \B/.exec("abc ");
```

## Ví dụ

### Phát hiện các từ

Ví dụ sau phát hiện xem một chuỗi có chứa từ "thanks" hoặc "thank you" không:

```js
function hasThanks(str) {
  return /\b(thanks|thank you)\b/i.test(str);
}

hasThanks("Thanks! You helped me a lot."); // true
hasThanks("Just want to say thank you for all your work."); // true
hasThanks("Thanksgiving is around the corner."); // false
```

> [!WARNING]
> Không phải tất cả các ngôn ngữ đều có ranh giới từ được định nghĩa rõ ràng. Nếu bạn đang làm việc với các ngôn ngữ như tiếng Trung hay tiếng Thái, trong đó không có dấu phân cách khoảng trắng, hãy sử dụng thư viện nâng cao hơn như {{jsxref("Intl.Segmenter")}} để tìm kiếm các từ thay thế.

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- Hướng dẫn [Assertions](/en-US/docs/Web/JavaScript/Guide/Regular_expressions/Assertions)
- [Regular expressions](/en-US/docs/Web/JavaScript/Reference/Regular_expressions)
- [Input boundary assertion: `^`, `$`](/en-US/docs/Web/JavaScript/Reference/Regular_expressions/Input_boundary_assertion)
- [Lookahead assertion: `(?=...)`, `(?!...)`](/en-US/docs/Web/JavaScript/Reference/Regular_expressions/Lookahead_assertion)
- [Lookbehind assertion: `(?<=...)`, `(?<!...)`](/en-US/docs/Web/JavaScript/Reference/Regular_expressions/Lookbehind_assertion)
- [Character escape: `\n`, `\u{...}`](/en-US/docs/Web/JavaScript/Reference/Regular_expressions/Character_escape)
