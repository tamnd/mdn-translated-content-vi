---
title: EventSource
slug: Web/API/EventSource
page-type: web-api-interface
browser-compat: api.EventSource
---

{{APIRef("Server Sent Events")}}{{AvailableInWorkers}}

Giao diện **`EventSource`** là giao diện mà nội dung web dùng để làm việc với [server-sent events](/en-US/docs/Web/API/Server-sent_events).

Một thể hiện `EventSource` mở một kết nối bền vững đến một máy chủ [HTTP](/en-US/docs/Web/HTTP), máy chủ này sẽ gửi [events](/en-US/docs/Learn_web_development/Core/Scripting/Events) theo định dạng `text/event-stream`. Kết nối sẽ vẫn mở cho đến khi được đóng bằng cách gọi {{domxref("EventSource.close()")}}.

{{InheritanceDiagram}}

Khi kết nối đã mở, các thông điệp đến từ máy chủ sẽ được chuyển đến mã của bạn dưới dạng các sự kiện. Nếu thông điệp đến có trường event, sự kiện được kích hoạt sẽ có cùng giá trị với trường đó. Nếu không có trường event, một sự kiện chung {{domxref("EventSource/message_event", "message")}} sẽ được kích hoạt.

Không giống như [WebSockets](/en-US/docs/Web/API/WebSockets_API), server-sent events là một chiều; nghĩa là các thông điệp dữ liệu chỉ được truyền theo một hướng, từ máy chủ đến client, chẳng hạn như trình duyệt web của người dùng. Điều này khiến chúng trở thành lựa chọn rất phù hợp khi không cần gửi dữ liệu từ client lên máy chủ dưới dạng thông điệp. Ví dụ, `EventSource` là cách hữu ích để xử lý các thứ như cập nhật trạng thái mạng xã hội, luồng tin tức, hoặc đưa dữ liệu vào cơ chế [lưu trữ phía client](/en-US/docs/Learn_web_development/Extensions/Client-side_APIs/Client-side_storage) như [IndexedDB](/en-US/docs/Web/API/IndexedDB_API) hoặc [web storage](/en-US/docs/Web/API/Web_Storage_API).

> [!WARNING]
> Khi **không dùng qua HTTP/2**, SSE gặp giới hạn về số lượng kết nối mở tối đa. Điều này đặc biệt khó chịu khi mở nhiều tab, vì giới hạn này tính _theo trình duyệt_ và được đặt ở mức rất thấp (6). Vấn đề này đã được đánh dấu là "Won't fix" trong [Chrome](https://crbug.com/275955) và [Firefox](https://bugzil.la/906896). Giới hạn này tính theo trình duyệt + miền, nghĩa là bạn có thể mở 6 kết nối SSE trên tất cả các tab tới `www.example1.com` và thêm 6 kết nối SSE khác tới `www.example2.com`. (trích từ [Stack Overflow](https://stackoverflow.com/questions/5195452/websockets-vs-server-sent-events-eventsource/5326159)). Khi dùng HTTP/2, số lượng _HTTP stream_ đồng thời tối đa sẽ được thương lượng giữa máy chủ và client (mặc định là 100).

## Constructor

- {{domxref("EventSource.EventSource", "EventSource()")}}
  - : Tạo một `EventSource` mới để xử lý việc nhận server-sent events từ một URL được chỉ định, tùy chọn kèm chế độ thông tin xác thực.

## Thuộc tính thể hiện

_Giao diện này cũng kế thừa các thuộc tính từ lớp cha của nó, {{domxref("EventTarget")}}._

- {{domxref("EventSource.readyState")}} {{ReadOnlyInline}}
  - : Một số biểu thị trạng thái của kết nối. Các giá trị có thể là `CONNECTING` (`0`), `OPEN` (`1`), hoặc `CLOSED` (`2`).
- {{domxref("EventSource.url")}} {{ReadOnlyInline}}
  - : Một chuỗi biểu thị URL của nguồn.
- {{domxref("EventSource.withCredentials")}} {{ReadOnlyInline}}
  - : Một giá trị boolean cho biết đối tượng `EventSource` được khởi tạo với thông tin xác thực cross-origin ([CORS](/en-US/docs/Web/HTTP/Guides/CORS)) (`true`) hay không (`false`, mặc định).

## Phương thức thể hiện

_Giao diện này cũng kế thừa các phương thức từ lớp cha của nó, {{domxref("EventTarget")}}._

- {{domxref("EventSource.close()")}}
  - : Đóng kết nối, nếu có, và đặt thuộc tính `readyState` thành `CLOSED`. Nếu kết nối đã đóng, phương thức này không làm gì cả.

## Sự kiện

- {{domxref("EventSource/error_event", "error")}}
  - : Được kích hoạt khi kết nối tới nguồn sự kiện không mở được.
- {{domxref("EventSource/message_event", "message")}}
  - : Được kích hoạt khi nhận dữ liệu từ nguồn sự kiện.
- {{domxref("EventSource/open_event", "open")}}
  - : Được kích hoạt khi kết nối tới nguồn sự kiện đã mở.

Ngoài ra, chính nguồn sự kiện còn có thể gửi các thông điệp kèm trường event, điều này sẽ tạo ra các sự kiện động gắn với giá trị đó.

## Ví dụ

Trong ví dụ cơ bản này, một `EventSource` được tạo để nhận các sự kiện không đặt tên từ máy chủ; một trang có tên `sse.php` chịu trách nhiệm tạo ra các sự kiện đó.

```js
const evtSource = new EventSource("sse.php");
const eventList = document.querySelector("ul");

evtSource.onmessage = (e) => {
  const newElement = document.createElement("li");

  newElement.textContent = `message: ${e.data}`;
  eventList.appendChild(newElement);
};
```

Mỗi sự kiện nhận được sẽ khiến trình xử lý sự kiện `onmessage` của đối tượng `EventSource` chạy. Sau đó, nó tạo một phần tử {{HTMLElement("li")}} mới và ghi dữ liệu của thông điệp vào đó, rồi thêm phần tử mới vào danh sách đã có trong tài liệu.

> [!NOTE]
> Bạn có thể tìm thấy một ví dụ đầy đủ trên GitHub, xem [Simple SSE demo using PHP](https://github.com/mdn/dom-examples/tree/main/server-sent-events).

Để lắng nghe các sự kiện có tên, bạn cần một trình nghe cho mỗi kiểu sự kiện được gửi.

```js
const sse = new EventSource("/api/v1/sse");

/*
 * This will listen only for events
 * similar to the following:
 *
 * event: notice
 * data: useful data
 * id: some-id
 */
sse.addEventListener("notice", (e) => {
  console.log(e.data);
});

/*
 * Similarly, this will listen for events
 * with the field `event: update`
 */
sse.addEventListener("update", (e) => {
  console.log(e.data);
});

/*
 * The event "message" is a special case, as it
 * will capture events without an event field
 * as well as events that have the specific type
 * `event: message` It will not trigger on any
 * other event type.
 */
sse.addEventListener("message", (e) => {
  console.log(e.data);
});
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Server-sent events](/en-US/docs/Web/API/Server-sent_events)
- [Using server-sent events](/en-US/docs/Web/API/Server-sent_events/Using_server-sent_events)
