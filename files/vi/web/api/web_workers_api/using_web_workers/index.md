---
title: Sử dụng Web Workers
slug: Web/API/Web_Workers_API/Using_web_workers
page-type: guide
spec-urls: https://html.spec.whatwg.org/multipage/#workers
---

{{DefaultAPISidebar("Web Workers API")}}

Web Workers là một phương tiện đơn giản để nội dung web chạy các script trong các thread nền. Thread worker có thể thực hiện các tác vụ mà không can thiệp vào giao diện người dùng. Ngoài ra, chúng có thể tạo các request mạng bằng cách sử dụng các API {{domxref("WorkerGlobalScope/fetch", "fetch()")}} hoặc {{domxref("XMLHttpRequest")}}. Sau khi được tạo, một worker có thể gửi thông điệp tới mã JavaScript đã tạo nó bằng cách gửi thông điệp tới một event handler được chỉ định bởi mã đó (và ngược lại).

Bài viết này cung cấp giới thiệu chi tiết về cách sử dụng web workers.

## Web Workers API

Một worker là một đối tượng được tạo bằng cách sử dụng một constructor (ví dụ: {{domxref("Worker.Worker", "Worker()")}}) chạy một tệp JavaScript được đặt tên — tệp này chứa mã sẽ chạy trong thread của worker; workers chạy trong một ngữ cảnh global khác với {{domxref("window")}} hiện tại. Do đó, việc sử dụng phím tắt {{domxref("window")}} để lấy phạm vi global hiện tại (thay vì {{domxref("window.self","self")}}) trong một {{domxref("Worker")}} sẽ trả về lỗi.

Ngữ cảnh worker được đại diện bởi một đối tượng {{domxref("DedicatedWorkerGlobalScope")}} trong trường hợp của dedicated workers (workers tiêu chuẩn được sử dụng bởi một script duy nhất; shared workers sử dụng {{domxref("SharedWorkerGlobalScope")}}). Một dedicated worker chỉ có thể truy cập từ script đã sinh ra nó đầu tiên, trong khi shared workers có thể được truy cập từ nhiều script.

> [!NOTE]
> Xem [trang landing Web Workers API](/en-US/docs/Web/API/Web_Workers_API) để biết tài liệu tham khảo về workers và các hướng dẫn bổ sung.

Bạn có thể chạy bất kỳ mã nào bạn thích bên trong thread worker, với một số ngoại lệ. Ví dụ, bạn không thể trực tiếp thao tác DOM từ bên trong một worker, hoặc sử dụng một số phương thức và thuộc tính mặc định của đối tượng {{domxref("window")}}. Nhưng bạn có thể sử dụng một số lượng lớn các mục khả dụng dưới `window`, bao gồm [WebSockets](/en-US/docs/Web/API/WebSockets_API), và các cơ chế lưu trữ dữ liệu như [IndexedDB](/en-US/docs/Web/API/IndexedDB_API). Xem [Các hàm và lớp khả dụng cho workers](/en-US/docs/Web/API/Web_Workers_API/Functions_and_classes_available_to_workers) để biết thêm chi tiết.

Dữ liệu được gửi giữa workers và thread chính thông qua một hệ thống thông điệp — cả hai bên gửi thông điệp của họ bằng phương thức `postMessage()`, và phản hồi các thông điệp thông qua event handler `onmessage` (thông điệp được chứa trong thuộc tính data của event {{domxref("Worker/message_event", "message")}}). Dữ liệu được sao chép thay vì chia sẻ.

Workers có thể sinh ra các workers mới, miễn là những workers đó được lưu trữ trong cùng {{glossary("origin")}} với trang cha.

Ngoài ra, workers có thể tạo các request mạng bằng cách sử dụng các API {{domxref("WorkerGlobalScope/fetch", "fetch()")}} hoặc [`XMLHttpRequest`](/en-US/docs/Web/API/XMLHttpRequest) (mặc dù lưu ý rằng thuộc tính {{domxref("XMLHttpRequest.responseXML", "responseXML")}} của `XMLHttpRequest` sẽ luôn là `null`).

## Dedicated workers

Như đã đề cập ở trên, một dedicated worker chỉ có thể truy cập bởi script đã gọi nó. Trong phần này, chúng ta sẽ thảo luận về JavaScript được tìm thấy trong [ví dụ dedicated worker cơ bản](https://github.com/mdn/dom-examples/tree/main/web-workers/simple-web-worker) ([chạy dedicated worker](https://mdn.github.io/dom-examples/web-workers/simple-web-worker/)): Điều này cho phép bạn nhập hai số cần nhân với nhau. Các số được gửi tới một dedicated worker, nhân với nhau, và kết quả được trả về trang và hiển thị.

Ví dụ này khá đơn giản, nhưng chúng tôi quyết định giữ nó đơn giản trong khi giới thiệu cho bạn các khái niệm worker cơ bản. Các chi tiết nâng cao hơn được đề cập sau trong bài viết.

### Phát hiện tính năng Worker

Để xử lý lỗi và tương thích ngược tốt hơn một chút, nên bọc mã truy cập worker của bạn trong đoạn sau ([main.js](https://github.com/mdn/dom-examples/blob/main/web-workers/simple-web-worker/main.js)):

```js
if (window.Worker) {
  // …
}
```

### Sinh ra một dedicated worker

Việc tạo một worker mới rất đơn giản. Tất cả những gì bạn cần làm là gọi hàm tạo {{domxref("Worker.Worker", "Worker()")}}, chỉ định URI của một script để thực thi trong thread worker ([main.js](https://github.com/mdn/dom-examples/blob/main/web-workers/simple-web-worker/main.js)):

```js
const myWorker = new Worker("worker.js");
```

> [!NOTE]
> Các bundler, bao gồm [webpack](https://webpack.js.org/guides/web-workers/), [Vite](https://vite.dev/guide/features.html#web-workers), và [Parcel](https://parceljs.org/languages/javascript/#web-workers), khuyến nghị truyền các URL được giải quyết tương đối so với [`import.meta.url`](/en-US/docs/Web/JavaScript/Reference/Operators/import.meta#url) vào hàm tạo `Worker()`. Ví dụ:
>
> ```js
> const myWorker = new Worker(new URL("worker.js", import.meta.url));
> ```
>
> Bằng cách này, đường dẫn tương đối so với script hiện tại thay vì trang HTML hiện tại, cho phép bundler thực hiện an toàn các tối ưu hóa như đổi tên.

### Gửi thông điệp tới và từ một dedicated worker

Phép màu của workers xảy ra thông qua phương thức {{domxref("Worker.postMessage", "postMessage()")}} và event handler {{domxref("Worker.message_event", "onmessage")}}. Khi bạn muốn gửi một thông điệp tới worker, bạn gửi thông điệp tới nó như thế này ([main.js](https://github.com/mdn/dom-examples/blob/main/web-workers/simple-web-worker/main.js)):

```js
[first, second].forEach((input) => {
  input.onchange = () => {
    myWorker.postMessage([first.value, second.value]);
    console.log("Message posted to worker");
  };
});
```

Vì vậy, ở đây chúng ta có hai phần tử {{htmlelement("input")}} được đại diện bởi các biến `first` và `second`; khi giá trị của một trong hai thay đổi, `myWorker.postMessage([first.value,second.value])` được sử dụng để gửi giá trị bên trong cả hai tới worker, dưới dạng một mảng. Bạn có thể gửi hầu hết mọi thứ bạn thích trong thông điệp.

Trong worker, chúng ta có thể phản hồi khi nhận được thông điệp bằng cách viết một khối event handler như thế này ([worker.js](https://github.com/mdn/dom-examples/blob/main/web-workers/simple-web-worker/worker.js)):

```js
onmessage = (e) => {
  console.log("Message received from main script");
  const workerResult = `Result: ${e.data[0] * e.data[1]}`;
  console.log("Posting message back to main script");
  postMessage(workerResult);
};
```

Handler `onmessage` cho phép chúng ta chạy một số mã bất cứ khi nào một thông điệp được nhận, với chính thông điệp có sẵn trong thuộc tính `data` của event `message`. Ở đây chúng ta nhân hai số với nhau sau đó sử dụng `postMessage()` một lần nữa, để đăng kết quả trở lại thread chính.

Quay lại thread chính, chúng ta sử dụng `onmessage` một lần nữa, để phản hồi thông điệp được gửi lại từ worker:

```js
myWorker.onmessage = (e) => {
  result.textContent = e.data;
  console.log("Message received from worker");
};
```

Ở đây chúng ta lấy dữ liệu event thông điệp và đặt nó làm `textContent` của đoạn kết quả, vì vậy người dùng có thể xem kết quả của phép tính.

> [!NOTE]
> Lưu ý rằng `onmessage` và `postMessage()` cần được gắn vào đối tượng `Worker` khi sử dụng trong script thread chính, nhưng không khi sử dụng trong worker. Điều này là do, bên trong worker, worker thực chất là phạm vi global.

> [!NOTE]
> Khi một thông điệp được truyền giữa thread chính và worker, nó được sao chép hoặc "chuyển" (di chuyển), không phải chia sẻ. Đọc [Truyền dữ liệu đến và từ workers: chi tiết thêm](#transferring_data_to_and_from_workers_further_details) để biết giải thích kỹ lưỡng hơn nhiều.

### Chấm dứt một worker

Nếu bạn cần chấm dứt ngay lập tức một worker đang chạy từ thread chính, bạn có thể làm như vậy bằng cách gọi phương thức {{domxref("Worker", "terminate")}} của worker:

```js
myWorker.terminate();
```

Thread worker bị giết ngay lập tức.

### Xử lý lỗi

Khi một lỗi runtime xảy ra trong worker, event handler `onerror` của nó được gọi. Nó nhận một event tên là `error` thực thi giao diện `ErrorEvent`.

Event không nổi bọt và có thể hủy; để ngăn hành động mặc định diễn ra, worker có thể gọi phương thức [`preventDefault()`](/en-US/docs/Web/API/Event/preventDefault) của event error.

Event error có ba trường sau đáng quan tâm:

- `message`
  - : Một thông điệp lỗi dễ đọc.
- `filename`
  - : Tên của tệp script mà lỗi xảy ra.
- `lineno`
  - : Số dòng của tệp script mà lỗi xảy ra.

### Sinh ra subworkers

Workers có thể sinh ra nhiều workers hơn nếu chúng muốn. Các subworkers được gọi phải được lưu trữ trong cùng origin với trang cha. Ngoài ra, các URIs cho subworkers được giải quyết tương đối so với vị trí của worker cha thay vì của trang sở hữu. Điều này giúp workers dễ dàng theo dõi nơi các dependency của chúng nằm.

### Import scripts và thư viện

Worker threads có quyền truy cập vào một hàm global, `importScripts()`, cho phép chúng import scripts. Nó chấp nhận không hoặc nhiều URIs làm tham số cho các tài nguyên cần import; tất cả các ví dụ sau đều hợp lệ:

```js
importScripts(); /* không import gì */
importScripts("foo.js"); /* chỉ import "foo.js" */
importScripts("foo.js", "bar.js"); /* import hai scripts */
importScripts(
  "//example.com/hello.js",
); /* Bạn có thể import scripts từ các origins khác */
```

Trình duyệt tải mỗi script được liệt kê và thực thi nó. Bất kỳ đối tượng global nào từ mỗi script sau đó có thể được sử dụng bởi worker. Nếu script không thể tải, `NETWORK_ERROR` được ném ra, và mã tiếp theo sẽ không được thực thi. Tuy nhiên, mã đã thực thi trước đó (bao gồm cả mã được hoãn bằng {{domxref("WorkerGlobalScope.setTimeout", "setTimeout()")}}) vẫn sẽ hoạt động. Các khai báo hàm **sau** phương thức `importScripts()` cũng được giữ lại, vì chúng luôn được đánh giá trước phần còn lại của mã.

> [!NOTE]
> Scripts có thể được tải xuống theo bất kỳ thứ tự nào, nhưng sẽ được thực thi theo thứ tự bạn truyền tên tệp vào `importScripts()`. Điều này được thực hiện đồng bộ; `importScripts()` không trả về cho đến khi tất cả các scripts đã được tải và thực thi.

## Shared workers

Một shared worker có thể truy cập bởi nhiều scripts — ngay cả khi chúng đang được truy cập bởi các window, iframes hoặc thậm chí workers khác. Trong phần này, chúng ta sẽ thảo luận về JavaScript được tìm thấy trong [ví dụ shared worker cơ bản](https://github.com/mdn/dom-examples/tree/main/web-workers/simple-shared-worker) ([chạy shared worker](https://mdn.github.io/dom-examples/web-workers/simple-shared-worker/)): Cái này rất giống với ví dụ dedicated worker cơ bản, ngoại trừ nó có hai hàm khả dụng được xử lý bởi các tệp script khác nhau: _nhân hai số_, hoặc _bình phương một số_. Cả hai scripts đều sử dụng cùng một worker để thực hiện phép tính thực tế cần thiết.

Ở đây chúng ta sẽ tập trung vào sự khác biệt giữa dedicated và shared workers. Lưu ý rằng trong ví dụ này chúng ta có hai trang HTML, mỗi trang có JavaScript được áp dụng sử dụng cùng một tệp worker duy nhất.

> [!NOTE]
> Nếu SharedWorker có thể được truy cập từ nhiều browsing contexts, tất cả các browsing contexts đó phải chia sẻ chính xác cùng một origin (cùng protocol, host, và port).

> [!NOTE]
> Trong Firefox, shared workers không thể được chia sẻ giữa các tài liệu được tải trong cửa sổ private và non-private ([Firefox bug 1177621](https://bugzil.la/1177621)).

### Sinh ra một shared worker

Việc sinh một shared worker mới khá giống với một dedicated worker, nhưng với một tên constructor khác (xem [index.html](https://github.com/mdn/dom-examples/blob/main/web-workers/simple-shared-worker/index.html) và [index2.html](https://github.com/mdn/dom-examples/blob/main/web-workers/simple-shared-worker/index2.html)) — mỗi cái phải khởi tạo worker bằng cách sử dụng mã như sau:

```js
const myWorker = new SharedWorker("worker.js");
```

Một sự khác biệt lớn là với một shared worker bạn phải giao tiếp thông qua một đối tượng `port` — một cổng rõ ràng được mở mà các scripts có thể sử dụng để giao tiếp với worker (điều này được thực hiện ngầm định trong trường hợp của dedicated workers).

Kết nối cổng cần được bắt đầu hoặc ngầm định bằng cách sử dụng event handler `onmessage` hoặc rõ ràng với phương thức `start()` trước khi bất kỳ thông điệp nào có thể được gửi. Việc gọi `start()` chỉ cần thiết nếu event `message` được nối dây thông qua phương thức `addEventListener()`.

> [!NOTE]
> Khi sử dụng phương thức `start()` để mở kết nối cổng, nó cần được gọi từ cả parent thread và thread worker nếu cần giao tiếp hai chiều.

### Gửi thông điệp tới và từ một shared worker

Bây giờ các thông điệp có thể được gửi tới worker như trước, nhưng phương thức `postMessage()` phải được gọi thông qua đối tượng port (một lần nữa, bạn sẽ thấy các cấu trúc tương tự trong cả [multiply.js](https://github.com/mdn/dom-examples/blob/main/web-workers/simple-shared-worker/multiply.js) và [square.js](https://github.com/mdn/dom-examples/blob/main/web-workers/simple-shared-worker/square.js)):

```js
squareNumber.onchange = () => {
  myWorker.port.postMessage([squareNumber.value, squareNumber.value]);
  console.log("Message posted to worker");
};
```

Bây giờ, đến worker. Có một chút phức tạp hơn ở đây ([worker.js](https://github.com/mdn/dom-examples/blob/main/web-workers/simple-shared-worker/worker.js)):

```js
onconnect = (e) => {
  const port = e.ports[0];

  port.onmessage = (e) => {
    const workerResult = `Result: ${e.data[0] * e.data[1]}`;
    port.postMessage(workerResult);
  };
};
```

Đầu tiên, chúng ta sử dụng một handler `onconnect` để kích hoạt mã khi một kết nối đến port xảy ra (tức là, khi event handler `onmessage` trong parent thread được thiết lập, hoặc khi phương thức `start()` được gọi rõ ràng trong parent thread).

Chúng ta sử dụng thuộc tính `ports` của đối tượng event này để lấy port và lưu trữ nó trong một biến.

Tiếp theo, chúng ta thêm một handler `onmessage` trên port để thực hiện phép tính và trả kết quả về main thread. Việc thiết lập handler `onmessage` này trong worker thread cũng ngầm định mở kết nối port trở lại parent thread, vì vậy lời gọi `port.start()` thực sự không cần thiết, như đã lưu ý ở trên.

Cuối cùng, quay lại main script, chúng ta xử lý thông điệp (một lần nữa, bạn sẽ thấy các cấu trúc tương tự trong cả [multiply.js](https://github.com/mdn/dom-examples/blob/main/web-workers/simple-shared-worker/multiply.js) và [square.js](https://github.com/mdn/dom-examples/blob/main/web-workers/simple-shared-worker/square.js)):

```js
myWorker.port.onmessage = (e) => {
  result2.textContent = e.data;
  console.log("Message received from worker");
};
```

Khi một thông điệp quay lại thông qua port từ worker, chúng ta chèn kết quả tính toán vào đoạn kết quả thích hợp.

## Về tính an toàn của thread

Giao diện {{domxref("Worker")}} sinh ra các threads cấp OS thực sự, và các lập trình viên thận trọng có thể lo ngại rằng concurrency có thể gây ra các hiệu ứng "thú vị" trong mã của bạn nếu bạn không cẩn thận.

Tuy nhiên, vì web workers có các điểm giao tiếp được kiểm soát cẩn thận với các threads khác, nên thực sự rất khó gây ra các vấn đề concurrency. Không có quyền truy cập vào các thành phần không an toàn cho thread hoặc DOM. Và bạn phải truyền dữ liệu cụ thể vào và ra khỏi một thread thông qua các đối tượng đã tuần tự hóa. Vì vậy, bạn phải làm việc rất chăm chỉ để gây ra vấn đề trong mã của mình.

## Content security policy

Workers được coi là có ngữ cảnh thực thi riêng, khác biệt với tài liệu đã tạo ra chúng. Vì lý do này, chúng nói chung không được quản lý bởi [content security policy](/en-US/docs/Mozilla/Add-ons/WebExtensions/Content_Security_Policy) của tài liệu (hoặc parent worker) đã tạo ra chúng. Vì vậy, ví dụ, giả sử một tài liệu được phục vụ với tiêu đề sau:

```http
Content-Security-Policy: script-src 'self'
```

Trong số những thứ khác, điều này sẽ ngăn bất kỳ scripts nào nó bao gồm sử dụng [`eval()`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/eval). Tuy nhiên, nếu script tạo ra một worker, mã chạy trong ngữ cảnh của worker _sẽ_ được phép sử dụng `eval()`.

Để chỉ định một content security policy cho worker, hãy thiết lập một tiêu đề phản hồi [Content-Security-Policy](/en-US/docs/Web/HTTP/Reference/Headers/Content-Security-Policy) cho request đã phân phối chính script worker.

Ngoại lệ cho điều này là nếu origin của script worker là một globally unique identifier (ví dụ: nếu URL của nó có scheme là data hoặc blob). Trong trường hợp này, worker kế thừa CSP của tài liệu hoặc worker đã tạo ra nó.

## Truyền dữ liệu đến và từ workers: chi tiết thêm

Dữ liệu được truyền giữa trang chính và workers được _sao chép_, không chia sẻ (ngoại trừ một số đối tượng nhất định có thể được [chia sẻ](#sharing_data) một cách rõ ràng). Các đối tượng được tuần tự hóa khi chúng được giao cho worker, và sau đó, giải tuần tự hóa ở đầu kia. Trang và worker **không chia sẻ cùng một instance**, vì vậy kết quả cuối cùng là **một bản sao** được tạo ở mỗi đầu. Hầu hết các trình duyệt thực hiện tính năng này dưới dạng [structured cloning](/en-US/docs/Web/API/Web_Workers_API/Structured_clone_algorithm).

Như bạn có thể đã biết, dữ liệu được trao đổi giữa hai threads thông qua các thông điệp bằng `postMessage()`, và thuộc tính {{domxref("MessageEvent.data", "data")}} của event `message` chứa dữ liệu được gửi lại từ worker.

**example.html**: (trang chính):

```js
const myWorker = new Worker("my_task.js");

myWorker.onmessage = (event) => {
  console.log(`Worker said : "${event.data}"`);
};

myWorker.postMessage({ lastUpdate: new Date() });
```

**my_task.js** (worker):

```js
self.onmessage = (event) => {
  postMessage(`Last updated: ${event.data.lastUpdate.toDateString()}`);
};
```

Thuật toán [structured cloning](/en-US/docs/Web/API/Web_Workers_API/Structured_clone_algorithm) có thể chấp nhận JSON và một vài thứ mà JSON không thể — như các tham chiếu tuần hoàn.

### Ví dụ truyền dữ liệu

#### Ví dụ 1: Truyền nâng cao JSON Data và tạo một hệ thống chuyển đổi

Nếu bạn phải truyền một số dữ liệu phức tạp và phải gọi nhiều hàm khác nhau cả trên trang chính và trong Worker, bạn có thể tạo một hệ thống nhóm mọi thứ lại với nhau.

Đầu tiên, chúng ta tạo một lớp `QueryableWorker` lấy URL của worker, một listener mặc định, và một error handler, và lớp này sẽ theo dõi một danh sách các listeners và giúp chúng ta giao tiếp với worker:

```js
function QueryableWorker(url, defaultListener, onError) {
  const worker = new Worker(url);
  const listeners = {};

  this.defaultListener = defaultListener ?? (() => {});

  if (onError) {
    worker.onerror = onError;
  }

  this.postMessage = (message) => {
    worker.postMessage(message);
  };

  this.terminate = () => {
    worker.terminate();
  };
}
```

Sau đó, chúng ta thêm các phương thức thêm/xóa listeners:

```js
this.addListeners = (name, listener) => {
  listeners[name] = listener;
};

this.removeListeners = (name) => {
  delete listeners[name];
};
```

Ở đây chúng ta để worker xử lý hai hoạt động đơn giản để minh họa: lấy hiệu của hai số và tạo một alert sau ba giây. Để đạt được điều đó, đầu tiên chúng ta triển khai một phương thức `sendQuery` truy vấn xem worker có thực sự có các phương thức tương ứng để thực hiện những gì chúng ta muốn hay không.

```js
// Hàm này lấy ít nhất một đối số, tên phương thức chúng ta muốn truy vấn.
// Sau đó chúng ta có thể truyền vào các đối số mà phương thức cần.
this.sendQuery = (queryMethod, ...queryMethodArguments) => {
  if (!queryMethod) {
    throw new TypeError(
      "QueryableWorker.sendQuery takes at least one argument",
    );
  }
  worker.postMessage({
    queryMethod,
    queryMethodArguments,
  });
};
```

Chúng ta hoàn thành QueryableWorker với phương thức `onmessage`. Nếu worker có các phương thức tương ứng mà chúng ta đã truy vấn, nó sẽ trả về tên của listener tương ứng và các đối số nó cần, chúng ta chỉ cần tìm nó trong `listeners`:

```js
worker.onmessage = (event) => {
  if (
    event.data instanceof Object &&
    Object.hasOwn(event.data, "queryMethodListener") &&
    Object.hasOwn(event.data, "queryMethodArguments")
  ) {
    listeners[event.data.queryMethodListener].apply(
      this,
      event.data.queryMethodArguments,
    );
  } else {
    this.defaultListener(event.data);
  }
};
```

Bây giờ đến worker. Đầu tiên chúng ta cần có các phương thức để xử lý hai hoạt động đơn giản:

```js
const queryableFunctions = {
  getDifference(a, b) {
    reply("printStuff", a - b);
  },
  waitSomeTime() {
    setTimeout(() => {
      reply("doAlert", 3, "seconds");
    }, 3000);
  },
};

function reply(queryMethodListener, ...queryMethodArguments) {
  if (!queryMethodListener) {
    throw new TypeError("reply - takes at least one argument");
  }
  postMessage({
    queryMethodListener,
    queryMethodArguments,
  });
}

// Phương thức này được gọi khi trang chính gọi phương thức postMessage
// của QueryWorker trực tiếp
function defaultReply(message) {
  // làm gì đó
}
```

Và phương thức `onmessage` bây giờ rất đơn giản:

```js
onmessage = (event) => {
  if (
    event.data instanceof Object &&
    Object.hasOwn(event.data, "queryMethod") &&
    Object.hasOwn(event.data, "queryMethodArguments")
  ) {
    queryableFunctions[event.data.queryMethod].apply(
      self,
      event.data.queryMethodArguments,
    );
  } else {
    defaultReply(event.data);
  }
};
```

Đây là các triển khai đầy đủ:

**example.html** (trang chính):

```html
<ul>
  <li>
    <button id="first-action">Hiệu giữa 5 và 3 là bao nhiêu?</button>
  </li>
  <li>
    <button id="second-action">Đợi 3 giây</button>
  </li>
  <li>
    <button id="terminate">terminate() Worker</button>
  </li>
</ul>
```

Nó cần thực thi script sau, hoặc inline hoặc dưới dạng tệp bên ngoài:

```js
// Các phương thức instances của QueryableWorker:
//   * sendQuery(tên hàm có thể truy vấn, đối số cần truyền 1, đối số cần truyền 2, v.v.): gọi một hàm có thể truy vấn của Worker
//   * postMessage(Chuỗi hoặc Dữ liệu JSON): xem Worker.prototype.postMessage()
//   * terminate(): chấm dứt Worker
//   * addListener(name, function): thêm một listener
//   * removeListener(name): xóa một listener
// Các thuộc tính instances của QueryableWorker:
//   * defaultListener: listener mặc định được thực thi chỉ khi Worker gọi hàm postMessage() trực tiếp
function QueryableWorker(url, defaultListener, onError) {
  const worker = new Worker(url);
  const listeners = {};

  this.defaultListener = defaultListener ?? (() => {});

  if (onError) {
    worker.onerror = onError;
  }

  this.postMessage = (message) => {
    worker.postMessage(message);
  };

  this.terminate = () => {
    worker.terminate();
  };

  this.addListener = (name, listener) => {
    listeners[name] = listener;
  };

  this.removeListener = (name) => {
    delete listeners[name];
  };

  // Hàm này lấy ít nhất một đối số, tên phương thức chúng ta muốn truy vấn.
  // Sau đó chúng ta có thể truyền vào các đối số mà phương thức cần.
  this.sendQuery = (queryMethod, ...queryMethodArguments) => {
    if (!queryMethod) {
      throw new TypeError(
        "QueryableWorker.sendQuery takes at least one argument",
      );
    }
    worker.postMessage({
      queryMethod,
      queryMethodArguments,
    });
  };

  worker.onmessage = (event) => {
    if (
      event.data instanceof Object &&
      Object.hasOwn(event.data, "queryMethodListener") &&
      Object.hasOwn(event.data, "queryMethodArguments")
    ) {
      listeners[event.data.queryMethodListener].apply(
        this,
        event.data.queryMethodArguments,
      );
    } else {
      this.defaultListener(event.data);
    }
  };
}

// "queryable" worker tùy chỉnh của bạn
const myTask = new QueryableWorker("my_task.js");

// "listeners" tùy chỉnh của bạn
myTask.addListener("printStuff", (result) => {
  document
    .getElementById("firstLink")
    .parentNode.appendChild(
      document.createTextNode(`Hiệu là ${result}!`),
    );
});

myTask.addListener("doAlert", (time, unit) => {
  alert(`Worker đã đợi trong ${time} ${unit} :-)`);
});

document.getElementById("first-action").addEventListener("click", () => {
  myTask.sendQuery("getDifference", 5, 3);
});
document.getElementById("second-action").addEventListener("click", () => {
  myTask.sendQuery("waitSomeTime");
});
document.getElementById("terminate").addEventListener("click", () => {
  myTask.terminate();
});
```

**my_task.js** (worker):

```js
const queryableFunctions = {
  // ví dụ #1: lấy hiệu giữa hai số:
  getDifference(minuend, subtrahend) {
    reply("printStuff", minuend - subtrahend);
  },

  // ví dụ #2: đợi ba giây
  waitSomeTime() {
    setTimeout(() => {
      reply("doAlert", 3, "seconds");
    }, 3000);
  },
};

// các hàm hệ thống

function defaultReply(message) {
  // mặc định của bạn...
}

function reply(queryMethodListener, ...queryMethodArguments) {
  if (!queryMethodListener) {
    throw new TypeError("reply - takes at least one argument");
  }
  postMessage({
    queryMethodListener,
    queryMethodArguments,
  });
}

onmessage = (event) => {
  if (
    event.data instanceof Object &&
    Object.hasOwn(event.data, "queryMethod") &&
    Object.hasOwn(event.data, "queryMethodArguments")
  ) {
    queryableFunctions[event.data.queryMethod].apply(
      self,
      event.data.queryMethodArguments,
    );
  } else {
    defaultReply(event.data);
  }
};
```

## Chia sẻ dữ liệu

Như đã đề cập trước đó, dữ liệu được truyền giữa thread chính và workers thường được sao chép. Tuy nhiên, cũng có thể _chia sẻ_ dữ liệu giữa chúng bằng cách sử dụng {{JSxRef("SharedArrayBuffer")}} và {{JSxRef("Atomics")}}.

{{JSxRef("SharedArrayBuffer")}} được sử dụng để đại diện cho một vùng bộ đệm có kích thước cố định, có thể được chia sẻ giữa nhiều workers và thread chính. {{JSxRef("Atomics")}} cung cấp các hoạt động nguyên tử để thực hiện các hoạt động đọc/ghi an toàn trên bộ nhớ được chia sẻ.

> [!NOTE]
> `SharedArrayBuffer` chỉ khả dụng trong các ngữ cảnh secure contexts và khi trang được cross-origin isolated. Xem {{domxref("WorkerGlobalScope.crossOriginIsolated")}} để biết chi tiết.

## Đặc tả kỹ thuật

{{Specifications}}

## Xem thêm

- [Web Workers API](/en-US/docs/Web/API/Web_Workers_API)
- {{domxref("Worker")}}
- {{domxref("SharedWorker")}}
- [Service Workers](/en-US/docs/Web/API/Service_Worker_API)
