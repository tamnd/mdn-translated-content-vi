---
title: Reporting API
slug: Web/API/Reporting_API
page-type: web-api-overview
browser-compat: api.ReportingObserver
spec-urls:
  - https://w3c.github.io/reporting/#intro
  - https://w3c.github.io/webappsec-csp/#CSPViolationReport
  - https://wicg.github.io/deprecation-reporting/#deprecationreportbody
  - https://wicg.github.io/intervention-reporting/#intervention-report
  - https://html.spec.whatwg.org/multipage/browsers.html#embedder-policy-checks
  - https://html.spec.whatwg.org/multipage/browsers.html#coep
---

{{DefaultAPISidebar("Reporting API")}}{{AvailableInWorkers}}

Reporting API cung cấp một cơ chế báo cáo tổng quát để ứng dụng web dùng tạo báo cáo theo nhiều tính năng của nền tảng một cách nhất quán (ví dụ [Content Security Policy](/en-US/docs/Web/HTTP/Guides/CSP), [Permissions-Policy](/en-US/docs/Web/HTTP/Reference/Headers/Permissions-Policy), hoặc báo cáo ngừng hỗ trợ tính năng).

## Khái niệm và cách dùng

Có nhiều tính năng và vấn đề khác nhau trên nền tảng web tạo ra thông tin hữu ích cho nhà phát triển web khi họ đang sửa lỗi hoặc cải thiện website của mình theo những cách khác. Thông tin đó có thể bao gồm:

- Vi phạm [Content Security Policy](/en-US/docs/Web/HTTP/Guides/CSP).
- Vi phạm [Permissions-Policy](/en-US/docs/Web/HTTP/Reference/Headers/Permissions-Policy).
- Vi phạm [Integrity-Policy](/en-US/docs/Web/HTTP/Reference/Headers/Integrity-Policy).
- Vi phạm [Cross-Origin-Embedder-Policy](/en-US/docs/Web/HTTP/Reference/Headers/Cross-Origin-Embedder-Policy).
- Việc sử dụng tính năng đã ngừng hỗ trợ (khi bạn đang dùng thứ sẽ sớm không còn hoạt động trong trình duyệt nữa).
- Xảy ra lỗi sập.
- Xảy ra can thiệp của user agent (khi trình duyệt chặn một việc mà mã của bạn đang cố làm vì nó bị xem là rủi ro bảo mật, hoặc đơn giản là gây phiền, như tự phát âm thanh).

Mục đích của Reporting API là cung cấp một cơ chế báo cáo nhất quán, có thể dùng để đưa những thông tin này cho nhà phát triển dưới dạng các báo cáo được biểu diễn bằng đối tượng JavaScript. Có vài cách để dùng API này, được mô tả chi tiết ở các phần bên dưới.

### Các điểm cuối máy chủ báo cáo

Mỗi origin duy nhất mà bạn muốn nhận báo cáo có thể được gán một loạt "endpoint", là các URL được đặt tên (hoặc nhóm URL) mà user agent có thể gửi báo cáo tới.
Một máy chủ báo cáo tại các endpoint này có thể thu thập báo cáo, rồi xử lý và hiển thị chúng theo nhu cầu của ứng dụng.

Header HTTP {{httpheader("Reporting-Endpoints")}} được dùng để chỉ định chi tiết về các endpoint khác nhau mà user agent có sẵn để gửi báo cáo.
Sau đó các endpoint này có thể được dùng trên các header phản hồi HTTP cụ thể để chỉ ra endpoint cụ thể (hoặc trong một số trường hợp là nhiều endpoint) sẽ được dùng cho báo cáo liên quan.
Chỉ thị hoặc tham số được dùng để chỉ định endpoint phụ thuộc vào header.
Ví dụ, chỉ thị CSP {{CSP("report-to")}} có thể được dùng trên các header HTTP {{HTTPHeader("Content-Security-Policy")}} hoặc {{HTTPHeader("Content-Security-Policy-Report-Only")}} để chỉ định endpoint mà báo cáo vi phạm CSP sẽ được gửi tới, trong khi trường [`endpoints`](/en-US/docs/Web/HTTP/Reference/Headers/Integrity-Policy#endpoints) được dùng trên {{httpheader("Integrity-Policy")}} hoặc {{httpheader("Integrity-Policy-Report-Only")}} để chỉ định nơi gửi báo cáo vi phạm integrity-policy.

Các loại báo cáo không có header HTTP đi kèm, như báo cáo `crash`, `deprecation` và `intervention`, thường sẽ gửi báo cáo tới "default reporting endpoint".
Đây chỉ là một endpoint có tên "default" được chỉ định bằng header `Reporting-Endpoints`.

> [!NOTE]
> Không có gì đảm bảo tuyệt đối rằng báo cáo sẽ được gửi thành công - một báo cáo vẫn có thể không được thu thập nếu xảy ra lỗi nghiêm trọng.

Bản thân các báo cáo được user agent gửi tới endpoint đích bằng thao tác `POST` với {{HTTPHeader("Content-Type")}} là `application/reports+json`.
Chúng là dạng tuần tự hóa của dictionary tương ứng cho từng [loại báo cáo](#report_types).
Ví dụ, báo cáo vi phạm CSP là dạng tuần tự hóa của một đối tượng {{domxref("CSPViolationReport")}}.

Báo cáo được gửi tới endpoint có thể được truy xuất độc lập với việc các website liên quan đang chạy hay không, điều này rất hữu ích - ví dụ một vụ sập có thể làm website ngừng hoạt động và dừng mọi thứ đang chạy, nhưng báo cáo vẫn có thể được lấy ra để cho nhà phát triển vài manh mối về lý do nó xảy ra.

### Reporting observer

Báo cáo cũng có thể được lấy qua các đối tượng {{domxref("ReportingObserver")}} được tạo bằng JavaScript bên trong website mà bạn muốn lấy báo cáo.
Phương pháp này không an toàn bằng việc gửi báo cáo về máy chủ vì bất kỳ vụ sập trang nào cũng có thể khiến bạn không lấy được báo cáo - nhưng nó dễ thiết lập hơn và linh hoạt hơn.

Đối tượng `ReportingObserver` được tạo bằng constructor {{domxref("ReportingObserver.ReportingObserver", "ReportingObserver()")}}, và constructor này nhận hai tham số:

- Một hàm callback với hai tham số - một mảng các báo cáo có trong hàng đợi báo cáo của observer và một bản sao của chính đối tượng `ReportingObserver` đó, cho phép điều khiển việc quan sát trực tiếp từ bên trong callback. Callback chạy khi việc quan sát bắt đầu.
- Một dictionary tùy chọn cho phép bạn chỉ định [loại](/en-US/docs/Web/API/ReportingObserver/ReportingObserver#types) báo cáo cần thu thập, và liệu các báo cáo được tạo trước khi observer được tạo có thể quan sát được hay không (`buffered: true`).

Sau đó, các phương thức trên observer cho phép bắt đầu thu thập báo cáo ({{domxref("ReportingObserver.observe()")}}), truy xuất các báo cáo hiện có trong hàng đợi báo cáo ({{domxref("ReportingObserver.takeRecords()")}}), và ngắt kết nối observer để nó không thể tiếp tục thu thập bản ghi nữa ({{domxref("ReportingObserver.disconnect()")}}).

### Các loại báo cáo

Báo cáo được gửi đến reporting observer là các thể hiện của các dictionary object, như {{domxref("COEPViolationReport")}}, {{domxref("DeprecationReport")}}, {{domxref("IntegrityViolationReport")}}, {{domxref("InterventionReport")}}, và {{domxref("CSPViolationReport")}}.
Tất cả chúng đều có `url`, `type`, và `body` riêng cho từng loại báo cáo.
Loại báo cáo có thể được xác định từ thuộc tính `type`, mà với các báo cáo ở trên sẽ là `coep`, `deprecation`, `integrity-violation`, `intervention` và `csp-violation`.

Báo cáo được gửi tới reporting endpoint và reporting observer về cơ bản là giống nhau.
Khác biệt duy nhất là báo cáo phía máy chủ là JSON tuần tự hóa của các object có thêm các trường `user_agent` và `age`.

Danh sách các loại báo cáo đã được tài liệu hóa và dictionary tương ứng của chúng được nêu trong tham số [`options.types`](/en-US/docs/Web/API/ReportingObserver/ReportingObserver#types) truyền vào constructor `ReportingObserver()`.

### Tạo báo cáo qua WebDriver

Đặc tả Reporting API cũng định nghĩa một extension Generate Test Report [WebDriver](/en-US/docs/Web/WebDriver), cho phép bạn mô phỏng việc tạo báo cáo trong quá trình tự động hóa. Các báo cáo được tạo qua WebDriver sẽ được quan sát bởi mọi đối tượng `ReportingObserver` đã đăng ký có trong website đang tải. Phần này hiện vẫn chưa được tài liệu hóa.

## Giao diện

- {{domxref("ReportingObserver")}}
  - : Một object có thể được dùng để thu thập và truy cập báo cáo khi chúng được tạo.

### Giao diện liên quan

- {{domxref("SecurityPolicyViolationEvent")}}
  - : Đại diện cho object sự kiện của sự kiện `securitypolicyviolation` được phát trên một element, document hoặc worker khi CSP của nó bị vi phạm.
    Điều này được định nghĩa như một phần của đặc tả HTTP [Content Security Policy (CSP)](/en-US/docs/Web/HTTP/Guides/CSP).

## Dictionary

- {{domxref("COEPViolationReport")}}
  - : Chứa chi tiết về một vi phạm {{httpheader("Cross-Origin-Embedder-Policy")}} (COEP).
- {{domxref("CSPViolationReport")}}
  - : Chứa chi tiết về một vi phạm CSP.
    Điều này được định nghĩa như một phần của đặc tả HTTP [Content Security Policy (CSP)](/en-US/docs/Web/HTTP/Guides/CSP).
- {{domxref("DeprecationReport")}}
  - : Chứa chi tiết về các tính năng web đã bị ngừng hỗ trợ mà một website đang sử dụng.
- {{domxref("InterventionReport")}}
  - : Chứa chi tiết về một báo cáo can thiệp, được tạo khi một yêu cầu do website thực hiện bị trình duyệt từ chối; ví dụ vì lý do bảo mật.
- {{domxref("IntegrityViolationReport")}}
  - : Chứa thông tin về một tài nguyên đã bị chặn vì không đáp ứng các đảm bảo của Subresource Integrity được yêu cầu bởi {{httpheader("Integrity-Policy")}}, hoặc tài nguyên đó sẽ bị chặn đối với các chính sách chỉ báo cáo được đặt bằng {{httpheader("Integrity-Policy-Report-Only")}}.
    Điều này được định nghĩa như một phần của đặc tả [Subresource Integrity](/en-US/docs/Web/Security/Defenses/Subresource_Integrity).

## Các header HTTP liên quan

Những header phản hồi HTTP này định nghĩa các endpoint nơi báo cáo được gửi đến.

- {{HTTPHeader("Reporting-Endpoints")}}
  - : Đặt tên và URL của các reporting endpoint.
    Những endpoint này có thể được dùng trong chỉ thị `report-to`, chỉ thị này có thể được dùng với nhiều header HTTP bao gồm {{httpheader("Content-Security-Policy")}} hoặc {{HTTPHeader("Content-Security-Policy-Report-Only")}}.
- {{HTTPHeader("Report-To")}} {{deprecated_inline}}
  - : Không còn là một phần của Reporting API nhưng vẫn được một số trình duyệt hỗ trợ. Header này đặt tên và URL của các nhóm reporting endpoint, có thể được dùng với nhiều header HTTP, đặc biệt là [Network Error Logging](/en-US/docs/Web/HTTP/Guides/Network_Error_Logging) hiện vẫn chưa được cập nhật để hỗ trợ `Reporting-Endpoints`. Các báo cáo Reporting API khác nên dùng `Reporting-Endpoints` thay thế để hỗ trợ tốt hơn trong tương lai.

Có thể đặt endpoint báo cáo cho các báo cáo sau bằng chỉ thị hoặc tham số {{CSP("report-to")}} trên các header tương ứng:

- Vi phạm COEP
  - : {{HTTPHeader("Cross-Origin-Embedder-Policy")}} hoặc {{HTTPHeader("Cross-Origin-Embedder-Policy-Report-Only")}}.
- Vi phạm CSP
  - : {{HTTPHeader("Content-Security-Policy")}} hoặc {{HTTPHeader("Content-Security-Policy-Report-Only")}}.

Có thể đặt endpoint báo cáo cho các báo cáo sau bằng trường [`endpoints`](/en-US/docs/Web/HTTP/Reference/Headers/Integrity-Policy#endpoints) trong một dictionary có cấu trúc trên các header tương ứng:

- Vi phạm Integrity-Policy
  - : {{HTTPHeader("Integrity-Policy")}} hoặc {{HTTPHeader("Integrity-Policy-Report-Only")}}.

## Ví dụ

### Báo cáo các tính năng đã ngừng hỗ trợ

Ví dụ này cho thấy cách quan sát các báo cáo `"deprecation"` trong một trang đang kích hoạt chúng bằng {{domxref("ReportingObserver")}}.

Lưu ý rằng chúng ta chọn hiển thị báo cáo `"deprecation"` vì nó không yêu cầu các header HTTP cụ thể phải được thiết lập, nên có thể chạy như một ví dụ trực tiếp trên MDN.

```html hidden
<pre id="log"></pre>
```

```css hidden
#log {
  height: 200px;
  margin: 10px;
  overflow: scroll;
  padding: 0.5rem;
  border: 1px solid black;
}
```

```js hidden
const logElement = document.querySelector("#log");
function log(text) {
  logElement.innerText = `${logElement.innerText}${text}\n`;
  logElement.scrollTop = logElement.scrollHeight;
}
```

#### JavaScript

Trước hết, chúng ta tạo một đối tượng {{domxref("ReportingObserver")}} mới để lắng nghe các báo cáo có loại `"deprecation"`, truyền vào một callback sẽ nhận và ghi log các báo cáo.

```js
const options = {
  types: ["deprecation"],
  buffered: true,
};

const observer = new ReportingObserver((reports, observer) => {
  reports.forEach((report) => {
    //console.log(report);
    log(JSON.stringify(report, null, 2));
  });
}, options);

// Bắt đầu observer
observer.observe();
```

Sau đó, chúng ta gọi đoạn mã sau, dùng synchronous XHR (API đã ngừng hỗ trợ).
Lưu ý rằng đoạn mã này được định nghĩa sau observer mà nó kích hoạt, một khi observer đang chạy.

```js
const xhr = new XMLHttpRequest();
xhr.open("GET", "/", false); // false = đồng bộ (đã ngừng hỗ trợ)
xhr.send();
```

#### Kết quả

Trên các trình duyệt hỗ trợ báo cáo ngừng hỗ trợ, một báo cáo sẽ được hiển thị bên dưới.
Lưu ý rằng `type` là `"deprecation"`.

{{EmbedLiveSample("Using the `ReportingObserver` interface", "100%", "280px")}}

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Content Security Policy](/en-US/docs/Web/HTTP/Guides/CSP)
- [`Permissions-Policy`](/en-US/docs/Web/HTTP/Reference/Headers/Permissions-Policy)
