---
title: X-XSS-Protection header
short-title: X-XSS-Protection
slug: Web/HTTP/Reference/Headers/X-XSS-Protection
page-type: http-header
status:
  - deprecated
  - non-standard
browser-compat: http.headers.X-XSS-Protection
sidebar: http
---

{{Non-standard_header}}{{deprecated_header}}

> [!WARNING]
> Mặc dù tính năng này có thể bảo vệ người dùng của các trình duyệt web cũ không hỗ trợ {{Glossary("CSP")}}, trong một số trường hợp, **`X-XSS-Protection` có thể tạo ra lỗ hổng XSS** trong các trang web khác an toàn.
> Xem phần [Cân nhắc bảo mật](#security_considerations) bên dưới để biết thêm thông tin.

Tiêu đề HTTP **`X-XSS-Protection`** {{Glossary("response header")}} là tính năng của Internet Explorer, Chrome và Safari đã ngừng tải trang khi phát hiện các cuộc tấn công cross-site scripting ({{Glossary("Cross-site_scripting", "XSS")}}) được phản chiếu.
Các bảo vệ này phần lớn là không cần thiết trong các trình duyệt hiện đại khi các trang web triển khai {{HTTPHeader("Content-Security-Policy")}} mạnh mẽ vô hiệu hóa việc sử dụng JavaScript nội tuyến (`'unsafe-inline'`).

Nên sử dụng [`Content-Security-Policy`](/en-US/docs/Web/HTTP/Reference/Headers/Content-Security-Policy) thay vì lọc XSS.

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
X-XSS-Protection: 0
X-XSS-Protection: 1
X-XSS-Protection: 1; mode=block
X-XSS-Protection: 1; report=<reporting-uri>
```

## Chỉ thị

- `0`
  - : Tắt lọc XSS.
- `1`
  - : Bật lọc XSS (thường là mặc định trong các trình duyệt). Nếu phát hiện cuộc tấn công cross-site scripting, trình duyệt sẽ làm sạch trang (xóa các phần không an toàn).
- `1; mode=block`
  - : Bật lọc XSS. Thay vì làm sạch trang, trình duyệt sẽ ngăn hiển thị trang nếu phát hiện cuộc tấn công.
- `1; report=<reporting-URI>` (chỉ Chromium)
  - : Bật lọc XSS. Nếu phát hiện cuộc tấn công cross-site scripting, trình duyệt sẽ làm sạch trang và báo cáo vi phạm. Điều này sử dụng chức năng của chỉ thị CSP {{CSP("report-uri")}} để gửi báo cáo.

## Cân nhắc bảo mật

### Lỗ hổng do lọc XSS

Hãy xem xét đoạn mã HTML sau cho trang web:

```html
<script>
  var productionMode = true;
</script>
<!-- [...] -->
<script>
  if (!window.productionMode) {
    // Some vulnerable debug code
  }
</script>
```

Mã này hoàn toàn an toàn nếu trình duyệt không thực hiện lọc XSS. Tuy nhiên, nếu có và truy vấn tìm kiếm là `?something=%3Cscript%3Evar%20productionMode%20%3D%20true%3B%3C%2Fscript%3E`, trình duyệt có thể thực thi các script trong trang bỏ qua `<script>var productionMode = true;</script>` (nghĩ rằng máy chủ đã bao gồm nó trong phản hồi vì nó có trong URI), gây ra `window.productionMode` được đánh giá là `undefined` và thực thi mã gỡ lỗi không an toàn.

Đặt tiêu đề `X-XSS-Protection` thành `0` hoặc `1; mode=block` ngăn chặn các lỗ hổng như được mô tả ở trên. Cái trước sẽ làm cho trình duyệt chạy tất cả script và cái sau sẽ ngăn trang không được xử lý (mặc dù cách tiếp cận này có thể dễ bị tấn công [side-channel](https://portswigger.net/research/abusing-chromes-xss-auditor-to-steal-tokens) nếu trang web có thể được nhúng trong `<iframe>`).

## Ví dụ

Chặn các trang khỏi tải khi phát hiện các cuộc tấn công XSS được phản chiếu:

```http
X-XSS-Protection: 1; mode=block
```

PHP

```php
header("X-XSS-Protection: 1; mode=block");
```

Apache (.htaccess)

```apacheconf
<IfModule mod_headers.c>
  Header set X-XSS-Protection "1; mode=block"
</IfModule>
```

Nginx

```nginx
add_header "X-XSS-Protection" "1; mode=block";
```

## Đặc tả

Không phải là một phần của bất kỳ đặc tả hoặc bản thảo nào.

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{HTTPHeader("Content-Security-Policy")}}
- [Controlling the XSS Filter – Microsoft](https://learn.microsoft.com/en-us/archive/blogs/ieinternals/controlling-the-xss-filter)
- [Understanding XSS Auditor – Virtue Security](https://www.virtuesecurity.com/understanding-xss-auditor/)
- [The misunderstood X-XSS-Protection – blog.innerht.ml](https://web.archive.org/web/20230527023943/https://blog.innerht.ml/the-misunderstood-x-xss-protection/)
