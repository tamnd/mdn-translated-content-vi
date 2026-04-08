---
title: String.prototype.matchAll()
short-title: matchAll()
slug: Web/JavaScript/Reference/Global_Objects/String/matchAll
page-type: javascript-instance-method
browser-compat: javascript.builtins.String.matchAll
sidebar: jsref
---

Phương thức **`matchAll()`** của các giá trị {{jsxref("String")}} trả về một iterator của tất cả các kết quả khớp của string này với một [biểu thức chính quy](/en-US/docs/Web/JavaScript/Guide/Regular_expressions), bao gồm cả [các nhóm bắt](/en-US/docs/Web/JavaScript/Guide/Regular_expressions/Groups_and_backreferences).

{{InteractiveExample("JavaScript Demo: String.prototype.matchAll()")}}

```js interactive-example
const regexp = /t(e)(st(\d?))/g;
const str = "test1test2";

const array = [...str.matchAll(regexp)];

console.log(array[0]);
// Expected output: Array ["test1", "e", "st1", "1"]

console.log(array[1]);
// Expected output: Array ["test2", "e", "st2", "2"]
```

## Cú pháp

```js-nolint
matchAll(regexp)
```

### Tham số

- `regexp`
  - : Một đối tượng biểu thức chính quy, hoặc bất kỳ đối tượng nào có phương thức [`Symbol.matchAll`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Symbol/matchAll).

    Nếu `regexp` không phải là đối tượng `RegExp` và không có phương thức `Symbol.matchAll`, nó được ngầm định chuyển đổi thành {{jsxref("RegExp")}} bằng cách sử dụng `new RegExp(regexp, 'g')`.

    Nếu `regexp` [là regex](/en-US/docs/Web/JavaScript/Reference/Global_Objects/RegExp#special_handling_for_regexes), thì nó phải có cờ global (`g`) được đặt, hoặc một {{jsxref("TypeError")}} sẽ bị ném.

### Giá trị trả về

Một [đối tượng iterator có thể lặp](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Iterator) (không thể khởi động lại) của các kết quả khớp hoặc một iterator rỗng nếu không tìm thấy kết quả khớp. Mỗi giá trị được tạo ra bởi iterator là một mảng có hình dạng tương tự như giá trị trả về của {{jsxref("RegExp.prototype.exec()")}}.

### Ngoại lệ

- {{jsxref("TypeError")}}
  - : Ném ra nếu `regexp` [là regex](/en-US/docs/Web/JavaScript/Reference/Global_Objects/RegExp#special_handling_for_regexes) không có cờ global (`g`) được đặt (thuộc tính [`flags`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/RegExp/flags) của nó không chứa `"g"`).

## Mô tả

Việc triển khai `String.prototype.matchAll` không làm nhiều thứ khác ngoài việc gọi phương thức `Symbol.matchAll` của đối số với string là tham số đầu tiên (ngoài việc kiểm tra thêm đầu vào rằng regex là global). Việc triển khai thực tế đến từ [`RegExp.prototype[Symbol.matchAll]()`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/RegExp/Symbol.matchAll).

## Ví dụ

### Regexp.prototype.exec() và matchAll()

Không có `matchAll()`, có thể sử dụng các lời gọi đến [`regexp.exec()`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/RegExp/exec) (và regex với cờ `g`) trong một vòng lặp để lấy tất cả các kết quả khớp:

```js
const regexp = /foo[a-z]*/g;
const str = "table football, foosball";
let match;

while ((match = regexp.exec(str)) !== null) {
  console.log(
    `Found ${match[0]} start=${match.index} end=${regexp.lastIndex}.`,
  );
}
// Found football start=6 end=14.
// Found foosball start=16 end=24.
```

Với `matchAll()` có sẵn, bạn có thể tránh vòng lặp {{jsxref("Statements/while", "while")}} và `exec` với `g`. Thay vào đó, bạn nhận được một iterator để sử dụng với các cấu trúc tiện lợi hơn như {{jsxref("Statements/for...of", "for...of")}}, [trải rộng mảng](/en-US/docs/Web/JavaScript/Reference/Operators/Spread_syntax), hoặc {{jsxref("Array.from()")}}:

```js
const regexp = /foo[a-z]*/g;
const str = "table football, foosball";
const matches = str.matchAll(regexp);

for (const match of matches) {
  console.log(
    `Found ${match[0]} start=${match.index} end=${
      match.index + match[0].length
    }.`,
  );
}
// Found football start=6 end=14.
// Found foosball start=16 end=24.

// matches iterator is exhausted after the for...of iteration
// Call matchAll again to create a new iterator
Array.from(str.matchAll(regexp), (m) => m[0]);
// [ "football", "foosball" ]
```

`matchAll` sẽ ném ngoại lệ nếu thiếu cờ `g`.

```js
const regexp = /[a-c]/;
const str = "abc";
str.matchAll(regexp);
// TypeError
```

`matchAll` nội bộ tạo một bản sao của `regexp` — vì vậy, không giống như {{jsxref("RegExp/exec", "regexp.exec()")}}, `lastIndex` không thay đổi khi string được quét.

```js
const regexp = /[a-c]/g;
regexp.lastIndex = 1;
const str = "abc";
Array.from(str.matchAll(regexp), (m) => `${regexp.lastIndex} ${m[0]}`);
// [ "1 b", "1 c" ]
```

Tuy nhiên, điều này có nghĩa là không giống như sử dụng [`regexp.exec()`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/RegExp/exec) trong một vòng lặp, bạn không thể thay đổi `lastIndex` để làm regex tiến hay lùi.

### Truy cập tốt hơn vào các nhóm bắt (hơn String.prototype.match())

Một lý do thuyết phục khác cho `matchAll` là khả năng truy cập được cải thiện vào các nhóm bắt.

Các nhóm bắt bị bỏ qua khi sử dụng {{jsxref("String/match", "match()")}} với cờ global `g`:

```js
const regexp = /t(e)(st(\d?))/g;
const str = "test1test2";

str.match(regexp); // ['test1', 'test2']
```

Sử dụng `matchAll`, bạn có thể truy cập các nhóm bắt một cách dễ dàng:

```js
const array = [...str.matchAll(regexp)];

array[0];
// ['test1', 'e', 'st1', '1', index: 0, input: 'test1test2', length: 4]
array[1];
// ['test2', 'e', 'st2', '2', index: 5, input: 'test1test2', length: 4]
```

### Sử dụng matchAll() với đối tượng không phải RegExp triển khai `[Symbol.matchAll]()`

Nếu một đối tượng có phương thức `Symbol.matchAll`, nó có thể được sử dụng như một matcher tùy chỉnh. Giá trị trả về của `Symbol.matchAll` trở thành giá trị trả về của `matchAll()`.

```js
const str = "Hmm, this is interesting.";

str.matchAll({
  [Symbol.matchAll](str) {
    return [["Yes, it's interesting."]];
  },
}); // returns [["Yes, it's interesting."]]
```

## Đặc tả

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Polyfill of `String.prototype.matchAll` in `core-js`](https://github.com/zloirock/core-js#ecmascript-string-and-regexp)
- [es-shims polyfill of `String.prototype.matchAll`](https://www.npmjs.com/package/string.prototype.matchall)
- [Regular expressions](/en-US/docs/Web/JavaScript/Guide/Regular_expressions) guide
- [Groups and backreferences](/en-US/docs/Web/JavaScript/Guide/Regular_expressions/Groups_and_backreferences) guide
- {{jsxref("String.prototype.match()")}}
- {{jsxref("RegExp")}}
- {{jsxref("RegExp.prototype.exec()")}}
- {{jsxref("RegExp.prototype.test()")}}
- [`RegExp.prototype[Symbol.matchAll]()`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/RegExp/Symbol.matchAll)
