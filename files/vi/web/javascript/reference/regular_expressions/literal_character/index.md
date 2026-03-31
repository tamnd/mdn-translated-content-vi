---
title: "Literal character: a, b"
slug: Web/JavaScript/Reference/Regular_expressions/Literal_character
page-type: javascript-language-feature
browser-compat: javascript.regular_expressions.literal_character
sidebar: jssidebar
---

Một **literal character** chỉ định chính xác ký tự đó để được khớp trong văn bản đầu vào.

## Cú pháp

```regex
c
```

### Tham số

- `c`
  - : Một ký tự đơn lẻ không phải là một trong các ký tự cú pháp được mô tả bên dưới.

## Mô tả

Trong regular expressions, hầu hết các ký tự có thể xuất hiện theo nghĩa đen. Chúng thường là các khối xây dựng cơ bản nhất của pattern. Ví dụ, đây là một pattern từ ví dụ [Xóa HTML tags](/en-US/docs/Web/JavaScript/Reference/Regular_expressions/Quantifier#removing_html_tags):

```js
const pattern = /<.+?>/g;
```

Trong ví dụ này, `.`, `+`, và `?` được gọi là _ký tự cú pháp_. Chúng có ý nghĩa đặc biệt trong regular expressions. Phần còn lại của các ký tự trong pattern (`<` và `>`) là các literal characters. Chúng khớp chính chúng trong văn bản đầu vào: dấu ngoặc nhọn trái và phải.

Các ký tự sau là các ký tự cú pháp trong regular expressions, và chúng không thể xuất hiện như các literal characters:

- [`^`, `$`](/en-US/docs/Web/JavaScript/Reference/Regular_expressions/Input_boundary_assertion)
- [`\`](/en-US/docs/Web/JavaScript/Reference/Regular_expressions/Character_escape)
- [`*`, `+`, `?`, `{`, `}`](/en-US/docs/Web/JavaScript/Reference/Regular_expressions/Quantifier)
- [`(`, `)`](/en-US/docs/Web/JavaScript/Reference/Regular_expressions/Capturing_group)
- [`[`, `]`](/en-US/docs/Web/JavaScript/Reference/Regular_expressions/Character_class)
- [`|`](/en-US/docs/Web/JavaScript/Reference/Regular_expressions/Disjunction)

Trong character classes, nhiều ký tự hơn có thể xuất hiện theo nghĩa đen. Để biết thêm thông tin, xem trang [Character class](/en-US/docs/Web/JavaScript/Reference/Regular_expressions/Character_class). Ví dụ `\.` và `[.]` đều khớp một dấu chấm literal. Tuy nhiên, trong [`v`-mode character classes](/en-US/docs/Web/JavaScript/Reference/Regular_expressions/Character_class#v-mode_character_class), có một tập hợp khác các ký tự được dành riêng làm ký tự cú pháp. Để toàn diện nhất, bên dưới là bảng các ký tự ASCII và liệu chúng có thể xuất hiện đã thoát hoặc chưa thoát trong các ngữ cảnh khác nhau, trong đó "✅" có nghĩa là ký tự đại diện cho chính nó, "❌" có nghĩa là nó ném ra lỗi cú pháp, và "⚠️" có nghĩa là ký tự hợp lệ nhưng có nghĩa khác với chính nó.

<table class="fullwidth-table">
  <thead>
    <tr>
      <th scope="col" rowspan="2">Ký tự</th>
      <th scope="col" colspan="2">Bên ngoài character classes trong chế độ <code>u</code> hoặc <code>v</code></th>
      <th scope="col" colspan="2">Trong <code>u</code>-mode character classes</th>
      <th scope="col" colspan="2">Trong <code>v</code>-mode character classes</th>
    </tr>
    <tr>
      <th scope="col">Chưa thoát</th>
      <th scope="col">Đã thoát</th>
      <th scope="col">Chưa thoát</th>
      <th scope="col">Đã thoát</th>
      <th scope="col">Chưa thoát</th>
      <th scope="col">Đã thoát</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td><code>123456789&nbsp;"'<br>ACEFGHIJKLMN<br>OPQRTUVXYZ_<br>aceghijklmop<br>quxyz</code></td>
      <td>✅</td><td>❌</td><td>✅</td><td>❌</td><td>✅</td><td>❌</td>
    </tr>
    <tr>
      <td><code>!#%&,:;&lt;=&gt;@`~</code></td>
      <td>✅</td><td>❌</td><td>✅</td><td>❌</td><td>✅</td><td>✅</td>
    </tr>
    <tr>
      <td><code>]</code></td>
      <td>❌</td><td>✅</td><td>❌</td><td>✅</td><td>❌</td><td>✅</td>
    </tr>
    <tr>
      <td><code>()[{}</code></td>
      <td>❌</td><td>✅</td><td>✅</td><td>✅</td><td>❌</td><td>✅</td>
    </tr>
    <tr>
      <td><code>*+?</code></td>
      <td>❌</td><td>✅</td><td>✅</td><td>✅</td><td>✅</td><td>✅</td>
    </tr>
    <tr>
      <td><code>/</code></td>
      <td>✅</td><td>✅</td><td>✅</td><td>✅</td><td>❌</td><td>✅</td>
    </tr>
    <tr>
      <td><code>0DSWbdfnrstvw</code></td>
      <td>✅</td><td>⚠️</td><td>✅</td><td>⚠️</td><td>✅</td><td>⚠️</td>
    </tr>
    <tr>
      <td><code>B</code></td>
      <td>✅</td><td>⚠️</td><td>✅</td><td>❌</td><td>✅</td><td>❌</td>
    </tr>
    <tr>
      <td><code>$.</code></td>
      <td>⚠️</td><td>✅</td><td>✅</td><td>✅</td><td>✅</td><td>✅</td>
    </tr>
    <tr>
      <td><code>|</code></td>
      <td>⚠️</td><td>✅</td><td>✅</td><td>✅</td><td>❌</td><td>✅</td>
    </tr>
    <tr>
      <td><code>-</code></td>
      <td>✅</td><td>❌</td><td>✅⚠️</td><td>✅</td><td>❌⚠️</td><td>✅</td>
    </tr>
    <tr>
      <td><code>^</code></td>
      <td>⚠️</td><td>✅</td><td>✅⚠️</td><td>✅</td><td>✅⚠️</td><td>✅</td>
    </tr>
    <tr>
      <td><code>\</code></td>
      <td>❌⚠️</td><td>✅</td><td>❌⚠️</td><td>✅</td><td>❌⚠️</td><td>✅</td>
    </tr>
  </tbody>
</table>

<!--
// The table above is created with the help of this:
const tbl = {};

for (let i = 32; i < 127; i++) {
  const c = String.fromCharCode(i);
  const res = {};
  const allChars = Array.from({ length: 127 }, (_, i) =>
    String.fromCharCode(i),
  );
  function testProp(prop, cr) {
    try {
      const re = cr();
      const chars = allChars.filter((c) => re.test(c));
      if (chars.length !== 1 || chars[0] !== c) res[prop] = "special";
    } catch {
      res[prop] = "error";
    }
  }
  testProp("outLit", () => new RegExp(`^${c}$`, "u"));
  testProp("uInLit", () => new RegExp(`^[${c}]$`, "u"));
  testProp("vInLit", () => new RegExp(`^[${c}]$`, "v"));
  testProp("outEsc", () => new RegExp(`^\\${c}$`, "u"));
  testProp("uInEsc", () => new RegExp(`^[\\${c}]$`, "u"));
  testProp("vInEsc", () => new RegExp(`^[\\${c}]$`, "v"));
  tbl[c] = res;
}

function groupBy(arr, cb, cb2) {
  const groups = { __proto__: null };
  for (const a of arr) {
    const name = cb(a);
    groups[name] ??= "";
    groups[name] += cb2(a);
  }
  return groups;
}

console.log(
  groupBy(
    Object.entries(tbl),
    (p) =>
      ["outLit", "outEsc", "uInLit", "uInEsc", "vInLit", "vInEsc"]
        .map((k) => {
          switch (p[1][k]) {
            case undefined:
              return "✅";
            case "error":
              return "❌";
            case "special":
              return "⚠️";
          }
        })
        .join(""),
    (p) => p[0],
  ),
);
-->

> [!NOTE]
> Các ký tự có thể cả đã thoát và chưa thoát trong `v`-mode character classes là chính xác những ký tự bị cấm là "dấu câu kép". Xem [`v`-mode character classes](/en-US/docs/Web/JavaScript/Reference/Regular_expressions/Character_class#v-mode_character_class) để biết thêm thông tin.

Bất cứ khi nào bạn muốn khớp một ký tự cú pháp theo nghĩa đen, bạn cần [thoát](/en-US/docs/Web/JavaScript/Reference/Regular_expressions/Character_escape) nó bằng dấu gạch chéo ngược (`\`). Ví dụ, để khớp một `*` literal trong một pattern, bạn cần viết `\*` trong pattern. Sử dụng các ký tự cú pháp như các literal characters hoặc dẫn đến các kết quả không mong đợi hoặc gây ra lỗi cú pháp — ví dụ, `/*/` không phải là một regular expression hợp lệ vì quantifier không được đứng trước bởi một pattern. Trong [Unicode-unaware mode](/en-US/docs/Web/JavaScript/Reference/Global_Objects/RegExp/unicode#unicode-aware_mode), `]`, `{`, và `}` có thể xuất hiện theo nghĩa đen nếu không thể phân tích chúng như sự kết thúc của character class hoặc dấu phân giới quantifier. Đây là [cú pháp không dùng nữa để tương thích web](/en-US/docs/Web/JavaScript/Reference/Deprecated_and_obsolete_features#regexp), và bạn không nên dựa vào nó.

Regex literals không thể được chỉ định với một số literal characters không phải cú pháp nhất định. `/` không thể xuất hiện như một literal character trong một regex literal, vì `/` được sử dụng làm dấu phân giới của literal. Bạn cần thoát nó như `\/` nếu bạn muốn khớp một `/` literal. Các ký tự kết thúc dòng cũng không thể xuất hiện như các literal characters trong một regex literal, vì một literal không thể trải dài nhiều dòng. Bạn cần sử dụng [character escape](/en-US/docs/Web/JavaScript/Reference/Regular_expressions/Character_escape) như `\n` thay thế. Không có các hạn chế như vậy khi sử dụng constructor {{jsxref("RegExp/RegExp", "RegExp()")}}, mặc dù string literals có các quy tắc thoát riêng của chúng (ví dụ, `"\\"` thực tế biểu thị một ký tự dấu gạch chéo ngược đơn lẻ, vì vậy `new RegExp("\\*")` và `/\*/` tương đương).

Trong [Unicode-unaware mode](/en-US/docs/Web/JavaScript/Reference/Global_Objects/RegExp/unicode#unicode-aware_mode), pattern được diễn giải như một chuỗi các [UTF-16 code units](/en-US/docs/Web/JavaScript/Reference/Global_Objects/String#utf-16_characters_unicode_code_points_and_grapheme_clusters). Điều này có nghĩa là các surrogate pairs thực sự đại diện cho hai literal characters. Điều này gây ra các hành vi không mong đợi khi kết hợp với các tính năng khác:

```js
/^[😄]$/.test("😄"); // false, because the pattern is interpreted as /^[\ud83d\udc04]$/
/^😄+$/.test("😄😄"); // false, because the pattern is interpreted as /^\ud83d\udc04+$/
```

Trong Unicode-aware mode, pattern được diễn giải như một chuỗi các code points Unicode, và các surrogate pairs không bị tách ra. Do đó, bạn nên luôn ưu tiên sử dụng flag `u`.

## Ví dụ

### Sử dụng literal characters

Ví dụ sau được sao chép từ [Character escape](/en-US/docs/Web/JavaScript/Reference/Regular_expressions/Character_escape#using_character_escapes). Các ký tự `a` và `b` là literal characters trong pattern, và `\n` là một ký tự đã thoát vì nó không thể xuất hiện theo nghĩa đen trong một regex literal.

```js
const pattern = /a\nb/;
const string = `a
b`;
console.log(pattern.test(string)); // true
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- Hướng dẫn [Character classes](/en-US/docs/Web/JavaScript/Guide/Regular_expressions/Character_classes)
- [Regular expressions](/en-US/docs/Web/JavaScript/Reference/Regular_expressions)
- [Character escape: `\n`, `\u{...}`](/en-US/docs/Web/JavaScript/Reference/Regular_expressions/Character_escape)
