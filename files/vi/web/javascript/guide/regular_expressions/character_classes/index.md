---
title: Character classes
slug: Web/JavaScript/Guide/Regular_expressions/Character_classes
page-type: guide
sidebar: jssidebar
---

Character classes phân biệt các loại ký tự khác nhau, ví dụ như phân biệt giữa chữ cái và chữ số.

{{InteractiveExample("JavaScript Demo: RegExp Character classes")}}

```js interactive-example
const chessStory = "He played the King in a8 and she moved her Queen in c2.";
const regexpCoordinates = /\w\d/g;
console.log(chessStory.match(regexpCoordinates));
// Expected output: Array [ 'a8', 'c2']

const moods = "happy 🙂, confused 😕, sad 😢";
const regexpEmoticons = /[\u{1F600}-\u{1F64F}]/gu;
console.log(moods.match(regexpEmoticons));
// Expected output: Array ['🙂', '😕', '😢']
```

## Các loại

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
        <code>[xyz]<br />[a-c]</code>
      </td>
      <td>
        <p>
          <a href="/en-US/docs/Web/JavaScript/Reference/Regular_expressions/Character_class"><strong>Character class:</strong></a>
          Khớp với bất kỳ ký tự nào trong số các ký tự được bao quanh. Bạn có thể
          chỉ định một phạm vi ký tự bằng cách sử dụng dấu gạch ngang, nhưng nếu dấu gạch ngang
          xuất hiện ở đầu hoặc cuối các ký tự được bao quanh bởi dấu ngoặc vuông,
          nó được coi là dấu gạch ngang literal được đưa vào character class
          như một ký tự thông thường.
        </p>
        <p>
          Ví dụ, <code>[abcd]</code> giống với <code>[a-d]</code>.
          Chúng khớp với "b" trong "brisket" và "c" trong "chop".
        </p>
        <p>
          Ví dụ, <code>[abcd-]</code> và <code>[-abcd]</code> khớp với
          "b" trong "brisket", "c" trong "chop", và "-" (dấu gạch ngang) trong
          "non-profit".
        </p>
        <p>
          Ví dụ, <code>[\w-]</code> giống với
          <code>[A-Za-z0-9_-]</code>. Cả hai đều khớp với "b" trong "brisket", "c"
          trong "chop", và "n" trong "non-profit".
        </p>
        <p>
          Khi cờ <a href="/en-US/docs/Web/JavaScript/Reference/Global_Objects/RegExp/unicodeSets"><code>unicodeSets</code></a> (<code>v</code>) được bật, character class có thêm một số tính năng. Xem tài liệu tham khảo <a href="/en-US/docs/Web/JavaScript/Reference/Regular_expressions/Character_class">character class</a> để biết thêm thông tin.
        </p>
      </td>
    </tr>
    <tr>
      <td>
        <p>
          <code>[^xyz]<br />[^a-c]</code>
        </p>
      </td>
      <td>
        <p>
          <a href="/en-US/docs/Web/JavaScript/Reference/Regular_expressions/Character_class"><strong>Negated character class:</strong></a>
          Khớp với bất cứ thứ gì không nằm trong dấu ngoặc vuông. Bạn có thể chỉ định phạm vi
          ký tự bằng cách sử dụng dấu gạch ngang, nhưng nếu dấu gạch ngang xuất hiện ở vị trí
          đầu tiên sau <code>^</code> hoặc ký tự cuối cùng trong dấu ngoặc vuông, nó được coi là
          dấu gạch ngang literal được đưa vào character class như một ký tự thông thường. Ví dụ, <code>[^abc]</code> giống với
          <code>[^a-c]</code>. Ban đầu chúng khớp với "o" trong "bacon" và "h" trong
          "chop".
        </p>
        <div class="notecard note">
          <p>
            <strong>Lưu ý:</strong> Ký tự ^ cũng có thể chỉ ra
            <a
              href="/en-US/docs/Web/JavaScript/Guide/Regular_expressions/Assertions"
              >đầu đầu vào</a
            >.
          </p>
        </div>
      </td>
    </tr>
    <tr>
      <td><code>.</code></td>
      <td>
        <p>
          <a href="/en-US/docs/Web/JavaScript/Reference/Regular_expressions/Wildcard"><strong>Wildcard:</strong></a>
          Khớp với bất kỳ ký tự đơn nào <em>ngoại trừ</em> ký tự kết thúc dòng:
          <code>\n</code>, <code>\r</code>, <code>\u2028</code> hoặc
          <code>\u2029</code>. Ví dụ, <code>/.y/</code> khớp với "my" và
          "ay", nhưng không khớp với "yes", trong "yes make my day", vì không có ký tự trước "y" trong "yes". Nếu cờ <a href="/en-US/docs/Web/JavaScript/Reference/Global_Objects/RegExp/dotAll"><code>dotAll</code></a> (s) được bật, cũng khớp với ký tự kết thúc dòng.
          Bên trong một character class, dấu chấm mất ý nghĩa đặc biệt và
          khớp với một dấu chấm literal.
        </p>
      </td>
    </tr>
    <tr>
      <td><code>\d</code></td>
      <td>
        <p>
          <a href="/en-US/docs/Web/JavaScript/Reference/Regular_expressions/Character_class_escape"><strong>Digit character class escape:</strong></a>
          Khớp với bất kỳ chữ số nào (chữ số Arabic). Tương đương với <code>[0-9]</code>.
          Ví dụ, <code>/\d/</code> hoặc <code>/[0-9]/</code> khớp với "2" trong
          "B2 is the suite number".
        </p>
      </td>
    </tr>
    <tr>
      <td><code>\D</code></td>
      <td>
        <p>
          <a href="/en-US/docs/Web/JavaScript/Reference/Regular_expressions/Character_class_escape"><strong>Non-digit character class escape:</strong></a>
          Khớp với bất kỳ ký tự nào không phải chữ số (chữ số Arabic). Tương đương
          với <code>[^0-9]</code>. Ví dụ, <code>/\D/</code> hoặc
          <code>/[^0-9]/</code> khớp với "B" trong "B2 is the suite number".
        </p>
      </td>
    </tr>
    <tr>
      <td><code>\w</code></td>
      <td>
        <p>
          <a href="/en-US/docs/Web/JavaScript/Reference/Regular_expressions/Character_class_escape"><strong>Word character class escape:</strong></a>
          Khớp với bất kỳ ký tự chữ và số nào từ bảng chữ cái Latin cơ bản,
          bao gồm cả dấu gạch dưới. Tương đương với <code>[A-Za-z0-9_]</code>. Ví dụ,
          <code>/\w/</code> khớp với "a" trong "apple", "5" trong "$5.28", "3"
          trong "3D" và "m" trong "Émanuel".
        </p>
      </td>
    </tr>
    <tr>
      <td><code>\W</code></td>
      <td>
        <p>
          <a href="/en-US/docs/Web/JavaScript/Reference/Regular_expressions/Character_class_escape"><strong>Non-word character class escape:</strong></a>
          Khớp với bất kỳ ký tự nào không phải ký tự từ từ bảng chữ cái Latin cơ bản. Tương đương với <code>[^A-Za-z0-9_]</code>. Ví dụ,
          <code>/\W/</code> hoặc <code>/[^A-Za-z0-9_]/</code> khớp với "%" trong "50%"
          và "É" trong "Émanuel".
        </p>
      </td>
    </tr>
    <tr>
      <td><code>\s</code></td>
      <td>
        <p>
          <a href="/en-US/docs/Web/JavaScript/Reference/Regular_expressions/Character_class_escape"><strong>White space character class escape:</strong></a>
          Khớp với một ký tự khoảng trắng đơn, bao gồm dấu cách, tab, form
          feed, line feed, và các khoảng trắng Unicode khác. Tương đương với
          <code>[\f\n\r\t\v\u0020\u00a0\u1680\u2000-\u200a\u2028\u2029\u202f\u205f\u3000\ufeff]</code>. Ví dụ, <code>/\s\w*/</code> khớp với " bar" trong "foo bar".
        </p>
      </td>
    </tr>
    <tr>
      <td><code>\S</code></td>
      <td>
        <p>
          <a href="/en-US/docs/Web/JavaScript/Reference/Regular_expressions/Character_class_escape"><strong>Non-white space character class escape:</strong></a>
          Khớp với một ký tự đơn không phải khoảng trắng. Tương đương với
          <code>[^\f\n\r\t\v\u0020\u00a0\u1680\u2000-\u200a\u2028\u2029\u202f\u205f\u3000\ufeff]</code>. Ví dụ, <code>/\S\w*/</code> khớp với "foo" trong "foo bar".
        </p>
      </td>
    </tr>
    <tr>
      <td><code>\t</code></td>
      <td>Khớp với tab ngang.</td>
    </tr>
    <tr>
      <td><code>\r</code></td>
      <td>Khớp với carriage return.</td>
    </tr>
    <tr>
      <td><code>\n</code></td>
      <td>Khớp với linefeed.</td>
    </tr>
    <tr>
      <td><code>\v</code></td>
      <td>Khớp với tab dọc.</td>
    </tr>
    <tr>
      <td><code>\f</code></td>
      <td>Khớp với form-feed.</td>
    </tr>
    <tr>
      <td><code>[\b]</code></td>
      <td>
        Khớp với backspace. Nếu bạn đang tìm assertion ranh giới từ
        (<code>\b</code>), xem
        <a
          href="/en-US/docs/Web/JavaScript/Guide/Regular_expressions/Assertions"
          >Assertions</a
        >.
      </td>
    </tr>
    <tr>
      <td><code>\0</code></td>
      <td>Khớp với ký tự NUL. Không theo sau ký tự này bằng một chữ số khác.</td>
    </tr>
    <tr>
      <td>
        <code>\c<em>X</em></code>
      </td>
      <td>
        <p>
          Khớp với ký tự điều khiển sử dụng
          <a href="https://en.wikipedia.org/wiki/Caret_notation"
            >caret notation</a
          >, trong đó "X" là một chữ cái từ A–Z hoặc a–z (tương ứng với code points
          <code>U+0001</code><em>–</em><code>U+001A</code>). Ví dụ,
          <code>/\cM\cJ/</code> khớp với "\r\n".
        </p>
      </td>
    </tr>
    <tr>
      <td>
        <code>\x<em>hh</em></code>
      </td>
      <td>
        <a href="/en-US/docs/Web/JavaScript/Reference/Regular_expressions/Character_escape"><strong>Hex escape:</strong></a>
        Khớp với ký tự có mã <code><em>hh</em></code> (hai
        chữ số thập lục phân).
      </td>
    </tr>
    <tr>
      <td>
        <code>\u<em>HHHH</em></code>
      </td>
      <td>
        <a href="/en-US/docs/Web/JavaScript/Reference/Regular_expressions/Character_escape"><strong>Unicode escape:</strong></a>
        Khớp với UTF-16 code-unit có giá trị
        <code><em>HHHH</em></code> (bốn chữ số thập lục phân).
      </td>
    </tr>
    <tr>
      <td>
        <code>\u{<em>H…H</em>}</code>
      </td>
      <td>
        <a href="/en-US/docs/Web/JavaScript/Reference/Regular_expressions/Character_escape"><strong>Unicode code point escape:</strong></a>
        (Chỉ khi cờ <code>u</code> được đặt.) Khớp với ký tự có
        giá trị Unicode <code>U+<em>H…H</em></code> (1 đến 6 chữ số thập lục phân).
      </td>
    </tr>
    <tr>
      <td>
        <code>\p{<em>UnicodeProperty</em>}</code>,
        <code>\P{<em>UnicodeProperty</em>}</code>
      </td>
      <td>
        <p>
          <a href="/en-US/docs/Web/JavaScript/Reference/Regular_expressions/Unicode_character_class_escape"><strong>Unicode character class escape:</strong></a>
          Khớp với một ký tự dựa trên thuộc tính Unicode của nó: ví dụ, ký tự emoji, hoặc ký tự
          <em>katakana</em> tiếng Nhật, hoặc ký tự Han/Kanji Trung Quốc/Nhật Bản,
          v.v.).
        </p>
      </td>
    </tr>
    <tr>
      <td><code>\</code></td>
      <td>
        <p>
          Chỉ ra rằng ký tự tiếp theo nên được xử lý đặc biệt, hoặc
          "escaped". Nó có một trong hai hành vi.
        </p>
        <ul>
          <li>
            Đối với các ký tự thường được xử lý theo nghĩa đen, chỉ ra rằng
            ký tự tiếp theo là đặc biệt và không được hiểu theo nghĩa đen.
            Ví dụ, <code>/b/</code> khớp với ký tự "b". Bằng cách đặt
            dấu gạch chéo ngược trước "b", nghĩa là bằng cách sử dụng <code>/\b/</code>, ký tự
            trở thành đặc biệt có nghĩa là khớp ranh giới từ.
          </li>
          <li>
            Đối với các ký tự thường được xử lý đặc biệt, chỉ ra rằng
            ký tự tiếp theo không đặc biệt và nên được hiểu
            theo nghĩa đen. Ví dụ, "*" là ký tự đặc biệt có nghĩa là 0 hoặc
            nhiều lần xuất hiện của ký tự trước phải được khớp; ví dụ,
            <code>/a*/</code> có nghĩa là khớp 0 hoặc nhiều "a". Để khớp
            <code>*</code> theo nghĩa đen, đặt dấu gạch chéo ngược trước nó; ví dụ,
            <code>/a\*/</code> khớp với "a*".
          </li>
        </ul>
        <div class="notecard note">
          <p>
            <strong>Lưu ý:</strong> Để khớp với ký tự này theo nghĩa đen, hãy escape nó
            với chính nó. Nói cách khác, để tìm kiếm <code>\</code> hãy dùng
            <code>/\\/</code>.
          </p>
        </div>
      </td>
    </tr>
    <tr>
      <td>
        <code><em>x</em>|<em>y</em></code>
      </td>
      <td>
        <p>
          <a href="/en-US/docs/Web/JavaScript/Reference/Regular_expressions/Disjunction"><strong>Disjunction:</strong></a>
          Khớp với "x" hoặc "y". Mỗi thành phần, được phân tách bởi ký tự pipe (<code>|</code>), được gọi là một <em>alternative</em>. Ví dụ,
          <code>/green|red/</code> khớp với "green" trong "green apple" và "red" trong
          "red apple".
        </p>
        <div class="notecard note">
          <p>
            <strong>Lưu ý:</strong> Disjunction là một cách khác để chỉ định "một tập hợp các lựa chọn", nhưng nó không phải là một character class. Disjunctions không phải là atoms — bạn cần sử dụng một <a href="/en-US/docs/Web/JavaScript/Guide/Regular_expressions/Groups_and_backreferences">group</a> để biến nó thành một phần của mẫu lớn hơn. <code>[abc]</code> tương đương về chức năng với <code>(?:a|b|c)</code>.
          </p>
        </div>
      </td>
    </tr>
  </tbody>
</table>

## Ví dụ

### Tìm kiếm một chuỗi chữ số

Trong ví dụ này, ta khớp một chuỗi 4 chữ số với `\d{4}`. `\b` chỉ ra [ranh giới từ](/en-US/docs/Web/JavaScript/Guide/Regular_expressions/Assertions) (tức là không bắt đầu hoặc kết thúc khớp ở giữa một chuỗi số).

```js
const randomData = "015 354 8787 687351 3512 8735";
const regexpFourDigits = /\b\d{4}\b/g;

console.table(randomData.match(regexpFourDigits));
// ['8787', '3512', '8735']
```

Xem thêm ví dụ trong tài liệu tham khảo [character class escape](/en-US/docs/Web/JavaScript/Reference/Regular_expressions/Character_class_escape).

### Tìm kiếm một từ (từ bảng chữ cái Latin) bắt đầu bằng A

Trong ví dụ này, ta khớp một từ bắt đầu bằng chữ A. `\b` chỉ ra [ranh giới từ](/en-US/docs/Web/JavaScript/Guide/Regular_expressions/Assertions) (tức là không bắt đầu khớp ở giữa một từ). `[aA]` chỉ ra chữ cái "a" hoặc "A". `\w+` chỉ ra bất kỳ ký tự nào _từ bảng chữ cái Latin_, nhiều lần (`+` là một [quantifier](/en-US/docs/Web/JavaScript/Guide/Regular_expressions/Quantifiers)). Lưu ý rằng vì ta đã khớp cho đến khi không còn ký tự từ nào nữa, ranh giới `\b` cuối không cần thiết.

```js
const aliceExcerpt =
  "I'm sure I'm not Ada,' she said, 'for her hair goes in such long ringlets, and mine doesn't go in ringlets at all.";
const regexpWordStartingWithA = /\b[aA]\w+/g;

console.table(aliceExcerpt.match(regexpWordStartingWithA));
// ['Ada', 'and', 'at', 'all']
```

Xem thêm ví dụ trong tài liệu tham khảo [character class escape](/en-US/docs/Web/JavaScript/Reference/Regular_expressions/Character_class_escape).

### Tìm kiếm một từ (từ ký tự Unicode)

Thay vì bảng chữ cái Latin, ta có thể sử dụng một phạm vi ký tự Unicode để xác định một từ (do đó có thể xử lý văn bản bằng các ngôn ngữ khác như tiếng Nga hoặc tiếng Ả Rập). "Basic Multilingual Plane" của Unicode chứa hầu hết các ký tự được sử dụng trên thế giới và ta có thể sử dụng character classes và phạm vi để khớp các từ được viết bằng những ký tự đó.

```js
const nonEnglishText = "Приключения Алисы в Стране чудес";
const regexpBMPWord = /([\u0000-\u0019\u0021-\uFFFF])+/gu;
// BMP goes through U+0000 to U+FFFF but space is U+0020

console.table(nonEnglishText.match(regexpBMPWord));
["Приключения", "Алисы", "в", "Стране", "чудес"];
```

Xem thêm ví dụ trong tài liệu tham khảo [Unicode character class escape](/en-US/docs/Web/JavaScript/Reference/Regular_expressions/Unicode_character_class_escape).

### Đếm nguyên âm

Trong ví dụ này, ta đếm số nguyên âm (A, E, I, O, U, Y) trong một đoạn văn bản. Cờ `g` được dùng để khớp tất cả các lần xuất hiện của mẫu trong văn bản. Cờ `i` được dùng để làm mẫu không phân biệt chữ hoa chữ thường, do đó nó khớp cả nguyên âm chữ hoa và chữ thường.

```js
const aliceExcerpt =
  "There was a long silence after this, and Alice could only hear whispers now and then.";
const regexpVowels = /[aeiouy]/gi;

console.log("Number of vowels:", aliceExcerpt.match(regexpVowels).length);
// Number of vowels: 26
```

## Xem thêm

- Hướng dẫn [Regular expressions](/en-US/docs/Web/JavaScript/Guide/Regular_expressions)
- Hướng dẫn [Assertions](/en-US/docs/Web/JavaScript/Guide/Regular_expressions/Assertions)
- Hướng dẫn [Quantifiers](/en-US/docs/Web/JavaScript/Guide/Regular_expressions/Quantifiers)
- Hướng dẫn [Groups and backreferences](/en-US/docs/Web/JavaScript/Guide/Regular_expressions/Groups_and_backreferences)
- [`RegExp`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/RegExp)
- Tài liệu tham khảo [Regular expressions](/en-US/docs/Web/JavaScript/Guide/Regular_expressions)
- [Character class: `[...]`, `[^...]`](/en-US/docs/Web/JavaScript/Reference/Regular_expressions/Character_class)
- [Character class escape: `\d`, `\D`, `\w`, `\W`, `\s`, `\S`](/en-US/docs/Web/JavaScript/Reference/Regular_expressions/Character_class_escape)
- [Character escape: `\n`, `\u{...}`](/en-US/docs/Web/JavaScript/Reference/Regular_expressions/Character_escape)
- [Disjunction: `|`](/en-US/docs/Web/JavaScript/Reference/Regular_expressions/Disjunction)
- [Unicode character class escape: `\p{...}`, `\P{...}`](/en-US/docs/Web/JavaScript/Reference/Regular_expressions/Unicode_character_class_escape)
- [Wildcard: `.`](/en-US/docs/Web/JavaScript/Reference/Regular_expressions/Wildcard)
