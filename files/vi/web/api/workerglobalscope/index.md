---
title: WorkerGlobalScope
slug: Web/API/WorkerGlobalScope
page-type: web-api-interface
browser-compat: api.WorkerGlobalScope
---

{{APIRef("Web Workers API")}}{{AvailableInWorkers("worker")}}

Giao diện **`WorkerGlobalScope`** của [Web Workers API](/en-US/docs/Web/API/Web_Workers_API) là một giao diện đại diện cho phạm vi của bất kỳ worker nào. Workers không có browsing context; phạm vi này chứa thông tin thường được truyền tải bởi các đối tượng {{domxref("Window")}} — trong trường hợp này là các event handler, console hoặc đối tượng {{domxref("WorkerNavigator")}} liên kết. Mỗi `WorkerGlobalScope` có vòng lặp sự kiện riêng.

Giao diện này thường được chuyên biệt hóa bởi từng loại worker: {{domxref("DedicatedWorkerGlobalScope")}} cho dedicated workers, {{domxref("SharedWorkerGlobalScope")}} cho shared workers, và {{domxref("ServiceWorkerGlobalScope")}} cho [ServiceWorker](/en-US/docs/Web/API/Service_Worker_API). Thuộc tính `self` trả về phạm vi chuyên biệt cho mỗi ngữ cảnh.

{{InheritanceDiagram}}

## Thuộc tính instance

_Giao diện này kế thừa các thuộc tính từ giao diện {{domxref("EventTarget")}}._

- {{domxref("WorkerGlobalScope.caches")}} {{ReadOnlyInline}} {{SecureContext_Inline}}
  - : Trả về đối tượng {{domxref("CacheStorage")}} liên kết với ngữ cảnh hiện tại. Đối tượng này cho phép các chức năng như lưu trữ tài nguyên cho sử dụng offline, và tạo các phản hồi tùy chỉnh cho các request.
- {{domxref("WorkerGlobalScope.crossOriginIsolated")}} {{ReadOnlyInline}}
  - : Trả về một giá trị boolean cho biết trang web có ở trạng thái cross-origin isolation hay không.
- {{domxref("WorkerGlobalScope.crypto")}} {{ReadOnlyInline}}
  - : Trả về đối tượng {{domxref("Crypto")}} liên kết với đối tượng global.
- {{domxref("WorkerGlobalScope.fonts")}} {{ReadOnlyInline}}
  - : Trả về {{domxref("FontFaceSet")}} liên kết với worker.
- {{domxref("WorkerGlobalScope.indexedDB")}} {{ReadOnlyInline}}
  - : Cung cấp cơ chế để workers truy cập bất đồng bộ các khả năng của indexed databases; trả về một đối tượng {{domxref("IDBFactory")}}.
- {{domxref("WorkerGlobalScope.isSecureContext")}} {{ReadOnlyInline}}
  - : Trả về một boolean cho biết ngữ cảnh hiện tại có an toàn (`true`) hay không (`false`).
- {{domxref("WorkerGlobalScope.location")}} {{ReadOnlyInline}}
  - : Trả về {{domxref("WorkerLocation")}} liên kết với worker. Đây là một đối tượng location cụ thể, chủ yếu là tập con của {{domxref("Location")}} cho browsing scopes, nhưng được điều chỉnh cho workers.
- {{domxref("WorkerGlobalScope.navigator")}} {{ReadOnlyInline}}
  - : Trả về {{domxref("WorkerNavigator")}} liên kết với worker. Đây là một đối tượng navigator cụ thể, chủ yếu là tập con của {{domxref("Navigator")}} cho browsing scopes, nhưng được điều chỉnh cho workers.
- {{domxref("WorkerGlobalScope.origin")}} {{ReadOnlyInline}}
  - : Trả về origin của đối tượng global, được tuần tự hóa dưới dạng chuỗi.
- {{domxref("WorkerGlobalScope.performance")}} {{ReadOnlyInline}}
  - : Trả về {{domxref("Performance")}} liên kết với worker. Chỉ một tập con các thuộc tính và phương thức của giao diện `Performance` khả dụng cho workers.
- {{domxref("WorkerGlobalScope.scheduler")}} {{ReadOnlyInline}}
  - : Trả về đối tượng {{domxref("Scheduler")}} liên kết với ngữ cảnh hiện tại. Đây là điểm truy cập để sử dụng [Prioritized Task Scheduling API](/en-US/docs/Web/API/Prioritized_Task_Scheduling_API).
- {{domxref("WorkerGlobalScope.trustedTypes")}} {{ReadOnlyInline}}
  - : Trả về đối tượng {{domxref("TrustedTypePolicyFactory")}} liên kết với đối tượng global, cung cấp điểm truy cập để sử dụng {{domxref("Trusted Types API", "", "", "nocode")}}.
- {{domxref("WorkerGlobalScope.self")}} {{ReadOnlyInline}}
  - : Trả về một tham chiếu đến chính `WorkerGlobalScope`. Phần lớn thời gian đây là một phạm vi cụ thể như {{domxref("DedicatedWorkerGlobalScope")}}, {{domxref("SharedWorkerGlobalScope")}} hoặc {{domxref("ServiceWorkerGlobalScope")}}.

## Phương thức instance

_Giao diện này kế thừa các phương thức từ giao diện {{domxref("EventTarget")}}._

- {{domxref("WorkerGlobalScope.atob()")}}
  - : Giải mã một chuỗi dữ liệu đã được mã hóa bằng mã hóa base-64.
- {{domxref("WorkerGlobalScope.btoa()")}}
  - : Tạo một chuỗi {{Glossary("ASCII")}} được mã hóa base-64 từ một chuỗi dữ liệu nhị phân.
- {{domxref("WorkerGlobalScope.clearInterval()")}}
  - : Hủy việc thực thi lặp lại được thiết lập bằng {{domxref("WorkerGlobalScope.setInterval()")}}.
- {{domxref("WorkerGlobalScope.clearTimeout()")}}
  - : Hủy việc thực thi trì hoãn được thiết lập bằng {{domxref("WorkerGlobalScope.setTimeout()")}}.
- {{domxref("WorkerGlobalScope.createImageBitmap()")}}
  - : Chấp nhận nhiều nguồn hình ảnh khác nhau, và trả về một {{jsxref("Promise")}} phân giải thành một {{domxref("ImageBitmap")}}. Tùy chọn, nguồn được cắt thành hình chữ nhật pixel bắt đầu từ _(sx, sy)_ với chiều rộng sw và chiều cao sh.
- {{domxref("WorkerGlobalScope.dump()")}} {{deprecated_inline}} {{non-standard_inline}}
  - : Cho phép bạn ghi một thông điệp ra stdout — tức là, trong terminal của bạn. Đây tương tự như {{domxref("window.dump")}} của Firefox, nhưng dành cho workers.
- {{domxref("WorkerGlobalScope.fetch()")}}
  - : Bắt đầu quá trình tải một tài nguyên từ mạng.
- {{domxref("WorkerGlobalScope.importScripts()")}}
  - : Import một hoặc nhiều script vào phạm vi của worker. Bạn có thể chỉ định bao nhiêu tùy ý, phân cách bằng dấu phẩy. Ví dụ: `importScripts('foo.js', 'bar.js');`.
- {{domxref("WorkerGlobalScope.queueMicrotask()")}}
  - : Đưa một microtask vào hàng đợi để thực thi tại thời điểm an toàn trước khi quyền kiểm soát quay lại vòng lặp sự kiện của trình duyệt.
- {{domxref("WorkerGlobalScope.setInterval()")}}
  - : Lên lịch một hàm thực thi mỗi khi một khoảng thời gian mili giây nhất định trôi qua.
- {{domxref("WorkerGlobalScope.setTimeout()")}}
  - : Lên lịch một hàm thực thi sau một khoảng thời gian nhất định.
- {{domxref("WorkerGlobalScope.structuredClone()")}}
  - : Tạo một [bản sao sâu](/en-US/docs/Glossary/Deep_copy) của một giá trị nhất định bằng cách sử dụng [thuật toán structured clone](/en-US/docs/Web/API/Web_Workers_API/Structured_clone_algorithm).
- {{domxref("WorkerGlobalScope.reportError()")}}
  - : Báo cáo một lỗi trong script, mô phỏng một ngoại lệ không được xử lý.

## Events

- {{domxref("WorkerGlobalScope/error_event", "error")}}
  - : Được kích hoạt khi có lỗi xảy ra.
- {{domxref("WorkerGlobalScope/languagechange_event", "languagechange")}}
  - : Được kích hoạt tại phạm vi global/worker khi ngôn ngữ ưa thích của người dùng thay đổi.
- {{domxref("WorkerGlobalScope/offline_event", "offline")}}
  - : Được kích hoạt khi trình duyệt mất kết nối mạng và giá trị của `navigator.onLine` chuyển thành `false`.
- {{domxref("WorkerGlobalScope/online_event", "online")}}
  - : Được kích hoạt khi trình duyệt có kết nối mạng và giá trị của `navigator.onLine` chuyển thành `true`.
- {{domxref("WorkerGlobalScope/rejectionhandled_event", "rejectionhandled")}}
  - : Được kích hoạt trên các event {{jsxref("Promise")}} rejection đã được xử lý.
- {{domxref("WorkerGlobalScope/securitypolicyviolation_event", "securitypolicyviolation")}}
  - : Được kích hoạt khi [Content Security Policy](/en-US/docs/Web/HTTP/Guides/CSP) bị vi phạm.
- {{domxref("WorkerGlobalScope/unhandledrejection_event", "unhandledrejection")}}
  - : Được kích hoạt trên các event {{jsxref("Promise")}} rejection không được xử lý.

## Ví dụ

Bạn sẽ không truy cập `WorkerGlobalScope` trực tiếp trong mã của mình; tuy nhiên, các thuộc tính và phương thức của nó được kế thừa bởi các phạm vi global cụ thể hơn như {{domxref("DedicatedWorkerGlobalScope")}} và {{domxref("SharedWorkerGlobalScope")}}. Ví dụ, bạn có thể import một script khác vào worker và in ra nội dung của đối tượng `navigator` của phạm vi worker bằng hai dòng sau:

```js
importScripts("foo.js");
console.log(navigator);
```

> [!NOTE]
> Vì phạm vi global của worker script thực chất là phạm vi global của worker bạn đang chạy ({{domxref("DedicatedWorkerGlobalScope")}} hoặc bất cứ gì) và tất cả các phạm vi global worker đều kế thừa các phương thức, thuộc tính, v.v. từ `WorkerGlobalScope`, bạn có thể chạy các dòng như trên mà không cần chỉ định một đối tượng cha.

## Đặc tả kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

## Xem thêm

- Giao diện đối tượng global khác: {{domxref("Window")}}, {{domxref("DedicatedWorkerGlobalScope")}}, {{domxref("SharedWorkerGlobalScope")}}, {{domxref("ServiceWorkerGlobalScope")}}
- Các giao diện liên quan đến Worker khác: {{domxref("Worker")}}, {{domxref("WorkerLocation")}} và {{domxref("WorkerNavigator")}}
- [Sử dụng web workers](/en-US/docs/Web/API/Web_Workers_API/Using_web_workers)
