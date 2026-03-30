---
title: Các phương thức chuỗi hữu ích
short-title: Phương thức chuỗi
slug: Learn_web_development/Core/Scripting/Useful_string_methods
page-type: learn-module-chapter
sidebar: learnsidebar
---

{{PreviousMenuNext("Learn_web_development/Core/Scripting/Strings", "Learn_web_development/Core/Scripting/Test_your_skills/Strings", "Learn_web_development/Core/Scripting")}}

Bây giờ chúng ta đã xem xét những điều cơ bản nhất về chuỗi, hãy nâng cao hơn và bắt đầu nghĩ về những thao tác hữu ích mà chúng ta có thể thực hiện trên chuỗi với các phương thức tích hợp, chẳng hạn như tìm độ dài của một chuỗi văn bản, nối và tách chuỗi, thay thế một ký tự trong chuỗi bằng ký tự khác, và nhiều hơn nữa.

<table>
  <tbody>
    <tr>
      <th scope="row">Điều kiện tiên quyết:</th>
      <td>Hiểu biết về <a href="/en-US/docs/Learn_web_development/Core/Structuring_content">HTML</a> và <a href="/en-US/docs/Learn_web_development/Core/Styling_basics">các nguyên tắc cơ bản của CSS</a>. Kiến thức về <a href="/en-US/docs/Learn_web_development/Core/Scripting/Strings">cơ bản về chuỗi</a>.</td>
    </tr>
    <tr>
      <th scope="row">Kết quả học tập:</th>
      <td>
          Thao tác chuỗi bằng cách sử dụng các thuộc tính và phương thức phổ biến được tích hợp trong JavaScript.
      </td>
    </tr>
  </tbody>
</table>

## Chuỗi như đối tượng

Hầu hết các giá trị có thể được sử dụng như thể chúng là đối tượng trong JavaScript. Khi bạn tạo một chuỗi, ví dụ bằng cách sử dụng

```js
const string = "This is my string";
```

mặc dù bản thân biến không phải là đối tượng, nó vẫn có một số lượng lớn các thuộc tính và phương thức có sẵn trên nó, nhờ có thể sử dụng như một đối tượng khi truy cập thuộc tính. Bạn có thể thấy điều này nếu bạn truy cập trang đối tượng {{jsxref("String")}} và nhìn xuống danh sách ở phía bên của trang!

**Bây giờ, trước khi não bạn bắt đầu tan chảy, đừng lo lắng!** Bạn thực sự không cần biết về hầu hết những điều này sớm trong hành trình học tập của bạn. Nhưng có một vài điều mà bạn có thể sử dụng khá thường xuyên mà chúng ta sẽ xem xét ở đây.

Hãy nhập một số ví dụ vào [bảng điều khiển (console) nhà phát triển trình duyệt](/en-US/docs/Learn_web_development/Howto/Tools_and_setup/What_are_browser_developer_tools).

## Tìm độ dài của chuỗi

Đây là điều dễ dàng — bạn sử dụng thuộc tính {{jsxref("String.prototype.length", "length")}}. Hãy thử nhập các dòng sau:

```js
const browserType = "mozilla";
browserType.length;
```

Điều này sẽ trả về số 7, vì "mozilla" có 7 ký tự. Điều này hữu ích vì nhiều lý do; ví dụ, bạn có thể muốn tìm độ dài của một loạt tên để bạn có thể hiển thị chúng theo thứ tự độ dài, hoặc cho phép người dùng biết rằng tên người dùng họ đã nhập vào trường biểu mẫu quá dài nếu nó vượt quá một độ dài nhất định.

## Truy xuất một ký tự chuỗi cụ thể

Liên quan đến điều đó, bạn có thể trả về bất kỳ ký tự nào bên trong một chuỗi bằng cách sử dụng **ký hiệu dấu ngoặc vuông** — điều này có nghĩa là bạn bao gồm dấu ngoặc vuông (`[]`) ở cuối tên biến của mình. Bên trong dấu ngoặc vuông, bạn bao gồm số của ký tự bạn muốn trả về, vì vậy ví dụ để truy xuất chữ cái đầu tiên bạn sẽ làm điều này:

```js
browserType[0];
```

Hãy nhớ: máy tính đếm từ 0, không phải 1!

Để truy xuất ký tự cuối cùng của _bất kỳ_ chuỗi nào, chúng ta có thể sử dụng dòng sau, kết hợp kỹ thuật này với thuộc tính `length` mà chúng ta đã xem ở trên:

```js
browserType[browserType.length - 1];
```

Độ dài của chuỗi "mozilla" là 7, nhưng vì đếm bắt đầu từ 0, vị trí ký tự cuối cùng là 6; sử dụng `length-1` sẽ cho chúng ta ký tự cuối cùng.

## Kiểm tra xem chuỗi có chứa chuỗi con không

Đôi khi bạn sẽ muốn tìm xem một chuỗi nhỏ hơn có hiện diện bên trong một chuỗi lớn hơn không (chúng ta thường nói _nếu một chuỗi con hiện diện bên trong một chuỗi_). Điều này có thể được thực hiện bằng phương thức {{jsxref("String.prototype.includes()", "includes()")}}, lấy một {{glossary("parameter")}} duy nhất — chuỗi con bạn muốn tìm kiếm.

Nó trả về `true` nếu chuỗi chứa chuỗi con, và `false` nếu không.

```js
const browserType = "mozilla";

if (browserType.includes("zilla")) {
  console.log("Found zilla!");
} else {
  console.log("No zilla here!");
}
```

Thường bạn sẽ muốn biết nếu một chuỗi bắt đầu hoặc kết thúc bằng một chuỗi con cụ thể. Đây là một nhu cầu đủ phổ biến nên có hai phương thức đặc biệt cho điều này: {{jsxref("String.prototype.startsWith()", "startsWith()")}} và {{jsxref("String.prototype.endsWith()", "endsWith()")}}:

```js
const browserType = "mozilla";

if (browserType.startsWith("zilla")) {
  console.log("It starts with zilla!");
} else {
  console.log("It DOESN'T start with zilla!");
}
```

```js
const browserType = "mozilla";

if (browserType.endsWith("zilla")) {
  console.log("It ends with zilla!");
} else {
  console.log("It DOESN'T end with zilla!");
}
```

## Tìm vị trí của chuỗi con trong chuỗi

Bạn có thể tìm vị trí của một chuỗi con bên trong một chuỗi lớn hơn bằng phương thức {{jsxref("String.prototype.indexOf()", "indexOf()")}}. Phương thức này lấy hai {{glossary("parameter", "tham số")}} — chuỗi con bạn muốn tìm kiếm, và một tham số tùy chọn chỉ định điểm bắt đầu của tìm kiếm.

Nếu chuỗi chứa chuỗi con, `indexOf()` trả về chỉ số của lần xuất hiện đầu tiên của chuỗi con. Nếu chuỗi không chứa chuỗi con, `indexOf()` trả về `-1`.

```js
const tagline = "MDN - Resources for developers, by developers";
console.log(tagline.indexOf("developers")); // 20
```

Bắt đầu từ `0`, nếu bạn đếm số ký tự (bao gồm khoảng trắng) từ đầu chuỗi, lần xuất hiện đầu tiên của chuỗi con `"developers"` ở chỉ số `20`.

```js
console.log(tagline.indexOf("x")); // -1
```

Mặt khác, điều này trả về `-1` vì ký tự `x` không có trong chuỗi.

Vậy bây giờ bạn biết cách tìm lần xuất hiện đầu tiên của một chuỗi con, làm thế nào để tìm các lần xuất hiện tiếp theo? Bạn có thể làm điều đó bằng cách truyền một giá trị lớn hơn chỉ số của lần xuất hiện trước như tham số thứ hai của phương thức.

```js
const firstOccurrence = tagline.indexOf("developers");
const secondOccurrence = tagline.indexOf("developers", firstOccurrence + 1);

console.log(firstOccurrence); // 20
console.log(secondOccurrence); // 35
```

Ở đây, chúng ta đang yêu cầu phương thức tìm kiếm chuỗi con `"developers"` bắt đầu từ chỉ số `21` (`firstOccurrence + 1`), và nó trả về chỉ số `35`.

## Trích xuất chuỗi con từ chuỗi

Bạn có thể trích xuất một chuỗi con từ một chuỗi bằng phương thức {{jsxref("String.prototype.slice()", "slice()")}}. Bạn truyền cho nó:

- chỉ số bắt đầu trích xuất
- chỉ số dừng trích xuất. Điều này là độc quyền, có nghĩa là ký tự ở chỉ số này không được bao gồm trong chuỗi con được trích xuất.

Ví dụ:

```js
const browserType = "mozilla";
console.log(browserType.slice(1, 4)); // "ozi"
```

Ký tự ở chỉ số `1` là `"o"`, và ký tự ở chỉ số 4 là `"l"`. Vì vậy, chúng ta trích xuất tất cả các ký tự bắt đầu từ `"o"` và kết thúc ngay trước `"l"`, cho chúng ta `"ozi"`.

Nếu bạn biết rằng bạn muốn trích xuất tất cả các ký tự còn lại trong chuỗi sau một ký tự nhất định, bạn không phải bao gồm tham số thứ hai. Thay vào đó, bạn chỉ cần bao gồm vị trí ký tự từ nơi bạn muốn trích xuất các ký tự còn lại trong chuỗi. Hãy thử đoạn sau:

```js
browserType.slice(2); // "zilla"
```

Điều này trả về `"zilla"` — điều này là vì vị trí ký tự của 2 là chữ `"z"`, và vì bạn không bao gồm tham số thứ hai, chuỗi con được trả về là tất cả các ký tự còn lại trong chuỗi.

> [!NOTE]
> `slice()` cũng có các tùy chọn khác; hãy nghiên cứu trang {{jsxref("String.prototype.slice()", "slice()")}} để xem những gì khác bạn có thể tìm hiểu.

## Thay đổi chữ hoa/thường

Các phương thức chuỗi {{jsxref("String.prototype.toLowerCase()", "toLowerCase()")}} và {{jsxref("String.prototype.toUpperCase()", "toUpperCase()")}} lấy một chuỗi và chuyển đổi tất cả các ký tự thành chữ thường hoặc chữ hoa, tương ứng. Điều này có thể hữu ích ví dụ nếu bạn muốn chuẩn hóa tất cả dữ liệu do người dùng nhập trước khi lưu vào cơ sở dữ liệu.

Hãy thử nhập các dòng sau để xem điều gì xảy ra:

```js
const radData = "My NaMe Is MuD";
console.log(radData.toLowerCase());
console.log(radData.toUpperCase());
```

## Cập nhật các phần của chuỗi

Bạn có thể thay thế một chuỗi con bên trong một chuỗi bằng một chuỗi con khác bằng phương thức {{jsxref("String.prototype.replace()", "replace()")}}.

Trong ví dụ này, chúng ta cung cấp hai tham số — chuỗi chúng ta muốn thay thế và chuỗi chúng ta muốn thay thế bằng:

```js
const browserType = "mozilla";
const updated = browserType.replace("moz", "van");

console.log(updated); // "vanilla"
console.log(browserType); // "mozilla"
```

Lưu ý rằng `replace()`, giống như nhiều phương thức chuỗi, không thay đổi chuỗi mà nó được gọi, nhưng trả về một chuỗi mới. Nếu bạn muốn cập nhật biến `browserType` gốc, bạn sẽ phải làm điều gì đó như thế này:

```js
let browserType = "mozilla";
browserType = browserType.replace("moz", "van");

console.log(browserType); // "vanilla"
```

Cũng lưu ý rằng chúng ta bây giờ phải khai báo `browserType` bằng `let`, không phải `const`, vì chúng ta đang gán lại nó.

Lưu ý rằng `replace()` trong dạng này chỉ thay đổi lần xuất hiện đầu tiên của chuỗi con. Nếu bạn muốn thay đổi tất cả các lần xuất hiện, bạn có thể sử dụng {{jsxref("String.prototype.replaceAll()", "replaceAll()")}}:

```js
let quote = "To be or not to be";
quote = quote.replaceAll("be", "code");

console.log(quote); // "To code or not to code"
```

## Thử thách học tập

Trong phần này, chúng ta sẽ yêu cầu bạn thử viết một số mã thao tác chuỗi. Trong mỗi bài tập dưới đây, chúng ta có một mảng chuỗi, và một vòng lặp xử lý từng giá trị trong mảng và hiển thị nó trong danh sách có dấu đầu dòng. Bạn không cần hiểu mảng hoặc vòng lặp ngay bây giờ — những điều này sẽ được giải thích trong các bài tiếp theo. Tất cả những gì bạn cần làm trong mỗi trường hợp là viết mã sẽ xuất ra các chuỗi theo định dạng mà chúng ta muốn.

Mở mỗi ví dụ trong MDN Playground bằng cách sử dụng nút **"Play"** ở đầu ví dụ trực tiếp, sau đó làm theo các hướng dẫn để giải quyết vấn đề. Nếu bạn bị kẹt, bạn có thể xem các giải pháp bên dưới ví dụ trực tiếp trong mỗi trường hợp.

Bạn có thể sử dụng nút "Reset" trong MDN Playground để đặt lại mã nếu bạn mắc lỗi và không thể làm cho nó hoạt động trở lại.

### Lọc các thông điệp chào hỏi

Trong bài tập đầu tiên, chúng ta sẽ bắt đầu bạn đơn giản — chúng ta có một mảng các thông điệp thiệp chúc mừng, nhưng chúng ta muốn sắp xếp chúng để chỉ liệt kê các thông điệp Giáng Sinh. Chúng ta muốn bạn điền vào một bài kiểm tra câu lệnh điều kiện bên trong cấu trúc `if ()` để kiểm tra từng chuỗi và chỉ in nó trong danh sách nếu đó là thông điệp Giáng Sinh.

Hãy nghĩ về cách bạn có thể kiểm tra xem thông điệp trong mỗi trường hợp có phải là thông điệp Giáng Sinh không. Chuỗi nào có trong tất cả những thông điệp đó, và phương thức nào bạn có thể sử dụng để kiểm tra xem nó có hiện diện không?

```html hidden live-sample___string-methods-1
<ul></ul>
```

```js live-sample___string-methods-1
const list = document.querySelector("ul");
const greetings = [
  "Happy Birthday!",
  "Merry Christmas my love",
  "A happy Christmas to all the family",
  "You're all I want for Christmas",
  "Get well soon",
];

for (const greeting of greetings) {
  // Your conditional test needs to go inside the parentheses
  // in the line below, replacing what's currently there
  if (greeting) {
    const listItem = document.createElement("li");
    listItem.textContent = greeting;
    list.appendChild(listItem);
  }
}
```

{{ EmbedLiveSample("string-methods-1", "100%", 150) }}

<details>
<summary>Nhấp vào đây để xem giải pháp</summary>

JavaScript hoàn thành của bạn sẽ trông như thế này:

```js
const list = document.querySelector("ul");
const greetings = [
  "Happy Birthday!",
  "Merry Christmas my love",
  "A happy Christmas to all the family",
  "You're all I want for Christmas",
  "Get well soon",
];

for (const greeting of greetings) {
  if (greeting.includes("Christmas")) {
    const listItem = document.createElement("li");
    listItem.textContent = greeting;
    list.appendChild(listItem);
  }
}
```

</details>

### Sửa viết hoa

Bài tập này có tên các thành phố ở Vương quốc Anh, nhưng viết hoa bị lộn xộn. Chúng ta muốn bạn thay đổi chúng để tất cả đều viết thường, ngoại trừ chữ cái đầu tiên viết hoa. Một cách tốt để làm điều này là:

1. Chuyển đổi toàn bộ chuỗi chứa trong biến `city` sang chữ thường và lưu nó trong một biến mới.
2. Lấy chữ cái đầu tiên của chuỗi trong biến mới này và lưu nó trong một biến khác.
3. Sử dụng biến mới nhất này làm chuỗi con, thay thế chữ cái đầu tiên của chuỗi thường bằng chữ cái đầu tiên của chuỗi thường được đổi sang chữ hoa. Lưu kết quả của thủ tục thay thế này trong một biến mới khác.
4. Thay đổi giá trị của biến `result` bằng kết quả cuối cùng, không phải `city`.

> [!NOTE]
> Một gợi ý — các tham số của phương thức chuỗi không nhất thiết phải là chuỗi ký tự; chúng cũng có thể là biến, hoặc thậm chí biến với phương thức được gọi trên chúng.

```html hidden live-sample___string-methods-2
<ul></ul>
```

```js live-sample___string-methods-2
const list = document.querySelector("ul");
const cities = ["lonDon", "ManCHESTer", "BiRmiNGHAM", "liVERpoOL"];

for (const city of cities) {
  // write your code just below here

  const result = city;
  const listItem = document.createElement("li");
  listItem.textContent = result;
  list.appendChild(listItem);
}
```

{{ EmbedLiveSample("string-methods-2", "100%", 150) }}

<details>
<summary>Nhấp vào đây để xem giải pháp</summary>

JavaScript hoàn thành của bạn sẽ trông như thế này:

```js
const list = document.querySelector("ul");
const cities = ["lonDon", "ManCHESTer", "BiRmiNGHAM", "liVERpoOL"];

for (const city of cities) {
  const lower = city.toLowerCase();
  const firstLetter = lower.slice(0, 1);
  const capitalized = lower.replace(firstLetter, firstLetter.toUpperCase());
  const result = capitalized;
  const listItem = document.createElement("li");
  listItem.textContent = result;
  list.appendChild(listItem);
}
```

</details>

### Tạo chuỗi mới từ các phần cũ

Trong bài tập cuối cùng này, mảng chứa các chuỗi thông tin về các ga tàu ở phía Bắc nước Anh. Các chuỗi là các mục dữ liệu chứa mã ga ba chữ cái, theo sau là một số dữ liệu có thể đọc bởi máy, theo sau là dấu chấm phẩy, theo sau là tên ga có thể đọc bởi con người. Ví dụ:

```plain
MAN675847583748sjt567654;Manchester Piccadilly
```

Chúng ta muốn trích xuất mã ga và tên, và ghép chúng lại trong một chuỗi với cấu trúc sau:

```plain
MAN: Manchester Piccadilly
```

Chúng ta khuyến nghị làm theo cách này:

1. Trích xuất mã ga ba chữ cái và lưu nó trong một biến mới.
2. Tìm số chỉ số của ký tự dấu chấm phẩy.
3. Trích xuất tên ga có thể đọc bởi con người bằng cách sử dụng số chỉ số của ký tự dấu chấm phẩy làm điểm tham chiếu, và lưu nó trong một biến mới.
4. Nối hai biến mới và một chuỗi ký tự để tạo chuỗi cuối cùng.
5. Thay đổi giá trị của biến `result` thành chuỗi cuối cùng, không phải `station`.

```html hidden live-sample___string-methods-3
<ul></ul>
```

```js live-sample___string-methods-3
const list = document.querySelector("ul");
const stations = [
  "MAN675847583748sjt567654;Manchester Piccadilly",
  "GNF576746573fhdg4737dh4;Greenfield",
  "LIV5hg65hd737456236dch46dg4;Liverpool Lime Street",
  "SYB4f65hf75f736463;Stalybridge",
  "HUD5767ghtyfyr4536dh45dg45dg3;Huddersfield",
];

for (const station of stations) {
  // write your code just below here

  const result = station;
  const listItem = document.createElement("li");
  listItem.textContent = result;
  list.appendChild(listItem);
}
```

{{ EmbedLiveSample("string-methods-3", "100%", 150) }}

<details>
<summary>Nhấp vào đây để xem giải pháp</summary>

JavaScript hoàn thành của bạn sẽ trông như thế này:

```js
const list = document.querySelector("ul");
const stations = [
  "MAN675847583748sjt567654;Manchester Piccadilly",
  "GNF576746573fhdg4737dh4;Greenfield",
  "LIV5hg65hd737456236dch46dg4;Liverpool Lime Street",
  "SYB4f65hf75f736463;Stalybridge",
  "HUD5767ghtyfyr4536dh45dg45dg3;Huddersfield",
];

for (const station of stations) {
  const code = station.slice(0, 3);
  const semiColonIndex = station.indexOf(";");
  const name = station.slice(semiColonIndex + 1);
  const result = `${code}: ${name}`;
  const listItem = document.createElement("li");
  listItem.textContent = result;
  list.appendChild(listItem);
}
```

</details>

## Tóm tắt

Bạn không thể thoát khỏi thực tế rằng khả năng xử lý các từ và câu trong lập trình là rất quan trọng — đặc biệt trong JavaScript, vì các trang web đều là về việc giao tiếp với mọi người. Bài viết này cung cấp cho bạn những điều cơ bản mà bạn cần biết về thao tác chuỗi bây giờ. Điều này sẽ phục vụ bạn tốt khi bạn đi vào các chủ đề phức tạp hơn trong tương lai.

Trong bài tiếp theo, chúng ta sẽ cung cấp cho bạn một số bài kiểm tra mà bạn có thể sử dụng để kiểm tra mức độ hiểu biết và ghi nhớ thông tin chúng ta đã cung cấp về chuỗi và phương thức chuỗi.

{{PreviousMenuNext("Learn_web_development/Core/Scripting/Strings", "Learn_web_development/Core/Scripting/Test_your_skills/Strings", "Learn_web_development/Core/Scripting")}}
