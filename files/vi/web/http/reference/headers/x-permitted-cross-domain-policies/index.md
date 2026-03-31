---
title: X-Permitted-Cross-Domain-Policies header
short-title: X-Permitted-Cross-Domain-Policies
slug: Web/HTTP/Reference/Headers/X-Permitted-Cross-Domain-Policies
page-type: http-header
status:
  - non-standard
sidebar: http
---

Tiêu đề HTTP **`X-Permitted-Cross-Domain-Policies`** {{Glossary("response header")}} định nghĩa meta-policy kiểm soát liệu các tài nguyên trang web có thể được truy cập cross-origin bởi tài liệu đang chạy trong web client như Adobe Acrobat hoặc Microsoft Silverlight hay không.

Nó có thể được sử dụng trong các trường hợp trang web cần khai báo chính sách cross-domain, nhưng không thể ghi vào thư mục gốc của tên miền.

Việc sử dụng tiêu đề này ít phổ biến hơn kể từ khi Adobe Flash Player và Microsoft Silverlight đã bị không dùng nữa.
Một số công cụ kiểm tra bảo mật vẫn kiểm tra sự hiện diện của tiêu đề `X-Permitted-Cross-Domain-Policies: none` vì nó có thể giảm thiểu rủi ro của tệp chính sách quá cho phép được thêm vào trang web của bạn do tai nạn hoặc qua các hành động độc hại.

<table class="properties">
  <tbody>
    <tr>
      <th scope="row">Loại tiêu đề</th>
      <td>{{Glossary("Response header")}}</td>
    </tr>
  </tbody>
</table>

## Cú pháp

```http
X-Permitted-Cross-Domain-Policies: <permitted-cross-domain-policy>
```

## Chỉ thị

- `none`
  - : Không có tệp chính sách nào được phép ở bất kỳ đâu trên máy chủ mục tiêu, kể cả trong tệp chính sách master.
- `master-only`
  - : Cho phép truy cập cross-domain đến tệp chính sách master được định nghĩa trên cùng tên miền.
- `by-content-type` (chỉ HTTP/HTTPS)
  - : Chỉ cho phép các tệp chính sách được phục vụ với `Content-Type: text/x-cross-domain-policy`.
- `by-ftp-filename` (chỉ FTP)
  - : Chỉ cho phép các tệp chính sách có tên tệp là `crossdomain.xml` (URL kết thúc bằng `/crossdomain.xml`).
- `all`
  - : Tất cả tệp chính sách trên tên miền mục tiêu này được phép.
- `none-this-response`
  - : Cho biết rằng tài liệu hiện tại không nên được sử dụng như tệp chính sách mặc dù có các tiêu đề khác hoặc nội dung của nó.
    Giá trị này là duy nhất cho tiêu đề HTTP.

## Mô tả

Các web client như Adobe Acrobat hoặc Apache Flex có thể tải tài liệu web, có thể lần lượt tải tài nguyên từ cùng trang web hoặc trang web khác.
Quyền truy cập bị hạn chế đến tài nguyên cùng trang web theo mặc định, do [chính sách same origin](/en-US/docs/Web/Security/Defenses/Same-origin_policy), nhưng các trang cross-origin có thể chọn để làm một số hoặc tất cả tài nguyên của họ có sẵn cho máy khách cross-origin bằng cách sử dụng các tệp đặc biệt, được gọi là tệp chính sách cross-domain.

Tệp chính sách cross-domain "master" có thể được định nghĩa là tệp `crossdomain.xml` trong thư mục gốc của tên miền, ví dụ: `http://example.com/crossdomain.xml`.
Tệp master định nghĩa _meta-policy_ cho toàn bộ trang web bằng cách sử dụng thuộc tính `permitted-cross-domain-policies` của thẻ `<site-control>`.
Meta-policy kiểm soát liệu có chính sách nào được phép, và các điều kiện cho các tệp chính sách cross-domain "con" khác được sử dụng.
Các tệp chính sách khác này có thể được tạo trong các thư mục cụ thể để chỉ định quyền truy cập đối với các tệp trong cây thư mục đã cho.

Ví dụ, đây là định nghĩa chính sách master ít cho phép nhất, không cho phép bất kỳ truy cập nào, và không cho phép sử dụng các tệp chính sách "con" khác.

```xml
<?xml version="1.0"?>
<!DOCTYPE cross-domain-policy SYSTEM "http://www.adobe.com/xml/dtds/cross-domain-policy.dtd">
<cross-domain-policy>
  <site-control permitted-cross-domain-policies="none"/>
</cross-domain-policy>
```

Tiêu đề `X-Permitted-Cross-Domain-Policies` có thể chỉ định meta-policy cho phản hồi HTTP mà nó được bao gồm, hoặc ghi đè meta-policy được định nghĩa trong tệp chính sách cross-domain master, nếu có.
Nó lấy các giá trị giống như thuộc tính `permitted-cross-domain-policies` của tệp và ngoài ra `none-this-response`.

Phổ biến nhất, nó được sử dụng để ngăn chặn bất kỳ quyền truy cập nào đến tài nguyên trang web trong các trường hợp nhà phát triển không có quyền truy cập để tạo tệp chính sách cross-domain master trong gốc trang web.

## Ví dụ

### Không cho phép tệp chính sách cross-domain

Nếu bạn không cần tải dữ liệu ứng dụng trong các máy khách như Adobe Flash Player hoặc Adobe Acrobat (hoặc các máy khách cũ), thì tiêu đề nên được cấu hình là `X-Permitted-Cross-Domain-Policies: none`:

```http
X-Permitted-Cross-Domain-Policies: none
```

## Đặc tả

Được tài liệu trong [Adobe Cross Domain Policy File Specification](https://www.adobe.com/devnet-docs/acrobatetk/tools/AppSec/CrossDomain_PolicyFile_Specification.pdf).

## Xem thêm

- [Cross-Origin Resource Sharing (CORS)](/en-US/docs/Web/HTTP/Guides/CORS)
- [Hướng dẫn triển khai bảo mật thực tế](/en-US/docs/Web/Security/Practical_implementation_guides)
- [HTTP Observatory](/en-US/observatory/) công cụ kiểm tra tiêu đề
- [Cross Domain Configuration](https://www.adobe.com/devnet-docs/acrobatetk/tools/AppSec/xdomain.html) trên adobe.com
- [X-Permitted-Cross-Domain-Policies](https://github.com/OWASP/www-project-secure-headers/blob/master/tab_headers.md#x-permitted-cross-domain-policies) trong OWASP Secure Headers Project
