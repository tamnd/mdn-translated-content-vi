---
title: DedicatedWorkerGlobalScope
slug: Web/API/DedicatedWorkerGlobalScope
page-type: web-api-interface
browser-compat: api.DedicatedWorkerGlobalScope
---

{{APIRef("Web Workers API")}}{{AvailableInWorkers("dedicated")}}

Đối tượng **`DedicatedWorkerGlobalScope`** (phạm vi global của {{domxref("Worker")}}) có thể truy cập thông qua từ khóa {{domxref("WorkerGlobalScope.self","self")}}. Một số hàm global bổ sung, các đối tượng namespace và hàm tạo, vốn không thường gắn với phạm vi global của worker nhưng vẫn khả dụng ở đây, được liệt kê trong [JavaScript Reference](/en-US/docs/Web/JavaScript/Reference). Xem thêm: [Các hàm khả dụng cho worker](/en-US/docs/Web/API/Web_Workers_API/Functions_and_classes_available_to_workers).

{{InheritanceDiagram}}

## Thuộc tính thực thể

_Giao diện này kế thừa các thuộc tính từ giao diện {{domxref("WorkerGlobalScope")}} và giao diện cha {{domxref("EventTarget")}} của nó._

- {{domxref("DedicatedWorkerGlobalScope.name")}} {{ReadOnlyInline}}
  - : Tên mà {{domxref("Worker")}} được (tùy chọn) gán khi được tạo bằng hàm tạo {{domxref("Worker.Worker", "Worker()")}}. Thuộc tính này chủ yếu hữu ích cho mục đích gỡ lỗi.

## Phương thức thực thể

_Giao diện này kế thừa các phương thức từ giao diện {{domxref("WorkerGlobalScope")}} và giao diện cha {{domxref("EventTarget")}} của nó._

- {{domxref("DedicatedWorkerGlobalScope.close()")}}
  - : Loại bỏ mọi tác vụ đang xếp hàng trong vòng lặp sự kiện của `WorkerGlobalScope`, qua đó đóng phạm vi cụ thể này.
- {{domxref("DedicatedWorkerGlobalScope.postMessage()")}}
  - : Gửi một thông điệp, có thể là bất kỳ đối tượng JavaScript `any` nào, đến tài liệu cha đã khởi tạo worker này.
- {{domxref("DedicatedWorkerGlobalScope.cancelAnimationFrame()")}}
  - : Hủy một yêu cầu khung hình ảnh động đã được lên lịch trước đó bằng lời gọi {{domxref("DedicatedWorkerGlobalScope.requestAnimationFrame()", "requestAnimationFrame()")}}.
- {{domxref("DedicatedWorkerGlobalScope.requestAnimationFrame()")}}
  - : Thực hiện một yêu cầu khung hình ảnh động và gọi một hàm callback do người dùng cung cấp trước lần repaint tiếp theo.

## Sự kiện

Lắng nghe sự kiện này bằng {{domxref("EventTarget/addEventListener()", "addEventListener()")}} hoặc bằng cách gán trình xử lý sự kiện cho thuộc tính `oneventname` của giao diện này.

- {{domxref("DedicatedWorkerGlobalScope/message_event", "message")}}
  - : Được kích hoạt khi worker nhận được một thông điệp từ cha của nó.
- {{domxref("DedicatedWorkerGlobalScope/messageerror_event", "messageerror")}}
  - : Được kích hoạt khi worker nhận được một thông điệp không thể giải tuần tự hóa.
- {{domxref("DedicatedWorkerGlobalScope/rtctransform_event", "rtctransform")}}
  - : Được kích hoạt khi một khung video hoặc âm thanh đã mã hóa được đưa vào hàng đợi để xử lý bởi {{domxref("WebRTC API/Using Encoded Transforms", "WebRTC Encoded Transform", "", "nocode")}}.

## Đặc tả kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("Worker")}}
- {{domxref("WorkerGlobalScope")}}
- [Using web workers](/en-US/docs/Web/API/Web_Workers_API/Using_web_workers)
- [Functions available to workers](/en-US/docs/Web/API/Web_Workers_API/Functions_and_classes_available_to_workers)
