---
title: Viết máy chủ WebSocket
slug: Web/API/WebSockets_API/Writing_WebSocket_servers
page-type: guide
---

{{DefaultAPISidebar("WebSockets API")}}

Hãy cùng xem các nguyên tắc cơ bản khi viết một máy chủ WebSocket. Phần sau sẽ mô tả chi tiết cách máy chủ trao đổi dữ liệu qua giao thức WebSocket. Điều đáng lưu ý là mặc dù việc viết máy chủ nghe có vẻ khá đơn giản, bạn nên hiểu rõ các chi tiết cấp thấp để có thể thực thi đúng cách và hiệu quả, đặc biệt là về những chi tiết bảo mật.

Mô tả cơ chế giao thức dưới đây được xây dựng dựa trên [RFC 6455](https://www.rfc-editor.org/rfc/rfc6455.html), nhưng sẽ không đi sâu quá nhiều vào chi tiết đặc tả. Hướng dẫn này chủ yếu dành cho người đang phát triển máy chủ WebSocket, và một máy chủ được viết đúng sẽ vẫn hoạt động với các trình duyệt mới và cũ hơn.

## Bắt tay

Để bắt đầu kết nối, máy khách phải mở một [kết nối TCP](https://en.wikipedia.org/wiki/Transmission_Control_Protocol) tới máy chủ, rồi gửi một thông điệp bắt tay yêu cầu nâng cấp kết nối lên WebSocket. Chỉ sau khi máy chủ phản hồi bằng một thông điệp bắt tay hợp lệ thì kết nối WebSocket mới được thiết lập.

### Yêu cầu bắt tay từ máy khách

Máy khách bắt đầu bằng cách gửi một yêu cầu HTTP tiêu chuẩn tới máy chủ. Yêu cầu này sẽ chứa tiêu đề `Upgrade: websocket`, `Connection: Upgrade`, và một số tiêu đề khác.

```http
GET /chat HTTP/1.1
Host: server.example.com
Upgrade: websocket
Connection: Upgrade
Sec-WebSocket-Key: x3JJHMbDL1EzLkh9GBhXDw==
Sec-WebSocket-Protocol: chat, superchat
Sec-WebSocket-Version: 13
Origin: http://example.com
```

### Phản hồi bắt tay từ máy chủ

Máy chủ phản hồi bằng một thông điệp HTTP 101, cho biết rằng giao thức đã được nâng cấp thành công.

```http
HTTP/1.1 101 Switching Protocols
Upgrade: websocket
Connection: Upgrade
Sec-WebSocket-Accept: HSmrc0sMlYUkAGmm5OPpG2HaGWk=
Sec-WebSocket-Protocol: chat
```

Phản hồi phải chứa tiêu đề `Sec-WebSocket-Accept`, được tính từ giá trị `Sec-WebSocket-Key` do máy khách gửi.

> [!NOTE]
> Giá trị `Sec-WebSocket-Key` không được dùng như một khóa bảo mật thực sự. Nó chỉ là một nonce dùng để chứng minh rằng máy khách đang nói cùng giao thức với máy chủ.

## Theo dõi máy khách

Sau khi bắt tay hoàn tất, máy chủ cần duy trì một danh sách các máy khách đang kết nối. Khi một máy khách gửi dữ liệu, máy chủ có thể chuyển tiếp dữ liệu đó tới các máy khách khác.

## Khung dữ liệu

Thông điệp WebSocket được trao đổi dưới dạng các frame nhị phân. Một thông điệp có thể được chia thành nhiều frame, và mỗi frame có một phần đầu chứa thông tin điều khiển.

### Định dạng frame

Mỗi frame bắt đầu bằng hai byte đầu tiên mô tả:

- Cờ FIN
- Các bit RSV
- Opcode
- Bit MASK
- Độ dài payload

Nếu payload lớn hơn, độ dài sẽ được mã hóa trong các byte bổ sung.

### Độ dài payload

Độ dài payload có thể nằm trong ba trường hợp:

- Nếu giá trị nhỏ hơn 126, nó chính là độ dài payload.
- Nếu bằng 126, hai byte tiếp theo biểu thị độ dài.
- Nếu bằng 127, tám byte tiếp theo biểu thị độ dài.

### Giải mã payload

Các payload từ máy khách tới máy chủ luôn được che bằng một khóa 4 byte. Máy chủ phải dùng khóa này để XOR từng byte payload và khôi phục dữ liệu gốc.

## Phân mảnh thông điệp

Một thông điệp có thể được gửi qua nhiều frame. Khi đó, chỉ frame cuối cùng mới có cờ FIN được đặt. Máy chủ phải ghép các frame lại để khôi phục toàn bộ thông điệp.

## Ping và pong

WebSocket cung cấp các frame điều khiển ping và pong để kiểm tra kết nối còn sống. Máy chủ có thể trả lời ping bằng pong để giữ kết nối hoạt động.

## Đóng kết nối

Khi một bên muốn đóng kết nối, nó gửi một frame đóng. Bên còn lại phải phản hồi thích hợp và ngắt kết nối.

## Phần còn lại

### Tiện ích mở rộng

Tiện ích mở rộng cho phép thêm hành vi mới vào giao thức WebSocket. Nếu một tiện ích mở rộng được thương lượng, nó có thể thay đổi cách mã hóa hoặc cách xử lý frame.

### Giao thức phụ

Giao thức phụ cho phép hai bên thỏa thuận một định dạng ứng dụng cụ thể bên trên WebSocket. Ví dụ, máy khách có thể yêu cầu `soap` hoặc `wamp`.

> Giao thức phụ được giải thích trong các mục 1.9, 4.2, 11.3.4 và 11.5 của đặc tả.

Máy khách phải yêu cầu một giao thức phụ cụ thể. Để làm vậy, nó sẽ gửi một thứ như sau _như một phần của quá trình bắt tay ban đầu_:

```http
GET /chat HTTP/1.1
...
Sec-WebSocket-Protocol: soap, wamp
```

hoặc, tương đương:

```http
...
Sec-WebSocket-Protocol: soap
Sec-WebSocket-Protocol: wamp
```

Giờ thì máy chủ phải chọn một trong các giao thức mà máy khách đề xuất và nó hỗ trợ. Nếu có nhiều hơn một, hãy gửi giao thức đầu tiên mà máy khách đã gửi. Giả sử máy chủ của chúng ta có thể dùng cả `soap` lẫn `wamp`. Khi đó, trong phản hồi bắt tay, nó sẽ gửi:

```http
Sec-WebSocket-Protocol: soap
```

> [!WARNING]
> Máy chủ không thể gửi nhiều hơn một tiêu đề `Sec-WebSocket-Protocol`.
> Nếu máy chủ không muốn dùng bất kỳ giao thức phụ nào, **_nó không nên gửi bất kỳ tiêu đề `Sec-WebSocket-Protocol` nào_**. Gửi một tiêu đề trống là sai. Máy khách có thể đóng kết nối nếu nó không nhận được giao thức phụ mà nó muốn.

Nếu bạn muốn máy chủ của mình tuân theo một số giao thức phụ nhất định, thì dĩ nhiên bạn sẽ cần thêm mã trên máy chủ. Hãy tưởng tượng chúng ta đang dùng một giao thức phụ `json`. Trong giao thức phụ này, mọi dữ liệu đều được truyền dưới dạng [JSON](https://en.wikipedia.org/wiki/JSON). Nếu máy khách đề xuất giao thức này và máy chủ muốn dùng nó, máy chủ cần có một bộ phân tích JSON. Về mặt thực tế, phần này sẽ là một phần của thư viện, nhưng máy chủ vẫn cần chuyển dữ liệu đi qua lại.

> [!NOTE]
> Để tránh xung đột tên, bạn nên đưa tên giao thức phụ của mình vào một chuỗi miền. Nếu bạn đang xây dựng một ứng dụng chat tùy biến dùng định dạng độc quyền chỉ dành cho Example Inc., bạn có thể dùng như sau: `Sec-WebSocket-Protocol: chat.example.com`. Lưu ý rằng điều này không bắt buộc, đây chỉ là một quy ước tùy chọn, và bạn có thể dùng bất kỳ chuỗi nào mình muốn.

## Xem thêm

- [Viết ứng dụng máy khách WebSocket](/en-US/docs/Web/API/WebSockets_API/Writing_WebSocket_client_applications)
- [Hướng dẫn: máy chủ WebSocket bằng C#](/en-US/docs/Web/API/WebSockets_API/Writing_WebSocket_server)
- [Hướng dẫn: máy chủ WebSocket bằng Java](/en-US/docs/Web/API/WebSockets_API/Writing_a_WebSocket_server_in_Java)
