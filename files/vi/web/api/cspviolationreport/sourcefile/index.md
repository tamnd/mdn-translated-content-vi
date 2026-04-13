---
title: "CSPViolationReport: sourceFile property"
short-title: sourceFile
slug: Web/API/CSPViolationReport/sourceFile
page-type: web-api-instance-property
browser-compat: api.ReportingObserver.ReportingObserver.options_parameter.types_property.csp-violation
---

{{APIRef("Reporting API")}}

Thuộc tính **`sourceFile`** của từ điển {{domxref("CSPViolationReport")}} cho biết URL của tệp nguồn đã vi phạm [Chính sách bảo mật nội dung (CSP)](/en-US/docs/Web/HTTP/Guides/CSP).

Đối với vi phạm được kích hoạt bởi việc sử dụng script nội tuyến, `sourceFile` là URL của tài liệu hiện tại. Tương tự, nếu một tài liệu tải thành công một script mà sau đó vi phạm CSP của tài liệu, `sourceFile` là URL của script đó.

Thuộc tính này được sử dụng cùng với các thuộc tính {{domxref("CSPViolationReport.lineNumber")}} và {{domxref("CSPViolationReport.columnNumber")}}, cùng nhau cung cấp vị trí chính xác trong nguồn gây ra vi phạm.

Tuy nhiên, lưu ý rằng nếu một tài liệu có CSP chặn tài nguyên bên ngoài cố gắng tải tài nguyên bên ngoài, `sourceFile` sẽ là `null`. Điều này là vì trình duyệt trích xuất giá trị từ _đối tượng toàn cục_ của tệp kích hoạt vi phạm. Do hạn chế CSP, tài nguyên bên ngoài không bao giờ được tải và do đó không có đối tượng toàn cục tương ứng.

## Giá trị

Một chuỗi chứa URL của tệp kích hoạt vi phạm, hoặc `null`.

## Ví dụ

### Vi phạm CSP script nội tuyến

Ví dụ này kích hoạt vi phạm CSP bằng một script nội tuyến và báo cáo vi phạm bằng {{domxref("ReportingObserver")}}.

#### HTML

Tệp HTML bên dưới sử dụng phần tử [`<meta>`](/en-US/docs/Web/HTML/Reference/Elements/meta) để đặt `default-src` của {{httpheader('Content-Security-Policy')}} thành `self`, cho phép tải script và các tài nguyên khác từ cùng nguồn gốc, nhưng không cho phép thực thi script nội tuyến. Tài liệu cũng bao gồm một script nội tuyến, sẽ kích hoạt vi phạm CSP.

```html
<!doctype html>
<html lang="en">
  <head>
    <meta
      http-equiv="Content-Security-Policy"
      content="default-src 'self'; report-to csp-endpoint" />
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

Script tạo một {{domxref("ReportingObserver")}} mới để quan sát các báo cáo vi phạm nội dung thuộc loại `"csp-violation"`. Mỗi lần hàm callback được gọi, chúng ta lấy nội dung của mục đầu tiên trong mảng báo cáo và sử dụng nó để ghi ra tệp, dòng và cột của vi phạm vào console.

```js
// main.js
const observer = new ReportingObserver(
  (reports, observer) => {
    const cspViolationBody = reports[0].body;
    console.log(`sourceFile: ${cspViolationBody.sourceFile}`);
    console.log(`lineNumber: ${cspViolationBody.lineNumber}`);
    console.log(`columnNumber: ${cspViolationBody.columnNumber}`);
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

Bạn có thể thử ví dụ này bằng cách sử dụng [máy chủ cục bộ](/en-US/docs/Learn_web_development/Howto/Tools_and_setup/set_up_a_local_testing_server). Sao chép mã trên vào `test/index.html` và `test/main.js` và chạy máy chủ trong thư mục gốc. Giả sử địa chỉ máy chủ cục bộ là `http://127.0.0.1:9999`, bạn có thể tải tệp HTML từ `http://127.0.0.1:9999/test/` (hoặc `http://127.0.0.1:9999/test/index.html`).

Với cài đặt trên, đầu ra log trên Chrome là:

```plain
sourceFile: http://127.0.0.1:9999/test/
lineNumber: 15
columnNumber: 0
```

Kết quả tương tự trên Firefox:

```plain
sourceFile: http://127.0.0.1:9999/test/
lineNumber: 15
columnNumber: 13
```

Lưu ý rằng số cột khác nhau giữa hai trình duyệt. Chrome luôn báo cáo `0`. Giá trị trên Firefox đại diện cho vị trí của ký tự đầu tiên sau cuối thẻ mở `<script>`.

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("SecurityPolicyViolationEvent.sourceFile")}}
