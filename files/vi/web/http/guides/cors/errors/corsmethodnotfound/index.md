---
title: "Reason: Did not find method in CORS header 'Access-Control-Allow-Methods'"
slug: Web/HTTP/Guides/CORS/Errors/CORSMethodNotFound
page-type: http-cors-error
sidebar: http
---

## Lý do

```plain
Reason: Did not find method in CORS header 'Access-Control-Allow-Methods'
```

## Điều gì đã xảy ra sai?

Phương thức HTTP được sử dụng bởi yêu cầu {{Glossary("CORS")}} không có trong danh sách các phương thức được chỉ định bởi header {{HTTPHeader("Access-Control-Allow-Methods")}} của phản hồi. Header này chỉ định danh sách các phương thức HTTP phân tách bằng dấu phẩy có thể được sử dụng khi sử dụng CORS để truy cập URL được chỉ định trong yêu cầu; nếu yêu cầu đang sử dụng bất kỳ phương thức nào khác, lỗi này xảy ra.

Ví dụ: nếu phản hồi bao gồm:

```http
Access-Control-Allow-Methods: GET,HEAD,POST
```

Cố gắng sử dụng yêu cầu {{HTTPMethod("PUT")}} sẽ thất bại với lỗi này.

Hãy đảm bảo code của bạn chỉ sử dụng các phương thức HTTP được phép khi truy cập dịch vụ.

> [!NOTE]
> Nếu máy chủ bao gồm bất kỳ tên phương thức không được nhận ra hoặc không được xác định nào trong header `Access-Control-Allow-methods`, một lỗi khác sẽ xảy ra: [Reason: invalid token 'xyz' in CORS header 'Access-Control-Allow-Methods'](/en-US/docs/Web/HTTP/Guides/CORS/Errors/CORSInvalidAllowMethod).

Nếu máy chủ không nằm dưới sự kiểm soát của bạn, xem [Cân nhắc phía client](/en-US/docs/Web/HTTP/Guides/CORS/Errors#client-side_considerations) để biết các phương pháp thay thế.

## Xem thêm

- [Lỗi CORS](/en-US/docs/Web/HTTP/Guides/CORS/Errors)
- Thuật ngữ: {{Glossary("CORS")}}
- [Giới thiệu về CORS](/en-US/docs/Web/HTTP/Guides/CORS)
- [Phương thức yêu cầu HTTP](/en-US/docs/Web/HTTP/Reference/Methods)
