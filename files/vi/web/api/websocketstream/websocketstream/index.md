---
title: "WebSocketStream: hàm khởi tạo WebSocketStream()"
short-title: WebSocketStream()
slug: Web/API/WebSocketStream/WebSocketStream
page-type: web-api-constructor
status:
  - experimental
browser-compat: api.WebSocketStream.WebSocketStream
---

{{APIRef("WebSockets API")}}{{SeeCompatTable}}{{AvailableInWorkers}}

Constructor **`WebSocketStream()`** tạo một thể hiện đối tượng {{domxref("WebSocketStream")}} mới.

## Cú pháp

```js-nolint
new WebSocketStream(url)
new WebSocketStream(url, options)
```

### Tham số

- `url`
  - : Một chuỗi biểu thị URL của máy chủ WebSocket mà bạn muốn kết nối bằng thể hiện `WebSocketStream` này. Các scheme URL được phép là `"ws"`, `"wss"`, `"http"`, và `"https"`.
- `options` {{optional_inline}}
  - : Một đối tượng có thể chứa các thuộc tính sau:
    - `protocols` {{optional_inline}}
      - : Một chuỗi đơn hoặc một mảng chuỗi biểu thị giao thức con mà client muốn dùng, ví dụ `"amqp"` hoặc `"mqtt"`. Các subprotocol có thể được chọn từ [IANA WebSocket Subprotocol Name Registry](https://www.iana.org/assignments/websocket/websocket.xml#subprotocol-name) hoặc có thể là tên tùy chỉnh mà client và server cùng hiểu. Một máy chủ có thể triển khai nhiều WebSocket sub-protocol và xử lý các loại tương tác khác nhau tùy giá trị được chỉ định. Nếu bỏ qua, mặc định sẽ dùng một mảng rỗng. Nếu có `protocols`, kết nối chỉ được thiết lập nếu máy chủ báo rằng nó đã chọn một trong các sub-protocol này.
    - `signal` {{optional_inline}}
      - : Một {{domxref("AbortSignal")}}, có thể dùng để hủy kết nối trước khi [handshake](/en-US/docs/Web/API/WebSockets_API/Writing_WebSocket_servers#the_websocket_handshake) hoàn tất (tức là trước khi promise {{domxref("WebSocketStream.opened", "opened")}} được giải quyết). Điều này chủ yếu nhằm hỗ trợ triển khai timeout kết nối. Do đó, nó không có tác dụng sau khi kết nối đã được thiết lập.

### Ngoại lệ

- `SyntaxError` {{domxref("DOMException")}}
  - : Được ném ra nếu scheme URL không phải là một trong `"ws"`, `"wss"`, `"http"`, hoặc `"https"`.

## Ví dụ

### Tạo một `WebSocketStream`

Ví dụ cơ bản nhất nhận URL của một máy chủ WebSocket làm đối số:

```js
const wss = new WebSocketStream("wss://example.com/wss");
```

### Tạo `WebSocketStream` với timeout kết nối

Ví dụ sau dùng tùy chọn `signal` để triển khai timeout nếu kết nối không được thiết lập trong vòng 5 giây:

```js
const queueWSS = new WebSocketStream("wss://example.com/queue", {
  signal: AbortSignal.timeout(5000),
});
```

Lưu ý rằng nếu bạn kết nối tới localhost, nó có khả năng thành công hoặc thất bại trước khi lần thử kết nối bị timeout.

Sau khi kết nối được thiết lập, `signal` không còn tác dụng: để đóng một kết nối đã được thiết lập, hãy gọi phương thức {{domxref("WebSocketStream.close()")}}. Đóng {{domxref("WritableStream")}} hoặc {{domxref("WritableStreamDefaultWriter")}} bên dưới cũng sẽ đóng socket.

Xem [Using WebSocketStream to write a client](/en-US/docs/Web/API/WebSockets_API/Using_WebSocketStream) để biết ví dụ hoàn chỉnh với giải thích đầy đủ.

## Thông số kỹ thuật

Hiện chưa thuộc bất kỳ đặc tả nào. Xem https://github.com/whatwg/websockets/pull/48 để theo dõi tiến trình chuẩn hóa.

[Thiết kế API WebSocketStream](https://docs.google.com/document/d/1La1ehXw76HP6n1uUeks-WJGFgAnpX2tCjKts7QFJ57Y/edit?pli=1&tab=t.0).

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [WebSocketStream: tích hợp streams với WebSocket API](https://developer.chrome.com/docs/capabilities/web-apis/websocketstream), developer.chrome.com (2020)
