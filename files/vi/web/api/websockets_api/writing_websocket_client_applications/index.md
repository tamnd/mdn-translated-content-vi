---
title: Viết ứng dụng máy khách WebSocket
slug: Web/API/WebSockets_API/Writing_WebSocket_client_applications
page-type: guide
---

{{DefaultAPISidebar("WebSockets API")}}

Trong hướng dẫn này, chúng ta sẽ đi qua cách triển khai một ứng dụng ping dựa trên WebSocket. Trong ứng dụng này, máy khách gửi một thông điệp `"ping"` đến máy chủ mỗi giây, và máy chủ phản hồi bằng một thông điệp `"pong"`. Máy khách lắng nghe các thông điệp `"pong"` và ghi lại chúng, đồng thời theo dõi số lần trao đổi thông điệp đã diễn ra.

Mặc dù đây là một ứng dụng khá tối giản, nó vẫn bao quát những điểm cốt lõi khi viết một máy khách WebSocket.

Bạn có thể tìm thấy ví dụ hoàn chỉnh tại [https://github.com/mdn/dom-examples/tree/main/websockets](https://github.com/mdn/dom-examples/tree/main/websockets). Phần máy chủ được viết bằng [Deno](https://deno.com/), vì vậy bạn sẽ cần cài đặt nó trước nếu muốn chạy ví dụ cục bộ.

## Tạo một đối tượng `WebSocket`

Để giao tiếp bằng giao thức WebSocket, bạn cần tạo một đối tượng {{domxref("WebSocket")}}. Ngay khi tạo đối tượng này, nó sẽ bắt đầu cố gắng kết nối đến máy chủ đã chỉ định.

```js
const wsUri = "ws://127.0.0.1/";
const websocket = new WebSocket(wsUri);
```

Hàm dựng `WebSocket` nhận một đối số bắt buộc - URL của máy chủ WebSocket cần kết nối tới. Trong trường hợp này, vì chúng ta đang chạy máy chủ cục bộ, chúng ta dùng địa chỉ localhost.

> [!NOTE]
> Trong ví dụ này, chúng ta dùng giao thức `ws` cho kết nối, vì ví dụ đang kết nối tới localhost. Trong một ứng dụng thực tế, các trang web nên được phục vụ qua HTTPS, và kết nối WebSocket nên dùng `wss` làm giao thức.

Hàm dựng cũng nhận thêm một đối số tùy chọn [`protocols`](/en-US/docs/Web/API/WebSocket/WebSocket#protocols), cho phép một máy chủ duy nhất triển khai nhiều giao thức phụ. Chúng ta không dùng tính năng này trong ví dụ của mình.

Hàm dựng sẽ ném ra `SecurityError` nếu đích đến không cho phép truy cập.
Điều này có thể xảy ra nếu bạn cố dùng một kết nối không an toàn (hiện nay đa số {{Glossary("user agent", "user agent")}} đều yêu cầu một liên kết an toàn cho mọi kết nối WebSocket, trừ khi chúng ở cùng thiết bị hoặc có thể ở cùng mạng).

## Lắng nghe sự kiện `open`

Việc tạo một thể hiện `WebSocket` sẽ bắt đầu quá trình thiết lập kết nối tới máy chủ. Khi kết nối được thiết lập xong, sự kiện {{domxref("WebSocket.open_event", "open")}} sẽ được phát ra, và từ thời điểm này socket có thể truyền dữ liệu.

Trong đoạn mã ví dụ dưới đây, khi sự kiện `open` được phát ra, chúng ta bắt đầu gửi một thông điệp `"ping"` đến máy chủ mỗi giây, bằng API {{domxref("Window.setInterval()")}}:

```js
websocket.addEventListener("open", () => {
  log("CONNECTED");
  pingInterval = setInterval(() => {
    log(`SENT: ping: ${counter}`);
    websocket.send("ping");
  }, 1000);
});
```

## Lắng nghe lỗi

Nếu có lỗi xảy ra trong lúc kết nối đang được thiết lập hoặc bất kỳ lúc nào sau khi nó được thiết lập, sự kiện {{domxref("WebSocket.error_event", "error")}} sẽ được phát ra.

Ứng dụng của chúng ta không làm gì đặc biệt khi có lỗi, nhưng chúng ta có ghi lại nó:

```js
websocket.addEventListener("error", (e) => {
  log(`ERROR`);
});
```

Khi có lỗi, kết nối sẽ bị đóng và sự kiện `close` sẽ được phát ra.

## Gửi thông điệp

Chúng ta đã thấy rằng ngay khi kết nối được thiết lập, ta có thể dùng phương thức {{domxref("WebSocket.send()", "send()")}} để gửi thông điệp đến máy chủ:

```js
websocket.addEventListener("open", () => {
  log("CONNECTED");
  pingInterval = setInterval(() => {
    log(`SENT: ping: ${counter}`);
    websocket.send("ping");
  }, 1000);
});
```

Trong ví dụ của chúng ta, ta gửi văn bản, nhưng bạn cũng có thể gửi dữ liệu nhị phân dưới dạng {{domxref("Blob")}}, {{jsxref("ArrayBuffer")}}, {{jsxref("TypedArray")}}, hoặc {{jsxref("DataView")}}.

Một cách tiếp cận phổ biến là dùng {{glossary("JSON")}} để gửi các đối tượng JavaScript đã được tuần tự hóa dưới dạng văn bản. Ví dụ, thay vì chỉ gửi thông điệp văn bản `"ping"`, máy khách của chúng ta có thể gửi một đối tượng đã tuần tự hóa bao gồm số lượng thông điệp đã trao đổi cho đến hiện tại:

```js
const message = {
  iteration: counter,
  content: "ping",
};
websocket.send(JSON.stringify(message));
```

Phương thức `send()` là bất đồng bộ: nó không đợi dữ liệu được truyền xong trước khi trả về cho lời gọi. Nó chỉ thêm dữ liệu vào bộ đệm nội bộ và bắt đầu quá trình truyền. Thuộc tính {{domxref("WebSocket.bufferedAmount")}} biểu thị số byte vẫn chưa được truyền đi. Lưu ý rằng giao thức WebSocket dùng {{glossary("UTF-8")}} để mã hóa văn bản, vì vậy `bufferedAmount` được tính dựa trên mã hóa UTF-8 của mọi dữ liệu văn bản đang được đệm.

## Nhận thông điệp

Để nhận thông điệp từ máy chủ, ta lắng nghe sự kiện {{domxref("WebSocket.message_event", "message")}}.

Hàm xử lý sự kiện thông điệp của chúng ta ghi lại thông điệp nhận được và tăng bộ đếm số lần trao đổi thông điệp đã diễn ra:

```js
websocket.addEventListener("message", (e) => {
  log(`RECEIVED: ${e.data}: ${counter}`);
  counter++;
});
```

Máy chủ cũng có thể gửi dữ liệu nhị phân, dữ liệu này sẽ được hiển thị cho máy khách dưới dạng {{domxref("Blob")}} hoặc {{jsxref("ArrayBuffer")}}, tùy theo giá trị của thuộc tính {{domxref("WebSocket.binaryType")}}.

Như chúng ta đã thấy khi gửi thông điệp, máy chủ cũng có thể gửi các chuỗi JSON, và máy khách có thể phân tích chúng thành một đối tượng:

```js
websocket.addEventListener("message", (e) => {
  const message = JSON.parse(e.data);
  log(`RECEIVED: ${message.iteration}: ${message.content}`);
  counter++;
});
```

## Xử lý ngắt kết nối

Khi kết nối bị đóng, dù là do máy khách hay máy chủ đóng nó hoặc vì có lỗi xảy ra, sự kiện {{domxref("WebSocket.close_event", "close")}} sẽ được phát ra.

Ứng dụng của chúng ta lắng nghe sự kiện `close` và dọn dẹp bộ hẹn giờ lặp khi nó được phát ra:

```js
websocket.addEventListener("close", () => {
  log("DISCONNECTED");
  clearInterval(pingInterval);
});
```

## Làm việc với bfcache

Back/forward cache, hay {{glossary("bfcache")}}, cho phép điều hướng lùi và tiến giữa các trang mà người dùng đã truy cập gần đây nhanh hơn nhiều. Nó làm điều đó bằng cách lưu trữ một ảnh chụp đầy đủ của trang, bao gồm cả heap JavaScript.

Trình duyệt sẽ tạm dừng rồi tiếp tục thực thi JavaScript khi một trang được thêm vào hoặc khôi phục từ bfcache. Điều đó có nghĩa là, tùy theo việc trang đang làm gì, trình duyệt không phải lúc nào cũng an toàn để dùng bfcache cho trang đó. Nếu trình duyệt xác định rằng không an toàn, trang sẽ không được thêm vào bfcache, và người dùng sẽ không nhận được lợi ích hiệu năng mà nó có thể mang lại.

Các trình duyệt khác nhau dùng tiêu chí khác nhau để thêm một trang vào bfcache, và việc có một kết nối WebSocket đang mở có thể ngăn trình duyệt thêm trang của bạn vào bfcache. Điều này có nghĩa là thực hành tốt là đóng kết nối khi người dùng đã hoàn tất với trang của bạn. Sự kiện tốt nhất để dùng cho việc này là sự kiện {{domxref("Window.pagehide_event", "pagehide")}}.

Chúng ta làm điều này trong ứng dụng ví dụ:

```js
window.addEventListener("pagehide", () => {
  if (websocket) {
    log("CLOSING");
    websocket.close();
    websocket = null;
    window.clearInterval(pingInterval);
  }
});
```

Ngược lại, bằng cách lắng nghe sự kiện {{domxref("Window.pageshow_event", "pageshow")}}, bạn có thể khởi động lại kết nối một cách liền mạch khi trang được khôi phục từ bfcache. Trong ví dụ sau, chúng ta bắt đầu kết nối ban đầu khi trang được tải lần đầu và chỉ kết nối lại khi trang được khôi phục (kiểm tra `event.persisted`):

```js
let websocket = null;

function initializeWebSocketListeners(ws) {
  ws.addEventListener("open", () => {
    log("CONNECTED");
    pingInterval = setInterval(() => {
      log(`SENT: ping: ${counter}`);
      ws.send("ping");
    }, 1000);
  });

  ws.addEventListener("close", () => {
    log("DISCONNECTED");
    clearInterval(pingInterval);
  });

  ws.addEventListener("message", (e) => {
    log(`RECEIVED: ${e.data}: ${counter}`);
    counter++;
  });

  ws.addEventListener("error", (e) => {
    log(`ERROR`);
  });
}

window.addEventListener("pageshow", (event) => {
  if (event.persisted) {
    websocket = new WebSocket(wsUri);
    initializeWebSocketListeners(websocket);
  }
});

log("OPENING");
websocket = new WebSocket(wsUri);
initializeWebSocketListeners(websocket);
```

Nếu bạn chạy ví dụ của chúng ta, hãy thử điều hướng sang một trang khác rồi quay lại ví dụ. Trong Chrome, bạn sẽ thấy ví dụ bắt đầu lại kết nối và vẫn giữ nguyên ngữ cảnh ban đầu của nó: chẳng hạn, nó vẫn nhớ số lượng thông điệp đã trao đổi.

Xem [bài viết web.dev về bfcache](https://web.dev/articles/bfcache#close-open-connections) để có thêm bối cảnh về khả năng tương thích với bfcache và API WebSockets.

Trên các trình duyệt hỗ trợ, bạn có thể [dùng thuộc tính `notRestoredReasons` của Performance API](/en-US/docs/Web/API/Performance_API/Monitoring_bfcache_blocking_reasons) để biết lý do một trang không được thêm vào bfcache.

## Các cân nhắc bảo mật

Không nên dùng WebSocket trong môi trường nội dung hỗn hợp; nghĩa là, bạn không nên mở một kết nối WebSocket không an toàn từ một trang được tải qua HTTPS hoặc ngược lại.
Hiện nay hầu hết trình duyệt chỉ cho phép các kết nối WebSocket an toàn và không còn hỗ trợ dùng chúng trong ngữ cảnh không an toàn.
