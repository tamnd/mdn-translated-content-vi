---
title: "Capturing group: (...)"
slug: Web/JavaScript/Reference/Regular_expressions/Capturing_group
page-type: javascript-language-feature
browser-compat: javascript.regular_expressions.capturing_group
sidebar: jssidebar
---

Một **capturing group** nhóm một subpattern, cho phép bạn áp dụng một [quantifier](/en-US/docs/Web/JavaScript/Reference/Regular_expressions/Quantifier) cho toàn bộ nhóm hoặc sử dụng [disjunctions](/en-US/docs/Web/JavaScript/Reference/Regular_expressions/Disjunction) bên trong nó. Nó ghi nhớ thông tin về kết quả khớp subpattern, để bạn có thể tham chiếu lại sau với [backreference](/en-US/docs/Web/JavaScript/Reference/Regular_expressions/Backreference), hoặc truy cập thông tin qua [kết quả khớp](/en-US/docs/Web/JavaScript/Reference/Global_Objects/RegExp/exec#return_value).

Nếu bạn không cần kết quả của kết quả khớp subpattern, hãy sử dụng [non-capturing group](/en-US/docs/Web/JavaScript/Reference/Regular_expressions/Non-capturing_group) thay thế, giúp cải thiện hiệu suất và tránh các nguy cơ khi tái cấu trúc.

## Cú pháp

```regex
(pattern)
```

### Tham số

- `pattern`
  - : Một pattern bao gồm bất cứ thứ gì bạn có thể sử dụng trong một regex literal, bao gồm cả [disjunction](/en-US/docs/Web/JavaScript/Reference/Regular_expressions/Disjunction).

## Mô tả

Một capturing group hoạt động giống như [toán tử nhóm](/en-US/docs/Web/JavaScript/Reference/Operators/Grouping) trong các biểu thức JavaScript, cho phép bạn sử dụng một subpattern như một [atom](/en-US/docs/Web/JavaScript/Reference/Regular_expressions#atoms) đơn lẻ.

Các capturing groups được đánh số theo thứ tự của dấu ngoặc mở của chúng. Capturing group đầu tiên được đánh số `1`, cái thứ hai là `2`, v.v. [Named capturing groups](/en-US/docs/Web/JavaScript/Reference/Regular_expressions/Named_capturing_group) cũng là các capturing groups và được đánh số cùng với các capturing groups khác (không có tên). Thông tin về kết quả khớp của capturing group có thể được truy cập qua:

- Giá trị trả về (là một mảng) của {{jsxref("RegExp.prototype.exec()")}}, {{jsxref("String.prototype.match()")}}, và {{jsxref("String.prototype.matchAll()")}}
- Các tham số `pN` của hàm callback `replacement` của các phương thức {{jsxref("String.prototype.replace()")}} và {{jsxref("String.prototype.replaceAll()")}}
- [Backreferences](/en-US/docs/Web/JavaScript/Reference/Regular_expressions/Backreference) trong cùng một pattern

> [!NOTE]
> Ngay cả trong mảng kết quả của `exec()`, các capturing groups được truy cập bằng số `1`, `2`, v.v., vì phần tử `0` là toàn bộ kết quả khớp. `\0` không phải là backreference, mà là [character escape](/en-US/docs/Web/JavaScript/Reference/Regular_expressions/Character_escape) cho ký tự NUL.

Các capturing groups trong mã nguồn regex tương ứng một-một với kết quả của chúng. Nếu một capturing group không khớp (ví dụ: nó thuộc về một lựa chọn thay thế không khớp trong một [disjunction](/en-US/docs/Web/JavaScript/Reference/Regular_expressions/Disjunction)), kết quả tương ứng là `undefined`.

```js
/(ab)|(cd)/.exec("cd"); // ['cd', undefined, 'cd']
```

Các capturing groups có thể được [lượng hóa](/en-US/docs/Web/JavaScript/Reference/Regular_expressions/Quantifier). Trong trường hợp này, thông tin khớp tương ứng với nhóm này là kết quả khớp cuối cùng của nhóm.

```js
/([ab])+/.exec("abc"); // ['ab', 'b']; because "b" comes after "a", this result overwrites the previous one
```

Các capturing groups có thể được sử dụng trong các assertion [lookahead](/en-US/docs/Web/JavaScript/Reference/Regular_expressions/Lookahead_assertion) và [lookbehind](/en-US/docs/Web/JavaScript/Reference/Regular_expressions/Lookbehind_assertion). Vì lookbehind assertions khớp các atom của chúng theo chiều ngược lại, kết quả khớp cuối cùng tương ứng với nhóm này là kết quả xuất hiện ở đầu _trái_ của chuỗi. Tuy nhiên, các chỉ số của các nhóm khớp vẫn tương ứng với các vị trí tương đối của chúng trong mã nguồn regex.

```js
/c(?=(ab))/.exec("cab"); // ['c', 'ab']
/(?<=(a)(b))c/.exec("abc"); // ['c', 'a', 'b']
/(?<=([ab])+)c/.exec("abc"); // ['c', 'a']; because "a" is seen by the lookbehind after the lookbehind has seen "b"
```

Các capturing groups có thể được lồng nhau, trong trường hợp đó nhóm bên ngoài được đánh số trước, sau đó nhóm bên trong, vì chúng được sắp xếp theo dấu ngoặc mở của chúng. Nếu một nhóm lồng nhau được lặp lại bởi một quantifier, thì mỗi khi nhóm khớp, kết quả của các nhóm con đều bị ghi đè, đôi khi là với `undefined`.

```js
/((a+)?(b+)?(c))*/.exec("aacbbbcac"); // ['aacbbbcac', 'ac', 'a', undefined, 'c']
```

Trong ví dụ trên, nhóm bên ngoài được khớp ba lần:

1. Khớp `"aac"`, với các nhóm con `"aa"`, `undefined`, và `"c"`.
2. Khớp `"bbbc"`, với các nhóm con `undefined`, `"bbb"`, và `"c"`.
3. Khớp `"ac"`, với các nhóm con `"a"`, `undefined`, và `"c"`.

Kết quả `"bbb"` từ lần khớp thứ hai không được giữ lại, vì lần khớp thứ ba ghi đè nó bằng `undefined`.

Bạn có thể lấy chỉ số bắt đầu và kết thúc của mỗi capturing group trong chuỗi đầu vào bằng cách sử dụng flag [`d`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/RegExp/hasIndices). Điều này tạo ra một thuộc tính `indices` bổ sung trên mảng được trả về bởi `exec()`.

Bạn có thể tùy chọn chỉ định một tên cho một capturing group, giúp tránh các lỗi liên quan đến vị trí và chỉ số nhóm. Xem [Named capturing groups](/en-US/docs/Web/JavaScript/Reference/Regular_expressions/Named_capturing_group) để biết thêm thông tin.

Dấu ngoặc đơn có các mục đích khác trong các cú pháp regex khác nhau. Ví dụ, chúng cũng bao quanh các assertions lookahead và lookbehind. Vì các cú pháp này đều bắt đầu với `?`, và `?` là một [quantifier](/en-US/docs/Web/JavaScript/Reference/Regular_expressions/Quantifier) thông thường không thể xuất hiện trực tiếp sau `(`, điều này không dẫn đến sự mơ hồ.

## Ví dụ

### Khớp ngày tháng

Ví dụ sau khớp một ngày theo định dạng `YYYY-MM-DD`:

```js
function parseDate(input) {
  const parts = /^(\d{4})-(\d{2})-(\d{2})$/.exec(input);
  if (!parts) {
    return null;
  }
  return parts.slice(1).map((p) => parseInt(p, 10));
}

parseDate("2019-01-01"); // [2019, 1, 1]
parseDate("2019-06-19"); // [2019, 6, 19]
```

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

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- Hướng dẫn [Groups and backreferences](/en-US/docs/Web/JavaScript/Guide/Regular_expressions/Groups_and_backreferences)
- [Regular expressions](/en-US/docs/Web/JavaScript/Reference/Regular_expressions)
- [Non-capturing group: `(?:...)`](/en-US/docs/Web/JavaScript/Reference/Regular_expressions/Non-capturing_group)
- [Named capturing group: `(?<name>...)`](/en-US/docs/Web/JavaScript/Reference/Regular_expressions/Named_capturing_group)
- [Backreference: `\1`, `\2`](/en-US/docs/Web/JavaScript/Reference/Regular_expressions/Backreference)
