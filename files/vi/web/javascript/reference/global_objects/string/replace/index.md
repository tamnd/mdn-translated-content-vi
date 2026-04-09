---
title: String.prototype.replace()
short-title: replace()
slug: Web/JavaScript/Reference/Global_Objects/String/replace
page-type: javascript-instance-method
browser-compat: javascript.builtins.String.replace
sidebar: jsref
---

Phương thức **`replace()`** của các giá trị {{jsxref("String")}} trả về một chuỗi mới với một, một số, hoặc tất cả các kết quả khớp của `pattern` được thay thế bởi `replacement`. `pattern` có thể là một chuỗi hoặc một {{jsxref("RegExp")}}, và `replacement` có thể là một chuỗi hoặc một hàm được gọi cho mỗi kết quả khớp. Nếu `pattern` là một chuỗi, chỉ lần xuất hiện đầu tiên sẽ được thay thế. Chuỗi gốc không bị thay đổi.

{{InteractiveExample("JavaScript Demo: String.prototype.replace()")}}

```js interactive-example
const paragraph = "I think Ruth's dog is cuter than your dog!";

console.log(paragraph.replace("Ruth's", "my"));
// Expected output: "I think my dog is cuter than your dog!"

const regex = /dog/i;
console.log(paragraph.replace(regex, "ferret"));
// Expected output: "I think Ruth's ferret is cuter than your dog!"
```

## Cú pháp

```js-nolint
replace(pattern, replacement)
```

### Tham số

- `pattern`
  - : Có thể là một chuỗi hoặc một đối tượng có phương thức [`Symbol.replace`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Symbol/replace) — ví dụ điển hình là một [biểu thức chính quy](/en-US/docs/Web/JavaScript/Reference/Global_Objects/RegExp). Bất kỳ giá trị nào không có phương thức `Symbol.replace` sẽ bị ép kiểu thành chuỗi.
- `replacement`
  - : Có thể là một chuỗi hoặc một hàm.
    - Nếu là chuỗi, nó sẽ thay thế chuỗi con khớp với `pattern`. Một số mẫu thay thế đặc biệt được hỗ trợ; xem phần [Chỉ định chuỗi làm replacement](#chỉ_định_chuỗi_làm_replacement) bên dưới.
    - Nếu là hàm, nó sẽ được gọi cho mỗi kết quả khớp và giá trị trả về của nó được dùng làm văn bản thay thế. Các đối số truyền vào hàm này được mô tả trong phần [Chỉ định hàm làm replacement](#chỉ_định_hàm_làm_replacement) bên dưới.

### Giá trị trả về

Một chuỗi mới, với một, một số, hoặc tất cả các kết quả khớp của pattern được thay thế bởi replacement đã chỉ định.

## Mô tả

Phương thức này không thay đổi giá trị chuỗi được gọi trên đó. Nó trả về một chuỗi mới.

Một mẫu chuỗi chỉ được thay thế một lần. Để thực hiện tìm kiếm và thay thế toàn cục, hãy sử dụng biểu thức chính quy với cờ `g`, hoặc sử dụng [`replaceAll()`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/String/replaceAll) thay thế.

Nếu `pattern` là một đối tượng có phương thức [`Symbol.replace`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Symbol/replace) (bao gồm các đối tượng `RegExp`), phương thức đó được gọi với chuỗi đích và `replacement` làm đối số. Giá trị trả về của nó trở thành giá trị trả về của `replace()`. Trong trường hợp này, hành vi của `replace()` được mã hóa hoàn toàn bởi phương thức `[Symbol.replace]()` — ví dụ, bất kỳ đề cập nào đến "capturing groups" trong mô tả bên dưới thực ra là chức năng được cung cấp bởi [`RegExp.prototype[Symbol.replace]()`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/RegExp/Symbol.replace).

Nếu `pattern` là một chuỗi rỗng, replacement được thêm vào đầu chuỗi.

```js
"xxx".replace("", "_"); // "_xxx"
```

Regex với cờ `g` là trường hợp duy nhất mà `replace()` thay thế nhiều hơn một lần. Để biết thêm thông tin về cách các thuộc tính regex (đặc biệt là cờ [sticky](/en-US/docs/Web/JavaScript/Reference/Global_Objects/RegExp/sticky)) tương tác với `replace()`, xem [`RegExp.prototype[Symbol.replace]()`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/RegExp/Symbol.replace).

### Chỉ định chuỗi làm replacement

Chuỗi thay thế có thể bao gồm các mẫu thay thế đặc biệt sau:

| Mẫu       | Chèn                                                                                            |
| --------- | ----------------------------------------------------------------------------------------------- |
| `$$`      | Chèn ký tự `"$"`.                                                                               |
| `$&`      | Chèn chuỗi con đã khớp.                                                                         |
| `` $` ``  | Chèn phần của chuỗi đứng trước chuỗi con đã khớp.                                               |
| `$'`      | Chèn phần của chuỗi đứng sau chuỗi con đã khớp.                                                 |
| `$n`      | Chèn capturing group thứ `n` (đánh chỉ số từ `1`), trong đó `n` là số nguyên dương nhỏ hơn 100. |
| `$<Name>` | Chèn capturing group được đặt tên, trong đó `Name` là tên của group.                            |

`$n` và `$<Name>` chỉ khả dụng nếu đối số `pattern` là một đối tượng {{jsxref("RegExp")}}. Nếu `pattern` là một chuỗi, hoặc nếu capturing group tương ứng không có trong regex, thì mẫu sẽ được thay thế theo nghĩa đen. Nếu group tồn tại nhưng không khớp (vì nó là một phần của phép tuyển), nó sẽ được thay thế bằng một chuỗi rỗng.

```js
"foo".replace(/(f)/, "$2");
// "$2oo"; regex không có group thứ hai

"foo".replace("f", "$1");
// "$1oo"; pattern là chuỗi nên không có group nào

"foo".replace(/(f)|(g)/, "$2");
// "oo"; group thứ hai tồn tại nhưng không khớp
```

### Chỉ định hàm làm replacement

Bạn có thể chỉ định một hàm làm tham số thứ hai. Trong trường hợp này, hàm sẽ được gọi sau khi tìm thấy kết quả khớp. Kết quả (giá trị trả về) của hàm sẽ được dùng làm chuỗi thay thế.

> [!NOTE]
> Các mẫu thay thế đặc biệt đề cập ở trên _không_ áp dụng cho các chuỗi được trả về từ hàm replacer.

Hàm có chữ ký sau:

```js
function replacer(match, p1, p2, /* …, */ pN, offset, string, groups) {
  return replacement;
}
```

Các đối số truyền vào hàm như sau:

- `match`
  - : Chuỗi con đã khớp. (Tương ứng với `$&` ở trên.)
- `p1`, `p2`, …, `pN`
  - : Chuỗi thứ `n` được tìm thấy bởi một capturing group (bao gồm cả named capturing groups), với điều kiện đối số đầu tiên của `replace()` là một đối tượng {{jsxref("RegExp")}}. (Tương ứng với `$1`, `$2`, v.v. ở trên.) Ví dụ, nếu `pattern` là `/(\a+)(\b+)/`, thì `p1` là kết quả khớp cho `\a+`, và `p2` là kết quả khớp cho `\b+`. Nếu group là một phần của phép tuyển (ví dụ: `"abc".replace(/(a)|(b)/, replacer)`), nhánh không khớp sẽ là `undefined`.
- `offset`
  - : Vị trí của chuỗi con đã khớp trong toàn bộ chuỗi đang được kiểm tra. Ví dụ, nếu toàn bộ chuỗi là `'abcd'`, và chuỗi con đã khớp là `'bc'`, thì đối số này sẽ là `1`.
- `string`
  - : Toàn bộ chuỗi đang được kiểm tra.
- `groups`
  - : Một đối tượng có các key là tên group được sử dụng, và các value là các phần đã khớp (`undefined` nếu không khớp). Chỉ có mặt nếu `pattern` chứa ít nhất một named capturing group.

Số lượng đối số chính xác phụ thuộc vào đối số đầu tiên có phải là đối tượng {{jsxref("RegExp")}} hay không — và nếu có, thì regex đó có bao nhiêu capturing group.

Ví dụ sau sẽ đặt `newString` thành `'abc - 12345 - #$*%'`:

```js
function replacer(match, p1, p2, p3, offset, string) {
  // p1 là các ký tự không phải số, p2 là số, và p3 là các ký tự không phải chữ-số
  return [p1, p2, p3].join(" - ");
}
const newString = "abc12345#$*%".replace(/(\D*)(\d*)(\W*)/, replacer);
console.log(newString); // abc - 12345 - #$*%
```

Hàm sẽ được gọi nhiều lần cho mỗi kết quả khớp đầy đủ cần thay thế nếu biểu thức chính quy trong tham số đầu tiên là global.

## Ví dụ

### Định nghĩa biểu thức chính quy trong replace()

Trong ví dụ sau, biểu thức chính quy được định nghĩa trong `replace()` và bao gồm cờ bỏ qua hoa thường.

```js
const str = "Twas the night before Xmas...";
const newStr = str.replace(/xmas/i, "Christmas");
console.log(newStr); // Twas the night before Christmas...
```

Kết quả in ra là `'Twas the night before Christmas...'`.

> [!NOTE]
> Xem [hướng dẫn biểu thức chính quy](/en-US/docs/Web/JavaScript/Guide/Regular_expressions) để biết thêm giải thích về biểu thức chính quy.

### Sử dụng cờ global và ignoreCase với replace()

Thay thế toàn cục chỉ có thể thực hiện với biểu thức chính quy. Trong ví dụ sau, biểu thức chính quy bao gồm [cờ global và ignore case](/en-US/docs/Web/JavaScript/Guide/Regular_expressions#advanced_searching_with_flags) cho phép `replace()` thay thế mỗi lần xuất hiện của `'apples'` trong chuỗi bằng `'oranges'`.

```js
const re = /apples/gi;
const str = "Apples are round, and apples are juicy.";
const newStr = str.replace(re, "oranges");
console.log(newStr); // oranges are round, and oranges are juicy.
```

Kết quả in ra là `'oranges are round, and oranges are juicy'`.

### Hoán đổi các từ trong chuỗi

Script sau hoán đổi các từ trong chuỗi. Đối với văn bản thay thế, script sử dụng [capturing groups](/en-US/docs/Web/JavaScript/Guide/Regular_expressions/Groups_and_backreferences) và các mẫu thay thế `$1` và `$2`.

```js
const re = /(\w+)\s(\w+)/;
const str = "Maria Cruz";
const newStr = str.replace(re, "$2, $1");
console.log(newStr); // Cruz, Maria
```

Kết quả in ra là `'Cruz, Maria'`.

### Sử dụng hàm inline để chỉnh sửa các ký tự đã khớp

Trong ví dụ này, tất cả các chữ hoa trong chuỗi được chuyển thành chữ thường, và một dấu gạch ngang được chèn ngay trước vị trí khớp. Điều quan trọng ở đây là cần thực hiện các thao tác bổ sung trên phần tử đã khớp trước khi trả về nó làm replacement.

Hàm thay thế nhận đoạn đã khớp làm tham số, dùng nó để chuyển đổi chữ hoa/thường và nối dấu gạch ngang trước khi trả về.

```js
function styleHyphenFormat(propertyName) {
  function upperToHyphenLower(match, offset, string) {
    return (offset > 0 ? "-" : "") + match.toLowerCase();
  }
  return propertyName.replace(/[A-Z]/g, upperToHyphenLower);
}
```

Với `styleHyphenFormat('borderTop')`, hàm trả về `'border-top'`.

Vì ta muốn tiếp tục biến đổi _kết quả_ của kết quả khớp trước khi thực hiện thay thế cuối cùng, ta phải dùng một hàm. Điều này buộc phải đánh giá kết quả khớp trước phương thức [`toLowerCase()`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/String/toLowerCase). Nếu thử làm điều này dùng kết quả khớp mà không có hàm, phương thức {{jsxref("String/toLowerCase", "toLowerCase()")}} sẽ không có hiệu lực.

```js example-bad
// Sẽ không hoạt động
const newString = propertyName.replace(/[A-Z]/g, "-" + "$&".toLowerCase());
```

Đó là vì `'$&'.toLowerCase()` sẽ được đánh giá trước như một chuỗi ký tự (kết quả vẫn là `'$&'`) trước khi dùng các ký tự làm mẫu.

### Thay thế độ Fahrenheit bằng giá trị Celsius tương đương

Ví dụ sau thay thế một độ Fahrenheit bằng giá trị Celsius tương đương. Độ Fahrenheit phải là một số kết thúc bằng `"F"`. Hàm trả về số Celsius kết thúc bằng `"C"`. Ví dụ, nếu số đầu vào là `"212F"`, hàm trả về `"100C"`. Nếu số là `"0F"`, hàm trả về `"-17.77777777777778C"`.

Biểu thức chính quy `test` kiểm tra bất kỳ số nào kết thúc bằng `F`. Số độ Fahrenheit có thể truy cập trong hàm qua tham số thứ hai `p1`. Hàm tính số Celsius dựa trên số độ Fahrenheit truyền vào dưới dạng chuỗi cho hàm `f2c()`. Hàm `f2c()` sau đó trả về số Celsius. Hàm này tương tự cờ `s///e` của Perl.

```js
function f2c(x) {
  function convert(str, p1, offset, s) {
    return `${((p1 - 32) * 5) / 9}C`;
  }
  const s = String(x);
  const test = /(-?\d+(?:\.\d*)?)F\b/g;
  return s.replace(test, convert);
}
```

### Tạo một replacer tổng quát

Giả sử ta muốn tạo một replacer thêm dữ liệu offset vào mỗi chuỗi đã khớp. Vì hàm replacer đã nhận tham số `offset`, việc này đơn giản nếu regex được biết tĩnh.

```js
"abcd".replace(/(bc)/, (match, p1, offset) => `${match} (${offset}) `);
// "abc (1) d"
```

Tuy nhiên, replacer này khó tổng quát hóa nếu ta muốn nó hoạt động với bất kỳ mẫu regex nào. Replacer _variadic_ — số lượng đối số nó nhận phụ thuộc vào số capturing group có trong regex. Ta có thể dùng [rest parameters](/en-US/docs/Web/JavaScript/Reference/Functions/rest_parameters), nhưng nó cũng sẽ thu thập `offset`, `string`, v.v. vào mảng. Thực tế là `groups` có thể hoặc không được truyền tùy thuộc vào regex cũng làm cho việc biết đối số nào tương ứng với `offset` trở nên khó khăn.

```js example-bad
function addOffset(match, ...args) {
  const offset = args.at(-2);
  return `${match} (${offset}) `;
}

console.log("abcd".replace(/(bc)/, addOffset)); // "abc (1) d"
console.log("abcd".replace(/(?<group>bc)/, addOffset)); // "abc (abcd) d"
```

Ví dụ `addOffset` trên không hoạt động khi regex chứa một named group, vì trong trường hợp đó `args.at(-2)` sẽ là `string` thay vì `offset`.

Thay vào đó, ta cần trích xuất một vài đối số cuối cùng dựa trên kiểu, vì `groups` là một đối tượng còn `string` là một chuỗi.

```js
function addOffset(match, ...args) {
  const hasNamedGroups = typeof args.at(-1) === "object";
  const offset = hasNamedGroups ? args.at(-3) : args.at(-2);
  return `${match} (${offset}) `;
}

console.log("abcd".replace(/(bc)/, addOffset)); // "abc (1) d"
console.log("abcd".replace(/(?<group>bc)/, addOffset)); // "abc (1) d"
```

## Thông số kỹ thuật

{{Specifications}}

## Khả năng tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Polyfill của `String.prototype.replace` trong `core-js` với các bản sửa lỗi và triển khai hành vi hiện đại như hỗ trợ `Symbol.replace`](https://github.com/zloirock/core-js#ecmascript-string-and-regexp)
- Hướng dẫn [Biểu thức chính quy](/en-US/docs/Web/JavaScript/Guide/Regular_expressions)
- {{jsxref("String.prototype.replaceAll()")}}
- {{jsxref("String.prototype.match()")}}
- {{jsxref("RegExp.prototype.exec()")}}
- {{jsxref("RegExp.prototype.test()")}}
- [`Symbol.replace`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Symbol/replace)
- [`RegExp.prototype[Symbol.replace]()`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/RegExp/Symbol.replace)
