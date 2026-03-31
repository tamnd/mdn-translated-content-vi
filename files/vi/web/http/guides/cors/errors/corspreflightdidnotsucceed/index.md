---
title: "Reason: CORS preflight channel did not succeed"
slug: Web/HTTP/Guides/CORS/Errors/CORSPreflightDidNotSucceed
page-type: http-cors-error
sidebar: http
---

## Lý do

```plain
Reason: CORS preflight channel did not succeed
```

## Điều gì đã xảy ra sai?

Yêu cầu {{Glossary("CORS")}} yêu cầu preflight, nhưng không thể thực hiện preflight. Có một vài lý do tại sao preflight có thể thất bại:

- Một yêu cầu xuyên site đã được thực hiện trước đó và đã thực hiện preflight, nhưng không được phép thực hiện preflight lại. Hãy đảm bảo code của bạn chỉ preflight một lần mỗi kết nối.
- Yêu cầu preflight gặp bất kỳ loại lỗi mạng nào thường có thể xảy ra.

Nếu máy chủ không nằm dưới sự kiểm soát của bạn, xem [Cân nhắc phía client](/en-US/docs/Web/HTTP/Guides/CORS/Errors#client-side_considerations) để biết các phương pháp thay thế.

## Xem thêm

- [Lỗi CORS](/en-US/docs/Web/HTTP/Guides/CORS/Errors)
- Thuật ngữ: {{Glossary("CORS")}}
- [Giới thiệu về CORS](/en-US/docs/Web/HTTP/Guides/CORS)
