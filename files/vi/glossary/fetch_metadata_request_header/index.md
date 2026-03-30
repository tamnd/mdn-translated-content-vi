---
title: Header yêu cầu siêu dữ liệu fetch
slug: Glossary/Fetch_metadata_request_header
page-type: glossary-definition
sidebar: glossarysidebar
---

**Tiêu đề yêu cầu fetch metadata** là một {{Glossary("Request header", "tiêu đề yêu cầu HTTP")}} cung cấp thêm thông tin về ngữ cảnh mà từ đó yêu cầu được khởi tạo. Điều này cho phép máy chủ quyết định xem một yêu cầu có nên được cho phép hay không, dựa trên nơi yêu cầu xuất phát và cách tài nguyên sẽ được sử dụng.

Với thông tin này, máy chủ có thể thực thi chính sách cô lập tài nguyên, cho phép các trang web bên ngoài chỉ yêu cầu những tài nguyên được thiết kế để chia sẻ và được sử dụng đúng cách. Cách tiếp cận này có thể giúp giảm thiểu các lỗ hổng web xuyên trang phổ biến như {{Glossary("CSRF")}}, Cross-site Script Inclusion (XSSI), tấn công định thời và rò rỉ thông tin từ nguồn gốc chéo.

Các tiêu đề này được đặt tiền tố bằng `Sec-`, do đó là {{Glossary("Forbidden request header", "tiêu đề yêu cầu bị cấm")}}. Vì vậy, chúng không thể được sửa đổi từ JavaScript.

Các tiêu đề yêu cầu fetch metadata bao gồm:

- {{HTTPHeader("Sec-Fetch-Site")}}
- {{HTTPHeader("Sec-Fetch-Mode")}}
- {{HTTPHeader("Sec-Fetch-User")}}
- {{HTTPHeader("Sec-Fetch-Dest")}}

Các tiêu đề yêu cầu sau đây không _hoàn toàn_ là "tiêu đề yêu cầu fetch metadata", vì chúng không nằm trong cùng đặc tả, nhưng tương tự cũng cung cấp thông tin về ngữ cảnh về cách tài nguyên sẽ được sử dụng.
Máy chủ có thể sử dụng chúng để sửa đổi hành vi bộ nhớ đệm hoặc thông tin được trả về:

- {{HTTPHeader("Sec-Purpose")}}
- {{HTTPHeader("Service-Worker-Navigation-Preload")}}

## Xem thêm

- [Protect your resources from web attacks with Fetch Metadata](https://web.dev/articles/fetch-metadata) (web.dev)
- [Fetch Metadata Request Headers playground](https://secmetadata.appspot.com/) (secmetadata.appspot.com)
- [Danh sách tất cả các tiêu đề HTTP](/en-US/docs/Web/HTTP/Reference/Headers)
- [Danh sách tất cả các tiêu đề HTTP > Tiêu đề yêu cầu fetch metadata](/en-US/docs/Web/HTTP/Reference/Headers#fetch_metadata_request_headers)
- Các thuật ngữ liên quan:
  - {{Glossary("Representation header")}}
  - {{Glossary("HTTP_header","HTTP header")}}
  - {{Glossary("Response header")}}
  - {{Glossary("Request header")}}
