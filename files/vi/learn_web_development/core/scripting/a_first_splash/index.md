---
title: Làm quen với JavaScript lần đầu
short-title: Hướng dẫn JavaScript
slug: Learn_web_development/Core/Scripting/A_first_splash
page-type: learn-module-chapter
sidebar: learnsidebar
---

{{PreviousMenuNext("Learn_web_development/Core/Scripting/What_is_JavaScript", "Learn_web_development/Core/Scripting/What_went_wrong", "Learn_web_development/Core/Scripting")}}

Bây giờ bạn đã học được một số lý thuyết về JavaScript và những gì bạn có thể làm với nó, chúng ta sẽ hướng dẫn bạn qua một hướng dẫn thực tế để bạn có thể thấy cách tạo một chương trình JavaScript đơn giản. Ở đây bạn sẽ xây dựng một trò chơi "Đoán số" đơn giản, từng bước một.

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
          <li>Suy nghĩ như một lập trình viên.</li>
          <li>Trải nghiệm về cách viết JavaScript.</li>
        </ul>
      </td>
    </tr>
  </tbody>
</table>

> [!NOTE]
> Bắt đầu từ [Write your first JavaScript variable](https://scrimba.com/learn-javascript-c0v/~04?via=mdn), Scrimba<sup>[_MDN learning partner_](/en-US/docs/MDN/Writing_guidelines/Learning_content#partner_links_and_embeds)</sup> cung cấp các bài học tương tác hữu ích dẫn bạn qua những điều cơ bản của JavaScript.

Chúng ta muốn đặt kỳ vọng rất rõ ràng ở đây: Bạn sẽ không được yêu cầu học JavaScript vào cuối bài này, hoặc thậm chí hiểu tất cả mã mà chúng ta yêu cầu bạn viết. Thay vào đó, chúng ta muốn cung cấp cho bạn ý tưởng về cách các tính năng của JavaScript hoạt động cùng nhau, và cảm giác viết JavaScript như thế nào. Trong các bài tiếp theo, bạn sẽ xem xét lại tất cả các tính năng được hiển thị ở đây với nhiều chi tiết hơn, vì vậy đừng lo lắng nếu bạn không hiểu tất cả ngay lập tức!

> [!NOTE]
> Nhiều tính năng mã bạn sẽ thấy trong JavaScript cũng giống như trong các ngôn ngữ lập trình khác — hàm, vòng lặp, v.v. Cú pháp mã trông khác nhau, nhưng các khái niệm vẫn hầu hết là giống nhau.

## Giới thiệu ví dụ "Trò chơi đoán số" của chúng ta

Trong bài này, chúng ta sẽ cho bạn thấy cách xây dựng trò chơi bạn có thể thấy bên dưới:

```html hidden live-sample___guess-the-number
<h1>Number guessing game</h1>

<p>
  We have selected a random number between 1 and 100. See if you can guess it in
  10 turns or fewer. We'll tell you if your guess was too high or too low.
</p>

<div class="form">
  <label for="guessField">Enter a guess: </label>
  <input
    type="number"
    min="1"
    max="100"
    required
    id="guessField"
    class="guessField" />
  <input type="submit" value="Submit guess" class="guessSubmit" />
</div>

<div class="resultParas">
  <p class="guesses"></p>
  <p class="lastResult"></p>
  <p class="lowOrHi"></p>
</div>
```

```css hidden live-sample___guess-the-number
html {
  font-family: sans-serif;
}

body {
  width: 50%;
  max-width: 800px;
  min-width: 480px;
  margin: 0 auto;
}

.form input[type="number"] {
  width: 200px;
}

.lastResult {
  color: white;
  padding: 3px;
}
```

```js hidden live-sample___guess-the-number
let randomNumber = Math.floor(Math.random() * 100) + 1;
const guesses = document.querySelector(".guesses");
const lastResult = document.querySelector(".lastResult");
const lowOrHi = document.querySelector(".lowOrHi");
const guessSubmit = document.querySelector(".guessSubmit");
const guessField = document.querySelector(".guessField");
let guessCount = 1;
let resetButton;

function checkGuess() {
  const userGuess = Number(guessField.value);
  if (guessCount === 1) {
    guesses.textContent = "Previous guesses: ";
  }

  guesses.textContent = `${guesses.textContent} ${userGuess}`;

  if (userGuess === randomNumber) {
    lastResult.textContent = "Congratulations! You got it right!";
    lastResult.style.backgroundColor = "green";
    lowOrHi.textContent = "";
    setGameOver();
  } else if (guessCount === 10) {
    lastResult.textContent = "!!!GAME OVER!!!";
    lowOrHi.textContent = "";
    setGameOver();
  } else {
    lastResult.textContent = "Wrong!";
    lastResult.style.backgroundColor = "red";
    if (userGuess < randomNumber) {
      lowOrHi.textContent = "Last guess was too low!";
    } else if (userGuess > randomNumber) {
      lowOrHi.textContent = "Last guess was too high!";
    }
  }

  guessCount++;
  guessField.value = "";
  guessField.focus();
}

guessSubmit.addEventListener("click", checkGuess);

function setGameOver() {
  guessField.disabled = true;
  guessSubmit.disabled = true;
  resetButton = document.createElement("button");
  resetButton.textContent = "Start new game";
  document.body.appendChild(resetButton);
  resetButton.addEventListener("click", resetGame);
}

function resetGame() {
  guessCount = 1;
  const resetParas = document.querySelectorAll(".resultParas p");
  for (const resetPara of resetParas) {
    resetPara.textContent = "";
  }

  resetButton.parentNode.removeChild(resetButton);
  guessField.disabled = false;
  guessSubmit.disabled = false;
  guessField.value = "";
  guessField.focus();
  lastResult.style.backgroundColor = "white";
  randomNumber = Math.floor(Math.random() * 100) + 1;
}
```

{{EmbedLiveSample("guess-the-number", "100%", 300)}}

Hãy thử chơi — làm quen với trò chơi trước khi bạn tiếp tục.

## Suy nghĩ như một lập trình viên

Một trong những điều khó học nhất trong lập trình không phải là cú pháp bạn cần học, mà là cách áp dụng nó để giải quyết các vấn đề thực tế. Bạn cần bắt đầu suy nghĩ như một lập trình viên — điều này thường bao gồm việc xem xét mô tả những gì chương trình của bạn cần làm, xác định các tính năng mã cần thiết để đạt được những điều đó và cách làm cho chúng hoạt động cùng nhau.

Điều này đòi hỏi sự kết hợp của chăm chỉ, kinh nghiệm với cú pháp lập trình và thực hành — cộng với một chút sáng tạo. Bạn càng code nhiều, bạn sẽ càng giỏi hơn. Chúng ta không thể hứa rằng bạn sẽ phát triển "não lập trình viên" trong năm phút, nhưng chúng ta sẽ cung cấp cho bạn nhiều cơ hội để thực hành suy nghĩ như một lập trình viên ở đây và trong suốt phần còn lại của khóa học.

## Bản thiết kế ban đầu

Hãy tưởng tượng sếp của bạn đã cung cấp cho bạn bản thiết kế sau để tạo trò chơi này:

> Tôi muốn bạn tạo một trò chơi kiểu "đoán số" đơn giản. Nó nên chọn một số ngẫu nhiên từ 1 đến 100, sau đó thách người chơi đoán số trong 10 lượt. Sau mỗi lượt, người chơi nên được thông báo nếu họ đúng hay sai, và nếu sai, liệu dự đoán có quá thấp hay quá cao không. Nó cũng nên cho người chơi biết những số họ đã đoán trước đó. Trò chơi sẽ kết thúc khi người chơi đoán đúng, hoặc khi hết lượt. Khi trò chơi kết thúc, người chơi sẽ được cung cấp tùy chọn để bắt đầu chơi lại.

Khi nhìn vào bản thiết kế này, điều đầu tiên chúng ta có thể làm là bắt đầu chia nhỏ nó thành các tác vụ có thể thực hiện đơn giản, theo tư duy lập trình viên nhất có thể:

1. Tạo một số ngẫu nhiên từ 1 đến 100.
2. Ghi lại số lượt người chơi đang thực hiện. Bắt đầu từ 1.
3. Cung cấp cho người chơi một cách để đoán số.
4. Sau khi đoán được gửi, đầu tiên ghi lại nó ở đâu đó để người dùng có thể thấy các đoán trước đó của họ.
5. Tiếp theo, kiểm tra xem đó có phải là số đúng không.
6. Nếu đúng:
   1. Hiển thị thông báo chúc mừng.
   2. Ngăn người chơi nhập thêm đoán (điều này sẽ làm hỏng trò chơi).
   3. Hiển thị điều khiển cho phép người chơi khởi động lại trò chơi.

7. Nếu sai và người chơi còn lượt:
   1. Thông báo cho người chơi rằng họ sai và liệu đoán có quá cao hay quá thấp không.
   2. Cho phép họ nhập một đoán khác.
   3. Tăng số lượt lên 1.

8. Nếu sai và người chơi không còn lượt:
   1. Thông báo cho người chơi rằng trò chơi kết thúc.
   2. Ngăn người chơi nhập thêm đoán (điều này sẽ làm hỏng trò chơi).
   3. Hiển thị điều khiển cho phép người chơi khởi động lại trò chơi.

9. Khi trò chơi khởi động lại, hãy đảm bảo logic trò chơi và giao diện người dùng được thiết lập lại hoàn toàn, sau đó quay lại bước 1.

Hãy cùng tiến lên, xem xét cách chúng ta có thể chuyển đổi các bước này thành mã, xây dựng ví dụ và khám phá các tính năng JavaScript khi chúng ta tiến lên.

## Thiết lập ban đầu

Để bắt đầu hướng dẫn này, chúng ta muốn bạn tạo một bản sao cục bộ của mã sau đây trong một tệp HTML mới bằng trình soạn thảo mã của bạn.

```html
<!doctype html>
<html lang="en-US">
  <head>
    <meta charset="utf-8" />

    <title>Number guessing game</title>

    <style>
      html {
        font-family: sans-serif;
      }

      body {
        width: 50%;
        max-width: 800px;
        min-width: 480px;
        margin: 0 auto;
      }

      .form input[type="number"] {
        width: 200px;
      }

      .lastResult {
        color: white;
        padding: 3px;
      }
    </style>
  </head>

  <body>
    <h1>Number guessing game</h1>

    <p>
      We have selected a random number between 1 and 100. See if you can guess
      it in 10 turns or fewer. We'll tell you if your guess was too high or too
      low.
    </p>

    <div class="form">
      <label for="guessField">Enter a guess: </label>
      <input
        type="number"
        min="1"
        max="100"
        required
        id="guessField"
        class="guessField" />
      <input type="submit" value="Submit guess" class="guessSubmit" />
    </div>

    <div class="resultParas">
      <p class="guesses"></p>
      <p class="lastResult"></p>
      <p class="lowOrHi"></p>
    </div>

    <script>
      // Your JavaScript goes here
    </script>
  </body>
</html>
```

Giữ nó mở trong trình soạn thảo văn bản của bạn, và cũng mở nó trong trình duyệt web của bạn. Hiện tại bạn sẽ thấy một tiêu đề đơn giản, đoạn văn hướng dẫn và biểu mẫu để nhập đoán, nhưng biểu mẫu hiện tại sẽ không làm gì cả.

Bạn sẽ thêm tất cả mã JavaScript của mình bên trong phần tử {{htmlelement("script")}} ở cuối HTML:

```html
<script>
  // Your JavaScript goes here
</script>
```

## Thêm biến để lưu trữ dữ liệu

Hãy bắt đầu. Trước hết, thêm các dòng sau vào bên trong phần tử {{htmlelement("script")}} của bạn:

```js
let randomNumber = Math.floor(Math.random() * 100) + 1;

const guesses = document.querySelector(".guesses");
const lastResult = document.querySelector(".lastResult");
const lowOrHi = document.querySelector(".lowOrHi");

const guessSubmit = document.querySelector(".guessSubmit");
const guessField = document.querySelector(".guessField");

let guessCount = 1;
let resetButton;
```

Phần mã này thiết lập các biến (và hằng số) mà chúng ta cần để lưu trữ dữ liệu chương trình của chúng ta sẽ sử dụng.

Biến về cơ bản là tên cho các giá trị (như số hoặc chuỗi văn bản). Bạn tạo một biến với từ khóa `let` theo sau là tên biến.

Hằng số cũng được sử dụng để đặt tên cho các giá trị, nhưng không giống như biến, bạn không thể thay đổi giá trị sau khi đã đặt. Trong trường hợp này, chúng ta đang sử dụng hằng số để lưu trữ các tham chiếu đến các phần của giao diện người dùng. Văn bản bên trong một số phần tử này có thể thay đổi, nhưng mỗi hằng số luôn tham chiếu đến cùng phần tử HTML mà nó được khởi tạo. Bạn tạo hằng số với từ khóa `const` theo sau là tên hằng số.

Bạn có thể gán giá trị cho biến hoặc hằng số bằng dấu bằng (`=`) theo sau là giá trị bạn muốn đặt cho nó.

Trong ví dụ của chúng ta:

- Biến đầu tiên — `randomNumber` — được gán một số ngẫu nhiên từ 1 đến 100, được tính bằng một thuật toán toán học.
- Ba hằng số đầu tiên đều được tạo ra để lưu trữ tham chiếu đến các đoạn kết quả trong HTML của chúng ta, và được sử dụng để chèn giá trị vào các đoạn đó sau này trong mã (lưu ý cách chúng ở bên trong một phần tử `<div>`, bản thân nó được sử dụng để chọn cả ba sau này để đặt lại, khi chúng ta khởi động lại trò chơi):

  ```html
  <div class="resultParas">
    <p class="guesses"></p>
    <p class="lastResult"></p>
    <p class="lowOrHi"></p>
  </div>
  ```

- Hai hằng số tiếp theo lưu trữ tham chiếu đến ô nhập văn bản của biểu mẫu và nút gửi, và được sử dụng để xử lý việc gửi đoán sau này.

  ```html
  <label for="guessField">Enter a guess: </label>
  <input type="number" id="guessField" class="guessField" />
  <input type="submit" value="Submit guess" class="guessSubmit" />
  ```

- Hai biến cuối cùng của chúng ta lưu trữ số lượt đoán là 1 (được sử dụng để theo dõi người chơi đã đoán bao nhiêu lần), và tham chiếu đến nút đặt lại chưa tồn tại (nhưng sẽ có sau này).

## Hàm

Tiếp theo, thêm đoạn sau vào bên dưới JavaScript trước đó của bạn:

```js
function checkGuess() {
  console.log("I am a placeholder");
}
```

Hàm là các khối mã có thể tái sử dụng mà bạn có thể viết một lần và chạy đi chạy lại, giúp tiết kiệm việc phải tiếp tục lặp lại mã đi lặp lại. Có một vài cách để định nghĩa hàm, nhưng hiện tại chúng ta sẽ tập trung vào một kiểu đơn giản. Ở đây chúng ta đã định nghĩa một hàm bằng cách sử dụng từ khóa `function`, theo sau là tên, với dấu ngoặc đơn đặt sau nó. Sau đó chúng ta đặt hai dấu ngoặc nhọn (`{ }`). Bên trong dấu ngoặc nhọn là tất cả mã mà chúng ta muốn chạy bất cứ khi nào chúng ta gọi hàm.

Khi chúng ta muốn chạy mã, chúng ta gõ tên hàm theo sau là dấu ngoặc đơn.

Hãy thử ngay bây giờ. Lưu mã của bạn và làm mới trang trong trình duyệt. Sau đó truy cập vào [bảng điều khiển (console) JavaScript công cụ dành cho nhà phát triển](/en-US/docs/Learn_web_development/Howto/Tools_and_setup/What_are_browser_developer_tools), và nhập dòng sau:

```js
checkGuess();
```

Sau khi nhấn <kbd>Return</kbd>/<kbd>Enter</kbd>, bạn sẽ thấy `I am a placeholder` được ghi vào bảng điều khiển (console); chúng ta đã định nghĩa một hàm trong mã của mình xuất ra thông báo giữ chỗ bất cứ khi nào chúng ta gọi nó.

## Chuỗi văn bản

Chuỗi được sử dụng để biểu diễn văn bản. Chúng ta đã thấy một biến chuỗi: trong mã sau, `"I am a placeholder"` là một chuỗi:

```js
function checkGuess() {
  console.log("I am a placeholder");
}
```

Bạn có thể khai báo chuỗi bằng dấu ngoặc kép (`"`) hoặc dấu nháy đơn (`'`), nhưng bạn phải sử dụng cùng dạng cho đầu và cuối của một khai báo chuỗi đơn: bạn không thể viết `"I am a placeholder'`.

Bạn cũng có thể khai báo chuỗi bằng dấu backtick (`` ` ``). Các chuỗi được khai báo như thế này được gọi là _template literal_ và có một số thuộc tính đặc biệt. Đặc biệt, bạn có thể nhúng các biến hoặc thậm chí các biểu thức khác vào chúng:

```js
const name = "Mahalia";

const greeting = `Hello ${name}`;
```

Điều này cung cấp cho bạn một cơ chế để nối các chuỗi lại với nhau.

## Câu lệnh điều kiện

Các khối mã **câu lệnh điều kiện** cho phép bạn chạy mã có chọn lọc, tùy thuộc vào điều kiện nhất định là đúng hay không. Chúng trông hơi giống một hàm, nhưng chúng khác. Hãy khám phá câu lệnh điều kiện bằng cách thêm vào ví dụ của chúng ta.

Tôi nghĩ an toàn khi nói rằng chúng ta không muốn hàm `checkGuess()` chỉ xuất ra thông báo giữ chỗ. Chúng ta muốn nó kiểm tra xem đoán của người chơi có đúng hay không và phản hồi một cách thích hợp.

Tại thời điểm này, thay thế hàm `checkGuess()` hiện tại của bạn bằng phiên bản này:

```js
function checkGuess() {
  const userGuess = Number(guessField.value);
  if (guessCount === 1) {
    guesses.textContent = "Previous guesses:";
  }
  guesses.textContent = `${guesses.textContent} ${userGuess}`;

  if (userGuess === randomNumber) {
    lastResult.textContent = "Congratulations! You got it right!";
    lastResult.style.backgroundColor = "green";
    lowOrHi.textContent = "";
    setGameOver();
  } else if (guessCount === 10) {
    lastResult.textContent = "!!!GAME OVER!!!";
    lowOrHi.textContent = "";
    setGameOver();
  } else {
    lastResult.textContent = "Wrong!";
    lastResult.style.backgroundColor = "red";
    if (userGuess < randomNumber) {
      lowOrHi.textContent = "Last guess was too low!";
    } else if (userGuess > randomNumber) {
      lowOrHi.textContent = "Last guess was too high!";
    }
  }

  guessCount++;
  guessField.value = "";
  guessField.focus();
}
```

Đây là nhiều mã — phew! Hãy xem qua từng phần và giải thích những gì nó làm.

- Dòng đầu tiên khai báo hằng số có tên `userGuess` và đặt giá trị của nó thành giá trị hiện tại được nhập trong trường văn bản. Chúng ta cũng chạy giá trị này qua hàm tạo `Number()` tích hợp, chỉ để đảm bảo giá trị chắc chắn là một số.
- Tiếp theo, chúng ta gặp khối mã câu lệnh điều kiện đầu tiên. Dạng đơn giản nhất của khối câu lệnh điều kiện bắt đầu bằng từ khóa `if`, sau đó là một số dấu ngoặc đơn, sau đó là một số dấu ngoặc nhọn. Bên trong dấu ngoặc đơn, chúng ta bao gồm một bài kiểm tra. Nếu bài kiểm tra trả về `true`, chúng ta chạy mã bên trong dấu ngoặc nhọn. Nếu không, chúng ta không, và chuyển sang phần mã tiếp theo. Trong trường hợp này, chúng ta kiểm tra xem biến `guessCount` có bằng `1` không (tức là đây có phải là lượt đầu tiên của người chơi hay không):

  ```js
  guessCount === 1;
  ```

  Nếu có, chúng ta làm cho nội dung văn bản của đoạn đoán bằng `Previous guesses:`. Nếu không, chúng ta không làm vậy.

- Tiếp theo, chúng ta sử dụng template literal để nối giá trị `userGuess` hiện tại vào cuối đoạn `guesses`, với một khoảng trắng ở giữa.
- Khối tiếp theo thực hiện một vài kiểm tra:
  - `if (){ }` đầu tiên kiểm tra xem đoán của người dùng có bằng `randomNumber` được đặt ở đầu JavaScript của chúng ta không. Nếu có, người chơi đã đoán đúng và trò chơi kết thúc, vì vậy chúng ta hiển thị cho người chơi thông báo chúc mừng với màu xanh đẹp, xóa nội dung của hộp thông tin đoán Thấp/Cao và chạy hàm có tên `setGameOver()`, mà chúng ta sẽ thảo luận sau.
  - Bây giờ chúng ta đã kết thêm một bài kiểm tra khác vào cuối cái cuối cùng bằng cách sử dụng cấu trúc `else if (){ }`. Cái này kiểm tra xem lượt này có phải là lượt cuối cùng của người dùng không. Nếu có, chương trình làm điều tương tự như trong khối trước, ngoại trừ với thông báo game over thay vì thông báo chúc mừng.
  - Khối cuối cùng được kết nối vào cuối mã này (`else { }`) chứa mã chỉ chạy nếu cả hai bài kiểm tra khác không trả về true (người chơi không đoán đúng, nhưng họ còn lượt đoán). Trong trường hợp này, chúng ta nói với họ rằng họ sai, sau đó chúng ta thực hiện một bài kiểm tra câu lệnh điều kiện khác để kiểm tra xem đoán có cao hơn hay thấp hơn câu trả lời không, hiển thị thêm thông báo thích hợp để cho họ biết cao hơn hay thấp hơn.

- Ba dòng cuối trong hàm chuẩn bị cho chúng ta cho đoán tiếp theo được gửi. Chúng ta cộng 1 vào biến `guessCount` để người chơi sử dụng hết lượt của họ (`++` là một thao tác tăng — tăng thêm 1), và làm trống giá trị ra khỏi trường văn bản của biểu mẫu và tập trung lại nó, sẵn sàng cho đoán tiếp theo được nhập.

## Sự kiện

Tại thời điểm này, chúng ta có hàm `checkGuess()` được triển khai tốt, nhưng nó sẽ không làm gì vì chúng ta chưa gọi nó. Lý tưởng là, chúng ta muốn gọi nó khi nút "Submit guess" được nhấn, và để làm điều này chúng ta cần sử dụng một **sự kiện**. Sự kiện là những thứ xảy ra trong trình duyệt — một nút được nhấp, một trang đang tải, một video đang phát, v.v. — để phản hồi lại đó chúng ta có thể chạy các khối mã. **Trình lắng nghe sự kiện** quan sát các sự kiện cụ thể và gọi **hàm xử lý sự kiện**, chạy để phản hồi một sự kiện kích hoạt.

Thêm dòng sau bên dưới hàm `checkGuess()` của bạn:

```js
guessSubmit.addEventListener("click", checkGuess);
```

Ở đây chúng ta đang thêm trình lắng nghe sự kiện vào nút `guessSubmit`. Đây là một phương thức lấy hai giá trị đầu vào (được gọi là _đối số_) — loại sự kiện chúng ta đang lắng nghe (trong trường hợp này là `click`) dưới dạng chuỗi, và hàm chúng ta muốn chạy khi sự kiện xảy ra (trong trường hợp này là `checkGuess()`). Lưu ý rằng chúng ta không cần chỉ định dấu ngoặc đơn khi viết nó bên trong {{domxref("EventTarget.addEventListener", "addEventListener()")}}.

Hãy thử lưu và làm mới mã của bạn ngay bây giờ, và ví dụ của bạn sẽ hoạt động — đến một điểm nào đó. Vấn đề duy nhất bây giờ là nếu bạn đoán đúng câu trả lời hoặc hết lượt đoán, trò chơi sẽ bị hỏng vì chúng ta chưa định nghĩa hàm `setGameOver()` được cho là chạy sau khi trò chơi kết thúc. Hãy thêm mã còn thiếu của chúng ta ngay bây giờ và hoàn thành chức năng ví dụ.

## Kết thúc chức năng trò chơi

Hãy thêm hàm `setGameOver()` vào cuối mã của chúng ta và sau đó đi qua nó. Thêm điều này ngay bây giờ, bên dưới phần còn lại của JavaScript của bạn:

```js
function setGameOver() {
  guessField.disabled = true;
  guessSubmit.disabled = true;
  resetButton = document.createElement("button");
  resetButton.textContent = "Start new game";
  document.body.append(resetButton);
  resetButton.addEventListener("click", resetGame);
}
```

- Hai dòng đầu tiên vô hiệu hóa ô nhập văn bản và nút của biểu mẫu bằng cách đặt thuộc tính `disabled` của chúng thành `true`. Điều này cần thiết, vì nếu không, người dùng có thể gửi thêm đoán sau khi trò chơi kết thúc, điều này sẽ gây rối.
- Ba dòng tiếp theo tạo ra phần tử {{htmlelement("button")}} mới, đặt nhãn văn bản của nó thành "Start new game", và thêm nó vào cuối HTML hiện có của chúng ta.
- Dòng cuối cùng đặt trình lắng nghe sự kiện trên nút mới của chúng ta để khi nó được nhấp, một hàm có tên `resetGame()` được chạy.

Bây giờ chúng ta cần định nghĩa `resetGame()` nữa! Thêm mã sau, một lần nữa vào cuối JavaScript của bạn:

```js
function resetGame() {
  guessCount = 1;

  const resetParas = document.querySelectorAll(".resultParas p");
  for (const resetPara of resetParas) {
    resetPara.textContent = "";
  }

  resetButton.parentNode.removeChild(resetButton);

  guessField.disabled = false;
  guessSubmit.disabled = false;
  guessField.value = "";
  guessField.focus();

  lastResult.style.backgroundColor = "white";

  randomNumber = Math.floor(Math.random() * 100) + 1;
}
```

Khối mã khá dài này đặt lại hoàn toàn mọi thứ về cách nó ở đầu trò chơi, để người chơi có thể chơi thêm lần nữa.

Cụ thể, nó:

- Đặt lại `guessCount` về 1.
- Làm trống tất cả văn bản ra khỏi các đoạn thông tin. Chúng ta chọn tất cả các đoạn bên trong `<div class="resultParas"></div>`, sau đó lặp qua từng cái, đặt `textContent` của chúng thành `""` (chuỗi rỗng).
- Xóa nút đặt lại khỏi mã của chúng ta.
- Kích hoạt lại các phần tử biểu mẫu, làm trống và tập trung vào trường văn bản, sẵn sàng cho một đoán mới được nhập.
- Xóa màu nền khỏi đoạn `lastResult`.
- Tạo một số ngẫu nhiên mới để bạn không đoán cùng một số lần nữa!

**Tại thời điểm này, bạn nên có một trò chơi đơn giản hoạt động đầy đủ — xin chúc mừng!**

Tất cả những gì còn lại để làm bây giờ trong bài này là nói về một vài tính năng mã quan trọng khác mà bạn đã thấy, mặc dù bạn có thể chưa nhận ra điều đó.

## Vòng lặp

Ở trên, chúng ta đã đề cập đến **Vòng lặp**, một khái niệm rất quan trọng trong lập trình, cho phép bạn tiếp tục chạy một đoạn mã lặp đi lặp lại, cho đến khi một điều kiện nhất định được đáp ứng.

Hãy khám phá một ví dụ cơ bản để cho bạn thấy điều này có nghĩa là gì. Truy cập vào [bảng điều khiển (console) JavaScript công cụ dành cho nhà phát triển trình duyệt](/en-US/docs/Learn_web_development/Howto/Tools_and_setup/What_are_browser_developer_tools) của bạn một lần nữa, dán mã sau vào đó và nhấn <kbd>Enter</kbd>/<kbd>Return</kbd>:

```js
const fruits = ["apples", "bananas", "cherries"];
for (const fruit of fruits) {
  console.log(fruit);
}
```

Điều gì đã xảy ra? Các chuỗi `'apples', 'bananas', 'cherries'` đã được in ra trong bảng điều khiển (console) của bạn.

Điều này là vì vòng lặp. Dòng `const fruits = ['apples', 'bananas', 'cherries'];` tạo một mảng, là một tập hợp các giá trị (trong trường hợp này là chuỗi).

Sau đó chúng ta sử dụng vòng lặp [`for...of`](/en-US/docs/Web/JavaScript/Reference/Statements/for...of) để lấy từng mục trong mảng và chạy một số JavaScript trên nó. Dòng `for (const fruit of fruits)` nói:

1. Lấy giá trị đầu tiên trong `fruits` và lưu nó trong một biến có tên `fruit`.
2. Chạy mã giữa các dấu ngoặc nhọn `{}` (trong trường hợp này, ghi giá trị `fruit` vào bảng điều khiển (console)).
3. Lưu giá trị mảng tiếp theo trong `fruit`, và lặp lại 2, cho đến khi bạn đến cuối mảng `fruits`.

Bây giờ hãy xem vòng lặp trong trò chơi đoán số của chúng ta — sau đây có thể được tìm thấy bên trong hàm `resetGame()`:

```js
const resetParas = document.querySelectorAll(".resultParas p");
for (const resetPara of resetParas) {
  resetPara.textContent = "";
}
```

Mã này tạo một biến chứa danh sách tất cả các đoạn bên trong `<div class="resultParas">` bằng phương thức {{domxref("Document.querySelectorAll", "querySelectorAll()")}}, sau đó lặp qua từng cái, xóa nội dung văn bản của mỗi cái.

Lưu ý rằng mặc dù `resetPara` là hằng số, chúng ta vẫn có thể thay đổi các thuộc tính bên trong của nó như `textContent`.

## Tóm tắt

Vậy là đó cho việc xây dựng ví dụ. Bạn đã đến cuối — làm tốt lắm! Hãy thử mã cuối cùng của bạn, hoặc [chơi với phiên bản hoàn chỉnh của chúng ta tại đây](https://mdn.github.io/learning-area/javascript/introduction-to-js-1/first-splash/number-guessing-game.html). Nếu bạn không thể làm cho phiên bản ví dụ của mình hoạt động, hãy kiểm tra nó so với [mã nguồn](https://github.com/mdn/learning-area/blob/main/javascript/introduction-to-js-1/first-splash/number-guessing-game.html).

Bài tiếp theo cũng có thể giúp ích — trong đó, chúng ta thảo luận về những gì có thể xảy ra sai khi viết mã JavaScript, đề cập trở lại trò chơi "Đoán số" trong quá trình.

{{PreviousMenuNext("Learn_web_development/Core/Scripting/What_is_JavaScript", "Learn_web_development/Core/Scripting/What_went_wrong", "Learn_web_development/Core/Scripting")}}
