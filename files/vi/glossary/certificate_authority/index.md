---
title: Certificate authority
slug: Glossary/Certificate_authority
page-type: glossary-definition
sidebar: glossarysidebar
---

**Tổ chức cấp chứng chỉ** (CA - Certificate Authority) là một tổ chức {{Glossary("Signature/Security", "ký")}} {{Glossary("Digital certificate", "chứng chỉ số")}} và các {{Glossary("Key", "khóa công khai")}} liên quan, từ đó xác nhận rằng thông tin và khóa được chứa là chính xác.

Đối với chứng chỉ số của trang web, thông tin này tối thiểu bao gồm tên của tổ chức đã yêu cầu chứng chỉ số (ví dụ: Mozilla Corporation), trang web mà nó dành cho (ví dụ: mozilla.org), và tổ chức cấp chứng chỉ.

Các tổ chức cấp chứng chỉ là một phần của [cơ sở hạ tầng khóa công khai](https://en.wikipedia.org/wiki/Public_key_infrastructure) trên Internet cho phép các trình duyệt xác minh danh tính trang web và kết nối an toàn qua TLS (và do đó là HTTPS).

> [!NOTE]
> Trình duyệt web được cài đặt sẵn với danh sách "chứng chỉ gốc". Trình duyệt có thể sử dụng những thứ này để kiểm tra đáng tin cậy rằng chứng chỉ trang web đã được ký bởi một tổ chức cấp chứng chỉ "nối chuỗi trở lại" với chứng chỉ gốc (tức là được tin cậy bởi chủ sở hữu chứng chỉ gốc hoặc CA trung gian). Cuối cùng, quá trình này dựa vào việc mỗi CA thực hiện kiểm tra danh tính đầy đủ trước khi ký chứng chỉ!

## Xem thêm

- [Certificate authority](https://en.wikipedia.org/wiki/Certificate_authority) trên Wikipedia
- [Public key infrastructure](https://en.wikipedia.org/wiki/Public_key_infrastructure) trên Wikipedia
- [Danh sách chứng chỉ CA được Mozilla đưa vào](https://wiki.mozilla.org/CA/Included_Certificates)
