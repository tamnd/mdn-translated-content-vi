---
title: "Disjunction: |"
slug: Web/JavaScript/Reference/Regular_expressions/Disjunction
page-type: javascript-language-feature
browser-compat: javascript.regular_expressions.disjunction
sidebar: jssidebar
---

Một **disjunction** chỉ định nhiều lựa chọn thay thế. Bất kỳ lựa chọn thay thế nào khớp với đầu vào khiến toàn bộ disjunction được khớp.

## Cú pháp

```regex
alternative1|alternative2
alternative1|alternative2|alternative3|…
```

### Tham số

- `alternativeN`
  - : Một pattern lựa chọn thay thế, bao gồm một chuỗi các [atoms và assertions](/en-US/docs/Web/JavaScript/Reference/Regular_expressions#assertions). Khớp thành công một lựa chọn thay thế khiến toàn bộ disjunction được khớp.

## Mô tả

Toán tử `|` trong regular expression phân tách hai hoặc nhiều _lựa chọn thay thế_. Pattern trước tiên cố gắng khớp lựa chọn thay thế đầu tiên; nếu thất bại, nó cố gắng khớp lựa chọn thứ hai, v.v. Ví dụ, đoạn sau khớp `"a"` thay vì `"ab"`, vì lựa chọn thay thế đầu tiên đã khớp thành công:

```js
/a|ab/.exec("abc"); // ['a']
```

Toán tử `|` có độ ưu tiên thấp nhất trong một regular expression. Nếu bạn muốn sử dụng một disjunction như một phần của pattern lớn hơn, bạn phải [nhóm](/en-US/docs/Web/JavaScript/Reference/Regular_expressions/Non-capturing_group) nó.

Khi một disjunction được nhóm có thêm các biểu thức sau nó, việc khớp bắt đầu bằng cách chọn lựa chọn thay thế đầu tiên và cố gắng khớp phần còn lại của regular expression. Nếu phần còn lại của regular expression không khớp, matcher thử lựa chọn thay thế tiếp theo. Ví dụ,

```js
/(?:(a)|(ab))(?:(c)|(bc))/.exec("abc"); // ['abc', 'a', undefined, undefined, 'bc']
// Not ['abc', undefined, 'ab', 'c', undefined]
```

Điều này là vì bằng cách chọn `a` trong lựa chọn thay thế đầu tiên, có thể chọn `bc` trong lựa chọn thay thế thứ hai và kết quả là một kết quả khớp thành công. Quá trình này được gọi là _backtracking_, vì matcher trước tiên đi qua disjunction và sau đó quay lại nó khi việc khớp tiếp theo thất bại.

Cũng lưu ý rằng bất kỳ dấu ngoặc capturing nào bên trong một lựa chọn thay thế không khớp tạo ra `undefined` trong mảng kết quả.

Một lựa chọn thay thế có thể trống, trong trường hợp đó nó khớp chuỗi rỗng (nói cách khác, luôn khớp).

Các lựa chọn thay thế luôn được thử từ trái sang phải, bất kể chiều khớp (bị đảo ngược trong [lookbehind](/en-US/docs/Web/JavaScript/Reference/Regular_expressions/Lookbehind_assertion)).

## Ví dụ

### Khớp phần mở rộng file

Ví dụ sau khớp các phần mở rộng file, sử dụng cùng mã như bài viết [input boundary assertion](/en-US/docs/Web/JavaScript/Reference/Regular_expressions/Input_boundary_assertion#matching_file_extensions):

```js
function isImage(filename) {
  return /\.(?:png|jpe?g|webp|avif|gif)$/i.test(filename);
}

isImage("image.png"); // true
isImage("image.jpg"); // true
isImage("image.pdf"); // false
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- Hướng dẫn [Character classes](/en-US/docs/Web/JavaScript/Guide/Regular_expressions/Character_classes)
- [Regular expressions](/en-US/docs/Web/JavaScript/Reference/Regular_expressions)
- [Quantifier: `*`, `+`, `?`, `{n}`, `{n,}`, `{n,m}`](/en-US/docs/Web/JavaScript/Reference/Regular_expressions/Quantifier)
- [Character class: `[...]`, `[^...]`](/en-US/docs/Web/JavaScript/Reference/Regular_expressions/Character_class)
