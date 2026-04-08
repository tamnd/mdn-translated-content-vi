---
title: Assertions
slug: Web/JavaScript/Guide/Regular_expressions/Assertions
page-type: guide
sidebar: jssidebar
---

Assertions bao gồm các ranh giới, chỉ ra điểm bắt đầu và kết thúc của dòng và từ, cũng như các mẫu khác cho thấy một phép khớp có thể xảy ra (bao gồm look-ahead, look-behind, và biểu thức điều kiện).

{{InteractiveExample("JavaScript Demo: RegExp Assertions", "taller")}}

```js interactive-example
const text = "A quick fox";

const regexpLastWord = /\w+$/;
console.log(text.match(regexpLastWord));
// Expected output: Array ["fox"]

const regexpWords = /\b\w+\b/g;
console.log(text.match(regexpWords));
// Expected output: Array ["A", "quick", "fox"]

const regexpFoxQuality = /\w+(?= fox)/;
console.log(text.match(regexpFoxQuality));
// Expected output: Array ["quick"]
```

## Các loại

### Assertions kiểu ranh giới

<table class="standard-table">
  <thead>
    <tr>
      <th scope="col">Ký tự</th>
      <th scope="col">Ý nghĩa</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td><code>^</code></td>
      <td>
        <p>
          <a href="/en-US/docs/Web/JavaScript/Reference/Regular_expressions/Input_boundary_assertion"><strong>Assertion bắt đầu ranh giới đầu vào:</strong></a>
          Khớp với đầu của đầu vào. Nếu cờ <a href="/en-US/docs/Web/JavaScript/Reference/Global_Objects/RegExp/multiline"><code>multiline</code></a> (m) được bật,
          cũng khớp ngay sau ký tự xuống dòng. Ví dụ,
          <code>/^A/</code> không khớp với "A" trong "an A", nhưng khớp với
          "A" đầu tiên trong "An A".
        </p>
        <div class="notecard note">
          <p>
            <strong>Lưu ý:</strong> Ký tự này có ý nghĩa khác khi
            nó xuất hiện ở đầu một
            <a
              href="/en-US/docs/Web/JavaScript/Guide/Regular_expressions/Character_classes"
              >character class</a
            >.
          </p>
        </div>
      </td>
    </tr>
    <tr>
      <td><code>$</code></td>
      <td>
        <p>
          <a href="/en-US/docs/Web/JavaScript/Reference/Regular_expressions/Input_boundary_assertion"><strong>Assertion kết thúc ranh giới đầu vào:</strong></a>
          Khớp với cuối đầu vào. Nếu cờ <a href="/en-US/docs/Web/JavaScript/Reference/Global_Objects/RegExp/multiline"><code>multiline</code></a> (m) được bật, cũng
          khớp ngay trước ký tự xuống dòng. Ví dụ,
          <code>/t$/</code> không khớp với "t" trong "eater", nhưng khớp với nó
          trong "eat".
        </p>
      </td>
    </tr>
    <tr>
      <td><code>\b</code></td>
      <td>
        <p>
          <a href="/en-US/docs/Web/JavaScript/Reference/Regular_expressions/Word_boundary_assertion"><strong>Assertion ranh giới từ:</strong></a>
          Khớp với ranh giới từ. Đây là vị trí mà một ký tự từ
          không được theo sau hoặc đứng trước bởi một ký tự từ khác, chẳng hạn
          giữa một chữ cái và khoảng trắng. Lưu ý rằng ranh giới từ được khớp không
          được bao gồm trong kết quả khớp. Nói cách khác, độ dài của ranh giới từ được khớp là không.
        </p>
        <p>Ví dụ:</p>
        <ul>
          <li><code>/\bm/</code> khớp với "m" trong "moon".</li>
          <li>
            <code>/oo\b/</code> không khớp với "oo" trong "moon", vì "oo"
            được theo sau bởi "n" là một ký tự từ.
          </li>
          <li>
            <code>/oon\b/</code> khớp với "oon" trong "moon", vì "oon" là
            cuối chuỗi, do đó không được theo sau bởi ký tự từ.
          </li>
          <li>
            <code>/\w\b\w/</code> sẽ không bao giờ khớp với bất cứ thứ gì, vì một ký tự từ
            không bao giờ có thể được theo sau bởi cả ký tự không phải từ và ký tự từ.
          </li>
        </ul>
        <p>
          Để khớp với ký tự backspace (<code>[\b]</code>), xem
          <a
            href="/en-US/docs/Web/JavaScript/Guide/Regular_expressions/Character_classes"
            >Character Classes</a
          >.
        </p>
      </td>
    </tr>
    <tr>
      <td><code>\B</code></td>
      <td>
        <p>
          <a href="/en-US/docs/Web/JavaScript/Reference/Regular_expressions/Word_boundary_assertion"><strong>Assertion không phải ranh giới từ:</strong></a>
          Khớp với vị trí không phải ranh giới từ. Đây là vị trí mà ký tự trước và
          tiếp theo thuộc cùng loại: cả hai phải là từ, hoặc
          cả hai phải không phải từ, ví dụ giữa hai chữ cái hoặc giữa hai
          khoảng trắng. Đầu và cuối chuỗi được coi là không phải từ.
          Tương tự ranh giới từ được khớp, ranh giới không phải từ được khớp cũng
          không được bao gồm trong kết quả khớp. Ví dụ,
          <code>/\Bon/</code> khớp với "on" trong "at noon", và
          <code>/ye\B/</code> khớp với "ye" trong "possibly yesterday".
        </p>
      </td>
    </tr>
  </tbody>
</table>

### Các assertions khác

> [!NOTE]
> Ký tự `?` cũng có thể được dùng như một quantifier.

<table class="standard-table">
  <thead>
    <tr>
      <th scope="col">Ký tự</th>
      <th scope="col">Ý nghĩa</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td><code>x(?=y)</code></td>
      <td>
        <p>
          <a href="/en-US/docs/Web/JavaScript/Reference/Regular_expressions/Lookahead_assertion"><strong>Lookahead assertion:</strong></a>
          Khớp với "x" chỉ khi "x" được
          theo sau bởi "y". Ví dụ, <code>/Jack(?=Sprat)/</code> khớp với
          "Jack" chỉ khi nó được theo sau bởi "Sprat".<br /><code
            >/Jack(?=Sprat|Frost)/</code
          >
          khớp với "Jack" chỉ khi nó được theo sau bởi "Sprat" hoặc "Frost". Tuy nhiên,
          cả "Sprat" lẫn "Frost" đều không phải là một phần của kết quả khớp.
        </p>
      </td>
    </tr>
    <tr>
      <td><code>x(?!y)</code></td>
      <td>
        <p>
          <a href="/en-US/docs/Web/JavaScript/Reference/Regular_expressions/Lookahead_assertion"><strong>Negative lookahead assertion:</strong></a>
          Khớp với "x" chỉ khi "x"
          không được theo sau bởi "y". Ví dụ, <code>/\d+(?!\.)/</code> khớp với
          một số chỉ khi nó không được theo sau bởi dấu thập phân. <code
            >/\d+(?!\.)/.exec('3.141')</code
          >
          khớp với "141" nhưng không phải "3".
        </p>
      </td>
    </tr>
    <tr>
      <td><code>(?&#x3C;=y)x</code></td>
      <td>
        <p>
          <a href="/en-US/docs/Web/JavaScript/Reference/Regular_expressions/Lookbehind_assertion"><strong>Lookbehind assertion:</strong></a>
          Khớp với "x" chỉ khi "x" được
          đứng trước bởi "y". Ví dụ,
          <code>/(?&#x3C;=Jack)Sprat/</code> khớp với "Sprat" chỉ khi nó được
          đứng trước bởi "Jack". <code>/(?&#x3C;=Jack|Tom)Sprat/</code> khớp với
          "Sprat" chỉ khi nó được đứng trước bởi "Jack" hoặc "Tom". Tuy nhiên, cả
          "Jack" lẫn "Tom" đều không phải là một phần của kết quả khớp.
        </p>
      </td>
    </tr>
    <tr>
      <td><code>(?&#x3C;!y)x</code></td>
      <td>
        <p>
          <a href="/en-US/docs/Web/JavaScript/Reference/Regular_expressions/Lookbehind_assertion"><strong>Negative lookbehind assertion:</strong></a>
          Khớp với "x" chỉ khi
          "x" không được đứng trước bởi "y". Ví dụ,
          <code>/(?&#x3C;!-)\d+/</code> khớp với một số chỉ khi nó không được
          đứng trước bởi dấu trừ. <code>/(?&#x3C;!-)\d+/.exec('3')</code>
          khớp với "3". <code>/(?&#x3C;!-)\d+/.exec('-3')</code>  không
          tìm thấy khớp vì số được đứng trước bởi dấu trừ.
        </p>
      </td>
    </tr>
  </tbody>
</table>

## Ví dụ

### Ví dụ tổng quan về assertions kiểu ranh giới

<!-- cSpell:ignore greon -->

```js
// Using Regex boundaries to fix buggy string.
buggyMultiline = `tey, ihe light-greon apple
tangs on ihe greon traa`;

// 1) Use ^ to fix the matching at the beginning of the string, and right after newline.
buggyMultiline = buggyMultiline.replace(/^t/gim, "h");
console.log(1, buggyMultiline); // fix 'tey' => 'hey' and 'tangs' => 'hangs' but do not touch 'traa'.

// 2) Use $ to fix matching at the end of the text.
buggyMultiline = buggyMultiline.replace(/aa$/gim, "ee.");
console.log(2, buggyMultiline); // fix 'traa' => 'tree.'.

// 3) Use \b to match characters right on border between a word and a space.
buggyMultiline = buggyMultiline.replace(/\bi/gim, "t");
console.log(3, buggyMultiline); // fix 'ihe' => 'the' but do not touch 'light'.

// 4) Use \B to match characters inside borders of an entity.
fixedMultiline = buggyMultiline.replace(/\Bo/gim, "e");
console.log(4, fixedMultiline); // fix 'greon' => 'green' but do not touch 'on'.
```

### Khớp đầu đầu vào bằng ký tự điều khiển ^

Dùng `^` để khớp ở đầu đầu vào. Trong ví dụ này, ta có thể lấy các loại trái cây bắt đầu bằng 'A' bằng regex `/^A/`. Để chọn trái cây phù hợp, ta có thể dùng phương thức [`filter`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Array/filter) với hàm [arrow](/en-US/docs/Web/JavaScript/Reference/Functions/Arrow_functions).

```js
const fruits = ["Apple", "Watermelon", "Orange", "Avocado", "Strawberry"];

// Select fruits started with 'A' by /^A/ Regex.
// Here '^' control symbol used only in one role: Matching beginning of an input.

const fruitsStartsWithA = fruits.filter((fruit) => /^A/.test(fruit));
console.log(fruitsStartsWithA); // [ 'Apple', 'Avocado' ]
```

Trong ví dụ thứ hai, `^` được dùng cho cả hai mục đích: khớp ở đầu đầu vào và tạo một character class phủ định hoặc bổ sung khi được dùng trong [character classes](/en-US/docs/Web/JavaScript/Guide/Regular_expressions/Character_classes).

```js
const fruits = ["Apple", "Watermelon", "Orange", "Avocado", "Strawberry"];

// Selecting fruits that do not start by 'A' with a /^[^A]/ regex.
// In this example, two meanings of '^' control symbol are represented:
// 1) Matching beginning of the input
// 2) A negated or complemented character class: [^A]
// That is, it matches anything that is not enclosed in the square brackets.

const fruitsStartsWithNotA = fruits.filter((fruit) => /^[^A]/.test(fruit));

console.log(fruitsStartsWithNotA); // [ 'Watermelon', 'Orange', 'Strawberry' ]
```

Xem thêm ví dụ trong tài liệu tham khảo [input boundary assertion](/en-US/docs/Web/JavaScript/Reference/Regular_expressions/Input_boundary_assertion).

### Khớp ranh giới từ

Trong ví dụ này, ta khớp tên trái cây chứa một từ kết thúc bằng "en" hoặc "ed".

```js
const fruitsWithDescription = ["Red apple", "Orange orange", "Green Avocado"];

// Select descriptions that contains 'en' or 'ed' words endings:
const enEdSelection = fruitsWithDescription.filter((description) =>
  /(?:en|ed)\b/.test(description),
);

console.log(enEdSelection); // [ 'Red apple', 'Green Avocado' ]
```

Xem thêm ví dụ trong tài liệu tham khảo [word boundary assertion](/en-US/docs/Web/JavaScript/Reference/Regular_expressions/Word_boundary_assertion).

### Lookahead assertion

Trong ví dụ này, ta khớp từ "First" chỉ khi nó được theo sau bởi từ "test", nhưng ta không bao gồm "test" trong kết quả khớp.

```js
const regex = /First(?= test)/g;

console.log("First test".match(regex)); // [ 'First' ]
console.log("First peach".match(regex)); // null
console.log("This is a First test in a year.".match(regex)); // [ 'First' ]
console.log("This is a First peach in a month.".match(regex)); // null
```

Xem thêm ví dụ trong tài liệu tham khảo [lookahead assertion](/en-US/docs/Web/JavaScript/Reference/Regular_expressions/Lookahead_assertion).

### Negative lookahead assertion cơ bản

Ví dụ, `/\d+(?!\.)/` khớp với một số chỉ khi nó không được theo sau bởi dấu thập phân. `/\d+(?!\.)/.exec('3.141')` khớp với "141" nhưng không phải "3.

```js
console.log(/\d+(?!\.)/g.exec("3.141")); // [ '141', index: 2, input: '3.141' ]
```

Xem thêm ví dụ trong tài liệu tham khảo [lookahead assertion](/en-US/docs/Web/JavaScript/Reference/Regular_expressions/Lookahead_assertion).

### Ý nghĩa khác nhau của tổ hợp '?!' trong assertions và character classes

Tổ hợp `?!` có ý nghĩa khác nhau trong assertions như `/x(?!y)/` và [character classes](/en-US/docs/Web/JavaScript/Guide/Regular_expressions/Character_classes) như `[^?!]`.

```js
const orangeNotLemon =
  "Do you want to have an orange? Yes, I do not want to have a lemon!";

// Different meaning of '?!' combination usage in Assertions /x(?!y)/ and Ranges /[^?!]/
const selectNotLemonRegex = /[^?!]+have(?! a lemon)[^?!]+[?!]/gi;
console.log(orangeNotLemon.match(selectNotLemonRegex)); // [ 'Do you want to have an orange?' ]

const selectNotOrangeRegex = /[^?!]+have(?! an orange)[^?!]+[?!]/gi;
console.log(orangeNotLemon.match(selectNotOrangeRegex)); // [ ' Yes, I do not want to have a lemon!' ]
```

### Lookbehind assertion

Trong ví dụ này, ta thay thế từ "orange" bằng "apple" chỉ khi nó được đứng trước bởi từ "ripe".

```js
const oranges = ["ripe orange A", "green orange B", "ripe orange C"];

const newFruits = oranges.map((fruit) =>
  fruit.replace(/(?<=ripe )orange/, "apple"),
);
console.log(newFruits); // ['ripe apple A', 'green orange B', 'ripe apple C']
```

Xem thêm ví dụ trong tài liệu tham khảo [lookbehind assertion](/en-US/docs/Web/JavaScript/Reference/Regular_expressions/Lookbehind_assertion).

## Xem thêm

- Hướng dẫn [Regular expressions](/en-US/docs/Web/JavaScript/Guide/Regular_expressions)
- Hướng dẫn [Character classes](/en-US/docs/Web/JavaScript/Guide/Regular_expressions/Character_classes)
- Hướng dẫn [Quantifiers](/en-US/docs/Web/JavaScript/Guide/Regular_expressions/Quantifiers)
- Hướng dẫn [Groups and backreferences](/en-US/docs/Web/JavaScript/Guide/Regular_expressions/Groups_and_backreferences)
- [`RegExp`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/RegExp)
- Tài liệu tham khảo [Regular expressions](/en-US/docs/Web/JavaScript/Guide/Regular_expressions)
- [Input boundary assertion: `^`, `$`](/en-US/docs/Web/JavaScript/Reference/Regular_expressions/Input_boundary_assertion)
- [Lookahead assertion: `(?=...)`, `(?!...)`](/en-US/docs/Web/JavaScript/Reference/Regular_expressions/Lookahead_assertion)
- [Lookbehind assertion: `(?<=...)`, `(?<!...)`](/en-US/docs/Web/JavaScript/Reference/Regular_expressions/Lookbehind_assertion)
- [Word boundary assertion: `\b`, `\B`](/en-US/docs/Web/JavaScript/Reference/Regular_expressions/Word_boundary_assertion)
