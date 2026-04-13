---
title: "Worker: phương thức postMessage()"
short-title: postMessage()
slug: Web/API/Worker/postMessage
page-type: web-api-instance-method
browser-compat: api.Worker.postMessage
---

{{APIRef("Web Workers API")}}{{AvailableInWorkers("window_and_worker_except_service")}}

Phương thức **`postMessage()`** của giao diện {{domxref("Worker")}} gửi một thông điệp tới worker. Tham số đầu tiên là dữ liệu cần gửi tới worker. Dữ liệu có thể là bất kỳ đối tượng JavaScript nào có thể được xử lý bởi [thuật toán structured clone](/en-US/docs/Web/API/Web_Workers_API/Structured_clone_algorithm).

Phương thức `postMessage()` của {{domxref("Worker")}} ủy quyền cho phương thức {{domxref("MessagePort.postMessage", "postMessage()")}} của {{domxref("MessagePort")}}, thêm một tác vụ vào vòng lặp sự kiện tương ứng với {{domxref("MessagePort")}} nhận.

`Worker` có thể gửi lại thông tin tới thread đã sinh ra nó bằng cách sử dụng phương thức {{domxref("DedicatedWorkerGlobalScope.postMessage")}}.

## Cú pháp

```js-nolint
postMessage(message)
postMessage(message, transfer)
postMessage(message, options)
```

### Tham số

- `message`
  - : Đối tượng cần gửi tới worker; dữ liệu này sẽ nằm trong trường `data` của event được gửi tới event {{domxref("DedicatedWorkerGlobalScope.message_event", "message")}}. Đây có thể là bất kỳ giá trị hoặc đối tượng JavaScript nào được xử lý bởi thuật toán [structured clone](/en-US/docs/Web/API/Web_Workers_API/Structured_clone_algorithm), bao gồm các tham chiếu tuần hoàn.

    Tham số `message` là bắt buộc. Nếu dữ liệu cần truyền tới worker không quan trọng, `null` hoặc `undefined` phải được truyền một cách rõ ràng.

- `transfer` {{optional_inline}}
  - : Một [mảng](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Array) tùy chọn các [đối tượng có thể chuyển quyền](/en-US/docs/Web/API/Web_Workers_API/Transferable_objects) để chuyển quyền sở hữu. Quyền sở hữu của các đối tượng này được chuyển sang phía nhận và chúng không còn khả dụng ở phía gửi. Các đối tượng có thể chuyển quyền này nên được gắn vào thông điệp; nếu không chúng sẽ được di chuyển nhưng thực sự không thể truy cập ở đầu nhận.
- `options` {{optional_inline}}
  - : Một đối tượng tùy chọn chứa các thuộc tính sau:
    - `transfer` {{optional_inline}}
      - : Có cùng ý nghĩa với tham số `transfer`.

### Giá trị trả về

Không có ({{jsxref("undefined")}}).

## Ví dụ

Đoạn mã sau hiển thị việc tạo một đối tượng {{domxref("Worker")}} bằng cách sử dụng hàm tạo {{domxref("Worker.Worker", "Worker()")}}. Khi một trong hai input của form (`first` và `second`) có giá trị thay đổi, các event {{domxref("HTMLElement/change_event", "change")}} gọi `postMessage()` để gửi giá trị của cả hai input tới worker hiện tại.

```js
const myWorker = new Worker("worker.js");

[first, second].forEach((input) => {
  input.onchange = () => {
    myWorker.postMessage([first.value, second.value]);
    console.log("Message posted to worker");
  };
});
```

Để biết ví dụ đầy đủ, xem [ví dụ worker đơn giản](https://github.com/mdn/dom-examples/tree/main/web-workers/simple-web-worker) ([chạy ví dụ](https://mdn.github.io/dom-examples/web-workers/simple-web-worker/)).

> [!NOTE]
> `postMessage()` chỉ có thể gửi một đối tượng tại một thời điểm. Như đã thấy ở trên, nếu bạn muốn truyền nhiều giá trị, bạn có thể gửi một mảng.

### Ví dụ Transfer

Ví dụ tối thiểu này có `main` tạo một `ArrayBuffer` và chuyển nó tới `myWorker`, sau đó `myWorker` chuyển nó trở lại `main`, với kích thước được ghi lại ở mỗi bước.

#### Mã main.js

```js
// tạo worker
const myWorker = new Worker("myWorker.js");

// lắng nghe myWorker chuyển buffer trở lại main
myWorker.addEventListener("message", (msg) => {
  console.log("message from worker received in main:", msg);

  const bufTransferredBackFromWorker = msg.data;

  console.log(
    "buf.byteLength in main AFTER transfer back from worker:",
    bufTransferredBackFromWorker.byteLength,
  );
});

// tạo buffer
const myBuf = new ArrayBuffer(8);

console.log(
  "buf.byteLength in main BEFORE transfer to worker:",
  myBuf.byteLength,
);

// gửi myBuf tới myWorker và chuyển ArrayBuffer cơ bản
myWorker.postMessage(myBuf, [myBuf]);

console.log(
  "buf.byteLength in main AFTER transfer to worker:",
  myBuf.byteLength,
);
```

#### Mã myWorker.js

```js
// lắng nghe main chuyển buffer tới myWorker
self.onmessage = (msg) => {
  console.log("message from main received in worker:", msg);

  const bufTransferredFromMain = msg.data;

  console.log(
    "buf.byteLength in worker BEFORE transfer back to main:",
    bufTransferredFromMain.byteLength,
  );

  // gửi buf trở lại main và chuyển ArrayBuffer cơ bản
  self.postMessage(bufTransferredFromMain, [bufTransferredFromMain]);

  console.log(
    "buf.byteLength in worker AFTER transfer back to main:",
    bufTransferredFromMain.byteLength,
  );
};
```

#### Output được ghi lại

```bash
buf.byteLength in main BEFORE transfer to worker:        8                     main.js:19
buf.byteLength in main AFTER transfer to worker:         0                     main.js:27

message from main received in worker:                    MessageEvent { ... }  myWorker.js:3
buf.byteLength in worker BEFORE transfer back to main:   8                     myWorker.js:7
buf.byteLength in worker AFTER transfer back to main:    0                     myWorker.js:15

message from worker received in main:                    MessageEvent { ... }  main.js:6
buf.byteLength in main AFTER transfer back from worker:  8                     main.js:10
```

`byteLength` giảm xuống 0 sau khi `ArrayBuffer` được chuyển. Để biết ví dụ đầy đủ phức tạp hơn về việc transfer `ArrayBuffer`, xem Firefox demo add-on này: [GitHub :: ChromeWorker - demo-transfer-arraybuffer](https://github.com/Noitidart/ChromeWorker/tree/aca57d9cadc4e68af16201bdecbfb6f9a6f9ca6b)

## Đặc tả kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

## Xem thêm

- Giao diện {{domxref("Worker")}} mà nó thuộc về.
