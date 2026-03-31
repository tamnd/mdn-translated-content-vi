---
title: Một phiên HTTP điển hình
slug: Web/HTTP/Guides/Session
page-type: guide
sidebar: http
---

Trong các giao thức client-server, như HTTP, các phiên bao gồm ba giai đoạn:

1. Client thiết lập kết nối TCP (hoặc kết nối phù hợp nếu tầng vận chuyển không phải TCP).
2. Client gửi yêu cầu của mình và chờ câu trả lời.
3. Máy chủ xử lý yêu cầu, gửi lại câu trả lời, cung cấp mã trạng thái và dữ liệu phù hợp.

Kể từ HTTP/1.1, kết nối không còn bị đóng sau khi hoàn thành giai đoạn thứ ba, và client hiện được cấp thêm một yêu cầu nữa: điều này có nghĩa là giai đoạn thứ hai và thứ ba giờ có thể được thực hiện bất kỳ số lần nào.

## Thiết lập kết nối

Trong các giao thức client-server, chính client là người thiết lập kết nối. Mở kết nối trong HTTP có nghĩa là khởi tạo kết nối trong tầng vận chuyển bên dưới, thường là TCP.

Với TCP, cổng mặc định cho máy chủ HTTP trên máy tính là cổng 80. Các cổng khác cũng có thể được sử dụng, như 8000 hoặc 8080. URL của trang cần tải chứa cả tên miền và số cổng, mặc dù cái sau có thể bị bỏ qua nếu là 80. Xem [tài liệu tham khảo URL](/en-US/docs/Web/URI) để biết thêm chi tiết.

> [!NOTE]
> Mô hình client-server không cho phép máy chủ gửi dữ liệu đến client mà không có yêu cầu rõ ràng từ nó. Tuy nhiên, nhiều API Web cho phép trường hợp sử dụng này, bao gồm [Push API](/en-US/docs/Web/API/Push_API), [Server-sent events](/en-US/docs/Web/API/Server-sent_events), và [WebSockets API](/en-US/docs/Web/API/WebSockets_API).

## Gửi yêu cầu từ client

Sau khi kết nối được thiết lập, user-agent có thể gửi yêu cầu (user-agent thường là trình duyệt web, nhưng cũng có thể là bất cứ thứ gì khác, một crawler chẳng hạn). Yêu cầu của client bao gồm các chỉ thị văn bản, được phân tách bằng CRLF (ký tự xuống dòng, theo sau là ký tự xuống hàng mới), chia thành ba khối:

1. Dòng đầu tiên chứa phương thức yêu cầu theo sau là các tham số của nó:
   - đường dẫn của tài liệu, như một URL tuyệt đối mà không có giao thức hoặc tên miền
   - phiên bản giao thức HTTP

2. Các dòng tiếp theo đại diện cho tiêu đề HTTP, cung cấp cho máy chủ thông tin về loại dữ liệu phù hợp (ví dụ ngôn ngữ nào, loại MIME nào), hoặc dữ liệu khác thay đổi hành vi của nó (ví dụ không gửi câu trả lời nếu nó đã được lưu vào bộ nhớ đệm). Các tiêu đề HTTP này tạo thành một khối kết thúc bằng một dòng trống.
3. Khối cuối cùng là một khối dữ liệu tùy chọn, có thể chứa dữ liệu khác chủ yếu được sử dụng bởi phương thức POST.

### Ví dụ yêu cầu

Tải trang gốc của developer.mozilla.org, (`https://developer.mozilla.org/`), và cho máy chủ biết rằng user-agent muốn trang bằng tiếng Pháp, nếu có thể:

```http
GET / HTTP/1.1
Host: developer.mozilla.org
Accept-Language: fr

```

Hãy chú ý đến dòng trống cuối cùng, điều này phân tách khối dữ liệu khỏi khối tiêu đề. Vì không có `Content-Length` được cung cấp trong tiêu đề HTTP, khối dữ liệu này được trình bày trống, đánh dấu kết thúc của các tiêu đề, cho phép máy chủ xử lý yêu cầu ngay khi nó nhận được dòng trống này.

Ví dụ, gửi kết quả của một biểu mẫu:

```http
POST /contact_form.php HTTP/1.1
Host: developer.mozilla.org
Content-Length: 64
Content-Type: application/x-www-form-urlencoded

name=Joe%20User&request=Send%20me%20one%20of%20your%20catalogue
```

### Các phương thức yêu cầu

HTTP định nghĩa một tập hợp [các phương thức yêu cầu](/en-US/docs/Web/HTTP/Reference/Methods) cho biết hành động mong muốn cần thực hiện trên một tài nguyên. Mặc dù chúng cũng có thể là danh từ, các phương thức yêu cầu này đôi khi được gọi là các động từ HTTP. Các yêu cầu phổ biến nhất là `GET` và `POST`:

- Phương thức {{HTTPMethod("GET")}} yêu cầu biểu diễn dữ liệu của tài nguyên được chỉ định. Các yêu cầu sử dụng `GET` chỉ nên truy xuất dữ liệu.
- Phương thức {{HTTPMethod("POST")}} gửi dữ liệu đến máy chủ để nó có thể thay đổi trạng thái của mình. Đây là phương thức thường được sử dụng cho [Biểu mẫu HTML](/en-US/docs/Learn_web_development/Extensions/Forms).

## Cấu trúc của phản hồi máy chủ

Sau khi agent đã kết nối gửi yêu cầu của nó, máy chủ web xử lý nó và cuối cùng trả về phản hồi. Tương tự như yêu cầu của client, phản hồi máy chủ được hình thành từ các chỉ thị văn bản, được phân tách bằng CRLF, mặc dù chia thành ba khối:

1. Dòng đầu tiên, _dòng trạng thái_, bao gồm xác nhận phiên bản HTTP được sử dụng, theo sau là mã trạng thái phản hồi (và ý nghĩa ngắn gọn của nó theo văn bản con người có thể đọc được).
2. Các dòng tiếp theo đại diện cho các tiêu đề HTTP cụ thể, cung cấp cho client thông tin về dữ liệu được gửi (ví dụ loại, kích thước dữ liệu, thuật toán nén được sử dụng, gợi ý về bộ nhớ đệm). Tương tự như khối tiêu đề HTTP cho yêu cầu của client, các tiêu đề HTTP này tạo thành một khối kết thúc bằng một dòng trống.
3. Khối cuối cùng là khối dữ liệu, chứa dữ liệu tùy chọn.

### Ví dụ phản hồi

Phản hồi trang web thành công:

```http
HTTP/1.1 200 OK
Content-Type: text/html; charset=utf-8
Content-Length: 55743
Connection: keep-alive
Cache-Control: s-maxage=300, public, max-age=0
Content-Language: en-US
Date: Thu, 06 Dec 2018 17:37:18 GMT
ETag: "2e77ad1dc6ab0b53a2996dfd4653c1c3"
Server: meinheld/0.6.1
Strict-Transport-Security: max-age=63072000
X-Content-Type-Options: nosniff
X-Frame-Options: DENY
X-XSS-Protection: 1; mode=block
Vary: Accept-Encoding,Cookie
Age: 7

<!doctype html>
<html lang="en">
<head>
  <meta charset="utf-8">
  <title>A basic webpage</title>
</head>
<body>
  <h1>Basic HTML webpage</h1>
  <p>Hello, world!</p>
</body>
</html>
```

Thông báo rằng tài nguyên được yêu cầu đã di chuyển vĩnh viễn:

```http
HTTP/1.1 301 Moved Permanently
Server: Apache/2.4.37 (Red Hat)
Content-Type: text/html; charset=utf-8
Date: Thu, 06 Dec 2018 17:33:08 GMT
Location: https://developer.mozilla.org/ (this is the new link to the resource; it is expected that the user-agent will fetch it)
Keep-Alive: timeout=15, max=98
Accept-Ranges: bytes
Via: Moz-Cache-zlb05
Connection: Keep-Alive
Content-Length: 325 (the content contains a default page to display if the user-agent is not able to follow the link)

<!doctype html>… (contains a site-customized page helping the user to find the missing resource)
```

Thông báo rằng tài nguyên được yêu cầu không tồn tại:

```http
HTTP/1.1 404 Not Found
Content-Type: text/html; charset=utf-8
Content-Length: 38217
Connection: keep-alive
Cache-Control: no-cache, no-store, must-revalidate, max-age=0
Content-Language: en-US
Date: Thu, 06 Dec 2018 17:35:13 GMT
Expires: Thu, 06 Dec 2018 17:35:13 GMT
Server: meinheld/0.6.1
Strict-Transport-Security: max-age=63072000
X-Content-Type-Options: nosniff
X-Frame-Options: DENY
X-XSS-Protection: 1; mode=block
Vary: Accept-Encoding,Cookie
X-Cache: Error from cloudfront

<!doctype html>… (contains a site-customized page helping the user to find the missing resource)
```

### Mã trạng thái phản hồi

[Mã trạng thái phản hồi HTTP](/en-US/docs/Web/HTTP/Reference/Status) cho biết liệu một yêu cầu HTTP cụ thể đã được hoàn thành thành công hay chưa. Các phản hồi được nhóm thành năm lớp: phản hồi thông tin, phản hồi thành công, chuyển hướng, lỗi client và lỗi máy chủ.

- {{HTTPStatus(200)}}: OK. Yêu cầu đã thành công.
- {{HTTPStatus(301)}}: Đã di chuyển vĩnh viễn. Mã phản hồi này có nghĩa là URI của tài nguyên được yêu cầu đã thay đổi.
- {{HTTPStatus(404)}}: Không tìm thấy. Máy chủ không thể tìm thấy tài nguyên được yêu cầu.

## Xem thêm

- [URL](/en-US/docs/Web/URI)
- [Tiêu đề HTTP](/en-US/docs/Web/HTTP/Reference/Headers)
- [Các phương thức yêu cầu HTTP](/en-US/docs/Web/HTTP/Reference/Methods)
- [Mã trạng thái phản hồi HTTP](/en-US/docs/Web/HTTP/Reference/Status)
