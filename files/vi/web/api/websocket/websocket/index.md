---
title: "WebSocket: constructor WebSocket()"
short-title: WebSocket()
slug: Web/API/WebSocket/WebSocket
page-type: web-api-constructor
browser-compat: api.WebSocket.WebSocket
---

{{APIRef("WebSockets API")}}{{AvailableInWorkers}}

Constructor **`WebSocket()`** trả về một đối tượng {{domxref("WebSocket")}} mới và ngay lập tức cố gắng thiết lập kết nối tới URL WebSocket đã chỉ định.

## Cú pháp

```js-nolint
new WebSocket(url)
new WebSocket(url, protocols)
```

### Tham số

- `url`
  - : URL của máy chủ WebSocket đích để kết nối.
    URL phải dùng một trong các scheme sau: `ws`, `wss`, `http`, hoặc `https`, và không được chứa [URL fragment](/en-US/docs/Web/URI/Reference/Fragment).
    Nếu cung cấp URL tương đối, nó sẽ được tính tương đối với base URL của script đang gọi.

- `protocols` {{optional_inline}}
  - : Một chuỗi đơn hoặc một mảng các chuỗi biểu thị [giao thức phụ](/en-US/docs/Web/API/WebSockets_API/Writing_WebSocket_servers#subprotocols) mà client muốn dùng, theo thứ tự ưu tiên.
    Nếu bỏ qua, một mảng rỗng sẽ được dùng mặc định, tức `[]`.

    Một máy chủ có thể triển khai nhiều giao thức phụ WebSocket và xử lý các kiểu tương tác khác nhau tùy theo giá trị được chỉ định.
    Tuy nhiên, chỉ một giao thức phụ có thể được chọn cho mỗi kết nối.

    Các giá trị hợp lệ là những giá trị có thể được chỉ định trong tiêu đề HTTP {{httpheader("Sec-WebSocket-Protocol")}}.
    Đây là các giá trị được chọn từ [IANA WebSocket Subprotocol Name Registry](https://www.iana.org/assignments/websocket/websocket.xml#subprotocol-name), chẳng hạn `soap`, `wamp`, `ship`, v.v., hoặc có thể là một tên tùy chỉnh mà client và máy chủ cùng hiểu.

    > [!NOTE]
    > Kết nối sẽ không được thiết lập cho đến khi giao thức phụ được thương lượng với máy chủ.
    > Giao thức đã chọn sau đó có thể được đọc từ {{domxref("WebSocket.protocol")}}: nó sẽ là chuỗi rỗng nếu không thể thiết lập kết nối.

### Ngoại lệ

- `SyntaxError` {{domxref("DOMException")}}
  - : Được ném ra nếu:
    - việc phân tích [`url`](#url) thất bại
    - [`url`](#url) có một scheme khác `ws`, `wss`, `http`, hoặc `https`
    - [`url`](#url) có một [fragment](/en-US/docs/Web/URI/Reference/Fragment)
    - bất kỳ giá trị nào trong [`protocols`](#protocols) xuất hiện nhiều hơn một lần, hoặc không thỏa mãn các yêu cầu đối với phần tử cấu thành giá trị của các trường [`Sec-WebSocket-Protocol`](/en-US/docs/Web/HTTP/Guides/Protocol_upgrade_mechanism#sec-websocket-protocol) như được định nghĩa trong đặc tả WebSocket Protocol

## Ví dụ

Các ví dụ dưới đây cho thấy cách bạn có thể kết nối tới một `WebSocket`.

Đoạn mã dưới đây cho thấy cách kết nối tới một socket bằng URL dùng scheme `wss`:

```js
const wssWebSocket = new WebSocket("wss://websocket.example.org");
console.log(wssWebSocket.url); // 'wss://websocket.example.org'

// Thực hiện điều gì đó với socket

wssWebSocket.close();
```

Mã để kết nối tới URL HTTPS gần như giống hệt.
Ẩn bên dưới, trình duyệt phân giải điều này thành một kết nối "WSS", vì vậy {{domxref("WebSocket.url")}} sẽ có scheme "wss:".

```js
const httpsWebSocket = new WebSocket("https://websocket.example.org");
console.log(httpsWebSocket.url); // 'wss://websocket.example.org'

// Thực hiện điều gì đó với socket

httpsWebSocket.close();
```

Chúng ta cũng có thể phân giải URL tương đối.
URL tuyệt đối sẽ phụ thuộc vào base URL của ngữ cảnh mà nó được gọi.

```js
relativeWebSocket = new WebSocket("/local/url");

// Thực hiện điều gì đó với socket

relativeWebSocket.close();
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [RFC 6455](https://www.rfc-editor.org/rfc/rfc6455.html) (đặc tả giao thức WebSocket)
