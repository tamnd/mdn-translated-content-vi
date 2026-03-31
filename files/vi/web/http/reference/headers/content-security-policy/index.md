---
title: Content-Security-Policy (CSP) header
short-title: Content-Security-Policy
slug: Web/HTTP/Reference/Headers/Content-Security-Policy
page-type: http-header
browser-compat: http.headers.Content-Security-Policy
sidebar: http
---

Tiêu đề phản hồi HTTP **`Content-Security-Policy`** cho phép quản trị viên trang web kiểm soát tài nguyên mà tác nhân người dùng được phép tải cho một trang nhất định.
Với một vài ngoại lệ, các chính sách chủ yếu liên quan đến việc chỉ định nguồn gốc máy chủ và điểm cuối script.
Điều này giúp bảo vệ chống lại các cuộc tấn công {{Glossary("cross-site scripting")}}.

Các vi phạm có thể được báo cáo bằng cách sử dụng [Reporting API](/en-US/docs/Web/API/Reporting_API).
Các báo cáo có thể được quan sát trong trang mà chính sách đang được thực thi, sử dụng [`ReportingObserver`](/en-US/docs/Web/API/ReportingObserver), và gửi đến các điểm cuối máy chủ được xác định trong tiêu đề phản hồi HTTP {{HTTPHeader("Reporting-Endpoints")}} và được chọn bằng chỉ thị CSP {{CSP("report-to")}}.
Để biết thêm thông tin, xem {{domxref("CSPViolationReport")}}.

Xem hướng dẫn [Content Security Policy (CSP)](/en-US/docs/Web/HTTP/Guides/CSP) để biết chi tiết về cách CSP được gửi đến trình duyệt, cách nó trông như thế nào, cùng với các trường hợp sử dụng và chiến lược triển khai.

<table class="properties">
  <tbody>
    <tr>
      <th scope="row">Loại tiêu đề</th>
      <td>{{Glossary("Response header", "Tiêu đề phản hồi")}}</td>
    </tr>
  </tbody>
</table>

## Cú pháp

```http
Content-Security-Policy: <policy-directive>; <policy-directive>
```

trong đó `<policy-directive>` bao gồm:
`<directive> <value>` không có dấu câu nội bộ.

## Chỉ thị

### Chỉ thị Fetch

Chỉ thị Fetch kiểm soát các vị trí mà các loại tài nguyên nhất định có thể được tải từ đó.

- {{CSP("child-src")}}
  - : Xác định các nguồn hợp lệ cho [web workers](/en-US/docs/Web/API/Web_Workers_API) và các ngữ cảnh duyệt web lồng nhau được tải bằng các phần tử như {{HTMLElement("frame")}} và {{HTMLElement("iframe")}}. Dự phòng cho `frame-src` và `worker-src`.

- {{CSP("connect-src")}}
  - : Hạn chế các URL có thể được tải bằng giao diện script.
- {{CSP("default-src")}}
  - : Đóng vai trò dự phòng cho các {{Glossary("Fetch directive", "chỉ thị fetch")}} khác. Dự phòng cho tất cả các chỉ thị fetch khác.

- {{CSP("fenced-frame-src")}} {{experimental_inline}}
  - : Chỉ định các nguồn hợp lệ cho các ngữ cảnh duyệt web lồng nhau được tải vào các phần tử {{HTMLElement("fencedframe")}}.
- {{CSP("font-src")}}
  - : Chỉ định các nguồn hợp lệ cho các phông chữ được tải bằng {{cssxref("@font-face")}}.
- {{CSP("frame-src")}}
  - : Chỉ định các nguồn hợp lệ cho các ngữ cảnh duyệt web lồng nhau được tải vào các phần tử như {{HTMLElement("frame")}} và {{HTMLElement("iframe")}}.
- {{CSP("img-src")}}
  - : Chỉ định các nguồn hợp lệ của hình ảnh và favicon.
- {{CSP("manifest-src")}}
  - : Chỉ định các nguồn hợp lệ của tệp manifest ứng dụng.
- {{CSP("media-src")}}
  - : Chỉ định các nguồn hợp lệ để tải phương tiện bằng các phần tử {{HTMLElement("audio")}}, {{HTMLElement("video")}} và {{HTMLElement("track")}}.
- {{CSP("object-src")}}
  - : Chỉ định các nguồn hợp lệ cho các phần tử {{HTMLElement("object")}} và {{HTMLElement("embed")}}.
- {{CSP("prefetch-src")}} {{Deprecated_Inline}} {{Non-standard_Inline}}
  - : Chỉ định các nguồn hợp lệ để prefetch hoặc prerender.
- {{CSP("script-src")}}
  - : Chỉ định các nguồn hợp lệ cho tài nguyên JavaScript và WebAssembly. Dự phòng cho `script-src-elem` và `script-src-attr`.

- {{CSP("script-src-elem")}}
  - : Chỉ định các nguồn hợp lệ cho các phần tử JavaScript {{HTMLElement("script")}}.
- {{CSP("script-src-attr")}}
  - : Chỉ định các nguồn hợp lệ cho các trình xử lý sự kiện inline JavaScript.
- {{CSP("style-src")}}
  - : Chỉ định các nguồn hợp lệ cho các stylesheet. Dự phòng cho `style-src-elem` và `style-src-attr`.

- {{CSP("style-src-elem")}}
  - : Chỉ định các nguồn hợp lệ cho các phần tử stylesheet {{HTMLElement("style")}} và các phần tử {{HTMLElement("link")}} có `rel="stylesheet"`.
- {{CSP("style-src-attr")}}
  - : Chỉ định các nguồn hợp lệ cho các style inline được áp dụng cho các phần tử DOM riêng lẻ.
- {{CSP("worker-src")}}
  - : Chỉ định các nguồn hợp lệ cho các script {{domxref("Worker")}}, {{domxref("SharedWorker")}}, hoặc {{domxref("ServiceWorker")}}.

#### Dự phòng

Một số chỉ thị fetch hoạt động như dự phòng cho các chỉ thị chi tiết hơn khác. Điều này có nghĩa là nếu chỉ thị chi tiết hơn không được chỉ định, thì dự phòng được sử dụng để cung cấp chính sách cho loại tài nguyên đó.

- `default-src` là dự phòng cho tất cả các chỉ thị fetch khác.
- `script-src` là dự phòng cho `script-src-attr` và `script-src-elem`.
- `style-src` là dự phòng cho `style-src-attr` và `style-src-elem`.
- `child-src` là dự phòng cho `frame-src` và `worker-src`.

### Chỉ thị tài liệu

Chỉ thị tài liệu điều chỉnh các thuộc tính của tài liệu hoặc môi trường [worker](/en-US/docs/Web/API/Web_Workers_API) mà chính sách áp dụng.

- {{CSP("base-uri")}}
  - : Hạn chế các URL có thể được sử dụng trong phần tử {{HTMLElement("base")}} của tài liệu.
- {{CSP("sandbox")}}
  - : Kích hoạt sandbox cho tài nguyên được yêu cầu tương tự như thuộc tính [`sandbox`](/en-US/docs/Web/HTML/Reference/Elements/iframe#sandbox) của {{HTMLElement("iframe")}}.

### Chỉ thị điều hướng

Chỉ thị điều hướng điều chỉnh vị trí mà người dùng có thể điều hướng hoặc gửi biểu mẫu.

- {{CSP("form-action")}}
  - : Hạn chế các URL có thể được sử dụng làm mục tiêu của các gửi biểu mẫu từ ngữ cảnh đã cho.
- {{CSP("frame-ancestors")}}
  - : Chỉ định các cha hợp lệ có thể nhúng trang bằng {{HTMLElement("frame")}}, {{HTMLElement("iframe")}}, {{HTMLElement("object")}}, hoặc {{HTMLElement("embed")}}.

### Chỉ thị báo cáo

Chỉ thị báo cáo kiểm soát URL đích cho báo cáo vi phạm CSP trong `Content-Security-Policy` và {{HTTPHeader("Content-Security-Policy-Report-Only")}}.

- {{CSP("report-to")}}
  - : Cung cấp cho trình duyệt một token xác định điểm cuối báo cáo hoặc nhóm điểm cuối để gửi thông tin vi phạm CSP. Các điểm cuối mà token đại diện được cung cấp thông qua các tiêu đề HTTP khác, chẳng hạn như {{HTTPHeader("Reporting-Endpoints")}} và {{HTTPHeader("Report-To")}} {{deprecated_inline}}.

### Chỉ thị khác

- {{CSP("require-trusted-types-for")}}
  - : Thực thi [Trusted Types](/en-US/docs/Web/API/Trusted_Types_API) tại các điểm tiêm DOM XSS.
- {{CSP("trusted-types")}}
  - : Được sử dụng để chỉ định danh sách được phép của các chính sách [Trusted Types](/en-US/docs/Web/API/Trusted_Types_API). Trusted Types cho phép ứng dụng khóa các điểm tiêm DOM XSS chỉ chấp nhận các giá trị có kiểu, không thể giả mạo thay vì chuỗi.
- {{CSP("upgrade-insecure-requests")}}
  - : Hướng dẫn các tác nhân người dùng coi tất cả các URL không an toàn của một trang web (những URL được phục vụ qua HTTP) như thể chúng đã được thay thế bằng các URL an toàn (những URL được phục vụ qua HTTPS).

### Chỉ thị không còn dùng nữa

- {{CSP("block-all-mixed-content")}} {{deprecated_inline}}
  - : Ngăn tải bất kỳ tài nguyên nào bằng HTTP khi trang được tải bằng HTTPS.

- {{CSP("report-uri")}} {{deprecated_inline}}
  - : Cung cấp cho trình duyệt URL nơi các báo cáo vi phạm CSP nên được gửi. Điều này đã được thay thế bởi chỉ thị [`report-to`](/en-US/docs/Web/HTTP/Reference/Headers/Content-Security-Policy/report-to).

## Cú pháp chỉ thị Fetch

Tất cả các chỉ thị fetch có thể được chỉ định là một trong các dạng sau:

- giá trị đơn `'none'`, chỉ ra rằng loại tài nguyên cụ thể nên bị chặn hoàn toàn
- một hoặc nhiều giá trị _biểu thức nguồn_, chỉ ra các nguồn hợp lệ cho loại tài nguyên đó.

### 'nonce-\<nonce_value>'

Giá trị này bao gồm chuỗi `nonce-` theo sau là giá trị {{Glossary("Nonce", "nonce")}}. Giá trị nonce có thể sử dụng bất kỳ ký tự nào từ [Base64](/en-US/docs/Glossary/Base64#base64_characters) hoặc [URL-safe Base64](/en-US/docs/Glossary/Base64#url_and_filename_safe_base64).

Chuỗi này là giá trị ngẫu nhiên mà máy chủ tạo ra cho mỗi phản hồi HTTP.

### '\<hash_algorithm>-<hash_value>'

Giá trị này bao gồm chuỗi xác định thuật toán hash, theo sau là `-`, theo sau là giá trị hash.

- Mã định danh thuật toán hash phải là một trong `sha256`, `sha384`, hoặc `sha512`.
- Giá trị hash là {{glossary("hash function", "hash")}} được mã hóa base64 của tài nguyên `<script>` hoặc `<style>`.

### \<host-source>

[URL](/en-US/docs/Web/URI) hoặc địa chỉ IP của {{glossary("host")}} là nguồn hợp lệ cho tài nguyên.

### \<scheme-source>

Một [scheme](/en-US/docs/Web/URI/Reference/Schemes), chẳng hạn như `https:`. Dấu hai chấm là bắt buộc.

### 'self'

Các tài nguyên của loại đã cho chỉ có thể được tải từ cùng {{glossary("origin")}} như tài liệu.

### 'unsafe-eval'

Theo mặc định, nếu CSP chứa chỉ thị `default-src` hoặc `script-src`, các hàm JavaScript đánh giá đối số của chúng như JavaScript sẽ bị vô hiệu hóa. Từ khóa `unsafe-eval` có thể được sử dụng để hoàn tác bảo vệ này.

### 'unsafe-inline'

Theo mặc định, nếu CSP chứa chỉ thị `default-src` hoặc `script-src`, JavaScript inline không được phép thực thi. Từ khóa `unsafe-inline` có thể được sử dụng để hoàn tác bảo vệ này.

### 'strict-dynamic'

Từ khóa `'strict-dynamic'` làm cho niềm tin được cấp cho một script bởi [nonce](#nonce-nonce_value) hoặc [hash](#hash_algorithm-hash_value) mở rộng đến các script mà script này tải động.

## CSP trong workers

[Workers](/en-US/docs/Web/API/Worker) nói chung _không_ được điều chỉnh bởi chính sách bảo mật nội dung của tài liệu (hoặc worker cha) đã tạo ra chúng. Để chỉ định chính sách bảo mật nội dung cho worker, hãy đặt tiêu đề phản hồi `Content-Security-Policy` cho yêu cầu yêu cầu script worker chính nó.

## Nhiều chính sách bảo mật nội dung

Cơ chế CSP cho phép nhiều chính sách được chỉ định cho tài nguyên, bao gồm qua tiêu đề `Content-Security-Policy`, tiêu đề {{HTTPHeader("Content-Security-Policy-Report-Only")}} và phần tử {{HTMLElement("meta")}}.

## Ví dụ

### Vô hiệu hóa code inline không an toàn và chỉ cho phép tài nguyên HTTPS

Tiêu đề HTTP này đặt chính sách mặc định chỉ cho phép tải tài nguyên (hình ảnh, phông chữ, script, v.v.) qua HTTPS.

```http
Content-Security-Policy: default-src https:
```

### Cho phép code inline và tài nguyên HTTPS, nhưng vô hiệu hóa plugin

Chính sách này có thể được sử dụng trên trang web hiện tại sử dụng quá nhiều code inline để sửa, để đảm bảo tài nguyên chỉ được tải qua HTTPS và vô hiệu hóa plugin:

```http
Content-Security-Policy: default-src https: 'unsafe-eval' 'unsafe-inline'; object-src 'none'
```

### Báo cáo nhưng không thực thi vi phạm khi kiểm thử

Ví dụ này đặt các hạn chế tương tự như ví dụ trước, nhưng sử dụng tiêu đề {{httpheader("Content-Security-Policy-Report-Only")}} và chỉ thị {{CSP("report-to")}}.

```http
Reporting-Endpoints: csp-endpoint="https://example.com/csp-reports"
```

```http
Content-Security-Policy-Report-Only: default-src https:; report-uri /csp-violation-report-url/; report-to csp-endpoint
```

## Thông số kỹ thuật

{{Specifications}}

## Khả năng tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{HTTPHeader("Content-Security-Policy-Report-Only")}}
- Chỉ thị CSP {{CSP("report-to")}}
- {{httpheader("Reporting-Endpoints")}}
- {{domxref("CSPViolationReport")}}
- [Reporting API](/en-US/docs/Web/API/Reporting_API).
