---
title: "ServiceWorkerContainer: phương thức register()"
short-title: register()
slug: Web/API/ServiceWorkerContainer/register
page-type: web-api-instance-method
browser-compat: api.ServiceWorkerContainer.register
---

{{APIRef("Service Workers API")}}{{SecureContext_Header}}{{AvailableInWorkers}}

> [!WARNING]
> Tham số `scriptURL` được truyền vào phương thức này đại diện cho URL của một tập lệnh bên ngoài được tải vào service worker.
> Các API như thế này được gọi là [injection sinks](/en-US/docs/Web/API/Trusted_Types_API#concepts_and_usage), và có khả năng là vector cho các cuộc tấn công [cross-site scripting (XSS)](/en-US/docs/Web/Security/Attacks/XSS).
>
> Bạn có thể giảm thiểu rủi ro này bằng cách có [Content Security Policy (CSP)](/en-US/docs/Web/HTTP/Guides/CSP) giới hạn các vị trí mà tập lệnh có thể được tải từ đó, và luôn gán các đối tượng {{domxref("TrustedScriptURL")}} thay vì chuỗi và [enforcing trusted types](/en-US/docs/Web/API/Trusted_Types_API#using_a_csp_to_enforce_trusted_types).
> Xem [Cân nhắc bảo mật](#security_considerations) để biết thêm thông tin.

Phương thức **`register()`** của giao diện {{domxref("ServiceWorkerContainer")}} tạo hoặc cập nhật một {{domxref("ServiceWorkerRegistration")}} cho phạm vi đã cho.

## Cú pháp

```js-nolint
register(scriptURL)
register(scriptURL, options)
```

### Tham số

- `scriptURL`
  - : Một thể hiện {{domxref("TrustedScriptURL")}} hoặc một chuỗi xác định URL của tập lệnh service worker.
    Tệp service worker đã đăng ký cần được phục vụ với [JavaScript media type](/en-US/docs/Web/HTTP/Guides/MIME_types#textjavascript) hợp lệ.
- `options` {{optional_inline}}
  - : Một đối tượng chứa các tùy chọn đăng ký. Các tùy chọn khả dụng hiện tại là:
    - `scope`
      - : Một chuỗi đại diện cho một URL xác định phạm vi đăng ký của service worker; nghĩa là, phạm vi URL nào service worker có thể điều khiển.

        Đây thường được chỉ định là một URL tương đối so với URL cơ sở của trang web (ví dụ: `/some/path/`), để phạm vi được giải quyết giống nhau bất kể trang nào gọi mã đăng ký.
        `scope` mặc định cho đăng ký service worker là thư mục chứa tập lệnh service worker (giải quyết `./` so với `scriptURL`).

        Phạm vi nên được sử dụng để chỉ định các tài liệu nằm trong cùng thư mục hoặc lồng sâu hơn service worker.
        Nếu bạn cần phạm vi rộng hơn, điều này có thể được cho phép thông qua tiêu đề HTTP {{HTTPHeader("Service-Worker-Allowed")}}.
        Xem phần [Ví dụ](#examples) để biết thông tin về cách mở rộng phạm vi mặc định của service worker.

    - `type`
      - : Một chuỗi xác định loại worker cần tạo.
        Các giá trị hợp lệ là:
        - `'classic'`
          - : Service worker được tải là một tập lệnh chuẩn.
            Đây là mặc định.
        - `'module'`
          - : Service worker được tải nằm trong [ES module](/en-US/docs/Web/JavaScript/Guide/Modules) và câu lệnh import khả dụng trong các ngữ cảnh worker.
            Để biết thông tin tương thích ES module, xem [bảng dữ liệu tương thích trình duyệt cho giao diện `ServiceWorker`](/en-US/docs/Web/API/ServiceWorker#browser_compatibility).

    - `updateViaCache`
      - : Một chuỗi cho biết cách bộ nhớ đệm HTTP được sử dụng cho các tài nguyên tập lệnh service worker trong quá trình cập nhật.
        Lưu ý: Điều này chỉ đề cập đến tập lệnh service worker và các nhập của nó, không phải các tài nguyên khác được lấy bởi các tập lệnh này.
        - `'all'`
          - : Bộ nhớ đệm HTTP sẽ được truy vấn cho tập lệnh chính và tất cả các tập lệnh được nhập. Nếu không tìm thấy mục mới trong bộ nhớ đệm HTTP, thì các tập lệnh được lấy từ mạng.
        - `'imports'`
          - : Bộ nhớ đệm HTTP sẽ được truy vấn cho các nhập, nhưng tập lệnh chính sẽ luôn được cập nhật từ mạng. Nếu không tìm thấy mục mới trong bộ nhớ đệm HTTP cho các nhập, chúng được lấy từ mạng.
        - `'none'`
          - : Bộ nhớ đệm HTTP sẽ không được sử dụng cho tập lệnh chính hoặc các nhập của nó. Tất cả tài nguyên tập lệnh service worker sẽ được cập nhật từ mạng.

### Giá trị trả về

Một {{jsxref("Promise")}} giải quyết với một đối tượng {{domxref("ServiceWorkerRegistration")}}.

### Ngoại lệ

- `TypeError`
  - : `scriptURL` hoặc `scope URL` không hợp lệ.
    Điều này có thể xảy ra nếu URL không thể được giải quyết thành một URL hợp lệ hoặc sử dụng scheme không phải `http:` hoặc `https`.
    Nó cũng có thể xảy ra nếu `scriptURL` không phải là một {{domxref("TrustedScriptURL")}}, và đây là yêu cầu của [Trusted Types Policy](/en-US/docs/Web/API/Trusted_Types_API) của trang web.

    Ngoại lệ cũng được ném ra nếu đường dẫn `scriptURL` hoặc `scope URL` chứa "%2f" (`*`) hoặc "%5c" (`=`) không phân biệt hoa thường.

- `SecurityError` {{domxref("DOMException")}}
  - : `scriptURL` không phải là một nguồn gốc đáng tin cậy tiềm năng, chẳng hạn như `localhost` hoặc URL `https`.
    `scriptURL` và scope không cùng nguồn gốc với trang đăng ký.

## Mô tả

Phương thức **`register()`** tạo hoặc cập nhật một {{domxref("ServiceWorkerRegistration")}} cho phạm vi đã cho.
Nếu thành công, việc đăng ký liên kết URL tập lệnh được cung cấp với một _scope_, sau đó được sử dụng để khớp tài liệu với một service worker cụ thể.

Một đăng ký duy nhất được tạo cho mỗi phạm vi duy nhất.
Nếu `register()` được gọi cho một phạm vi đã có đăng ký hiện tại, đăng ký được cập nhật với mọi thay đổi về scriptURL hoặc tùy chọn.
Nếu không có thay đổi nào, thì đăng ký hiện tại được trả về.
Việc gọi `register()` với cùng scope và `scriptURL` không khởi động lại quá trình cài đặt, vì vậy nhìn chung an toàn khi gọi phương thức này một cách vô điều kiện từ một trang được điều khiển.
Tuy nhiên, nó gửi một yêu cầu mạng cho tập lệnh service worker, có thể tăng tải cho máy chủ.
Nếu đây là mối quan tâm, bạn có thể kiểm tra đăng ký hiện tại trước bằng cách sử dụng {{domxref("ServiceWorkerContainer.getRegistration()")}}.

Một tài liệu có khả năng nằm trong phạm vi của một số đăng ký với các service workers và tùy chọn khác nhau.
Trình duyệt sẽ liên kết tài liệu với đăng ký khớp có phạm vi cụ thể nhất.
Điều này đảm bảo chỉ một service worker chạy cho mỗi tài liệu.

> [!NOTE]
> Nhìn chung an toàn hơn khi không định nghĩa các đăng ký có phạm vi chồng chéo.

### Cân nhắc bảo mật

Tham số `scriptURL` chỉ định tập lệnh cho service worker, có thể chặn các yêu cầu mạng cho các trang trong phạm vi của nó và trả về các phản hồi mới, từ bộ nhớ đệm, hoặc đã sửa đổi.
Nếu đầu vào được cung cấp bởi người dùng, đây là một vector tiềm năng cho các cuộc tấn công [cross-site scripting (XSS)](/en-US/docs/Web/Security/Attacks/XSS).

Việc chấp nhận và thực thi các URL tùy ý từ các nguồn gốc không đáng tin cậy là cực kỳ rủi ro.
Một trang web nên kiểm soát những tập lệnh nào được phép chạy bằng cách sử dụng [Content Security Policy (CSP)](/en-US/docs/Web/HTTP/Guides/CSP) với chỉ thị [`worker-src`](/en-US/docs/Web/HTTP/Reference/Headers/Content-Security-Policy/worker-src) (hoặc dự phòng được định nghĩa trong [`script-src`](/en-US/docs/Web/HTTP/Reference/Headers/Content-Security-Policy/script-src) hoặc [`default-src`](/en-US/docs/Web/HTTP/Reference/Headers/Content-Security-Policy/default-src)).
Điều này có thể giới hạn tập lệnh từ nguồn gốc hiện tại, hoặc một tập hợp nguồn gốc cụ thể, hoặc thậm chí các tệp cụ thể.

Nếu bạn đang sử dụng thuộc tính này và [enforcing trusted types](/en-US/docs/Web/API/Trusted_Types_API#using_a_csp_to_enforce_trusted_types) (sử dụng chỉ thị CSP [`require-trusted-types-for`](/en-US/docs/Web/HTTP/Reference/Headers/Content-Security-Policy/require-trusted-types-for)), bạn sẽ cần luôn gán các đối tượng {{domxref("TrustedScriptURL")}} thay vì chuỗi.
Điều này đảm bảo đầu vào được truyền qua một hàm biến đổi, có cơ hội từ chối hoặc sửa đổi URL trước khi được tiêm.

## Ví dụ

Các ví dụ dưới đây nên được đọc cùng nhau để hiểu cách phạm vi service worker áp dụng cho một trang.

Lưu ý ví dụ đầu tiên cho thấy cách sử dụng phương thức với trusted types.
Các ví dụ khác bỏ qua bước này cho ngắn gọn.

### Sử dụng TrustedScriptURL

Để giảm thiểu rủi ro XSS, chúng ta nên luôn gán các thể hiện `TrustedScriptURL` cho tham số `scriptURL`.
Chúng ta cũng cần làm điều này nếu đang enforcing trusted types vì lý do khác và muốn cho phép một số nguồn tập lệnh đã được cho phép (bởi `CSP: worker-src`).

Trusted types chưa được hỗ trợ trên tất cả trình duyệt, nên trước tiên chúng ta định nghĩa [trusted types tinyfill](/en-US/docs/Web/API/Trusted_Types_API#trusted_types_tinyfill).
Điều này hoạt động như một sự thay thế minh bạch cho JavaScript API trusted types:

```js
if (typeof trustedTypes === "undefined")
  trustedTypes = { createPolicy: (n, rules) => rules };
```

Tiếp theo chúng ta tạo một {{domxref("TrustedTypePolicy")}} định nghĩa phương thức {{domxref("TrustedTypePolicy/createScriptURL", "createScriptURL()")}} để biến đổi chuỗi đầu vào thành các thể hiện {{domxref("TrustedScriptURL")}}.

Trong ví dụ này, giả sử chúng ta muốn cho phép một tập hợp URL đã định nghĩa trước trong mảng `scriptAllowList` và ghi log bất kỳ tập lệnh nào khác.

```js
const scriptAllowList = [
  // Some list of allowed URLs
];
const policy = trustedTypes.createPolicy("script-url-policy", {
  createScriptURL(input) {
    if (scriptAllowList.includes(input)) {
      return input; // allow the script
    }
    console.log(`Script not in scriptAllowList: ${input}`);
    return ""; // Block the script
  },
});
```

Sau đó chúng ta sử dụng đối tượng `policy` để tạo một đối tượng `TrustedScriptURL` từ chuỗi đầu vào có khả năng không an toàn:

```js
// The potentially malicious string
// We won't be including untrustedScript in our scriptAllowList array
const untrustedScript = "https://evil.example.com/service_worker.js";

// Create a TrustedScriptURL instance using the policy
const trustedScriptURL = policy.createScriptURL(untrustedScript);
```

Bây giờ chúng ta có thể truyền đối tượng `TrustedScriptURL` vào `register()`:

```js
navigator.serviceWorker.register(trustedScriptURL);
```

### Đăng ký service worker với scope mặc định

Ví dụ sau sử dụng giá trị mặc định của `scope` bằng cách bỏ qua nó, đặt nó ở cùng vị trí với URL tập lệnh.

Giả sử mã service worker ở `example.com/sw.js`, và mã đăng ký ở `example.com/index.html`.
Mã service worker sẽ điều khiển `example.com/index.html`, cũng như các trang bên dưới nó, như `example.com/product/description.html`.

```js
if ("serviceWorker" in navigator) {
  // Register a service worker hosted at the root of the
  // site using the default scope.
  navigator.serviceWorker.register("/sw.js").then(
    (registration) => {
      console.log("Service worker registration succeeded:", registration);
    },
    (error) => {
      console.error(`Service worker registration failed: ${error}`);
    },
  );
} else {
  console.error("Service workers are not supported.");
}
```

Lưu ý rằng chúng ta đã đăng ký `scriptURL` tương đối so với gốc trang web thay vì trang hiện tại.
Điều này cho phép cùng mã đăng ký được sử dụng từ bất kỳ trang nào.

### Đăng ký service worker với scope mặc định rõ ràng

Mã dưới đây gần như giống hệt, ngoại trừ chúng ta đã chỉ định scope rõ ràng bằng `{ scope: "/" }`.
Chúng ta đã chỉ định scope tương đối so với trang web để cùng mã đăng ký có thể được sử dụng từ bất kỳ đâu trong trang web.

```js
if ("serviceWorker" in navigator) {
  // declaring scope manually
  navigator.serviceWorker.register("./sw.js", { scope: "/" }).then(
    (registration) => {
      console.log("Service worker registration succeeded:", registration);
    },
    (error) => {
      console.error(`Service worker registration failed: ${error}`);
    },
  );
} else {
  console.error("Service workers are not supported.");
}
```

Scope này giống với scope mặc định, nên đăng ký áp dụng cho chính xác các trang như ví dụ trước.
Lưu ý nếu chúng ta chạy mã này sau ví dụ trước, trình duyệt sẽ nhận ra rằng chúng ta đang cập nhật một đăng ký hiện có chứ không phải một đăng ký mới.

### Đăng ký service worker bằng các URL tương đối trang

Không có gì ngăn bạn sử dụng các URL tương đối trang ngoại trừ việc này làm cho việc di chuyển trang trở nên khó khăn hơn, và dễ vô tình tạo ra các đăng ký không mong muốn nếu bạn làm vậy.

Trong ví dụ này mã service worker ở `example.com/product/sw.js`, và mã đăng ký ở `example.com/product/description.html`.
Chúng ta đang sử dụng các URL tương đối so với thư mục hiện tại cho `scriptURL` và `scope`, trong đó thư mục hiện tại là URL cơ sở của trang đang gọi `register()` (`example.com/product/`).
Service worker áp dụng cho các tài nguyên dưới `example.com/product/`.

```js
if ("serviceWorker" in navigator) {
  // declaring scope manually
  navigator.serviceWorker.register("./sw.js", { scope: "./" }).then(
    (registration) => {
      console.log("Service worker registration succeeded:", registration);
    },
    (error) => {
      console.error(`Service worker registration failed: ${error}`);
    },
  );
} else {
  console.error("Service workers are not supported.");
}
```

### Sử dụng Service-Worker-Allowed để tăng phạm vi service worker

Một service worker không thể có phạm vi rộng hơn vị trí của chính nó, trừ khi máy chủ chỉ định phạm vi tối đa rộng hơn trong tiêu đề {{HTTPHeader("Service-Worker-Allowed")}} trên tập lệnh service worker.
Sử dụng tùy chọn `scope` khi bạn cần phạm vi _hẹp hơn_ mặc định.

Mã sau đây, nếu được bao gồm trong `example.com/index.html`, tại gốc của một trang web, sẽ chỉ áp dụng cho các tài nguyên dưới `example.com/product`.

```js
if ("serviceWorker" in navigator) {
  // declaring scope manually
  navigator.serviceWorker.register("./sw.js", { scope: "/product/" }).then(
    (registration) => {
      console.log("Service worker registration succeeded:", registration);
    },
    (error) => {
      console.error(`Service worker registration failed: ${error}`);
    },
  );
} else {
  console.error("Service workers are not supported.");
}
```

Như đã lưu ý ở trên, máy chủ có thể thay đổi phạm vi mặc định bằng cách thiết lập tiêu đề `Service-Worker-Allowed` trên tập lệnh service worker.
Điều này cho phép tùy chọn `scope` được đặt bên ngoài đường dẫn được xác định bởi vị trí của service worker.

Mã sau đây, nếu được bao gồm trong `example.com/product/index.html`, sẽ áp dụng cho tất cả tài nguyên dưới `example.com` nếu máy chủ thiết lập tiêu đề `Service-Worker-Allowed` thành `/` hoặc `https://example.com/` khi phục vụ `sw.js`. Nếu máy chủ không thiết lập tiêu đề, đăng ký service worker sẽ thất bại, vì `scope` được yêu cầu quá rộng.

```js
if ("serviceWorker" in navigator) {
  // Declaring a broadened scope
  navigator.serviceWorker.register("./sw.js", { scope: "/" }).then(
    (registration) => {
      // The registration succeeded because the Service-Worker-Allowed header
      // had set a broadened maximum scope for the service worker script
      console.log("Service worker registration succeeded:", registration);
    },
    (error) => {
      // This happens if the Service-Worker-Allowed header doesn't broaden the scope
      console.error(`Service worker registration failed: ${error}`);
    },
  );
} else {
  console.error("Service workers are not supported.");
}
```

## Đặc tả kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Phương thức `unregister()` của ServiceWorkerRegistration](/en-US/docs/Web/API/ServiceWorkerRegistration/unregister)
- [Service worker API](/en-US/docs/Web/API/Service_Worker_API)
- [Sử dụng service workers](/en-US/docs/Web/API/Service_Worker_API/Using_Service_Workers)
- Tiêu đề HTTP {{HTTPHeader("Service-Worker-Allowed")}}
