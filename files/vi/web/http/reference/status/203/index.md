---
title: 203 Non-Authoritative Information
slug: Web/HTTP/Reference/Status/203
page-type: http-status-code
spec-urls: https://httpwg.org/specs/rfc9110.html#status.203
sidebar: http
---

Mã trạng thái [phản hồi thành công](/en-US/docs/Web/HTTP/Reference/Status#successful_responses) HTTP **`203 Non-Authoritative Information`** cho biết rằng yêu cầu đã thành công, nhưng một _{{Glossary("Proxy server", "proxy")}} biến đổi_ đã sửa đổi các tiêu đề hoặc nội dung kèm theo từ phản hồi {{HTTPStatus("200")}} (`OK`) của máy chủ gốc.

Mục đích của mã trạng thái này là cho phép các proxy biến đổi thông báo cho client khi có các thay đổi được áp dụng cho các phản hồi thành công, vì điều này có thể ảnh hưởng đến các quyết định liên quan đến nội dung sau này.
Các biến đổi đối với thông điệp có thể bao gồm sửa đổi tiêu đề để chỉ ra rằng tài nguyên đến từ gương hoặc bản sao lưu, nhưng cũng có thể bao gồm sửa đổi nội dung theo cách được coi là mong muốn cho client.
Các sửa đổi này có thể bao gồm lọc phần mềm độc hại, chuyển mã định dạng, lọc quyền riêng tư, hoặc các gợi ý khác cho client về các yêu cầu tương lai.

Phản hồi `203` tương tự với giá trị `214` `Transformation Applied` của tiêu đề {{HTTPHeader("Warning")}} đã không còn được sử dụng, có thể áp dụng cho các phản hồi với bất kỳ mã trạng thái nào.

## Trạng thái

```http
203 Non-Authoritative Information
```

## Ví dụ

### Nhận phản hồi thông điệp đã được lọc

Trong ví dụ này, người dùng gửi yêu cầu `GET` cho nội dung có ID `123` đến `example.com`.

```http
GET /comments/123 HTTP/1.1
Host: example.com
```

Một proxy đã thay đổi thông điệp dựa trên các quy tắc lọc phần mềm độc hại đối với các tệp đính kèm không an toàn đã biết.
Nội dung phản hồi đã được sửa đổi, thay thế giá trị `attachment_url` thành liên kết có thông tin về bộ lọc đang áp dụng:

```http
HTTP/1.1 203 Non-Authoritative Information
Date: Wed, 26 Jun 2024 12:00:00 GMT
Server: Apache/2.4.1 (Unix)
Content-Type: application/json
Content-Length: 123

{
  "comment": "Check out my bio!",
  "attachment_url": "https://example.com/attachment-unavailable-faq"
}
```

## Đặc tả

{{Specifications}}

## Xem thêm

- {{HTTPStatus("200")}}
- {{Glossary("Proxy server")}}
- {{HTTPHeader("Warning")}}
- [Phương thức yêu cầu HTTP](/en-US/docs/Web/HTTP/Reference/Methods)
- [Mã trạng thái phản hồi HTTP](/en-US/docs/Web/HTTP/Reference/Status)
