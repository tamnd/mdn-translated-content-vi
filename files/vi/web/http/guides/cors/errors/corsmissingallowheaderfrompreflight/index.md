---
title: "Reason: missing token 'xyz' in CORS header 'Access-Control-Allow-Headers' from CORS preflight channel"
slug: Web/HTTP/Guides/CORS/Errors/CORSMissingAllowHeaderFromPreflight
page-type: http-cors-error
sidebar: http
---

## Lý do

```plain
Reason: missing token 'xyz' in CORS header 'Access-Control-Allow-Headers' from CORS preflight channel
```

## Điều gì đã xảy ra sai?

Header `Access-Control-Allow-Headers` được máy chủ gửi để cho client biết các header nào nó hỗ trợ cho các yêu cầu {{Glossary("CORS")}}. Giá trị của `Access-Control-Allow-Headers` phải là danh sách tên header được phân tách bằng dấu phẩy, chẳng hạn như `X-Custom-Information` hoặc bất kỳ tên header chuẩn nhưng không phải cơ bản nào (những tên luôn được phép).

Lỗi này xảy ra khi cố gắng preflight một header không được cho phép rõ ràng (tức là, nó không có trong danh sách được chỉ định bởi header `Access-Control-Allow-Headers` do máy chủ gửi). Để sửa lỗi này, máy chủ cần được cập nhật để cho phép header được chỉ định, hoặc bạn cần tránh sử dụng header đó.

Nếu máy chủ không nằm dưới sự kiểm soát của bạn, xem [Cân nhắc phía client](/en-US/docs/Web/HTTP/Guides/CORS/Errors#client-side_considerations) để biết các phương pháp thay thế.

## Xem thêm

- [Lỗi CORS](/en-US/docs/Web/HTTP/Guides/CORS/Errors)
- Thuật ngữ: {{Glossary("CORS")}}
- [Giới thiệu về CORS](/en-US/docs/Web/HTTP/Guides/CORS)
- [HTTP headers](/en-US/docs/Web/HTTP/Reference/Headers)
