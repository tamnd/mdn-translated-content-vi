---
title: Giới thiệu về worker
slug: Learn_web_development/Extensions/Async_JS/Introducing_workers
page-type: learn-module-chapter
sidebar: learnsidebar
---

{{PreviousMenuNext("Learn_web_development/Extensions/Async_JS/Implementing_a_promise-based_API", "Learn_web_development/Extensions/Async_JS/Sequencing_animations", "Learn_web_development/Extensions/Async_JS")}}

Trong bài viết cuối cùng trong mô-đun "JavaScript bất đồng bộ" của chúng ta, chúng ta sẽ giới thiệu _worker_, cho phép bạn chạy một số tác vụ trong một {{Glossary("Thread", "luồng")}} thực thi riêng biệt.

<table>
  <tbody>
    <tr>
      <th scope="row">Điều kiện tiên quyết:</th>
      <td>
         Hiểu biết vững chắc về <a href="/en-US/docs/Learn_web_development/Core/Scripting">các kiến thức cơ bản về JavaScript</a> và các khái niệm bất đồng bộ, được đề cập trong các bài học trước trong mô-đun này.
      </td>
    </tr>
    <tr>
      <th scope="row">Kết quả học tập:</th>
      <td>
        <ul>
          <li>Cách sử dụng web worker chuyên dụng, và tại sao.</li>
          <li>Hiểu mục đích của các loại web worker khác, như shared và service worker.</li>
        </ul>
      </td>
    </tr>
  </tbody>
</table>

Trong bài viết đầu tiên của mô-đun này, chúng ta đã thấy điều gì xảy ra khi bạn có một tác vụ đồng bộ chạy lâu trong chương trình của mình — toàn bộ cửa sổ trở nên hoàn toàn không phản hồi. Về cơ bản, lý do cho điều này là chương trình là _đơn luồng_. Một _luồng_ là một chuỗi hướng dẫn mà một chương trình tuân theo. Vì chương trình bao gồm một luồng duy nhất, nên nó chỉ có thể làm một việc tại một thời điểm: vì vậy nếu nó đang chờ lệnh gọi đồng bộ chạy lâu của chúng ta trả về, nó không thể làm bất cứ điều gì khác.

Worker cho phép bạn chạy một số tác vụ trong một luồng khác, vì vậy bạn có thể bắt đầu tác vụ, sau đó tiếp tục xử lý khác (như xử lý hành động người dùng).

Một mối lo ngại từ tất cả những điều này là nếu nhiều luồng có thể truy cập cùng một dữ liệu chia sẻ, thì chúng có thể thay đổi nó một cách độc lập và bất ngờ (theo nghĩa của nhau).
Điều này có thể gây ra lỗi khó tìm.

Để tránh những vấn đề này trên web, code chính và code worker của bạn không bao giờ có quyền truy cập trực tiếp vào các biến của nhau, và chỉ có thể thực sự "chia sẻ" dữ liệu trong các trường hợp rất cụ thể.
Worker và code chính chạy trong các thế giới hoàn toàn riêng biệt, và chỉ tương tác bằng cách gửi thông điệp cho nhau. Đặc biệt, điều này có nghĩa là worker không thể truy cập DOM (cửa sổ, tài liệu, phần tử trang, v.v.).

Có ba loại worker khác nhau:

- worker chuyên dụng (dedicated workers)
- worker dùng chung (shared workers)
- service worker

Trong bài viết này, chúng ta sẽ đi qua một ví dụ về loại worker đầu tiên, sau đó thảo luận ngắn gọn về hai loại kia.

## Sử dụng web worker

Nhớ lại trong bài viết đầu tiên, nơi chúng ta có một trang tính toán số nguyên tố? Chúng ta sẽ sử dụng worker để chạy tính toán số nguyên tố, vì vậy trang của chúng ta vẫn phản hồi với hành động người dùng.

### Bộ tạo số nguyên tố đồng bộ

Hãy xem lại JavaScript trong ví dụ trước của chúng ta:

```js
function generatePrimes(quota) {
  function isPrime(n) {
    for (let c = 2; c <= Math.sqrt(n); ++c) {
      if (n % c === 0) {
        return false;
      }
    }
    return true;
  }

  const primes = [];
  const maximum = 1000000;

  while (primes.length < quota) {
    const candidate = Math.floor(Math.random() * (maximum + 1));
    if (isPrime(candidate)) {
      primes.push(candidate);
    }
  }

  return primes;
}

document.querySelector("#generate").addEventListener("click", () => {
  const quota = document.querySelector("#quota").value;
  const primes = generatePrimes(quota);
  document.querySelector("#output").textContent =
    `Finished generating ${quota} primes!`;
});

document.querySelector("#reload").addEventListener("click", () => {
  document.querySelector("#user-input").value =
    'Try typing in here immediately after pressing "Generate primes"';
  document.location.reload();
});
```

Trong chương trình này, sau khi chúng ta gọi `generatePrimes()`, chương trình trở nên hoàn toàn không phản hồi.

### Tạo số nguyên tố bằng worker

Đối với ví dụ này, hãy bắt đầu bằng cách tạo bản sao local của các tệp tại <https://github.com/mdn/learning-area/tree/main/javascript/asynchronous/workers/start>. Có bốn tệp trong thư mục này:

- index.html
- style.css
- main.js
- generate.js

Các tệp "index.html" và "style.css" đã hoàn chỉnh:

```html
<!doctype html>
<html lang="en-US">
  <head>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width" />
    <title>Prime numbers</title>
    <script src="main.js" defer></script>
    <link href="style.css" rel="stylesheet" />
  </head>

  <body>
    <label for="quota">Number of primes:</label>
    <input type="text" id="quota" name="quota" value="1000000" />

    <button id="generate">Generate primes</button>
    <button id="reload">Reload</button>

    <textarea id="user-input" rows="5" cols="62">
Try typing in here immediately after pressing "Generate primes"
    </textarea>

    <div id="output"></div>
  </body>
</html>
```

```css
textarea {
  display: block;
  margin: 1rem 0;
}
```

Các tệp "main.js" và "generate.js" trống. Chúng ta sẽ thêm code chính vào "main.js", và code worker vào "generate.js".

Đầu tiên, chúng ta có thể thấy rằng code worker được giữ trong một script riêng biệt với code chính. Chúng ta cũng có thể thấy, nhìn vào "index.html" ở trên, rằng chỉ code chính mới được bao gồm trong một phần tử `<script>`.

Bây giờ hãy sao chép code sau vào "main.js":

```js
// Create a new worker, giving it the code in "generate.js"
const worker = new Worker("./generate.js");

// When the user clicks "Generate primes", send a message to the worker.
// The message command is "generate", and the message also contains "quota",
// which is the number of primes to generate.
document.querySelector("#generate").addEventListener("click", () => {
  const quota = document.querySelector("#quota").value;
  worker.postMessage({
    command: "generate",
    quota,
  });
});

// When the worker sends a message back to the main thread,
// update the output box with a message for the user, including the number of
// primes that were generated, taken from the message data.
worker.addEventListener("message", (message) => {
  document.querySelector("#output").textContent =
    `Finished generating ${message.data} primes!`;
});

document.querySelector("#reload").addEventListener("click", () => {
  document.querySelector("#user-input").value =
    'Try typing in here immediately after pressing "Generate primes"';
  document.location.reload();
});
```

- Đầu tiên, chúng ta tạo worker bằng hàm khởi tạo {{domxref("Worker/Worker", "Worker()")}}. Chúng ta truyền cho nó một URL trỏ đến script worker. Ngay khi worker được tạo, script worker được thực thi.

- Tiếp theo, như trong phiên bản đồng bộ, chúng ta thêm trình xử lý sự kiện `click` vào nút "Generate primes". Nhưng bây giờ, thay vì gọi hàm `generatePrimes()`, chúng ta gửi một thông điệp đến worker bằng cách sử dụng {{domxref("Worker/postMessage", "worker.postMessage()")}}. Thông điệp này có thể nhận một đối số, và trong trường hợp này, chúng ta đang truyền đối tượng JSON chứa hai thuộc tính:
  - `command`: một chuỗi xác định điều chúng ta muốn worker làm (trong trường hợp worker của chúng ta có thể làm nhiều việc hơn)
  - `quota`: số lượng số nguyên tố cần tạo.

- Tiếp theo, chúng ta thêm trình xử lý sự kiện `message` vào worker. Điều này để worker có thể nói với chúng ta khi nó hoàn thành, và truyền lại cho chúng ta dữ liệu kết quả. Trình xử lý của chúng ta lấy dữ liệu từ thuộc tính `data` của thông điệp, và ghi nó vào phần tử output (dữ liệu giống với `quota`, vì vậy điều này hơi vô nghĩa, nhưng nó cho thấy nguyên tắc).

- Cuối cùng, chúng ta triển khai trình xử lý sự kiện `click` cho nút "Reload". Điều này hoàn toàn giống với phiên bản đồng bộ.

Bây giờ cho code worker. Hãy sao chép code sau vào "generate.js":

```js
// Listen for messages from the main thread.
// If the message command is "generate", call `generatePrimes()`
addEventListener("message", (message) => {
  if (message.data.command === "generate") {
    generatePrimes(message.data.quota);
  }
});

// Generate primes (very inefficiently)
function generatePrimes(quota) {
  function isPrime(n) {
    for (let c = 2; c <= Math.sqrt(n); ++c) {
      if (n % c === 0) {
        return false;
      }
    }
    return true;
  }

  const primes = [];
  const maximum = 1000000;

  while (primes.length < quota) {
    const candidate = Math.floor(Math.random() * (maximum + 1));
    if (isPrime(candidate)) {
      primes.push(candidate);
    }
  }

  // When we have finished, send a message to the main thread,
  // including the number of primes we generated.
  postMessage(primes.length);
}
```

Nhớ rằng điều này chạy ngay khi script chính tạo worker.

Điều đầu tiên worker làm là bắt đầu lắng nghe thông điệp từ script chính. Nó làm điều này bằng cách sử dụng `addEventListener()`, là một hàm toàn cục trong worker. Bên trong trình xử lý sự kiện `message`, thuộc tính `data` của sự kiện chứa bản sao của đối số được truyền từ script chính. Nếu script chính truyền lệnh `generate`, chúng ta gọi `generatePrimes()`, truyền vào giá trị `quota` từ sự kiện thông điệp.

Hàm `generatePrimes()` cũng giống như phiên bản đồng bộ, ngoại trừ thay vì trả về một giá trị, chúng ta gửi một thông điệp đến script chính khi chúng ta hoàn thành. Chúng ta sử dụng hàm {{domxref("DedicatedWorkerGlobalScope/postMessage", "postMessage()")}} cho điều này, giống như `addEventListener()` là một hàm toàn cục trong worker. Như chúng ta đã thấy, script chính đang lắng nghe thông điệp này và sẽ cập nhật DOM khi thông điệp được nhận.

> [!NOTE]
> Để chạy trang này, bạn sẽ phải chạy một web server cục bộ, vì các URL file:// không được phép tải worker. Xem [Cách bạn thiết lập một server kiểm thử cục bộ?](/en-US/docs/Learn_web_development/Howto/Tools_and_setup/set_up_a_local_testing_server) để tìm hiểu cách. Sau khi đó, bạn sẽ có thể nhấp vào "Generate primes" và có trang chính của mình vẫn phản hồi.
>
> Nếu bạn gặp bất kỳ vấn đề nào khi tạo hoặc chạy ví dụ, bạn có thể xem lại [phiên bản hoàn chỉnh](https://github.com/mdn/learning-area/tree/main/javascript/asynchronous/workers/finished) và thử nó [trực tiếp](https://mdn.github.io/learning-area/javascript/asynchronous/workers/finished/).

## Các loại worker khác

Worker chúng ta vừa tạo là _worker chuyên dụng_. Điều này có nghĩa là nó được sử dụng bởi một thực thể script duy nhất.

Tuy nhiên, có các loại worker khác:

- [_Shared worker_](/en-US/docs/Web/API/SharedWorker) có thể được chia sẻ bởi nhiều script khác nhau chạy trong các cửa sổ khác nhau.
- [_Service worker_](/en-US/docs/Web/API/Service_Worker_API) hoạt động như máy chủ proxy, lưu vào bộ nhớ đệm tài nguyên để các ứng dụng web có thể hoạt động khi người dùng ngoại tuyến. Chúng là thành phần chính của [Progressive Web App](/en-US/docs/Web/Progressive_web_apps).

## Tóm tắt

Trong bài viết này, chúng ta đã giới thiệu web worker, cho phép ứng dụng web chuyển các tác vụ sang luồng riêng biệt. Luồng chính và worker không chia sẻ trực tiếp bất kỳ biến nào, nhưng giao tiếp bằng cách gửi thông điệp, được phía bên kia nhận như sự kiện `message`.

Worker có thể là cách hiệu quả để giữ cho ứng dụng chính phản hồi, mặc dù chúng không thể truy cập tất cả các API mà ứng dụng chính có thể, và đặc biệt không thể truy cập DOM.

## Xem thêm

- [Sử dụng web worker](/en-US/docs/Web/API/Web_Workers_API/Using_web_workers)
- [Sử dụng service worker](/en-US/docs/Web/API/Service_Worker_API/Using_Service_Workers)
- [API web worker](/en-US/docs/Web/API/Web_Workers_API)

{{PreviousMenuNext("Learn_web_development/Extensions/Async_JS/Implementing_a_promise-based_API", "Learn_web_development/Extensions/Async_JS/Sequencing_animations", "Learn_web_development/Extensions/Async_JS")}}
