---
title: Sử dụng server-sent events
slug: Web/API/Server-sent_events/Using_server-sent_events
page-type: guide
browser-compat: api.EventSource
---

{{DefaultAPISidebar("Server Sent Events")}}

Phát triển ứng dụng web sử dụng [server-sent events](/en-US/docs/Web/API/Server-sent_events) khá đơn giản. Bạn cần một chút mã ở phía server để truyền phát sự kiện đến front-end, nhưng mã phía client hoạt động gần như giống hệt [websockets](/en-US/docs/Web/API/WebSockets_API) trong phần xử lý các sự kiện đến. Đây là kết nối một chiều, vì vậy bạn không thể gửi sự kiện từ client đến server.

## Nhận sự kiện từ server

API server-sent event được chứa trong giao diện {{domxref("EventSource")}}.

### Tạo phiên bản `EventSource`

Để mở kết nối đến server và bắt đầu nhận sự kiện từ nó, hãy tạo đối tượng `EventSource` mới với URL của script tạo sự kiện. Ví dụ:

```js
const evtSource = new EventSource("sse-demo.php");
```

Nếu script tạo sự kiện được lưu trữ trên nguồn gốc khác, đối tượng `EventSource` mới nên được tạo với cả URL và từ điển tùy chọn. Ví dụ, giả sử script client là trên `example.com`:

```js
const evtSource = new EventSource("//api.example.com/sse-demo.php", {
  withCredentials: true,
});
```

### Lắng nghe sự kiện `message`

Các thông điệp được gửi từ server không có trường [`event`](#event) được nhận dưới dạng sự kiện `message`. Để nhận sự kiện message, gắn handler cho sự kiện {{domxref("EventSource.message_event", "message")}}:

```js
evtSource.onmessage = (event) => {
  const newElement = document.createElement("li");
  const eventList = document.getElementById("list");

  newElement.textContent = `message: ${event.data}`;
  eventList.appendChild(newElement);
};
```

Mã này lắng nghe các sự kiện message đến và thêm văn bản thông điệp vào danh sách trong HTML của tài liệu.

### Lắng nghe sự kiện tùy chỉnh

Các thông điệp từ server có trường `event` được định nghĩa sẽ được nhận dưới dạng sự kiện với tên được cung cấp trong `event`. Ví dụ:

```js
evtSource.addEventListener("ping", (event) => {
  const newElement = document.createElement("li");
  const eventList = document.getElementById("list");
  const time = JSON.parse(event.data).time;
  newElement.textContent = `ping at ${time}`;
  eventList.appendChild(newElement);
});
```

Mã này sẽ được gọi bất cứ khi nào server gửi thông điệp với trường `event` được đặt thành `ping`; sau đó nó phân tích JSON trong trường `data` và xuất thông tin đó.

> [!WARNING]
> Khi **không sử dụng qua HTTP/2**, SSE gặp giới hạn về số lượng kết nối mở tối đa, điều này có thể đặc biệt khó chịu khi mở nhiều tab, vì giới hạn _theo trình duyệt_ và được đặt ở số rất thấp (6). Khi sử dụng HTTP/2, số lượng _HTTP streams_ đồng thời tối đa được thương lượng giữa server và client (mặc định là 100).

## Gửi sự kiện từ server

Script phía server gửi sự kiện cần phản hồi bằng MIME type `text/event-stream`. Mỗi thông báo được gửi dưới dạng khối văn bản kết thúc bởi một cặp dòng mới. Để biết chi tiết về định dạng của event stream, xem [Định dạng event stream](#event_stream_format).

Mã {{Glossary("PHP")}} cho ví dụ chúng ta đang sử dụng ở đây như sau:

```php
date_default_timezone_set("America/New_York");
header("X-Accel-Buffering: no");
header("Content-Type: text/event-stream");
header("Cache-Control: no-cache");

$counter = rand(1, 10);
while (true) {
  // Mỗi giây, gửi sự kiện "ping".

  echo "event: ping\n";
  $curDate = date(DATE_ISO8601);
  echo 'data: {"time": "' . $curDate . '"}';
  echo "\n\n";

  // Gửi thông điệp đơn giản theo khoảng thời gian ngẫu nhiên.

  $counter--;

  if (!$counter) {
    echo 'data: This is a message at time ' . $curDate . "\n\n";
    $counter = rand(1, 10);
  }

  if (ob_get_contents()) {
      ob_end_flush();
  }
  flush();

  // Thoát vòng lặp nếu client đã hủy kết nối (đóng trang)

  if (connection_aborted()) break;

  sleep(1);
}
```

Mã trên tạo một sự kiện mỗi giây, với loại sự kiện "ping". Dữ liệu của mỗi sự kiện là đối tượng JSON chứa timestamp ISO 8601 tương ứng với thời gian sự kiện được tạo.

> [!NOTE]
> Bạn có thể tìm ví dụ đầy đủ sử dụng mã hiển thị trong bài viết này trên GitHub, xem [Simple SSE demo using PHP](https://github.com/mdn/dom-examples/tree/main/server-sent-events).

## Xử lý lỗi

Khi xảy ra lỗi (như timeout mạng), một sự kiện lỗi được tạo ra. Bạn có thể xử lý lỗi lập trình bằng cách triển khai callback `onerror` trên đối tượng `EventSource`:

```js
evtSource.onerror = (err) => {
  console.error("EventSource failed:", err);
};
```

## Đóng event stream

Theo mặc định, nếu kết nối giữa client và server đóng, kết nối sẽ được khởi động lại. Kết nối được kết thúc bằng phương thức `.close()`.

```js
evtSource.close();
```

## Định dạng event stream

Event stream là luồng dữ liệu văn bản đơn giản phải được mã hóa bằng [UTF-8](/en-US/docs/Glossary/UTF-8). Các thông điệp trong event stream được phân tách bởi một cặp ký tự dòng mới. Dấu hai chấm ở đầu dòng về cơ bản là bình luận và bị bỏ qua.

> [!NOTE]
> Dòng bình luận có thể được dùng để ngăn kết nối bị timeout; server có thể gửi bình luận định kỳ để giữ kết nối sống.

Mỗi thông điệp gồm một hoặc nhiều dòng văn bản liệt kê các trường của thông điệp đó. Mỗi trường được đại diện bởi tên trường, theo sau là dấu hai chấm, theo sau là dữ liệu văn bản cho giá trị của trường đó.

### Các trường

Mỗi thông điệp nhận được có một số kết hợp các trường sau, mỗi trường trên một dòng:

- `event`
  - : Chuỗi xác định loại sự kiện được mô tả. Nếu được chỉ định, một sự kiện sẽ được gửi trong trình duyệt đến listener cho tên sự kiện được chỉ định; mã nguồn trang web nên sử dụng `addEventListener()` để lắng nghe các sự kiện được đặt tên. Handler `onmessage` được gọi nếu không có tên sự kiện nào được chỉ định cho thông điệp.
- `data`
  - : Trường dữ liệu cho thông điệp. Khi `EventSource` nhận nhiều dòng liên tiếp bắt đầu bằng `data:`, nó sẽ nối chúng lại, chèn ký tự dòng mới giữa mỗi dòng.
- `id`
  - : ID sự kiện để đặt giá trị ID sự kiện cuối cùng của đối tượng [`EventSource`](/en-US/docs/Web/API/EventSource).
- `retry`
  - : Thời gian kết nối lại. Nếu kết nối đến server bị mất, trình duyệt sẽ đợi thời gian được chỉ định trước khi cố gắng kết nối lại. Đây phải là số nguyên, chỉ định thời gian kết nối lại tính bằng mili giây.

Tất cả các tên trường khác bị bỏ qua.

### Ví dụ

#### Thông điệp chỉ dữ liệu

Trong ví dụ sau, có ba thông điệp được gửi. Thông điệp đầu tiên chỉ là bình luận, vì nó bắt đầu bằng dấu hai chấm. Thông điệp thứ hai chứa trường dữ liệu với giá trị "some text". Thông điệp thứ ba chứa trường dữ liệu với giá trị "another message\nwith two lines".

```bash
: this is a test stream

data: some text

data: another message
data: with two lines
```

#### Sự kiện được đặt tên

Ví dụ này gửi các sự kiện được đặt tên. Mỗi sự kiện có tên được chỉ định bởi trường `event` và trường `data` có giá trị là chuỗi JSON phù hợp.

```bash
event: userconnect
data: {"username": "bobby", "time": "02:33:48"}

event: usermessage
data: {"username": "bobby", "time": "02:34:11", "text": "Hi everyone."}

event: userdisconnect
data: {"username": "bobby", "time": "02:34:23"}

event: usermessage
data: {"username": "sean", "time": "02:34:36", "text": "Bye, bobby."}
```

#### Kết hợp

Bạn không phải chỉ sử dụng thông điệp không tên hoặc sự kiện có loại; bạn có thể trộn chúng trong một event stream duy nhất.

```bash
event: userconnect
data: {"username": "bobby", "time": "02:33:48"}

data: Here's a system message of some kind that will get used
data: to accomplish some task.

event: usermessage
data: {"username": "bobby", "time": "02:34:11", "text": "Hi everyone."}
```

## Tương thích trình duyệt

{{Compat}}
