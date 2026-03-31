---
title: 416 Range Not Satisfiable
slug: Web/HTTP/Reference/Status/416
page-type: http-status-code
spec-urls: https://www.rfc-editor.org/rfc/rfc9110#status.416
sidebar: http
---

Mã trạng thái HTTP **`416 Range Not Satisfiable`** [phản hồi lỗi phía client](/en-US/docs/Web/HTTP/Reference/Status#client_error_responses) cho biết máy chủ không thể phục vụ các phạm vi được yêu cầu.
Lý do có khả năng nhất cho phản hồi này là tài liệu không chứa các [phạm vi](/en-US/docs/Web/HTTP/Guides/Range_requests) như vậy, hoặc giá trị tiêu đề {{HTTPHeader("Range")}}, mặc dù đúng về mặt cú pháp, không có ý nghĩa.

Thông điệp phản hồi `416` nên chứa {{HTTPHeader("Content-Range")}} cho biết phạm vi không thỏa mãn (tức là `'*'`) theo sau là `'/'` và độ dài hiện tại của tài nguyên, ví dụ: `Content-Range: bytes */12777`

Khi gặp lỗi này, trình duyệt thường hủy thao tác (ví dụ, tải xuống sẽ được coi là không thể tiếp tục) hoặc yêu cầu lại toàn bộ tài liệu mà không có phạm vi.

## Trạng thái

```http
416 Range Not Satisfiable
```

## Ví dụ

### Yêu cầu phạm vi không đúng định dạng

Yêu cầu sau hỏi phạm vi từ byte 1000-1999 từ tệp văn bản.
Vị trí đầu tiên (1000) lớn hơn tài nguyên thực sự trên máy chủ (800 byte):

```http
GET /files/prose.txt HTTP/1.1
Host: example.com
Range: bytes=1000-1999
```

Máy chủ hỗ trợ yêu cầu phạm vi và gửi lại độ dài hiện tại của biểu diễn đã chọn trong tiêu đề {{HTTPHeader("Content-Range")}}:

```http
HTTP/1.1 416 Range Not Satisfiable
Date: Fri, 28 Jun 2024 11:40:58 GMT
Content-Range: bytes */800
```

## Đặc tả kỹ thuật

{{Specifications}}

## Xem thêm

- [Mã trạng thái phản hồi HTTP](/en-US/docs/Web/HTTP/Reference/Status)
- {{HTTPStatus("206", "206 Partial Content")}}
- [Yêu cầu phạm vi HTTP](/en-US/docs/Web/HTTP/Guides/Range_requests)
- {{HTTPHeader("Content-Range")}}
- {{HTTPHeader("Range")}}
