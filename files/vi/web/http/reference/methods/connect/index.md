---
title: CONNECT request method
short-title: CONNECT
slug: Web/HTTP/Reference/Methods/CONNECT
page-type: http-method
browser-compat: http.methods.CONNECT
sidebar: http
---

Phương thức HTTP **`CONNECT`** yêu cầu {{Glossary("Proxy server", "proxy")}} thiết lập một đường hầm HTTP đến máy chủ đích, và nếu thành công, chuyển tiếp dữ liệu một cách mù quáng theo cả hai hướng cho đến khi đường hầm bị đóng.

Mục tiêu yêu cầu là duy nhất đối với phương thức này ở chỗ nó chỉ bao gồm tên máy chủ và số cổng của đích đường hầm, được phân tách bằng dấu hai chấm (xem [Cú pháp](#cú-pháp) để biết chi tiết).
Bất kỳ [mã trạng thái phản hồi thành công 2XX](/en-US/docs/Web/HTTP/Reference/Status#successful_responses) nào đều có nghĩa là proxy sẽ chuyển sang 'chế độ đường hầm' và bất kỳ dữ liệu nào trong phần thân phản hồi thành công đều đến từ máy chủ được xác định bởi mục tiêu yêu cầu.

Nếu một trang web đứng sau proxy và được thi hành thông qua các quy tắc mạng rằng tất cả lưu lượng bên ngoài phải đi qua proxy, phương thức `CONNECT` cho phép bạn thiết lập kết nối {{Glossary("TLS")}} ({{Glossary("HTTPS")}}) với trang web đó:

- Client yêu cầu proxy tạo đường hầm kết nối {{Glossary("TCP")}} đến đích mong muốn.
- Máy chủ proxy thực hiện kết nối bảo mật đến máy chủ thay mặt cho client.
- Sau khi kết nối được thiết lập, máy chủ proxy tiếp tục chuyển tiếp luồng TCP đến và đi từ client.

Ngoài việc cho phép truy cập bảo mật vào các trang web đứng sau proxy, đường hầm HTTP cung cấp cách cho phép lưu lượng bị hạn chế (SSH hoặc FTP) đi qua giao thức HTTP(S).

`CONNECT` là phương thức hop-by-hop (từng chặng), nghĩa là các proxy sẽ chỉ chuyển tiếp yêu cầu `CONNECT` nếu có một proxy nội tuyến khác ở phía trước máy chủ gốc vì hầu hết các máy chủ gốc không triển khai `CONNECT`.

> [!WARNING]
> Nếu bạn đang chạy proxy hỗ trợ `CONNECT`, hãy giới hạn việc sử dụng nó cho một tập hợp các cổng đã biết hoặc danh sách các mục tiêu yêu cầu an toàn có thể cấu hình.
> Có những rủi ro đáng kể trong việc thiết lập đường hầm đến các máy chủ tùy ý, đặc biệt khi đích là cổng TCP nổi tiếng hoặc được dành riêng không nhằm mục đích lưu lượng Web.
> Proxy được cấu hình lỏng lẻo có thể bị lạm dụng để chuyển tiếp lưu lượng như SMTP để chuyển tiếp thư rác, chẳng hạn.

<table class="properties">
  <tbody>
    <tr>
      <th scope="row">Yêu cầu có phần thân</th>
      <td>Không</td>
    </tr>
    <tr>
      <th scope="row">Phản hồi thành công có phần thân</th>
      <td>Không</td>
    </tr>
    <tr>
      <th scope="row">{{Glossary("Safe/HTTP", "An toàn")}}</th>
      <td>Không</td>
    </tr>
    <tr>
      <th scope="row">{{Glossary("Idempotent", "Bất biến")}}</th>
      <td>Không</td>
    </tr>
    <tr>
      <th scope="row">{{Glossary("Cacheable", "Có thể lưu đệm")}}</th>
      <td>Không</td>
    </tr>
    <tr>
      <th scope="row">
        Cho phép trong <a href="/en-US/docs/Learn_web_development/Extensions/Forms">HTML forms</a>
      </th>
      <td>Không</td>
    </tr>
  </tbody>
</table>

## Cú pháp

```http
CONNECT <host>:<port> HTTP/1.1
```

- `<host>`
  - : Một máy chủ có thể là tên máy chủ đã đăng ký (ví dụ: `example.com`) hoặc địa chỉ IP (IPv4, IPv6).
- `<port>`
  - : Số cổng theo thập phân (ví dụ: `80`, `443`). Không có cổng mặc định, vì vậy client **phải** gửi một cổng.

## Ví dụ

### Ủy quyền proxy

Yêu cầu đến các máy chủ proxy yêu cầu ủy quyền để tạo đường hầm trông như sau.
Xem tiêu đề {{HTTPHeader("Proxy-Authorization")}} để biết thêm thông tin.

```http
CONNECT server.example.com:80 HTTP/1.1
Host: server.example.com:80
Proxy-Authorization: basic aGVsbG86d29ybGQ=
```

## Đặc tả

{{Specifications}}

## Khả năng tương thích với trình duyệt

{{Compat}}

## Xem thêm

- [Các phương thức yêu cầu HTTP](/en-US/docs/Web/HTTP/Reference/Methods)
- [Mã trạng thái phản hồi HTTP](/en-US/docs/Web/HTTP/Reference/Status)
- [Tiêu đề HTTP](/en-US/docs/Web/HTTP/Reference/Headers)
- Mục từ điển thuật ngữ {{Glossary("Proxy server")}}
- Tiêu đề {{HTTPHeader("Proxy-Authorization")}}
- [How To Use SSH Over An HTTP Proxy](https://www.dimoulis.net/posts/ssh-over-proxy/) dimoulis.net (2023)
