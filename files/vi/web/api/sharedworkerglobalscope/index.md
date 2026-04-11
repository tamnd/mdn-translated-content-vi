---
title: SharedWorkerGlobalScope
slug: Web/API/SharedWorkerGlobalScope
page-type: web-api-interface
browser-compat: api.SharedWorkerGlobalScope
---

{{APIRef("Web Workers API")}}

Đối tượng **`SharedWorkerGlobalScope`** (phạm vi toàn cục của {{domxref("SharedWorker")}}) có thể truy cập thông qua từ khóa {{domxref("window.self","self")}}. Một số hàm toàn cục bổ sung, các đối tượng namespace và hàm tạo, vốn không thường gắn với phạm vi toàn cục của worker nhưng vẫn khả dụng ở đây, được liệt kê trong [JavaScript Reference](/en-US/docs/Web/JavaScript/Reference). Xem danh sách đầy đủ các [hàm khả dụng cho worker](/en-US/docs/Web/API/Web_Workers_API/Functions_and_classes_available_to_workers).

{{InheritanceDiagram}}

## Thuộc tính thực thể

_Giao diện này kế thừa các thuộc tính từ giao diện {{domxref("WorkerGlobalScope")}} và giao diện cha {{domxref("EventTarget")}} của nó._

- {{domxref("SharedWorkerGlobalScope.name")}} {{ReadOnlyInline}}
  - : Tên mà {{domxref("SharedWorker")}} được (tùy chọn) gán khi được tạo bằng hàm tạo {{domxref("SharedWorker.SharedWorker", "SharedWorker()")}}. Thuộc tính này chủ yếu hữu ích cho mục đích gỡ lỗi.

## Phương thức thực thể

_Giao diện này kế thừa các phương thức từ giao diện {{domxref("WorkerGlobalScope")}} và giao diện cha {{domxref("EventTarget")}} của nó._

- {{domxref("SharedWorkerGlobalScope.close()")}}
  - : Loại bỏ mọi tác vụ đang xếp hàng trong vòng lặp sự kiện của `SharedWorkerGlobalScope`, qua đó đóng phạm vi cụ thể này.

## Sự kiện

Lắng nghe sự kiện này bằng {{domxref("EventTarget.addEventListener()", "addEventListener()")}} hoặc bằng cách gán trình xử lý sự kiện cho thuộc tính `oneventname` của giao diện này.

- {{domxref("SharedWorkerGlobalScope/connect_event", "connect")}}
  - : Được kích hoạt trên shared worker khi một client mới kết nối.

## Thông số kỹ thuật

{{Specifications}}

## Khả năng tương thích với trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("SharedWorker")}}
- {{domxref("WorkerGlobalScope")}}
- [Using Web workers](/en-US/docs/Web/API/Web_Workers_API/Using_web_workers)
- [Functions available to workers](/en-US/docs/Web/API/Web_Workers_API/Functions_and_classes_available_to_workers)
