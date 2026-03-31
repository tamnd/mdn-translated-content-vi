---
title: Yêu cầu phạm vi HTTP
short-title: Yêu cầu phạm vi
slug: Web/HTTP/Guides/Range_requests
page-type: guide
sidebar: http
---

Yêu cầu {{HTTPHeader("Range")}} HTTP yêu cầu máy chủ gửi lại các phần của tài nguyên cho client.
Yêu cầu phạm vi hữu ích cho nhiều client khác nhau, bao gồm trình phát phương tiện hỗ trợ truy cập ngẫu nhiên, công cụ dữ liệu chỉ yêu cầu một phần của tệp lớn, và trình quản lý tải xuống cho phép người dùng tạm dừng và tiếp tục tải xuống.

## Kiểm tra xem máy chủ có hỗ trợ yêu cầu một phần không

Nếu phản hồi HTTP bao gồm tiêu đề {{HTTPHeader("Accept-Ranges")}} với bất kỳ giá trị nào ngoài `none`, máy chủ hỗ trợ yêu cầu phạm vi.
Nếu các phản hồi bỏ qua tiêu đề `Accept-Ranges`, điều này cho biết máy chủ không hỗ trợ các yêu cầu một phần.
Nếu yêu cầu phạm vi không được hỗ trợ, các ứng dụng có thể thích nghi với điều kiện này; ví dụ, trình quản lý tải xuống có thể vô hiệu hóa các nút tạm dừng dựa vào yêu cầu phạm vi để tiếp tục tải xuống.

Để kiểm tra xem máy chủ có hỗ trợ yêu cầu phạm vi hay không, bạn có thể đưa ra yêu cầu {{HTTPMethod("HEAD")}} để kiểm tra các tiêu đề mà không yêu cầu toàn bộ tài nguyên.
Nếu bạn sử dụng [curl](https://curl.se/), bạn có thể sử dụng cờ `-I` để thực hiện yêu cầu `HEAD`:

```bash
curl -I https://i.imgur.com/z4d4kWk.jpg
```

Điều này sẽ tạo ra yêu cầu HTTP sau:

```http
HEAD /z4d4kWk.jpg HTTP/2
Host: i.imgur.com
User-Agent: curl/8.7.1
Accept: */*
```

Phản hồi chỉ chứa tiêu đề và không bao gồm nội dung phản hồi:

```http
HTTP/2 200
content-type: image/jpeg
last-modified: Thu, 02 Feb 2017 11:15:53 GMT
…
accept-ranges: bytes
content-length: 146515
```

Trong phản hồi này, `Accept-Ranges: bytes` cho biết 'bytes' có thể được sử dụng như đơn vị để định nghĩa một phạm vi (hiện tại, không có đơn vị nào khác có thể).
Tiêu đề {{HTTPHeader("Content-Length")}} cũng hữu ích vì nó cho biết tổng kích thước của hình ảnh nếu bạn thực hiện cùng yêu cầu bằng phương thức `GET`.

## Yêu cầu một phạm vi cụ thể từ máy chủ

Nếu máy chủ hỗ trợ yêu cầu phạm vi, bạn có thể chỉ định phần (hoặc các phần) nào của tài liệu mà bạn muốn máy chủ trả về bằng cách bao gồm tiêu đề {{HTTPHeader("Range")}} trong yêu cầu HTTP.

### Phạm vi đơn

Chúng ta có thể yêu cầu một phạm vi duy nhất từ tài nguyên bằng curl để minh họa.
Tùy chọn `-H` thêm một dòng tiêu đề vào yêu cầu, trong trường hợp này là tiêu đề `Range` yêu cầu 1024 byte đầu tiên.
Tùy chọn cuối cùng là `--output -` sẽ cho phép in đầu ra nhị phân ra terminal:

```bash
curl https://i.imgur.com/z4d4kWk.jpg -i -H "Range: bytes=0-1023" --output -
```

Yêu cầu được đưa ra trông như sau:

```http
GET /z4d4kWk.jpg HTTP/2
Host: i.imgur.com
User-Agent: curl/8.7.1
Accept: */*
Range: bytes=0-1023
```

Máy chủ phản hồi với trạng thái {{HTTPStatus("206", "206 Partial Content")}}:

```http
HTTP/2 206
content-type: image/jpeg
content-length: 1024
content-range: bytes 0-1023/146515
…

(binary content)
```

Tiêu đề {{HTTPHeader("Content-Length")}} cho biết kích thước của phạm vi được yêu cầu, không phải kích thước đầy đủ của hình ảnh.
Tiêu đề phản hồi {{HTTPHeader("Content-Range")}} cho biết thông điệp một phần này thuộc về đâu trong tài nguyên đầy đủ.

### Phạm vi nhiều phần

Tiêu đề {{HTTPHeader("Range")}} cũng cho phép bạn lấy nhiều phạm vi cùng một lúc trong tài liệu nhiều phần. Các phạm vi được phân tách bằng dấu phẩy.

```bash
curl http://www.example.com -i -H "Range: bytes=0-50, 100-150"
```

Máy chủ phản hồi với trạng thái {{HTTPStatus("206", "206 Partial Content")}} như được hiển thị bên dưới.
Phản hồi chứa tiêu đề {{HTTPHeader("Content-Type")}}, cho biết rằng một byterange nhiều phần theo sau.
Chuỗi ranh giới (`3d6b6a416f9b5` trong trường hợp này) phân tách các phần nội dung, mỗi phần có các trường `Content-Type` và `Content-Range` riêng của nó:

```http
HTTP/1.1 206 Partial Content
Content-Type: multipart/byteranges; boundary=3d6b6a416f9b5
Content-Length: 282

--3d6b6a416f9b5
Content-Type: text/html
Content-Range: bytes 0-50/1270

<!doctype html>
<html lang="en-US">
<head>
    <title>Example Do
--3d6b6a416f9b5
Content-Type: text/html
Content-Range: bytes 100-150/1270

eta http-equiv="Content-type" content="text/html; c
--3d6b6a416f9b5--
```

### Yêu cầu phạm vi có điều kiện

Khi tiếp tục yêu cầu thêm các phần của tài nguyên, bạn cần đảm bảo rằng tài nguyên đã lưu trữ không bị sửa đổi kể từ khi nhận được phân đoạn cuối cùng.

Tiêu đề yêu cầu HTTP {{HTTPHeader("If-Range")}} làm cho yêu cầu phạm vi có điều kiện: nếu điều kiện được đáp ứng, yêu cầu phạm vi sẽ được đưa ra và máy chủ gửi lại câu trả lời {{HTTPStatus("206")}} `Partial Content` với nội dung phù hợp. Nếu điều kiện không được đáp ứng, toàn bộ tài nguyên được gửi lại, với trạng thái {{HTTPStatus("200")}} `OK`. Tiêu đề này có thể được sử dụng với trình xác nhận {{HTTPHeader("Last-Modified")}}, hoặc với {{HTTPHeader("ETag")}}, nhưng không cả hai.

```http
If-Range: Wed, 21 Oct 2015 07:28:00 GMT
```

## Các phản hồi yêu cầu một phần

Có ba trạng thái liên quan khi làm việc với yêu cầu phạm vi:

- Yêu cầu phạm vi thành công gây ra trạng thái {{HTTPStatus("206")}} `Partial Content` từ máy chủ.
- Yêu cầu phạm vi nằm ngoài giới hạn sẽ dẫn đến trạng thái {{HTTPStatus("416")}} `Requested Range Not Satisfiable`, có nghĩa là không có giá trị phạm vi nào chồng lên phạm vi của tài nguyên. Ví dụ, byte đầu tiên của mọi phạm vi có thể lớn hơn độ dài tài nguyên.
- Nếu yêu cầu phạm vi không được hỗ trợ, trạng thái {{HTTPStatus("200")}} `OK` được gửi lại và toàn bộ nội dung phản hồi được truyền.

## So sánh với `Transfer-Encoding` chunked

Tiêu đề {{HTTPHeader("Transfer-Encoding")}} cho phép mã hóa chunked, điều này hữu ích khi lượng dữ liệu lớn hơn được gửi đến client và tổng kích thước của phản hồi không được biết cho đến khi yêu cầu được xử lý đầy đủ. Máy chủ gửi dữ liệu đến client ngay lập tức mà không cần đệm phản hồi hoặc xác định độ dài chính xác, điều này dẫn đến cải thiện độ trễ. Yêu cầu phạm vi và chunking tương thích và có thể được sử dụng với hoặc không có nhau.

## Xem thêm

- Các mã trạng thái liên quan {{HTTPStatus("200")}}, {{HTTPStatus("206")}}, {{HTTPStatus("416")}}.
- Các tiêu đề liên quan: {{HTTPHeader("Accept-Ranges")}}, {{HTTPHeader("Range")}}, {{HTTPHeader("Content-Range")}}, {{HTTPHeader("If-Range")}}, {{HTTPHeader("Transfer-Encoding")}}.
