---
title: AbortSignal
slug: Web/API/AbortSignal
page-type: web-api-interface
browser-compat: api.AbortSignal
---

{{APIRef("DOM")}}{{AvailableInWorkers}}

Giao diện **`AbortSignal`** biểu diễn một đối tượng tín hiệu, cho phép bạn giao tiếp với một thao tác bất đồng bộ, chẳng hạn như yêu cầu fetch, và hủy nó khi cần thông qua đối tượng {{domxref("AbortController")}}.

{{InheritanceDiagram}}

## Thuộc tính thể hiện

_Ngoài ra còn kế thừa các thuộc tính từ giao diện cha của nó là {{domxref("EventTarget")}}._

- {{domxref("AbortSignal.aborted")}} {{ReadOnlyInline}}
  - : Một {{Glossary("Boolean")}} cho biết (các) yêu cầu mà tín hiệu đang giao tiếp có bị hủy (`true`) hay không (`false`).
- {{domxref("AbortSignal.reason")}} {{ReadOnlyInline}}
  - : Một giá trị JavaScript cung cấp lý do hủy, sau khi tín hiệu đã bị hủy.

## Phương thức tĩnh

_Ngoài ra còn kế thừa các phương thức từ giao diện cha của nó là {{domxref("EventTarget")}}._

- {{domxref("AbortSignal/abort_static", "AbortSignal.abort()")}}
  - : Trả về một thể hiện `AbortSignal` đã ở trạng thái bị hủy.
- {{domxref("AbortSignal/any_static", "AbortSignal.any()")}}
  - : Trả về một `AbortSignal` sẽ bị hủy khi bất kỳ tín hiệu hủy nào đã cho bị hủy.
- {{domxref("AbortSignal/timeout_static", "AbortSignal.timeout()")}}
  - : Trả về một thể hiện `AbortSignal` sẽ tự động bị hủy sau một khoảng thời gian xác định.

## Phương thức thể hiện

_Ngoài ra còn kế thừa các phương thức từ giao diện cha của nó là {{domxref("EventTarget")}}._

- {{domxref("AbortSignal.throwIfAborted()")}}
  - : Ném ra {{domxref("AbortSignal.reason", "reason")}} hủy của tín hiệu nếu tín hiệu đã bị hủy; nếu không thì không làm gì cả.

## Sự kiện

_Ngoài ra còn kế thừa các sự kiện từ giao diện cha của nó là {{DOMxRef("EventTarget")}}._

Lắng nghe sự kiện này bằng {{domxref("EventTarget.addEventListener", "addEventListener()")}} hoặc bằng cách gán trình xử lý sự kiện cho thuộc tính `oneventname` của giao diện này.

- {{domxref("AbortSignal/abort_event", "abort")}}
  - : Được kích hoạt khi (các) thao tác bất đồng bộ mà tín hiệu đang giao tiếp bị hủy. Cũng có thể truy cập thông qua thuộc tính `onabort`.

## Ví dụ

### Hủy thao tác fetch bằng một tín hiệu tường minh

Đoạn mã sau cho thấy cách chúng ta có thể dùng một tín hiệu để hủy việc tải xuống một video bằng [Fetch API](/en-US/docs/Web/API/Fetch_API).

Trước tiên, chúng ta khai báo một biến cho `AbortController`.

Trước mỗi [yêu cầu fetch](/en-US/docs/Web/API/Window/fetch), chúng ta tạo một controller mới bằng bộ khởi tạo {{domxref("AbortController.AbortController", "AbortController()")}}, rồi lấy tham chiếu đến đối tượng `AbortSignal` liên kết với nó qua thuộc tính {{domxref("AbortController.signal")}}.

> [!NOTE]
> Một `AbortSignal` chỉ có thể được dùng một lần. Sau khi đã bị hủy, mọi lệnh gọi fetch dùng cùng tín hiệu đó sẽ ngay lập tức bị từ chối.

Khi [yêu cầu fetch](/en-US/docs/Web/API/Window/fetch) được khởi tạo, chúng ta truyền `AbortSignal` làm một tùy chọn trong đối tượng tùy chọn của yêu cầu (đối tượng `{ signal }` bên dưới). Việc này liên kết tín hiệu và controller với yêu cầu fetch và cho phép chúng ta hủy nó bằng cách gọi {{domxref("AbortController.abort()")}}, như trong trình xử lý sự kiện thứ hai bên dưới.

Khi `abort()` được gọi, promise `fetch()` sẽ bị từ chối với một `DOMException` có tên là `AbortError`.

```js
let controller;
const url = "video.mp4";

const downloadBtn = document.querySelector(".download");
const abortBtn = document.querySelector(".abort");

downloadBtn.addEventListener("click", fetchVideo);

abortBtn.addEventListener("click", () => {
  if (controller) {
    controller.abort();
    console.log("Download aborted");
  }
});

async function fetchVideo() {
  controller = new AbortController();
  const signal = controller.signal;

  try {
    const response = await fetch(url, { signal });
    console.log("Download complete", response);
    // process response further
  } catch (err) {
    console.error(`Download error: ${err.message}`);
  }
}
```

Nếu yêu cầu bị hủy sau khi lệnh gọi `fetch()` đã hoàn thành nhưng trước khi phần thân phản hồi được đọc, thì việc cố đọc phần thân phản hồi sẽ bị từ chối với ngoại lệ `AbortError`.

```js
async function get() {
  const controller = new AbortController();
  const request = new Request("https://example.org/get", {
    signal: controller.signal,
  });

  const response = await fetch(request);
  controller.abort();
  // The next line will throw `AbortError`
  const text = await response.text();
  console.log(text);
}
```

Bạn có thể xem [một ví dụ hoàn chỉnh trên GitHub](https://github.com/mdn/dom-examples/tree/main/abort-api); đồng thời cũng có thể xem [bản chạy trực tiếp](https://mdn.github.io/dom-examples/abort-api/).

### Hủy thao tác fetch bằng thời gian chờ

Nếu bạn cần hủy thao tác khi hết thời gian chờ, bạn có thể dùng phương thức tĩnh {{domxref("AbortSignal/timeout_static", "AbortSignal.timeout()")}}. Phương thức này trả về một `AbortSignal` sẽ tự động hết thời gian chờ sau một số mili giây nhất định.

Đoạn mã dưới đây cho thấy cách bạn có thể tải xuống tệp thành công hoặc xử lý lỗi hết thời gian chờ sau 5 giây. Lưu ý rằng khi hết thời gian chờ, promise `fetch()` sẽ bị từ chối với `DOMException` `TimeoutError`. Nhờ đó, mã có thể phân biệt giữa hết thời gian chờ, trường hợp có thể cần thông báo cho người dùng, và việc người dùng chủ động hủy.

```js
const url = "video.mp4";

try {
  const res = await fetch(url, { signal: AbortSignal.timeout(5000) });
  const result = await res.blob();
  // …
} catch (err) {
  if (err.name === "TimeoutError") {
    console.error("Timeout: It took more than 5 seconds to get the result!");
  } else if (err.name === "AbortError") {
    console.error(
      "Fetch aborted by user action (browser stop button, closing tab, etc.",
    );
  } else {
    // A network error, or some other problem.
    console.error(`Error: type: ${err.name}, message: ${err.message}`);
  }
}
```

### Hủy fetch bằng thời gian chờ hoặc hủy tường minh

Nếu bạn muốn hủy từ nhiều tín hiệu, bạn có thể dùng {{domxref("AbortSignal/any_static", "AbortSignal.any()")}} để kết hợp chúng thành một tín hiệu duy nhất. Ví dụ sau minh họa điều này với {{domxref("Window/fetch", "fetch")}}:

```js
try {
  const controller = new AbortController();
  const timeoutSignal = AbortSignal.timeout(5000);
  const res = await fetch(url, {
    // This will abort the fetch when either signal is aborted
    signal: AbortSignal.any([controller.signal, timeoutSignal]),
  });
  const body = await res.json();
} catch (e) {
  if (e.name === "AbortError") {
    // Notify the user of abort.
  } else if (e.name === "TimeoutError") {
    // Notify the user of timeout
  } else {
    // A network error, or some other problem.
    console.log(`Type: ${e.name}, Message: ${e.message}`);
  }
}
```

> [!NOTE]
> Không giống như khi dùng {{domxref("AbortSignal/timeout_static", "AbortSignal.timeout()")}}, không có cách nào để biết lần hủy cuối cùng có phải do hết thời gian chờ gây ra hay không.

### Triển khai một API có thể hủy

Một API cần hỗ trợ khả năng hủy có thể chấp nhận một đối tượng `AbortSignal` và dùng trạng thái của nó để kích hoạt xử lý tín hiệu hủy khi cần.

Một API dựa trên {{jsxref("Promise")}} nên phản hồi với tín hiệu hủy bằng cách từ chối mọi promise chưa hoàn tất bằng {{domxref("AbortSignal.reason", "reason")}} hủy của `AbortSignal`. Ví dụ, hãy xem `myCoolPromiseAPI` sau đây, nhận vào một tín hiệu và trả về một promise. Promise này bị từ chối ngay nếu tín hiệu đã bị hủy, hoặc nếu phát hiện sự kiện hủy. Nếu không, nó sẽ hoàn tất bình thường rồi giải quyết promise.

```js
function myCoolPromiseAPI(/* …, */ { signal }) {
  return new Promise((resolve, reject) => {
    // If the signal is already aborted, immediately throw in order to reject the promise.
    signal.throwIfAborted();

    // Perform the main purpose of the API
    // Call resolve(result) when done.

    // Watch for 'abort' signals
    // Passing `once: true` ensures the Promise can be garbage collected after abort is called
    signal.addEventListener(
      "abort",
      () => {
        // Stop the main operation
        // Reject the promise with the abort reason.
        reject(signal.reason);
      },
      { once: true },
    );
  });
}
```

API đó sau đó có thể được dùng như dưới đây. Lưu ý rằng {{domxref("AbortController.abort()")}} được gọi để hủy thao tác.

```js
const controller = new AbortController();
const signal = controller.signal;

startSpinner();

myCoolPromiseAPI({ /* …, */ signal })
  .then((result) => {})
  .catch((err) => {
    if (err.name === "AbortError") return;
    showUserErrorMessage();
  })
  .then(() => stopSpinner());

controller.abort();
```

Các API không trả về promise cũng có thể phản ứng theo cách tương tự. Trong một số trường hợp, việc hấp thụ tín hiệu có thể là hợp lý.

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Fetch API](/en-US/docs/Web/API/Fetch_API)
- [Abortable Fetch](https://developer.chrome.com/blog/abortable-fetch/) của Jake Archibald
