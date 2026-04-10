---
title: "Worker: hàm tạo Worker()"
short-title: Worker()
slug: Web/API/Worker/Worker
page-type: web-api-constructor
browser-compat: api.Worker.Worker
---

{{APIRef("Web Workers API")}}{{AvailableInWorkers("window_and_worker_except_service")}}

> [!WARNING]
> Script được truyền vào phần tử `url` sẽ được thực thi.
> Các API như thế này được gọi là [injection sinks](/en-US/docs/Web/API/Trusted_Types_API#concepts_and_usage), và có khả năng là vector cho các cuộc tấn công [cross-site scripting (XSS)](/en-US/docs/Web/Security/Attacks/XSS).
>
> Bạn có thể giảm thiểu rủi ro này bằng cách có [Content Security Policy (CSP)](/en-US/docs/Web/HTTP/Guides/CSP) hạn chế các vị trí mà script có thể được tải từ đó, và luôn gán các đối tượng {{domxref("TrustedScriptURL")}} thay vì chuỗi và [thực thi trusted types](/en-US/docs/Web/API/Trusted_Types_API#using_a_csp_to_enforce_trusted_types).
> Xem [Cân nhắc bảo mật](#security_considerations) để biết thêm thông tin.

Hàm tạo **`Worker()`** tạo một đối tượng {{domxref("Worker")}} thực thi classic script hoặc module tại URL được chỉ định.

## Cú pháp

```js-nolint
new Worker(url)
new Worker(url, options)
```

### Tham số

- `url`
  - : Một đối tượng {{domxref("TrustedScriptURL")}} hoặc một chuỗi đại diện cho URL của script hoặc module mà worker sẽ thực thi.

    URL này phải cùng nguồn gốc với tài liệu của trình gọi, hoặc là URL `blob:` hoặc `data:`.
    URL được giải quyết tương đối so với vị trí của trang HTML hiện tại.

- `options` {{optional_inline}}
  - : Một đối tượng chứa các thuộc tính tùy chọn có thể được thiết lập khi tạo instance.
    Các thuộc tính khả dụng như sau:
    - `credentials`
      - : Một chuỗi chỉ định việc trình duyệt có gửi credentials khi import các module vào module worker hay không.
        Các giá trị cho phép giống như có thể truyền cho [`fetch()` request](/en-US/docs/Web/API/RequestInit#credentials): `omit`, `same-origin`, hoặc `include`.
        Mặc định là `same-origin` (chỉ bao gồm credentials cho các request cùng nguồn gốc).

        Tham số này bị bỏ qua cho các classic worker.

    - `name`
      - : Một chuỗi chỉ định tên định danh cho {{domxref("DedicatedWorkerGlobalScope")}} đại diện cho phạm vi của worker, chủ yếu hữu ích cho mục đích gỡ lỗi.
    - `type`
      - : Một chuỗi chỉ định loại worker cần tạo.
        Giá trị có thể là `classic` hoặc `module`.
        Mặc định là `classic`.

### Ngoại lệ

- `NetworkError` {{domxref("DOMException")}}
  - : Ném ra nếu MIME type của script worker không chính xác.
    Nó _luôn_ phải là `text/javascript` (vì lý do lịch sử [các kiểu JavaScript MIME khác](/en-US/docs/Web/HTTP/Guides/MIME_types#legacy_javascript_mime_types) có thể được chấp nhận).
- `SecurityError` {{domxref("DOMException")}}
  - : Ném ra nếu tài liệu không được phép khởi tạo workers, ví dụ: nếu URL có cú pháp không hợp lệ hoặc nếu chính sách same-origin bị vi phạm.
- `SyntaxError` {{domxref("DOMException")}}
  - : Ném ra nếu `url` không thể phân tích cú pháp.
- `TypeError`
  - : Ném ra nếu tham số `url` là một chuỗi khi [Trusted Types](/en-US/docs/Web/API/Trusted_Types_API) được [thực thi bởi CSP](/en-US/docs/Web/API/Trusted_Types_API#using_a_csp_to_enforce_trusted_types) và không có policy mặc định nào được định nghĩa.

## Mô tả

Hàm tạo **`Worker()`** tạo một đối tượng {{domxref("Worker")}} thực thi classic script hoặc module tại URL được chỉ định.

Script phải [cùng nguồn gốc](/en-US/docs/Web/Security/Defenses/Same-origin_policy) với tài liệu liên quan, nhưng có thể tự import các script hoặc module chéo nguồn gốc (nếu được phép bởi CORS và các hạn chế khác).
Nếu cần một worker chéo nguồn gốc, người dùng phải tải nó từ một worker cùng nguồn gốc trung gian hoặc từ blob.

### Module và classic workers

Một classic worker là worker được tạo từ một classic script, trong khi một module worker được tạo từ một [ECMAScript module](/en-US/docs/Web/JavaScript/Guide/Modules).
Loại worker ảnh hưởng đến các tùy chọn constructor của worker, cách script worker được tải và cách nó được thực thi.

Đoạn mã dưới đây hiển thị hai cách bạn có thể tạo một classic worker, và cách bạn chỉ định `type` là `"module"` để tạo một module worker.
Trong cả hai trường hợp, script phải cùng nguồn gốc với tài liệu tải và được giải quyết tương đối so với vị trí của tài liệu khởi tạo.

```js
// Tạo một classic worker
const worker1 = new Worker("worker_classic.js");
const worker2 = new Worker("worker_classic.js", {
  type: "classic",
});

// Tạo một module worker
const worker3 = new Worker("worker_module.js", {
  type: "module",
});
```

Module workers và các dependency của chúng được tải và thực thi bằng cách sử dụng ngữ nghĩa ECMAScript module:

- Các dependency được import qua các [`câu lệnh import`](/en-US/docs/Web/JavaScript/Reference/Statements/import) tĩnh
- Được tải bất đồng bộ sử dụng [CORS](/en-US/docs/Web/HTTP/Guides/CORS).
- Tất cả các module được giải quyết trước khi bất kỳ mã nào được thực thi
- Phải được phục vụ với kiểu media `Content-Type: text/javascript`
- Được thực thi trong {{glossary("Strict mode")}}

Classic workers được tải và thực thi dưới dạng script:

- Các dependency được import bằng phương thức {{domxref("WorkerGlobalScope.importScripts()")}}
- Được tải đồng bộ trong chế độ `no-cors`

### Import scripts hoặc modules

Module workers có thể import [ECMAScript modules](/en-US/docs/Web/JavaScript/Guide/Modules) bằng cách sử dụng [`câu lệnh import`](/en-US/docs/Web/JavaScript/Reference/Statements/import).
Các module được tải bằng CORS, vì vậy các module chéo nguồn gốc phải được phục vụ với tiêu đề {{httpheader("Access-Control-Allow-Origin")}} để có thể tải.
Nhà phát triển có thể chỉ định có gửi credentials trong các import chéo nguồn gốc hay không.

Classic workers có thể import scripts (nhưng không phải modules) bằng phương thức {{domxref("WorkerGlobalScope.importScripts()")}}.
Không giống như modules, scripts được tải trong chế độ `no-cors`, và có thể được request chéo nguồn gốc ngay cả khi server không thiết lập các tiêu đề CORS phù hợp.
Credentials được gửi cho các import cùng nguồn gốc, nhưng thường không được gửi cho các request chéo nguồn gốc.

Ngoài ra, nếu tài liệu có [Content Security Policy (CSP)](/en-US/docs/Web/HTTP/Guides/CSP), nó phải cho phép các nguồn gốc của các scripts hoặc modules được import.
Đối với modules, các nguồn được phép được chỉ định trong `worker-src` (với fallback sang `script-src` và `default-src`), trong khi đối với classic scripts, các nguồn được chỉ định trong `script-src` (với fallback sang `default-src`).

### URL `data:` và `blob:`

URL `data:` có thể được truyền vào tham số `url`, nhưng có một [opaque_origin](/en-US/docs/Glossary/Origin#opaque_origin), khiến chúng chéo nguồn gốc với tất cả các nguồn gốc khác bao gồm cả chủ sở hữu của chúng.

Do đó, trong khi worker vẫn có thể giao tiếp với chủ sở hữu bằng `postMessage()`, khả năng truy cập các tài nguyên bên ngoài khác bị hạn chế nghiêm ngặt.
Ví dụ: một request `fetch()` của worker sẽ là chéo nguồn gốc so với trang web của chính nó, và bất kỳ request nào tới bất kỳ nguồn gốc nào phải được cấp bởi CORS.

URL `blob:` nên được sử dụng thay thế, khi có thể, vì URL kế thừa nguồn gốc của tài liệu đã tạo ra nó.
Điều này đảm bảo rằng một worker được tạo bằng URL `blob:` có cùng nguồn gốc với trang đã tạo ra nó.
Lưu ý rằng nếu bạn đang sử dụng [Content Security Policy (CSP)](/en-US/docs/Web/HTTP/Guides/CSP) để hạn chế những tài nguyên có thể được tải vào worker của bạn, bạn sẽ cần cho phép nguồn gốc `blob:`.

### Cân nhắc về Bundler

Các bundler như [webpack](https://webpack.js.org/guides/web-workers/), [Vite](https://vite.dev/guide/features.html#web-workers), và [Parcel](https://parceljs.org/languages/javascript/#web-workers), khuyến nghị truyền các URL tương đối so với [`import.meta.url`](/en-US/docs/Web/JavaScript/Reference/Operators/import.meta#url) vào hàm tạo `Worker()`.

Ví dụ:

```js
const myWorker = new Worker(new URL("worker.js", import.meta.url));
```

Điều này làm cho đường dẫn tương đối so với script hiện tại thay vì trang HTML hiện tại, cho phép bundler thực hiện an toàn các tối ưu hóa như đổi tên (bởi vì nếu không URL `worker.js` có thể trỏ đến một tệp không được kiểm soát bởi bundler, nên nó không thể đưa ra bất kỳ giả định nào).

### Cân nhắc bảo mật

Script hoặc module được chỉ định bởi tham số `url` được thực thi trong ngữ cảnh web worker, và có thể tự import các scripts cùng nguồn gốc và chéo nguồn gốc khác.
Nếu `url` được cung cấp bởi người dùng, đây là một vector tiềm ẩn cho các cuộc tấn công [cross-site scripting (XSS)](/en-US/docs/Web/Security/Attacks/XSS).

Mặc dù web workers không có quyền truy cập trực tiếp vào tài liệu hoặc window sở hữu, việc chấp nhận và thực thi các URL tùy ý từ các nguồn gốc không đáng tin cậy vẫn cực kỳ rủi ro.
Đối với module workers, nhưng không phải classic workers, CORS sẽ kiểm soát những tài nguyên chéo nguồn gốc nào có thể được request.

Một trang web cũng nên kiểm soát những script nào được phép chạy bằng cách sử dụng [Content Security Policy (CSP)](/en-US/docs/Web/HTTP/Guides/CSP) với chỉ thị [`worker-src`](/en-US/docs/Web/HTTP/Reference/Headers/Content-Security-Policy/worker-src) (hoặc fallback sang [`child-src`](/en-US/docs/Web/HTTP/Reference/Headers/Content-Security-Policy/child-src), [`script-src`](/en-US/docs/Web/HTTP/Reference/Headers/Content-Security-Policy/script-src), hoặc [`default-src`](/en-US/docs/Web/HTTP/Reference/Headers/Content-Security-Policy/default-src)).
Điều này có thể hạn chế scripts chỉ từ nguồn gốc hiện tại, hoặc một tập hợp nguồn gốc cụ thể, hoặc thậm chí các tệp cụ thể.

Nếu bạn đang sử dụng thuộc tính này và [thực thi trusted types](/en-US/docs/Web/API/Trusted_Types_API#using_a_csp_to_enforce_trusted_types) (sử dụng chỉ thị CSP [`require-trusted-types-for`](/en-US/docs/Web/HTTP/Reference/Headers/Content-Security-Policy/require-trusted-types-for)), bạn sẽ cần luôn gán các đối tượng {{domxref("TrustedScriptURL")}} thay vì chuỗi.
Điều này đảm bảo rằng đầu vào được truyền qua một hàm biến đổi, có cơ hội từ chối hoặc sửa đổi các URL cần thiết bởi worker trước khi chúng được tải.

## Ví dụ

Để ngắn gọn, chỉ ví dụ đầu tiên dưới đây sử dụng trusted types.
Trong production, mã của bạn nên luôn sử dụng trusted types khi truyền dữ liệu có nguồn gốc từ người dùng vào injection sinks.

### Sử dụng Trusted Types

Để giảm thiểu rủi ro XSS, chúng ta nên luôn truyền các instance `TrustedScriptURL` vào URL của worker thay vì chuỗi.
Chúng ta cũng cần làm điều này nếu chúng ta đang thực thi trusted types vì các lý do khác và chúng ta muốn cho phép một số nguồn đã được phép (bởi `CSP: worker-src`).

Trusted types chưa được hỗ trợ trên tất cả các trình duyệt, vì vậy đầu tiên chúng ta định nghĩa [trusted types tinyfill](/en-US/docs/Web/API/Trusted_Types_API#trusted_types_tinyfill).
Điều này hoạt động như một sự thay thế trong suốt cho JavaScript API của trusted types:

```js
if (typeof trustedTypes === "undefined")
  trustedTypes = { createPolicy: (n, rules) => rules };
```

Tiếp theo, chúng ta tạo một {{domxref("TrustedTypePolicy")}} định nghĩa một phương thức {{domxref("TrustedTypePolicy/createScriptURL", "createScriptURL()")}} để biến đổi các chuỗi đầu vào thành các instance {{domxref("TrustedScriptURL")}}.

Vì mục đích của ví dụ này, chúng ta sẽ giả sử rằng chúng ta muốn cho phép một tập hợp các URL đã được định nghĩa trước trong mảng `workerScriptAllowList` và ghi lại bất kỳ script nào khác.

```js
const workerScriptAllowList = [
  // Một số danh sách các URL được phép
];
const policy = trustedTypes.createPolicy("worker-url-policy", {
  createScriptURL(input) {
    if (workerScriptAllowList.includes(input)) {
      return input; // cho phép script
    }
    console.log(`Script không có trong workerScriptAllowList: ${input}`);
    return ""; // Chặn script
  },
});
```

Tiếp theo, chúng ta sử dụng đối tượng `policy` của chúng ta để tạo một đối tượng `trustedScriptURL` từ một chuỗi đầu vào có khả năng không an toàn và truyền điều này vào worker.

```js
// URL worker có khả năng độc hại
// Chúng ta sẽ không bao gồm untrustedScript trong mảng workerScriptAllowList của chúng ta
const untrustedScriptURL = "https://evil.example.com/naughty.js";

// Tạo một instance TrustedScriptURL bằng cách sử dụng policy
const trustedScriptURL = policy.createScriptURL(untrustedScriptURL);

// Tạo worker với URL đã được tin cậy
const myWorker = new Worker(trustedScriptURL);
```

### Tạo một classic worker

Đoạn mã sau đây hiển thị việc tạo một đối tượng {{domxref("Worker")}} classic bằng cách sử dụng hàm tạo `Worker()`, và việc sử dụng đối tượng sau đó:

```js
const myWorker = new Worker("worker.js");
const first = document.querySelector("input#number1");

first.onchange = () => {
  myWorker.postMessage(first.value);
  console.log("Message posted to worker");
};
```

Để biết ví dụ đầy đủ, xem [ví dụ dedicated worker cơ bản](https://github.com/mdn/dom-examples/tree/main/web-workers/simple-web-worker) ([chạy dedicated worker](https://mdn.github.io/dom-examples/web-workers/simple-web-worker/)).

### Tải một module worker chéo nguồn gốc từ blob

Ví dụ này hiển thị một phương thức có thể tải và thực thi một script module worker chéo nguồn gốc và sau đó tải nó vào worker của bạn dưới dạng blob (một classic script có thể được tải theo cùng cách):

```js
async function loadWorker() {
  const response = await fetch("https://other_origin.com/worker.js");
  const script = await response.text();

  // Tạo một blob chứa script đã tải, và sau đó tạo một URL từ blob đó
  const blob = new Blob([script], { type: "application/javascript" });
  const workerUrl = URL.createObjectURL(blob);

  try {
    const worker = new Worker(workerUrl, { type: "module" });
  } catch (e) {
    console.error(`Module worker chéo nguồn gốc không tải được: ${e}`);
  }
}
loadWorker();
```

Ban đầu, fetch được thực hiện với CORS, và vì vậy phản hồi `other_origin.com` sẽ cần bao gồm tiêu đề {{httpheader("Access-Control-Allow-Origin")}} như hiển thị:

```http
Access-Control-Allow-Origin "https://my_origin.com"
```

Ngoài ra, nếu bạn đang sử dụng CSP, bạn sẽ cần cho phép nguồn gốc `blob:` cho `worker-src` để nó có thể được tải vào tài liệu:

```http
Content-Security-Policy worker-src 'self' https://other_origin.com blob:
```

## Đặc tả kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

## Xem thêm

- {{domxref("Worker")}}
- [Trusted Types API](/en-US/docs/Web/API/Trusted_Types_API)
