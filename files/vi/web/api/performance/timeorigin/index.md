---
title: "Performance: timeOrigin property"
short-title: timeOrigin
slug: Web/API/Performance/timeOrigin
page-type: web-api-instance-property
browser-compat: api.Performance.timeOrigin
---

{{APIRef("Performance API")}}{{AvailableInWorkers}}

Thuộc tính chỉ đọc **`timeOrigin`** của giao diện {{domxref("Performance")}} trả về dấu thời gian độ phân giải cao được dùng làm mốc nền cho các dấu thời gian liên quan đến hiệu năng.

Trong ngữ cảnh Window, giá trị này biểu thị thời điểm điều hướng bắt đầu. Trong ngữ cảnh {{domxref("Worker")}} và {{domxref("ServiceWorker")}}, giá trị này biểu thị thời điểm worker được chạy. Bạn có thể dùng thuộc tính này để đồng bộ mốc thời gian giữa các ngữ cảnh (xem ví dụ bên dưới).

> [!NOTE]
> Giá trị của `performance.timeOrigin` có thể khác với giá trị do {{jsxref("Date.now()")}} trả về khi được thực thi tại thời điểm gốc, vì `Date.now()` có thể bị ảnh hưởng bởi điều chỉnh đồng hồ của hệ thống hoặc người dùng, lệch đồng hồ, v.v. Thuộc tính `timeOrigin` là một [đồng hồ đơn điệu](https://w3c.github.io/hr-time/#dfn-monotonic-clock) mà thời gian hiện tại không bao giờ giảm và không bị các điều chỉnh này tác động.

## Giá trị

Một dấu thời gian độ phân giải cao được xem là thời điểm bắt đầu vòng đời của tài liệu hiện tại. Nó được tính như sau:

- Nếu {{Glossary("global object")}} của script là một {{domxref("Window")}}, time origin được xác định như sau:
  - Nếu {{domxref("Document")}} hiện tại là tài liệu đầu tiên được tải trong `Window`, time origin là thời điểm ngữ cảnh duyệt được tạo.
  - Nếu trong quá trình dỡ tài liệu trước đó đã được tải trong cửa sổ, có một hộp thoại xác nhận được hiển thị để người dùng xác nhận có muốn rời khỏi trang trước đó hay không, time origin là thời điểm người dùng xác nhận rằng việc điều hướng tới trang mới là chấp nhận được.
  - Nếu không trường hợp nào ở trên xác định được time origin, thì time origin là thời điểm điều hướng tạo ra tài liệu hiện tại của cửa sổ diễn ra.

- Nếu {{Glossary("global object")}} của script là một {{domxref("WorkerGlobalScope")}} (tức script đang chạy như một web worker), time origin là thời điểm worker được tạo.
- Trong mọi trường hợp khác, time origin là không xác định.

## Ví dụ

### Đồng bộ thời gian giữa các ngữ cảnh

Để tính đến sự khác nhau giữa time origin trong ngữ cảnh window và worker, bạn có thể chuyển các dấu thời gian đến từ script worker bằng thuộc tính `timeOrigin`, để thời gian được đồng bộ cho toàn bộ ứng dụng.

Trong worker.js

```js
self.addEventListener("connect", (event) => {
  const port = event.ports[0];

  port.onmessage = (event) => {
    const workerTaskStart = performance.now();
    // doSomeWork()
    const workerTaskEnd = performance.now();
  };

  // Chuyển dấu thời gian tương đối với worker thành dấu thời gian tuyệt đối, rồi gửi đến window
  port.postMessage({
    startTime: workerTaskStart + performance.timeOrigin,
    endTime: workerTaskEnd + performance.timeOrigin,
  });
});
```

Trong main.js

```js
const worker = new SharedWorker("worker.js");
worker.port.addEventListener("message", (event) => {
  // Chuyển dấu thời gian tuyệt đối thành dấu thời gian tương đối với window
  const workerTaskStart = event.data.startTime - performance.timeOrigin;
  const workerTaskEnd = event.data.endTime - performance.timeOrigin;

  console.log("Worker task start: ", workerTaskStart);
  console.log("Worker task end: ", workerTaskEnd);
});
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
