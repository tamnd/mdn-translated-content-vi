---
title: Regular expressions
slug: Web/JavaScript/Guide/Regular_expressions
page-type: guide
sidebar: jssidebar
---

{{PreviousNext("Web/JavaScript/Guide/Representing_dates_times", "Web/JavaScript/Guide/Indexed_collections")}}

Regular expressions là các mẫu dùng để khớp các tổ hợp ký tự trong chuỗi.
Trong JavaScript, regular expressions cũng là các đối tượng. Các mẫu này được sử dụng với các phương thức {{jsxref("RegExp/exec", "exec()")}} và {{jsxref("RegExp/test", "test()")}} của {{jsxref("RegExp")}}, cũng như với các phương thức {{jsxref("String/match", "match()")}}, {{jsxref("String/matchAll", "matchAll()")}}, {{jsxref("String/replace", "replace()")}}, {{jsxref("String/replaceAll", "replaceAll()")}}, {{jsxref("String/search", "search()")}}, và {{jsxref("String/split", "split()")}} của {{jsxref("String")}}.
Chương này mô tả regular expressions trong JavaScript và cung cấp tổng quan ngắn gọn về từng phần tử cú pháp. Để biết giải thích chi tiết về ngữ nghĩa của từng phần, hãy đọc tài liệu tham khảo [regular expressions](/en-US/docs/Web/JavaScript/Reference/Regular_expressions).

## Tạo regular expression

Bạn có thể tạo một regular expression theo một trong hai cách:

- Sử dụng ký tự literal của regular expression, bao gồm một mẫu được đặt giữa hai dấu gạch chéo, như sau:

  ```js
  const re = /ab+c/;
  ```

  Regular expression literal cung cấp việc biên dịch regular expression khi script được nạp.
  Nếu regular expression không thay đổi, sử dụng cách này có thể cải thiện hiệu năng.

- Hoặc gọi hàm khởi tạo của đối tượng {{jsxref("RegExp")}}, như sau:

  ```js
  const re = new RegExp("ab+c");
  ```

  Sử dụng hàm khởi tạo cung cấp việc biên dịch regular expression lúc runtime.
  Dùng hàm khởi tạo khi bạn biết mẫu regular expression sẽ thay đổi, hoặc bạn không biết mẫu trước và lấy nó từ nguồn khác, chẳng hạn như đầu vào người dùng.

## Viết mẫu regular expression

Mẫu regular expression được cấu thành từ các ký tự đơn giản như `/abc/`, hoặc kết hợp các ký tự đơn giản và đặc biệt như `/ab*c/` hay `/Chapter (\d+)\.\d*/`.
Ví dụ cuối có dấu ngoặc đơn, được dùng như một thiết bị ghi nhớ.
Phần khớp được thực hiện với phần này của mẫu sẽ được ghi nhớ để sử dụng sau, như được mô tả trong [Sử dụng groups](/en-US/docs/Web/JavaScript/Guide/Regular_expressions/Groups_and_backreferences#using_groups).

### Sử dụng các mẫu đơn giản

Các mẫu đơn giản được tạo từ các ký tự mà bạn muốn khớp trực tiếp. Ví dụ, mẫu `/abc/` chỉ khớp khi chuỗi ký tự `"abc"` xuất hiện chính xác (tất cả ký tự liên tiếp và theo thứ tự đó).
Phép khớp như vậy sẽ thành công trong chuỗi `"Hi, do you know your abc's?"` và `"The latest airplane designs evolved from slabcraft."`.
Trong cả hai trường hợp, phép khớp là với chuỗi con `"abc"`.
Không có phép khớp trong chuỗi `"Grab crab"` vì dù nó chứa chuỗi con `"ab c"`, nó không chứa đúng chuỗi con `"abc"`.

### Sử dụng các ký tự đặc biệt

Khi tìm kiếm khớp cần nhiều hơn một phép khớp trực tiếp, chẳng hạn tìm một hoặc nhiều ký tự b, hoặc tìm khoảng trắng, bạn có thể đưa các ký tự đặc biệt vào mẫu.
Ví dụ, để khớp _một `"a"` đơn theo sau bởi không hoặc nhiều `"b"` rồi đến `"c"`_, bạn dùng mẫu `/ab*c/`: dấu `*` sau `"b"` có nghĩa là "0 hoặc nhiều lần xuất hiện của mục trước."
Trong chuỗi `"cbbabbbbcdebc"`, mẫu này sẽ khớp với chuỗi con `"abbbbc"`.

Các trang sau cung cấp danh sách các ký tự đặc biệt khác nhau thuộc từng danh mục, kèm mô tả và ví dụ.

- Hướng dẫn [Assertions](/en-US/docs/Web/JavaScript/Guide/Regular_expressions/Assertions)
  - : Assertions bao gồm các ranh giới, chỉ ra điểm bắt đầu và kết thúc của dòng và từ, cũng như các mẫu khác cho thấy một phép khớp có thể xảy ra (bao gồm look-ahead, look-behind và biểu thức điều kiện).
- Hướng dẫn [Character classes](/en-US/docs/Web/JavaScript/Guide/Regular_expressions/Character_classes)
  - : Phân biệt các loại ký tự khác nhau. Ví dụ, phân biệt giữa chữ cái và chữ số.
- Hướng dẫn [Groups and backreferences](/en-US/docs/Web/JavaScript/Guide/Regular_expressions/Groups_and_backreferences)
  - : Groups nhóm nhiều mẫu thành một khối, và capturing groups cung cấp thông tin submatch thêm khi sử dụng mẫu regular expression để khớp với chuỗi. Backreferences tham chiếu đến một capturing group đã được xác định trước đó trong cùng regular expression.
- Hướng dẫn [Quantifiers](/en-US/docs/Web/JavaScript/Guide/Regular_expressions/Quantifiers)
  - : Chỉ định số lượng ký tự hoặc biểu thức cần khớp.

Nếu bạn muốn xem tất cả các ký tự đặc biệt có thể dùng trong regular expressions trong một bảng duy nhất, hãy xem bên dưới:

<table class="standard-table">
  <caption>
    Các ký tự đặc biệt trong regular expressions.
  </caption>
  <thead>
    <tr>
      <th scope="col">Ký tự / cấu trúc</th>
      <th scope="col">Bài viết tương ứng</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td>
        <code>[xyz]</code>, <code>[^xyz]</code>, <code>.</code>,
        <code>\d</code>, <code>\D</code>, <code>\w</code>, <code>\W</code>,
        <code>\s</code>, <code>\S</code>, <code>\t</code>, <code>\r</code>,
        <code>\n</code>, <code>\v</code>, <code>\f</code>, <code>[\b]</code>,
        <code>\0</code>, <code>\c<em>X</em></code>, <code>\x<em>HH</em></code>,
        <code>\u<em>HHHH</em></code>, <code>\u<em>{H…H}</em></code>,
        <code><em>x</em>|<em>y</em></code>
      </td>
      <td>
        <p>
          <a
            href="/en-US/docs/Web/JavaScript/Guide/Regular_expressions/Character_classes"
            >Character classes</a
          >
        </p>
      </td>
    </tr>
    <tr>
      <td>
        <code>^</code>, <code>$</code>, <code>\b</code>, <code>\B</code>,
        <code>x(?=y)</code>, <code>x(?!y)</code>, <code>(?&#x3C;=y)x</code>,
        <code>(?&#x3C;!y)x</code>
      </td>
      <td>
        <p>
          <a
            href="/en-US/docs/Web/JavaScript/Guide/Regular_expressions/Assertions"
            >Assertions</a
          >
        </p>
      </td>
    </tr>
    <tr>
      <td>
        <code>(<em>x</em>)</code>, <code>(?&#x3C;Name>x)</code>, <code>(?:<em>x</em>)</code>,
        <code>\<em>n</em></code>, <code>\k&#x3C;Name></code>
      </td>
      <td>
        <p>
          <a
            href="/en-US/docs/Web/JavaScript/Guide/Regular_expressions/Groups_and_backreferences"
            >Groups and backreferences</a
          >
        </p>
      </td>
    </tr>
    <tr>
      <td>
        <code><em>x</em>*</code>, <code><em>x</em>+</code>, <code><em>x</em>?</code>,
        <code><em>x</em>{<em>n</em>}</code>, <code><em>x</em>{<em>n</em>,}</code>,
        <code><em>x</em>{<em>n</em>,<em>m</em>}</code>
      </td>
      <td>
        <p>
          <a
            href="/en-US/docs/Web/JavaScript/Guide/Regular_expressions/Quantifiers"
            >Quantifiers</a
          >
        </p>
      </td>
    </tr>
  </tbody>
</table>

> [!NOTE]
> [Một bảng cheat sheet lớn hơn cũng có sẵn](/en-US/docs/Web/JavaScript/Guide/Regular_expressions/Cheatsheet) (chỉ tổng hợp các phần từ những bài viết riêng lẻ đó).

### Escape ký tự

Nếu bạn cần sử dụng bất kỳ ký tự đặc biệt nào theo nghĩa đen (thực sự tìm kiếm một `"*"`, chẳng hạn), bạn nên escape nó bằng cách đặt dấu gạch chéo ngược trước nó. Ví dụ, để tìm kiếm `"a"` theo sau là `"*"` rồi `"b"`, bạn dùng `/a\*b/` — dấu gạch chéo ngược "escape" dấu `"*"`, khiến nó trở thành ký tự literal thay vì ký tự đặc biệt.

> [!NOTE]
> Trong nhiều trường hợp, khi cố gắng khớp một ký tự đặc biệt, bạn có thể bọc nó trong một [character class](/en-US/docs/Web/JavaScript/Guide/Regular_expressions/Character_classes) như một cách thay thế cho escape, ví dụ `/a[*]b/`.

Tương tự, nếu bạn đang viết regular expression literal và cần khớp dấu gạch chéo ("/"), bạn cần escape nó (nếu không, nó sẽ kết thúc mẫu).
Ví dụ, để tìm kiếm chuỗi "/example/" theo sau bởi một hoặc nhiều ký tự chữ cái, bạn dùng `/\/example\/[a-z]+/i` — các dấu gạch chéo ngược trước mỗi dấu gạch chéo khiến chúng trở thành literal.

Để khớp một dấu gạch chéo ngược literal, bạn cần escape dấu gạch chéo ngược.
Ví dụ, để khớp chuỗi "C:\\" trong đó "C" có thể là bất kỳ chữ cái nào, bạn dùng `/[A-Z]:\\/` — dấu gạch chéo ngược đầu tiên escape dấu gạch chéo ngược sau nó, nên biểu thức tìm kiếm một dấu gạch chéo ngược literal duy nhất.

Nếu sử dụng constructor `RegExp` với string literal, hãy nhớ rằng dấu gạch chéo ngược là ký tự escape trong string literal, nên để sử dụng nó trong regular expression, bạn cần escape nó ở cấp độ string literal.
`/a\*b/` và `new RegExp("a\\*b")` tạo ra cùng một biểu thức, tìm kiếm "a" theo sau là literal "\*" rồi "b".

Hàm {{jsxref("RegExp.escape()")}} trả về một chuỗi mới trong đó tất cả các ký tự đặc biệt trong cú pháp regex đều được escape. Điều này cho phép bạn dùng `new RegExp(RegExp.escape("a*b"))` để tạo một regular expression chỉ khớp với chuỗi `"a*b"`.

### Sử dụng dấu ngoặc đơn

Dấu ngoặc đơn xung quanh bất kỳ phần nào của mẫu regular expression sẽ khiến phần đó của chuỗi con khớp được ghi nhớ.
Khi đã được ghi nhớ, chuỗi con có thể được gọi lại để sử dụng sau. Xem [Groups and backreferences](/en-US/docs/Web/JavaScript/Guide/Regular_expressions/Groups_and_backreferences#using_groups) để biết thêm chi tiết.

## Sử dụng regular expressions trong JavaScript

Regular expressions được sử dụng với các phương thức {{jsxref("RegExp")}} là {{jsxref("RegExp/test", "test()")}} và {{jsxref("RegExp/exec", "exec()")}} và với các phương thức {{jsxref("String")}} là {{jsxref("String/match", "match()")}}, {{jsxref("String/matchAll", "matchAll()")}}, {{jsxref("String/replace", "replace()")}}, {{jsxref("String/replaceAll", "replaceAll()")}}, {{jsxref("String/search", "search()")}}, và {{jsxref("String/split", "split()")}}.

| Phương thức                                     | Mô tả                                                                                                           |
| ----------------------------------------------- | --------------------------------------------------------------------------------------------------------------- |
| {{jsxref("RegExp/exec", "exec()")}}             | Thực thi tìm kiếm một phép khớp trong chuỗi. Trả về một mảng thông tin hoặc `null` nếu không khớp.              |
| {{jsxref("RegExp/test", "test()")}}             | Kiểm tra khớp trong chuỗi. Trả về `true` hoặc `false`.                                                          |
| {{jsxref("String/match", "match()")}}           | Trả về một mảng chứa tất cả các phép khớp, bao gồm cả capturing groups, hoặc `null` nếu không tìm thấy khớp.    |
| {{jsxref("String/matchAll", "matchAll()")}}     | Trả về một iterator chứa tất cả các phép khớp, bao gồm cả capturing groups.                                     |
| {{jsxref("String/search", "search()")}}         | Kiểm tra khớp trong chuỗi. Trả về chỉ số của phép khớp, hoặc `-1` nếu tìm kiếm thất bại.                        |
| {{jsxref("String/replace", "replace()")}}       | Thực thi tìm kiếm khớp trong chuỗi, và thay thế chuỗi con khớp bằng một chuỗi con thay thế.                     |
| {{jsxref("String/replaceAll", "replaceAll()")}} | Thực thi tìm kiếm tất cả các phép khớp trong chuỗi, và thay thế các chuỗi con khớp bằng một chuỗi con thay thế. |
| {{jsxref("String/split", "split()")}}           | Sử dụng regular expression hoặc chuỗi cố định để tách chuỗi thành một mảng các chuỗi con.                       |

Khi bạn muốn biết liệu một mẫu có được tìm thấy trong chuỗi hay không, hãy dùng phương thức `test()` hoặc `search()`; để có thêm thông tin (nhưng thực thi chậm hơn) hãy dùng phương thức `exec()` hoặc `match()`.
Nếu bạn dùng `exec()` hoặc `match()` và nếu phép khớp thành công, các phương thức này trả về một mảng và cập nhật các thuộc tính của đối tượng regular expression liên quan cũng như của đối tượng regular expression được định nghĩa sẵn, `RegExp`.
Nếu phép khớp thất bại, phương thức `exec()` trả về `null` (sẽ ép kiểu thành `false`).

Trong ví dụ sau, script sử dụng phương thức `exec()` để tìm một phép khớp trong chuỗi.

```js
const myRe = /d(b+)d/g;
const myArray = myRe.exec("cdbbdbsbz");
```

Nếu bạn không cần truy cập các thuộc tính của regular expression, một cách thay thế để tạo `myArray` là với script này:

```js
const myArray = /d(b+)d/g.exec("cdbbdbsbz");
// similar to 'cdbbdbsbz'.match(/d(b+)d/g); however,
// 'cdbbdbsbz'.match(/d(b+)d/g) outputs [ "dbbd" ]
// while /d(b+)d/g.exec('cdbbdbsbz') outputs [ 'dbbd', 'bb', index: 1, input: 'cdbbdbsbz' ]
```

(Xem [Sử dụng cờ global search với `exec()`](#using_the_global_search_flag_with_exec) để biết thêm thông tin về các hành vi khác nhau.)

Nếu bạn muốn tạo regular expression từ một chuỗi, một cách thay thế khác là script này:

```js
const myRe = new RegExp("d(b+)d", "g");
const myArray = myRe.exec("cdbbdbsbz");
```

Với những script này, phép khớp thành công và trả về mảng, cập nhật các thuộc tính được hiển thị trong bảng sau.

<table class="standard-table">
  <caption>
    Kết quả của việc thực thi regular expression.
  </caption>
  <thead>
    <tr>
      <th scope="col">Đối tượng</th>
      <th scope="col">Thuộc tính hoặc chỉ số</th>
      <th scope="col">Mô tả</th>
      <th scope="col">Trong ví dụ này</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td rowspan="4"><code>myArray</code></td>
      <td></td>
      <td>Chuỗi khớp và tất cả các chuỗi con được ghi nhớ.</td>
      <td><code>['dbbd', 'bb', index: 1, input: 'cdbbdbsbz']</code></td>
    </tr>
    <tr>
      <td><code>index</code></td>
      <td>Chỉ số bắt đầu từ 0 của phép khớp trong chuỗi đầu vào.</td>
      <td><code>1</code></td>
    </tr>
    <tr>
      <td><code>input</code></td>
      <td>Chuỗi gốc.</td>
      <td><code>'cdbbdbsbz'</code></td>
    </tr>
    <tr>
      <td><code>[0]</code></td>
      <td>Các ký tự được khớp cuối cùng.</td>
      <td><code>'dbbd'</code></td>
    </tr>
    <tr>
      <td rowspan="2"><code>myRe</code></td>
      <td><code>lastIndex</code></td>
      <td>Chỉ số bắt đầu phép khớp tiếp theo.
        (Thuộc tính này chỉ được thiết lập nếu regular expression sử dụng tùy chọn g, được mô tả trong
        <a href="#advanced_searching_with_flags">Tìm kiếm nâng cao với cờ</a>.)
      </td>
      <td><code>5</code></td>
    </tr>
    <tr>
      <td><code>source</code></td>
      <td>
        Văn bản của mẫu. Được cập nhật tại thời điểm regular expression được tạo, không phải khi thực thi.
      </td>
      <td><code>'d(b+)d'</code></td>
    </tr>
  </tbody>
</table>

Như được hiển thị trong dạng thứ hai của ví dụ này, bạn có thể sử dụng regular expression được tạo bằng object initializer mà không cần gán nó cho biến.
Tuy nhiên, nếu bạn làm vậy, mỗi lần xuất hiện là một regular expression mới.
Vì lý do này, nếu bạn dùng dạng này mà không gán vào biến, bạn sẽ không thể truy cập các thuộc tính của regular expression đó sau này.
Ví dụ, giả sử bạn có script này:

```js
const myRe = /d(b+)d/g;
const myArray = myRe.exec("cdbbdbsbz");
console.log(`The value of lastIndex is ${myRe.lastIndex}`);

// "The value of lastIndex is 5"
```

Tuy nhiên, nếu bạn có script này:

```js
const myArray = /d(b+)d/g.exec("cdbbdbsbz");
console.log(`The value of lastIndex is ${/d(b+)d/g.lastIndex}`);

// "The value of lastIndex is 0"
```

Các lần xuất hiện của `/d(b+)d/g` trong hai câu lệnh là các đối tượng regular expression khác nhau và do đó có giá trị khác nhau cho thuộc tính `lastIndex`.
Nếu bạn cần truy cập các thuộc tính của regular expression được tạo bằng object initializer, hãy gán nó vào biến trước.

### Tìm kiếm nâng cao với cờ

Regular expressions có các cờ tùy chọn cho phép các chức năng như tìm kiếm toàn cục và tìm kiếm không phân biệt chữ hoa chữ thường.
Các cờ này có thể được sử dụng riêng lẻ hoặc kết hợp theo bất kỳ thứ tự nào, và được đưa vào như một phần của regular expression.

| Cờ | Mô tả | Thuộc tính tương ứng |
| — | ---------------------------------------------------------------------------------------------- | ----------------------------------------------- |
| `d` | Tạo chỉ số cho các phép khớp chuỗi con. | {{jsxref("RegExp/hasIndices", "hasIndices")}} |
| `g` | Tìm kiếm toàn cục. | {{jsxref("RegExp/global", "global")}} |
| `i` | Tìm kiếm không phân biệt chữ hoa chữ thường. | {{jsxref("RegExp/ignoreCase", "ignoreCase")}} |
| `m` | Làm cho `^` và `$` khớp với đầu và cuối mỗi dòng thay vì toàn bộ chuỗi. | {{jsxref("RegExp/multiline", "multiline")}} |
| `s` | Cho phép `.` khớp với ký tự xuống dòng. | {{jsxref("RegExp/dotAll", "dotAll")}} |
| `u` | "Unicode"; xử lý mẫu như một chuỗi các code point Unicode. | {{jsxref("RegExp/unicode", "unicode")}} |
| `v` | Nâng cấp chế độ `u` với thêm tính năng Unicode. | {{jsxref("RegExp/unicodeSets", "unicodeSets")}} |
| `y` | Thực hiện tìm kiếm "sticky" khớp bắt đầu từ vị trí hiện tại trong chuỗi đích. | {{jsxref("RegExp/sticky", "sticky")}} |

Để đưa cờ vào regular expression, dùng cú pháp này:

```js
const re = /pattern/flags;
```

hoặc

```js
const re = new RegExp("pattern", "flags");
```

Lưu ý rằng các cờ là phần không thể tách rời của regular expression. Chúng không thể được thêm vào hoặc xóa đi sau này.

Ví dụ, `re = /\w+\s/g` tạo ra một regular expression tìm kiếm một hoặc nhiều ký tự theo sau là khoảng trắng, và tìm kiếm tổ hợp này trong toàn bộ chuỗi.

```js
const re = /\w+\s/g;
const str = "fee fi fo fum";
const myArray = str.match(re);
console.log(myArray);

// ["fee ", "fi ", "fo "]
```

Bạn có thể thay dòng:

```js
const re = /\w+\s/g;
```

bằng:

```js
const re = new RegExp("\\w+\\s", "g");
```

và nhận được cùng kết quả.

Cờ `m` được dùng để chỉ định rằng chuỗi đầu vào nhiều dòng nên được xử lý như nhiều dòng.
Nếu cờ `m` được sử dụng, `^` và `$` khớp ở đầu hoặc cuối bất kỳ dòng nào trong chuỗi đầu vào thay vì đầu hoặc cuối của toàn bộ chuỗi.

Các cờ `i`, `m`, và `s` có thể được bật hoặc tắt cho các phần cụ thể của regex bằng cú pháp [modifier](/en-US/docs/Web/JavaScript/Reference/Regular_expressions/Modifier).

#### Sử dụng cờ global search với exec()

Phương thức {{jsxref("RegExp.prototype.exec()")}} với cờ `g` trả về từng phép khớp và vị trí của nó một cách lặp đi lặp lại.

```js
const str = "fee fi fo fum";
const re = /\w+\s/g;

console.log(re.exec(str)); // ["fee ", index: 0, input: "fee fi fo fum"]
console.log(re.exec(str)); // ["fi ", index: 4, input: "fee fi fo fum"]
console.log(re.exec(str)); // ["fo ", index: 7, input: "fee fi fo fum"]
console.log(re.exec(str)); // null
```

Ngược lại, phương thức {{jsxref("String.prototype.match()")}} trả về tất cả các phép khớp cùng một lúc, nhưng không có vị trí của chúng.

```js
console.log(str.match(re)); // ["fee ", "fi ", "fo "]
```

#### Sử dụng regular expressions Unicode

Cờ `u` được dùng để tạo các regular expression "unicode"; nghĩa là, các regular expression hỗ trợ khớp với văn bản unicode. Một tính năng quan trọng được bật trong chế độ unicode là [Unicode property escapes](/en-US/docs/Web/JavaScript/Reference/Regular_expressions/Unicode_character_class_escape). Ví dụ, regular expression sau có thể được dùng để khớp với một "từ" unicode tùy ý:

```js
/\p{L}*/u;
```

Regular expressions Unicode cũng có hành vi thực thi khác. [`RegExp.prototype.unicode`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/RegExp/unicode) có thêm giải thích về vấn đề này.

## Ví dụ

> [!NOTE]
> Một số ví dụ cũng có sẵn trong:
>
> - Các trang tham khảo cho {{jsxref("RegExp/exec", "exec()")}}, {{jsxref("RegExp/test", "test()")}}, {{jsxref("String/match", "match()")}}, {{jsxref("String/matchAll", "matchAll()")}}, {{jsxref("String/search", "search()")}}, {{jsxref("String/replace", "replace()")}}, {{jsxref("String/split", "split()")}}
> - Các bài hướng dẫn: [character classes](/en-US/docs/Web/JavaScript/Guide/Regular_expressions/Character_classes), [assertions](/en-US/docs/Web/JavaScript/Guide/Regular_expressions/Assertions), [groups and backreferences](/en-US/docs/Web/JavaScript/Guide/Regular_expressions/Groups_and_backreferences), [quantifiers](/en-US/docs/Web/JavaScript/Guide/Regular_expressions/Quantifiers)

### Sử dụng ký tự đặc biệt để xác minh đầu vào

Trong ví dụ sau, người dùng được yêu cầu nhập số điện thoại.
Khi người dùng nhấn nút "Check", script kiểm tra tính hợp lệ của số.
Nếu số hợp lệ (khớp với chuỗi ký tự được chỉ định bởi regular expression), script hiển thị thông báo cảm ơn người dùng và xác nhận số.
Nếu số không hợp lệ, script thông báo cho người dùng rằng số điện thoại không hợp lệ.

Regular expression tìm kiếm:

1. đầu dòng dữ liệu: `^`
2. theo sau bởi ba ký tự số `\d{3}` HOẶC `|` dấu ngoặc đơn trái `\(`, theo sau bởi ba chữ số `\d{3}`, theo sau bởi dấu ngoặc đơn phải `\)`, trong một non-capturing group `(?:)`
3. theo sau bởi một dấu gạch ngang, dấu gạch chéo, hoặc dấu chấm thập phân trong một capturing group `()`
4. theo sau bởi ba chữ số `\d{3}`
5. theo sau bởi phần khớp được ghi nhớ trong (first) captured group `\1`
6. theo sau bởi bốn chữ số `\d{4}`
7. theo sau bởi cuối dòng dữ liệu: `$`

#### HTML

```html
<p>
  Enter your phone number (with area code) and then click "Check".
  <br />
  The expected format is like ###-###-####.
</p>
<form id="form">
  <input id="phone" />
  <button type="submit">Check</button>
</form>
<p id="output"></p>
```

#### JavaScript

```js
const form = document.querySelector("#form");
const input = document.querySelector("#phone");
const output = document.querySelector("#output");

const re = /^(?:\d{3}|\(\d{3}\))([-/.])\d{3}\1\d{4}$/;

function testInfo(phoneInput) {
  const ok = re.exec(phoneInput.value);

  output.textContent = ok
    ? `Thanks, your phone number is ${ok[0]}`
    : `${phoneInput.value} isn't a phone number with area code!`;
}

form.addEventListener("submit", (event) => {
  event.preventDefault();
  testInfo(input);
});
```

#### Kết quả

{{EmbedLiveSample("Using_special_characters_to_verify_input")}}

## Công cụ

- [RegExr](https://regexr.com/)
  - : Công cụ trực tuyến để học, xây dựng và kiểm tra Regular Expressions.
- [Regex tester](https://regex101.com/)
  - : Trình xây dựng/gỡ lỗi regex trực tuyến.
- [Regex interactive tutorial](https://regexlearn.com/)
  - : Hướng dẫn tương tác trực tuyến, Cheat sheet và Playground.
- [Regex visualizer](https://extendsclass.com/regex-tester.html)
  - : Trình kiểm tra regex trực quan trực tuyến.

{{PreviousNext("Web/JavaScript/Guide/Representing_dates_times", "Web/JavaScript/Guide/Indexed_collections")}}
