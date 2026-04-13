---
title: Web Workers API
slug: Web/API/Web_Workers_API
page-type: web-api-overview
spec-urls: https://html.spec.whatwg.org/multipage/workers.html#workers
---

{{DefaultAPISidebar("Web Workers API")}}

**Web Workers** giúp có thể chạy một hoạt động script trong một thread nền riêng biệt với thread thực thi chính của một ứng dụng web. Ưu điểm của điều này là quá trình xử lý tốn sức có thể được thực hiện trong một thread riêng biệt, cho phép thread chính (thường là UI) chạy mà không bị chặn/làm chậm.

## Khái niệm và cách sử dụng

Một worker là một đối tượng được tạo bằng cách sử dụng một constructor (ví dụ: {{DOMxRef("Worker.Worker", "Worker()")}}) chạy một tệp JavaScript được đặt tên — tệp này chứa mã sẽ chạy trong thread của worker.

Ngoài tập hợp các hàm [JavaScript](/en-US/docs/Web/JavaScript) tiêu chuẩn (chẳng hạn như {{jsxref("String")}}, {{jsxref("Array")}}, {{jsxref("Object")}}, {{jsxref("JSON")}}, v.v.), bạn có thể chạy hầu hết mọi mã bạn thích bên trong thread của worker. Có một số ngoại lệ: ví dụ, bạn không thể trực tiếp thao tác DOM từ bên trong một worker, hoặc sử dụng một số phương thức và thuộc tính mặc định của đối tượng {{domxref("Window")}}. Để biết thông tin về mã bạn _có thể_ chạy, xem [các hàm được hỗ trợ](/en-US/docs/Web/API/Web_Workers_API/Functions_and_classes_available_to_workers#functions_available_in_workers), và [các Web API được hỗ trợ](/en-US/docs/Web/API/Web_Workers_API/Functions_and_classes_available_to_workers#web_apis_available_in_workers).

Dữ liệu được gửi giữa workers và thread chính thông qua một hệ thống thông điệp — cả hai bên gửi thông điệp của họ bằng phương thức `postMessage()`, và phản hồi các thông điệp thông qua event handler `onmessage` (thông điệp được chứa trong thuộc tính `data` của event {{domxref("Worker/message_event", "message")}}). Dữ liệu được sao chép thay vì chia sẻ.

Workers có thể sinh ra các workers mới, miễn là những workers đó được lưu trữ trong cùng {{glossary("origin")}} với trang cha.

Ngoài ra, workers có thể tạo các request mạng bằng cách sử dụng các API {{domxref("WorkerGlobalScope/fetch", "fetch()")}} hoặc {{domxref("XMLHttpRequest")}} (mặc dù lưu ý rằng thuộc tính {{domxref("XMLHttpRequest.responseXML", "responseXML")}} của `XMLHttpRequest` sẽ luôn là `null`).

### Các loại worker

Có một số loại worker khác nhau:

- {{domxref("Worker", "Dedicated workers", "", "nocode")}} là các worker được sử dụng bởi một script duy nhất. Ngữ cảnh này được đại diện bởi một đối tượng {{DOMxRef("DedicatedWorkerGlobalScope")}}.
- {{domxref("SharedWorker", "Shared workers", "", "nocode")}} là các worker có thể được sử dụng bởi nhiều script đang chạy trong các window, IFrame, v.v. khác nhau, miễn là chúng nằm trong cùng domain với worker. Chúng phức tạp hơn một chút so với dedicated workers — các script phải giao tiếp thông qua một cổng hoạt động.
- {{domxref("Service Worker API", "Service Workers", "", "nocode")}} hoạt động như các proxy servers nằm giữa các ứng dụng web, trình duyệt và mạng (khi khả dụng). Chúng được dự định, trong số những thứ khác, để cho phép tạo ra các trải nghiệm offline hiệu quả, chặn các request mạng và thực hiện hành động thích hợp dựa trên việc mạng có khả dụng hay không, và cập nhật các tài nguyên lưu trữ trên server. Chúng cũng sẽ cho phép truy cập vào các API push notifications và background sync.

### Ngữ cảnh worker

Mặc dù {{domxref("Window")}} không khả dụng trực tiếp cho workers, nhiều phương thức tương tự được định nghĩa trong một mixin chung (`WindowOrWorkerGlobalScope`), và khả dụng cho workers thông qua các ngữ cảnh {{domxref("WorkerGlobalScope")}}-derived của riêng chúng:

- {{domxref("DedicatedWorkerGlobalScope")}} cho dedicated workers
- {{domxref("SharedWorkerGlobalScope")}} cho shared workers
- {{domxref("ServiceWorkerGlobalScope")}} cho [service workers](/en-US/docs/Web/API/Service_Worker_API)

## Giao diện

- {{DOMxRef("Worker")}}
  - : Đại diện cho một thread worker đang chạy, cho phép bạn truyền thông điệp tới mã worker đang chạy.
- {{DOMxRef("WorkerLocation")}}
  - : Định nghĩa vị trí tuyệt đối của script được thực thi bởi {{domxref("Worker")}}.
- {{DOMxRef("SharedWorker")}}
  - : Đại diện cho một loại worker cụ thể có thể được truy cập từ nhiều {{glossary("browsing context", "browsing contexts")}} (tức là windows, tabs, hoặc iframes) hoặc thậm chí các workers khác.
- {{DOMxRef("WorkerGlobalScope")}}
  - : Đại diện cho phạm vi chung của bất kỳ worker nào (làm công việc tương tự như {{DOMxRef("Window")}} đối với nội dung web thông thường). Các loại worker khác nhau có các đối tượng phạm vi kế thừa từ giao diện này và thêm các tính năng cụ thể hơn.
- {{DOMxRef("DedicatedWorkerGlobalScope")}}
  - : Đại diện cho phạm vi của một dedicated worker, kế thừa từ {{DOMxRef("WorkerGlobalScope")}} và thêm một số tính năng dedicated.
- {{DOMxRef("SharedWorkerGlobalScope")}}
  - : Đại diện cho phạm vi của một shared worker, kế thừa từ {{DOMxRef("WorkerGlobalScope")}} và thêm một số tính năng dedicated.
- {{DOMxRef("WorkerNavigator")}}
  - : Đại diện cho danh tính và trạng thái của user agent (client).

## Ví dụ

Chúng tôi đã tạo một vài demos để hiển thị cách sử dụng web worker:

- [Ví dụ dedicated worker cơ bản](https://github.com/mdn/dom-examples/tree/main/web-workers/simple-web-worker) ([chạy dedicated worker](https://mdn.github.io/dom-examples/web-workers/simple-web-worker/)).
- [Ví dụ shared worker cơ bản](https://github.com/mdn/dom-examples/tree/main/web-workers/simple-shared-worker) ([chạy shared worker](https://mdn.github.io/dom-examples/web-workers/simple-shared-worker/)).
- [Ví dụ OffscreenCanvas worker](https://github.com/mdn/dom-examples/tree/main/web-workers/offscreen-canvas-worker) ([chạy OffscreenCanvas worker](https://mdn.github.io/dom-examples/web-workers/offscreen-canvas-worker/)).

Bạn có thể tìm thêm thông tin về cách các demos này hoạt động trong [Sử dụng Web Workers](/en-US/docs/Web/API/Web_Workers_API/Using_web_workers).

## Đặc tả kỹ thuật

{{Specifications}}

## Xem thêm

- [Sử dụng Web Workers](/en-US/docs/Web/API/Web_Workers_API/Using_web_workers)
- Giao diện {{domxref("Worker")}}
- Giao diện {{domxref("SharedWorker")}}
- {{domxref("Service Worker API", "", "", "nocode")}}
