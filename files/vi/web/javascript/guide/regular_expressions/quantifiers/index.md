---
title: Quantifiers
slug: Web/JavaScript/Guide/Regular_expressions/Quantifiers
page-type: guide
sidebar: jssidebar
---

Quantifiers chỉ ra số lượng ký tự hoặc biểu thức cần khớp.

{{InteractiveExample("JavaScript Demo: RegExp quantifiers", "taller")}}

```js interactive-example
const ghostSpeak = "booh boooooooh";
const regexpSpooky = /bo{3,}h/;
console.log(ghostSpeak.match(regexpSpooky));
// Expected output: Array ["boooooooh"]

const modifiedQuote = "[He] ha[s] to go read this novel [Alice in Wonderland].";
const regexpModifications = /\[.*?\]/g;
console.log(modifiedQuote.match(regexpModifications));
// Expected output: Array ["[He]", "[s]", "[Alice in Wonderland]"]

const regexpTooGreedy = /\[.*\]/g;
console.log(modifiedQuote.match(regexpTooGreedy));
// Expected output: Array ["[He] ha[s] to go read this novel [Alice in Wonderland]"]
```

## Các loại

> [!NOTE]
> Trong phần sau, _item_ không chỉ đề cập đến các ký tự đơn lẻ, mà còn bao gồm [lớp ký tự](/en-US/docs/Web/JavaScript/Guide/Regular_expressions/Character_classes) và [nhóm và backreference](/en-US/docs/Web/JavaScript/Guide/Regular_expressions/Groups_and_backreferences).

<table class="standard-table">
  <thead>
    <tr>
      <th scope="col">Ký tự</th>
      <th scope="col">Ý nghĩa</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td>
        <code><em>x</em>*</code>
      </td>
      <td>
        <p>
          Khớp với item "x" đứng trước 0 hoặc nhiều lần. Ví dụ,
          <code>/bo*/</code> khớp với "boooo" trong "A ghost booooed" và "b" trong "A
          bird warbled", nhưng không khớp với bất kỳ thứ gì trong "A goat grunted".
        </p>
      </td>
    </tr>
    <tr>
      <td>
        <code><em>x</em>+</code>
      </td>
      <td>
        <p>
          Khớp với item "x" đứng trước 1 hoặc nhiều lần. Tương đương với
          <code>{1,}</code>. Ví dụ, <code>/a+/</code> khớp với "a" trong
          "candy" và tất cả các "a" trong "caaaaaaandy".
        </p>
      </td>
    </tr>
    <tr>
      <td>
        <code><em>x</em>?</code>
      </td>
      <td>
        <p>
          Khớp với item "x" đứng trước 0 hoặc 1 lần. Ví dụ,
          <code>/e?le?/</code> khớp với "el" trong "angel" và "le" trong
          "angle."
        </p>
        <p>
          Nếu được dùng ngay sau bất kỳ quantifier nào trong số <code>*</code>,
          <code>+</code>, <code>?</code> hoặc <code>{}</code>, làm cho
          quantifier trở nên non-greedy (khớp số lần tối thiểu), ngược lại
          với mặc định là greedy (khớp số lần tối đa).
        </p>
      </td>
    </tr>
    <tr>
      <td>
        <code><em>x</em>{<em>n</em>}</code>
      </td>
      <td>
        <p>
          Trong đó "n" là một số nguyên không âm, khớp chính xác "n" lần xuất hiện của
          item "x" đứng trước. Ví dụ, <code>/a{2}/</code> không khớp với
          "a" trong "candy", nhưng nó khớp với tất cả "a" trong "caandy" và
          hai "a" đầu tiên trong "caaandy".
        </p>
      </td>
    </tr>
    <tr>
      <td>
        <code><em>x</em>{<em>n</em>,}</code>
      </td>
      <td>
        <p>
          Trong đó "n" là một số nguyên không âm, khớp ít nhất "n" lần xuất hiện của
          item "x" đứng trước. Ví dụ, <code>/a{2,}/</code> không
          khớp với "a" trong "candy", nhưng khớp với tất cả a trong "caandy" và
          trong "caaaaaaandy".
        </p>
      </td>
    </tr>
    <tr>
      <td>
        <code><em>x</em>{<em>n</em>,<em>m</em>}</code>
      </td>
      <td>
        <!-- cSpell:ignore cndy -->
        <p>
          Trong đó "n" và "m" là các số nguyên không âm và <code>m >= n</code>,
          khớp ít nhất "n" và tối đa "m" lần xuất hiện của item
          "x" đứng trước. Ví dụ, <code>/a{1,3}/</code> không khớp với bất kỳ thứ gì trong
          "cndy", khớp "a" trong "candy", hai "a" trong "caandy" và ba
          "a" đầu tiên trong "caaaaaaandy". Lưu ý rằng khi khớp "caaaaaaandy",
          kết quả khớp là "aaa", mặc dù chuỗi gốc có nhiều "a" hơn.
        </p>
      </td>
    </tr>
    <tr>
      <td>
        <p>
          <code><em>x</em>*?</code><br /><code><em>x</em>+?</code><br /><code
            ><em>x</em>??</code
          ><br /><code><em>x</em>{n}?</code><br /><code><em>x</em>{n,}?</code
          ><br /><code><em>x</em>{n,m}?</code>
        </p>
      </td>
      <td>
        <p>
          Mặc định các quantifier như <code>*</code> và <code>+</code> là
          "greedy", nghĩa là chúng cố gắng khớp nhiều lần nhất có thể. Ký tự <code>?</code> sau quantifier làm cho
          quantifier trở thành "non-greedy": nghĩa là nó sẽ dừng lại ngay khi tìm thấy số kết quả khớp tối thiểu. Ví dụ, cho một chuỗi như "some &#x3C;foo> &#x3C;bar>
          new &#x3C;/bar> &#x3C;/foo> thing":
        </p>
        <ul>
          <li>
            <code>/&#x3C;.*>/</code> sẽ khớp với "&#x3C;foo> &#x3C;bar> new
            &#x3C;/bar> &#x3C;/foo>"
          </li>
          <li><code>/&#x3C;.*?>/</code> sẽ khớp với "&#x3C;foo>"</li>
        </ul>
        <div class="notecard note">
          <p>
            <strong>Lưu ý:</strong> Thêm <code>?</code> sau <code>{n}</code> là hợp lệ về mặt cú pháp nhưng thực tế không có ý nghĩa gì.
            Vì <code>{n}</code> luôn khớp chính xác n lần, <code>x{n}?</code> hoạt động giống như <code>x{n}</code>.
          </p>
        </div>
      </td>
    </tr>
  </tbody>
</table>

## Ví dụ

### Mẫu lặp lại

Trong ví dụ này, chúng ta khớp một hoặc nhiều ký tự từ với `\w+`, sau đó một hoặc nhiều ký tự "a" với `a+`, và cuối cùng kết thúc tại một ranh giới từ với `\b`.

```js
const wordEndingWithAs = /\w+a+\b/;
const delicateMessage = "This is Spartaaaaaaa";

console.table(delicateMessage.match(wordEndingWithAs)); // [ "Spartaaaaaaa" ]
```

### Đếm ký tự

Trong ví dụ này, chúng ta khớp các từ có một chữ cái, các từ có từ 2 đến 6 chữ cái và các từ có từ 13 chữ cái trở lên.

```js
const singleLetterWord = /\b\w\b/g;
const notSoLongWord = /\b\w{2,6}\b/g;
const longWord = /\b\w{13,}\b/g;

const sentence = "Why do I have to learn multiplication table?";

console.table(sentence.match(singleLetterWord)); // ["I"]
console.table(sentence.match(notSoLongWord)); // [ "Why", "do", "have", "to", "learn", "table" ]
console.table(sentence.match(longWord)); // ["multiplication"]
```

### Ký tự tùy chọn

Trong ví dụ này, chúng ta khớp các từ kết thúc bằng "our" hoặc "or".

<!-- cSpell:ignore neighbour -->

```js
const britishText = "He asked his neighbour a favour.";
const americanText = "He asked his neighbor a favor.";

const regexpEnding = /\w+ou?r/g;
// \w+ One or several letters
// o   followed by an "o",
// u?  optionally followed by a "u"
// r   followed by an "r"

console.table(britishText.match(regexpEnding));
// ["neighbour", "favour"]

console.table(americanText.match(regexpEnding));
// ["neighbor", "favor"]
```

### Greedy và non-greedy

Trong ví dụ này, chúng ta khớp một hoặc nhiều ký tự từ hoặc dấu cách với `[\w ]+` và `[\w ]+?`. Cái đầu tiên là greedy và cái thứ hai là non-greedy. Lưu ý cách cái thứ hai dừng lại ngay khi đáp ứng yêu cầu tối thiểu.

```js
const text = "I must be getting somewhere near the center of the earth.";
const greedyRegexp = /[\w ]+/;

console.log(text.match(greedyRegexp)[0]);
// "I must be getting somewhere near the center of the earth"
// almost all of the text matches (leaves out the dot character)

const nonGreedyRegexp = /[\w ]+?/; // Notice the question mark
console.log(text.match(nonGreedyRegexp));
// "I"
// The match is the smallest one possible
```

## Xem thêm

- Hướng dẫn [Biểu thức chính quy](/en-US/docs/Web/JavaScript/Guide/Regular_expressions)
- Hướng dẫn [Lớp ký tự](/en-US/docs/Web/JavaScript/Guide/Regular_expressions/Character_classes)
- Hướng dẫn [Assertions](/en-US/docs/Web/JavaScript/Guide/Regular_expressions/Assertions)
- Hướng dẫn [Nhóm và backreference](/en-US/docs/Web/JavaScript/Guide/Regular_expressions/Groups_and_backreferences)
- [`RegExp`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/RegExp)
- Tài liệu tham khảo [Biểu thức chính quy](/en-US/docs/Web/JavaScript/Guide/Regular_expressions)
- [Quantifier: `*`, `+`, `?`, `{n}`, `{n,}`, `{n,m}`](/en-US/docs/Web/JavaScript/Reference/Regular_expressions/Quantifier)
