---
title: "Content-Security-Policy: report-uri directive"
short-title: report-uri
slug: Web/HTTP/Reference/Headers/Content-Security-Policy/report-uri
page-type: http-csp-directive
status:
  - deprecated
browser-compat: http.headers.Content-Security-Policy.report-uri
sidebar: http
---

{{deprecated_header}}

> [!WARNING]
> Chỉ thị {{CSP("report-to")}} được thiết kế để thay thế `report-uri`, và trong các trình duyệt hỗ trợ `report-to`, chỉ thị `report-uri` bị bỏ qua.
>
> Tuy nhiên cho đến khi `report-to` được hỗ trợ rộng rãi, bạn có thể chỉ định cả hai tiêu đề như sau:
>
> ```http
> Content-Security-Policy: …; report-uri https://endpoint.example.com; report-to endpoint_name
> ```

Chỉ thị **`report-uri`** lỗi thời trong HTTP {{HTTPHeader("Content-Security-Policy")}} (CSP) hướng dẫn trình duyệt báo cáo các nỗ lực vi phạm Content Security Policy.
Các báo cáo vi phạm này bao gồm các [tài liệu JSON](#violation_report_syntax) được gửi qua yêu cầu HTTP `POST` đến URI được chỉ định.

Bản thân chỉ thị không có hiệu lực và chỉ có ý nghĩa kết hợp với các chỉ thị khác.

<table class="properties">
  <tbody>
    <tr>
      <th scope="row">Phiên bản CSP</th>
      <td>1</td>
    </tr>
    <tr>
      <th scope="row">Loại chỉ thị</th>
      <td>{{Glossary("Reporting directive")}}</td>
    </tr>
    <tr>
      <th colspan="2" scope="row">
        Chỉ thị này không được hỗ trợ trong phần tử {{HTMLElement("meta")}}.
      </th>
    </tr>
  </tbody>
</table>

## Cú pháp

```http
Content-Security-Policy: report-uri <uri>;
Content-Security-Policy: report-uri <uri> <uri>;
```

- \<uri>
  - : URI chỉ định nơi báo cáo phải được gửi.

### Cú pháp báo cáo vi phạm

Đối tượng JSON báo cáo được gửi qua thao tác HTTP `POST` với {{HTTPHeader("Content-Type")}} là `application/csp-report`.

> [!NOTE]
> Báo cáo vi phạm nên được coi là dữ liệu do kẻ tấn công kiểm soát.
> Nội dung phải được làm sạch đúng cách trước khi lưu trữ hoặc hiển thị.
> Điều này đặc biệt đúng đối với thuộc tính [script-sample](#script-sample), nếu được cung cấp.

Đối tượng JSON báo cáo có một thuộc tính cấp cao nhất, `"csp-report"`, chứa một đối tượng với các thuộc tính sau:

- `blocked-uri`
  - : URI của tài nguyên bị chặn không được tải bởi Content Security Policy.
    Nếu URI bị chặn thuộc nguồn gốc khác với `document-uri`, thì URI bị chặn bị cắt bớt chỉ còn lược đồ, host và cổng.
- `disposition`
  - : Giá trị là `"enforce"` hoặc `"report"` tùy thuộc vào việc tiêu đề {{HTTPHeader("Content-Security-Policy-Report-Only")}} hay tiêu đề `Content-Security-Policy` được sử dụng.
- `document-uri`
  - : URI của tài liệu xảy ra vi phạm.
- `effective-directive`
  - : Chỉ thị mà việc thực thi gây ra vi phạm.
    Một số trình duyệt có thể cung cấp các giá trị khác nhau, chẳng hạn Chrome cung cấp `style-src-elem`/`style-src-attr`, ngay cả khi chỉ thị được thực thi là `style-src`.
- `original-policy`
  - : Chính sách gốc như được chỉ định bởi tiêu đề HTTP `Content-Security-Policy`.
- `referrer` {{Deprecated_Inline}} {{Non-standard_Inline}}
  - : Referrer của tài liệu xảy ra vi phạm.
- `script-sample`
  - : 40 ký tự đầu tiên của script nội tuyến, event handler hoặc style gây ra vi phạm.
    Vi phạm bắt nguồn từ các tệp bên ngoài không được đưa vào báo cáo.

    Điều này chỉ áp dụng cho các vi phạm [`script-src*`](/en-US/docs/Web/HTTP/Reference/Headers/Content-Security-Policy/script-src) và [`style-src*`](/en-US/docs/Web/HTTP/Reference/Headers/Content-Security-Policy/style-src), khi chỉ thị `Content-Security-Policy` tương ứng chứa từ khóa [`'report-sample'`](/en-US/docs/Web/HTTP/Reference/Headers/Content-Security-Policy#report-sample).

- `status-code`
  - : Mã trạng thái HTTP của tài nguyên mà đối tượng toàn cục được khởi tạo.
- `violated-directive` {{deprecated_inline}}
  - : Chỉ thị mà việc thực thi gây ra vi phạm. `violated-directive` là tên lịch sử của trường `effective-directive` và chứa cùng giá trị.

## Ví dụ

### Báo cáo vi phạm CSP với Content-Security-Policy

Hãy xem xét một trang nằm tại `http://example.com/signup.html`.
Nó sử dụng chính sách sau, chỉ cho phép các stylesheet được tải từ `cdn.example.com`.

```http
Content-Security-Policy: default-src 'none'; style-src cdn.example.com; report-uri /_/csp-reports
```

HTML của `signup.html` trông như sau:

```html
<!doctype html>
<html lang="vi">
  <head>
    <meta charset="UTF-8" />
    <title>Đăng ký</title>
    <link rel="stylesheet" href="css/style.css" />
  </head>
  <body>
    Nội dung ở đây.
  </body>
</html>
```

Bạn có phát hiện ra lỗi không? Các stylesheet chỉ được phép tải từ `cdn.example.com`, nhưng trang web cố gắng tải một cái từ nguồn gốc của nó (`http://example.com`).
Trình duyệt có khả năng thực thi CSP sẽ gửi báo cáo vi phạm sau dưới dạng yêu cầu `POST` tới `http://example.com/_/csp-reports` khi tài liệu được truy cập:

```json
{
  "csp-report": {
    "blocked-uri": "http://example.com/css/style.css",
    "disposition": "report",
    "document-uri": "http://example.com/signup.html",
    "effective-directive": "style-src-elem",
    "original-policy": "default-src 'none'; style-src cdn.example.com; report-uri /_/csp-reports",
    "referrer": "",
    "status-code": 200,
    "violated-directive": "style-src-elem"
  }
}
```

Như bạn thấy, báo cáo bao gồm đường dẫn đầy đủ đến tài nguyên vi phạm trong `blocked-uri`.
Điều này không phải lúc nào cũng như vậy.
Ví dụ, nếu `signup.html` cố gắng tải CSS từ `http://anothercdn.example.com/stylesheet.css`, trình duyệt sẽ _không_ bao gồm đường dẫn đầy đủ, chỉ là nguồn gốc,
(`http://anothercdn.example.com`) để tránh rò rỉ thông tin nhạy cảm về tài nguyên đa nguồn.
Thông số kỹ thuật CSP [đưa ra giải thích](https://w3c.github.io/webappsec-csp/#security-violation-reports) về hành vi này.

### Báo cáo vi phạm CSP với Content-Security-Policy-Report-Only

Chỉ thị `report-uri` cũng có thể được sử dụng với tiêu đề phản hồi {{httpheader("Content-Security-Policy-Report-Only")}}.
Tiêu đề này cho phép trình duyệt báo cáo nhưng không chặn các vi phạm khi kiểm tra.

Tiêu đề HTTP sẽ giống nhau.

```http
Content-Security-Policy-Report-Only: default-src 'none'; style-src cdn.example.com; report-to /_/csp-reports
```

Báo cáo sẽ giống nhau ngoại trừ disposition `"report"` và tất nhiên `"original-policy"`:

```json
{
  "csp-report": {
    "blocked-uri": "http://example.com/css/style.css",
    "disposition": "report",
    "document-uri": "http://example.com/signup.html",
    "effective-directive": "style-src-elem",
    "original-policy": "default-src 'none'; style-src cdn.example.com; report-uri /_/csp-reports",
    "referrer": "",
    "status-code": 200,
    "violated-directive": "style-src-elem"
  }
}
```

### Ghi nhật ký vi phạm CSP

Với một máy chủ gửi phản hồi với tiêu đề `Content-Security-Policy` sau:

```http
Content-Security-Policy: default-src https:; report-uri /csp-violation-report-endpoint/
```

`/csp-violation-report-endpoint/` có thể chạy một script PHP như sau để ghi JSON mô tả chi tiết vi phạm và, nếu vi phạm là cái đầu tiên được thêm vào tệp nhật ký, gửi email cho quản trị viên:

```php
<?php

// Bắt đầu cấu hình
$log_file = dirname(__FILE__) . "/csp-violations.log";
$log_file_size_limit = 1000000; // bytes - một khi vượt quá, không có mục nào thêm nữa
$email_address = "admin@example.com";
$email_subject = "Vi phạm Content-Security-Policy";
// Kết thúc cấu hình

$current_domain = preg_replace("/www\./i", "", $_SERVER["SERVER_NAME"]);
$email_subject = $email_subject . " trên " . $current_domain;

http_response_code(204); // HTTP 204 No Content

$json_data = file_get_contents("php://input");

// Chúng tôi in đẹp JSON trước khi thêm vào tệp nhật ký
if (($json_data = json_decode($json_data))) {
  $json_data = json_encode(
    $json_data,
    JSON_PRETTY_PRINT | JSON_UNESCAPED_SLASHES,
  );

  if (!file_exists($log_file)) {
    // Gửi email
    $message =
      "Vi phạm Content-Security-Policy sau đã xảy ra trên " .
      $current_domain . ":\n\n" .
      $json_data .
      "\n\nCác vi phạm CPS tiếp theo sẽ được ghi vào tệp nhật ký sau, nhưng không có thêm thông báo email nào cho đến khi tệp nhật ký này bị xóa:\n\n" .
      $log_file;
    mail(
      $email_address,
      $email_subject,
      $message,
      "Content-Type: text/plain;charset=utf-8",
    );
  } else if (filesize($log_file) > $log_file_size_limit) {
    exit(0);
  }

  file_put_contents($log_file, $json_data, FILE_APPEND | LOCK_EX);
}
```

## Thông số kỹ thuật

{{Specifications}}

## Khả năng tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{HTTPHeader("Content-Security-Policy")}}
- {{HTTPHeader("Content-Security-Policy-Report-Only")}}
- {{CSP("report-to")}}
