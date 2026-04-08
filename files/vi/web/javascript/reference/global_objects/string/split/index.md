---
title: String.prototype.split()
short-title: split()
slug: Web/JavaScript/Reference/Global_Objects/String/split
page-type: javascript-instance-method
browser-compat: javascript.builtins.String.split
sidebar: jsref
---

Phương thức **`split()`** của các giá trị {{jsxref("String")}} nhận một mẫu và chia chuỗi này thành một danh sách các chuỗi con có thứ tự bằng cách tìm kiếm mẫu, đưa các chuỗi con này vào một mảng, và trả về mảng đó.

{{InteractiveExample("JavaScript Demo: String.prototype.split()", "taller")}}

```js interactive-example
const str = "The quick brown fox jumps over the lazy dog.";

const words = str.split(" ");
console.log(words[3]);
// Expected output: "fox"

const chars = str.split("");
console.log(chars[8]);
// Expected output: "k"

const strCopy = str.split();
console.log(strCopy);
// Expected output: Array ["The quick brown fox jumps over the lazy dog."]
```

## Cú pháp

```js-nolint
split(separator)
split(separator, limit)
```

### Tham số

- `separator`
  - : Mẫu mô tả nơi mỗi lần tách sẽ xảy ra. Có thể là `undefined`, một chuỗi, hoặc một đối tượng có phương thức [`Symbol.split`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Symbol/split) — ví dụ điển hình là {{jsxref("RegExp", "biểu thức chính quy", "", 1)}}. Bỏ qua `separator` hoặc truyền `undefined` khiến `split()` trả về một mảng chứa chuỗi gọi như một phần tử duy nhất. Tất cả các giá trị không phải `undefined` hoặc đối tượng có phương thức `[Symbol.split]()` đều được [ép kiểu thành chuỗi](/en-US/docs/Web/JavaScript/Reference/Global_Objects/String#string_coercion).
- `limit` {{optional_inline}}
  - : Một số nguyên không âm chỉ định giới hạn số lượng chuỗi con được đưa vào mảng. Nếu được cung cấp, chia chuỗi tại mỗi lần xuất hiện của `separator` đã chỉ định, nhưng dừng khi `limit` phần tử đã được thêm vào mảng. Văn bản còn lại sẽ không được đưa vào mảng.
    - Mảng có thể chứa ít phần tử hơn `limit` nếu đạt đến cuối chuỗi trước khi đạt đến giới hạn.
    - Nếu `limit` là `0`, trả về `[]`.

### Giá trị trả về

Nếu `separator` là một chuỗi, trả về một {{jsxref("Array")}} các chuỗi, được tách tại mỗi điểm xuất hiện `separator` trong chuỗi đã cho.

Nếu `separator` là một regex, {{jsxref("Array")}} được trả về cũng chứa các [capturing groups](/en-US/docs/Web/JavaScript/Reference/Regular_expressions/Capturing_group) cho mỗi kết quả khớp của separator; xem bên dưới để biết chi tiết. Các capturing group có thể không khớp, trong trường hợp đó chúng là `undefined` trong mảng.

Nếu `separator` có phương thức `[Symbol.split]()` tùy chỉnh, giá trị trả về của nó được trả về trực tiếp.

## Mô tả

Nếu `separator` là một chuỗi không rỗng, chuỗi đích được tách bởi tất cả các kết quả khớp của `separator` mà không bao gồm `separator` trong kết quả. Ví dụ, một chuỗi chứa các giá trị phân cách bằng tab (TSV) có thể được phân tích bằng cách truyền một ký tự tab làm separator, như `myString.split("\t")`. Nếu `separator` chứa nhiều ký tự, toàn bộ chuỗi ký tự đó phải được tìm thấy để tách. Nếu `separator` xuất hiện ở đầu (hoặc cuối) của chuỗi, nó vẫn có tác dụng tách, dẫn đến một chuỗi rỗng (tức là độ dài bằng không) xuất hiện ở vị trí đầu (hoặc cuối) của mảng được trả về. Nếu `separator` không xuất hiện trong `str`, mảng được trả về chứa một phần tử là toàn bộ chuỗi.

Nếu `separator` là một chuỗi rỗng (`""`), `str` được chuyển đổi thành mảng của từng "ký tự" UTF-16, không có chuỗi rỗng ở hai đầu của chuỗi kết quả.

> [!NOTE]
> `"".split("")` do đó là cách duy nhất để tạo ra một mảng rỗng khi một chuỗi được truyền làm `separator` và `limit` không phải là `0`.

> [!WARNING]
> Khi dùng chuỗi rỗng (`""`) làm separator, chuỗi **không** được tách theo _ký tự được người dùng nhận thức_ ([grapheme clusters](https://unicode.org/reports/tr29/#Grapheme_Cluster_Boundaries)) hoặc ký tự unicode (code points), mà theo các đơn vị mã UTF-16. Điều này phá hủy [surrogate pairs](https://unicode.org/faq/utf_bom.html#utf16-2). Xem ["How do you get a string to a character array in JavaScript?" trên Stack Overflow](https://stackoverflow.com/questions/4547609/how-to-get-character-array-from-a-string/34717402#34717402).

Nếu `separator` là một regex khớp với chuỗi rỗng, việc tách xảy ra theo đơn vị mã UTF-16 hay Unicode code points phụ thuộc vào việc regex có [nhận biết Unicode](/en-US/docs/Web/JavaScript/Reference/Global_Objects/RegExp/unicode#unicode-aware_mode) hay không.

```js
"😄😄".split(/(?:)/); // [ "\ud83d", "\ude04", "\ud83d", "\ude04" ]
"😄😄".split(/(?:)/u); // [ "😄", "😄" ]
```

Nếu `separator` là một biểu thức chính quy với capturing groups, thì mỗi lần `separator` khớp, các capturing groups (bao gồm bất kỳ kết quả `undefined` nào) được chèn vào mảng đầu ra. Hành vi này được xác định bởi phương thức [`Symbol.split`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Symbol/split) của regex.

Nếu `separator` là một đối tượng có phương thức [`Symbol.split`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Symbol/split), phương thức đó được gọi với chuỗi đích và `limit` làm đối số, và `this` được đặt thành đối tượng. Giá trị trả về của nó trở thành giá trị trả về của `split`.

Bất kỳ giá trị nào khác sẽ được ép kiểu thành chuỗi trước khi được dùng làm separator.

## Ví dụ

### Sử dụng split()

Khi chuỗi rỗng và separator không rỗng được chỉ định, `split()` trả về `[""]`. Nếu chuỗi và separator đều là chuỗi rỗng, trả về một mảng rỗng.

```js
const emptyString = "";

// chuỗi rỗng và separator không rỗng
console.log(emptyString.split("a"));
// [""]

// chuỗi và separator đều là chuỗi rỗng
console.log(emptyString.split(emptyString));
// []
```

Ví dụ sau định nghĩa một hàm tách chuỗi thành mảng các chuỗi
sử dụng `separator`. Sau khi tách chuỗi, hàm ghi
các thông báo cho biết chuỗi gốc (trước khi tách), separator được dùng,
số phần tử trong mảng, và các phần tử mảng riêng lẻ.

```js
function splitString(stringToSplit, separator) {
  const arrayOfStrings = stringToSplit.split(separator);

  console.log("The original string is:", stringToSplit);
  console.log("The separator is:", separator);
  console.log(
    "The array has",
    arrayOfStrings.length,
    "elements:",
    arrayOfStrings.join(" / "),
  );
}

const tempestString = "Oh brave new world that has such people in it.";
const monthString = "Jan,Feb,Mar,Apr,May,Jun,Jul,Aug,Sep,Oct,Nov,Dec";

const space = " ";
const comma = ",";

splitString(tempestString, space);
splitString(tempestString);
splitString(monthString, comma);
```

Ví dụ này tạo ra kết quả sau:

```plain
The original string is: "Oh brave new world that has such people in it."
The separator is: " "
The array has 10 elements: Oh / brave / new / world / that / has / such / people / in / it.

The original string is: "Oh brave new world that has such people in it."
The separator is: "undefined"
The array has 1 elements: Oh brave new world that has such people in it.

The original string is: "Jan,Feb,Mar,Apr,May,Jun,Jul,Aug,Sep,Oct,Nov,Dec"
The separator is: ","
The array has 12 elements: Jan / Feb / Mar / Apr / May / Jun / Jul / Aug / Sep / Oct / Nov / Dec
```

### Xóa khoảng trắng khỏi chuỗi

Trong ví dụ sau, `split()` tìm kiếm không hoặc nhiều khoảng trắng, theo sau là dấu chấm phẩy, theo sau là không hoặc nhiều khoảng trắng — và khi tìm thấy, xóa khoảng trắng và dấu chấm phẩy khỏi chuỗi. `nameList` là mảng được trả về như kết quả của `split()`.

```js
const names = "Harry Trump ;Fred Barney; Helen Rigby ; Bill Abel ;Chris Hand ";

console.log(names);

const re = /\s*(?:;|$)\s*/;
const nameList = names.split(re);

console.log(nameList);
```

Kết quả in ra hai dòng; dòng đầu in chuỗi gốc, dòng thứ hai in mảng kết quả.

```plain
Harry Trump ;Fred Barney; Helen Rigby ; Bill Abel ;Chris Hand
[ "Harry Trump", "Fred Barney", "Helen Rigby", "Bill Abel", "Chris Hand", "" ]
```

### Trả về số lần tách có giới hạn

Trong ví dụ sau, `split()` tìm kiếm khoảng trắng trong chuỗi và trả về 3 lần tách đầu tiên tìm được.

```js
const myString = "Hello World. How are you doing?";
const splits = myString.split(" ", 3);

console.log(splits); // [ "Hello", "World.", "How" ]
```

### Tách với `RegExp` để bao gồm các phần của separator trong kết quả

Nếu `separator` là biểu thức chính quy có chứa
dấu ngoặc đơn `( )`, kết quả khớp được đưa vào mảng.

```js
const myString = "Hello 1 word. Sentence number 2.";
const splits = myString.split(/(\d)/);

console.log(splits);
// [ "Hello ", "1", " word. Sentence number ", "2", "." ]
```

> [!NOTE]
> `\d` khớp với [lớp ký tự](/en-US/docs/Web/JavaScript/Guide/Regular_expressions/Character_classes) cho các chữ số từ 0 đến 9.

### Sử dụng splitter tùy chỉnh

Một đối tượng có phương thức `Symbol.split` có thể được dùng làm splitter với hành vi tùy chỉnh.

Ví dụ sau tách chuỗi sử dụng trạng thái nội bộ bao gồm một số tăng dần:

```js
const splitByNumber = {
  [Symbol.split](str) {
    let num = 1;
    let pos = 0;
    const result = [];
    while (pos < str.length) {
      const matchPos = str.indexOf(num, pos);
      if (matchPos === -1) {
        result.push(str.substring(pos));
        break;
      }
      result.push(str.substring(pos, matchPos));
      pos = matchPos + String(num).length;
      num++;
    }
    return result;
  },
};

const myString = "a1bc2c5d3e4f";
console.log(myString.split(splitByNumber)); // [ "a", "bc", "c5d", "e", "f" ]
```

Ví dụ sau sử dụng trạng thái nội bộ để thực thi một số hành vi nhất định, và để đảm bảo kết quả "hợp lệ" được tạo ra.

```js
const DELIMITER = ";";

// Tách các lệnh, nhưng loại bỏ bất kỳ giá trị không hợp lệ hoặc không cần thiết nào.
const splitCommands = {
  [Symbol.split](str, lim) {
    const results = [];
    const state = {
      on: false,
      brightness: {
        current: 2,
        min: 1,
        max: 3,
      },
    };
    let pos = 0;
    let matchPos = str.indexOf(DELIMITER, pos);

    while (matchPos !== -1) {
      const subString = str.slice(pos, matchPos).trim();

      switch (subString) {
        case "light on":
          // If the `on` state is already true, do nothing.
          if (!state.on) {
            state.on = true;
            results.push(subString);
          }
          break;

        case "light off":
          // If the `on` state is already false, do nothing.
          if (state.on) {
            state.on = false;
            results.push(subString);
          }
          break;

        case "brightness up":
          // Enforce a brightness maximum.
          if (state.brightness.current < state.brightness.max) {
            state.brightness.current += 1;
            results.push(subString);
          }
          break;

        case "brightness down":
          // Enforce a brightness minimum.
          if (state.brightness.current > state.brightness.min) {
            state.brightness.current -= 1;
            results.push(subString);
          }
          break;
      }

      if (results.length === lim) {
        break;
      }

      pos = matchPos + DELIMITER.length;
      matchPos = str.indexOf(DELIMITER, pos);
    }

    // If we broke early due to reaching the split `lim`, don't add the remaining commands.
    if (results.length < lim) {
      results.push(str.slice(pos).trim());
    }

    return results;
  },
};

const commands =
  "light on; brightness up; brightness up; brightness up; light on; brightness down; brightness down; light off";
console.log(commands.split(splitCommands, 3)); // ["light on", "brightness up", "brightness down"]
```

## Thông số kỹ thuật

{{Specifications}}

## Khả năng tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Polyfill của `String.prototype.split` trong `core-js` với các bản sửa lỗi và triển khai hành vi hiện đại như hỗ trợ `Symbol.split`](https://github.com/zloirock/core-js#ecmascript-string-and-regexp)
- [Polyfill es-shims của `String.prototype.split`](https://www.npmjs.com/package/string.prototype.split)
- Hướng dẫn [Biểu thức chính quy](/en-US/docs/Web/JavaScript/Guide/Regular_expressions)
- {{jsxref("String.prototype.charAt()")}}
- {{jsxref("String.prototype.indexOf()")}}
- {{jsxref("String.prototype.lastIndexOf()")}}
- {{jsxref("Array.prototype.join()")}}
