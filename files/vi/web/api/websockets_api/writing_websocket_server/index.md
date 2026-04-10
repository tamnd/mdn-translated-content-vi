---
title: Viết máy chủ WebSocket bằng C#
slug: Web/API/WebSockets_API/Writing_WebSocket_server
page-type: guide
---

{{DefaultAPISidebar("WebSockets API")}}

Nếu bạn muốn dùng API WebSocket, sẽ hữu ích nếu bạn có một máy chủ. Trong bài viết này, tôi sẽ chỉ cho bạn cách viết một máy chủ bằng C#. Bạn có thể làm điều đó bằng bất kỳ ngôn ngữ phía máy chủ nào, nhưng để giữ mọi thứ đơn giản và dễ hiểu hơn, tôi đã chọn ngôn ngữ của Microsoft.

Máy chủ này tuân thủ [RFC 6455](https://datatracker.ietf.org/doc/html/rfc6455), vì vậy nó chỉ xử lý các kết nối từ Chrome phiên bản 16, Firefox 11, IE 10 trở lên.

## Những bước đầu tiên

WebSocket giao tiếp qua một kết nối [TCP (Transmission Control Protocol)](https://en.wikipedia.org/wiki/Transmission_Control_Protocol). May mắn là C# có lớp [TcpListener](https://learn.microsoft.com/en-us/dotnet/api/system.net.sockets.tcplistener?view=net-6.0) đúng như tên gọi của nó. Nó nằm trong namespace `System.Net.Sockets`.

> [!NOTE]
> Nên đưa namespace vào bằng từ khóa `using` để viết ít hơn. Cách này cho phép dùng các lớp của một namespace mà không phải gõ đầy đủ namespace mỗi lần.

### TcpListener

Hàm dựng:

```cs
TcpListener(System.Net.IPAddress localAddr, int port)
```

`localAddr` chỉ định IP của bộ lắng nghe, còn `port` chỉ định cổng.

> [!NOTE]
> Để tạo một đối tượng `IPAddress` từ một `string`, hãy dùng phương thức tĩnh `Parse` của `IPAddress`.

Phương thức:

- `Start()`
- `System.Net.Sockets.TcpClient AcceptTcpClient()`
  Chờ một kết nối TCP, chấp nhận nó và trả về nó dưới dạng đối tượng TcpClient.

Đây là một triển khai máy chủ tối giản:

```cs
using System.Net.Sockets;
using System.Net;
using System;

class Server {
    public static void Main() {
        TcpListener server = new TcpListener(IPAddress.Parse("127.0.0.1"), 80);

        server.Start();
        Console.WriteLine("Server has started on 127.0.0.1:80.{0}Waiting for a connection…", Environment.NewLine);

        TcpClient client = server.AcceptTcpClient();

        Console.WriteLine("A client connected.");
    }
}
```

### TcpClient

Phương thức:

- `System.Net.Sockets.NetworkStream GetStream()`
  Lấy luồng đóng vai trò là kênh giao tiếp. Cả hai đầu của kênh đều có khả năng đọc và ghi.

Thuộc tính:

- `int Available`
  Thuộc tính này cho biết có bao nhiêu byte dữ liệu đã được gửi. Giá trị là 0 cho đến khi `NetworkStream.DataAvailable` là _true_.

### NetworkStream

Phương thức:

- Ghi các byte từ buffer, offset và size xác định độ dài của thông điệp.

  ```cs
  Write(byte[] buffer, int offset, int size)
  ```

- Đọc các byte vào `buffer`. `offset` và `size` xác định độ dài của thông điệp.

  ```cs
  Read(byte[] buffer, int offset, int size)
  ```

Hãy mở rộng ví dụ của chúng ta.

```cs
TcpClient client = server.AcceptTcpClient();

Console.WriteLine("A client connected.");

NetworkStream stream = client.GetStream();

// Enter to an infinite cycle to be able to handle every change in stream
while (true) {
    while (!stream.DataAvailable);

    byte[] bytes = new byte[client.Available];

    stream.Read(bytes, 0, bytes.Length);
}
```

## Bắt tay

Khi một máy khách kết nối tới máy chủ, nó gửi một yêu cầu GET để nâng cấp kết nối lên WebSocket từ một yêu cầu HTTP đơn giản. Điều này được gọi là bắt tay.

Mã mẫu này có thể phát hiện một GET từ máy khách. Lưu ý rằng nó sẽ chặn cho đến khi có sẵn 3 byte đầu tiên của một thông điệp. Các giải pháp thay thế nên được nghiên cứu cho môi trường sản xuất.

```cs
using System.Text;
using System.Text.RegularExpressions;

while(client.Available < 3)
{
   // wait for enough bytes to be available
}

byte[] bytes = new byte[client.Available];

stream.Read(bytes, 0, bytes.Length);

// Translate bytes of request to string
String data = Encoding.UTF8.GetString(bytes);

if (Regex.IsMatch(data, "^GET")) {

} else {

}
```

Việc tạo phản hồi thì dễ, nhưng có thể hơi khó hiểu. Phần giải thích đầy đủ về bắt tay phía máy chủ có thể được tìm thấy trong RFC 6455, mục 4.2.2. Đối với mục đích của chúng ta, ta chỉ cần xây dựng một phản hồi đơn giản.

Bạn phải:

1. Lấy giá trị của tiêu đề yêu cầu "Sec-WebSocket-Key" mà không có khoảng trắng ở đầu hoặc cuối
2. Nối nó với "258EAFA5-E914-47DA-95CA-C5AB0DC85B11" (một GUID đặc biệt được RFC 6455 chỉ định)
3. Tính SHA-1 và mã Base64 của giá trị mới
4. Ghi mã băm trở lại làm giá trị của tiêu đề phản hồi {{httpheader("Sec-WebSocket-Accept")}} trong phản hồi HTTP

```cs
if (new System.Text.RegularExpressions.Regex("^GET").IsMatch(data))
{
    const string eol = "\r\n"; // HTTP/1.1 defines the sequence CR LF as the end-of-line marker

    byte[] response = Encoding.UTF8.GetBytes("HTTP/1.1 101 Switching Protocols" + eol
        + "Connection: Upgrade" + eol
        + "Upgrade: websocket" + eol
        + "Sec-WebSocket-Accept: " + Convert.ToBase64String(
            System.Security.Cryptography.SHA1.Create().ComputeHash(
                Encoding.UTF8.GetBytes(
                    new System.Text.RegularExpressions.Regex("Sec-WebSocket-Key: (.*)").Match(data).Groups[1].Value.Trim() + "258EAFA5-E914-47DA-95CA-C5AB0DC85B11"
                )
            )
        ) + eol
        + eol);

    stream.Write(response, 0, response.Length);
}
```

## Giải mã thông điệp

Sau khi bắt tay thành công, máy khách sẽ gửi các thông điệp đã được mã hóa tới máy chủ.

Nếu ta gửi "MDN", ta sẽ nhận được các byte sau:

```plain
129 131 61 84 35 6 112 16 109
```

Hãy xem những byte này có nghĩa là gì.

Byte đầu tiên, hiện có giá trị 129, là một bitfield có thể tách ra như sau:

| FIN (Bit 0) | RSV1 (Bit 1) | RSV2 (Bit 2) | RSV3 (Bit 3) | Opcode (Bit 4:7) |
| ----------- | ------------ | ------------ | ------------ | ---------------- |
| 1           | 0            | 0            | 0            | 0x1=0001         |

- Bit FIN: Bit này cho biết toàn bộ thông điệp đã được máy khách gửi hay chưa. Thông điệp có thể được gửi theo các frame, nhưng hiện tại ta sẽ giữ mọi thứ đơn giản.
- RSV1, RSV2, RSV3: Các bit này phải là 0 trừ khi có một tiện ích được thương lượng cung cấp một giá trị khác 0 cho chúng.
- Opcode: Các bit này mô tả loại thông điệp đã nhận. Opcode 0x1 nghĩa là đây là một thông điệp văn bản. [Danh sách đầy đủ các opcode](https://datatracker.ietf.org/doc/html/rfc6455#section-5.2)

Byte thứ hai, hiện có giá trị 131, cũng là một bitfield và có thể tách ra như sau:

| MASK (Bit 0) | Payload Length (Bit 1:7) |
| ------------ | ------------------------ |
| 1            | 0x83=0000011             |

- Bit MASK: Xác định liệu "dữ liệu payload" có được che hay không. Nếu đặt là 1, một khóa che sẽ có trong Masking-Key, và khóa này được dùng để gỡ che "dữ liệu payload". Mọi thông điệp từ máy khách tới máy chủ đều đặt bit này.
- Payload Length: Nếu giá trị này nằm giữa 0 và 125, thì đó là độ dài của thông điệp. Nếu là 126, 2 byte tiếp theo (số nguyên không dấu 16 bit) là độ dài. Nếu là 127, 8 byte tiếp theo (số nguyên không dấu 64 bit) là độ dài.

> [!NOTE]
> Vì bit đầu tiên luôn là 1 đối với thông điệp từ máy khách tới máy chủ, bạn có thể trừ 128 khỏi byte này để loại bỏ bit MASK.

Lưu ý rằng bit MASK được đặt trong thông điệp của chúng ta. Điều này có nghĩa là bốn byte tiếp theo (61, 84, 35 và 6) là các byte che được dùng để giải mã thông điệp. Các byte này thay đổi sau mỗi thông điệp.

Các byte còn lại là payload thông điệp đã được mã hóa.

### Thuật toán giải mã

_D_i_ = _E_i_ XOR _M_\_(_i_ mod 4)

trong đó _D_ là mảng thông điệp đã giải mã, _E_ là mảng thông điệp đã mã hóa, _M_ là mảng byte che, và _i_ là chỉ số của byte thông điệp cần giải mã.

Ví dụ bằng C#:

```cs
byte[] decoded = new byte[3];
byte[] encoded = new byte[3] {112, 16, 109};
byte[] mask = new byte[4] {61, 84, 35, 6};

for (int i = 0; i < encoded.Length; i++) {
    decoded[i] = (byte)(encoded[i] ^ mask[i % 4]);
}
```

## Ghép lại

### ws-server.cs

```cs
//
// csc ws-server.cs
// ws-server.exe

using System;
using System.Net;
using System.Net.Sockets;
using System.Text;
using System.Text.RegularExpressions;

class Server {
    public static void Main() {
        string ip = "127.0.0.1";
        int port = 80;
        var server = new TcpListener(IPAddress.Parse(ip), port);

        server.Start();
        Console.WriteLine("Server has started on {0}:{1}, Waiting for a connection…", ip, port);

        TcpClient client = server.AcceptTcpClient();
        Console.WriteLine("A client connected.");

        NetworkStream stream = client.GetStream();

        // enter to an infinite cycle to be able to handle every change in stream
        while (true) {
            while (!stream.DataAvailable);
            while (client.Available < 3); // match against "get"

            byte[] bytes = new byte[client.Available];
            stream.Read(bytes, 0, bytes.Length);
            string s = Encoding.UTF8.GetString(bytes);

            if (Regex.IsMatch(s, "^GET", RegexOptions.IgnoreCase)) {
                Console.WriteLine("=====Handshaking from client=====\n{0}", s);

                // 1. Obtain the value of the "Sec-WebSocket-Key" request header without any leading or trailing whitespace
                // 2. Concatenate it with "258EAFA5-E914-47DA-95CA-C5AB0DC85B11" (a special GUID specified by RFC 6455)
                // 3. Compute SHA-1 and Base64 hash of the new value
                // 4. Write the hash back as the value of "Sec-WebSocket-Accept" response header in an HTTP response
                string swk = Regex.Match(s, "Sec-WebSocket-Key: (.*)").Groups[1].Value.Trim();
                string swkAndSalt = swk + "258EAFA5-E914-47DA-95CA-C5AB0DC85B11";
                byte[] swkAndSaltSha1 = System.Security.Cryptography.SHA1.Create().ComputeHash(Encoding.UTF8.GetBytes(swkAndSalt));
                string swkAndSaltSha1Base64 = Convert.ToBase64String(swkAndSaltSha1);

                // HTTP/1.1 defines the sequence CR LF as the end-of-line marker
                byte[] response = Encoding.UTF8.GetBytes(
                    "HTTP/1.1 101 Switching Protocols\r\n" +
                    "Connection: Upgrade\r\n" +
                    "Upgrade: websocket\r\n" +
                    "Sec-WebSocket-Accept: " + swkAndSaltSha1Base64 + "\r\n\r\n");

                stream.Write(response, 0, response.Length);
            } else {
                bool fin = (bytes[0] & 0b10000000) != 0,
                    mask = (bytes[1] & 0b10000000) != 0; // must be true, "All messages from the client to the server have this bit set"
                int opcode = bytes[0] & 0b00001111; // expecting 1 - text message
                ulong offset = 2,
                      msgLen = bytes[1] & (ulong)0b01111111;

                if (msgLen == 126) {
                    // bytes are reversed because websocket will print them in Big-Endian, whereas
                    // BitConverter will want them arranged in little-endian on windows
                    msgLen = BitConverter.ToUInt16(new byte[] { bytes[3], bytes[2] }, 0);
                    offset = 4;
                } else if (msgLen == 127) {
                    // To test the below code, we need to manually buffer larger messages — since the NIC's autobuffering
                    // may be too latency-friendly for this code to run (that is, we may have only some of the bytes in this
                    // websocket frame available through client.Available).
                    msgLen = BitConverter.ToUInt64(new byte[] { bytes[9], bytes[8], bytes[7], bytes[6], bytes[5], bytes[4], bytes[3], bytes[2] },0);
                    offset = 10;
                }

                if (msgLen == 0) {
                    Console.WriteLine("msgLen == 0");
                } else if (mask) {
                    byte[] decoded = new byte[msgLen];
                    byte[] masks = new byte[4] { bytes[offset], bytes[offset + 1], bytes[offset + 2], bytes[offset + 3] };
                    offset += 4;

                    for (ulong i = 0; i < msgLen; ++i)
                        decoded[i] = (byte)(bytes[offset + i] ^ masks[i % 4]);

                    string text = Encoding.UTF8.GetString(decoded);
                    Console.WriteLine("{0}", text);
                } else
                    Console.WriteLine("mask bit not set");

                Console.WriteLine();
            }
        }
    }
}
```

### client.html

```html
<!doctype html>
<html lang="en">
  <head>
    <link rel="stylesheet" href="styles.css" />
    <script src="client.js" defer></script>
  </head>
  <body>
    <h2>WebSocket Test</h2>
    <textarea cols="60" rows="6"></textarea>
    <button>send</button>
    <div id="output"></div>
  </body>
</html>
```

### styles.css

```css
textarea {
  vertical-align: bottom;
}
#output {
  overflow: auto;
}
#output > p {
  overflow-wrap: break-word;
}
#output span {
  color: blue;
}
#output span.error {
  color: red;
}
```

### client.js

```js
// http://www.websocket.org/echo.html
const button = document.querySelector("button");
const output = document.querySelector("#output");
const textarea = document.querySelector("textarea");
const wsUri = "ws://127.0.0.1/";
const websocket = new WebSocket(wsUri);

button.addEventListener("click", onClickButton);

websocket.onopen = (e) => {
  writeToScreen("CONNECTED");
  doSend("WebSocket rocks");
};

websocket.onclose = (e) => {
  writeToScreen("DISCONNECTED");
};

websocket.onmessage = (e) => {
  writeToScreen(`<span>RESPONSE: ${e.data}</span>`);
};

websocket.onerror = (e) => {
  writeToScreen(`<span class="error">ERROR:</span> ${e.data}`);
};

function doSend(message) {
  writeToScreen(`SENT: ${message}`);
  websocket.send(message);
}

function writeToScreen(message) {
  output.insertAdjacentHTML("afterbegin", `<p>${message}</p>`);
}

function onClickButton() {
  const text = textarea.value;

  text && doSend(text);
  textarea.value = "";
  textarea.focus();
}
```

## Xem thêm

- [Viết máy chủ WebSocket](/en-US/docs/Web/API/WebSockets_API/Writing_WebSocket_servers)
