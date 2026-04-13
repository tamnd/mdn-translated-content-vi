---
title: "DedicatedWorkerGlobalScope: postMessage() method"
short-title: postMessage()
slug: Web/API/DedicatedWorkerGlobalScope/postMessage
page-type: web-api-instance-method
browser-compat: api.DedicatedWorkerGlobalScope.postMessage
---

{{APIRef("Web Workers API")}}{{AvailableInWorkers("dedicated")}}

Phương thức **`postMessage()`** của giao diện {{domxref("DedicatedWorkerGlobalScope")}} gửi một thông điệp đến luồng chính đã khởi tạo worker.

Phương thức này nhận một tham số dữ liệu, chứa dữ liệu được sao chép từ worker sang luồng chính.
Dữ liệu có thể là bất kỳ giá trị hoặc đối tượng JavaScript nào được thuật toán [structured clone](/en-US/docs/Web/API/Web_Workers_API/Structured_clone_algorithm) xử lý, bao gồm cả các tham chiếu vòng.

Phương thức này cũng nhận một mảng tùy chọn gồm các [đối tượng có thể chuyển](/en-US/docs/Web/API/Web_Workers_API/Transferable_objects) để _transfer_ sang luồng chính;
khác với tham số dữ liệu, các đối tượng đã chuyển không còn có thể dùng trong luồng worker nữa.
(Khi có thể, các đối tượng được chuyển bằng một thao tác zero-copy hiệu năng cao.)

Phạm vi chính đã khởi tạo worker có thể gửi lại thông tin cho luồng đã khởi tạo nó bằng phương thức {{domxref("Worker.postMessage")}}.

## Cú pháp

```js-nolint
postMessage(message)
postMessage(message, transfer)
postMessage(message, options)
```

### Tham số

- `message`
  - : Đối tượng cần gửi đến luồng chính; đối tượng này sẽ nằm trong trường dữ liệu của sự kiện được gửi đến sự kiện {{domxref("Window/message_event", "message")}}.
    Đây có thể là bất kỳ giá trị hoặc đối tượng JavaScript nào được thuật toán [structured clone](/en-US/docs/Web/API/Web_Workers_API/Structured_clone_algorithm) xử lý, bao gồm cả các tham chiếu vòng.

- `transfer` {{optional_inline}}
  - : Một [mảng](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Array) tùy chọn gồm các [đối tượng có thể chuyển](/en-US/docs/Web/API/Web_Workers_API/Transferable_objects) để chuyển quyền sở hữu. Quyền sở hữu của các đối tượng này được trao cho phía đích và chúng không còn có thể dùng ở phía gửi. Các đối tượng có thể chuyển này nên được gắn với thông điệp; nếu không, chúng sẽ được di chuyển nhưng không thực sự truy cập được ở phía nhận.
- `options` {{optional_inline}}
  - : Một đối tượng tùy chọn chứa các thuộc tính sau:
    - `transfer` {{optional_inline}}
      - : Có ý nghĩa giống với tham số `transfer`.

### Giá trị trả về

Không có ({{jsxref("undefined")}}).

## Ví dụ

Đoạn mã sau cho thấy `worker.js`, trong đó một bộ xử lý `onmessage` được dùng để xử lý thông điệp từ script chính.
Bên trong bộ xử lý, một phép tính được thực hiện để tạo ra một thông điệp kết quả; sau đó thông điệp này được gửi lại luồng chính bằng `postMessage(workerResult);`

```js
onmessage = (e) => {
  console.log("Message received from main script");
  const workerResult = `Result: ${e.data[0] * e.data[1]}`;
  console.log("Posting message back to main script");
  postMessage(workerResult);
};
```

Trong script chính, `onmessage` phải được gọi trên một `Worker object`, trong khi bên trong worker script bạn chỉ cần `onmessage` vì worker về bản chất chính là phạm vi global ({{domxref("DedicatedWorkerGlobalScope")}}).

Để xem ví dụ đầy đủ, hãy xem [Ví dụ worker dedicated cơ bản](https://github.com/mdn/dom-examples/tree/main/web-workers/simple-web-worker) ([chạy worker dedicated](https://mdn.github.io/dom-examples/web-workers/simple-web-worker/)).

> [!NOTE]
> `postMessage()` chỉ có thể gửi một đối tượng tại một thời điểm. Như đã thấy ở trên, nếu bạn muốn truyền nhiều giá trị thì có thể gửi một mảng.

## Đặc tả kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

Giao diện {{domxref("DedicatedWorkerGlobalScope")}} mà nó thuộc về.
