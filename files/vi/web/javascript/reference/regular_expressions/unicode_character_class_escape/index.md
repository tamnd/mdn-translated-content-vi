---
title: "Unicode character class escape: \\p{...}, \\P{...}"
slug: Web/JavaScript/Reference/Regular_expressions/Unicode_character_class_escape
page-type: javascript-language-feature
browser-compat: javascript.regular_expressions.unicode_character_class_escape
sidebar: jssidebar
---

Một **unicode character class escape** là một loại [character class escape](/en-US/docs/Web/JavaScript/Reference/Regular_expressions/Character_class_escape) khớp một tập hợp ký tự được chỉ định bởi một thuộc tính Unicode. Nó chỉ được hỗ trợ trong [Unicode-aware mode](/en-US/docs/Web/JavaScript/Reference/Global_Objects/RegExp/unicode#unicode-aware_mode). Khi flag [`v`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/RegExp/unicodeSets) được bật, nó cũng có thể được sử dụng để khớp các chuỗi có độ dài hữu hạn.

{{InteractiveExample("JavaScript Demo: Regex Unicode character class escape", "taller")}}

```js interactive-example
const sentence = "A ticket to 大阪 costs ¥2000 👌.";

const regexpEmojiPresentation = /\p{Emoji_Presentation}/gu;
console.log(sentence.match(regexpEmojiPresentation));
// Expected output: Array ["👌"]

const regexpNonLatin = /\P{Script_Extensions=Latin}+/gu;
console.log(sentence.match(regexpNonLatin));
// Expected output: Array [" ", " ", " 大阪 ", " ¥2000 👌."]

const regexpCurrencyOrPunctuation = /\p{Sc}|\p{P}/gu;
console.log(sentence.match(regexpCurrencyOrPunctuation));
// Expected output: Array ["¥", "."]
```

## Cú pháp

```regex
\p{loneProperty}
\P{loneProperty}

\p{property=value}
\P{property=value}
```

### Tham số

- `loneProperty`
  - : Một tên hoặc giá trị thuộc tính Unicode đơn lẻ, theo cùng cú pháp như `value`. Nó chỉ định giá trị cho thuộc tính `General_Category`, hoặc một [tên thuộc tính nhị phân](https://tc39.es/ecma262/multipage/text-processing.html#table-binary-unicode-properties). Trong chế độ [`v`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/RegExp/unicodeSets), nó cũng có thể là một [thuộc tính nhị phân Unicode của chuỗi](https://tc39.es/ecma262/multipage/text-processing.html#table-binary-unicode-properties-of-strings).

    > [!NOTE]
    > Cú pháp [ICU](https://unicode-org.github.io/icu/userguide/strings/unicodeset.html#property-values) cho phép bỏ qua tên thuộc tính `Script` cũng vậy, nhưng JavaScript không hỗ trợ điều này, vì hầu hết thời gian `Script_Extensions` hữu ích hơn `Script`.

- `property`
  - : Tên thuộc tính Unicode. Phải được tạo thành từ các chữ cái {{Glossary("ASCII")}} (`A–Z`, `a–z`) và dấu gạch dưới (`_`), và phải là một trong các [tên thuộc tính không nhị phân](https://tc39.es/ecma262/multipage/text-processing.html#table-nonbinary-unicode-properties).
- `value`
  - : Giá trị thuộc tính Unicode. Phải được tạo thành từ các chữ cái ASCII (`A–Z`, `a–z`), dấu gạch dưới (`_`), và chữ số (`0–9`), và phải là một trong các giá trị được hỗ trợ được liệt kê trong [`PropertyValueAliases.txt`](https://unicode.org/Public/UCD/latest/ucd/PropertyValueAliases.txt).

## Mô tả

`\p` và `\P` chỉ được hỗ trợ trong [Unicode-aware mode](/en-US/docs/Web/JavaScript/Reference/Global_Objects/RegExp/unicode#unicode-aware_mode). Trong Unicode-unaware mode, chúng là [identity escapes](/en-US/docs/Web/JavaScript/Reference/Regular_expressions/Character_escape) cho ký tự `p` hoặc `P`.

Mỗi ký tự Unicode có một tập hợp các thuộc tính mô tả nó. Ví dụ, ký tự [`a`](https://util.unicode.org/UnicodeJsps/character.jsp?a=0061) có thuộc tính `General_Category` với giá trị `Lowercase_Letter`, và thuộc tính `Script` với giá trị `Latn`. Các escape sequences `\p` và `\P` cho phép bạn khớp một ký tự dựa trên các thuộc tính của nó. Ví dụ, `a` có thể được khớp bởi `\p{Lowercase_Letter}` (tên thuộc tính `General_Category` là tùy chọn) cũng như `\p{Script=Latn}`. `\P` tạo ra một _complement class_ bao gồm các code points không có thuộc tính được chỉ định.

Khi flag [`i`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/RegExp/ignoreCase) được đặt, các character classes `\P` được xử lý hơi khác trong chế độ `u` và `v`. Trong chế độ `u`, case-folding xảy ra sau phép trừ; trong chế độ `v`, case-folding xảy ra trước phép trừ. Cụ thể hơn, trong chế độ `u`, `\P{property}` khớp `caseFold(allCharacters - charactersWithProperty)`. Điều này có nghĩa là `/\P{Lowercase_Letter}/iu` vẫn khớp `"a"`, vì `A` không phải là `Lowercase_Letter`. Trong chế độ `v`, `\P{property}` khớp `caseFold(allCharacters) - caseFold(charactersWithProperty)`. Điều này có nghĩa là `/\P{Lowercase_Letter}/iv` không khớp `"a"`, vì `A` thậm chí không nằm trong tập hợp tất cả các ký tự Unicode được fold. Xem thêm [complement classes và khớp không phân biệt hoa/thường](/en-US/docs/Web/JavaScript/Reference/Regular_expressions/Character_class#complement_classes_and_case-insensitive_matching).

Để kết hợp nhiều thuộc tính, hãy sử dụng cú pháp [character set intersection](/en-US/docs/Web/JavaScript/Reference/Regular_expressions/Character_class#v-mode_character_class) được bật với flag `v`, hoặc xem [phép trừ và giao pattern](/en-US/docs/Web/JavaScript/Reference/Regular_expressions/Lookahead_assertion#pattern_subtraction_and_intersection).

Trong chế độ `v`, `\p` có thể khớp một chuỗi các code points, được định nghĩa trong Unicode là "properties of strings". Điều này hữu ích nhất cho emojis, thường được tạo thành từ nhiều code points. Tuy nhiên, `\P` chỉ có thể bổ sung các thuộc tính ký tự.

> [!NOTE]
> Có kế hoạch chuyển tính năng properties of strings sang chế độ `u` cũng vậy.

## Ví dụ

### Danh mục chung

Danh mục chung được sử dụng để phân loại các ký tự Unicode và các danh mục con có sẵn để định nghĩa phân loại chính xác hơn. Có thể sử dụng cả dạng ngắn hoặc dạng dài trong Unicode property escapes.

Chúng có thể được sử dụng để khớp các chữ cái, số, ký hiệu, dấu câu, dấu cách, v.v. Để có danh sách đầy đủ hơn về các danh mục chung, vui lòng tham khảo [đặc tả Unicode](https://unicode.org/reports/tr18/#General_Category_Property).

```js
// finding all the letters of a text
const story = "It's the Cheshire Cat: now I shall have somebody to talk to.";

// Most explicit form
story.match(/\p{General_Category=Letter}/gu);

// It is not mandatory to use the property name for General categories
story.match(/\p{Letter}/gu);

// This is equivalent (short alias):
story.match(/\p{L}/gu);

// This is also equivalent (conjunction of all the subcategories using short aliases)
story.match(/\p{Lu}|\p{Ll}|\p{Lt}|\p{Lm}|\p{Lo}/gu);
```

### Scripts và script extensions

Một số ngôn ngữ sử dụng các scripts khác nhau cho hệ thống viết của họ. Ví dụ, tiếng Anh và tiếng Tây Ban Nha được viết bằng chữ Latin trong khi tiếng Ả Rập và tiếng Nga được viết bằng các scripts khác (lần lượt là tiếng Ả Rập và tiếng Cyrillic). Các thuộc tính Unicode `Script` và `Script_Extensions` cho phép regular expression khớp các ký tự theo script chúng được sử dụng chủ yếu (`Script`) hoặc theo tập hợp các scripts chúng thuộc về (`Script_Extensions`).

Ví dụ, `A` thuộc script `Latin` và `ε` thuộc script `Greek`.

```js
const mixedCharacters = "aεЛ";

// Using the canonical "long" name of the script
mixedCharacters.match(/\p{Script=Latin}/u); // a

// Using a short alias (ISO 15924 code) for the script
mixedCharacters.match(/\p{Script=Grek}/u); // ε

// Using the short name sc for the Script property
mixedCharacters.match(/\p{sc=Cyrillic}/u); // Л
```

Để biết thêm chi tiết, hãy tham khảo [đặc tả Unicode](https://unicode.org/reports/tr24/#Script), [bảng Scripts trong đặc tả ECMAScript](https://tc39.es/ecma262/multipage/text-processing.html#table-unicode-script-values), và [danh sách mã script ISO 15924](https://unicode.org/iso15924/iso15924-codes.html).

Nếu một ký tự được sử dụng trong một tập hợp hạn chế các scripts, thuộc tính `Script` sẽ chỉ khớp cho script được sử dụng "chủ yếu". Nếu chúng ta muốn khớp các ký tự dựa trên script "không chủ yếu", chúng ta có thể sử dụng thuộc tính `Script_Extensions` (viết tắt là `scx`).

```js
// ٢ is the digit 2 in Arabic-Indic notation
// while it is predominantly written within the Arabic script
// it can also be written in the Thaana script

"٢".match(/\p{Script=Thaana}/u);
// null as Thaana is not the predominant script

"٢".match(/\p{Script_Extensions=Thaana}/u);
// ["٢", index: 0, input: "٢", groups: undefined]
```

### Unicode property escapes so với character classes

Với JavaScript regular expressions, cũng có thể sử dụng [character classes](/en-US/docs/Web/JavaScript/Guide/Regular_expressions/Character_classes) và đặc biệt là `\w` hoặc `\d` để khớp các chữ cái hoặc chữ số. Tuy nhiên, các dạng như vậy chỉ khớp các ký tự từ script _Latin_ (nói cách khác, `a` đến `z` và `A` đến `Z` cho `\w` và `0` đến `9` cho `\d`). Như được hiển thị trong [ví dụ này](/en-US/docs/Web/JavaScript/Guide/Regular_expressions/Character_classes#looking_for_a_word_from_unicode_characters), có thể hơi bất tiện khi làm việc với các văn bản không phải Latin.

Các danh mục Unicode property escapes bao gồm nhiều ký tự hơn nhiều và `\p{Letter}` hoặc `\p{Number}` sẽ hoạt động cho bất kỳ script nào.

```js
// Trying to use ranges to avoid \w limitations:

const nonEnglishText = "Приключения Алисы в Стране чудес";
const regexpBMPWord = /([\u0000-\u0019\u0021-\uFFFF])+/gu;
// BMP goes through U+0000 to U+FFFF but space is U+0020

console.table(nonEnglishText.match(regexpBMPWord));

// Using Unicode property escapes instead
const regexpUPE = /\p{L}+/gu;
console.table(nonEnglishText.match(regexpUPE));
```

### Khớp giá cả

Ví dụ sau khớp các giá cả trong một chuỗi:

```js
function getPrices(str) {
  // Sc stands for "currency symbol"
  return [...str.matchAll(/\p{Sc}\s*[\d.,]+/gu)].map((match) => match[0]);
}

const str = `California rolls $6.99
Crunchy rolls $8.49
Shrimp tempura $10.99`;
console.log(getPrices(str)); // ["$6.99", "$8.49", "$10.99"]

const str2 = `US store $19.99
Europe store €18.99
Japan store ¥2000`;
console.log(getPrices(str2)); // ["$19.99", "€18.99", "¥2000"]
```

### Khớp chuỗi

Với flag `v`, `\p{…}` có thể khớp các chuỗi có thể dài hơn một ký tự bằng cách sử dụng thuộc tính của chuỗi:

```js
const flag = "🇺🇳";
console.log(flag.length); // 2
console.log(/\p{RGI_Emoji_Flag_Sequence}/v.exec(flag)); // [ '🇺🇳' ]
```

Tuy nhiên, bạn không thể sử dụng `\P` để khớp "một chuỗi không có thuộc tính", vì không rõ bao nhiêu ký tự sẽ được tiêu thụ.

```js-nolint example-bad
/\P{RGI_Emoji_Flag_Sequence}/v; // SyntaxError: Invalid regular expression: Invalid property name
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- Hướng dẫn [Character classes](/en-US/docs/Web/JavaScript/Guide/Regular_expressions/Character_classes)
- [Regular expressions](/en-US/docs/Web/JavaScript/Reference/Regular_expressions)
- [Character class: `[...]`, `[^...]`](/en-US/docs/Web/JavaScript/Reference/Regular_expressions/Character_class)
- [Character class escape: `\d`, `\D`, `\w`, `\W`, `\s`, `\S`](/en-US/docs/Web/JavaScript/Reference/Regular_expressions/Character_class_escape)
- [Character escape: `\n`, `\u{...}`](/en-US/docs/Web/JavaScript/Reference/Regular_expressions/Character_escape)
- [Disjunction: `|`](/en-US/docs/Web/JavaScript/Reference/Regular_expressions/Disjunction)
- [Unicode character property](https://en.wikipedia.org/wiki/Unicode_character_property) trên Wikipedia
- [ES2018: RegExp Unicode property escapes](https://2ality.com/2017/07/regexp-unicode-property-escapes.html) bởi Dr. Axel Rauschmayer (2017)
- [Unicode regular expressions § Properties](https://unicode.org/reports/tr18/#Categories)
- [Unicode Utilities: UnicodeSet](https://util.unicode.org/UnicodeJsps/list-unicodeset.jsp)
- [RegExp v flag with set notation and properties of strings](https://v8.dev/features/regexp-v-flag) on v8.dev (2022)
