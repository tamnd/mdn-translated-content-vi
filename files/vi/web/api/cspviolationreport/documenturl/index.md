---
title: "CSPViolationReport: documentURL property"
short-title: documentURL
slug: Web/API/CSPViolationReport/documentURL
page-type: web-api-instance-property
browser-compat: api.ReportingObserver.ReportingObserver.options_parameter.types_property.csp-violation
---

{{APIRef("Reporting API")}}

Thuộc tính **`documentURL`** của từ điển {{domxref("CSPViolationReport")}} là một chuỗi đại diện cho URL của tài liệu hoặc worker vi phạm [Chính sách bảo mật nội dung (CSP)](/en-US/docs/Web/HTTP/Guides/CSP).

## Giá trị

Một chuỗi chứa URL của tài liệu hoặc worker vi phạm CSP.

## Ví dụ

### Vi phạm CSP script nội tuyến hiển thị referrer

Ví dụ này kích hoạt vi phạm CSP bằng một script nội tuyến và báo cáo vi phạm bằng {{domxref("ReportingObserver")}}. Chúng ta điều hướng đến trang từ trang khác và ghi lại `referrer`, `documentURL` và `blockedURL`.

#### HTML

Đầu tiên chúng ta định nghĩa trang referrer `/bounce/index.html`. Trang này chỉ chứa một liên kết đến trang khác `../report_sample/index.html`.

```html
<!doctype html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
  </head>
  <body>
    <ul>
      <li><a href="../report_sample/">report sample</a></li>
    </ul>
  </body>
</html>
```

Tệp HTML `../report_sample/index.html` được định nghĩa bên dưới. Tệp này sử dụng phần tử [`<meta>`](/en-US/docs/Web/HTML/Reference/Elements/meta) để đặt `script-src-elem` của {{httpheader('Content-Security-Policy')}} thành `self`, cho phép tải script từ cùng miền, nhưng không cho phép thực thi script nội tuyến. Tài liệu cũng bao gồm một script nội tuyến, sẽ kích hoạt vi phạm CSP.

```html
<!doctype html>
<!-- /report_sample/index.html -->
<html lang="en">
  <head>
    <meta
      http-equiv="Content-Security-Policy"
      content="script-src-elem 'self' 'report-sample'" />
    <script src="main.js"></script>
  </head>
  <body>
    <script>
      const int = 4;
    </script>
  </body>
</html>
```

#### JavaScript (main.js)

Mẫu báo cáo trên cũng tải script bên ngoài `main.js`, được hiển thị bên dưới. Vì được tải từ cùng miền với HTML, nó không bị chặn bởi CSP.

Script tạo một {{domxref("ReportingObserver")}} mới để quan sát các báo cáo vi phạm nội dung thuộc loại `"csp-violation"`. Mỗi lần hàm callback được gọi, chúng ta lấy nội dung của mục đầu tiên trong mảng báo cáo và sử dụng nó để ghi ra `documentURL`, `referrer` và `blockedURL` của vi phạm vào console.

```js
// main.js
const observer = new ReportingObserver(
  (reports, observer) => {
    console.log(`documentURL: ${reports[0].body.documentURL}`);
    console.log(`referrer: ${reports[0].body.referrer}`);
    console.log(`blockedURL: ${reports[0].body.blockedURL}`);
  },
  {
    types: ["csp-violation"],
    buffered: true,
  },
);

observer.observe();
```

Lưu ý rằng mặc dù có thể có nhiều báo cáo trong mảng trả về, để ngắn gọn chúng ta chỉ ghi các giá trị của phần tử đầu tiên.

#### Kết quả

Đầu ra console của mã trên sẽ trông giống như bên dưới (trang web phụ thuộc vào cách phục vụ các trang):

```plain
documentURL: http://127.0.0.1:9999/report_sample/
referrer: http://127.0.0.1:9999/bounce/
blockedURL: inline
```

Lưu ý rằng `referrer` là trang chúng ta điều hướng từ đó, `documentURL` là trang có vi phạm CSP, và `blockedURL` trong trường hợp này không phải là URL mà là dấu hiệu cho thấy vi phạm do script nội tuyến.

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("SecurityPolicyViolationEvent.documentURI")}}
