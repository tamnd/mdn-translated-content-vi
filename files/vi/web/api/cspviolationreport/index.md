---
title: CSPViolationReport
slug: Web/API/CSPViolationReport
page-type: web-api-interface
browser-compat: api.ReportingObserver.ReportingObserver.options_parameter.types_property.csp-violation
---

{{APIRef("Reporting API")}}

Từ điển `CSPViolationReport` của [Reporting API](/en-US/docs/Web/API/Reporting_API) đại diện cho một báo cáo được tạo ra khi một tài liệu vi phạm [Chính sách bảo mật nội dung (CSP)](/en-US/docs/Web/HTTP/Guides/CSP) của nó.

Các báo cáo thuộc loại này có thể được quan sát từ trong trang bằng {{domxref("ReportingObserver")}}, và một phiên bản đã được tuần tự hóa có thể được gửi đến [các điểm cuối máy chủ báo cáo](/en-US/docs/Web/API/Reporting_API#reporting_server_endpoints).

## Thuộc tính phiên bản

- `body`
  - : Nội dung của báo cáo. Đây là một đối tượng với các thuộc tính sau:
    - {{domxref("CSPViolationReport.blockedURL","blockedURL")}}
      - : Một chuỗi đại diện cho loại hoặc URL của tài nguyên bị chặn vì vi phạm CSP.
    - {{domxref("CSPViolationReport.columnNumber", "columnNumber")}}
      - : Vị trí ký tự trong dòng của script nơi vi phạm xảy ra.
    - {{domxref("CSPViolationReport.disposition","disposition")}}
      - : Một chuỗi cho biết vi phạm có bị thực thi hay chỉ được báo cáo. Có thể có giá trị `"enforce"` cho các vi phạm của chính sách được đặt bằng {{httpheader("Content-Security-Policy")}}, hoặc `"reporting"` cho các chính sách được đặt bằng {{httpheader("Content-Security-Policy-Report-Only")}}.
    - {{domxref("CSPViolationReport.documentURL","documentURL")}}
      - : Một chuỗi đại diện cho URL của tài liệu hoặc worker nơi vi phạm được tìm thấy.
    - {{domxref("CSPViolationReport.effectiveDirective","effectiveDirective")}}
      - : Một chuỗi đại diện cho chỉ thị mà việc thực thi của nó phát hiện ra vi phạm.
    - {{domxref("CSPViolationReport.lineNumber", "lineNumber")}}
      - : Số dòng trong script nơi vi phạm xảy ra.
    - {{domxref("CSPViolationReport.originalPolicy","originalPolicy")}}
      - : Một chuỗi chứa chính sách mà việc thực thi của nó phát hiện ra vi phạm.
    - {{domxref("CSPViolationReport.referrer","referrer")}}
      - : Một chuỗi đại diện cho URL của referrer của các tài nguyên có chính sách bị vi phạm, hoặc `null`.
    - {{domxref("CSPViolationReport.sample","sample")}}
      - : Một chuỗi đại diện cho mẫu của tài nguyên gây ra vi phạm, thường là 40 ký tự đầu tiên. Trường này chỉ được điền nếu tài nguyên là một script nội tuyến, trình xử lý sự kiện hoặc kiểu; các tài nguyên bên ngoài gây ra vi phạm sẽ không tạo ra mẫu.
    - {{domxref("CSPViolationReport.sourceFile","sourceFile")}}
      - : Nếu vi phạm xảy ra do một script, đây sẽ là URL của script; nếu không, giá trị sẽ là `null`. Cả `columnNumber` và `lineNumber` phải có giá trị khác null nếu thuộc tính này không phải là `null`.
    - {{domxref("CSPViolationReport.statusCode","statusCode")}}
      - : Một số đại diện cho mã trạng thái HTTP của tài liệu hoặc worker nơi vi phạm xảy ra.

- `type`
  - : Chuỗi `"csp-violation"`, cho biết đây là báo cáo vi phạm CSP.
- `url`
  - : Một chuỗi đại diện cho URL của tài liệu đã tạo ra báo cáo.

## Mô tả

Báo cáo vi phạm CSP có thể được tạo ra khi một trang web cố gắng tải một tài nguyên vi phạm [CSP](/en-US/docs/Web/HTTP/Guides/CSP) được đặt bằng tiêu đề HTTP {{HTTPHeader("Content-Security-Policy")}} hoặc {{HTTPHeader("Content-Security-Policy-Report-Only")}}.

Bạn có thể giám sát các báo cáo vi phạm CSP trong trang đặt chính sách bằng cách sử dụng [Reporting API](/en-US/docs/Web/API/Reporting_API). Để làm điều này, bạn tạo một đối tượng {{domxref("ReportingObserver")}} để lắng nghe các báo cáo, truyền một phương thức hàm gọi lại và thuộc tính `options` (tùy chọn) chỉ định các loại báo cáo bạn muốn theo dõi. Phương thức hàm gọi lại sau đó được gọi với các báo cáo thuộc các loại được yêu cầu, truyền một đối tượng báo cáo. Đối với các vi phạm CSP, đối tượng sẽ là một thực thể `CSPViolationReport` (có thuộc tính [`type`](#type) được đặt thành `"csp-violation"`).

Cấu trúc của một báo cáo điển hình được hiển thị bên dưới. Lưu ý rằng chúng ta có thể thấy URL của cả trang có chính sách bị vi phạm (`url`), tài liệu cố gắng tải tài nguyên (`body.documentURL`) và tài nguyên bị chặn không tải được (`body.blockedURL`). Chúng ta cũng có thể thấy rằng vi phạm xảy ra do trang cố gắng tải một phần tử script có nguồn từ nguồn gốc khác, vi phạm `body.originalPolicy`, và vi phạm này bị thực thi (không chỉ được báo cáo).

```json
{
  "type": "csp-violation",
  "url": "https://url-of-page-enforcing-policy",
  "body": {
    "sourceFile": null,
    "lineNumber": null,
    "columnNumber": null,
    "documentURL": "https://url-of-document-attempting-to-load-resource-in-violation",
    "referrer": "",
    "blockedURL": "https://url-of-blocked-resource.js",
    "effectiveDirective": "script-src-elem",
    "originalPolicy": "default-src 'self';",
    "sample": "",
    "disposition": "enforce",
    "statusCode": 200
  }
}
```

Các báo cáo vi phạm cũng có thể được gửi dưới dạng đối tượng JSON trong yêu cầu {{httpmethod("POST")}} đến một hoặc nhiều [điểm cuối máy chủ báo cáo](/en-US/docs/Web/API/Reporting_API#reporting_server_endpoints) được cấu hình. Tên điểm cuối máy chủ báo cáo được chỉ định trong chỉ thị [`report-to`](/en-US/docs/Web/HTTP/Reference/Headers/Content-Security-Policy/report-to) của tiêu đề {{HTTPHeader("Content-Security-Policy")}} hoặc {{HTTPHeader("Content-Security-Policy-Report-Only")}}. Tên điểm cuối hợp lệ và ánh xạ của chúng đến một URL cụ thể được xác định bằng tiêu đề {{httpheader("Reporting-Endpoints")}}.

> [!NOTE]
> Các báo cáo vi phạm CSP được gửi bởi Reporting API, khi một điểm cuối được chỉ định bằng chỉ thị CSP [`report-to`](/en-US/docs/Web/HTTP/Reference/Headers/Content-Security-Policy/report-to), tương tự (nhưng không giống hệt) với các "CSP report" [đối tượng JSON](/en-US/docs/Web/HTTP/Reference/Headers/Content-Security-Policy/report-uri#violation_report_syntax) được gửi khi điểm cuối được chỉ định bằng chỉ thị [`report-uri`](/en-US/docs/Web/HTTP/Reference/Headers/Content-Security-Policy/report-uri). Reporting API và chỉ thị `report-to` được thiết kế để thay thế định dạng báo cáo cũ và chỉ thị `report-uri`.

Cấu trúc của báo cáo máy chủ gần như giống hệt với `CSPViolationReport`, ngoại trừ việc nó bổ sung thêm các trường `age` và `user_agent`.

```json
{
  "age": "176279",
  "type": "csp-violation",
  "url": "https://url-of-page-enforcing-policy",
  "body": {
    "sourceFile": null,
    "lineNumber": null,
    "columnNumber": null,
    "documentURL": "https://url-of-document-attempting-to-load-resource-in-violation",
    "referrer": "",
    "blockedURL": "https://url-of-blocked-resource.js",
    "effectiveDirective": "script-src-elem",
    "originalPolicy": "default-src 'self';",
    "sample": "",
    "disposition": "enforce",
    "statusCode": 200
  },
  "user_agent": "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36"
}
```

## Ví dụ

### Sử dụng giao diện `ReportingObserver`

Bạn có thể lấy đối tượng `CSPViolationReport` bằng cách cấu hình trang của bạn để xảy ra vi phạm CSP. Trong ví dụ này, chúng ta sẽ đặt CSP chỉ cho phép nội dung từ nguồn gốc của chính trang web, sau đó cố gắng tải một script từ `apis.google.com`, đây là nguồn gốc bên ngoài.

Đầu tiên, chúng ta sẽ đặt tiêu đề {{HTTPHeader("Content-Security-Policy")}} trong phản hồi HTTP:

```http
Content-Security-Policy: default-src 'self';
```

hoặc trong phần tử HTML [`<meta>`](/en-US/docs/Web/HTML/Reference/Elements/meta):

```html
<meta http-equiv="Content-Security-Policy" content="default-src 'self'" />
```

Sau đó, chúng ta sẽ cố gắng tải một script bên ngoài:

```html
<!-- Điều này sẽ tạo ra vi phạm CSP -->
<script src="https://apis.google.com/js/platform.js"></script>
```

Cuối cùng, chúng ta sẽ tạo một đối tượng {{domxref("ReportingObserver")}} mới để lắng nghe các vi phạm CSP (cần được tải từ cùng vị trí, trước script gây ra vi phạm).

```js
const observer = new ReportingObserver(
  (reports, observer) => {
    reports.forEach((violation) => {
      console.log(violation);
      console.log(JSON.stringify(violation));
    });
  },
  {
    types: ["csp-violation"],
    buffered: true,
  },
);

observer.observe();
```

Ở trên, chúng ta ghi lại mỗi đối tượng báo cáo vi phạm và phiên bản chuỗi JSON của đối tượng, có thể trông tương tự như đối tượng bên dưới. Lưu ý rằng báo cáo là một thực thể của `CSPViolationReport` và `type` là `"csp-violation"`.

```json
{
  "type": "csp-violation",
  "url": "http://127.0.0.1:9999/",
  "body": {
    "sourceFile": null,
    "lineNumber": null,
    "columnNumber": null,
    "documentURL": "http://127.0.0.1:9999/",
    "referrer": "",
    "blockedURL": "https://apis.google.com/js/platform.js",
    "effectiveDirective": "script-src-elem",
    "originalPolicy": "default-src 'self';",
    "sample": "",
    "disposition": "enforce",
    "statusCode": 200
  }
}
```

### Gửi báo cáo vi phạm CSP

Cấu hình một trang web để gửi báo cáo vi phạm CSP tương tự như ví dụ trước. Như trước, bạn cần cấu hình trang của mình để có vi phạm.

Ngoài ra, bạn cũng cần chỉ định điểm cuối (endpoint) nơi báo cáo sẽ được gửi đến. Một máy chủ chỉ định điểm cuối bằng tiêu đề phản hồi {{httpheader("Reporting-Endpoints")}}: đây phải là các URL an toàn (HTTPS). Chỉ thị CSP {{CSP("report-to")}} sau đó được sử dụng để chỉ định rằng một điểm cuối cụ thể được dùng để báo cáo các vi phạm CSP:

```http
Reporting-Endpoints: csp-endpoint="https://example.com/csp-report-to"
Content-Security-Policy: default-src 'self'; report-to csp-endpoint
```

Như trước, chúng ta có thể kích hoạt vi phạm bằng cách tải một script bên ngoài từ vị trí không được CSP header cho phép:

```html
<!-- Điều này sẽ tạo ra vi phạm CSP -->
<script src="https://apis.google.com/js/platform.js"></script>
```

Báo cáo vi phạm sau đó sẽ được gửi đến điểm cuối được chỉ định dưới dạng tệp JSON. Như bạn có thể thấy từ ví dụ bên dưới, `type` là `"csp-violation"` và thuộc tính `body` là bản tuần tự hóa của đối tượng `CSPViolationReport`:

```json
[
  {
    "age": 53531,
    "body": {
      "blockedURL": "inline",
      "columnNumber": 59,
      "disposition": "enforce",
      "documentURL": "https://example.com/csp-report-to",
      "effectiveDirective": "script-src-elem",
      "lineNumber": 1441,
      "originalPolicy": "default-src 'self'; report-to csp-endpoint",
      "referrer": "https://www.google.com/",
      "sample": "",
      "sourceFile": "https://example.com/csp-report-to",
      "statusCode": 200
    },
    "type": "csp-violation",
    "url": "https://example.com/csp-report-to",
    "user_agent": "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36"
  }
]
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("ReportingObserver")}}
- {{HTTPHeader("Content-Security-Policy")}}
- {{HTTPHeader("Content-Security-Policy-Report-Only")}}
- {{domxref("SecurityPolicyViolationEvent")}}
- {{HTTPHeader("Reporting-Endpoints")}}
- [Reporting API](/en-US/docs/Web/API/Reporting_API)
