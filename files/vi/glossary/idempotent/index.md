---
title: Bất biến
slug: Glossary/Idempotent
page-type: glossary-definition
sidebar: glossarysidebar
---

Một phương thức HTTP được gọi là **idempotent** nếu hiệu ứng dự định trên máy chủ khi thực hiện một yêu cầu duy nhất giống với hiệu ứng khi thực hiện nhiều yêu cầu giống hệt nhau.

Đặc tả HTTP định nghĩa nhiều phương thức HTTP và ngữ nghĩa của chúng, bao gồm việc chúng có idempotent hay không. Tất cả các phương thức {{glossary("Safe/HTTP","an toàn")}} đều là idempotent, cũng như {{HTTPMethod("PUT")}} và {{HTTPMethod("DELETE")}}. Các phương thức {{HTTPMethod("POST")}} và {{HTTPMethod("PATCH")}} không được đảm bảo là idempotent.

Một client có thể thử lại một yêu cầu sử dụng phương thức idempotent một cách an toàn, ví dụ, trong các trường hợp có nghi ngờ về việc yêu cầu có đến máy chủ không. Nếu nhiều yêu cầu giống hệt nhau tình cờ đến máy chủ, miễn là phương thức là idempotent, không có hại gì xảy ra.

Đặc tả HTTP chỉ định nghĩa idempotency theo nghĩa của _hiệu ứng dự định_ của client trên máy chủ. Ví dụ, yêu cầu `POST` có ý định gửi dữ liệu đến máy chủ, trong khi yêu cầu `DELETE` có ý định xóa một tài nguyên trên máy chủ. Trong thực tế, máy chủ có trách nhiệm đảm bảo các route nó cung cấp tuân theo các ngữ nghĩa này.

> [!NOTE]
> Mặc dù các máy chủ được khuyến khích mạnh mẽ tuân theo các ngữ nghĩa được quy định bởi đặc tả HTTP, đặc tả không bắt buộc điều đó. Không có gì ngăn cản một máy chủ cung cấp một endpoint không idempotent dưới một phương thức HTTP idempotent, mặc dù các client có thể ngạc nhiên.

Ngoài ra, hãy lưu ý:

- Một yêu cầu với phương thức idempotent không nhất thiết có nghĩa là yêu cầu _không_ có tác dụng phụ nào trên máy chủ, chỉ là client không có ý định tạo ra tác dụng phụ: Ví dụ, máy chủ có thể ghi lại thời gian nhận mỗi yêu cầu.
- Phản hồi được trả về bởi mỗi yêu cầu có thể khác nhau: ví dụ, lần gọi đầu tiên của {{HTTPMethod("DELETE")}} có thể trả về {{HTTPStatus("200")}}, trong khi các lần tiếp theo có thể trả về {{HTTPStatus("404")}}.

## Ví dụ

`GET /pageX HTTP/1.1` là idempotent, vì đây là phương thức an toàn (chỉ đọc). Các lần gọi liên tiếp có thể trả về dữ liệu khác nhau cho client, nếu dữ liệu trên máy chủ đã được cập nhật trong thời gian đó.

`POST /add_row HTTP/1.1` không phải idempotent; nếu nó được gọi nhiều lần, nó thêm nhiều hàng:

```http
POST /add_row HTTP/1.1
POST /add_row HTTP/1.1   -> Thêm hàng thứ 2
POST /add_row HTTP/1.1   -> Thêm hàng thứ 3
```

`DELETE /idX/delete HTTP/1.1` là idempotent, ngay cả khi mã trạng thái được trả về có thể thay đổi giữa các yêu cầu:

```http
DELETE /idX/delete HTTP/1.1   -> Trả về 200 nếu idX tồn tại
DELETE /idX/delete HTTP/1.1   -> Trả về 404 vì nó vừa bị xóa
DELETE /idX/delete HTTP/1.1   -> Trả về 404
```

## Xem thêm

- Định nghĩa của [idempotent](https://httpwg.org/specs/rfc9110.html#idempotent.methods) trong đặc tả HTTP.
- Mô tả các phương thức idempotent phổ biến: {{HTTPMethod("GET")}}, {{HTTPMethod("HEAD")}}, {{HTTPMethod("PUT")}}, {{HTTPMethod("DELETE")}}, {{HTTPMethod("OPTIONS")}}, {{HTTPMethod("TRACE")}}
- Mô tả các phương thức không idempotent phổ biến: {{HTTPMethod("POST")}}, {{HTTPMethod("PATCH")}}, {{HTTPMethod("CONNECT")}}
