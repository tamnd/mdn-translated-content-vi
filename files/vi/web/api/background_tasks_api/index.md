---
title: Background Tasks API
slug: Web/API/Background_Tasks_API
page-type: web-api-overview
browser-compat: api.Window.requestIdleCallback
---

{{DefaultAPISidebar("Background Tasks")}}

**Cooperative Scheduling of Background Tasks API** (còn được gọi là Background Tasks API hoặc API `requestIdleCallback()`) cung cấp khả năng đưa các tác vụ vào hàng đợi để tác tử người dùng tự động thực thi khi xác định rằng có thời gian rảnh để làm như vậy.

> [!NOTE]
> API này _không khả dụng_ trong [Web Workers](/en-US/docs/Web/API/Web_Workers_API).

## Khái niệm và cách dùng

Luồng chính của một trình duyệt Web xoay quanh event loop của nó. Đoạn mã này vẽ mọi cập nhật đang chờ cho {{domxref("Document")}} hiện được hiển thị, chạy mọi mã JavaScript mà trang cần chạy, tiếp nhận sự kiện từ các thiết bị nhập liệu và phân phối những sự kiện đó đến các phần tử cần nhận chúng. Ngoài ra, event loop còn xử lý tương tác với hệ điều hành, các cập nhật đối với giao diện người dùng của chính trình duyệt, v.v. Đây là một phần mã cực kỳ bận rộn, và mã JavaScript chính của bạn có thể chạy ngay trong luồng này cùng với tất cả những việc đó. Chắc chắn hầu hết, nếu không phải là tất cả, mã có thể tạo thay đổi cho DOM đều chạy trên luồng chính, vì các thay đổi giao diện người dùng thường chỉ khả dụng trên luồng chính.

Vì xử lý sự kiện và cập nhật màn hình là hai trong số những cách rõ ràng nhất khiến người dùng nhận ra vấn đề hiệu năng, mã của bạn cần là một thành viên tốt của Web và giúp ngăn việc thực thi event loop bị khựng lại. Trước đây, không có cách nào đáng tin cậy để làm điều này ngoài việc viết mã hiệu quả nhất có thể và chuyển càng nhiều công việc càng tốt sang [workers](/en-US/docs/Web/API/Web_Workers_API). {{domxref("Window.requestIdleCallback()")}} cho phép bạn chủ động tham gia để giúp bảo đảm event loop của trình duyệt chạy mượt mà, bằng cách để trình duyệt cho mã của bạn biết nó có thể an toàn dùng bao nhiêu thời gian mà không khiến hệ thống bị giật. Nếu bạn ở trong giới hạn được cung cấp, trải nghiệm của người dùng có thể được cải thiện đáng kể.

### Tận dụng tối đa idle callback

Vì idle callback được thiết kế để mang đến cho mã của bạn một cách hợp tác với event loop nhằm bảo đảm hệ thống được tận dụng tối đa tiềm năng mà không bị quá tải, từ đó gây ra độ trễ hoặc các vấn đề hiệu năng khác, bạn nên cân nhắc kỹ cách sử dụng chúng.

- **Dùng idle callback cho các tác vụ không có mức ưu tiên cao.** Vì bạn không biết đã có bao nhiêu callback được thiết lập, và cũng không biết hệ thống của người dùng bận đến mức nào, nên bạn không biết callback của mình sẽ được chạy thường xuyên ra sao (trừ khi bạn chỉ định `timeout`). Không có gì bảo đảm rằng mỗi lần event loop lặp (hoặc thậm chí mỗi chu kỳ cập nhật màn hình) đều sẽ chạy idle callback nào; nếu event loop dùng hết toàn bộ thời gian khả dụng, bạn sẽ không có cơ hội (một lần nữa, trừ khi bạn đã dùng `timeout`).
- **Idle callback nên cố gắng hết sức để không vượt quá thời gian được cấp.** Mặc dù trình duyệt, mã của bạn và Web nói chung vẫn tiếp tục chạy bình thường nếu bạn vượt quá giới hạn thời gian đã chỉ định (kể cả khi vượt quá _rất nhiều_), giới hạn thời gian này nhằm bảo đảm rằng bạn chừa lại cho hệ thống đủ thời gian để hoàn tất vòng hiện tại của event loop và chuyển sang vòng tiếp theo mà không làm mã khác bị giật hoặc hiệu ứng hoạt ảnh bị trễ. Hiện tại, {{domxref("IdleDeadline.timeRemaining", "timeRemaining()")}} có giới hạn trên là 50 mili giây, nhưng trên thực tế bạn thường có ít thời gian hơn mức đó, vì event loop trên các trang phức tạp có thể đã chiếm bớt thời gian, các tiện ích mở rộng của trình duyệt cũng cần thời gian xử lý, v.v.
- **Tránh tạo thay đổi cho DOM bên trong idle callback của bạn.** Vào thời điểm callback của bạn chạy, khung hình hiện tại đã vẽ xong, và mọi cập nhật cũng như phép tính bố cục đều đã hoàn tất. Nếu bạn tạo các thay đổi ảnh hưởng đến bố cục, bạn có thể buộc trình duyệt phải dừng lại và tính toán lại trong khi lẽ ra điều đó là không cần thiết. Nếu callback của bạn cần thay đổi DOM, nó nên dùng {{domxref("Window.requestAnimationFrame()")}} để lên lịch cho việc đó.
- **Tránh các tác vụ có thời lượng chạy không thể dự đoán trước.** Idle callback của bạn nên tránh làm bất cứ điều gì có thể mất lượng thời gian không dự đoán được. Ví dụ, nên tránh mọi thứ có thể ảnh hưởng đến bố cục. Bạn cũng nên tránh resolve hoặc reject {{jsxref("Promise")}}, vì điều đó sẽ gọi trình xử lý cho việc resolve hoặc reject promise đó ngay khi callback của bạn trả về.
- **Dùng timeout khi cần, nhưng chỉ khi thực sự cần.** Việc dùng timeout có thể bảo đảm mã của bạn được chạy đúng lúc, nhưng nó cũng có thể khiến bạn gây ra độ trễ hoặc hoạt ảnh bị giật do buộc trình duyệt phải gọi bạn khi không còn đủ thời gian để bạn chạy mà không làm ảnh hưởng hiệu năng.

## Giao diện

Background Tasks API chỉ bổ sung một giao diện mới:

- {{domxref("IdleDeadline")}}
  - : Một đối tượng kiểu này được truyền vào idle callback để cung cấp ước lượng khoảng thời gian nhàn rỗi dự kiến sẽ kéo dài bao lâu, cũng như liệu callback có đang chạy vì thời gian chờ của nó đã hết hạn hay không.

Giao diện {{domxref("Window")}} cũng được API này mở rộng để cung cấp các phương thức mới là {{domxref("window.requestIdleCallback", "requestIdleCallback()")}} và {{domxref("window.cancelIdleCallback", "cancelIdleCallback()")}}.

## Ví dụ

Trong ví dụ này, chúng ta sẽ xem cách bạn có thể dùng {{domxref("window.requestIdleCallback", "requestIdleCallback()")}} để chạy các tác vụ tốn thời gian nhưng có mức ưu tiên thấp trong lúc trình duyệt lẽ ra đang rảnh. Ngoài ra, ví dụ này cũng minh họa cách lên lịch cập nhật nội dung tài liệu bằng {{domxref("window.requestAnimationFrame", "requestAnimationFrame()")}}.

Dưới đây bạn sẽ chỉ thấy HTML và JavaScript cho ví dụ này. CSS không được hiển thị vì nó không thực sự quan trọng để hiểu chức năng này.

### HTML

Để định hướng rõ hơn về điều mà chúng ta đang cố thực hiện, hãy xem qua HTML. Nó thiết lập một hộp (`id="container"`) dùng để trình bày tiến trình của một thao tác (vì rốt cuộc bạn không bao giờ biết việc giải mã "phát xạ tachyon sợi lượng tử" sẽ mất bao lâu) cũng như một hộp chính thứ hai (`id="logBox"`), dùng để hiển thị đầu ra dạng văn bản.

```html
<p>
  Demonstration of using cooperatively scheduled background tasks using the
  <code>requestIdleCallback()</code> method.
</p>

<div id="container">
  <div class="label">Decoding quantum filament tachyon emissions…</div>

  <progress id="progress" value="0"></progress>

  <button class="button" id="startButton">Start</button>

  <div class="label counter">
    Task <span id="currentTaskNumber">0</span> of
    <span id="totalTaskCount">0</span>
  </div>
</div>

<div id="logBox">
  <div class="logHeader">Log</div>
  <div id="log"></div>
</div>
```

Hộp tiến trình dùng phần tử {{HTMLElement("progress")}} để hiển thị tiến độ, cùng với một nhãn có các phần sẽ được thay đổi để trình bày thông tin số về tiến trình. Ngoài ra còn có một nút "Start" (được đặt ID một cách đầy sáng tạo là "startButton"), nút mà người dùng sẽ dùng để bắt đầu xử lý dữ liệu.

```css hidden
body {
  font-family: "Open Sans", "Lucida Grande", "Arial", sans-serif;
  font-size: 16px;
}

#logBox {
  margin-top: 16px;
  width: 400px;
  height: 500px;
  border-radius: 6px;
  border: 1px solid black;
  box-shadow: 4px 4px 2px black;
}

.logHeader {
  margin: 0;
  padding: 0 6px 4px;
  height: 22px;
  background-color: lightblue;
  border-bottom: 1px solid black;
  border-radius: 6px 6px 0 0;
}

#log {
  font:
    12px "Courier",
    monospace;
  padding: 6px;
  overflow: auto;
  overflow-y: scroll;
  width: 388px;
  height: 460px;
}

#container {
  width: 400px;
  padding: 6px;
  border-radius: 6px;
  border: 1px solid black;
  box-shadow: 4px 4px 2px black;
  display: block;
  overflow: auto;
}

.label {
  display: inline-block;
}

.counter {
  text-align: right;
  padding-top: 4px;
  float: right;
}

.button {
  padding-top: 2px;
  padding-bottom: 4px;
  width: 100px;
  display: inline-block;
  float: left;
  border: 1px solid black;
  cursor: pointer;
  text-align: center;
  margin-top: 0;
  color: white;
  background-color: darkgreen;
}

#progress {
  width: 100%;
  padding-top: 6px;
}
```

### JavaScript

Bây giờ khi cấu trúc tài liệu đã được xác định, hãy xây dựng mã JavaScript sẽ thực hiện công việc. Mục tiêu là có thể thêm các yêu cầu gọi hàm vào một hàng đợi, với một idle callback sẽ chạy các hàm đó bất cứ khi nào hệ thống đủ rảnh trong một khoảng thời gian đủ dài để tạo ra tiến triển.

#### Khai báo biến

```js
const taskList = [];
let totalTaskCount = 0;
let currentTaskNumber = 0;
let taskHandle = null;
```

Những biến này được dùng để quản lý danh sách các tác vụ đang chờ được thực hiện, cũng như thông tin trạng thái về hàng đợi tác vụ và việc thực thi của nó:

- `taskList` là một {{jsxref("Array")}} chứa các đối tượng, trong đó mỗi đối tượng biểu diễn một tác vụ đang chờ chạy.
- `totalTaskCount` là bộ đếm số tác vụ đã được thêm vào hàng đợi; nó chỉ tăng lên chứ không bao giờ giảm xuống. Chúng ta dùng nó để tính toán nhằm hiển thị tiến trình dưới dạng phần trăm của tổng công việc cần làm.
- `currentTaskNumber` được dùng để theo dõi đã có bao nhiêu tác vụ được xử lý cho đến thời điểm hiện tại.
- `taskHandle` là tham chiếu đến tác vụ hiện đang được xử lý.

```js
const totalTaskCountElem = document.getElementById("totalTaskCount");
const currentTaskNumberElem = document.getElementById("currentTaskNumber");
const progressBarElem = document.getElementById("progress");
const startButtonElem = document.getElementById("startButton");
const logElem = document.getElementById("log");
```

Tiếp theo là các biến tham chiếu đến những phần tử DOM mà chúng ta cần tương tác. Các phần tử đó là:

- `totalTaskCountElem` là phần tử {{HTMLElement("span")}} mà chúng ta dùng để chèn tổng số tác vụ đã tạo vào phần hiển thị trạng thái trong hộp tiến trình.
- `currentTaskNumberElem` là phần tử dùng để hiển thị số tác vụ đã được xử lý cho đến thời điểm hiện tại.
- `progressBarElem` là phần tử {{HTMLElement("progress")}} hiển thị phần trăm số tác vụ đã được xử lý cho đến thời điểm hiện tại.
- `startButtonElem` là nút bắt đầu.
- `logElem` là phần tử {{HTMLElement("div")}} mà chúng ta sẽ chèn các thông báo nhật ký vào.

```js
let logFragment = null;
let statusRefreshScheduled = false;
```

Cuối cùng, chúng ta thiết lập thêm một vài biến cho các mục khác:

- `logFragment` sẽ được dùng để lưu một {{domxref("DocumentFragment")}} được các hàm ghi nhật ký tạo ra nhằm dựng nội dung sẽ được thêm vào nhật ký khi khung hình hoạt ảnh kế tiếp được vẽ.
- `statusRefreshScheduled` được dùng để theo dõi xem chúng ta đã lên lịch cập nhật hộp hiển thị trạng thái cho khung hình sắp tới hay chưa, để chỉ thực hiện một lần mỗi khung hình.

```js hidden
window.requestIdleCallback ||= (handler) => {
  const startTime = Date.now();

  return setTimeout(() => {
    handler({
      didTimeout: false,
      timeRemaining() {
        return Math.max(0, 50.0 - (Date.now() - startTime));
      },
    });
  }, 1);
};

window.cancelIdleCallback ||= (id) => {
  clearTimeout(id);
};
```

#### Quản lý hàng đợi tác vụ

Tiếp theo, hãy xem cách chúng ta quản lý các tác vụ cần được thực hiện. Chúng ta sẽ làm điều này bằng cách tạo một hàng đợi FIFO gồm các tác vụ, rồi chạy chúng khi thời gian cho phép trong khoảng idle callback.

##### Đưa tác vụ vào hàng đợi

Trước tiên, chúng ta cần một hàm để đưa tác vụ vào hàng đợi cho việc thực thi trong tương lai. Hàm đó, `enqueueTask()`, trông như sau:

```js
function enqueueTask(taskHandler, taskData) {
  taskList.push({
    handler: taskHandler,
    data: taskData,
  });

  totalTaskCount++;

  taskHandle ||= requestIdleCallback(runTaskQueue, { timeout: 1000 });

  scheduleStatusRefresh();
}
```

`enqueueTask()` nhận hai tham số đầu vào:

- `taskHandler` là một hàm sẽ được gọi để xử lý tác vụ.
- `taskData` là một đối tượng được truyền vào hàm xử lý tác vụ như một tham số đầu vào, cho phép tác vụ nhận dữ liệu tùy chỉnh.

Để đưa tác vụ vào hàng đợi, chúng ta [push](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Array/push) một đối tượng vào mảng `taskList`; đối tượng này chứa các giá trị `taskHandler` và `taskData` dưới các tên lần lượt là `handler` và `data`, sau đó tăng `totalTaskCount`, vốn phản ánh tổng số tác vụ từng được đưa vào hàng đợi (chúng ta không giảm nó khi tác vụ bị xóa khỏi hàng đợi).

Tiếp theo, chúng ta kiểm tra xem đã có idle callback nào được tạo hay chưa; nếu `taskHandle` là 0, ta biết chưa có idle callback, nên gọi {{domxref("Window.requestIdleCallback", "requestIdleCallback()")}} để tạo một cái. Nó được cấu hình để gọi một hàm tên là `runTaskQueue()`, mà chúng ta sẽ xem ngay sau đây, với `timeout` là 1 giây, để nó được chạy ít nhất một lần mỗi giây ngay cả khi không có khoảng thời gian rảnh thực sự nào.

##### Chạy tác vụ

Trình xử lý idle callback của chúng ta, `runTaskQueue()`, được gọi khi trình duyệt xác định có đủ thời gian rảnh để cho phép chúng ta làm việc hoặc khi timeout một giây hết hạn. Công việc của hàm này là chạy các tác vụ đã được đưa vào hàng đợi.

```js
function runTaskQueue(deadline) {
  while (
    (deadline.timeRemaining() > 0 || deadline.didTimeout) &&
    taskList.length
  ) {
    const task = taskList.shift();
    currentTaskNumber++;
    task.handler(task.data);
    scheduleStatusRefresh();
  }

  if (taskList.length) {
    taskHandle = requestIdleCallback(runTaskQueue, { timeout: 1000 });
  } else {
    taskHandle = 0;
  }
}
```

Phần lõi của `runTaskQueue()` là một vòng lặp tiếp tục chừng nào vẫn còn thời gian (được xác định bằng cách kiểm tra {{domxref("IdleDeadline.timeRemaining", "deadline.timeRemaining")}} lớn hơn 0 hoặc nếu đã đạt giới hạn timeout ({{domxref("IdleDeadline.didTimeout", "deadline.didTimeout")}} là true)), và chừng nào vẫn còn tác vụ trong danh sách tác vụ.

Đối với mỗi tác vụ trong hàng đợi mà chúng ta có thời gian để thực thi, chúng ta làm như sau:

1. [Loại bỏ đối tượng tác vụ khỏi hàng đợi](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Array/shift).
2. Tăng `currentTaskNumber` để theo dõi đã thực thi bao nhiêu tác vụ.
3. Gọi hàm xử lý của tác vụ, `task.handler`, và truyền vào đó đối tượng dữ liệu của tác vụ (`task.data`).
4. Gọi một hàm, `scheduleStatusRefresh()`, để xử lý việc lên lịch cập nhật màn hình nhằm phản ánh những thay đổi trong tiến trình.

Khi hết thời gian, nếu vẫn còn tác vụ trong danh sách, chúng ta gọi lại {{domxref("Window.requestIdleCallback", "requestIdleCallback()")}} để có thể tiếp tục xử lý tác vụ vào lần tiếp theo có thời gian rảnh. Nếu hàng đợi trống, chúng ta đặt `taskHandle` về 0 để cho biết hiện không có callback nào được lên lịch. Nhờ vậy, chúng ta sẽ biết cần yêu cầu một callback vào lần tiếp theo `enqueueTask()` được gọi.

#### Cập nhật phần hiển thị trạng thái

Một điều chúng ta muốn làm là cập nhật tài liệu với đầu ra nhật ký và thông tin tiến trình. Tuy nhiên, bạn không thể thay đổi DOM một cách an toàn từ bên trong idle callback. Thay vào đó, chúng ta sẽ dùng {{domxref("Window.requestAnimationFrame", "requestAnimationFrame()")}} để yêu cầu trình duyệt gọi chúng ta khi có thể cập nhật phần hiển thị một cách an toàn.

##### Lên lịch cập nhật hiển thị

Các thay đổi DOM được lên lịch bằng cách gọi hàm `scheduleStatusRefresh()`.

```js
function scheduleStatusRefresh() {
  if (!statusRefreshScheduled) {
    requestAnimationFrame(updateDisplay);
    statusRefreshScheduled = true;
  }
}
```

Đây là một hàm đơn giản. Nó kiểm tra xem chúng ta đã lên lịch làm mới phần hiển thị hay chưa bằng cách xem giá trị của `statusRefreshScheduled`. Nếu nó là `false`, chúng ta gọi {{domxref("Window.requestAnimationFrame", "requestAnimationFrame()")}} để lên lịch làm mới, truyền vào hàm `updateDisplay()` để xử lý công việc đó.

##### Cập nhật phần hiển thị

Hàm `updateDisplay()` chịu trách nhiệm vẽ nội dung của hộp tiến trình và nhật ký. Nó được trình duyệt gọi khi DOM ở trong trạng thái an toàn để chúng ta áp dụng thay đổi trong quá trình dựng khung hình kế tiếp.

```js
function updateDisplay() {
  const scrolledToEnd =
    logElem.scrollHeight - logElem.clientHeight <= logElem.scrollTop + 1;

  if (totalTaskCount) {
    if (progressBarElem.max !== totalTaskCount) {
      totalTaskCountElem.textContent = totalTaskCount;
      progressBarElem.max = totalTaskCount;
    }

    if (progressBarElem.value !== currentTaskNumber) {
      currentTaskNumberElem.textContent = currentTaskNumber;
      progressBarElem.value = currentTaskNumber;
    }
  }

  if (logFragment) {
    logElem.appendChild(logFragment);
    logFragment = null;
  }

  if (scrolledToEnd) {
    logElem.scrollTop = logElem.scrollHeight - logElem.clientHeight;
  }

  statusRefreshScheduled = false;
}
```

Đầu tiên, `scrolledToEnd` được đặt thành `true` nếu văn bản trong nhật ký đã được cuộn xuống cuối; nếu không, nó được đặt thành `false`. Chúng ta sẽ dùng điều đó để xác định xem có nên cập nhật vị trí cuộn nhằm bảo đảm nhật ký vẫn ở cuối sau khi hoàn tất việc thêm nội dung hay không.

Tiếp theo, chúng ta cập nhật tiến trình và thông tin trạng thái nếu đã có bất kỳ tác vụ nào được đưa vào hàng đợi.

1. Nếu giá trị tối đa hiện tại của thanh tiến trình khác với tổng số tác vụ hiện tại đã được đưa vào hàng đợi (`totalTaskCount`), thì chúng ta cập nhật nội dung của tổng số tác vụ đang hiển thị (`totalTaskCountElem`) và giá trị tối đa của thanh tiến trình, để nó co giãn đúng cách.
2. Chúng ta làm điều tương tự với số tác vụ đã được xử lý cho đến lúc này; nếu `progressBarElem.value` khác với số thứ tự tác vụ hiện đang được xử lý (`currentTaskNumber`), thì chúng ta cập nhật giá trị đang hiển thị của tác vụ hiện tại và giá trị hiện tại của thanh tiến trình.

Sau đó, nếu có văn bản đang chờ được thêm vào nhật ký (tức là nếu `logFragment` không phải `null`), chúng ta gắn nó vào phần tử nhật ký bằng {{domxref("Node.appendChild", "Element.appendChild()")}} rồi đặt `logFragment` thành `null` để không thêm lại lần nữa.

Nếu nhật ký đã được cuộn đến cuối khi bắt đầu, chúng ta bảo đảm rằng nó vẫn như vậy. Sau đó, chúng ta đặt `statusRefreshScheduled` thành `false` để cho biết đã xử lý xong việc làm mới và có thể an toàn yêu cầu một lần làm mới mới.

#### Thêm văn bản vào nhật ký

Hàm `log()` thêm văn bản được chỉ định vào nhật ký. Vì tại thời điểm `log()` được gọi chúng ta không biết có an toàn để chạm ngay vào DOM hay không, nên chúng ta sẽ lưu đệm văn bản nhật ký cho đến khi việc cập nhật trở nên an toàn. Ở trên, trong mã của `updateDisplay()`, bạn có thể tìm thấy đoạn mã thực sự thêm văn bản đã ghi vào phần tử nhật ký khi khung hình hoạt ảnh đang được cập nhật.

```js
function log(text) {
  logFragment ??= document.createDocumentFragment();
  const el = document.createElement("div");
  el.textContent = text;
  logFragment.appendChild(el);
}
```

Đầu tiên, chúng ta tạo một đối tượng {{domxref("DocumentFragment")}} tên là `logFragment` nếu hiện chưa có. Phần tử này là một pseudo-DOM mà vào đó chúng ta có thể chèn các phần tử mà không làm thay đổi DOM chính ngay lập tức.

Sau đó, chúng ta tạo một phần tử {{HTMLElement("div")}} mới và đặt nội dung của nó khớp với `text` đầu vào.
Rồi chúng ta thêm phần tử mới vào cuối pseudo-DOM trong `logFragment`.
`logFragment` sẽ tích lũy các mục nhật ký cho đến lần tiếp theo `updateDisplay()` được gọi, khi DOM đã sẵn sàng cho các thay đổi.

### Chạy tác vụ

Bây giờ khi đã hoàn thành mã quản lý tác vụ và duy trì phần hiển thị, chúng ta có thể thực sự bắt đầu thiết lập mã để chạy các tác vụ thực hiện công việc.

#### Hàm xử lý tác vụ

Hàm mà chúng ta sẽ dùng làm hàm xử lý tác vụ, tức là hàm sẽ được dùng làm giá trị của thuộc tính `handler` trên đối tượng tác vụ, là `logTaskHandler()`. Đây là một hàm đơn giản xuất một loạt nội dung vào nhật ký cho mỗi tác vụ. Trong ứng dụng của riêng bạn, bạn sẽ thay thế đoạn mã này bằng bất kỳ tác vụ nào bạn muốn thực hiện trong thời gian rảnh. Chỉ cần nhớ rằng bất cứ điều gì bạn muốn làm mà thay đổi DOM đều cần được xử lý thông qua {{domxref("Window.requestAnimationFrame", "requestAnimationFrame()")}}.

```js
function logTaskHandler(data) {
  log(`Running task #${currentTaskNumber}`);

  for (let i = 0; i < data.count; i += 1) {
    log(`${(i + 1).toString()}. ${data.text}`);
  }
}
```

#### Chương trình chính

Mọi thứ được kích hoạt khi người dùng nhấp nút Start, điều này khiến hàm `decodeTechnoStuff()` được gọi.

```js hidden
function getRandomIntInclusive(min, max) {
  min = Math.ceil(min);
  max = Math.floor(max);
  return Math.floor(Math.random() * (max - min + 1)) + min;
}
```

```js
function decodeTechnoStuff() {
  totalTaskCount = 0;
  currentTaskNumber = 0;
  updateDisplay();

  const n = getRandomIntInclusive(100, 200);

  for (let i = 0; i < n; i++) {
    const taskData = {
      count: getRandomIntInclusive(75, 150),
      text: `This text is from task number ${i + 1} of ${n}`,
    };

    enqueueTask(logTaskHandler, taskData);
  }
}

document
  .getElementById("startButton")
  .addEventListener("click", decodeTechnoStuff);
```

`decodeTechnoStuff()` bắt đầu bằng cách đặt về 0 các giá trị của totalTaskCount (số tác vụ đã được thêm vào hàng đợi cho đến thời điểm hiện tại) và currentTaskNumber (tác vụ hiện đang chạy), sau đó gọi `updateDisplay()` để đặt lại phần hiển thị về trạng thái "chưa có gì xảy ra".

Ví dụ này sẽ tạo một số lượng tác vụ ngẫu nhiên (từ 100 đến 200 tác vụ). Để làm điều đó, chúng ta dùng [`hàm getRandomIntInclusive()`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Math/random#getting_a_random_integer_between_two_values_inclusive) được cung cấp làm ví dụ trong tài liệu của {{jsxref("Math.random()")}} để lấy số lượng tác vụ cần tạo.

Sau đó, chúng ta bắt đầu một vòng lặp để tạo các tác vụ thực tế. Với mỗi tác vụ, chúng ta tạo một đối tượng `taskData`, bao gồm hai thuộc tính:

- `count` là số chuỗi cần xuất vào nhật ký từ tác vụ.
- `text` là văn bản cần xuất vào nhật ký số lần được chỉ định bởi `count`.

Mỗi tác vụ sau đó được đưa vào hàng đợi bằng cách gọi `enqueueTask()`, truyền `logTaskHandler()` làm hàm xử lý và đối tượng `taskData` làm đối tượng cần truyền cho hàm khi nó được gọi.

### Kết quả

Dưới đây là kết quả hoạt động thực tế của đoạn mã trên. Hãy thử nó, nghịch nó trong công cụ dành cho nhà phát triển của trình duyệt, và thử nghiệm với việc dùng nó trong mã của riêng bạn.

{{ EmbedLiveSample('Example', 600, 700) }}

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("Window.requestIdleCallback()")}}
- {{domxref("Window.cancelIdleCallback()")}}
- {{domxref("IdleDeadline")}}
