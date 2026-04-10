---
title: Dùng WebSocketStream để viết máy khách
slug: Web/API/WebSockets_API/Using_WebSocketStream
page-type: guide
---

{{DefaultAPISidebar("WebSockets API")}}

API {{domxref("WebSocketStream")}} là một lựa chọn thay thế dựa trên {{jsxref("Promise")}} cho {{domxref("WebSocket")}} khi tạo và sử dụng các kết nối WebSocket phía máy khách. `WebSocketStream` dùng [Streams API](/en-US/docs/Web/API/Streams_API) để xử lý việc nhận và gửi thông điệp, nghĩa là các kết nối socket có thể tự động tận dụng [backpressure](/en-US/docs/Web/API/Streams_API/Concepts#backpressure) của luồng mà không cần hành động bổ sung nào từ nhà phát triển, điều chỉnh tốc độ đọc hoặc ghi để tránh nghẽn trong ứng dụng.

Bài viết này giải thích cách dùng API {{domxref("WebSocketStream")}} để tạo một máy khách WebSocket.

## Phát hiện tính năng

Để kiểm tra xem API `WebSocketStream` có được hỗ trợ hay không, bạn có thể dùng đoạn sau:

```js
if ("WebSocketStream" in self) {
  // WebSocketStream is supported
}
```

## Tạo một đối tượng WebSocketStream

Để tạo một máy khách WebSocket, trước hết bạn cần tạo một thể hiện `WebSocketStream` mới bằng hàm dựng {{domxref("WebSocketStream.WebSocketStream", "WebSocketStream()")}}. Ở dạng đơn giản nhất, nó nhận URL của máy chủ WebSocket làm đối số:

```js
const wss = new WebSocketStream("wss://example.com/wss");
```

Nó cũng có thể nhận một đối tượng `options` chứa các giao thức tùy chỉnh và/hoặc một {{domxref("AbortSignal")}}. `AbortSignal` có thể được dùng để hủy nỗ lực kết nối trước khi [handshake](/en-US/docs/Web/API/WebSockets_API/Writing_WebSocket_servers#the_websocket_handshake) hoàn tất, tức là trước khi promise {{domxref("WebSocketStream.opened", "opened")}} được thực thi xong. Cách này thường được dùng để triển khai thời gian chờ kết nối. Ví dụ, đoạn mã sau sẽ hết thời gian chờ nếu handshake mất hơn 5 giây để hoàn tất:

```js
const controller = new AbortController();
const queueWSS = new WebSocketStream("wss://example.com/queue", {
  protocols: ["amqp", "mqtt"],
  signal: AbortSignal.timeout(5000),
});
```

## Gửi và nhận dữ liệu

Thể hiện `WebSocketStream` có thuộc tính {{domxref("WebSocketStream.opened", "opened")}} — thuộc tính này trả về một promise hoàn tất với một đối tượng chứa một thể hiện {{domxref("ReadableStream")}} và một thể hiện {{domxref("WritableStream")}} khi kết nối WebSocket được mở thành công:

```js
const { readable, writable } = await wss.opened;
```

Gọi {{domxref("ReadableStream.getReader", "getReader()")}} và {{domxref("WritableStream.getWriter", "getWriter()")}} trên các đối tượng này sẽ cho ta lần lượt một {{domxref("ReadableStreamDefaultReader")}} và một {{domxref("WritableStreamDefaultWriter")}}, có thể dùng để đọc từ và ghi vào kết nối socket:

```js
const reader = readable.getReader();
const writer = writable.getWriter();
```

Để ghi dữ liệu vào socket, bạn có thể dùng {{domxref("WritableStreamDefaultWriter.write()")}}:

```js
writer.write("My message");
```

Để đọc dữ liệu từ socket, bạn có thể liên tục gọi {{domxref("ReadableStreamDefaultReader.read()")}} cho đến khi luồng kết thúc, điều này được biểu thị bằng việc `done` có giá trị `true`:

```js
while (true) {
  const { value, done } = await reader.read();
  if (done) {
    break;
  }

  // Process value in some way
}
```

Trình duyệt tự động kiểm soát tốc độ mà máy khách nhận và gửi dữ liệu bằng cách áp dụng backpressure khi cần. Nếu dữ liệu đến nhanh hơn tốc độ máy khách có thể `read()` nó, Streams API bên dưới sẽ tạo áp lực ngược lên máy chủ. Ngoài ra, các thao tác `write()` chỉ tiếp tục nếu điều đó an toàn.

## Đóng kết nối

Để đóng một kết nối, gọi phương thức {{domxref("WebSocketStream.close()")}}, tùy chọn truyền vào một [mã đóng](/en-US/docs/Web/API/CloseEvent/code#value) và lý do:

```js
wss.close({
  closeCode: 4000,
  reason: "Night draws to a close",
});
```

> [!NOTE]
> Tùy thuộc vào cấu hình máy chủ và mã trạng thái bạn dùng, máy chủ có thể chọn bỏ qua mã tùy chỉnh để ưu tiên một mã hợp lệ phù hợp với lý do đóng.

Việc đóng {{domxref("WritableStream")}} hoặc {{domxref("WritableStreamDefaultWriter")}} bên dưới cũng sẽ đóng kết nối.

Để xử lý việc kết nối đóng lại, hãy chờ promise {{domxref("WebSocketStream.closed", "closed")}} được thực thi:

```js
const { closeCode, reason } = await wss.closed;
```

## Một máy khách mẫu hoàn chỉnh

Để minh họa cách dùng cơ bản của `WebSocketStream`, chúng tôi đã tạo một máy khách mẫu. Bạn có thể xem [toàn bộ mã nguồn](#full_listing) ở cuối bài viết và theo dõi phần giải thích bên dưới.

> [!NOTE]
> Để ví dụ hoạt động, bạn cũng cần một thành phần máy chủ. Chúng tôi viết máy khách để hoạt động cùng với máy chủ Deno được giải thích trong [Viết máy chủ WebSocket bằng JavaScript (Deno)](/en-US/docs/Web/API/WebSockets_API/Writing_a_WebSocket_server_in_JavaScript_Deno), nhưng bất kỳ máy chủ tương thích nào cũng sẽ hoạt động.

HTML cho bản demo như sau. Nó bao gồm các phần tử thông tin [`<h2>`](/en-US/docs/Web/HTML/Reference/Elements/Heading_Elements) và {{htmlelement("p")}}, một {{htmlelement("button")}} để đóng kết nối WebSocket ban đầu bị vô hiệu hóa, và một {{htmlelement("div")}} để chúng ta ghi thông điệp đầu ra vào đó.

```html
<h2>WebSocketStream Test</h2>
<p>Sends a ping every five seconds</p>
<button id="close" disabled>Close socket connection</button>
<div id="output"></div>
```

Giờ đến phần JavaScript. Trước tiên chúng ta lấy các tham chiếu tới `<div>` đầu ra và nút `<button>` đóng, rồi định nghĩa một hàm tiện ích ghi thông điệp vào `<div>`:

```js
const output = document.querySelector("#output");
const closeBtn = document.querySelector("#close");

function writeToScreen(message) {
  const pElem = document.createElement("p");
  pElem.textContent = message;
  output.appendChild(pElem);
}

if (!("WebSocketStream" in self)) {
  writeToScreen("Trình duyệt của bạn không hỗ trợ WebSocketStream");
} else {
  const wsURL = "ws://127.0.0.1/";
  const wss = new WebSocketStream(wsURL);

  console.log(wss.url);

  async function start() {
    const { readable, writable, extensions, protocol } = await wss.opened;
    writeToScreen("ĐÃ KẾT NỐI");
    closeBtn.disabled = false;
    const reader = readable.getReader();
    const writer = writable.getWriter();

    writer.write("ping");
    writeToScreen("ĐÃ GỬI: ping");

    while (true) {
      const { value, done } = await reader.read();
      writeToScreen(`ĐÃ NHẬN: ${value}`);
      if (done) {
        break;
      }

      setTimeout(() => {
        writer.write("ping");
        writeToScreen("ĐÃ GỬI: ping");
      }, 5000);
    }
  }

  start();

  wss.closed.then((result) => {
    writeToScreen(
      `ĐÃ NGẮT KẾT NỐI: mã ${result.closeCode}, thông điệp "${result.reason}"`,
    );
    console.log("Socket closed", result.closeCode, result.reason);
  });

  closeBtn.addEventListener("click", () => {
    wss.close({
      closeCode: 1000,
      reason: "That's all folks",
    });

    closeBtn.disabled = true;
  });
}
```

Tiếp theo, chúng ta tạo một cấu trúc `if...else` để phát hiện tính năng `WebSocketStream` và hiển thị thông báo phù hợp trên các trình duyệt không hỗ trợ:

```js
if (!("WebSocketStream" in self)) {
  writeToScreen("Your browser does not support WebSocketStream");
} else {
  // supporting code path
}
```

Trong nhánh mã hỗ trợ, chúng ta bắt đầu bằng cách định nghĩa một biến chứa URL của máy chủ WebSocket, rồi tạo một thể hiện `WebSocketStream` mới:

```js
const wsURL = "ws://127.0.0.1/";
const wss = new WebSocketStream(wsURL);
```

> [!NOTE]
> Thực hành tốt là dùng WebSocket an toàn (`wss://`) trong các ứng dụng sản xuất. Tuy nhiên, trong bản demo này chúng ta đang kết nối tới localhost, vì vậy ta cần dùng giao thức WebSocket không an toàn (`ws://`) để ví dụ hoạt động.

Phần chính của mã nằm trong hàm `start()`, mà chúng ta định nghĩa rồi gọi ngay lập tức. Chúng ta chờ promise {{domxref("WebSocketStream.opened", "opened")}}, sau đó khi nó hoàn tất thì ghi một thông điệp để cho người dùng biết rằng kết nối thành công và tạo các thể hiện {{domxref("ReadableStreamDefaultReader")}} và {{domxref("WritableStreamDefaultWriter")}} từ các thuộc tính `readable` và `writable` được trả về.

Tiếp theo, chúng ta tạo một hàm `start()` gửi thông điệp `"ping"` tới máy chủ và nhận lại thông điệp `"pong"`, rồi gọi nó. Trong thân hàm, chúng ta chờ promise `wss.opened` và tạo một reader và writer từ các giá trị hoàn tất của nó. Khi socket đã mở, chúng ta thông báo điều đó cho người dùng và bật nút đóng. Tiếp đó, chúng ta `write()` giá trị `"ping"` vào socket và thông báo điều đó cho người dùng. Lúc này, máy chủ sẽ phản hồi bằng thông điệp `"pong"`. Chúng ta chờ `read()` phản hồi, thông báo điều đó cho người dùng, rồi viết thêm một `"ping"` nữa tới máy chủ sau 5 giây. Quá trình này tiếp diễn vô hạn trong vòng lặp `"ping"`/`"pong"`.

```js
async function start() {
  const { readable, writable } = await wss.opened;
  writeToScreen("CONNECTED");
  closeBtn.disabled = false;
  const reader = readable.getReader();
  const writer = writable.getWriter();

  writer.write("ping");
  writeToScreen("SENT: ping");

  while (true) {
    const { value, done } = await reader.read();
    writeToScreen(`RECEIVED: ${value}`);
    if (done) {
      break;
    }

    setTimeout(async () => {
      try {
        await writer.write("ping");
        writeToScreen("SENT: ping");
      } catch (e) {
        writeToScreen(`Error writing to socket: ${e.message}`);
      }
    }, 5000);
  }
}

start();
```

> [!NOTE]
> Hàm {{domxref("Window.setTimeout", "setTimeout()")}} bọc lời gọi `write()` trong một khối [`try...catch`](/en-US/docs/Web/JavaScript/Reference/Statements/try...catch) để xử lý mọi lỗi có thể phát sinh nếu ứng dụng cố ghi vào luồng sau khi nó đã bị đóng.

Giờ chúng ta thêm một đoạn mã kiểu promise để thông báo cho người dùng mã và lý do nếu kết nối WebSocket bị đóng, được biểu thị bằng việc promise {{domxref("WebSocketStream.closed", "closed")}} hoàn tất:

```js
wss.closed.then((result) => {
  writeToScreen(
    `DISCONNECTED: code ${result.closeCode}, message "${result.reason}"`,
  );
  console.log("Socket closed", result.closeCode, result.reason);
});
```

Cuối cùng, chúng ta thêm một trình lắng nghe sự kiện vào nút đóng để đóng kết nối bằng phương thức `close()`, kèm theo mã và lý do tùy chỉnh. Hàm này cũng vô hiệu hóa nút đóng - chúng ta không muốn người dùng nhấn nó sau khi kết nối đã bị đóng.

```js
closeBtn.addEventListener("click", () => {
  wss.close({
    closeCode: 1000,
    reason: "That's all folks",
  });

  closeBtn.disabled = true;
});
```

### Toàn bộ mã nguồn

```js
const output = document.querySelector("#output");
const closeBtn = document.querySelector("#close");

function writeToScreen(message) {
  const pElem = document.createElement("p");
  pElem.textContent = message;
  output.appendChild(pElem);
}

if (!("WebSocketStream" in self)) {
  writeToScreen("Trình duyệt của bạn không hỗ trợ WebSocketStream");
} else {
  const wsURL = "ws://127.0.0.1/";
  const wss = new WebSocketStream(wsURL);

  console.log(wss.url);

  async function start() {
    const { readable, writable, extensions, protocol } = await wss.opened;
    writeToScreen("ĐÃ KẾT NỐI");
    closeBtn.disabled = false;
    const reader = readable.getReader();
    const writer = writable.getWriter();

    writer.write("ping");
    writeToScreen("ĐÃ GỬI: ping");

    while (true) {
      const { value, done } = await reader.read();
      writeToScreen(`ĐÃ NHẬN: ${value}`);
      if (done) {
        break;
      }

      setTimeout(() => {
        writer.write("ping");
        writeToScreen("ĐÃ GỬI: ping");
      }, 5000);
    }
  }

  start();

  wss.closed.then((result) => {
    writeToScreen(
      `ĐÃ NGẮT KẾT NỐI: mã ${result.closeCode}, thông điệp "${result.reason}"`,
    );
    console.log("Socket closed", result.closeCode, result.reason);
  });

  closeBtn.addEventListener("click", () => {
    wss.close({
      closeCode: 1000,
      reason: "That's all folks",
    });

    closeBtn.disabled = true;
  });
}
```
