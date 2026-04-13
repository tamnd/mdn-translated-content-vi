---
title: Sử dụng microtask trong JavaScript với queueMicrotask()
slug: Web/API/HTML_DOM_API/Microtask_guide
page-type: guide
---

{{DefaultAPISidebar("HTML DOM")}}

**Microtask** là hàm ngắn được thực thi sau khi hàm hoặc chương trình tạo ra nó kết thúc _và_ chỉ khi [ngăn xếp thực thi JavaScript](/en-US/docs/Web/JavaScript/Reference/Execution_model#stack_and_execution_contexts) trống, nhưng trước khi trả quyền điều khiển cho vòng lặp sự kiện mà {{Glossary("user agent")}} sử dụng để điều khiển môi trường thực thi của script.

Vòng lặp sự kiện này có thể là vòng lặp sự kiện chính của trình duyệt hoặc vòng lặp sự kiện điều khiển [web worker](/en-US/docs/Web/API/Web_Workers_API). Điều này cho phép hàm đã cho chạy mà không có nguy cơ can thiệp vào quá trình thực thi của script khác, nhưng cũng đảm bảo rằng microtask chạy trước khi tác nhân người dùng có cơ hội phản ứng với các hành động được thực hiện bởi microtask.

[Promises](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Promise) và [Mutation Observer API](/en-US/docs/Web/API/MutationObserver) đều sử dụng hàng đợi microtask để chạy callback của chúng, nhưng cũng có những lúc khác khi khả năng trì hoãn công việc cho đến khi lượt vòng lặp sự kiện hiện tại kết thúc là hữu ích. Để cho phép microtask được sử dụng bởi các thư viện, framework và polyfill của bên thứ ba, phương thức {{domxref("Window.queueMicrotask()", "queueMicrotask()")}} được cung cấp trên các giao diện {{domxref("Window")}} và {{domxref("WorkerGlobalScope")}}.

## Task và microtask

Để thảo luận đúng về microtask, trước tiên cần biết task JavaScript là gì và microtask khác task như thế nào. Đây là giải thích nhanh, đơn giản hóa, nhưng nếu bạn muốn biết thêm chi tiết, bạn có thể đọc thông tin trong bài viết [Chuyên sâu: Microtask và môi trường thời gian chạy JavaScript](/en-US/docs/Web/API/HTML_DOM_API/Microtask_guide/In_depth).

### Task

**Task** là bất cứ điều gì được lên lịch để chạy bởi các cơ chế tiêu chuẩn như bắt đầu chạy chương trình ban đầu, sự kiện được gửi không đồng bộ, hoặc khoảng thời gian hay timeout được kích hoạt. Tất cả những điều này được lên lịch trên **hàng đợi task**.

Ví dụ, task được thêm vào hàng đợi task khi:

- Một chương trình JavaScript mới hoặc chương trình con được thực thi trực tiếp (chẳng hạn từ console, hoặc bằng cách chạy code trong phần tử {{HTMLElement("script")}}).
- Người dùng nhấp vào một phần tử. Một task sau đó được tạo và thực thi tất cả callback sự kiện.
- Một timeout hoặc khoảng thời gian được tạo bằng {{domxref("Window.setTimeout", "setTimeout()")}} hoặc {{domxref("Window.setInterval", "setInterval()")}} đến hạn, khiến callback tương ứng được thêm vào hàng đợi task.

Vòng lặp sự kiện điều khiển code của bạn xử lý các task này lần lượt, theo thứ tự chúng được thêm vào. Task chạy được lâu nhất trong hàng đợi task sẽ được thực thi trong một lần lặp đơn của vòng lặp sự kiện. Sau đó, microtask sẽ được thực thi cho đến khi hàng đợi microtask trống, rồi trình duyệt có thể chọn cập nhật hiển thị. Sau đó trình duyệt chuyển sang lần lặp tiếp theo của vòng lặp sự kiện.

### Microtask

Thoạt đầu, sự khác biệt giữa microtask và task có vẻ nhỏ. Và chúng tương tự nhau; cả hai đều được tạo thành từ code JavaScript được đặt vào hàng đợi và chạy vào thời điểm thích hợp. Tuy nhiên, trong khi vòng lặp sự kiện chỉ chạy các task hiện có trong hàng đợi khi lần lặp bắt đầu, lần lượt từng cái một, thì nó xử lý hàng đợi microtask rất khác.

Có hai điểm khác biệt chính:

1. Mỗi khi một task kết thúc, vòng lặp sự kiện kiểm tra xem task có đang trả quyền điều khiển cho code JavaScript khác không. Nếu không, nó chạy tất cả microtask trong hàng đợi microtask. Hàng đợi microtask sau đó được xử lý nhiều lần mỗi lần lặp của vòng lặp sự kiện, kể cả sau khi xử lý sự kiện và các callback khác.
2. Nếu một microtask thêm nhiều microtask hơn vào hàng đợi bằng cách gọi {{domxref("Window.queueMicrotask()", "queueMicrotask()")}}, những microtask mới được thêm đó _thực thi trước khi task tiếp theo chạy_. Đó là vì vòng lặp sự kiện sẽ tiếp tục gọi microtask cho đến khi không còn microtask nào trong hàng đợi, ngay cả khi có thêm microtask được thêm vào.

> [!WARNING]
> Vì microtask có thể tự thêm nhiều microtask hơn vào hàng đợi, và vòng lặp sự kiện tiếp tục xử lý microtask cho đến khi hàng đợi trống, có nguy cơ thực sự là vòng lặp sự kiện xử lý microtask vô tận. Hãy cẩn thận về cách bạn thêm microtask đệ quy.

## Sử dụng microtask

Trước khi đi sâu hơn, điều quan trọng cần lưu ý lại là hầu hết nhà phát triển sẽ không sử dụng microtask nhiều, nếu có. Đây là tính năng chuyên biệt cao của phát triển JavaScript hiện đại trên trình duyệt, cho phép bạn lên lịch code nhảy vào trước các thứ khác trong danh sách dài những thứ đang chờ xảy ra trên máy tính người dùng. Lạm dụng khả năng này sẽ dẫn đến vấn đề về hiệu suất.

### Thêm microtask vào hàng đợi

Do đó, thông thường bạn chỉ nên sử dụng microtask khi không có giải pháp nào khác, hoặc khi tạo framework hoặc thư viện cần sử dụng microtask để tạo chức năng họ đang triển khai. Mặc dù trước đây đã có các kỹ thuật cho phép thêm microtask vào hàng đợi (chẳng hạn như tạo promise được giải quyết ngay lập tức), việc bổ sung phương thức {{domxref("Window.queueMicrotask()", "queueMicrotask()")}} thêm cách tiêu chuẩn để đưa microtask vào một cách an toàn và không cần kỹ thuật.

Bằng cách giới thiệu `queueMicrotask()`, những sự kỳ lạ phát sinh khi lén dùng promise để tạo microtask có thể được tránh. Ví dụ, khi sử dụng promise để tạo microtask, ngoại lệ do callback ném ra được báo cáo là promise bị từ chối thay vì được báo cáo là ngoại lệ tiêu chuẩn. Ngoài ra, việc tạo và hủy promise tốn thêm chi phí cả về thời gian lẫn bộ nhớ, điều mà hàm đưa microtask vào đúng cách tránh được.

Truyền {{jsxref("Function")}} JavaScript để gọi trong khi ngữ cảnh đang xử lý microtask vào phương thức `queueMicrotask()`, được cung cấp trên ngữ cảnh toàn cục như được định nghĩa bởi giao diện {{domxref("Window")}} hoặc {{domxref("Worker")}}, tùy thuộc vào ngữ cảnh thực thi hiện tại.

```js
queueMicrotask(() => {
  /* code to run in the microtask here */
});
```

Bản thân hàm microtask không nhận tham số nào và không trả về giá trị.

### Khi nào nên sử dụng microtask

Trong phần này, chúng ta sẽ xem xét các tình huống trong đó microtask đặc biệt hữu ích. Nói chung, đó là về việc nắm bắt hoặc kiểm tra kết quả, hoặc thực hiện dọn dẹp, sau khi phần thân chính của ngữ cảnh thực thi JavaScript kết thúc, nhưng _trước khi_ bất kỳ trình xử lý sự kiện, timeout và khoảng thời gian, hoặc callback nào khác được xử lý.

Khi nào điều đó hữu ích?

Lý do chính để sử dụng microtask là đảm bảo thứ tự nhất quán của các task, ngay cả khi kết quả hoặc dữ liệu có sẵn đồng bộ, nhưng đồng thời giảm nguy cơ người dùng nhận thấy độ trễ trong các thao tác.

#### Đảm bảo thứ tự khi sử dụng promise có điều kiện

Một tình huống trong đó microtask có thể được sử dụng để đảm bảo rằng thứ tự thực thi luôn nhất quán là khi promise được sử dụng trong một mệnh đề của câu lệnh `if...else` (hoặc câu lệnh điều kiện khác), nhưng không phải trong mệnh đề kia. Hãy xem xét code như sau:

```js
customElement.prototype.getData = function (url) {
  if (this.cache[url]) {
    this.data = this.cache[url];
    this.dispatchEvent(new Event("load"));
  } else {
    fetch(url)
      .then((result) => result.arrayBuffer())
      .then((data) => {
        this.cache[url] = data;
        this.data = data;
        this.dispatchEvent(new Event("load"));
      });
  }
};
```

Vấn đề được giới thiệu ở đây là bằng cách sử dụng task trong một nhánh của câu lệnh `if...else` (trong trường hợp hình ảnh có trong cache) nhưng có promise liên quan trong mệnh đề `else`, chúng ta có tình huống trong đó thứ tự các thao tác có thể thay đổi; ví dụ như được thấy bên dưới.

```js
element.addEventListener("load", () => console.log("Loaded data"));
console.log("Fetching data…");
element.getData();
console.log("Data fetched");
```

Thực thi code này hai lần liên tiếp cho kết quả sau.

Khi dữ liệu không được cache:

```plain
Fetching data…
Data fetched
Loaded data
```

Khi dữ liệu được cache:

```plain
Fetching data…
Loaded data
Data fetched
```

Thậm chí tệ hơn, đôi khi thuộc tính `data` của phần tử sẽ được đặt, nhưng lúc khác nó sẽ không hoàn thành trước khi code này chạy xong.

Chúng ta có thể đảm bảo thứ tự nhất quán của các thao tác này bằng cách sử dụng microtask trong mệnh đề `if` để cân bằng hai mệnh đề:

```js
customElement.prototype.getData = function (url) {
  if (this.cache[url]) {
    queueMicrotask(() => {
      this.data = this.cache[url];
      this.dispatchEvent(new Event("load"));
    });
  } else {
    fetch(url)
      .then((result) => result.arrayBuffer())
      .then((data) => {
        this.cache[url] = data;
        this.data = data;
        this.dispatchEvent(new Event("load"));
      });
  }
};
```

Điều này cân bằng các mệnh đề bằng cách để cả hai tình huống xử lý việc đặt `data` và kích hoạt sự kiện `load` trong một microtask (sử dụng `queueMicrotask()` trong mệnh đề `if` và sử dụng các promise được sử dụng bởi {{domxref("Window/fetch", "fetch()")}} trong mệnh đề `else`).

#### Gộp các thao tác

Bạn cũng có thể sử dụng microtask để thu thập nhiều yêu cầu từ nhiều nguồn khác nhau vào một lô duy nhất, tránh chi phí có thể xảy ra khi gọi nhiều lần để xử lý cùng loại công việc.

Đoạn code dưới đây tạo một hàm gộp nhiều tin nhắn vào một mảng, sử dụng microtask để gửi chúng như một đối tượng duy nhất khi ngữ cảnh kết thúc.

```js
const messageQueue = [];

let sendMessage = (message) => {
  messageQueue.push(message);

  if (messageQueue.length === 1) {
    queueMicrotask(() => {
      const json = JSON.stringify(messageQueue);
      messageQueue.length = 0;
      fetch("url-of-receiver", json);
    });
  }
};
```

Khi `sendMessage()` được gọi, tin nhắn được chỉ định trước tiên được đẩy vào mảng hàng đợi tin nhắn. Sau đó mọi thứ trở nên thú vị.

Nếu tin nhắn chúng ta vừa thêm vào mảng là tin nhắn đầu tiên, chúng ta thêm microtask vào hàng đợi sẽ gửi lô. Microtask sẽ thực thi, như thường lệ, khi đường dẫn thực thi JavaScript đến cấp độ cao nhất, ngay trước khi chạy callback. Điều đó có nghĩa là bất kỳ lần gọi thêm nào đến `sendMessage()` trong thời gian đó sẽ đẩy tin nhắn của chúng vào hàng đợi tin nhắn, nhưng do kiểm tra độ dài mảng trước khi thêm microtask, không có microtask mới nào được thêm vào hàng đợi.

Khi microtask chạy, nó có một mảng có khả năng chứa nhiều tin nhắn đang chờ. Nó bắt đầu bằng cách mã hóa chúng dưới dạng JSON bằng phương thức {{jsxref("JSON.stringify()")}}. Sau đó, nội dung của mảng không còn cần thiết nữa, vì vậy chúng ta làm trống mảng `messageQueue`. Cuối cùng, chúng ta sử dụng phương thức {{domxref("Window/fetch", "fetch()")}} để gửi chuỗi JSON đến máy chủ.

Điều này cho phép mọi lần gọi `sendMessage()` được thực hiện trong cùng lần lặp của vòng lặp sự kiện thêm tin nhắn của chúng vào cùng một thao tác `fetch()`, mà không có khả năng để các task khác như timeout hay tương tự làm chậm quá trình truyền.

Máy chủ sẽ nhận được chuỗi JSON, sau đó sẽ giải mã nó và xử lý các tin nhắn tìm thấy trong mảng kết quả.

## Ví dụ

### Ví dụ microtask đơn giản

Trong ví dụ đơn giản này, chúng ta thấy rằng việc thêm microtask vào hàng đợi khiến callback của microtask chạy sau khi phần thân của script cấp cao nhất này chạy xong.

```html hidden
<pre id="log"></pre>
```

#### JavaScript

```js hidden
const logElem = document.getElementById("log");
const log = (s) => (logElem.innerText += `${s}\n`);
```

Trong code sau, chúng ta thấy một lần gọi {{domxref("Window.queueMicrotask()", "queueMicrotask()")}} được sử dụng để lên lịch microtask chạy. Lần gọi này được bao bởi các lần gọi `log()`, một hàm tùy chỉnh xuất văn bản ra màn hình.

```js
log("Before enqueueing the microtask");
queueMicrotask(() => {
  log("The microtask has run.");
});
log("After enqueueing the microtask");
```

#### Kết quả

{{EmbedLiveSample("Simple_microtask_example", 640, 80)}}

### Ví dụ timeout và microtask

Trong ví dụ này, một timeout được lên lịch kích hoạt sau không millisecond (hoặc "càng sớm càng tốt"). Điều này minh họa sự khác biệt giữa "càng sớm càng tốt" có nghĩa là gì khi lên lịch task mới (chẳng hạn bằng cách sử dụng `setTimeout()`) so với sử dụng microtask.

```html hidden
<pre id="log"></pre>
```

#### JavaScript

```js hidden
const logElem = document.getElementById("log");
const log = (s) => (logElem.innerText += `${s}\n`);
```

Trong code sau, chúng ta thấy một lần gọi {{domxref("Window.queueMicrotask()", "queueMicrotask()")}} được sử dụng để lên lịch microtask chạy. Lần gọi này được bao bởi các lần gọi `log()`, một hàm tùy chỉnh xuất văn bản ra màn hình.

Code dưới đây lên lịch timeout xảy ra trong không millisecond, sau đó thêm microtask vào hàng đợi. Điều này được bao bởi các lần gọi `log()` để xuất thêm tin nhắn.

```js
const callback = () => log("Regular timeout callback has run");

const urgentCallback = () => log("*** Oh noes! An urgent callback has run!");

log("Main program started");
setTimeout(callback, 0);
queueMicrotask(urgentCallback);
log("Main program exiting");
```

#### Kết quả

{{EmbedLiveSample("Timeout_and_microtask_example", 640, 100)}}

Lưu ý rằng đầu ra được ghi từ phần thân chương trình chính xuất hiện trước, tiếp theo là đầu ra từ microtask, tiếp theo là callback của timeout. Đó là vì khi task xử lý thực thi chương trình chính kết thúc, hàng đợi microtask được xử lý trước hàng đợi task nơi callback timeout đặt. Để giúp ghi nhớ điều này, hãy nhớ rằng task và microtask được giữ trong các hàng đợi riêng biệt, và microtask chạy trước.

### Microtask từ một hàm

Ví dụ này mở rộng một chút ví dụ trước bằng cách thêm một hàm thực hiện một số công việc. Hàm này sử dụng `queueMicrotask()` để lên lịch microtask. Điều quan trọng cần rút ra từ ví dụ này là microtask không được xử lý khi hàm kết thúc, mà khi chương trình chính kết thúc.

```html hidden
<pre id="log"></pre>
```

#### JavaScript

```js hidden
const logElem = document.getElementById("log");
const log = (s) => (logElem.innerText += `${s}\n`);
```

Code chương trình chính như sau. Hàm `doWork()` ở đây gọi `queueMicrotask()`, nhưng microtask vẫn không kích hoạt cho đến khi toàn bộ chương trình kết thúc, vì đó là khi task kết thúc và không còn gì trên ngăn xếp thực thi.

```js
const callback = () => log("Regular timeout callback has run");

const urgentCallback = () => log("*** Oh noes! An urgent callback has run!");

const doWork = () => {
  let result = 1;

  queueMicrotask(urgentCallback);

  for (let i = 2; i <= 10; i++) {
    result *= i;
  }
  return result;
};

log("Main program started");
setTimeout(callback, 0);
log(`10! equals ${doWork()}`);
log("Main program exiting");
```

#### Kết quả

{{EmbedLiveSample("Microtask_from_a_function", 640, 100)}}

## Xem thêm

- [Chuyên sâu: Microtask và môi trường thời gian chạy JavaScript](/en-US/docs/Web/API/HTML_DOM_API/Microtask_guide/In_depth)
- {{domxref("Window.queueMicrotask()", "queueMicrotask()")}}
- [JavaScript bất đồng bộ](/en-US/docs/Learn_web_development/Extensions/Async_JS)
  - [Giới thiệu JavaScript bất đồng bộ](/en-US/docs/Learn_web_development/Extensions/Async_JS/Introducing)
  - [Lập trình bất đồng bộ duyên dáng với Promises](/en-US/docs/Learn_web_development/Extensions/Async_JS/Promises)
