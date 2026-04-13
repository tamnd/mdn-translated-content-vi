---
title: Viết máy chủ WebSocket bằng Java
slug: Web/API/WebSockets_API/Writing_a_WebSocket_server_in_Java
page-type: guide
---

{{DefaultAPISidebar("WebSockets API")}}

Ví dụ này cho bạn thấy cách tạo một máy chủ API WebSocket bằng Oracle Java.

Mặc dù có thể dùng các ngôn ngữ phía máy chủ khác để tạo một máy chủ WebSocket, ví dụ này dùng Oracle Java để đơn giản hóa mã mẫu.

Máy chủ này tuân thủ [RFC 6455](https://datatracker.ietf.org/doc/html/rfc6455), vì vậy nó chỉ xử lý các kết nối từ Chrome phiên bản 16, Firefox 11, IE 10 trở lên.

## Những bước đầu tiên

WebSocket giao tiếp qua một kết nối [TCP (Transmission Control Protocol)](https://en.wikipedia.org/wiki/Transmission_Control_Protocol). Lớp [ServerSocket](https://docs.oracle.com/javase/8/docs/api/java/net/ServerSocket.html) của Java nằm trong gói `java.net`.

### ServerSocket

Hàm dựng `ServerSocket` nhận một tham số duy nhất `port` có kiểu `int`.

Khi bạn khởi tạo lớp ServerSocket, nó được gắn với số cổng bạn chỉ định bằng đối số _port_.

Đây là một triển khai được chia thành các phần:

```java
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.net.ServerSocket;
import java.net.Socket;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.util.Base64;
import java.util.Scanner;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

public class WebSocket {
  public static void main(String[] args) throws IOException, NoSuchAlgorithmException {
    ServerSocket server = new ServerSocket(80);
    try {
      System.out.println("Server has started on 127.0.0.1:80.\r\nWaiting for a connection…");
      Socket client = server.accept();
      System.out.println("A client connected.");
```

### Phương thức Socket

- `java.net.Socket.getInputStream()`
  - : Trả về một luồng đầu vào cho socket này.
- `java.net.Socket.getOutputStream()`
  - : Trả về một luồng đầu ra cho socket này.

### Phương thức OutputStream

```java
write(byte[] b, int off, int len)
```

Ghi `len` byte từ mảng byte được chỉ định, bắt đầu tại độ lệch `off`, vào luồng đầu ra này.

### Phương thức InputStream

```java
read(byte[] b, int off, int len)
```

Đọc tối đa _len_ byte dữ liệu từ luồng đầu vào vào một mảng byte.

Hãy mở rộng ví dụ của chúng ta.

```java
InputStream in = client.getInputStream();
OutputStream out = client.getOutputStream();
Scanner s = new Scanner(in, "UTF-8");
```

## Bắt tay

Khi một máy khách kết nối tới máy chủ, nó gửi một yêu cầu GET để nâng cấp kết nối lên WebSocket từ một yêu cầu HTTP đơn giản. Điều này được gọi là bắt tay.

```java
try {
  String data = s.useDelimiter("\\r\\n\\r\\n").next();
  Matcher get = Pattern.compile("^GET").matcher(data);
```

Việc tạo phản hồi dễ hơn việc hiểu vì sao bạn phải làm theo cách này.

Bạn phải:

1. Lấy giá trị của tiêu đề yêu cầu _Sec-WebSocket-Key_ mà không có khoảng trắng ở đầu hoặc cuối
2. Nối nó với "258EAFA5-E914-47DA-95CA-C5AB0DC85B11"
3. Tính mã SHA-1 và Base64 của nó
4. Ghi nó trở lại làm giá trị của tiêu đề phản hồi _Sec-WebSocket-Accept_ như một phần của phản hồi HTTP.

```java
if (get.find()) {
  Matcher match = Pattern.compile("Sec-WebSocket-Key: (.*)").matcher(data);
  match.find();
  byte[] response = ("HTTP/1.1 101 Switching Protocols\r\n"
    + "Connection: Upgrade\r\n"
    + "Upgrade: websocket\r\n"
    + "Sec-WebSocket-Accept: "
    + Base64.getEncoder().encodeToString(MessageDigest.getInstance("SHA-1").digest((match.group(1) + "258EAFA5-E914-47DA-95CA-C5AB0DC85B11").getBytes("UTF-8")))
    + "\r\n\r\n").getBytes("UTF-8");
  out.write(response, 0, response.length);
```

## Giải mã thông điệp

Sau khi bắt tay thành công, máy khách có thể gửi thông điệp đến máy chủ, nhưng lúc này chúng đã được mã hóa.

Nếu ta gửi "abcdef", ta sẽ nhận được các byte sau:

```plain
129 134 167 225 225 210 198 131 130 182 194 135
```

- 129:

  | FIN (Đây có phải toàn bộ thông điệp không?) | RSV1 | RSV2 | RSV3 | Opcode   |
  | ------------------------------------------- | ---- | ---- | ---- | -------- |
  | 1                                           | 0    | 0    | 0    | 0x1=0001 |

  FIN: Bạn có thể gửi thông điệp theo frame, nhưng bây giờ hãy giữ mọi thứ đơn giản.
  Opcode _0x1_ nghĩa là đây là một thông điệp văn bản. [Danh sách đầy đủ các opcode](https://datatracker.ietf.org/doc/html/rfc6455#section-5.2)

- 134:

  Nếu byte thứ hai trừ đi 128 nằm trong khoảng từ 0 đến 125, thì đó là độ dài của thông điệp. Nếu là 126, 2 byte tiếp theo (số nguyên không dấu 16 bit), nếu là 127, 8 byte tiếp theo (số nguyên không dấu 64 bit, bit có ý nghĩa lớn nhất PHẢI là 0) là độ dài.

  > [!NOTE]
  > Nó có thể lấy giá trị 128 vì bit đầu tiên luôn là 1.

- 167, 225, 225 và 210 là các byte của khóa dùng để giải mã. Nó thay đổi mỗi lần.

- Các byte đã mã hóa còn lại là thông điệp.

### Thuật toán giải mã

decoded byte = encoded byte XOR (vị trí của encoded byte AND theo bit với 0x3)th byte của key

Ví dụ bằng Java:

```java
          byte[] decoded = new byte[6];
          byte[] encoded = new byte[] { (byte) 198, (byte) 131, (byte) 130, (byte) 182, (byte) 194, (byte) 135 };
          byte[] key = new byte[] { (byte) 167, (byte) 225, (byte) 225, (byte) 210 };
          for (int i = 0; i < encoded.length; i++) {
            decoded[i] = (byte) (encoded[i] ^ key[i & 0x3]);
          }
        }
      } finally {
        s.close();
      }
    } finally {
      server.close();
    }
  }
}
```

## Xem thêm

- [Viết máy chủ WebSocket](/en-US/docs/Web/API/WebSockets_API/Writing_WebSocket_servers)
