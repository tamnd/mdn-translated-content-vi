---
title: String.prototype.match()
short-title: match()
slug: Web/JavaScript/Reference/Global_Objects/String/match
page-type: javascript-instance-method
browser-compat: javascript.builtins.String.match
sidebar: jsref
---

Phương thức **`match()`** của các giá trị {{jsxref("String")}} lấy kết quả khớp của string này với một [biểu thức chính quy](/en-US/docs/Web/JavaScript/Guide/Regular_expressions).

{{InteractiveExample("JavaScript Demo: String.prototype.match()", "shorter")}}

```js interactive-example
const paragraph = "The quick brown fox jumps over the lazy dog. It barked.";
const regex = /[A-Z]/g;
const found = paragraph.match(regex);

console.log(found);
// Expected output: Array ["T", "I"]
```

## Cú pháp

```js-nolint
match(regexp)
```

### Tham số

- `regexp`
  - : Một đối tượng biểu thức chính quy, hoặc bất kỳ đối tượng nào có phương thức [`Symbol.match`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Symbol/match).

    Nếu `regexp` không phải là đối tượng `RegExp` và không có phương thức `Symbol.match`, nó được ngầm định chuyển đổi thành {{jsxref("RegExp")}} bằng cách sử dụng `new RegExp(regexp)`.

    Nếu bạn không truyền bất kỳ tham số nào và sử dụng trực tiếp phương thức `match()`, bạn sẽ nhận được một {{jsxref("Array")}} với một string rỗng: `[""]`, vì điều này tương đương với `match(/(?:)/)`.

### Giá trị trả về

Một {{jsxref("Array")}} có nội dung phụ thuộc vào sự có mặt hay vắng mặt của cờ global (`g`), hoặc [`null`](/en-US/docs/Web/JavaScript/Reference/Operators/null) nếu không tìm thấy kết quả khớp.

- Nếu cờ `g` được sử dụng, tất cả các kết quả khớp với biểu thức chính quy hoàn chỉnh sẽ được trả về, nhưng các nhóm bắt không được bao gồm.
- Nếu cờ `g` không được sử dụng, chỉ kết quả khớp đầy đủ đầu tiên và các nhóm bắt liên quan của nó được trả về. Trong trường hợp này, `match()` sẽ trả về kết quả tương tự như {{jsxref("RegExp.prototype.exec()")}} (một mảng với một số thuộc tính bổ sung).

## Mô tả

Việc triển khai `String.prototype.match` không làm nhiều thứ khác ngoài việc gọi phương thức `Symbol.match` của đối số với string là tham số đầu tiên. Việc triển khai thực tế đến từ [`RegExp.prototype[Symbol.match]()`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/RegExp/Symbol.match).

- Nếu bạn cần biết liệu một string có khớp với biểu thức chính quy {{jsxref("RegExp")}} hay không, hãy sử dụng {{jsxref("RegExp.prototype.test()")}}.
- Nếu bạn chỉ muốn kết quả khớp đầu tiên được tìm thấy, bạn có thể muốn sử dụng {{jsxref("RegExp.prototype.exec()")}} thay thế.
- Nếu bạn muốn lấy các nhóm bắt và cờ global được đặt, bạn cần sử dụng {{jsxref("RegExp.prototype.exec()")}} hoặc {{jsxref("String.prototype.matchAll()")}} thay thế.

Để biết thêm thông tin về ngữ nghĩa của `match()` khi truyền vào một regex, xem [`RegExp.prototype[Symbol.match]()`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/RegExp/Symbol.match).

## Ví dụ

### Sử dụng match()

Trong ví dụ sau, `match()` được sử dụng để tìm `"Chapter"` theo sau bởi một hoặc nhiều ký tự số theo sau bởi dấu thập phân và ký tự số không hoặc nhiều lần.

Biểu thức chính quy bao gồm cờ `i` để các sự khác biệt chữ hoa chữ thường sẽ bị bỏ qua.

```js
const str = "For more information, see Chapter 3.4.5.1";
const re = /see (chapter \d+(\.\d)*)/i;
const found = str.match(re);

console.log(found);
// [
//   'see Chapter 3.4.5.1',
//   'Chapter 3.4.5.1',
//   '.1',
//   index: 22,
//   input: 'For more information, see Chapter 3.4.5.1',
//   groups: undefined
// ]
```

Trong kết quả khớp trên, `'see Chapter 3.4.5.1'` là toàn bộ kết quả khớp. `'Chapter 3.4.5.1'` được bắt bởi `(chapter \d+(\.\d)*)`. `'.1'` là giá trị cuối cùng được bắt bởi `(\.\d)`. Thuộc tính `index` (`22`) là chỉ mục bắt đầu từ 0 của toàn bộ kết quả khớp. Thuộc tính `input` là string gốc được phân tích cú pháp.

### Sử dụng cờ global và ignoreCase với match()

Ví dụ sau minh họa việc sử dụng cờ global và ignore-case với `match()`. Tất cả các chữ cái từ `A` đến `E` và từ `a` đến `e` được trả về, mỗi chữ cái là một phần tử riêng trong mảng.

```js
const str = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz";
const regexp = /[a-e]/gi;
const matches = str.match(regexp);

console.log(matches);
// ['A', 'B', 'C', 'D', 'E', 'a', 'b', 'c', 'd', 'e']
```

> [!NOTE]
> Xem thêm {{jsxref("String.prototype.matchAll()")}} và [Advanced searching with flags](/en-US/docs/Web/JavaScript/Guide/Regular_expressions#advanced_searching_with_flags).

### Sử dụng các nhóm bắt được đặt tên

Trong các trình duyệt hỗ trợ các nhóm bắt được đặt tên, đoạn code sau bắt `"fox"` hoặc `"cat"` vào một nhóm có tên là `animal`:

```js
const paragraph = "The quick brown fox jumps over the lazy dog. It barked.";

const capturingRegex = /(?<animal>fox|cat) jumps over/;
const found = paragraph.match(capturingRegex);
console.log(found.groups); // {animal: "fox"}
```

### Sử dụng match() không có tham số

```js
const str = "Nothing will come of nothing.";

str.match(); // returns [""]
```

### Sử dụng match() với đối tượng không phải RegExp triển khai `[Symbol.match]()`

Nếu một đối tượng có phương thức `Symbol.match`, nó có thể được sử dụng như một matcher tùy chỉnh. Giá trị trả về của `Symbol.match` trở thành giá trị trả về của `match()`.

```js
const str = "Hmm, this is interesting.";

str.match({
  [Symbol.match](str) {
    return ["Yes, it's interesting."];
  },
}); // returns ["Yes, it's interesting."]
```

### Không phải RegExp như tham số

Khi tham số `regexp` là string hoặc số, nó được ngầm định chuyển đổi thành {{jsxref("RegExp")}} bằng cách sử dụng `new RegExp(regexp)`.

```js
const str1 =
  "All numbers except NaN satisfy <= Infinity and >= -Infinity in JavaScript.";
const str2 =
  "My grandfather is 65 years old and My grandmother is 63 years old.";
const str3 = "The contract was declared null and void.";
str1.match("number"); // "number" is a string. returns ["number"]
str1.match(NaN); // the type of NaN is the number. returns ["NaN"]
str1.match(Infinity); // the type of Infinity is the number. returns ["Infinity"]
str1.match(-Infinity); // returns ["-Infinity"]
str2.match(65); // returns ["65"]
str3.match(null); // returns ["null"]
```

Điều này có thể tạo ra các kết quả bất ngờ nếu các ký tự đặc biệt không được thoát đúng cách.

```js
console.log("123".match("1.3")); // [ "123" ]
```

Đây là kết quả khớp vì `.` trong regex khớp với bất kỳ ký tự nào. Để chỉ khớp với một ký tự dấu chấm cụ thể, bạn cần thoát đầu vào.

```js
console.log("123".match("1\\.3")); // null
```

## Đặc tả

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Polyfill of `String.prototype.match` in `core-js` with fixes and implementation of modern behavior like `Symbol.match` support](https://github.com/zloirock/core-js#ecmascript-string-and-regexp)
- [Regular expressions](/en-US/docs/Web/JavaScript/Guide/Regular_expressions) guide
- {{jsxref("String.prototype.matchAll()")}}
- {{jsxref("RegExp")}}
- {{jsxref("RegExp.prototype.exec()")}}
- {{jsxref("RegExp.prototype.test()")}}
