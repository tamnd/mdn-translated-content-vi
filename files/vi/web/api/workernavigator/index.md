---
title: WorkerNavigator
slug: Web/API/WorkerNavigator
page-type: web-api-interface
browser-compat: api.WorkerNavigator
---

{{APIRef("Web Workers API")}}{{AvailableInWorkers("worker")}}

Giao diện **`WorkerNavigator`** đại diện cho một tập con của giao diện {{DOMxRef("Navigator")}} được phép truy cập từ một {{DOMxRef("Worker")}}. Đối tượng này được khởi tạo cho mỗi worker và có sẵn thông qua thuộc tính {{DOMxRef("WorkerGlobalScope.navigator", "self.navigator")}}.

## Thuộc tính thể hiện

_Giao diện `WorkerNavigator` không kế thừa thuộc tính nào._

- {{DOMxRef("WorkerNavigator.appCodeName")}} {{Deprecated_Inline}} {{ReadOnlyInline}}
  - : Luôn trả về `'Mozilla'` trong mọi trình duyệt. Thuộc tính này chỉ được giữ lại vì mục đích tương thích.
- {{DOMxRef("WorkerNavigator.appName")}} {{Deprecated_Inline}} {{ReadOnlyInline}}
  - : Trả về tên chính thức của trình duyệt. Không nên dựa vào thuộc tính này để nhận giá trị chính xác.
- {{DOMxRef("WorkerNavigator.appVersion")}} {{Deprecated_Inline}} {{ReadOnlyInline}}
  - : Trả về phiên bản của trình duyệt dưới dạng chuỗi. Không nên dựa vào thuộc tính này để nhận giá trị chính xác.
- {{DOMxRef("WorkerNavigator.connection")}} {{ReadOnlyInline}}
  - : Cung cấp đối tượng {{DOMxRef("NetworkInformation")}} chứa thông tin về kết nối mạng của thiết bị.
- {{domxref("WorkerNavigator.deviceMemory")}} {{ReadOnlyInline}} {{SecureContext_Inline}}
  - : Trả về lượng bộ nhớ thiết bị tính bằng gigabyte. Giá trị này chỉ là xấp xỉ, được tính bằng cách làm tròn đến lũy thừa của 2 gần nhất rồi chia cho 1024.
- {{domxref("WorkerNavigator.globalPrivacyControl")}} {{ReadOnlyInline}} {{Experimental_Inline}}
  - : Trả về giá trị boolean cho biết người dùng có đồng ý để thông tin của họ được chia sẻ hoặc bán hay không.
- {{domxref("WorkerNavigator.gpu")}} {{ReadOnlyInline}} {{SecureContext_Inline}}
  - : Trả về đối tượng {{domxref("GPU")}} cho ngữ cảnh worker hiện tại. Đây là điểm khởi đầu cho {{domxref("WebGPU_API", "WebGPU API", "", "nocode")}}.
- {{DOMxRef("WorkerNavigator.hardwareConcurrency")}} {{ReadOnlyInline}}
  - : Trả về số lượng lõi xử lý logic khả dụng.
- {{domxref("WorkerNavigator.hid")}} {{ReadOnlyInline}} {{Experimental_Inline}} {{SecureContext_Inline}}
  - : Trả về đối tượng {{domxref("HID")}} cung cấp các phương thức để kết nối với thiết bị HID đã được người dùng cấp quyền và liệt kê các thiết bị HID đang gắn, cùng các trình xử lý sự kiện cho việc thiết bị HID kết nối và ngắt kết nối.
- {{DOMxRef("WorkerNavigator.language")}} {{ReadOnlyInline}}
  - : Trả về chuỗi biểu thị ngôn ngữ ưu tiên của người dùng, thường là ngôn ngữ giao diện trình duyệt. Giá trị `null` được trả về khi thông tin này không xác định.
- {{DOMxRef("WorkerNavigator.languages")}} {{ReadOnlyInline}}
  - : Trả về mảng chuỗi biểu thị các ngôn ngữ mà người dùng biết, theo thứ tự ưu tiên.
- {{DOMxRef("WorkerNavigator.locks")}} {{ReadOnlyInline}} {{SecureContext_Inline}}
  - : Trả về đối tượng {{DOMxRef("LockManager")}} cung cấp các phương thức để yêu cầu một đối tượng {{DOMxRef('Lock')}} mới và truy vấn một đối tượng {{DOMxRef('Lock')}} hiện có.
- {{DOMxRef("WorkerNavigator.mediaCapabilities")}} {{ReadOnlyInline}}
  - : Trả về đối tượng {{domxref("MediaCapabilities")}} có thể hiển thị thông tin về khả năng mã hóa và giải mã cho một định dạng và đầu ra cụ thể.
- {{DOMxRef("WorkerNavigator.onLine")}} {{ReadOnlyInline}}
  - : Trả về giá trị boolean cho biết trình duyệt có đang trực tuyến hay không.
- {{DOMxRef("WorkerNavigator.permissions")}} {{ReadOnlyInline}}
  - : Trả về đối tượng {{DOMxRef("Permissions")}} có thể dùng để truy vấn và cập nhật trạng thái quyền của các API thuộc [Permissions API](/en-US/docs/Web/API/Permissions_API).
- {{DOMxRef("WorkerNavigator.platform")}} {{Deprecated_Inline}} {{ReadOnlyInline}}
  - : Trả về chuỗi biểu thị nền tảng của trình duyệt. Không nên dựa vào thuộc tính này để nhận giá trị chính xác.
- {{DOMxRef("WorkerNavigator.product")}} {{Deprecated_Inline}} {{ReadOnlyInline}}
  - : Luôn trả về `'Gecko'` trong mọi trình duyệt. Thuộc tính này chỉ được giữ lại vì mục đích tương thích.
- {{domxref("WorkerNavigator.serial")}} {{ReadOnlyInline}} {{Experimental_Inline}} {{SecureContext_Inline}}
  - : Trả về đối tượng {{domxref("Serial")}}, đại diện cho điểm khởi đầu vào [Web Serial API](/en-US/docs/Web/API/Web_Serial_API) để điều khiển các cổng nối tiếp.
- {{domxref("WorkerNavigator.serviceWorker")}} {{ReadOnlyInline}} {{SecureContext_Inline}}
  - : Trả về đối tượng {{domxref("ServiceWorkerContainer")}} cung cấp quyền truy cập vào việc đăng ký, gỡ bỏ, nâng cấp và giao tiếp với các đối tượng {{domxref("ServiceWorker")}} cho [tài liệu liên kết](https://html.spec.whatwg.org/multipage/browsers.html#concept-document-window).
- {{DOMxRef("WorkerNavigator.storage")}} {{ReadOnlyInline}} {{SecureContext_Inline}}
  - : Trả về giao diện {{DOMxRef('StorageManager')}} để quản lý quyền lưu trữ bền vững và ước tính dung lượng lưu trữ khả dụng.
- {{domxref("WorkerNavigator.usb")}} {{ReadOnlyInline}} {{SecureContext_Inline}}
  - : Trả về đối tượng {{domxref("USB")}} cho tài liệu hiện tại, cung cấp quyền truy cập vào chức năng [WebUSB API](/en-US/docs/Web/API/WebUSB_API).
- {{DOMxRef("WorkerNavigator.userAgent")}} {{ReadOnlyInline}}
  - : Trả về chuỗi user agent của trình duyệt hiện tại.
- {{domxref("WorkerNavigator.userAgentData")}} {{ReadOnlyInline}} {{Experimental_Inline}} {{SecureContext_Inline}}
  - : Trả về đối tượng {{domxref("NavigatorUAData")}}, cung cấp quyền truy cập vào thông tin về trình duyệt và hệ điều hành của người dùng.

## Phương thức thể hiện

_Giao diện `WorkerNavigator` không kế thừa phương thức nào._

- {{domxref("WorkerNavigator.clearAppBadge()")}} {{SecureContext_Inline}}
  - : Xóa huy hiệu trên biểu tượng ứng dụng hiện tại và trả về một {{jsxref("Promise")}} được giải quyết thành {{jsxref("undefined")}}.
- {{domxref("WorkerNavigator.setAppBadge()")}} {{SecureContext_Inline}}
  - : Đặt huy hiệu trên biểu tượng gắn với ứng dụng này và trả về một {{jsxref("Promise")}} được giải quyết thành {{jsxref("undefined")}}.

## Đặc tả

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- Các giao diện liên quan đến Worker khác: {{DOMxRef("Worker")}}, {{DOMxRef("WorkerLocation")}}, và {{DOMxRef("WorkerGlobalScope")}}
- [Sử dụng web workers](/en-US/docs/Web/API/Web_Workers_API/Using_web_workers)
