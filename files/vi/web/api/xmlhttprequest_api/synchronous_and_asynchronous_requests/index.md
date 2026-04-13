---
title: Synchronous and asynchronous requests
slug: Web/API/XMLHttpRequest_API/Synchronous_and_Asynchronous_Requests
page-type: guide
---

{{DefaultAPISidebar("XMLHttpRequest API")}}

{{domxref('XMLHttpRequest')}} hỗ trợ cả giao tiếp đồng bộ và bất đồng bộ. Tuy nhiên, nhìn chung nên ưu tiên các yêu cầu bất đồng bộ hơn vì lý do hiệu năng.

Yêu cầu đồng bộ chặn việc thực thi mã, gây ra hiện tượng "đứng hình" trên màn hình và trải nghiệm người dùng không phản hồi.

## Yêu cầu bất đồng bộ

Nếu bạn dùng {{domxref('XMLHttpRequest')}} bất đồng bộ, bạn sẽ nhận được một callback khi dữ liệu đã được nhận. Điều này cho phép trình duyệt tiếp tục hoạt động bình thường trong khi yêu cầu của bạn đang được xử lý.

### Ví dụ: gửi một tệp ra console log

Đây là cách dùng đơn giản nhất của {{domxref('XMLHttpRequest')}} bất đồng bộ.

```js
const xhr = new XMLHttpRequest();
xhr.open("GET", "/bar/foo.txt", true);
xhr.onload = (e) => {
  if (xhr.readyState === 4) {
    if (xhr.status === 200) {
      console.log(xhr.responseText);
    } else {
      console.error(xhr.statusText);
    }
  }
};
xhr.onerror = (e) => {
  console.error(xhr.statusText);
};
xhr.send(null);
```

Dòng `xhr.open` chỉ định `true` cho tham số thứ ba để cho biết yêu cầu nên được xử lý bất đồng bộ.

Sau đó ta tạo một đối tượng hàm xử lý sự kiện và gán nó cho thuộc tính `onload` của yêu cầu. Bộ xử lý này xem `readyState` của yêu cầu để kiểm tra xem giao dịch đã hoàn tất chưa; nếu đã hoàn tất, và HTTP status là 200, nó sẽ in ra nội dung nhận được. Nếu có lỗi, một thông báo lỗi sẽ được hiển thị.

Lời gọi `xhr.send` thực sự khởi tạo yêu cầu. Routine callback sẽ được gọi mỗi khi trạng thái của yêu cầu thay đổi.

### Ví dụ: viết một hàm để đọc tệp bên ngoài

Trong một số trường hợp, bạn phải đọc nhiều tệp bên ngoài. Đây là một hàm tiêu chuẩn dùng đối tượng {{domxref('XMLHttpRequest')}} theo cách bất đồng bộ để chuyển nội dung của tệp được đọc sang một listener được chỉ định.

```js
function xhrSuccess() {
  this.callback(...this.arguments);
}

function xhrError() {
  console.error(this.statusText);
}

function loadFile(url, callback, ...args) {
  const xhr = new XMLHttpRequest();
  xhr.callback = callback;
  xhr.arguments = args;
  xhr.onload = xhrSuccess;
  xhr.onerror = xhrError;
  xhr.open("GET", url, true);
  xhr.send(null);
}
```

Cách dùng:

```js
function showMessage(message) {
  console.log(`${message} ${this.responseText}`);
}

loadFile("message.txt", showMessage, "New message!\n\n");
```

Chữ ký của hàm tiện ích **_loadFile_** khai báo (i) một URL đích để đọc (qua yêu cầu HTTP GET), (ii) một hàm để thực thi khi XHR hoàn tất thành công, và (iii) một danh sách tùy ý các đối số bổ sung được truyền qua đối tượng XHR (qua thuộc tính `arguments`) đến hàm callback thành công.

Trước tiên, ta khai báo hàm `xhrSuccess` được gọi khi XHR hoàn tất thành công. Hàm này tiếp tục gọi hàm callback đã được chỉ định trong lệnh gọi `loadFile` (trong trường hợp này là `showMessage`), vốn đã được gán vào một thuộc tính của đối tượng XHR. Các đối số bổ sung (nếu có) của lời gọi `loadFile` sẽ được "áp dụng" cho callback đang chạy. Hàm `xhrError` được gọi khi XHR không hoàn tất thành công.

Ta lưu callback thành công được truyền ở đối số thứ hai cho `loadFile` vào thuộc tính `callback` của đối tượng XHR. Bắt đầu từ đối số thứ ba, tất cả đối số còn lại của `loadFile` được thu thập lại (dùng cú pháp [rest parameter](/en-US/docs/Web/JavaScript/Reference/Functions/rest_parameters)), gán vào thuộc tính `arguments` của biến `xhr`, truyền tới callback thành công `xhrSuccess`, và cuối cùng được cung cấp cho callback (trong trường hợp này là `showMessage`) do `xhrSuccess` gọi.

Lời gọi `xhr.open` chỉ định `true` cho tham số thứ ba để cho biết yêu cầu nên được xử lý bất đồng bộ.

Cuối cùng, `xhr.send` thực sự khởi tạo yêu cầu.

### Ví dụ: dùng timeout

Bạn có thể dùng timeout để tránh mã của bạn bị treo trong lúc chờ một lần đọc hoàn tất. Việc này được làm bằng cách đặt giá trị cho thuộc tính `timeout` trên đối tượng {{domxref('XMLHttpRequest')}}, như trong đoạn mã bên dưới:

```js
function loadFile(url, timeout, callback, ...args) {
  const xhr = new XMLHttpRequest();
  xhr.ontimeout = () => {
    console.error(`The request for ${url} timed out.`);
  };
  xhr.onload = () => {
    if (xhr.readyState === 4) {
      if (xhr.status === 200) {
        callback.apply(xhr, args);
      } else {
        console.error(xhr.statusText);
      }
    }
  };
  xhr.open("GET", url, true);
  xhr.timeout = timeout;
  xhr.send(null);
}
```

Lưu ý bổ sung mã để xử lý sự kiện "timeout" bằng cách đặt bộ xử lý `ontimeout`.

Cách dùng:

```js
function showMessage(message) {
  console.log(`${message} ${this.responseText}`);
}

loadFile("message.txt", 2000, showMessage, "New message!\n");
```

Ở đây, chúng ta chỉ định timeout là 2000 ms.

## Yêu cầu đồng bộ

> [!WARNING]
> Các yêu cầu XHR đồng bộ thường gây treo trên web, đặc biệt khi điều kiện mạng kém hoặc máy chủ từ xa phản hồi chậm. XHR đồng bộ hiện đã bị phản đối và nên tránh, thay bằng các yêu cầu bất đồng bộ.

Tất cả tính năng XHR mới như `timeout` hoặc `abort` đều không được phép dùng cho XHR đồng bộ. Nếu làm vậy sẽ ném ra `InvalidAccessError`.

### Ví dụ: yêu cầu HTTP đồng bộ

Ví dụ này minh họa cách thực hiện một yêu cầu đồng bộ đơn giản.

```js
const request = new XMLHttpRequest();
request.open("GET", "/bar/foo.txt", false); // `false` làm yêu cầu trở thành đồng bộ
request.send(null);

if (request.status === 200) {
  console.log(request.responseText);
}
```

Lời gọi `request.send` gửi yêu cầu. Tham số `null` cho biết rằng không cần nội dung thân cho yêu cầu `GET`.

Câu lệnh `if` kiểm tra mã trạng thái sau khi giao dịch hoàn tất. Nếu kết quả là 200 — kết quả "OK" của HTTP — nội dung văn bản của tài liệu sẽ được xuất ra console.

### Ví dụ: yêu cầu HTTP đồng bộ từ Worker

Một trong số ít trường hợp mà yêu cầu đồng bộ thường không chặn việc thực thi là khi dùng {{domxref('XMLHttpRequest')}} bên trong một [`Worker`](/en-US/docs/Web/API/Worker).

**`example.js`** (script sẽ được gọi trên trang chính):

```js
const worker = new Worker("myTask.js");
worker.onmessage = (event) => {
  console.log(`Worker said: ${event.data}`);
};

worker.postMessage("Hello");
```

**`myFile.txt`** (đích của lời gọi {{domxref('XMLHttpRequest')}} đồng bộ):

```plain
Hello World!!
```

**`myTask.js`** ([`Worker`](/en-US/docs/Web/API/Worker)):

```js
self.onmessage = (event) => {
  if (event.data === "Hello") {
    const xhr = new XMLHttpRequest();
    xhr.open("GET", "myFile.txt", false); // yêu cầu đồng bộ
    xhr.send(null);
    self.postMessage(xhr.responseText);
  }
};
```

> [!NOTE]
> Hiệu ứng là bất đồng bộ, vì sử dụng `Worker`.

Mẫu này có thể hữu ích, ví dụ để tương tác với máy chủ ở nền, hoặc để tải sẵn nội dung. Xem [Using web workers](/en-US/docs/Web/API/Web_Workers_API/Using_web_workers) để biết ví dụ và chi tiết.

### Điều chỉnh các trường hợp dùng Sync XHR sang Beacon API

Có một số trường hợp mà việc dùng đồng bộ {{domxref('XMLHttpRequest')}} không thể thay thế, chẳng hạn trong các sự kiện {{domxref("Window.unload_event", "unload")}}, {{domxref("Window.beforeunload_event", "beforeunload")}}, và {{domxref("Window.pagehide_event", "pagehide")}}. Bạn nên cân nhắc dùng API `fetch()` với cờ `keepalive`. Khi `fetch` với `keepalive` không khả dụng, bạn có thể dùng API {{domxref("navigator.sendBeacon()")}}, vốn có thể hỗ trợ các trường hợp này trong khi thường vẫn mang lại trải nghiệm người dùng tốt.

Ví dụ sau cho thấy mã phân tích giả định cố gắng gửi dữ liệu lên máy chủ bằng cách dùng {{domxref('XMLHttpRequest')}} đồng bộ trong một handler unload. Điều này làm việc dỡ trang bị trì hoãn.

```js
window.addEventListener("unload", logData);

function logData() {
  const client = new XMLHttpRequest();
  client.open("POST", "/log", false); // tham số thứ ba cho biết sync xhr. :(
  client.setRequestHeader("Content-Type", "text/plain;charset=UTF-8");
  client.send(analyticsData);
}
```

Khi dùng phương thức **`sendBeacon()`**, dữ liệu sẽ được truyền bất đồng bộ đến máy chủ web khi User Agent có cơ hội thực hiện, **mà không làm chậm việc dỡ trang hoặc ảnh hưởng đến hiệu năng của điều hướng tiếp theo.**

Ví dụ sau cho thấy một mẫu mã phân tích giả định gửi dữ liệu đến máy chủ bằng phương thức **`sendBeacon()`**.

```js
window.addEventListener("unload", logData);

function logData() {
  navigator.sendBeacon("/log", analyticsData);
}
```

## Xem thêm

- [Using XMLHttpRequest](/en-US/docs/Web/API/XMLHttpRequest_API/Using_XMLHttpRequest)
- [`navigator.sendBeacon`](/en-US/docs/Web/API/Navigator/sendBeacon)
