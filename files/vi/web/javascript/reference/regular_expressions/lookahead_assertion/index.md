---
title: "Lookahead assertion: (?=...), (?!...)"
slug: Web/JavaScript/Reference/Regular_expressions/Lookahead_assertion
page-type: javascript-language-feature
browser-compat: javascript.regular_expressions.lookahead_assertion
sidebar: jssidebar
---

Một **lookahead assertion** "nhìn về phía trước": nó cố gắng khớp đầu vào tiếp theo với pattern đã cho, nhưng nó không tiêu thụ bất kỳ đầu vào nào — nếu kết quả khớp thành công, vị trí hiện tại trong đầu vào vẫn giữ nguyên.

## Cú pháp

```regex
(?=pattern)
(?!pattern)
```

### Tham số

- `pattern`
  - : Một pattern bao gồm bất cứ thứ gì bạn có thể sử dụng trong một regex literal, bao gồm cả [disjunction](/en-US/docs/Web/JavaScript/Reference/Regular_expressions/Disjunction).

## Mô tả

Một regular expression thường khớp từ trái sang phải. Đây là lý do tại sao các assertions lookahead và [lookbehind](/en-US/docs/Web/JavaScript/Reference/Regular_expressions/Lookbehind_assertion) được gọi như vậy — lookahead xác nhận những gì ở bên phải, và lookbehind xác nhận những gì ở bên trái.

Để một assertion `(?=pattern)` thành công, `pattern` phải khớp với văn bản sau vị trí hiện tại, nhưng vị trí hiện tại không thay đổi. Dạng `(?!pattern)` phủ định assertion — nó thành công nếu `pattern` không khớp tại vị trí hiện tại.

`pattern` có thể chứa [capturing groups](/en-US/docs/Web/JavaScript/Reference/Regular_expressions/Capturing_group). Xem trang capturing groups để biết thêm thông tin về hành vi trong trường hợp này.

Không giống như các toán tử regular expression khác, không có backtracking vào lookahead — hành vi này được kế thừa từ Perl. Điều này chỉ quan trọng khi `pattern` chứa [capturing groups](/en-US/docs/Web/JavaScript/Reference/Regular_expressions/Capturing_group) và pattern sau lookahead chứa [backreferences](/en-US/docs/Web/JavaScript/Reference/Regular_expressions/Backreference) đến những captures đó. Ví dụ:

```js
/(?=(a+))a*b\1/.exec("baabac"); // ['aba', 'a']
// Not ['aaba', 'a']
```

Việc khớp pattern ở trên xảy ra như sau:

1. Lookahead `(a+)` thành công trước `"a"` đầu tiên trong `"baabac"`, và `"aa"` được ghi lại vì quantifier là tham lam.
2. `a*b` khớp `"aab"` trong `"baabac"` vì lookaheads không tiêu thụ các chuỗi đã khớp.
3. `\1` không khớp chuỗi sau, vì điều đó yêu cầu 2 `"a"`, nhưng chỉ có 1 có sẵn. Vì vậy matcher backtracks, nhưng nó không đi vào lookahead, vì vậy capturing group không thể bị giảm xuống còn 1 `"a"`, và toàn bộ kết quả khớp thất bại tại điểm này.
4. `exec()` thử lại việc khớp tại vị trí tiếp theo — trước `"a"` thứ hai. Lần này, lookahead khớp `"a"`, và `a*b` khớp `"ab"`. Backreference `\1` khớp `"a"` đã được ghi lại, và kết quả khớp thành công.

Nếu regex có thể backtrack vào lookahead và sửa đổi lựa chọn được thực hiện ở đó, thì kết quả khớp sẽ thành công ở bước 3 bởi `(a+)` khớp `"a"` đầu tiên (thay vì hai `"a"` đầu tiên) và `a*b` khớp `"aab"`, mà không cần thậm chí thử lại vị trí đầu vào tiếp theo.

Các negative lookaheads cũng có thể chứa capturing groups, nhưng các backreferences chỉ có ý nghĩa trong `pattern`, vì nếu việc khớp tiếp tục, `pattern` chắc chắn sẽ không được khớp (nếu không assertion thất bại). Điều này có nghĩa là bên ngoài `pattern`, các backreferences đến những capturing groups đó trong các negative lookaheads luôn thành công. Ví dụ:

```js
/(.*?)a(?!(a+)b\2c)\2(.*)/.exec("baaabaac"); // ['baaabaac', 'ba', undefined, 'abaac']
```

Việc khớp pattern ở trên xảy ra như sau:

1. Pattern `(.*?)` là non-greedy, vì vậy nó bắt đầu bằng cách không khớp gì. Tuy nhiên, ký tự tiếp theo là `a`, không khớp `"b"` trong đầu vào.
2. Pattern `(.*?)` khớp `"b"` để `a` trong pattern khớp `"a"` đầu tiên trong `"baaabaac"`.
3. Tại vị trí này, lookahead thành công khớp, vì nếu `(a+)` khớp `"aa"`, thì `(a+)b\2c` khớp `"aabaac"`. Điều này khiến assertion thất bại, vì vậy matcher backtracks.
4. Pattern `(.*?)` khớp `"ba"` để `a` trong pattern khớp `"a"` thứ hai trong `"baaabaac"`.
5. Tại vị trí này, lookahead thất bại khớp, vì đầu vào còn lại không theo pattern "bất kỳ số `"a"`, một `"b"`, cùng số `"a"`, một `c`". Điều này khiến assertion thành công.
6. Tuy nhiên, vì không có gì được khớp trong assertion, backreference `\2` không có giá trị, vì vậy nó khớp chuỗi rỗng. Điều này khiến phần còn lại của đầu vào được tiêu thụ bởi `(.*)` ở cuối.

Thông thường, các assertions không thể được [lượng hóa](/en-US/docs/Web/JavaScript/Reference/Regular_expressions/Quantifier). Tuy nhiên, trong [Unicode-unaware mode](/en-US/docs/Web/JavaScript/Reference/Global_Objects/RegExp/unicode#unicode-aware_mode), lookahead assertions có thể được lượng hóa. Đây là [cú pháp không dùng nữa để tương thích web](/en-US/docs/Web/JavaScript/Reference/Deprecated_and_obsolete_features#regexp), và bạn không nên dựa vào nó.

```js
/(?=a)?b/.test("b"); // true; the lookahead is matched 0 time
```

## Ví dụ

### Khớp chuỗi mà không tiêu thụ chúng

Đôi khi hữu ích để xác thực rằng chuỗi đã khớp được theo sau bởi một thứ gì đó mà không trả về thứ đó như kết quả. Ví dụ sau khớp một chuỗi được theo sau bởi dấu phẩy/dấu chấm, nhưng dấu câu không được bao gồm trong kết quả:

```js
function getFirstSubsentence(str) {
  return /^.*?(?=[,.])/.exec(str)?.[0];
}

getFirstSubsentence("Hello, world!"); // "Hello"
getFirstSubsentence("Thank you."); // "Thank you"
```

Có thể đạt được hiệu ứng tương tự bằng cách [ghi lại](/en-US/docs/Web/JavaScript/Reference/Regular_expressions/Capturing_group) kết quả khớp con bạn quan tâm.

### Phép trừ và giao pattern

Sử dụng lookahead, bạn có thể khớp một chuỗi nhiều lần với các pattern khác nhau, cho phép bạn biểu diễn các mối quan hệ phức tạp như phép trừ (là X nhưng không phải Y) và giao (là cả X và Y).

Ví dụ sau khớp bất kỳ [identifier](/en-US/docs/Web/JavaScript/Reference/Lexical_grammar#identifiers) nào không phải là [reserved word](/en-US/docs/Web/JavaScript/Reference/Lexical_grammar#reserved_words) (chỉ hiển thị ba reserved words ở đây để ngắn gọn; có thể thêm nhiều reserved words hơn vào disjunction này). Cú pháp `[$_\p{ID_Start}][$\p{ID_Continue}]*` mô tả chính xác tập hợp các chuỗi identifier trong đặc tả ngôn ngữ; bạn có thể đọc thêm về identifiers trong [lexical grammar](/en-US/docs/Web/JavaScript/Reference/Lexical_grammar#identifiers) và escape `\p` trong [Unicode character class escape](/en-US/docs/Web/JavaScript/Reference/Regular_expressions/Unicode_character_class_escape).

```js
function isValidIdentifierName(str) {
  const re = /^(?!(?:break|case|catch)$)[$_\p{ID_Start}][$\p{ID_Continue}]*$/u;
  return re.test(str);
}

isValidIdentifierName("break"); // false
isValidIdentifierName("foo"); // true
isValidIdentifierName("cases"); // true
```

Ví dụ sau khớp một chuỗi vừa là ASCII vừa có thể được sử dụng như một phần của identifier:

```js
function isASCIIIDPart(char) {
  return /^(?=\p{ASCII}$)\p{ID_Start}$/u.test(char);
}

isASCIIIDPart("a"); // true
isASCIIIDPart("α"); // false
isASCIIIDPart(":"); // false
```

Nếu bạn đang thực hiện giao và phép trừ với số ký tự hữu hạn, bạn có thể muốn sử dụng cú pháp [character set intersection](/en-US/docs/Web/JavaScript/Reference/Regular_expressions/Character_class#v-mode_character_class) được bật với flag `v`.

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- Hướng dẫn [Assertions](/en-US/docs/Web/JavaScript/Guide/Regular_expressions/Assertions)
- [Regular expressions](/en-US/docs/Web/JavaScript/Reference/Regular_expressions)
- [Input boundary assertion: `^`, `$`](/en-US/docs/Web/JavaScript/Reference/Regular_expressions/Input_boundary_assertion)
- [Word boundary assertion: `\b`, `\B`](/en-US/docs/Web/JavaScript/Reference/Regular_expressions/Word_boundary_assertion)
- [Lookbehind assertion: `(?<=...)`, `(?<!...)`](/en-US/docs/Web/JavaScript/Reference/Regular_expressions/Lookbehind_assertion)
- [Capturing group: `(...)`](/en-US/docs/Web/JavaScript/Reference/Regular_expressions/Capturing_group)
