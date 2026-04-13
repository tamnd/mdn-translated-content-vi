---
title: Using XMLHttpRequest
slug: Web/API/XMLHttpRequest_API/Using_XMLHttpRequest
page-type: guide
browser-compat: api.XMLHttpRequest
---

{{DefaultAPISidebar("XMLHttpRequest API")}}

Trong hướng dẫn này, chúng ta sẽ xem cách dùng {{domxref("XMLHttpRequest")}} để gửi các yêu cầu [HTTP](/en-US/docs/Web/HTTP), nhằm trao đổi dữ liệu giữa website và máy chủ.

Ví dụ về cả các trường hợp dùng phổ biến lẫn ít gặp hơn của `XMLHttpRequest` đều được đưa vào.

Để gửi một yêu cầu HTTP:

1. Tạo một đối tượng `XMLHttpRequest`
2. Mở một URL
3. Gửi yêu cầu.

Sau khi giao dịch hoàn tất, đối tượng `XMLHttpRequest` sẽ chứa thông tin hữu ích như phần thân phản hồi và [HTTP status](/en-US/docs/Web/HTTP/Reference/Status) của kết quả.

```js
function reqListener() {
  console.log(this.responseText);
}

const req = new XMLHttpRequest();
req.addEventListener("load", reqListener);
req.open("GET", "http://www.example.org/example.txt");
req.send();
```

## Các kiểu yêu cầu

Một yêu cầu được tạo qua `XMLHttpRequest` có thể lấy dữ liệu theo một trong hai cách, bất đồng bộ hoặc đồng bộ. Kiểu yêu cầu được quyết định bởi đối số tùy chọn `async` (đối số thứ ba) được đặt trong phương thức {{domxref("XMLHttpRequest.open()")}}. Nếu đối số này là `true` hoặc không được chỉ định, `XMLHttpRequest` sẽ được xử lý bất đồng bộ, ngược lại quy trình sẽ được xử lý đồng bộ. Phần thảo luận chi tiết và các minh họa về hai kiểu yêu cầu này có thể xem tại trang [synchronous and asynchronous requests](/en-US/docs/Web/API/XMLHttpRequest_API/Synchronous_and_Asynchronous_Requests). Bạn không thể dùng yêu cầu đồng bộ ngoài web worker vì nó làm treo giao diện chính.

> [!NOTE]
> Constructor `XMLHttpRequest` không chỉ giới hạn ở tài liệu XML. Nó bắt đầu bằng **"XML"** vì khi được tạo ra, định dạng chính được dùng cho trao đổi dữ liệu bất đồng bộ vốn là XML.

## Xử lý phản hồi

Có nhiều kiểu [thuộc tính phản hồi](https://xhr.spec.whatwg.org/) được định nghĩa cho constructor {{domxref("XMLHttpRequest.XMLHttpRequest", "XMLHttpRequest()")}}. Chúng cho client tạo `XMLHttpRequest` biết các thông tin quan trọng về trạng thái phản hồi. Một số trường hợp xử lý các kiểu phản hồi không phải văn bản có thể cần thao tác và phân tích được phác thảo trong các phần sau.

### Phân tích và thao tác thuộc tính responseXML

Nếu bạn dùng `XMLHttpRequest` để lấy nội dung của một tài liệu XML từ xa, thuộc tính {{domxref("XMLHttpRequest.responseXML", "responseXML")}} sẽ là một đối tượng DOM chứa tài liệu XML đã được phân tích. Điều này có thể khó thao tác và phân tích. Có bốn cách chính để phân tích tài liệu XML này:

1. Dùng [XPath](/en-US/docs/Web/XML/XPath) để trỏ tới các phần của nó.
2. Tự [phân tích và tuần tự hóa XML](/en-US/docs/Web/XML/Guides/Parsing_and_serializing_XML) thành chuỗi hoặc đối tượng.
3. Dùng {{domxref("XMLSerializer")}} để tuần tự hóa **cây DOM thành chuỗi hoặc tệp**.
4. Có thể dùng {{jsxref("RegExp")}} nếu bạn luôn biết trước nội dung của tài liệu XML. Bạn có thể muốn loại bỏ xuống dòng nếu dùng `RegExp` để quét có xét đến xuống dòng. Tuy nhiên, đây là phương án "cuối cùng" vì nếu mã XML thay đổi chỉ một chút, phương pháp này có thể sẽ thất bại.

> [!NOTE]
> `XMLHttpRequest` giờ đây cũng có thể tự diễn giải HTML cho bạn bằng thuộc tính {{domxref("XMLHttpRequest.responseXML", "responseXML")}}. Đọc bài viết về [HTML in XMLHttpRequest](/en-US/docs/Web/API/XMLHttpRequest_API/HTML_in_XMLHttpRequest) để biết cách làm.

### Xử lý thuộc tính responseText chứa tài liệu HTML

Nếu bạn dùng `XMLHttpRequest` để lấy nội dung của một trang HTML từ xa, thuộc tính {{domxref("XMLHttpRequest.responseText", "responseText")}} sẽ là một chuỗi chứa HTML thô. Điều này có thể khó thao tác và phân tích. Có ba cách chính để phân tích và xử lý chuỗi HTML thô này:

1. Dùng thuộc tính `XMLHttpRequest.responseXML` như được trình bày trong bài viết [HTML in XMLHttpRequest](/en-US/docs/Web/API/XMLHttpRequest_API/HTML_in_XMLHttpRequest).
2. Chèn nội dung vào phần thân của một [document fragment](/en-US/docs/Web/API/DocumentFragment) qua `fragment.body.innerHTML` và duyệt DOM của fragment.
3. Có thể dùng {{jsxref("RegExp")}} nếu bạn luôn biết trước nội dung của `responseText` HTML. Bạn có thể muốn loại bỏ xuống dòng nếu dùng `RegExp` để quét có xét đến xuống dòng. Tuy nhiên, đây là phương án "cuối cùng" vì nếu mã HTML thay đổi chỉ một chút, phương pháp này có thể sẽ thất bại.

## Xử lý dữ liệu nhị phân

Mặc dù {{domxref("XMLHttpRequest")}} thường được dùng nhất để gửi và nhận dữ liệu văn bản, nó vẫn có thể được dùng để gửi và nhận nội dung nhị phân. Có nhiều phương pháp đã được kiểm chứng tốt để ép phản hồi của `XMLHttpRequest` thành dữ liệu nhị phân. Chúng liên quan đến việc sử dụng phương thức {{domxref("XMLHttpRequest.overrideMimeType", "overrideMimeType()")}} trên đối tượng `XMLHttpRequest` và là một giải pháp khả thi.

```js
const req = new XMLHttpRequest();
req.open("GET", url);
// lấy dữ liệu chưa xử lý dưới dạng chuỗi nhị phân
req.overrideMimeType("text/plain; charset=x-user-defined");
/* … */
```

Tuy nhiên, các kỹ thuật hiện đại hơn đã có sẵn, vì thuộc tính {{domxref("XMLHttpRequest.responseType", "responseType")}} hiện hỗ trợ thêm một số kiểu nội dung, giúp việc gửi và nhận dữ liệu nhị phân dễ dàng hơn nhiều.

Ví dụ, hãy xem đoạn này, dùng `responseType` là `"arraybuffer"` để lấy nội dung từ xa vào một đối tượng {{jsxref("ArrayBuffer")}}, vốn lưu dữ liệu nhị phân thô.

```js
const req = new XMLHttpRequest();

req.onload = (e) => {
  const arraybuffer = req.response; // không phải responseText
  /* … */
};
req.open("GET", url);
req.responseType = "arraybuffer";
req.send();
```

Để xem thêm ví dụ, hãy xem trang [Sending and Receiving Binary Data](/en-US/docs/Web/API/XMLHttpRequest_API/Sending_and_Receiving_Binary_Data).

## Giám sát tiến trình

`XMLHttpRequest` cung cấp khả năng lắng nghe nhiều sự kiện khác nhau có thể xảy ra trong lúc yêu cầu đang được xử lý. Điều này bao gồm các thông báo tiến trình định kỳ, thông báo lỗi, v.v.

Hỗ trợ giám sát sự kiện DOM {{domxref("XMLHttpRequestEventTarget/progress_event", "progress")}} cho các lần truyền `XMLHttpRequest` tuân theo [đặc tả về progress events](https://xhr.spec.whatwg.org/#interface-progressevent): các sự kiện này triển khai giao diện {{domxref("ProgressEvent")}}. Các sự kiện thực sự bạn có thể giám sát để xác định trạng thái của một lần truyền đang diễn ra là:

- {{domxref("XMLHttpRequestEventTarget/progress_event", "progress")}}
  - : Lượng dữ liệu đã nhận được đã thay đổi.
- {{domxref("XMLHttpRequestEventTarget/load_event", "load")}}
  - : Lần truyền hoàn tất; toàn bộ dữ liệu hiện đã nằm trong `response`

```js
const req = new XMLHttpRequest();

req.addEventListener("progress", updateProgress);
req.addEventListener("load", transferComplete);
req.addEventListener("error", transferFailed);
req.addEventListener("abort", transferCanceled);

req.open();

// …

// tiến trình tải xuống từ server tới client
function updateProgress(event) {
  if (event.lengthComputable) {
    const percentComplete = (event.loaded / event.total) * 100;
    // …
  } else {
    // Không thể tính thông tin tiến trình vì không biết kích thước tổng
  }
}

function transferComplete(evt) {
  console.log("The transfer is complete.");
}

function transferFailed(evt) {
  console.log("An error occurred while transferring the file.");
}

function transferCanceled(evt) {
  console.log("The transfer has been canceled by the user.");
}
```

Chúng ta thêm các bộ lắng nghe sự kiện cho các sự kiện khác nhau được gửi trong lúc thực hiện truyền dữ liệu bằng `XMLHttpRequest`.

> [!NOTE]
> Bạn cần thêm các bộ lắng nghe sự kiện trước khi gọi `open()` trên yêu cầu. Nếu không, các sự kiện `progress` sẽ không được bắn ra.

Bộ xử lý sự kiện progress, được chỉ định bởi hàm `updateProgress()` trong ví dụ này, nhận tổng số byte cần truyền cũng như số byte đã truyền cho tới thời điểm đó trong các trường `total` và `loaded` của sự kiện. Tuy nhiên, nếu trường `lengthComputable` là false, tổng chiều dài không được biết và sẽ bằng 0.

Sự kiện progress tồn tại cho cả truyền tải xuống và tải lên. Các sự kiện tải xuống được bắn trên chính đối tượng `XMLHttpRequest`, như trong ví dụ ở trên. Các sự kiện tải lên được bắn trên đối tượng `XMLHttpRequest.upload`, như dưới đây:

```js
const req = new XMLHttpRequest();

req.upload.addEventListener("progress", updateProgress);
req.upload.addEventListener("load", transferComplete);
req.upload.addEventListener("error", transferFailed);
req.upload.addEventListener("abort", transferCanceled);

req.open();
```

> [!NOTE]
> Các sự kiện progress không khả dụng cho giao thức
> `file:`.

Các sự kiện progress xuất hiện cho mỗi khối dữ liệu nhận được, bao gồm cả khối cuối cùng trong trường hợp gói cuối cùng được nhận và kết nối đóng trước khi sự kiện progress được bắn ra. Trong trường hợp này, sự kiện progress sẽ tự động được bắn khi sự kiện load xảy ra cho gói đó. Điều này giúp bạn có thể giám sát tiến trình một cách đáng tin cậy chỉ bằng sự kiện "progress".

Bạn cũng có thể phát hiện cả ba trạng thái kết thúc tải (`abort`,
`load`, hoặc `error`) bằng sự kiện `loadend`:

```js
req.addEventListener("loadend", loadEnd);

function loadEnd(e) {
  console.log(
    "The transfer finished (although we don't know if it succeeded or not).",
  );
}
```

Lưu ý rằng không có cách nào để biết chắc, từ thông tin nhận được bởi sự kiện `loadend`, điều kiện nào đã khiến thao tác kết thúc; tuy nhiên, bạn có thể dùng nó để xử lý các tác vụ cần được thực hiện trong mọi tình huống kết thúc truyền.

## Lấy ngày sửa đổi gần nhất

```js
function getHeaderTime() {
  console.log(this.getResponseHeader("Last-Modified")); // Một ngày GMTString hợp lệ hoặc null
}

const req = new XMLHttpRequest();
req.open(
  "HEAD", // dùng HEAD khi bạn chỉ cần header
  "your-page.html",
);
req.onload = getHeaderTime;
req.send();
```

### Làm gì đó khi ngày sửa đổi gần nhất thay đổi

Hãy tạo hai hàm:

```js
function getHeaderTime() {
  const lastVisit = parseFloat(
    window.localStorage.getItem(`lm_${this.filepath}`),
  );
  const lastModified = Date.parse(this.getResponseHeader("Last-Modified"));

  if (isNaN(lastVisit) || lastModified > lastVisit) {
    window.localStorage.setItem(`lm_${this.filepath}`, Date.now());
    isFinite(lastVisit) && this.callback(lastModified, lastVisit);
  }
}

function ifHasChanged(URL, callback) {
  const req = new XMLHttpRequest();
  req.open("HEAD" /* dùng HEAD - ta chỉ cần header! */, URL);
  req.callback = callback;
  req.filepath = URL;
  req.onload = getHeaderTime;
  req.send();
}
```

Và để kiểm tra:

```js
// Hãy kiểm tra tệp "your-page.html"
ifHasChanged("your-page.html", function (modified, visit) {
  console.log(
    `Trang '${this.filepath}' đã được thay đổi vào ${new Date(
      modified,
    ).toLocaleString()}!`,
  );
});
```

Nếu bạn muốn biết trang hiện tại đã thay đổi hay chưa, hãy xem bài viết về {{domxref("document.lastModified")}}.

## Vượt qua cache giữa các site

Một cách tương thích đa trình duyệt để bỏ qua cache là gắn thêm một timestamp vào URL, nhớ thêm "?" hoặc "&" cho phù hợp. Ví dụ:

```plain
http://example.com/bar.html -> http://example.com/bar.html?12345
http://example.com/bar.html?foobar=baz -> http://example.com/bar.html?foobar=baz&12345
```

Vì bộ nhớ đệm cục bộ được lập chỉ mục theo URL, điều này làm cho mỗi yêu cầu trở nên duy nhất, từ đó bỏ qua cache.

Bạn có thể tự động điều chỉnh URL bằng đoạn mã sau:

```js
const req = new XMLHttpRequest();

req.open("GET", url + (/\?/.test(url) ? "&" : "?") + new Date().getTime());
req.send(null);
```
