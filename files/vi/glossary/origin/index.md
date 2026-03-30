---
title: Nguồn gốc
slug: Glossary/Origin
page-type: glossary-definition
sidebar: glossarysidebar
---

**Origin** (nguồn gốc) của nội dung web được xác định bởi _scheme_ (giao thức), _hostname_ (tên miền), và _port_ (cổng) của {{Glossary("URL")}} dùng để truy cập nó. Hai đối tượng có cùng origin chỉ khi scheme, hostname và port đều trùng khớp.

Một số thao tác bị giới hạn với nội dung cùng origin, và giới hạn này có thể được gỡ bỏ bằng cách sử dụng {{Glossary("CORS")}}.

## Origin mờ đục (Opaque origin)

Origin mờ đục là một loại giá trị nội bộ của trình duyệt đặc biệt, che khuất origin thực sự của tài nguyên (origin mờ đục luôn được tuần tự hóa thành `null`). Trình duyệt dùng chúng để đảm bảo sự cô lập tài nguyên vì chúng không bao giờ được coi là bằng với bất kỳ origin nào khác — kể cả các origin mờ đục khác.

Origin mờ đục được áp dụng trong các trường hợp mà origin thực sự của tài nguyên nhạy cảm, không thể dùng an toàn cho kiểm tra bảo mật, hoặc không tồn tại. Một tài nguyên có origin mờ đục sẽ có tiêu đề HTTP {{httpheader("Origin")}} trong các yêu cầu được đặt thành [`null`](/en-US/docs/Web/HTTP/Reference/Headers/Origin#null). Nó cũng sẽ thất bại trong kiểm tra cùng origin với bất kỳ tài nguyên nào khác, và do đó bị giới hạn chỉ những thao tác dành cho tài nguyên khác origin.

Các trường hợp phổ biến có origin mờ đục bao gồm:

- Một tài liệu trong iframe có thuộc tính [sandbox](/en-US/docs/Web/HTTP/Reference/Headers/Content-Security-Policy/sandbox) được đặt, và không bao gồm cờ `allow-same-origin`.
- URL `file:` thường được coi là origin mờ đục để các tệp trên hệ thống tệp không thể đọc lẫn nhau.
- Các tài liệu được tạo theo chương trình bằng các API như {{domxref("DOMImplementation.createDocument()")}}.

## Ví dụ

Đây là cùng origin vì chúng có cùng scheme (`http`) và hostname (`example.com`), đường dẫn tệp khác nhau không quan trọng:

- `http://example.com/app1/index.html`
- `http://example.com/app2/index.html`

Đây là cùng origin vì máy chủ phục vụ nội dung HTTP qua cổng 80 theo mặc định:

- `http://example.com:80`
- `http://example.com`

Đây không phải cùng origin vì chúng dùng scheme khác nhau:

- `http://example.com/app1`
- `https://example.com/app2`

Đây không phải cùng origin vì chúng dùng hostname khác nhau:

- `http://example.com`
- `http://www.example.com`
- `http://myapp.example.com`

Đây không phải cùng origin vì chúng dùng port khác nhau:

- `http://example.com`
- `http://example.com:8080`

## Xem thêm

- [Chính sách cùng origin](/en-US/docs/Web/Security/Defenses/Same-origin_policy)
- Các thuật ngữ liên quan:
  - {{Glossary("Site")}}
- [Đặc tả HTML: origin](https://html.spec.whatwg.org/multipage/origin.html#origin)
