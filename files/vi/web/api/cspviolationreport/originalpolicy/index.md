---
title: "CSPViolationReport: originalPolicy property"
short-title: originalPolicy
slug: Web/API/CSPViolationReport/originalPolicy
page-type: web-api-instance-property
browser-compat: api.ReportingObserver.ReportingObserver.options_parameter.types_property.csp-violation
---

{{APIRef("Reporting API")}}

Thuộc tính **`originalPolicy`** của từ điển {{domxref("CSPViolationReport")}} là một chuỗi đại diện cho [Chính sách bảo mật nội dung (CSP)](/en-US/docs/Web/HTTP/Guides/CSP) mà việc thực thi của nó phát hiện ra vi phạm.

Đây là chuỗi trong tiêu đề phản hồi HTTP {{HTTPHeader("Content-Security-Policy")}} chứa danh sách các [chỉ thị](/en-US/docs/Web/HTTP/Reference/Headers/Content-Security-Policy#directives) và giá trị của chúng tạo nên chính sách CSP. Lưu ý rằng điều này khác với {{domxref("CSPViolationReport.effectiveDirective","effectiveDirective")}}, là chỉ thị cụ thể đang thực sự bị vi phạm (và có thể không được liệt kê rõ ràng trong chính sách nếu `default-src` được sử dụng).

## Giá trị

Một chuỗi đại diện cho chính sách mà việc thực thi của nó phát hiện ra vi phạm.

## Ví dụ

### Vi phạm CSP script nội tuyến

Ví dụ này kích hoạt vi phạm CSP bằng một script nội tuyến và báo cáo vi phạm bằng {{domxref("ReportingObserver")}}. Đặc biệt, nó ghi lại `effectiveDirective` và `originalPolicy`, làm rõ sự khác biệt.

#### HTML

Tệp HTML bên dưới sử dụng phần tử [`<meta>`](/en-US/docs/Web/HTML/Reference/Elements/meta) để đặt `default-src` của {{httpheader('Content-Security-Policy')}} thành `self`, cho phép tải script và các tài nguyên khác từ cùng miền, nhưng không cho phép thực thi script nội tuyến. Tài liệu cũng bao gồm một script nội tuyến, sẽ kích hoạt vi phạm CSP.

```html
<!doctype html>
<html lang="en">
  <head>
    <meta
      http-equiv="Content-Security-Policy"
      content="default-src 'self'; report-to csp-endpoint" />
    <!-- Đây là chính sách CSP (gốc) -->
    <meta
      http-equiv="Reporting-Endpoints"
      content="csp-endpoint='https://example.com/csp-reports'" />
    <script src="main.js"></script>
    <title>CSP: Violation due to inline script</title>
  </head>
  <body>
    <h1>CSP: Violation due to inline script</h1>
    <script>
      const int = 4;
    </script>
  </body>
</html>
```

#### JavaScript (main.js)

Tài liệu trên cũng tải script bên ngoài `main.js`, được hiển thị bên dưới. Vì được tải từ cùng miền với HTML, nó không bị chặn bởi CSP.

Script tạo một {{domxref("ReportingObserver")}} mới để quan sát các báo cáo vi phạm nội dung thuộc loại `"csp-violation"`. Mỗi lần hàm callback được gọi, chúng ta lấy nội dung của mục đầu tiên trong mảng báo cáo và sử dụng nó để ghi ra effectiveDirective và `originalPolicy` của vi phạm vào console.

```js
// main.js
const observer = new ReportingObserver(
  (reports, observer) => {
    console.log(`effectiveDirective: ${reports[0].body.effectiveDirective}`);
    // effectiveDirective: script-src-elem
    console.log(`originalPolicy: ${reports[0].body.originalPolicy}`);
    // originalPolicy: default-src 'self'; report-to csp-endpoint
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

Đầu ra console của mã trên là:

```plain
effectiveDirective: script-src-elem
originalPolicy: default-src 'self'; report-to csp-endpoint
```

Lưu ý rằng `originalPolicy` khớp với nội dung `<meta>` của chỉ thị `Content-Security-Policy` trong HTML, và chỉ định rằng chính sách mặc định là `self` (`default-src 'self'`).

`effectiveDirective` là `script-src-elem`, chỉ định các nguồn hợp lệ cho phần tử JavaScript {{htmlelement("script")}}. Đây là chỉ thị cụ thể đã thực sự bị vi phạm, dù `default-src` được đặt trong chính sách.

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("SecurityPolicyViolationEvent.originalPolicy")}}
