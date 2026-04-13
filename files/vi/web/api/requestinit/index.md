---
title: RequestInit
slug: Web/API/RequestInit
page-type: web-api-interface
spec-urls: https://fetch.spec.whatwg.org/#requestinit
---

{{APIRef("Fetch API")}}

Từ điển **`RequestInit`** của [Fetch API](/en-US/docs/Web/API/Fetch_API) đại diện cho tập hợp các tùy chọn có thể được sử dụng để cấu hình [fetch request](/en-US/docs/Web/API/Window/fetch).

Bạn có thể truyền đối tượng `RequestInit` vào hàm tạo {{domxref("Request.Request()", "Request()")}}, hoặc trực tiếp vào lệnh gọi hàm [`fetch()`](/en-US/docs/Web/API/Window/fetch).

Bạn cũng có thể tạo `Request` với `RequestInit` và truyền `Request` vào lệnh gọi `fetch()` cùng với `RequestInit` khác. Nếu làm vậy và cùng một tùy chọn được đặt ở cả hai nơi, giá trị được truyền trực tiếp vào `fetch()` sẽ được sử dụng.

## Thuộc tính phiên bản

- `attributionReporting` {{optional_inline}} {{deprecated_inline}}
  - : Cho biết bạn muốn phản hồi của yêu cầu có thể đăng ký [attribution source](/en-US/docs/Web/API/Attribution_Reporting_API/Registering_sources#javascript-based_event_sources) hoặc [attribution trigger](/en-US/docs/Web/API/Attribution_Reporting_API/Registering_triggers#javascript-based_attribution_triggers) dựa trên JavaScript. `attributionReporting` là đối tượng chứa các thuộc tính:
    - `eventSourceEligible`
      - : Giá trị boolean. Nếu đặt thành `true`, phản hồi của yêu cầu đủ điều kiện để đăng ký attribution source.
    - `triggerEligible`
      - : Giá trị boolean. Nếu đặt thành `true`, phản hồi của yêu cầu đủ điều kiện để đăng ký attribution trigger.

- `body` {{optional_inline}}
  - : Phần thân yêu cầu chứa nội dung cần gửi đến server, ví dụ trong yêu cầu {{httpmethod("POST")}} hoặc {{httpmethod("PUT")}}. Nó được chỉ định là một phiên bản của bất kỳ loại nào sau đây:
    - chuỗi
    - {{jsxref("ArrayBuffer")}}
    - {{domxref("Blob")}}
    - {{jsxref("DataView")}}
    - {{domxref("File")}}
    - {{domxref("FormData")}}
    - {{jsxref("TypedArray")}}
    - {{domxref("URLSearchParams")}}
    - {{domxref("ReadableStream")}}

- `browsingTopics` {{optional_inline}} {{deprecated_inline}}
  - : Giá trị boolean chỉ định rằng các chủ đề đã chọn cho người dùng hiện tại nên được gửi trong header {{httpheader("Sec-Browsing-Topics")}} với yêu cầu liên quan.

- `cache` {{optional_inline}}
  - : [Chế độ cache](/en-US/docs/Web/API/Request/cache) bạn muốn sử dụng cho yêu cầu. Có thể là một trong các giá trị:
    - `default`
      - : Trình duyệt tìm kiếm trong cache HTTP của mình phản hồi phù hợp với yêu cầu.
    - `no-store`
      - : Trình duyệt lấy tài nguyên từ server từ xa mà không kiểm tra cache trước và sẽ không cập nhật cache.
    - `reload`
      - : Trình duyệt lấy tài nguyên từ server từ xa mà không kiểm tra cache trước, nhưng sau đó sẽ cập nhật cache.
    - `no-cache`
      - : Trình duyệt tìm kiếm trong cache HTTP của mình. Nếu có kết quả khớp, trình duyệt sẽ thực hiện yêu cầu có điều kiện đến server từ xa.
    - `force-cache`
      - : Trình duyệt tìm kiếm trong cache HTTP. Nếu có kết quả khớp, dù còn mới hay cũ, nó sẽ được trả về từ cache.
    - `only-if-cached`
      - : Trình duyệt tìm kiếm trong cache HTTP. {{experimental_inline}} Nếu có kết quả khớp, nó sẽ được trả về từ cache. Nếu không có kết quả khớp, lỗi mạng được trả về.

- `credentials` {{optional_inline}}
  - : Kiểm soát xem trình duyệt có gửi thông tin xác thực cùng với yêu cầu không. Các giá trị có thể là:
    - `omit`
      - : Không bao giờ gửi thông tin xác thực trong yêu cầu hoặc đưa thông tin xác thực vào phản hồi.
    - `same-origin`
      - : Chỉ gửi và bao gồm thông tin xác thực cho các yêu cầu cùng nguồn gốc.
    - `include`
      - : Luôn bao gồm thông tin xác thực, ngay cả cho các yêu cầu nguồn gốc chéo.

    Mặc định là `same-origin`.

- `duplex` {{optional_inline}} {{experimental_inline}}
  - : Kiểm soát hành vi duplex của yêu cầu. Nếu có, nó phải có giá trị `half`, nghĩa là trình duyệt phải gửi toàn bộ yêu cầu trước khi xử lý phản hồi.

    Tùy chọn này phải có mặt khi [`body`](#body) là {{domxref("ReadableStream")}}.

- `headers` {{optional_inline}}
  - : Bất kỳ header nào bạn muốn thêm vào yêu cầu, chứa trong đối tượng {{domxref("Headers")}} hoặc đối tượng literal.

    Nhiều header được đặt tự động bởi trình duyệt và không thể đặt bởi script: đây được gọi là {{glossary("Forbidden request header", "Forbidden request headers")}}.

- `integrity` {{optional_inline}}
  - : Chứa giá trị [subresource integrity](/en-US/docs/Web/Security/Defenses/Subresource_Integrity) của yêu cầu.

    Định dạng của tùy chọn này là `<hash-algo>-<hash-source>` trong đó:
    - `<hash-algo>` là một trong các giá trị: `sha256`, `sha384`, hoặc `sha512`
    - `<hash-source>` là mã hóa {{glossary("base64", "Base64")}} của kết quả băm tài nguyên với thuật toán băm được chỉ định.

    Mặc định là chuỗi rỗng.

- `keepalive` {{optional_inline}}
  - : Giá trị boolean. Khi đặt thành `true`, trình duyệt sẽ không hủy bỏ yêu cầu liên quan nếu trang khởi tạo nó bị tải lại trước khi yêu cầu hoàn thành.

    Điều này giúp lệnh gọi {{domxref('Window.fetch','fetch()')}} gửi phân tích ở cuối phiên ngay cả khi người dùng điều hướng khỏi hoặc đóng trang.

    Kích thước phần thân cho các yêu cầu `keepalive` được giới hạn ở 64 kibibyte.

    Mặc định là `false`.

- `method` {{optional_inline}}
  - : [Phương thức yêu cầu](/en-US/docs/Web/HTTP/Reference/Methods).

    Mặc định là {{httpmethod("GET")}}.

- `mode` {{optional_inline}}
  - : Đặt hành vi nguồn gốc chéo cho yêu cầu. Một trong các giá trị:
    - `same-origin`
      - : Không cho phép các yêu cầu nguồn gốc chéo. Kết quả là lỗi mạng.
    - `cors`
      - : Nếu yêu cầu là nguồn gốc chéo, nó sẽ sử dụng cơ chế [Cross-Origin Resource Sharing (CORS)](/en-US/docs/Web/HTTP/Guides/CORS).
    - `no-cors`
      - : Vô hiệu hóa CORS cho các yêu cầu nguồn gốc chéo. Phản hồi sẽ _opaque_, nghĩa là các header và phần thân của nó không khả dụng cho JavaScript.
    - `navigate`
      - : Chỉ được sử dụng bởi điều hướng HTML.

    Mặc định là `cors`.

- `priority` {{optional_inline}}
  - : Chỉ định mức độ ưu tiên của fetch request so với các yêu cầu khác cùng loại. Phải là một trong:
    - `high`
      - : Fetch request ưu tiên cao.
    - `low`
      - : Fetch request ưu tiên thấp.
    - `auto`
      - : Không có sở thích người dùng về mức độ ưu tiên fetch.

    Mặc định là `auto`.

- `privateToken` {{optional_inline}}
  - : Một đối tượng chứa các tùy chọn để khởi tạo thao tác [private state token](/en-US/docs/Web/API/Private_State_Token_API/Using). Các thuộc tính có thể bao gồm:
    - `issuers`
      - : Mảng chuỗi chứa URL của các issuer mà bạn muốn chuyển tiếp redemption record cho.
    - `operation`
      - : Chuỗi đại diện cho loại thao tác token bạn muốn khởi tạo. Thuộc tính bắt buộc. Các giá trị có thể là:
        - `token-request`: Khởi tạo thao tác yêu cầu token.
        - `token-redemption`: Khởi tạo thao tác đổi token.
        - `send-redemption-record`: Khởi tạo thao tác gửi redemption record.
    - `refreshPolicy`
      - : Giá trị liệt kê chỉ định hành vi dự kiến khi redemption record chưa hết hạn đã được đặt trước đó.
        - `none`: Redemption record đã đặt trước đó nên được sử dụng. Đây là giá trị mặc định.
        - `refresh`: Redemption record mới luôn được phát hành.
    - `version`
      - : Số chỉ định phiên bản giao thức mật mã. Thuộc tính bắt buộc. Hiện tại luôn đặt là `1`.

- `redirect` {{optional_inline}}
  - : Xác định hành vi của trình duyệt trong trường hợp server phản hồi với trạng thái chuyển hướng. Một trong:
    - `follow`: Tự động theo dõi chuyển hướng.
    - `error`: Từ chối promise với lỗi mạng khi trạng thái chuyển hướng được trả về.
    - `manual`: Trả về phản hồi với hầu hết các trường bị lọc để cho phép service worker lưu trữ phản hồi.

    Mặc định là `follow`.

- `referrer` {{optional_inline}}
  - : Một chuỗi chỉ định giá trị sử dụng cho header {{httpheader("Referer")}} của yêu cầu.

    Mặc định là `about:client`.

- `referrerPolicy` {{optional_inline}}
  - : Một chuỗi đặt chính sách cho header {{httpheader("Referer")}}.

- `signal` {{optional_inline}}
  - : Một {{domxref("AbortSignal")}}. Nếu tùy chọn này được đặt, yêu cầu có thể bị hủy bằng cách gọi {{domxref("AbortController.abort()", "abort()")}} trên `AbortController` tương ứng.

## Ví dụ

### Truyền tùy chọn vào `fetch()`

Trong ví dụ này, chúng ta truyền các tùy chọn `method`, `body` và `headers` trực tiếp vào lệnh gọi hàm [`fetch()`](/en-US/docs/Web/API/Window/fetch):

```js
async function post() {
  const response = await fetch("https://example.org/post", {
    method: "POST",
    body: JSON.stringify({ username: "example" }),
    headers: {
      "Content-Type": "application/json",
    },
  });

  console.log(response.status);
}
```

### Truyền tùy chọn vào hàm tạo `Request()`

Trong ví dụ này, chúng ta tạo {{domxref("Request")}}, truyền cùng tập hợp tùy chọn vào hàm tạo của nó, sau đó truyền yêu cầu vào `fetch()`:

```js
async function post() {
  const request = new Request("https://example.org/post", {
    method: "POST",
    body: JSON.stringify({ username: "example" }),
    headers: {
      "Content-Type": "application/json",
    },
  });

  const response = await fetch(request);

  console.log(response.status);
}
```

### Truyền tùy chọn vào cả `Request()` và `fetch()`

Trong ví dụ này, chúng ta tạo {{domxref("Request")}}, truyền các tùy chọn `method`, `headers` và `body` vào hàm tạo của nó. Sau đó chúng ta truyền yêu cầu vào `fetch()` cùng với các tùy chọn `body` và `referrer`:

```js
async function post() {
  const request = new Request("https://example.org/post", {
    method: "POST",
    headers: {
      "Content-Type": "application/json",
    },
    body: JSON.stringify({ username: "example1" }),
  });

  const response = await fetch(request, {
    body: JSON.stringify({ username: "example2" }),
    referrer: "",
  });

  console.log(response.status);
}
```

Trong trường hợp này, yêu cầu sẽ được gửi với các tùy chọn sau:

- `method: "POST"`
- `headers: {"Content-Type": "application/json"}`
- `body: '{"username":"example2"}'`
- `referrer: ""`

## Thông số kỹ thuật

{{Specifications}}

## Xem thêm

- [Using Fetch](/en-US/docs/Web/API/Fetch_API/Using_Fetch)
- [ServiceWorker API](/en-US/docs/Web/API/Service_Worker_API)
- [HTTP access control (CORS)](/en-US/docs/Web/HTTP/Guides/CORS)
- [HTTP](/en-US/docs/Web/HTTP)
