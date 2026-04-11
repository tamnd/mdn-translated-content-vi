---
title: XMLHttpRequest API
slug: Web/API/XMLHttpRequest_API
page-type: web-api-overview
browser-compat: api.XMLHttpRequest
spec-urls: https://xhr.spec.whatwg.org/
---

{{DefaultAPISidebar("XMLHttpRequest API")}} {{AvailableInWorkers("window_and_worker_except_service")}}

**XMLHttpRequest API** cho phép các ứng dụng web gửi yêu cầu HTTP đến máy chủ web và nhận phản hồi theo cách có thể lập trình bằng JavaScript. Nhờ đó, một trang web có thể cập nhật chỉ một phần của trang bằng dữ liệu từ máy chủ, thay vì phải điều hướng sang một trang hoàn toàn mới. Thực hành này đôi khi còn được gọi là {{glossary("AJAX")}}.

[Fetch API](/en-US/docs/Web/API/Fetch_API) là giải pháp thay thế linh hoạt và mạnh mẽ hơn cho XMLHttpRequest API. Fetch API dùng {{jsxref("Promise", "promises", "", 1)}} thay vì sự kiện để xử lý phản hồi bất đồng bộ, tích hợp tốt với [service workers](/en-US/docs/Web/API/Service_Worker_API), và hỗ trợ các khía cạnh nâng cao của HTTP như [CORS](/en-US/docs/Web/HTTP/Guides/CORS). Vì những lý do này, Fetch API thường được dùng trong các ứng dụng web hiện đại thay cho {{domxref("XMLHttpRequest")}}.

## Khái niệm và cách dùng

Giao diện trung tâm trong XMLHttpRequest API là {{domxref("XMLHttpRequest")}}. Để tạo một yêu cầu HTTP:

1. Tạo một thể hiện `XMLHttpRequest` mới bằng cách gọi {{domxref("XMLHttpRequest.XMLHttpRequest", "constructor", "", "nocode")}} của nó.
2. Khởi tạo nó bằng cách gọi {{domxref("XMLHttpRequest.open()")}}. Tại đây bạn cung cấp URL cho yêu cầu, [phương thức HTTP](/en-US/docs/Web/HTTP/Reference/Methods) cần dùng, và tùy chọn tên người dùng cùng mật khẩu.
3. Gắn các bộ xử lý sự kiện để nhận kết quả của yêu cầu. Ví dụ, sự kiện {{domxref("XMLHttpRequestEventTarget/load_event", "load")}} được kích hoạt khi yêu cầu hoàn tất thành công, còn sự kiện {{domxref("XMLHttpRequestEventTarget/error_event", "error")}} được kích hoạt trong nhiều điều kiện lỗi khác nhau.
4. Gửi yêu cầu bằng cách gọi {{domxref("XMLHttpRequest.send()")}}.

Để xem hướng dẫn chi tiết về XMLHttpRequest API, hãy xem [Using XMLHttpRequest](/en-US/docs/Web/API/XMLHttpRequest_API/Using_XMLHttpRequest).

## Giao diện

- {{domxref("FormData")}}
  - : Đối tượng biểu diễn các trường và giá trị của {{htmlelement("form")}}, có thể gửi đến máy chủ bằng {{domxref("XMLHttpRequest")}} hoặc {{domxref("Window/fetch", "fetch()")}}.
- {{domxref("ProgressEvent")}}
  - : Một lớp con của {{domxref("Event")}} được truyền vào sự kiện {{domxref("XMLHttpRequestEventTarget/progress_event", "progress")}}, và chứa thông tin về lượng yêu cầu đã hoàn tất.
- {{domxref("XMLHttpRequest")}}
  - : Đại diện cho một yêu cầu HTTP đơn lẻ.
- {{domxref("XMLHttpRequestEventTarget")}}
  - : Lớp cha của cả {{domxref("XMLHttpRequest")}} và {{domxref("XMLHttpRequestUpload")}}, định nghĩa các sự kiện có sẵn trong cả hai giao diện này.
- {{domxref("XMLHttpRequestUpload")}}
  - : Đại diện cho tiến trình tải lên của một upload HTTP. Cung cấp các sự kiện để theo dõi tiến trình tải lên.

## Ví dụ

### Lấy dữ liệu JSON từ máy chủ

Trong ví dụ này, chúng ta lấy một tệp JSON từ `https://raw.githubusercontent.com/mdn/content/main/files/en-us/_wikihistory.json`, đồng thời thêm các bộ lắng nghe sự kiện để hiển thị tiến trình.

#### HTML

```html
<div class="controls">
  <button class="xhr" type="button">Click to start XHR</button>
</div>

<textarea readonly class="event-log"></textarea>
```

```css hidden
.event-log {
  width: 25rem;
  height: 5rem;
  border: 1px solid black;
  margin: 0.5rem;
  padding: 0.2rem;
}

button {
  width: 12rem;
  margin: 0.5rem;
}
```

#### JavaScript

```js
const xhrButton = document.querySelector(".xhr");
const log = document.querySelector(".event-log");
const url =
  "https://raw.githubusercontent.com/mdn/content/main/files/en-us/_wikihistory.json";

function handleEvent(e) {
  log.textContent = `${log.textContent}${e.type}: ${e.loaded} bytes transferred\n`;
}

function addListeners(xhr) {
  xhr.addEventListener("loadstart", handleEvent);
  xhr.addEventListener("load", handleEvent);
  xhr.addEventListener("loadend", handleEvent);
  xhr.addEventListener("progress", handleEvent);
  xhr.addEventListener("error", handleEvent);
  xhr.addEventListener("abort", handleEvent);
}

xhrButton.addEventListener("click", () => {
  log.textContent = "";

  const xhr = new XMLHttpRequest();
  xhr.open("GET", url);
  addListeners(xhr);
  xhr.send();
});
```

#### Kết quả

{{EmbedLiveSample("Fetching JSON data from the server")}}

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Fetch API](/en-US/docs/Web/API/Fetch_API)
