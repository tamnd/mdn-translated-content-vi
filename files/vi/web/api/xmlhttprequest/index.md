---
title: XMLHttpRequest
slug: Web/API/XMLHttpRequest
page-type: web-api-interface
browser-compat: api.XMLHttpRequest
---

{{APIRef("XMLHttpRequest API")}} {{AvailableInWorkers("window_and_worker_except_service")}}

Các đối tượng `XMLHttpRequest` (XHR) được sử dụng để tương tác với máy chủ. Bạn có thể lấy dữ liệu từ một URL mà không cần phải tải lại toàn bộ trang. Điều này cho phép một trang Web cập nhật chỉ một phần của trang mà không làm gián đoạn những gì người dùng đang thực hiện.

{{InheritanceDiagram}}

Mặc dù có tên là `XMLHttpRequest`, nó có thể được sử dụng để lấy bất kỳ loại dữ liệu nào, không chỉ XML.

Nếu nhu cầu giao tiếp của bạn liên quan đến việc nhận dữ liệu sự kiện hoặc dữ liệu thông báo từ máy chủ, hãy cân nhắc sử dụng [server-sent events](/en-US/docs/Web/API/Server-sent_events) thông qua giao diện {{domxref("EventSource")}}. Đối với giao tiếp song song toàn phần (full-duplex), [WebSockets](/en-US/docs/Web/API/WebSockets_API) có thể là lựa chọn tốt hơn.

## Hàm tạo

- {{domxref("XMLHttpRequest.XMLHttpRequest", "XMLHttpRequest()")}}
  - : Hàm tạo khởi tạo một `XMLHttpRequest`. Nó phải được gọi trước khi gọi bất kỳ phương thức nào khác.

## Thuộc tính instance

_Giao diện này cũng kế thừa các thuộc tính của {{domxref("XMLHttpRequestEventTarget")}} và của {{domxref("EventTarget")}}._

- {{domxref("XMLHttpRequest.readyState")}} {{ReadOnlyInline}}
  - : Trả về một số đại diện cho trạng thái của yêu cầu.
- {{domxref("XMLHttpRequest.response")}} {{ReadOnlyInline}}
  - : Trả về một {{jsxref("ArrayBuffer")}}, một {{domxref("Blob")}}, một {{domxref("Document")}}, một đối tượng JavaScript, hoặc một chuỗi, tùy thuộc vào giá trị của {{domxref("XMLHttpRequest.responseType")}}, chứa phần thân thực thể phản hồi.
- {{domxref("XMLHttpRequest.responseText")}} {{ReadOnlyInline}}
  - : Trả về một chuỗi chứa phản hồi cho yêu cầu dưới dạng văn bản, hoặc `null` nếu yêu cầu không thành công hoặc chưa được gửi.
- {{domxref("XMLHttpRequest.responseType")}}
  - : Chỉ định loại của phản hồi.
- {{domxref("XMLHttpRequest.responseURL")}} {{ReadOnlyInline}}
  - : Trả về URL đã được tuần tự hóa của phản hồi hoặc chuỗi rỗng nếu URL là null.
- {{domxref("XMLHttpRequest.responseXML")}} {{ReadOnlyInline}}
  - : Trả về một {{domxref("Document")}} chứa phản hồi cho yêu cầu, hoặc `null` nếu yêu cầu không thành công, chưa được gửi, hoặc không thể phân tích cú pháp dưới dạng XML hoặc HTML. Không khả dụng trong [Web Workers](/en-US/docs/Web/API/Web_Workers_API).
- {{domxref("XMLHttpRequest.status")}} {{ReadOnlyInline}}
  - : Trả về [mã trạng thái phản hồi HTTP](/en-US/docs/Web/HTTP/Reference/Status) của yêu cầu.
- {{domxref("XMLHttpRequest.statusText")}} {{ReadOnlyInline}}
  - : Trả về một chuỗi chứa chuỗi phản hồi do máy chủ HTTP trả về. Không giống như {{domxref("XMLHttpRequest.status")}}, thuộc tính này bao gồm toàn bộ văn bản của thông báo phản hồi (`"OK"`, ví dụ).

    > [!NOTE]
    > Theo đặc tả HTTP/2 {{RFC(7540, "Response Pseudo-Header Fields", "8.1.2.4")}}, HTTP/2 không định nghĩa cách mang phiên bản hoặc reason phrase có trong dòng trạng thái HTTP/1.1.

- {{domxref("XMLHttpRequest.timeout")}}
  - : Thời gian tính bằng mili giây mà một yêu cầu có thể kéo dài trước khi tự động bị chấm dứt.
- {{domxref("XMLHttpRequest.upload")}} {{ReadOnlyInline}}
  - : Một {{domxref("XMLHttpRequestUpload")}} đại diện cho quá trình tải lên.
- {{domxref("XMLHttpRequest.withCredentials")}}
  - : Trả về `true` nếu các yêu cầu `Access-Control` xuyên nguồn gốc nên được thực hiện bằng cách sử dụng thông tin xác thực như cookie hoặc tiêu đề ủy quyền; ngược lại là `false`.

### Thuộc tính không chuẩn

- `XMLHttpRequest.mozAnon` {{ReadOnlyInline}} {{Non-standard_Inline}}
  - : Một boolean. Nếu true, yêu cầu sẽ được gửi mà không có tiêu đề cookie và xác thực.
- `XMLHttpRequest.mozSystem` {{ReadOnlyInline}} {{Non-standard_Inline}}
  - : Một boolean. Nếu true, chính sách cùng nguồn gốc sẽ không được áp dụng cho yêu cầu.

## Phương thức instance

- {{domxref("XMLHttpRequest.abort()")}}
  - : Hủy bỏ yêu cầu nếu nó đã được gửi.
- {{domxref("XMLHttpRequest.getAllResponseHeaders()")}}
  - : Trả về tất cả các tiêu đề phản hồi, được phân tách bằng {{Glossary("CRLF")}}, dưới dạng chuỗi, hoặc `null` nếu chưa nhận được phản hồi.
- {{domxref("XMLHttpRequest.getResponseHeader()")}}
  - : Trả về chuỗi chứa văn bản của tiêu đề được chỉ định, hoặc `null` nếu phản hồi chưa được nhận hoặc tiêu đề không tồn tại trong phản hồi.
- {{domxref("XMLHttpRequest.open()")}}
  - : Khởi tạo một yêu cầu.
- {{domxref("XMLHttpRequest.overrideMimeType()")}}
  - : Ghi đè kiểu MIME do máy chủ trả về.
- {{domxref("XMLHttpRequest.send()")}}
  - : Gửi yêu cầu. Nếu yêu cầu là không đồng bộ (mặc định), phương thức này trả về ngay khi yêu cầu được gửi.
- {{domxref("XMLHttpRequest.setAttributionReporting()")}} {{securecontext_inline}} {{deprecated_inline}}
  - : Cho biết bạn muốn phản hồi của yêu cầu có thể đăng ký nguồn phân thuộc tính hoặc sự kiện kích hoạt.
- {{domxref("XMLHttpRequest.setPrivateToken()")}} {{experimental_inline}}
  - : Thêm thông tin [private state token](/en-US/docs/Web/API/Private_State_Token_API/Using) vào một lệnh gọi `XMLHttpRequest`, để bắt đầu các hoạt động private state token.
- {{domxref("XMLHttpRequest.setRequestHeader()")}}
  - : Đặt giá trị của một tiêu đề yêu cầu HTTP. Bạn phải gọi `setRequestHeader()` sau {{domxref("XMLHttpRequest.open", "open()")}}, nhưng trước {{domxref("XMLHttpRequest.send", "send()")}}.

## Sự kiện

_Giao diện này cũng kế thừa các sự kiện của {{domxref("XMLHttpRequestEventTarget")}}._

- {{domxref("XMLHttpRequest/readystatechange_event", "readystatechange")}}
  - : Được kích hoạt bất cứ khi nào thuộc tính {{domxref("XMLHttpRequest.readyState", "readyState")}} thay đổi.
    Cũng có sẵn thông qua thuộc tính trình xử lý sự kiện `onreadystatechange`.

## Các đặc tả kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("XMLSerializer")}}: Tuần tự hóa một cây DOM thành XML
- [Sử dụng XMLHttpRequest](/en-US/docs/Web/API/XMLHttpRequest_API/Using_XMLHttpRequest)
- [Fetch API](/en-US/docs/Web/API/Fetch_API)
