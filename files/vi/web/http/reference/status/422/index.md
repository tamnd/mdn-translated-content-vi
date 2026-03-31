---
title: 422 Unprocessable Content
slug: Web/HTTP/Reference/Status/422
page-type: http-status-code
spec-urls: https://httpwg.org/specs/rfc9110.html#status.422
sidebar: http
---

Mã trạng thái HTTP **`422 Unprocessable Content`** [phản hồi lỗi phía client](/en-US/docs/Web/HTTP/Reference/Status#client_error_responses) cho biết máy chủ đã hiểu kiểu nội dung của nội dung yêu cầu và cú pháp của nội dung yêu cầu là đúng, nhưng không thể xử lý các chỉ thị chứa trong đó.

Client nhận được phản hồi `422` nên hiểu rằng việc lặp lại yêu cầu mà không sửa đổi sẽ thất bại với cùng lỗi đó.

## Trạng thái

```http
422 Unprocessable Content
```

## Ví dụ

### Xác thực SHA thất bại

Ví dụ sau thực hiện yêu cầu cập nhật nội dung tệp ([dựa trên API của GitHub](https://docs.github.com/en/rest/repos/contents?apiVersion=2022-11-28#create-or-update-file-contents)).
Trường `content` được mã hóa {{glossary("Base64")}} và sử dụng ký tự xuống dòng `\n` mỗi 60 ký tự, với một ký tự kết thúc chuỗi:

```http
PUT /repos/mdn/content/contents/README.md HTTP/1.1
Host: api.example.com
Accept: application/vnd.github+json
Authorization: Bearer abcd123
Content-Type: application/json
Content-Length: 165

{
  "message": "My commit",
  "content": "WW9zaGkgd2FzIHRoZXJlLCBzbyB3ZXJlIEF5c2UsIGFuZCBCZWxnaW4uIEl0\nIHdhcyBncmVhdCE=\n",
  "sha": "80e73970fdee49dbdbac27c1f565d1eb1975d519"
}
```

Trong triển khai này, máy chủ yêu cầu nội dung Base64 tuân thủ chặt chẽ {{rfc("4648")}} (sử dụng [phương thức mã hóa nghiêm ngặt](https://ruby-doc.org/3.3.2/stdlibs/base64/Base64.html#method-i-strict_encode64)).
Phản hồi `422` Unprocessable Content được trả về và trường `message` cung cấp bối cảnh về lỗi xác thực:

```http
HTTP/1.1 422 Unprocessable Content
Date: Fri, 28 Jun 2024 12:00:00 GMT
Content-Type: application/json; charset=utf-8
Content-Length: 187

{
  "message": "content is not valid Base64",
  "documentation_url": "https://docs.example.com/en/rest/repos/contents"
}
```

## Đặc tả kỹ thuật

{{Specifications}}

## Xem thêm

- [Mã trạng thái phản hồi HTTP](/en-US/docs/Web/HTTP/Reference/Status)
