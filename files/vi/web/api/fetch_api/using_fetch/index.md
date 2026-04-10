---
title: Sử dụng Fetch API
slug: Web/API/Fetch_API/Using_Fetch
page-type: guide
---

{{DefaultAPISidebar("Fetch API")}}

[Fetch API](/en-US/docs/Web/API/Fetch_API) cung cấp một giao diện JavaScript để thực hiện các yêu cầu HTTP và xử lý phản hồi.

Fetch là phiên bản thay thế hiện đại cho {{domxref("XMLHttpRequest")}}: không giống `XMLHttpRequest`, vốn dùng callback, Fetch dựa trên promise và được tích hợp với các tính năng của web hiện đại như [service worker](/en-US/docs/Web/API/Service_Worker_API) và [Cross-Origin Resource Sharing (CORS)](/en-US/docs/Web/HTTP/Guides/CORS).

Với Fetch API, bạn tạo một yêu cầu bằng cách gọi {{domxref("Window/fetch", "fetch()")}}, phương thức này có sẵn dưới dạng hàm toàn cục trong cả ngữ cảnh {{domxref("Window", "window")}} và {{domxref("WorkerGlobalScope", "worker")}}. Bạn truyền cho nó một đối tượng {{domxref("Request")}} hoặc một chuỗi chứa URL cần truy xuất, cùng với một đối số tùy chọn để cấu hình yêu cầu.

Hàm `fetch()` trả về một {{jsxref("Promise")}} được hoàn tất bằng một đối tượng {{domxref("Response")}} đại diện cho phản hồi từ máy chủ. Sau đó bạn có thể kiểm tra trạng thái yêu cầu và trích xuất phần thân phản hồi ở nhiều định dạng khác nhau, bao gồm văn bản và JSON, bằng cách gọi phương thức thích hợp trên phản hồi.

Dưới đây là một hàm tối thiểu dùng `fetch()` để lấy một số dữ liệu JSON từ máy chủ:

```js
async function getData() {
  const url = "https://example.org/products.json";
  try {
    const response = await fetch(url);
    if (!response.ok) {
      throw new Error(`Response status: ${response.status}`);
    }

    const result = await response.json();
    console.log(result);
  } catch (error) {
    console.error(error.message);
  }
}
```

Chúng ta khai báo một chuỗi chứa URL rồi gọi `fetch()`, truyền URL mà không có tùy chọn bổ sung.

Hàm `fetch()` sẽ từ chối promise trong một số trường hợp lỗi, nhưng không phải khi máy chủ trả về trạng thái lỗi như {{httpstatus("404")}}: vì vậy chúng ta cũng kiểm tra trạng thái phản hồi và ném lỗi nếu nó không phải OK.

Sau đó, chúng ta lấy phần thân phản hồi dưới dạng {{glossary("JSON")}} bằng cách gọi phương thức {{domxref("Response.json()", "json()")}} của `Response`, rồi ghi một trong các giá trị của nó ra console. Lưu ý rằng, giống như `fetch()` itself, `json()` cũng bất đồng bộ, cũng như các phương thức khác dùng để truy cập nội dung thân phản hồi.

Phần còn lại của trang này sẽ xem chi tiết hơn các giai đoạn khác nhau của quá trình này.

## Tạo yêu cầu

Để tạo một yêu cầu, hãy gọi `fetch()`, truyền vào:

1. một định nghĩa của tài nguyên cần truy xuất. Đây có thể là một trong các dạng sau:
   - một chuỗi chứa URL
   - một đối tượng, chẳng hạn một thể hiện của {{domxref("URL")}}, có một {{glossary("stringifier")}} tạo ra chuỗi chứa URL
   - một thể hiện {{domxref("Request")}}
2. tùy chọn, một đối tượng chứa các tùy chọn để cấu hình yêu cầu.

Trong phần này, chúng ta sẽ xem một số tùy chọn thường dùng nhất. Để đọc về tất cả các tùy chọn có thể truyền vào, xem trang tham chiếu [`fetch()`](/en-US/docs/Web/API/Window/fetch).

### Thiết lập method

Mặc định, `fetch()` tạo một yêu cầu {{httpmethod("GET")}}, nhưng bạn có thể dùng tùy chọn `method` để chọn [request method](/en-US/docs/Web/HTTP/Reference/Methods) khác:

```js
const response = await fetch("https://example.org/post", {
  method: "POST",
  // …
});
```

Nếu tùy chọn `mode` được đặt thành `no-cors`, thì `method` phải là `GET`, `POST` hoặc `HEAD`.

### Thiết lập body

Phần thân yêu cầu là payload của yêu cầu: đó là thứ client gửi tới server. Bạn không thể kèm body trong các yêu cầu `GET`, nhưng nó hữu ích cho những yêu cầu gửi nội dung lên server, chẳng hạn các yêu cầu {{httpmethod("POST")}} hoặc {{httpmethod("PUT")}}. Ví dụ, nếu bạn muốn tải tệp lên server, bạn có thể tạo yêu cầu `POST` và đưa tệp vào body của yêu cầu.

Để đặt body của yêu cầu, hãy truyền nó vào tùy chọn `body`:

```js
const response = await fetch("https://example.org/post", {
  method: "POST",
  body: JSON.stringify({ username: "example" }),
  // …
});
```

Bạn có thể truyền body dưới dạng thể hiện của bất kỳ kiểu nào sau đây:

- một chuỗi
- {{jsxref("ArrayBuffer")}}
- {{jsxref("TypedArray")}}
- {{jsxref("DataView")}}
- {{domxref("Blob")}}
- {{domxref("File")}}
- {{domxref("URLSearchParams")}}
- {{domxref("FormData")}}
- {{domxref("ReadableStream")}}

Các đối tượng khác sẽ được chuyển thành chuỗi bằng phương thức `toString()`. Ví dụ, bạn có thể dùng một đối tượng {{domxref("URLSearchParams")}} để mã hóa dữ liệu biểu mẫu (xem [thiết lập headers](#setting_headers) để biết thêm thông tin):

```js
const response = await fetch("https://example.org/post", {
  method: "POST",
  headers: {
    "Content-Type": "application/x-www-form-urlencoded",
  },
  // Automatically converted to "username=example&password=password"
  body: new URLSearchParams({ username: "example", password: "password" }),
  // …
});
```

Lưu ý rằng, giống như body của phản hồi, body của yêu cầu cũng là stream, và việc gửi yêu cầu sẽ đọc stream đó, nên nếu một yêu cầu có body thì bạn không thể gửi nó hai lần:

```js example-bad
const request = new Request("https://example.org/post", {
  method: "POST",
  body: JSON.stringify({ username: "example" }),
});

const response1 = await fetch(request);
console.log(response1.status);

// Will throw: "Body has already been consumed."
const response2 = await fetch(request);
console.log(response2.status);
```

Thay vào đó, bạn cần {{domxref("Request.clone()", "create a clone", "", "nocode")}} của request trước khi gửi:

```js
const request1 = new Request("https://example.org/post", {
  method: "POST",
  body: JSON.stringify({ username: "example" }),
});

const request2 = request1.clone();

const response1 = await fetch(request1);
console.log(response1.status);

const response2 = await fetch(request2);
console.log(response2.status);
```

Xem [Locked and disturbed streams](#locked_and_disturbed_streams) để biết thêm thông tin.

### Thiết lập headers

Header của request cung cấp cho server thông tin về yêu cầu: ví dụ, trong một yêu cầu `POST`, header {{httpheader("Content-Type")}} cho server biết định dạng của body yêu cầu.

Để đặt header của request, hãy gán chúng vào tùy chọn `headers`.

Bạn có thể truyền một object literal ở đây, chứa các thuộc tính `header-name: header-value`:

```js
const response = await fetch("https://example.org/post", {
  method: "POST",
  headers: {
    "Content-Type": "application/json",
  },
  body: JSON.stringify({ username: "example" }),
  // …
});
```

Ngoài ra, bạn có thể tạo một đối tượng {{domxref("Headers")}}, thêm header vào đối tượng đó bằng {{domxref("Headers.append()")}}, rồi gán đối tượng `Headers` vào tùy chọn `headers`:

```js
const myHeaders = new Headers();
myHeaders.append("Content-Type", "application/json");

const response = await fetch("https://example.org/post", {
  method: "POST",
  headers: myHeaders,
  body: JSON.stringify({ username: "example" }),
  // …
});
```

So với object thuần, đối tượng `Headers` cung cấp thêm một số bước làm sạch dữ liệu đầu vào. Ví dụ, nó chuẩn hóa tên header thành chữ thường, loại bỏ khoảng trắng đầu và cuối khỏi giá trị header, và ngăn không cho một số header nhất định được thiết lập. Nhiều header được trình duyệt tự động đặt và không thể đặt bằng script: những header này được gọi là {{glossary("Forbidden request header", "Forbidden request headers")}}. Nếu tùy chọn {{domxref("Request.mode", "mode")}} được đặt thành `no-cors`, thì tập hợp header được phép còn bị hạn chế thêm.

### Gửi dữ liệu trong request GET

Yêu cầu `GET` không có body, nhưng bạn vẫn có thể gửi dữ liệu tới server bằng cách gắn chúng vào URL dưới dạng chuỗi truy vấn. Đây là cách phổ biến để gửi dữ liệu biểu mẫu tới server. Bạn có thể làm điều đó bằng cách dùng {{domxref("URLSearchParams")}} để mã hóa dữ liệu, rồi nối nó vào URL:

```js
const params = new URLSearchParams();
params.append("username", "example");

// GET request sent to https://example.org/login?username=example
const response = await fetch(`https://example.org/login?${params}`);
```

### Tạo yêu cầu cross-origin

Việc một yêu cầu có thể được gửi cross-origin hay không được xác định bởi giá trị của tùy chọn {{domxref("RequestInit", "", "mode")}}. Giá trị này có thể là một trong ba giá trị: `cors`, `same-origin`, hoặc `no-cors`.

- Với các yêu cầu fetch, giá trị mặc định của `mode` là `cors`, nghĩa là nếu yêu cầu là cross-origin thì nó sẽ dùng cơ chế [Cross-Origin Resource Sharing (CORS)](/en-US/docs/Web/HTTP/Guides/CORS). Điều này có nghĩa là:
  - nếu yêu cầu là một [simple request](/en-US/docs/Web/HTTP/Guides/CORS#simple_requests), thì yêu cầu sẽ luôn được gửi, nhưng server phải phản hồi với header {{httpheader("Access-Control-Allow-Origin")}} chính xác, nếu không trình duyệt sẽ không chia sẻ phản hồi với bên gọi.
  - nếu yêu cầu không phải simple request, thì trình duyệt sẽ gửi một [preflighted request](/en-US/docs/Web/HTTP/Guides/CORS#preflighted_requests) để kiểm tra rằng server hiểu CORS và cho phép yêu cầu, và yêu cầu thật sẽ không được gửi trừ khi server phản hồi preflight bằng các header CORS thích hợp.

- Đặt `mode` thành `same-origin` sẽ chặn hoàn toàn các yêu cầu cross-origin.

- Đặt `mode` thành `no-cors` sẽ tắt CORS đối với các yêu cầu cross-origin. Điều này hạn chế các header có thể đặt, và giới hạn method thành GET, HEAD và POST. Phản hồi sẽ là _opaque_, nghĩa là header và body của nó không khả dụng cho JavaScript. Phần lớn thời gian, một website không nên dùng `no-cors`: ứng dụng chính của nó là cho một số trường hợp dùng service worker nhất định.

Xem tài liệu tham chiếu cho {{domxref("RequestInit", "", "mode")}} để biết thêm chi tiết.

### Bao gồm credentials

Trong ngữ cảnh của Fetch API, credential là một phần dữ liệu bổ sung được gửi kèm theo yêu cầu mà server có thể dùng để xác thực người dùng. Tất cả các mục sau đều được xem là credential:

- HTTP cookies
- {{glossary("TLS")}} client certificates
- Các header {{httpheader("Authorization")}} và {{httpheader("Proxy-Authorization")}}.

Mặc định, credentials chỉ được bao gồm trong các yêu cầu same-origin. Để tùy chỉnh hành vi này, cũng như kiểm soát việc trình duyệt có tôn trọng các header phản hồi **`Set-Cookie`** hay không, hãy đặt tùy chọn [`credentials`](/en-US/docs/Web/API/RequestInit#credentials), giá trị của nó có thể là một trong ba lựa chọn sau:

- `omit`: không bao giờ gửi credentials trong yêu cầu hoặc bao gồm credentials trong phản hồi.
- `same-origin` (mặc định): chỉ gửi và bao gồm credentials cho các yêu cầu same-origin.
- `include`: luôn bao gồm credentials, kể cả cross-origin.

Lưu ý rằng nếu thuộc tính [`SameSite`](/en-US/docs/Web/HTTP/Reference/Headers/Set-Cookie#samesitesamesite-value) của cookie được đặt là `Strict` hoặc `Lax`, thì cookie sẽ không được gửi cross-site, ngay cả khi `credentials` được đặt thành `include`.

Việc bao gồm credentials trong các yêu cầu cross-origin có thể khiến một site dễ bị tấn công {{glossary("CSRF")}}, nên ngay cả khi `credentials` được đặt là `include`, server cũng phải đồng ý với việc bao gồm chúng bằng cách đưa header {{httpheader("Access-Control-Allow-Credentials")}} vào phản hồi của nó. Ngoài ra, trong trường hợp này server phải chỉ rõ origin của client trong header phản hồi {{httpheader("Access-Control-Allow-Origin")}} (tức là `*` không được phép).

Điều này có nghĩa là nếu `credentials` được đặt thành `include` và yêu cầu là cross-origin, thì:

- Nếu yêu cầu là một [simple request](/en-US/docs/Web/HTTP/Guides/CORS#simple_requests), thì yêu cầu sẽ được gửi kèm credentials, nhưng server phải đặt các header phản hồi {{httpheader("Access-Control-Allow-Credentials")}} và {{httpheader("Access-Control-Allow-Origin")}}, nếu không trình duyệt sẽ trả về lỗi mạng cho bên gọi. Nếu server có đặt đúng header, thì phản hồi, bao gồm cả credentials, sẽ được trả cho bên gọi.

- Nếu yêu cầu không phải simple request, thì trình duyệt sẽ gửi một [preflighted request](/en-US/docs/Web/HTTP/Guides/CORS#preflighted_requests) không kèm credentials, và server phải đặt các header phản hồi {{httpheader("Access-Control-Allow-Credentials")}} và {{httpheader("Access-Control-Allow-Origin")}}, nếu không trình duyệt sẽ trả về lỗi mạng cho bên gọi. Nếu server có đặt đúng header, thì trình duyệt sẽ gửi tiếp yêu cầu thật, bao gồm credentials, và sẽ trả phản hồi thật, bao gồm credentials, cho bên gọi.

### Tạo đối tượng `Request`

Hàm khởi tạo {{domxref("Request.Request()", "Request()")}} nhận cùng các đối số như chính `fetch()`. Điều này có nghĩa là thay vì truyền các tùy chọn vào `fetch()`, bạn có thể truyền cùng các tùy chọn đó vào hàm khởi tạo `Request()`, rồi truyền đối tượng đó vào `fetch()`.

Ví dụ, ta có thể tạo yêu cầu POST bằng cách truyền tùy chọn vào `fetch()` như sau:

```js
const myHeaders = new Headers();
myHeaders.append("Content-Type", "application/json");

const response = await fetch("https://example.org/post", {
  method: "POST",
  body: JSON.stringify({ username: "example" }),
  headers: myHeaders,
});
```

Tuy nhiên, ta cũng có thể viết lại điều này để truyền cùng các đối số đó vào hàm khởi tạo `Request()`:

```js
const myHeaders = new Headers();
myHeaders.append("Content-Type", "application/json");

const myRequest = new Request("https://example.org/post", {
  method: "POST",
  body: JSON.stringify({ username: "example" }),
  headers: myHeaders,
});

const response = await fetch(myRequest);
```
