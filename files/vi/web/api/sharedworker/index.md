---
title: SharedWorker
slug: Web/API/SharedWorker
page-type: web-api-interface
browser-compat: api.SharedWorker
---

{{APIRef("Web Workers API")}}

Giao diện **`SharedWorker`** đại diện cho một loại worker cụ thể có thể được _truy cập_ từ nhiều ngữ cảnh duyệt web, chẳng hạn như nhiều cửa sổ hoặc iframe. Shared worker triển khai giao diện khác với dedicated worker, có phạm vi toàn cục khác ({{domxref("SharedWorkerGlobalScope")}}), và constructor của chúng không được hiển thị trong {{domxref("DedicatedWorkerGlobalScope")}}, nên chúng không thể được khởi tạo từ dedicated worker.

> [!NOTE]
> Nếu SharedWorker có thể được truy cập từ nhiều ngữ cảnh duyệt web, tất cả các ngữ cảnh duyệt web đó phải chia sẻ chính xác cùng một nguồn gốc (cùng giao thức, máy chủ và cổng).

{{InheritanceDiagram}}

## Constructors

- {{domxref("SharedWorker.SharedWorker", "SharedWorker()")}}
  - : Tạo một shared web worker thực thi tập lệnh tại URL đã chỉ định.

## Thuộc tính instance

_Kế thừa các thuộc tính từ cha của nó, {{domxref("EventTarget")}}._

- {{domxref("SharedWorker.port")}} {{ReadOnlyInline}}
  - : Trả về một đối tượng {{domxref("MessagePort")}} được sử dụng để giao tiếp và điều khiển shared worker.

## Sự kiện

- {{domxref("SharedWorker.error_event", "error")}}
  - : Xảy ra khi có lỗi trong shared worker.

## Phương thức instance

_Kế thừa các phương thức từ cha của nó, {{domxref("EventTarget")}}._

## Ví dụ

Trong [ví dụ về shared worker cơ bản của chúng tôi](https://github.com/mdn/dom-examples/tree/main/web-workers/simple-shared-worker) ([chạy shared worker](https://mdn.github.io/dom-examples/web-workers/simple-shared-worker/)), chúng tôi có hai trang HTML, mỗi trang sử dụng một số JavaScript để thực hiện một phép tính đơn giản. Các tập lệnh khác nhau đang sử dụng cùng một worker file để thực hiện phép tính — cả hai đều có thể truy cập nó, ngay cả khi các trang của chúng đang chạy trong các cửa sổ khác nhau.

Đoạn mã sau đây cho thấy việc tạo một đối tượng `SharedWorker` bằng constructor {{domxref("SharedWorker.SharedWorker", "SharedWorker()")}}. Cả hai tập lệnh đều chứa mã này:

```js
const myWorker = new SharedWorker("worker.js");
```

> [!NOTE]
> Khi một shared worker được tạo, bất kỳ tập lệnh nào chạy trong cùng nguồn gốc đều có thể lấy tham chiếu đến worker đó và giao tiếp với nó. Shared worker sẽ vẫn tồn tại miễn là tập hợp chủ sở hữu của phạm vi toàn cục của nó (một tập hợp các đối tượng `Document` và `WorkerGlobalScope`) không rỗng (ví dụ: nếu có bất kỳ trang live nào đang giữ tham chiếu đến nó, có thể thông qua `new SharedWorker()`). Để đọc thêm về thời gian tồn tại của shared worker, xem phần [The worker's lifetime](https://html.spec.whatwg.org/multipage/workers.html#the-worker's-lifetime) của đặc tả HTML.

Cả hai tập lệnh sau đó đều truy cập worker thông qua một đối tượng {{domxref("MessagePort")}} được tạo bằng thuộc tính {{domxref("SharedWorker.port")}}. Nếu sự kiện onmessage được đính kèm bằng addEventListener, cổng được khởi tạo thủ công bằng phương thức `start()` của nó:

```js
myWorker.port.start();
```

Khi cổng đã được khởi tạo, cả hai tập lệnh đều gửi thông điệp đến worker và xử lý các thông điệp được gửi từ nó bằng cách sử dụng `port.postMessage()` và `port.onmessage`, tương ứng:

> [!NOTE]
> Bạn có thể sử dụng devtools của trình duyệt để gỡ lỗi SharedWorker của mình, bằng cách nhập một URL vào thanh địa chỉ trình duyệt để truy cập devtools workers inspector; ví dụ: trong Chrome, URL là `chrome://inspect/#workers`, và trong Firefox, URL là `about:debugging#workers`.

```js
[first, second].forEach((input) => {
  input.onchange = () => {
    myWorker.port.postMessage([first.value, second.value]);
    console.log("Message posted to worker");
  };
});

myWorker.port.onmessage = (e) => {
  result1.textContent = e.data;
  console.log("Message received from worker");
};
```

Bên trong worker, chúng tôi sử dụng trình xử lý {{domxref("SharedWorkerGlobalScope.connect_event", "onconnect")}} để kết nối với cùng một cổng đã đề cập ở trên. Các cổng được liên kết với worker đó có thể truy cập được trong thuộc tính `ports` của {{domxref("SharedWorkerGlobalScope/connect_event", "connect")}} event — sau đó chúng tôi sử dụng phương thức `start()` của {{domxref("MessagePort")}} để khởi tạo cổng và trình xử lý `onmessage` để xử lý các thông điệp được gửi từ các luồng chính.

```js
onconnect = (e) => {
  const port = e.ports[0];

  port.addEventListener("message", (e) => {
    const workerResult = `Result: ${e.data[0] * e.data[1]}`;
    port.postMessage(workerResult);
  });

  port.start(); // Required when using addEventListener. Otherwise called implicitly by onmessage setter.
};
```

## Specifications

{{Specifications}}

## Browser compatibility

{{Compat}}

## Xem thêm

- {{domxref("Worker")}}
