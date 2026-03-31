---
title: Giới thiệu về JavaScript bất đồng bộ
short-title: Giới thiệu
slug: Learn_web_development/Extensions/Async_JS/Introducing
page-type: learn-module-chapter
sidebar: learnsidebar
---

{{NextMenu("Learn_web_development/Extensions/Async_JS/Promises", "Learn_web_development/Extensions/Async_JS")}}

Trong bài viết này, chúng ta sẽ giải thích lập trình bất đồng bộ là gì, tại sao chúng ta cần nó, và thảo luận ngắn gọn về một số cách các hàm bất đồng bộ đã được triển khai theo lịch sử trong JavaScript.

<table>
  <tbody>
    <tr>
      <th scope="row">Điều kiện tiên quyết:</th>
      <td>
        Hiểu biết vững chắc về <a href="/en-US/docs/Learn_web_development/Core/Scripting">các kiến thức cơ bản về JavaScript</a>.
      </td>
    </tr>
    <tr>
      <th scope="row">Kết quả học tập:</th>
      <td>
        <ul>
          <li>Để có sự quen thuộc với JavaScript bất đồng bộ là gì, nó khác với JavaScript đồng bộ như thế nào, và tại sao chúng ta cần nó.</li>
          <li>Lập trình đồng bộ là gì, và tại sao đôi khi nó có thể gây ra vấn đề.</li>
          <li>Lập trình bất đồng bộ nhằm giải quyết những vấn đề này như thế nào.</li>
          <li>Trình xử lý sự kiện và hàm gọi lại, và cách chúng liên quan đến lập trình bất đồng bộ.</li>
        </ul>
      </td>
    </tr>
  </tbody>
</table>

Lập trình bất đồng bộ là một kỹ thuật cho phép chương trình của bạn bắt đầu một tác vụ có thể chạy lâu và vẫn có thể phản hồi các sự kiện khác trong khi tác vụ đó chạy, thay vì phải chờ cho đến khi tác vụ đó kết thúc. Khi tác vụ đó đã hoàn thành, chương trình của bạn được trình bày với kết quả.

Nhiều hàm được cung cấp bởi trình duyệt, đặc biệt là những hàm thú vị nhất, có thể mất nhiều thời gian và do đó là bất đồng bộ. Ví dụ:

- Thực hiện các yêu cầu HTTP bằng cách sử dụng {{domxref("Window/fetch", "fetch()")}}
- Truy cập camera hoặc microphone của người dùng bằng cách sử dụng {{domxref("MediaDevices/getUserMedia", "getUserMedia()")}}
- Yêu cầu người dùng chọn tệp bằng cách sử dụng {{domxref("window/showOpenFilePicker", "showOpenFilePicker()")}}

Vì vậy mặc dù bạn có thể không phải _triển khai_ các hàm bất đồng bộ của riêng mình thường xuyên, nhưng bạn rất có thể cần phải _sử dụng_ chúng một cách đúng đắn.

Trong bài viết này, chúng ta sẽ bắt đầu bằng cách xem xét vấn đề với các hàm đồng bộ chạy lâu, làm cho lập trình bất đồng bộ trở nên cần thiết.

## Lập trình đồng bộ

Hãy xem xét code sau:

```js
const name = "Miriam";
const greeting = `Hello, my name is ${name}!`;
console.log(greeting);
// "Hello, my name is Miriam!"
```

Code này:

1. Khai báo một chuỗi có tên là `name`.
2. Khai báo một chuỗi khác có tên là `greeting`, sử dụng `name`.
3. Xuất lời chào ra bảng điều khiển JavaScript.

Chúng ta nên lưu ý ở đây rằng trình duyệt thực sự duyệt qua chương trình từng dòng một, theo thứ tự chúng ta viết. Tại mỗi thời điểm, trình duyệt chờ cho dòng hoàn thành công việc của nó trước khi đi đến dòng tiếp theo. Nó phải làm điều này vì mỗi dòng phụ thuộc vào công việc đã thực hiện ở các dòng trước.

Điều này làm cho đây là một **chương trình đồng bộ**. Nó vẫn sẽ là đồng bộ ngay cả khi chúng ta gọi một hàm riêng biệt, như sau:

```js
function makeGreeting(name) {
  return `Hello, my name is ${name}!`;
}

const name = "Miriam";
const greeting = makeGreeting(name);
console.log(greeting);
// "Hello, my name is Miriam!"
```

Ở đây, `makeGreeting()` là một **hàm đồng bộ** vì người gọi phải chờ hàm hoàn thành công việc của nó và trả về giá trị trước khi người gọi có thể tiếp tục.

## Một hàm đồng bộ chạy lâu

Điều gì xảy ra nếu hàm đồng bộ mất nhiều thời gian?

Chương trình bên dưới sử dụng một thuật toán rất không hiệu quả để tạo nhiều số nguyên tố lớn khi người dùng nhấp vào nút "Generate primes". Số nguyên tố mà người dùng chỉ định càng cao thì thao tác sẽ càng mất nhiều thời gian.

```html
<label for="quota">Number of primes:</label>
<input type="text" id="quota" name="quota" value="1000000" />

<button id="generate">Generate primes</button>
<button id="reload">Reload</button>

<div id="output"></div>
```

```js
const MAX_PRIME = 1000000;

function isPrime(n) {
  for (let i = 2; i <= Math.sqrt(n); i++) {
    if (n % i === 0) {
      return false;
    }
  }
  return n > 1;
}

const random = (max) => Math.floor(Math.random() * max);

function generatePrimes(quota) {
  const primes = [];
  while (primes.length < quota) {
    const candidate = random(MAX_PRIME);
    if (isPrime(candidate)) {
      primes.push(candidate);
    }
  }
  return primes;
}

const quota = document.querySelector("#quota");
const output = document.querySelector("#output");

document.querySelector("#generate").addEventListener("click", () => {
  const primes = generatePrimes(quota.value);
  output.textContent = `Finished generating ${quota.value} primes!`;
});

document.querySelector("#reload").addEventListener("click", () => {
  document.location.reload();
});
```

{{EmbedLiveSample("A long-running synchronous function", 600, 120)}}

Hãy thử nhấp vào "Generate primes". Tùy thuộc vào tốc độ máy tính của bạn, có thể mất vài giây trước khi chương trình hiển thị thông báo "Finished!".

## Vấn đề với các hàm đồng bộ chạy lâu

Ví dụ tiếp theo cũng giống như ví dụ trước, ngoại trừ chúng ta đã thêm một hộp văn bản để bạn gõ vào. Lần này, hãy nhấp vào "Generate primes", và ngay sau đó hãy thử gõ vào hộp văn bản.

Bạn sẽ thấy rằng trong khi hàm `generatePrimes()` đang chạy, chương trình của chúng ta hoàn toàn không phản hồi: bạn không thể gõ bất cứ điều gì, không thể nhấp vào bất cứ thứ gì, hoặc làm bất cứ điều gì khác.

```html hidden
<label for="quota">Number of primes:</label>
<input type="text" id="quota" name="quota" value="1000000" />

<button id="generate">Generate primes</button>
<button id="reload">Reload</button>

<textarea id="user-input" rows="5" cols="62">
Try typing in here immediately after pressing "Generate primes"
</textarea>

<div id="output"></div>
```

```css hidden
textarea {
  display: block;
  margin: 1rem 0;
}
```

```js hidden
const MAX_PRIME = 1000000;

function isPrime(n) {
  for (let i = 2; i <= Math.sqrt(n); i++) {
    if (n % i === 0) {
      return false;
    }
  }
  return n > 1;
}

const random = (max) => Math.floor(Math.random() * max);

function generatePrimes(quota) {
  const primes = [];
  while (primes.length < quota) {
    const candidate = random(MAX_PRIME);
    if (isPrime(candidate)) {
      primes.push(candidate);
    }
  }
  return primes;
}

const quota = document.querySelector("#quota");
const output = document.querySelector("#output");

document.querySelector("#generate").addEventListener("click", () => {
  const primes = generatePrimes(quota.value);
  output.textContent = `Finished generating ${quota.value} primes!`;
});

document.querySelector("#reload").addEventListener("click", () => {
  document.location.reload();
});
```

{{EmbedLiveSample("The trouble with long-running synchronous functions", 600, 200)}}

Lý do cho điều này là chương trình JavaScript này là _đơn luồng_. Một luồng là một chuỗi hướng dẫn mà một chương trình tuân theo. Vì chương trình bao gồm một luồng duy nhất, nên nó chỉ có thể làm một việc tại một thời điểm: vì vậy nếu nó đang chờ lệnh gọi đồng bộ chạy lâu của chúng ta trả về, nó không thể làm bất cứ điều gì khác.

Những gì chúng ta cần là một cách để chương trình của chúng ta:

1. Bắt đầu một thao tác chạy lâu bằng cách gọi hàm.
2. Có hàm đó bắt đầu thao tác và trở về ngay lập tức, để chương trình của chúng ta vẫn có thể phản hồi các sự kiện khác.
3. Có hàm thực thi thao tác theo cách không chặn luồng chính, ví dụ bằng cách bắt đầu một luồng mới.
4. Thông báo cho chúng ta về kết quả của thao tác khi nó cuối cùng hoàn thành.

Đó chính xác là những gì các hàm bất đồng bộ cho phép chúng ta làm. Phần còn lại của mô-đun này giải thích cách chúng được triển khai trong JavaScript.

## Trình xử lý sự kiện

Mô tả chúng ta vừa thấy về các hàm bất đồng bộ có thể gợi nhớ cho bạn về trình xử lý sự kiện, và nếu có, bạn đúng. Trình xử lý sự kiện thực sự là một dạng lập trình bất đồng bộ: bạn cung cấp một hàm (trình xử lý sự kiện) sẽ được gọi, không phải ngay lập tức, mà bất cứ khi nào sự kiện xảy ra. Nếu "sự kiện" là "thao tác bất đồng bộ đã hoàn thành", thì sự kiện đó có thể được sử dụng để thông báo cho người gọi về kết quả của một lệnh gọi hàm bất đồng bộ.

Một số API bất đồng bộ đầu tiên đã sử dụng sự kiện theo cách này. API {{domxref("XMLHttpRequest")}} cho phép bạn thực hiện các yêu cầu HTTP đến một máy chủ từ xa bằng JavaScript. Vì điều này có thể mất nhiều thời gian, đây là một API bất đồng bộ, và bạn nhận được thông báo về tiến trình và cuối cùng là hoàn thành yêu cầu bằng cách gắn các trình xử lý sự kiện vào đối tượng `XMLHttpRequest`.

Ví dụ sau cho thấy điều này trong hành động. Nhấn "Click to start request" để gửi yêu cầu. Chúng ta tạo một {{domxref("XMLHttpRequest")}} mới và lắng nghe sự kiện {{domxref("XMLHttpRequestEventTarget/loadend_event", "loadend")}} của nó. Trình xử lý ghi thông báo "Finished!" cùng với mã trạng thái.

Sau khi thêm trình xử lý sự kiện, chúng ta gửi yêu cầu. Lưu ý rằng sau đó, chúng ta có thể ghi "Started XHR request": đó là, chương trình của chúng ta có thể tiếp tục chạy trong khi yêu cầu đang diễn ra, và trình xử lý sự kiện của chúng ta sẽ được gọi khi yêu cầu hoàn thành.

```html
<button id="xhr">Click to start request</button>
<button id="reload">Reload</button>

<pre class="event-log"></pre>
```

```css hidden
pre {
  display: block;
  margin: 1rem 0;
}
```

```js
const log = document.querySelector(".event-log");

document.querySelector("#xhr").addEventListener("click", () => {
  log.textContent = "";

  const xhr = new XMLHttpRequest();

  xhr.addEventListener("loadend", () => {
    log.textContent = `${log.textContent}Finished with status: ${xhr.status}`;
  });

  xhr.open(
    "GET",
    "https://raw.githubusercontent.com/mdn/content/main/files/en-us/_wikihistory.json",
  );
  xhr.send();
  log.textContent = `${log.textContent}Started XHR request\n`;
});

document.querySelector("#reload").addEventListener("click", () => {
  log.textContent = "";
  document.location.reload();
});
```

{{EmbedLiveSample("Event handlers", 600, 120)}}

Đây là một [trình xử lý sự kiện](/en-US/docs/Learn_web_development/Core/Scripting/Events) giống như các trình xử lý cho các hành động người dùng như khi người dùng nhấp vào nút. Tuy nhiên lần này, sự kiện là sự thay đổi trong trạng thái của một đối tượng.

## Hàm gọi lại

Trình xử lý sự kiện là một loại hàm gọi lại (callback) cụ thể. Hàm gọi lại chỉ là một hàm được truyền vào một hàm khác, với kỳ vọng rằng hàm gọi lại sẽ được gọi vào thời điểm thích hợp. Như chúng ta vừa thấy, hàm gọi lại từng là cách chính để các hàm bất đồng bộ được triển khai trong JavaScript.

Tuy nhiên, code dựa trên hàm gọi lại có thể trở nên khó hiểu khi chính hàm gọi lại phải gọi các hàm chấp nhận hàm gọi lại. Đây là tình huống phổ biến nếu bạn cần thực hiện một số thao tác phân rã thành một loạt các hàm bất đồng bộ. Ví dụ, hãy xem xét những điều sau:

```js
function doStep1(init) {
  return init + 1;
}

function doStep2(init) {
  return init + 2;
}

function doStep3(init) {
  return init + 3;
}

function doOperation() {
  let result = 0;
  result = doStep1(result);
  result = doStep2(result);
  result = doStep3(result);
  console.log(`result: ${result}`);
}

doOperation();
```

Ở đây chúng ta có một thao tác duy nhất được chia thành ba bước, trong đó mỗi bước phụ thuộc vào bước cuối cùng. Trong ví dụ của chúng ta, bước đầu tiên thêm 1 vào đầu vào, bước thứ hai thêm 2, và bước thứ ba thêm 3. Bắt đầu với đầu vào là 0, kết quả cuối cùng là 6 (0 + 1 + 2 + 3). Là một chương trình đồng bộ, điều này rất đơn giản. Nhưng điều gì nếu chúng ta triển khai các bước bằng cách sử dụng hàm gọi lại?

```js
function doStep1(init, callback) {
  const result = init + 1;
  callback(result);
}

function doStep2(init, callback) {
  const result = init + 2;
  callback(result);
}

function doStep3(init, callback) {
  const result = init + 3;
  callback(result);
}

function doOperation() {
  doStep1(0, (result1) => {
    doStep2(result1, (result2) => {
      doStep3(result2, (result3) => {
        console.log(`result: ${result3}`);
      });
    });
  });
}

doOperation();
```

Vì chúng ta phải gọi các hàm gọi lại bên trong các hàm gọi lại, chúng ta có hàm `doOperation()` được lồng sâu, khó đọc và gỡ lỗi hơn nhiều. Điều này đôi khi được gọi là "callback hell" hoặc "pyramid of doom" (vì thụt lề trông giống như một hình kim tự tháp nằm nghiêng).

Khi chúng ta lồng các hàm gọi lại như thế này, cũng rất khó xử lý lỗi: thường bạn phải xử lý lỗi ở mỗi cấp của "kim tự tháp", thay vì chỉ xử lý lỗi một lần ở cấp cao nhất.

Vì những lý do này, hầu hết các API bất đồng bộ hiện đại không sử dụng hàm gọi lại. Thay vào đó, nền tảng của lập trình bất đồng bộ trong JavaScript là {{jsxref("Promise")}}, và đó là chủ đề của bài viết tiếp theo.

{{NextMenu("Learn_web_development/Extensions/Async_JS/Promises", "Learn_web_development/Extensions/Async_JS")}}
