---
title: "SharedWorker: constructor SharedWorker()"
short-title: SharedWorker()
slug: Web/API/SharedWorker/SharedWorker
page-type: web-api-constructor
browser-compat: api.SharedWorker.SharedWorker
---

{{APIRef("Web Workers API")}}

> [!WARNING]
> Tập lệnh được truyền vào phần tử `url` sẽ được thực thi.
> Các API như thế này được gọi là [injection sinks](/en-US/docs/Web/API/Trusted_Types_API#concepts_and_usage), và có thể là vector cho các cuộc tấn công [cross-site scripting (XSS)](/en-US/docs/Web/Security/Attacks/XSS).
>
> Bạn có thể giảm thiểu rủi ro này bằng cách có [Content Security Policy (CSP)](/en-US/docs/Web/HTTP/Guides/CSP) giới hạn các vị trí mà từ đó tập lệnh có thể được tải, và luôn gán các đối tượng {{domxref("TrustedScriptURL")}} thay vì chuỗi và [enforcing trusted types](/en-US/docs/Web/API/Trusted_Types_API#using_a_csp_to_enforce_trusted_types).
> Xem [Security considerations](/en-US/docs/Web/API/Worker/Worker#security_considerations) trong constructor `Worker()` để biết thêm thông tin.

Constructor **`SharedWorker()`** tạo một đối tượng {{domxref("SharedWorker")}} thực thi tập lệnh tại URL đã chỉ định.

## Cú pháp

```js-nolint
new SharedWorker(url)
new SharedWorker(url, name)
new SharedWorker(url, options)
```

### Tham số

- `url`
  - : Một đối tượng {{domxref("TrustedScriptURL")}} hoặc một chuỗi đại diện cho URL của tập lệnh hoặc mô-đun mà worker sẽ thực thi.
    URL này phải có cùng nguồn gốc với tài liệu của người gọi, hoặc là URL `blob:` hoặc `data:`.
    URL được giải quyết tương đối so với vị trí của trang HTML hiện tại.
- `name` {{optional_inline}}
  - : Một chuỗi chỉ định một tên định danh cho {{domxref("SharedWorkerGlobalScope")}} đại diện cho phạm vi của worker, hữu ích cho việc tạo các instance mới của cùng một `SharedWorker` và gỡ lỗi.
- `options` {{optional_inline}}
  - : Một đối tượng chứa các thuộc tính tùy chọn có thể thiết lập khi tạo instance của đối tượng.
    Các thuộc tính khả dụng như sau:
    - `type`
      - : Một chuỗi chỉ định loại worker sẽ tạo.
        Giá trị có thể là `classic` hoặc `module`.
        Giá trị mặc định được sử dụng là `classic`.
    - `credentials`
      - : Một chuỗi chỉ định việc trình duyệt có gửi thông tin xác thực khi nhập mô-đun vào một module worker hay không.
        Các giá trị được phép giống với giá trị có thể truyền cho [`fetch()` request](/en-US/docs/Web/API/RequestInit#credentials): `omit`, `same-origin`, hoặc `include`.
        Giá trị mặc định là `same-origin` (chỉ bao gồm thông tin xác thực cho các yêu cầu cùng nguồn gốc).

        Thuộc tính này bị bỏ qua đối với classic worker.

    - `name`
      - : Một chuỗi chỉ định một
        tên định danh cho {{domxref("SharedWorkerGlobalScope")}} đại diện cho phạm vi của worker, chủ yếu hữu ích cho mục đích gỡ lỗi.
    - `sameSiteCookies`
      - : Một chuỗi cho biết [`SameSite cookies`](/en-US/docs/Web/HTTP/Reference/Headers/Set-Cookie#samesitesamesite-value) nào sẽ khả dụng cho worker.
        Có thể có một trong hai giá trị sau:
        - 'all'
          - : Cookie `SameSite=Strict`, `SameSite=Lax` và `SameSite=None` sẽ đều khả dụng cho worker.
            Tùy chọn này chỉ được hỗ trợ trong ngữ cảnh của bên thứ nhất (first-party), và là giá trị mặc định trong ngữ cảnh của bên thứ nhất.
        - 'none'
          - : Chỉ cookie `SameSite=None` sẽ khả dụng cho worker.
            Tùy chọn này được hỗ trợ trong ngữ cảnh của bên thứ nhất và bên thứ ba, và là giá trị mặc định trong ngữ cảnh của bên thứ ba.

### Ngoại lệ

- `SecurityError` {{domxref("DOMException")}}
  - : Ném ra nếu tài liệu không được phép khởi động worker, ví dụ: nếu URL có cú pháp không hợp lệ hoặc nếu chính sách same-origin bị vi phạm, hoặc nếu giá trị `sameSiteCookies` không được hỗ trợ trong ngữ cảnh đã cho.
- `NetworkError` {{domxref("DOMException")}}
  - : Ném ra nếu MIME type của tập lệnh worker không chính xác.
    Nó phải _luôn luôn_ là `text/javascript` (vì lý do lịch sử [các JavaScript MIME type khác](/en-US/docs/Web/HTTP/Guides/MIME_types#textjavascript) có thể được chấp nhận).
- `SyntaxError` {{domxref("DOMException")}}
  - : Ném ra nếu `url` không thể được phân tích cú pháp.
- `TypeError`
  - : Ném ra nếu tham số `url` là một chuỗi khi [Trusted Types](/en-US/docs/Web/API/Trusted_Types_API) được [enforced bởi CSP](/en-US/docs/Web/API/Trusted_Types_API#using_a_csp_to_enforce_trusted_types) và không có default policy nào được định nghĩa.

## Mô tả

Constructor **`SharedWorker()`** tạo một đối tượng {{domxref("SharedWorker")}} thực thi classic script hoặc module tại URL đã chỉ định.

Tập lệnh phải có [same-origin](/en-US/docs/Web/Security/Defenses/Same-origin_policy) với tài liệu được liên kết, nhưng có thể tự nhập các tập lệnh hoặc mô-đun có nguồn gốc khác (cross-origin) (nếu được phép bởi CORS và các giới hạn khác).
Nếu cần một cross-origin worker, người dùng phải tải nó từ một same-origin worker trung gian hoặc từ blob.

Để biết thêm thông tin, xem [Description](/en-US/docs/Web/API/Worker/Worker#description) trong constructor `Worker()`.

## Ví dụ

Để ngắn gọn, các ví dụ sau đây không sử dụng [Trusted Types](/en-US/docs/Web/API/Trusted_Types_API).
Trong production, mã của bạn nên luôn sử dụng trusted types khi truyền dữ liệu bắt nguồn từ người dùng vào các injection sinks.

Để biết ví dụ, hãy xem [Using Trusted Types](/en-US/docs/Web/API/Worker/Worker#using_trusted_types) trong các ví dụ về constructor `Worker()`.

### Sử dụng cơ bản

Đoạn mã sau đây cho thấy việc tạo một đối tượng {{domxref("SharedWorker")}} bằng constructor `SharedWorker()` và cách sử dụng đối tượng sau đó:

```js
const myWorker = new SharedWorker("worker.js");

myWorker.port.start();

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

Để biết ví dụ đầy đủ, hãy xem [ví dụ về shared worker cơ bản của chúng tôi](https://github.com/mdn/dom-examples/tree/main/web-workers/simple-shared-worker) ([chạy shared worker](https://mdn.github.io/dom-examples/web-workers/simple-shared-worker/).)

## Specifications

{{Specifications}}

## Browser compatibility

{{Compat}}

## Xem thêm

- Giao diện {{domxref("SharedWorker")}} mà nó thuộc về.
