---
title: "Lookbehind assertion: (?<=...), (?<!...)"
slug: Web/JavaScript/Reference/Regular_expressions/Lookbehind_assertion
page-type: javascript-language-feature
browser-compat: javascript.regular_expressions.lookbehind_assertion
sidebar: jssidebar
---

Một **lookbehind assertion** "nhìn về phía sau": nó cố gắng khớp đầu vào trước đó với pattern đã cho, nhưng nó không tiêu thụ bất kỳ đầu vào nào — nếu kết quả khớp thành công, vị trí hiện tại trong đầu vào vẫn giữ nguyên. Nó khớp từng atom trong pattern của nó theo thứ tự ngược lại.

## Cú pháp

```regex
(?<=pattern)
(?<!pattern)
```

### Tham số

- `pattern`
  - : Một pattern bao gồm bất cứ thứ gì bạn có thể sử dụng trong một regex literal, bao gồm cả [disjunction](/en-US/docs/Web/JavaScript/Reference/Regular_expressions/Disjunction).

## Mô tả

Một regular expression thường khớp từ trái sang phải. Đây là lý do tại sao các assertions [lookahead](/en-US/docs/Web/JavaScript/Reference/Regular_expressions/Lookahead_assertion) và lookbehind được gọi như vậy — lookahead xác nhận những gì ở bên phải, và lookbehind xác nhận những gì ở bên trái.

Để một assertion `(?<=pattern)` thành công, `pattern` phải khớp với đầu vào ngay ở bên trái của vị trí hiện tại, nhưng vị trí hiện tại không thay đổi trước khi khớp đầu vào tiếp theo. Dạng `(?<!pattern)` phủ định assertion — nó thành công nếu `pattern` không khớp với đầu vào ngay ở bên trái của vị trí hiện tại.

Lookbehind thường có cùng ngữ nghĩa như lookahead — tuy nhiên, trong một lookbehind assertion, regular expression khớp _ngược_. Ví dụ,

```js
/(?<=([ab]+)([bc]+))$/.exec("abc"); // ['', 'a', 'bc']
// Not ['', 'ab', 'c']
```

Nếu lookbehind khớp từ trái sang phải, nó trước tiên nên tham lam khớp `[ab]+`, làm cho nhóm đầu tiên ghi lại `"ab"`, và `"c"` còn lại được ghi lại bởi `[bc]+`. Tuy nhiên, vì `[bc]+` được khớp trước, nó tham lam lấy `"bc"`, chỉ để lại `"a"` cho `[ab]+`.

Hành vi này là hợp lý — matcher không biết _bắt đầu_ kết quả khớp ở đâu (vì lookbehind có thể không có độ dài cố định), nhưng nó biết _kết thúc_ ở đâu (tại vị trí hiện tại). Do đó, nó bắt đầu từ vị trí hiện tại và làm việc ngược lại. (Regexes trong một số ngôn ngữ khác cấm lookbehind không cố định độ dài để tránh vấn đề này.)

Đối với các [capturing groups](/en-US/docs/Web/JavaScript/Reference/Regular_expressions/Capturing_group) được [lượng hóa](/en-US/docs/Web/JavaScript/Reference/Regular_expressions/Quantifier) bên trong lookbehind, kết quả khớp ở ngoài cùng bên trái của chuỗi đầu vào — thay vì kết quả ở bên phải — được ghi lại do khớp ngược. Xem trang capturing groups để biết thêm thông tin. [Backreferences](/en-US/docs/Web/JavaScript/Reference/Regular_expressions/Backreference) bên trong lookbehind phải xuất hiện ở _bên trái_ của nhóm nó đang tham chiếu, cũng do khớp ngược. Tuy nhiên, [disjunctions](/en-US/docs/Web/JavaScript/Reference/Regular_expressions/Disjunction) vẫn được thử từ trái sang phải.

## Ví dụ

### Khớp chuỗi mà không tiêu thụ chúng

Tương tự như [lookaheads](/en-US/docs/Web/JavaScript/Reference/Regular_expressions/Lookahead_assertion#matching_strings_without_consuming_them), lookbehinds có thể được sử dụng để khớp chuỗi mà không tiêu thụ chúng để chỉ trích xuất thông tin hữu ích. Ví dụ, regex sau khớp số trong nhãn giá:

```js
function getPrice(label) {
  return /(?<=\$)\d+(?:\.\d*)?/.exec(label)?.[0];
}

getPrice("$10.53"); // "10.53"
getPrice("10.53"); // undefined
```

Có thể đạt được hiệu ứng tương tự bằng cách [ghi lại](/en-US/docs/Web/JavaScript/Reference/Regular_expressions/Capturing_group) kết quả khớp con bạn quan tâm.

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- Hướng dẫn [Assertions](/en-US/docs/Web/JavaScript/Guide/Regular_expressions/Assertions)
- [Regular expressions](/en-US/docs/Web/JavaScript/Reference/Regular_expressions)
- [Input boundary assertion: `^`, `$`](/en-US/docs/Web/JavaScript/Reference/Regular_expressions/Input_boundary_assertion)
- [Word boundary assertion: `\b`, `\B`](/en-US/docs/Web/JavaScript/Reference/Regular_expressions/Word_boundary_assertion)
- [Lookahead assertion: `(?=...)`, `(?!...)`](/en-US/docs/Web/JavaScript/Reference/Regular_expressions/Lookahead_assertion)
- [Capturing group: `(...)`](/en-US/docs/Web/JavaScript/Reference/Regular_expressions/Capturing_group)
