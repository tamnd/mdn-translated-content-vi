---
title: API WebSocket (WebSockets)
slug: Web/API/WebSockets_API
page-type: web-api-overview
browser-compat:
  - api.WebSocket
  - api.WebSocketStream
---

{{DefaultAPISidebar("WebSockets API")}}{{AvailableInWorkers}}

**API WebSocket** cho phép mở một phiên giao tiếp tương tác hai chiều giữa trình duyệt của người dùng và máy chủ. Với API này, bạn có thể gửi thông điệp đến máy chủ và nhận phản hồi mà không cần liên tục thăm dò máy chủ để chờ trả lời.

API WebSocket cung cấp hai cơ chế thay thế để tạo và sử dụng các kết nối web socket: giao diện {{domxref("WebSocket")}} và giao diện {{domxref("WebSocketStream")}}.

- Giao diện `WebSocket` đã ổn định và được hỗ trợ tốt bởi trình duyệt lẫn máy chủ. Tuy nhiên, giao diện này không hỗ trợ [backpressure](/en-US/docs/Web/API/Streams_API/Concepts#backpressure). Vì vậy, khi thông điệp đến nhanh hơn tốc độ ứng dụng có thể xử lý, nó sẽ hoặc làm đầy bộ nhớ của thiết bị bằng cách đệm các thông điệp đó, hoặc khiến ứng dụng không phản hồi do sử dụng 100% CPU, hoặc cả hai.
- Giao diện `WebSocketStream` là một lựa chọn thay thế dựa trên {{jsxref("Promise")}} cho `WebSocket`. Nó dùng [Streams API](/en-US/docs/Web/API/Streams_API) để xử lý việc nhận và gửi thông điệp, nghĩa là các kết nối socket có thể tận dụng backpressure của luồng một cách tự động, điều chỉnh tốc độ đọc hoặc ghi để tránh nghẽn trong ứng dụng. Tuy nhiên, `WebSocketStream` không phải là chuẩn và hiện chỉ được hỗ trợ trong một bộ máy kết xuất.

Ngoài ra, [WebTransport API](/en-US/docs/Web/API/WebTransport_API) được kỳ vọng sẽ thay thế API WebSocket trong nhiều ứng dụng. WebTransport là một API linh hoạt, cấp thấp, cung cấp backpressure và nhiều tính năng khác mà cả `WebSocket` lẫn `WebSocketStream` đều không hỗ trợ, chẳng hạn như luồng một chiều, truyền ngoài thứ tự, và truyền dữ liệu không tin cậy qua datagram. WebTransport phức tạp hơn WebSocket để sử dụng và khả năng hỗ trợ đa trình duyệt cũng không rộng bằng, nhưng nó cho phép triển khai các giải pháp tinh vi. Nếu các kết nối WebSocket chuẩn phù hợp với trường hợp sử dụng của bạn và bạn cần khả năng tương thích trình duyệt rộng, bạn nên dùng API WebSocket để nhanh chóng bắt đầu. Tuy nhiên, nếu ứng dụng của bạn yêu cầu một giải pháp tùy biến không chuẩn, thì bạn nên dùng WebTransport API.

> [!NOTE]
> Nếu một trang đang mở kết nối WebSocket, trình duyệt có thể không thêm trang đó vào {{glossary("bfcache")}}. Vì vậy, thực hành tốt là đóng kết nối khi người dùng đã rời khỏi trang. Xem [làm việc với bfcache](/en-US/docs/Web/API/WebSockets_API/Writing_WebSocket_client_applications#working_with_the_bfcache).

## Giao diện

- [`WebSocket`](/en-US/docs/Web/API/WebSocket)
  - : Giao diện chính để kết nối tới máy chủ WebSocket rồi gửi và nhận dữ liệu trên kết nối.
- [`WebSocketStream`](/en-US/docs/Web/API/WebSocketStream) {{non-standard_inline}}
  - : Giao diện dựa trên promise để kết nối tới máy chủ WebSocket; dùng [streams](/en-US/docs/Web/API/Streams_API) để gửi và nhận dữ liệu trên kết nối.
- [`CloseEvent`](/en-US/docs/Web/API/CloseEvent)
  - : Sự kiện mà đối tượng WebSocket phát ra khi kết nối đóng lại.
- [`MessageEvent`](/en-US/docs/Web/API/MessageEvent)
  - : Sự kiện mà đối tượng WebSocket phát ra khi nhận được thông điệp từ máy chủ.

## Tiêu đề HTTP liên quan

Các tiêu đề HTTP được dùng trong [WebSocket handshake](/en-US/docs/Web/API/WebSockets_API/Writing_WebSocket_servers#the_websocket_handshake):

- {{HTTPHeader("Sec-WebSocket-Key")}}
  - : Một tiêu đề yêu cầu HTTP chứa một {{Glossary("Nonce", "nonce")}} từ phía máy khách.
    Tiêu đề này được trình duyệt tự động thêm vào trong [WebSocket opening handshake](/en-US/docs/Web/API/WebSockets_API/Writing_WebSocket_servers#the_websocket_handshake) để xác minh rằng máy khách thực sự có ý định mở một kết nối WebSocket.
    Trình duyệt sẽ tự động thêm nó.
- {{HTTPHeader("Sec-WebSocket-Accept")}}
  - : Một {{glossary("response header")}} HTTP được dùng trong _WebSocket opening handshake_ để cho biết rằng máy chủ sẵn sàng nâng cấp sang kết nối WebSocket.
    Giá trị trong chỉ thị này được tính từ giá trị của `Sec-WebSocket-Key` trong yêu cầu tương ứng.
- {{HTTPHeader("Sec-WebSocket-Version")}}
  - : Một tiêu đề HTTP trong các yêu cầu cho biết phiên bản của giao thức WebSocket mà máy khách hiểu.
    Trong phản hồi, nó chỉ được gửi nếu phiên bản giao thức được yêu cầu không được máy chủ hỗ trợ, và liệt kê các phiên bản mà máy chủ hỗ trợ.
- {{HTTPHeader("Sec-WebSocket-Protocol")}}
  - : Một tiêu đề HTTP trong các yêu cầu cho biết các giao thức phụ mà máy khách hỗ trợ theo thứ tự ưu tiên.
    Trong phản hồi, nó cho biết giao thức phụ mà máy chủ đã chọn từ các lựa chọn của máy khách.
- {{HTTPHeader("Sec-WebSocket-Extensions")}}
  - : Một tiêu đề HTTP trong các yêu cầu cho biết các tiện ích WebSocket mà máy khách hỗ trợ theo thứ tự ưu tiên.
    Trong phản hồi, nó cho biết tiện ích mà máy chủ đã chọn từ các lựa chọn của máy khách.

## Hướng dẫn

- [Viết ứng dụng máy khách WebSocket](/en-US/docs/Web/API/WebSockets_API/Writing_WebSocket_client_applications)
- [Viết máy chủ WebSocket](/en-US/docs/Web/API/WebSockets_API/Writing_WebSocket_servers)
- [Viết máy chủ WebSocket bằng C#](/en-US/docs/Web/API/WebSockets_API/Writing_WebSocket_server)
- [Viết máy chủ WebSocket bằng Java](/en-US/docs/Web/API/WebSockets_API/Writing_a_WebSocket_server_in_Java)
- [Viết máy chủ WebSocket bằng JavaScript (Deno)](/en-US/docs/Web/API/WebSockets_API/Writing_a_WebSocket_server_in_JavaScript_Deno)
- [Dùng WebSocketStream để viết máy khách](/en-US/docs/Web/API/WebSockets_API/Using_WebSocketStream)

## Công cụ

- [AsyncAPI](https://www.asyncapi.com/): Một đặc tả để mô tả các kiến trúc hướng sự kiện dựa trên những giao thức như WebSocket. Bạn có thể dùng nó để mô tả các API dựa trên WebSocket giống như cách bạn mô tả các API REST bằng đặc tả OpenAPI. Xem [vì sao bạn nên cân nhắc dùng AsyncAPI với WebSocket](https://www.asyncapi.com/blog/websocket-part1) và [cách thực hiện điều đó](https://www.asyncapi.com/blog/websocket-part2).
- [µWebSockets](https://github.com/uNetworking/uWebSockets): Triển khai máy chủ và máy khách WebSocket có khả năng mở rộng cao cho [C++11](https://isocpp.org/) và [Node.js](https://nodejs.org/).
- [Socket.IO](https://socket.io/): Một giao thức truyền tải bên thứ ba dựa trên long polling/WebSocket cho [Node.js](https://nodejs.org/).
- [SocketCluster](https://socketcluster.io/): Một framework WebSocket pub/sub cho [Node.js](https://nodejs.org/) với trọng tâm là khả năng mở rộng.
- [WebSocket-Node](https://github.com/theturtle32/WebSocket-Node): Một triển khai API máy chủ WebSocket cho [Node.js](https://nodejs.org/).
- [Total.js](https://www.totaljs.com/): Framework ứng dụng web cho [Node.js](https://nodejs.org/en) (Ví dụ: [WebSocket chat](https://github.com/totaljs/examples/tree/master/websocket))
- [SignalR](https://dotnet.microsoft.com/en-us/apps/aspnet/signalr): SignalR sẽ dùng WebSocket bên dưới khi có sẵn, và tự động chuyển sang các kỹ thuật và công nghệ khác khi không có, trong khi mã ứng dụng của bạn vẫn giữ nguyên.
- [Caddy](https://caddyserver.com/): Một máy chủ web có thể proxy các lệnh tùy ý (stdin/stdout) dưới dạng websocket.
- [ws](https://github.com/websockets/ws): một thư viện máy khách và máy chủ WebSocket phổ biến cho [Node.js](https://nodejs.org/en).
- [cowboy](https://github.com/ninenines/cowboy): Cowboy là một máy chủ HTTP nhỏ, nhanh và hiện đại cho Erlang/OTP với hỗ trợ WebSocket.
- [ZeroMQ](https://zeromq.org/): ZeroMQ là thư viện mạng có thể nhúng, truyền thông điệp qua in-process, IPC, TCP, UDP, TIPC, multicast và WebSocket.
- [WebSocket King](https://websocketking.com/): Một công cụ máy khách giúp phát triển, kiểm thử và làm việc với các máy chủ WebSocket.
- [PHP WebSocket Server](https://github.com/napengam/phpWebSocketServer): Máy chủ được viết bằng PHP để xử lý kết nối qua websockets `wss://` hoặc `ws://` và các socket bình thường qua `ssl://`, `tcp://`
- [Django Channels](https://channels.readthedocs.io/en/stable/index.html): Thư viện Django bổ sung hỗ trợ cho WebSocket (và các giao thức khác cần kết nối bất đồng bộ kéo dài).
- [(Phoenix) Channels](https://hexdocs.pm/phoenix/channels.html): Giao tiếp thời gian thực có khả năng mở rộng bằng WebSocket trong framework Elixir Phoenix.
- [Phoenix LiveView](https://github.com/phoenixframework/phoenix_live_view): Trải nghiệm web tương tác theo thời gian thực thông qua WebSocket trong framework Elixir Phoenix.
- [Flask-SocketIO](https://flask-socketio.readthedocs.io/en/latest/): cung cấp cho ứng dụng Flask khả năng giao tiếp hai chiều độ trễ thấp giữa máy khách và máy chủ.
- [Gorilla WebSocket](https://pkg.go.dev/github.com/gorilla/websocket): Gorilla WebSocket là một triển khai giao thức WebSocket bằng [Go](https://go.dev/).

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [RFC 6455 — Giao thức WebSocket](https://datatracker.ietf.org/doc/html/rfc6455)
- [Đặc tả API WebSocket](https://websockets.spec.whatwg.org/)
- [Server-Sent Events](/en-US/docs/Web/API/Server-sent_events)
