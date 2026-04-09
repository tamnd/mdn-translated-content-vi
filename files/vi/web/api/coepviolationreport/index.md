---
title: COEPViolationReport
slug: Web/API/COEPViolationReport
page-type: web-api-interface
browser-compat: api.ReportingObserver.ReportingObserver.options_parameter.types_property.coep
spec-urls:
  - https://html.spec.whatwg.org/multipage/browsers.html#embedder-policy-checks
  - https://html.spec.whatwg.org/multipage/browsers.html#coep
---

{{APIRef("Reporting API")}}

Từ điển `COEPViolationReport` của [Reporting API](/en-US/docs/Web/API/Reporting_API) biểu diễn một báo cáo được tạo ra khi một tài liệu vi phạm {{httpheader("Cross-Origin-Embedder-Policy")}} (COEP) của nó.

Các báo cáo thuộc loại này có thể được quan sát từ bên trong trang bằng {{domxref("ReportingObserver")}}, hoặc một phiên bản được tuần tự hóa có thể được gửi tới [điểm cuối máy chủ báo cáo](/en-US/docs/Web/API/Reporting_API#reporting_server_endpoints).

## Thuộc tính thể hiện

- `body`
  - : Phần thân của báo cáo.
    Đây là một đối tượng với các thuộc tính sau:
    - `type`
      - : Một chuỗi biểu diễn nguyên nhân của vi phạm đã kích hoạt báo cáo.
        Giá trị này có thể là một trong các giá trị sau:
        - `"corp"`
          - : Một tài liệu có {{httpheader("Cross-Origin-Embedder-Policy")}} được đặt thành [`require-corp`](/en-US/docs/Web/HTTP/Reference/Headers/Cross-Origin-Embedder-Policy#require-corp) đã cố tải một tài nguyên con khác nguồn mà không tự cho phép được nhúng một cách tường minh (bằng cách đặt {{httpheader("Cross-Origin-Resource-Policy")}} thích hợp).
        - `"navigation"`
          - : Một phần tử {{htmlelement("iframe")}} trong tài liệu có chỉ thị COEP `require-corp` hoặc `credentialless` tải một tài liệu mà:
            - Không có chỉ thị COEP `require-corp` lẫn `credentialless`
            - Khác nguồn với tài liệu nhúng nó, và không có tiêu đề CORP cho phép nhúng vào phần tử cha
        - `"worker initialization"`
          - : Một dedicated worker được tạo bởi tài liệu có chỉ thị COEP `require-corp` hoặc `credentialless` cố tải một script worker mà không có một trong hai chỉ thị này.

    - `blockedURL`
      - : Một chuỗi chứa URL của tài nguyên đã bị chặn tải do vi phạm COEP đang được thực thi.
    - `destination` {{non-standard_inline}}
      - : Một chuỗi cho biết _đích đến_ của tài nguyên bị chặn.
        Giá trị này có thể là một trong các giá trị của [`Request.destination`](/en-US/docs/Web/API/Request/destination#value).
    - `disposition`
      - : Một chuỗi cho biết vi phạm đã được thực thi hay chỉ được báo cáo.
        Giá trị này có thể là một trong các giá trị sau:
        - `"enforce"`
          - : Vi phạm làm cho việc tải tài nguyên được nhúng bị chặn.
            Giá trị này được đặt cho các vi phạm của chính sách được thiết lập bằng {{httpheader("Cross-Origin-Embedder-Policy")}}.
        - `"reporting"`
          - : Vi phạm được báo cáo mà không chặn tài nguyên tải.
            Giá trị này được đặt cho các vi phạm của chính sách được thiết lập bằng {{httpheader("Cross-Origin-Embedder-Policy-Report-Only")}}.

- `type`
  - : Chuỗi `"coep"`, cho biết đây là một báo cáo vi phạm COEP.

- `url`
  - : Một chuỗi biểu diễn URL của tài liệu đã tạo ra báo cáo.

## Mô tả

Các chính sách của một tài liệu cho việc tải và nhúng tài nguyên khác nguồn được yêu cầu ở chế độ `no-cors` được cấu hình và thực thi bằng tiêu đề HTTP {{httpheader("Cross-Origin-Embedder-Policy")}}, và cũng có thể chỉ được báo cáo mà không thực thi bằng tiêu đề {{httpheader("Cross-Origin-Embedder-Policy-Report-Only")}}.

Các vi phạm chính sách COEP có thể được báo cáo bất cứ khi nào một chính sách do các tiêu đề đó đặt ra chặn (hoặc sẽ chặn) việc tải một tài nguyên.

Bạn có thể theo dõi các báo cáo vi phạm COEP trong trang đặt chính sách bằng [Reporting API](/en-US/docs/Web/API/Reporting_API).
Để làm điều này, bạn tạo một đối tượng {{domxref("ReportingObserver")}} để lắng nghe báo cáo, truyền vào một phương thức callback và thuộc tính `options` (tùy chọn) chỉ định các loại báo cáo mà bạn muốn theo dõi.
Sau đó phương thức callback sẽ được gọi với các báo cáo thuộc loại được yêu cầu, truyền vào một đối tượng báo cáo.
Đối với các vi phạm COEP, đối tượng đó sẽ là `COEPViolationReport` (có thuộc tính [`type`](#type) được đặt là `"coep"`).

Cấu trúc của một báo cáo điển hình được hiển thị bên dưới.
Lưu ý rằng chúng ta có thể thấy URL của cả trang có chính sách bị vi phạm (`url`) và tài nguyên bị chặn tải (`body.blockedURL`).
Chúng ta cũng có thể thấy báo cáo được kích hoạt bởi vi phạm `corp`, và từ `body.disposition` biết được rằng vi phạm đó đã được thực thi (chứ không chỉ được báo cáo).

```json
{
  "type": "coep",
  "url": "https://url-of-page-attempting-to-load-resource-in-violation",
  "body": {
    "type": "corp",
    "blockedURL": "https://url-of-blocked-resource",
    "destination": "image",
    "disposition": "enforce"
  }
}
```

Các báo cáo vi phạm cũng có thể được gửi dưới dạng đối tượng JSON trong một yêu cầu `POST` tới [điểm cuối máy chủ báo cáo](/en-US/docs/Web/API/Reporting_API#reporting_server_endpoints) đã được cấu hình.
Tên điểm cuối máy chủ báo cáo được chỉ định trong chỉ thị chính sách [`report-to`](/en-US/docs/Web/HTTP/Reference/Headers/Cross-Origin-Embedder-Policy#report-to_endpoint_name) của tiêu đề {{httpheader("Cross-Origin-Embedder-Policy")}} hoặc {{httpheader("Cross-Origin-Embedder-Policy-Report-Only")}}.
Các tên điểm cuối hợp lệ và ánh xạ của chúng tới một URL cụ thể được định nghĩa bằng tiêu đề {{httpheader("Reporting-Endpoints")}}.

Cấu trúc của báo cáo phía máy chủ gần như giống hệt `COEPViolationReport`, ngoại trừ việc nó có thêm các trường `age` và `user_agent`.

```json
[
  {
    "age": 967132,
    "body": {
      "blockedURL": "https://url-of-resource-that-was-blocked",
      "destination": "image",
      "disposition": "enforce",
      "type": "corp"
    },
    "type": "coep",
    "url": "https://url-of-document-that-generated-report",
    "user_agent": "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36"
  }
]
```

## Ví dụ

### Sử dụng giao diện `ReportingObserver`

Ví dụ này cho thấy cách bạn có thể lấy các báo cáo vi phạm COEP bằng {{domxref("ReportingObserver")}}.

Trước tiên, hãy xét trường hợp chúng ta có một tệp HTML được lưu trữ trên origin `https://example.com`, bao gồm một phần tử {{htmlelement("img")}} đặt tài nguyên (khác nguồn) `some-image.png` làm nguồn.
Vì phần tử không đặt thuộc tính [`crossorigin`](/en-US/docs/Web/HTML/Reference/Attributes/crossorigin), nó sẽ được yêu cầu ở chế độ `no-cors`.
Theo mặc định, nếu `some-image.png` không được phục vụ với tiêu đề {{httpheader("Cross-Origin-Embedder-Policy")}}, yêu cầu này sẽ thành công.

```html
<img src="https://another-example.com/some-image.png" />
```

Để bảo đảm rằng tài liệu chỉ tải các tài nguyên khác nguồn có chỉ ra rằng chúng an toàn để tải trong origin tài liệu của chúng ta, chúng ta có thể đặt tiêu đề {{httpheader("Cross-Origin-Embedder-Policy")}} với chỉ thị [`require-corp`](/en-US/docs/Web/HTTP/Reference/Headers/Cross-Origin-Embedder-Policy#require-corp) như sau:

```http
Cross-Origin-Embedder-Policy: require-corp
```

Tiêu đề này buộc mọi tài nguyên phải được phục vụ với tiêu đề {{HTTPHeader("Cross-Origin-Resource-Policy")}} và giá trị `cross-origin` để có thể được tải vào origin của tài liệu (`https://example.com`).
Miễn là máy chủ lưu trữ `some-image.png` không đặt tiêu đề này, chúng ta không cần làm gì thêm để kích hoạt một vi phạm COEP.

Để quan sát các vi phạm trong trang, chúng ta tạo một đối tượng {{domxref("ReportingObserver")}} mới để lắng nghe các báo cáo có loại `"coep"`, truyền vào một callback sẽ nhận và ghi log các báo cáo.
Đoạn mã này cần được tải trước script gây ra vi phạm:

```js
const options = {
  types: ["coep"],
  buffered: true,
};

const observer = new ReportingObserver((reports, observer) => {
  reports.forEach((violation) => {
    console.log(violation);
    console.log(JSON.stringify(violation));
  });
}, options);

observer.observe();
```

Ở trên, chúng ta ghi log từng đối tượng báo cáo vi phạm và phiên bản chuỗi JSON của đối tượng, có thể trông tương tự như đối tượng bên dưới.
Lưu ý rằng `type` là `"coep"`.

```json
{
  "type": "coep",
  "url": "https://example.com",
  "body": {
    "type": "corp",
    "blockedURL": "https://another-example.com/some-image.png",
    "destination": "image",
    "disposition": "enforce"
  }
}
```

Báo cáo tương tự cũng có thể được tạo bằng {{httpheader("Cross-Origin-Embedder-Policy-Report-Only")}}, ngoại trừ việc [disposition](#disposition) sẽ được báo cáo là `"reporting"`.

### Gửi một báo cáo tới điểm cuối báo cáo

Việc cấu hình một trang web để gửi báo cáo COEP tới [điểm cuối máy chủ báo cáo](/en-US/docs/Web/API/Reporting_API#reporting_server_endpoints) gần như giống hệt ví dụ trước.
Khác biệt duy nhất là chúng ta cần chỉ định một điểm cuối báo cáo nơi muốn gửi báo cáo, bằng tiêu đề phản hồi {{httpheader("Reporting-Endpoints")}}, rồi tham chiếu tới điểm cuối đó trong tham số `report-to` khi thiết lập chính sách.

Bạn có thể thấy điều này bên dưới, nơi chúng ta định nghĩa điểm cuối tên là `coep-endpoint` rồi tham chiếu tới nó trong chính sách:

```http
Reporting-Endpoints: coep-endpoint="https://some-example.com/coep"
Cross-Origin-Embedder-Policy: require-corp; report-to="coep-endpoint"
```

Sau đó báo cáo vi phạm sẽ được gửi dưới dạng một đối tượng JSON trong một yêu cầu `POST` tới điểm cuối được tham chiếu bởi `coep-endpoint`.

Đối tượng báo cáo có cấu trúc giống với cấu trúc được trả về từ callback của `ReportingObserver`, ngoại trừ việc có thêm các thuộc tính `age` và `user_agent`.

```json
[
  {
    "age": 717139,
    "body": {
      "blockedURL": "https://another-example.com/some-image.png",
      "destination": "image",
      "disposition": "enforce",
      "type": "corp"
    },
    "type": "coep",
    "url": "https://example.com",
    "user_agent": "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36"
  }
]
```

Báo cáo tương tự sẽ được tạo ra nếu chúng ta đặt {{httpheader("Cross-Origin-Embedder-Policy-Report-Only")}} theo cùng cách, ngoại trừ [disposition](#disposition) sẽ được đặt thành `"reporting"`.

## Specifications

{{Specifications}}

## Browser compatibility

{{Compat}}

## Xem thêm

- {{domxref("ReportingObserver")}}
- {{httpheader("Cross-Origin-Embedder-Policy")}}
- {{httpheader("Cross-Origin-Embedder-Policy-Report-Only")}}
- {{HTTPHeader("Reporting-Endpoints")}}
- [Reporting API](/en-US/docs/Web/API/Reporting_API)
- [The Reporting API](https://developer.chrome.com/docs/capabilities/web-apis/reporting-api) (developer.chrome.com)
