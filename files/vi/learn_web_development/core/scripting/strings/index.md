---
title: Xử lý văn bản — chuỗi trong JavaScript
short-title: Chuỗi
slug: Learn_web_development/Core/Scripting/Strings
page-type: learn-module-chapter
sidebar: learnsidebar
---

{{PreviousMenuNext("Learn_web_development/Core/Scripting/Test_your_skills/Math", "Learn_web_development/Core/Scripting/Useful_string_methods", "Learn_web_development/Core/Scripting")}}

Tiếp theo, chúng ta sẽ chú ý đến chuỗi — đây là cách các đoạn văn bản được gọi trong lập trình. Trong bài này, chúng ta sẽ xem xét tất cả những điều phổ biến mà bạn thực sự cần biết về chuỗi khi học JavaScript, chẳng hạn như tạo chuỗi, thoát dấu ngoặc kép trong chuỗi và nối các chuỗi lại với nhau.

<table>
  <tbody>
    <tr>
      <th scope="row">Điều kiện tiên quyết:</th>
      <td>Hiểu biết về <a href="/en-US/docs/Learn_web_development/Core/Structuring_content">HTML</a> và <a href="/en-US/docs/Learn_web_development/Core/Styling_basics">các nguyên tắc cơ bản của CSS</a>.</td>
    </tr>
    <tr>
      <th scope="row">Kết quả học tập:</th>
      <td>
        <ul>
          <li>Tạo các chuỗi ký tự.</li>
          <li>Yêu cầu các dấu nháy phải khớp nhau.</li>
          <li>Nối chuỗi.</li>
          <li>Thoát ký tự trong chuỗi.</li>
          <li>Template literal, bao gồm sử dụng biến và template literal nhiều dòng.</li>
        </ul>
      </td>
    </tr>
  </tbody>
</table>

## Sức mạnh của từ ngữ

Từ ngữ rất quan trọng đối với con người — chúng là một phần lớn trong cách chúng ta giao tiếp. Vì web là một phương tiện chủ yếu dựa trên văn bản được thiết kế để cho phép con người giao tiếp và chia sẻ thông tin, nên hữu ích khi chúng ta có quyền kiểm soát các từ xuất hiện trên nó. {{glossary("HTML")}} cung cấp cấu trúc và ý nghĩa cho văn bản, {{glossary("CSS")}} cho phép chúng ta tạo kiểu chính xác cho nó, và JavaScript cung cấp nhiều tính năng để thao tác chuỗi. Những tính năng này bao gồm tạo thông điệp và lời nhắc chào mừng tùy chỉnh, hiển thị nhãn văn bản đúng khi cần, sắp xếp các thuật ngữ theo thứ tự mong muốn và nhiều hơn nữa.

Hầu hết tất cả các chương trình chúng ta đã cho bạn thấy trong khóa học này đều liên quan đến một số thao tác chuỗi.

## Khai báo chuỗi

Chuỗi được xử lý tương tự như số khi mới nhìn qua, nhưng khi bạn đào sâu hơn bạn sẽ bắt đầu thấy một số sự khác biệt đáng chú ý. Hãy bắt đầu bằng cách nhập một số dòng cơ bản vào [bảng điều khiển (console) nhà phát triển trình duyệt](/en-US/docs/Learn_web_development/Howto/Tools_and_setup/What_are_browser_developer_tools) để làm quen.

Để bắt đầu, nhập các dòng sau:

```js
const string = "The revolution will not be televised.";
console.log(string);
```

Giống như chúng ta đã làm với số, chúng ta khai báo một biến, khởi tạo nó với giá trị chuỗi, và sau đó trả về giá trị. Sự khác biệt duy nhất ở đây là khi viết một chuỗi, bạn cần bao quanh giá trị bằng dấu nháy.

Nếu bạn không làm điều này, hoặc bỏ lỡ một trong các dấu nháy, bạn sẽ gặp lỗi. Hãy thử nhập các dòng sau:

```js example-bad
const badString1 = This is a test;
const badString2 = 'This is a test;
const badString3 = This is a test';
```

Những dòng này không hoạt động vì bất kỳ văn bản nào không có dấu nháy xung quanh đều được hiểu là tên biến, tên thuộc tính, từ dành riêng hoặc tương tự. Nếu trình duyệt không nhận ra văn bản không có dấu nháy, thì một lỗi sẽ được phát sinh (ví dụ: "missing; before statement"). Nếu trình duyệt có thể phát hiện nơi bắt đầu chuỗi nhưng không phải cuối của nó (do thiếu dấu nháy thứ hai), nó có thể báo lỗi "unterminated string literal", hoặc trong bảng điều khiển (console), nhảy sang dòng mới và mong bạn hoàn thành chuỗi ở đó. Nếu chương trình của bạn đang gặp những lỗi như vậy, hãy quay lại và kiểm tra tất cả chuỗi của bạn để đảm bảo bạn không thiếu dấu nháy nào.

Đoạn sau sẽ hoạt động nếu bạn đã định nghĩa biến `string` trước đó — hãy thử ngay bây giờ:

```js
const badString = string;
console.log(badString);
```

`badString` bây giờ được đặt để có cùng giá trị với `string`.

### Dấu nháy đơn, dấu nháy kép và backtick

Trong JavaScript, bạn có thể chọn dấu nháy đơn (`'`), dấu nháy kép (`"`), hoặc backtick (`` ` ``) để bọc chuỗi của bạn. Tất cả những cách sau đều sẽ hoạt động:

```js-nolint
const single = 'Single quotes';
const double = "Double quotes";
const backtick = `Backtick`;

console.log(single);
console.log(double);
console.log(backtick);
```

Bạn phải sử dụng cùng ký tự cho đầu và cuối của chuỗi, hoặc bạn sẽ gặp lỗi:

```js-nolint example-bad
const badQuotes = 'This is not allowed!";
```

Chuỗi được khai báo bằng dấu nháy đơn và chuỗi được khai báo bằng dấu nháy kép là như nhau, và bạn sử dụng cái nào là tùy theo sở thích cá nhân — mặc dù thực hành tốt là chọn một phong cách và sử dụng nó nhất quán trong mã của bạn.

Chuỗi được khai báo bằng backtick là một loại chuỗi đặc biệt gọi là [_template literal_](/en-US/docs/Web/JavaScript/Reference/Template_literals). Template literal hầu hết hoạt động giống như chuỗi thông thường, nhưng chúng có một số thuộc tính đặc biệt:

- Bạn có thể [nhúng JavaScript](#embedding_javascript) vào chúng.
- Bạn có thể khai báo template literal trên [nhiều dòng](#multiline_strings).

## Nhúng JavaScript

Bên trong một template literal, bạn có thể bọc các biến hoặc biểu thức JavaScript bên trong `${ }`, và kết quả sẽ được bao gồm trong chuỗi:

```js
const name = "Chris";
const greeting = `Hello, ${name}`;
console.log(greeting); // "Hello, Chris"
```

Bạn có thể sử dụng cùng kỹ thuật để nối hai biến lại với nhau:

```js
const one = "Hello, ";
const two = "how are you?";
const joined = `${one}${two}`;
console.log(joined); // "Hello, how are you?"
```

Việc nối các chuỗi lại với nhau như thế này được gọi là _nối chuỗi (concatenation)_.

### Nối chuỗi trong ngữ cảnh

Hãy xem nối chuỗi đang được sử dụng trong thực tế:

```html live-sample___string-concat
<button>Press me</button>
<div id="greeting"></div>
```

```js live-sample___string-concat
const button = document.querySelector("button");

function greet() {
  const name = prompt("What is your name?");
  const greeting = document.querySelector("#greeting");
  greeting.textContent = `Hello ${name}, nice to see you!`;
}

button.addEventListener("click", greet);
```

{{EmbedLiveSample('string-concat', , '50', , , , , 'allow-modals')}}

Ở đây, chúng ta đang sử dụng hàm {{domxref("window.prompt()", "window.prompt()")}}, nhắc người dùng trả lời một câu hỏi qua hộp thoại popup và sau đó lưu văn bản họ nhập vào trong một biến nhất định — trong trường hợp này là `name`. Sau đó, chúng ta hiển thị một chuỗi chèn tên vào thông điệp chào hỏi chung.

### Nối chuỗi sử dụng "+"

Bạn chỉ có thể sử dụng `${}` với template literal, không phải chuỗi thông thường. Bạn có thể nối chuỗi thông thường bằng toán tử `+`:

```js
const greeting2 = "Hello";
const name2 = "Bob";
console.log(greeting2 + ", " + name2); // "Hello, Bob"
```

Tuy nhiên, template literal thường cho bạn mã dễ đọc hơn:

```js
const greeting3 = "Howdy";
const name3 = "Ramesh";
console.log(`${greeting3}, ${name3}`); // "Howdy, Ramesh"
```

### Bao gồm biểu thức trong chuỗi

Bạn có thể bao gồm các biểu thức JavaScript trong template literal, cũng như chỉ là biến, và kết quả sẽ được bao gồm trong kết quả:

```js
const song = "Fight the Youth";
const score = 9;
const highestScore = 10;
const output = `I like the song ${song}. I gave it a score of ${
  (score / highestScore) * 100
}%.`;
console.log(output); // "I like the song Fight the Youth. I gave it a score of 90%."
```

## Chuỗi nhiều dòng

Template literal tuân theo các ngắt dòng trong mã nguồn, vì vậy bạn có thể viết các chuỗi trải rộng nhiều dòng như thế này:

```js
const newline = `One day you finally knew
what you had to do, and began,`;
console.log(newline);

/*
One day you finally knew
what you had to do, and began,
*/
```

Để có đầu ra tương đương sử dụng chuỗi thông thường, bạn phải bao gồm các ký tự ngắt dòng (`\n`) trong chuỗi:

```js
const newline2 = "One day you finally knew\nwhat you had to do, and began,";
console.log(newline2);

/*
One day you finally knew
what you had to do, and began,
*/
```

Xem trang tham khảo [Template literals](/en-US/docs/Web/JavaScript/Reference/Template_literals) của chúng ta để biết thêm ví dụ và chi tiết về các tính năng nâng cao.

## Bao gồm dấu nháy trong chuỗi

Vì chúng ta sử dụng dấu nháy để chỉ đầu và cuối chuỗi, làm thế nào chúng ta có thể bao gồm dấu nháy thực sự trong chuỗi? Chúng ta biết điều này sẽ không hoạt động:

```js-nolint example-bad
const badQuotes = "She said "I think so!"";
```

Một tùy chọn phổ biến là sử dụng một trong các ký tự khác để khai báo chuỗi:

```js-nolint
const goodQuotes1 = 'She said "I think so!"';
const goodQuotes2 = `She said "I'm not going in there!"`;
```

Một tùy chọn khác là _thoát_ dấu nháy có vấn đề. Thoát ký tự có nghĩa là chúng ta làm điều gì đó với chúng để đảm bảo chúng được nhận dạng là văn bản, không phải là một phần của mã. Trong JavaScript, chúng ta thực hiện điều này bằng cách đặt dấu gạch chéo ngược ngay trước ký tự. Hãy thử điều này:

```js-nolint
const bigmouth = 'I\'ve got no right to take my place…';
console.log(bigmouth);
```

Bạn có thể sử dụng cùng kỹ thuật để chèn các ký tự đặc biệt khác. Xem [Chuỗi thoát (Escape sequences)](/en-US/docs/Web/JavaScript/Reference/Lexical_grammar#escape_sequences) để biết thêm chi tiết.

## Số so với chuỗi

Điều gì xảy ra khi chúng ta cố gắng nối một chuỗi và một số? Hãy thử trong bảng điều khiển (console) của chúng ta:

```js
const coolBandName = "Front ";
const number = 242;
console.log(coolBandName + number); // "Front 242"
```

Bạn có thể mong đợi điều này trả về lỗi, nhưng nó hoạt động tốt. Cách số được hiển thị như chuỗi được xác định khá rõ ràng, vì vậy trình duyệt tự động chuyển đổi số thành chuỗi và nối hai chuỗi lại với nhau.

Nếu bạn có một biến số mà bạn muốn chuyển đổi thành chuỗi hoặc một biến chuỗi mà bạn muốn chuyển đổi thành số, bạn có thể sử dụng hai cấu trúc sau:

- Hàm {{jsxref("Number/Number", "Number()")}} chuyển đổi bất kỳ thứ gì được truyền cho nó thành số nếu có thể. Hãy thử đoạn sau:

  ```js
  const myString = "123";
  const myNum = Number(myString);
  console.log(typeof myNum);
  // number
  ```

- Ngược lại, hàm {{jsxref("String/String", "String()")}} chuyển đổi đối số của nó thành chuỗi. Hãy thử điều này:

  ```js
  const myNum2 = 123;
  const myString2 = String(myNum2);
  console.log(typeof myString2);
  // string
  ```

Những cấu trúc này có thể thực sự hữu ích trong một số tình huống. Ví dụ, nếu người dùng nhập một số vào trường văn bản của biểu mẫu, đó là một chuỗi. Tuy nhiên, nếu bạn muốn thêm số này vào điều gì đó, bạn sẽ cần nó là một số, vì vậy bạn có thể truyền nó qua `Number()` để xử lý điều này. Chúng ta đã làm chính xác điều này trong [Trò chơi đoán số](https://github.com/mdn/learning-area/blob/main/javascript/introduction-to-js-1/first-splash/number-guessing-game.html), trong hàm `checkGuess`.

## Tóm tắt

Vậy là đó, những điều cơ bản nhất về chuỗi được đề cập trong JavaScript. Trong bài tiếp theo, chúng ta sẽ xây dựng trên điều này, xem xét một số phương thức tích hợp có sẵn cho chuỗi trong JavaScript và cách chúng ta có thể sử dụng chúng để thao tác chuỗi của mình thành dạng chúng ta muốn.

{{PreviousMenuNext("Learn_web_development/Core/Scripting/Test_your_skills/Math", "Learn_web_development/Core/Scripting/Useful_string_methods", "Learn_web_development/Core/Scripting")}}
