---
title: Groups and backreferences
slug: Web/JavaScript/Guide/Regular_expressions/Groups_and_backreferences
page-type: guide
sidebar: jssidebar
---

Nhóm gom nhiều mẫu lại như một tổng thể, và nhóm bắt giữ cung cấp thêm thông tin về kết quả con khi sử dụng mẫu biểu thức chính quy để khớp với một chuỗi. Backreference tham chiếu đến một nhóm đã bắt giữ trước đó trong cùng một biểu thức chính quy.

{{InteractiveExample("JavaScript Demo: RegExp Groups and backreferences")}}

```js interactive-example
// Groups
const imageDescription = "This image has a resolution of 1440×900 pixels.";
const regexpSize = /(\d+)×(\d+)/;
const match = imageDescription.match(regexpSize);
console.log(`Width: ${match[1]} / Height: ${match[2]}.`);
// Expected output: "Width: 1440 / Height: 900."

// Backreferences
const findDuplicates = "foo foo bar";
const regex = /\b(\w+)\s+\1\b/g;
console.log(findDuplicates.match(regex));
// Expected output: Array ["foo foo"]
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
      <td><code>(<em>x</em>)</code></td>
      <td>
        <p>
          <a href="/en-US/docs/Web/JavaScript/Reference/Regular_expressions/Capturing_group"><strong>Nhóm bắt giữ:</strong></a>
          Khớp với <code><em>x</em></code> và
          ghi nhớ kết quả khớp. Ví dụ, <code>/(foo)/</code> khớp và
          ghi nhớ "foo" trong "foo bar".
        </p>
        <p>
          Một biểu thức chính quy có thể có nhiều nhóm bắt giữ. Trong kết quả,
          các kết quả khớp với nhóm bắt giữ thường nằm trong một mảng có các thành phần theo
          cùng thứ tự như dấu ngoặc đơn trái trong nhóm bắt giữ. Đây thường
          chỉ là thứ tự của các nhóm bắt giữ. Điều này trở nên quan trọng khi các nhóm bắt giữ
          được lồng nhau. Các kết quả khớp được truy cập bằng chỉ mục của các phần tử trong kết quả (<code
            >[1], …, [n]</code
          >) hoặc từ các thuộc tính của đối tượng <code>RegExp</code> được định sẵn
          (<code>$1, …, $9</code>).
        </p>
        <p>
          Nhóm bắt giữ có một hình phạt về hiệu suất. Nếu bạn không cần
          chuỗi con được khớp để được ghi nhớ, hãy ưu tiên dấu ngoặc đơn không bắt giữ
          (xem bên dưới).
        </p>
        <p>
          <code
            ><a
              href="/en-US/docs/Web/JavaScript/Reference/Global_Objects/String/match"
              >String.prototype.match()</a
            ></code
          >
          sẽ không trả về các nhóm nếu cờ <code>/.../g</code> được đặt. Tuy nhiên,
          bạn vẫn có thể dùng
          <code
            ><a
              href="/en-US/docs/Web/JavaScript/Reference/Global_Objects/String/matchAll"
              >String.prototype.matchAll()</a
            ></code
          >
          để lấy tất cả kết quả khớp.
        </p>
      </td>
    </tr>
    <tr>
      <td><code>(?&#x3C;Name>x)</code></td>
      <td>
        <p>
          <a href="/en-US/docs/Web/JavaScript/Reference/Regular_expressions/Named_capturing_group"><strong>Nhóm bắt giữ có tên:</strong></a>
          Khớp với "x" và lưu trữ nó vào
          thuộc tính groups của kết quả khớp được trả về dưới tên được chỉ định
          bởi <code>&#x3C;Name></code>. Dấu ngoặc góc (<code>&#x3C;</code>
          và <code>></code>) là bắt buộc cho tên nhóm.
        </p>
        <p>
          Ví dụ, để trích xuất mã vùng Hoa Kỳ từ một số điện thoại,
          chúng ta có thể dùng <code>/\((?&#x3C;area>\d\d\d)\)/</code>. Kết quả
          số sẽ xuất hiện trong <code>matches.groups.area</code>.
        </p>
      </td>
    </tr>
    <tr>
      <td><code>(?:<em>x</em>)</code></td>
      <td>
        <p>
          <a href="/en-US/docs/Web/JavaScript/Reference/Regular_expressions/Non-capturing_group"><strong>Nhóm không bắt giữ:</strong></a>
          Khớp với "x" nhưng không ghi nhớ
          kết quả khớp. Chuỗi con được khớp không thể được truy xuất từ các phần tử của mảng kết quả (<code>[1], …, [n]</code>) hoặc từ các thuộc tính
          của đối tượng <code>RegExp</code> được định sẵn (<code>$1, …, $9</code>).
        </p>
      </td>
    </tr>
    <tr>
      <td><code>(?<em>flags</em>:<em>x</em>)</code>, <code>(?<em>flags</em>-<em>flags</em>:<em>x</em>)</code></td>
      <td>
        <p>
          <a href="/en-US/docs/Web/JavaScript/Reference/Regular_expressions/Modifier"><strong>Modifier:</strong></a>
          Bật hoặc tắt các cờ được chỉ định chỉ cho mẫu được bao gồm. Chỉ các cờ <code>i</code>, <code>m</code> và <code>s</code> có thể được dùng trong một modifier.
        </p>
      </td>
    </tr>
    <tr>
      <td>
        <code>\<em>n</em></code>
      </td>
      <td>
        <p>
          <a href="/en-US/docs/Web/JavaScript/Reference/Regular_expressions/Backreference"><strong>Backreference:</strong></a>
          Trong đó "n" là một số nguyên dương. Khớp với cùng chuỗi con được khớp bởi
          nhóm bắt giữ thứ n trong biểu thức chính quy
          (đếm dấu ngoặc đơn trái). Ví dụ,
          <code>/apple(,)\sorange\1/</code> khớp với "apple, orange," trong "apple,
          orange, cherry, peach".
        </p>
      </td>
    </tr>
    <tr>
      <td><code>\k&#x3C;Name></code></td>
      <td>
        <p>
          <a href="/en-US/docs/Web/JavaScript/Reference/Regular_expressions/Named_backreference"><strong>Backreference có tên:</strong></a>
          Một tham chiếu ngược đến chuỗi con cuối cùng khớp với
          <strong>nhóm bắt giữ có tên</strong> được chỉ định bởi
          <code>&#x3C;Name></code>.
        </p>
        <p>
          Ví dụ,
          <code>/(?&#x3C;title>\w+), yes \k&#x3C;title>/</code> khớp với "Sir,
          yes Sir" trong "Do you copy? Sir, yes Sir!".
        </p>
        <div class="notecard note">
          <p>
            <strong>Lưu ý:</strong> <code>\k</code> được dùng theo nghĩa đen ở đây để
            chỉ ra đầu của một tham chiếu ngược đến nhóm bắt giữ có tên.
          </p>
        </div>
      </td>
    </tr>
  </tbody>
</table>

## Ví dụ

### Sử dụng nhóm

Trong ví dụ này, chúng ta khớp hai từ ở định dạng có cấu trúc bằng cách sử dụng nhóm bắt giữ để ghi nhớ chúng. `\w+` khớp với một hoặc nhiều ký tự từ, và dấu ngoặc đơn `()` tạo ra một nhóm bắt giữ. Cờ `g` được dùng để khớp tất cả các lần xuất hiện.

```js
const personList = `First_Name: John, Last_Name: Doe
First_Name: Jane, Last_Name: Smith`;

const regexpNames = /First_Name: (\w+), Last_Name: (\w+)/g;
for (const match of personList.matchAll(regexpNames)) {
  console.log(`Hello ${match[1]} ${match[2]}`);
}
```

Xem thêm ví dụ trong tài liệu tham khảo [nhóm bắt giữ](/en-US/docs/Web/JavaScript/Reference/Regular_expressions/Capturing_group).

### Sử dụng nhóm có tên

Ví dụ này giống như ví dụ trên, nhưng chúng ta sử dụng nhóm bắt giữ có tên để ghi nhớ các từ được khớp. Bằng cách này, chúng ta có thể truy cập các từ được khớp theo ý nghĩa của chúng.

```js
const personList = `First_Name: John, Last_Name: Doe
First_Name: Jane, Last_Name: Smith`;

const regexpNames =
  /First_Name: (?<firstName>\w+), Last_Name: (?<lastName>\w+)/g;
for (const match of personList.matchAll(regexpNames)) {
  console.log(`Hello ${match.groups.firstName} ${match.groups.lastName}`);
}
```

Xem thêm ví dụ trong tài liệu tham khảo [nhóm bắt giữ có tên](/en-US/docs/Web/JavaScript/Reference/Regular_expressions/Named_capturing_group).

### Sử dụng nhóm và tham chiếu ngược

Trong ví dụ này, đầu tiên chúng ta khớp một ký tự dấu nháy đơn hoặc dấu nháy kép với `['"]`, ghi nhớ nó, khớp một số ký tự tùy ý với `.*?` (`*?` là một [quantifier non-greedy](/en-US/docs/Web/JavaScript/Guide/Regular_expressions/Quantifiers)), cho đến khi chúng ta khớp lại ký tự dấu nháy đã ghi nhớ với `\1`. `\1` là một backreference đến nhóm bắt giữ đầu tiên, khớp với cùng loại dấu nháy. Kết quả do đó sẽ là hai chuỗi: `"'"` và `'"'`.

```js
const quote = `Single quote "'" and double quote '"'`;
const regexpQuotes = /(['"]).*?\1/g;
for (const match of quote.matchAll(regexpQuotes)) {
  console.log(match[0]);
}
```

Xem thêm ví dụ trong tài liệu tham khảo [backreference](/en-US/docs/Web/JavaScript/Reference/Regular_expressions/Backreference).

### Sử dụng nhóm và chỉ mục kết quả khớp

Bằng cách cung cấp cờ `d`, các chỉ mục của từng nhóm bắt giữ sẽ được trả về. Điều này đặc biệt hữu ích nếu bạn đang liên kết từng nhóm được khớp với văn bản gốc — ví dụ, để cung cấp chẩn đoán trình biên dịch.

```js
const code = `function add(x, y) {
  return x + y;
}`;
const functionRegexp =
  /(function\s+)(?<name>[$_\p{ID_Start}][$\p{ID_Continue}]*)/du;
const match = functionRegexp.exec(code);
const lines = code.split("\n");
lines.splice(
  1,
  0,
  " ".repeat(match.indices[1][1] - match.indices[1][0]) +
    "^".repeat(match.indices.groups.name[1] - match.indices.groups.name[0]),
);
console.log(lines.join("\n"));
// function add(x, y) {
//          ^^^
//   return x + y;
// }
```

## Xem thêm

- Hướng dẫn [Biểu thức chính quy](/en-US/docs/Web/JavaScript/Guide/Regular_expressions)
- Hướng dẫn [Lớp ký tự](/en-US/docs/Web/JavaScript/Guide/Regular_expressions/Character_classes)
- Hướng dẫn [Assertions](/en-US/docs/Web/JavaScript/Guide/Regular_expressions/Assertions)
- Hướng dẫn [Quantifiers](/en-US/docs/Web/JavaScript/Guide/Regular_expressions/Quantifiers)
- [`RegExp`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/RegExp)
- Tài liệu tham khảo [Biểu thức chính quy](/en-US/docs/Web/JavaScript/Guide/Regular_expressions)
- [Backreference: `\1`, `\2`](/en-US/docs/Web/JavaScript/Reference/Regular_expressions/Backreference)
- [Nhóm bắt giữ: `(...)`](/en-US/docs/Web/JavaScript/Reference/Regular_expressions/Capturing_group)
- [Backreference có tên: `\k<name>`](/en-US/docs/Web/JavaScript/Reference/Regular_expressions/Named_backreference)
- [Nhóm bắt giữ có tên: `(?<name>...)`](/en-US/docs/Web/JavaScript/Reference/Regular_expressions/Named_capturing_group)
- [Nhóm không bắt giữ: `(?:...)`](/en-US/docs/Web/JavaScript/Reference/Regular_expressions/Non-capturing_group)
