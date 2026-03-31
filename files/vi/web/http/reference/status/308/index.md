---
title: 308 Permanent Redirect
slug: Web/HTTP/Reference/Status/308
page-type: http-status-code
browser-compat: http.status.308
sidebar: http
---

Mã trạng thái [phản hồi chuyển hướng](/en-US/docs/Web/HTTP/Reference/Status#redirection_messages) HTTP **`308 Permanent Redirect`** cho biết rằng tài nguyên được yêu cầu đã được di chuyển vĩnh viễn đến URL được cung cấp bởi tiêu đề {{HTTPHeader("Location")}}.

Trình duyệt nhận được trạng thái này sẽ tự động yêu cầu tài nguyên tại URL trong tiêu đề `Location`, chuyển hướng người dùng đến trang mới.

Phương thức yêu cầu và thân **sẽ không bị sửa đổi** bởi client trong yêu cầu được chuyển hướng.
{{HTTPStatus("301", "301 Moved Permanently")}} yêu cầu phương thức yêu cầu và thân không thay đổi khi thực hiện chuyển hướng, nhưng điều này bị xử lý sai bởi các client cũ khi sử dụng phương thức {{HTTPMethod("GET")}} thay thế.

> [!NOTE]
> Một số ứng dụng web có thể sử dụng `308 Permanent Redirect` theo cách không chuẩn và cho các mục đích khác.
> Ví dụ, Google Drive sử dụng phản hồi `308 Resume Incomplete` để cho biết cho client khi tải lên chưa hoàn thành bị dừng.
> Xem [Thực hiện tải xuống có thể tiếp tục](https://developers.google.com/workspace/drive/api/guides/manage-uploads) trong tài liệu Google Drive để biết thêm thông tin.

## Trạng thái

```http
308 Permanent Redirect
```

## Ví dụ

### Phản hồi 308 cho tài nguyên đã được di chuyển

```http
GET /featured HTTP/1.1
Host: www.example.org
```

```http
HTTP/1.1 308 Permanent Redirect
Location: http://www.example.com/featured
Content-Length: 0
```

## Đặc tả

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Chuyển hướng trong HTTP](/en-US/docs/Web/HTTP/Guides/Redirections)
- [Mã trạng thái phản hồi HTTP](/en-US/docs/Web/HTTP/Reference/Status)
- {{HTTPStatus("301", "301 Moved Permanently")}}, tương đương của mã trạng thái này có thể sửa đổi phương thức yêu cầu khi không phải {{HTTPMethod("GET")}}
- {{HTTPStatus("302", "302 Found")}}, chuyển hướng tạm thời
