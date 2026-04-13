---
title: "ServiceWorkerContainer: phương thức register()"
short-title: register()
slug: Web/API/ServiceWorkerContainer/register
page-type: web-api-instance-method
browser-compat: api.ServiceWorkerContainer.register
---

{{APIRef("Service Workers API")}}{{SecureContext_Header}}{{AvailableInWorkers}}

> [!WARNING]
> Tham số `scriptURL` được truyền vào phương thức này đại diện cho URL của một script bên ngoài được tải vào service worker.
> Các API như thế này được gọi là [injection sinks](/en-US/docs/Web/API/Trusted_Types_API#concepts_and_usage), và có thể là vector cho các cuộc tấn công [cross-site scripting (XSS)](/en-US/docs/Web/Security/Attacks/XSS).
>
> Bạn có thể giảm thiểu rủi ro này bằng cách sử dụng [Content Security Policy (CSP)](/en-US/docs/Web/HTTP/Guides/CSP) để hạn chế các vị trí mà script có thể được tải từ đó, và luôn gán các đối tượng {{domxref("TrustedScriptURL")}} thay vì chuỗi và [enforcing trusted types](/en-US/docs/Web/API/Trusted_Types_API#using_a_csp_to_enforce_trusted_types).
> Xem [Cân nhắc bảo mật](#security_considerations) để biết thêm thông tin.

Phương thức **`register()`** của giao diện {{domxref("ServiceWorkerContainer")}} tạo hoặc cập nhật một {{domxref("ServiceWorkerRegistration")}} cho scope đã cho.

## Cú pháp

```js-nolint
register(scriptURL)
register(scriptURL, options)
```

### Tham số

- `scriptURL`
  - : Một instance {{domxref("TrustedScriptURL")}} hoặc một chuỗi xác định URL của script service worker.
    Tệp service worker đã đăng ký cần được phục vụ với [JavaScript media type](/en-US/docs/Web/HTTP/Guides/MIME_types#textjavascript) hợp lệ.
- `options` {{optional_inline}}
  - : Một đối tượng chứa các tùy chọn đăng ký. Các tùy chọn hiện có là:
    - `scope`
      - : Một chuỗi đại diện cho URL xác định phạm vi đăng ký của service worker; nghĩa là, dải URL mà service worker có thể kiểm soát.

        Thông thường, đây là URL tương đối so với URL cơ sở của trang web (ví dụ: `/some/path/`), để scope đã giải quyết là như nhau bất kể mã đăng ký được gọi từ trang nào.
        `scope` mặc định cho một đăng ký service worker là thư mục chứa script service worker đó (giải resolves `./` so với `scriptURL`).

        Scope nên được sử dụng để chỉ định các tài liệu nằm trong cùng thư mục hoặc được lồng sâu hơn service worker.
        Nếu bạn cần scope rộng hơn, điều này có thể được cho phép thông qua header {{HTTPHeader("Service-Worker-Allowed")}} HTTP.
        Xem phần [Ví dụ](#examples) để biết thông tin về cách mở rộng scope mặc định của service worker.

    - `type`
      - : Một chuỗi chỉ định loại worker cần tạo.
        Các giá trị hợp lệ là:
        - `'classic'`
          - : Service worker được tải là một script tiêu chuẩn.
            Đây là mặc định.
        - `'module'`
          - : Service worker được tải là một [ES module](/en-US/docs/Web/JavaScript/Guide/Modules) và câu lệnh import khả dụng trong các ngữ cảnh worker.
            Để biết thông tin tương thích ES module, xem [bảng dữ liệu tương thích trình duyệt cho giao diện `ServiceWorker`](/en-US/docs/Web/API/ServiceWorker#browser_compatibility).

    - `updateViaCache`
      - : Một chuỗi cho biết cách bộ nhớ đệm HTTP được sử dụng cho các tài nguyên script service worker trong quá trình cập nhật.
        Lưu ý: Điều này chỉ áp dụng cho script service worker và các import của nó, không áp dụng cho các tài nguyên khác được các script này fetch.
        - `'all'`
          - : Bộ nhớ đệm HTTP sẽ được truy vấn cho script chính và tất cả các script import. Nếu không tìm thấy mục mới trong bộ nhớ đệm HTTP, các script sẽ được fetch từ mạng.
        - `'imports'`
          - : Bộ nhớ đệm HTTP sẽ được truy vấn cho các import, nhưng script chính sẽ luôn được cập nhật từ mạng. Nếu không tìm thấy mục mới trong bộ nhớ đệm HTTP cho các import, chúng sẽ được fetch từ mạng.
        - `'none'`
          - : Bộ nhớ đệm HTTP sẽ không được sử dụng cho script chính hoặc các import của nó. Tất cả tài nguyên script service worker sẽ được cập nhật từ mạng.

### Giá trị trả về

Một {{jsxref("Promise")}} resolve với một đối tượng {{domxref("ServiceWorkerRegistration")}}.

### Ngoại lệ

- `TypeError`
  - : `scriptURL` hoặc `scope URL` không hợp lệ.
    Điều này có thể xảy ra nếu URL không thể phân giải thành URL hợp lệ hoặc sử dụng scheme không phải là `http:` hoặc `https:`.
    Nó cũng có thể xảy ra nếu `scriptURL` không phải là một {{domxref("TrustedScriptURL")}}, và đây là yêu cầu của Trusted Types Policy của trang web.

    Ngoại lệ cũng được raises nếu đường dẫn `scriptURL` hoặc `scope URL` chứa "%2f" (`/`) hoặc "%5c" (`\`) không phân biệt hoa thường.

- `SecurityError` {{domxref("DOMException")}}
  - : `scriptURL` không phải là origin đáng tin cậy tiềm năng, chẳng hạn như `localhost` hoặc URL `https`.
    `scriptURL` và scope không cùng origin với trang đăng ký.

## Mô tả

Phương thức **`register()`** tạo hoặc cập nhật một {{domxref("ServiceWorkerRegistration")}} cho scope đã cho.
Nếu thành công, việc đăng ký liên kết URL script được cung cấp với một _scope_, sau đó được sử dụng để khớp tài liệu với một service worker cụ thể.

Một registration duy nhất được tạo cho mỗi scope duy nhất.
Nếu `register()` được gọi cho một scope đã có registration tồn tại, registration sẽ được cập nhật với mọi thay đổi về scriptURL hoặc tùy chọn.
Nếu không có thay đổi nào, thì registration hiện tại sẽ được trả về.
Việc gọi `register()` với cùng scope và `scriptURL` không khởi động lại quá trình cài đặt, vì vậy nhìn chung an toàn khi gọi phương thức này một cách vô điều kiện từ một trang được kiểm soát.
Tuy nhiên, nó sẽ gửi một yêu cầu mạng cho script service worker, điều này có thể tạo thêm tải cho máy chủ.
Nếu đây là mối lo ngại, bạn có thể kiểm tra registration hiện tại trước bằng cách sử dụng {{domxref("ServiceWorkerContainer.getRegistration()")}}.

Một tài liệu có thể nằm trong scope của nhiều registration với các service worker và tùy chọn khác nhau.
Trình duyệt sẽ liên kết tài liệu với registration phù hợp có scope cụ thể nhất.
Điều này đảm bảo chỉ một service worker chạy cho mỗi tài liệu.

> [!NOTE]
> Nhìn chung, việc không định nghĩa các registration có scope chồng lấn sẽ an toàn hơn.

### Cân nhắc bảo mật

Tham số `scriptURL` chỉ định script cho service worker, có thể chặn các yêu cầu mạng cho các trang trong scope của nó và trả về các phản hồi mới, từ bộ nhớ đệm, mới hoặc đã sửa đổi.
Nếu đầu vào được cung cấp bởi người dùng, đây là vector tiềm năng cho các cuộc tấn công [cross-site scripting (XSS)](/en-US/docs/Web/Security/Attacks/XSS).

Việc chấp nhận và thực thi các URL tùy ý từ các origin không đáng tin cậy là cực kỳ rủi ro.
Một trang web nên kiểm soát những script nào được phép chạy bằng cách sử dụng [Content Security Policy (CSP)](/en-US/docs/Web/HTTP/Guides/CSP) với directive [`worker-src`](/en-US/docs/Web/HTTP/Reference/Headers/Content-Security-Policy/worker-src) (hoặc fallback được định nghĩa trong [`script-src`](/en-US/docs/Web/HTTP/Reference/Headers/Content-Security-Policy/script-src) hoặc [`default-src`](/en-US/docs/Web/HTTP/Reference/Headers/Content-Security-Policy/default-src)).
Điều này có thể hạn chế script chỉ từ origin hiện tại, hoặc một tập hợp các origin cụ thể, hoặc thậm chí các tệp cụ thể.

Nếu bạn đang sử dụng thuộc tính này và [enforcing trusted types](/en-US/docs/Web/API/Trusted_Types_API#using_a_csp_to_enforce_trusted_types) (sử dụng directive CSP [`require-trusted-types-for`](/en-US/docs/Web/HTTP/Reference/Headers/Content-Security-Policy/require-trusted-types-for)), bạn sẽ cần luôn gán các đối tượng {{domxref("TrustedScriptURL")}} thay vì chuỗi.
Điều này đảm bảo đầu vào được chuyển qua một hàm biến đổi, có cơ hội từ chối hoặc sửa đổi URL trước khi nó được inject.

## Ví dụ

Các ví dụ dưới đây nên được đọc cùng nhau để hiểu cách scope của service worker áp dụng cho một trang.

Lưu ý rằng ví dụ đầu tiên cho thấy cách sử dụng phương thức với trusted types.
Các ví dụ khác bỏ qua bước này để ngắn gọn.

### Sử dụng TrustedScriptURL

Để giảm thiểu rủi ro XSS, chúng ta nên luôn gán các instance `TrustedScriptURL` cho tham số `scriptURL`.
Chúng ta cũng cần làm điều này nếu đang enforcing trusted types vì lý do khác và muốn cho phép một số nguồn script đã được phép (bởi `CSP: worker-src`).

Trusted types chưa được hỗ trợ trên tất cả trình duyệt, vì vậy trước tiên chúng ta định nghĩa [trusted types tinyfill](/en-US/docs/Web/API/Trusted_Types_API#trusted_types_tinyfill).
Điều này hoạt động như một sự thay thế trong suốt cho trusted types JavaScript API:

```js
if (typeof trustedTypes === "undefined")
  trustedTypes = { createPolicy: (n, rules) => rules };
```

Tiếp theo, chúng ta tạo một {{domxref("TrustedTypePolicy")}} định nghĩa phương thức {{domxref("TrustedTypePolicy/createScriptURL", "createScriptURL()")}} để biến đổi chuỗi đầu vào thành các instance {{domxref("TrustedScriptURL")}}.

Với mục đích của ví dụ này, chúng ta giả sử muốn cho phép một tập hợp URL đã định nghĩa trước trong mảng `scriptAllowList` và ghi log bất kỳ script nào khác.

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

Sau đó, chúng ta sử dụng đối tượng `policy` để tạo một đối tượng `TrustedScriptURL` từ một chuỗi đầu vào có khả năng không an toàn:

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

### Đăng ký một service worker với scope mặc định

Ví dụ sau sử dụng giá trị mặc định của `scope` bằng cách bỏ qua nó, đặt nó cùng vị trí với URL script.

Giả sử mã service worker ở `example.com/sw.js`, và mã đăng ký ở `example.com/index.html`.
Mã service worker sẽ kiểm soát `example.com/index.html`, cũng như các trang bên dưới nó, như `example.com/product/description.html`.

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

Lưu ý rằng chúng ta đã đăng ký `scriptURL` tương đối so với root của trang web thay vì trang hiện tại.
Điều này cho phép cùng mã đăng ký được sử dụng từ bất kỳ trang nào.

### Đăng ký một service worker với scope mặc định rõ ràng

Mã dưới đây gần như giống hệt, ngoại trừ chúng ta đã chỉ định scope rõ ràng bằng `{ scope: "/" }`.
Chúng ta đã chỉ định scope là tương đối trang web để cùng mã đăng ký có thể được sử dụng từ bất kỳ đâu trong trang web.

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

Scope này giống như scope mặc định, nên việc đăng ký áp dụng cho chính xác các trang như ví dụ trước.
Lưu ý rằng nếu chúng ta chạy mã này sau ví dụ trước, trình duyệt sẽ nhận ra rằng chúng ta đang cập nhật một registration hiện tại thay vì một registration mới.

### Đăng ký một service worker sử dụng URL tương đối trang

Không có gì ngăn bạn sử dụng URL tương đối trang ngoại trừ việc điều này khiến việc di chuyển trang trở nên khó khăn hơn, và dễ dàng tạo ra các registration không mong muốn nếu bạn làm vậy.

Trong ví dụ này, mã service worker ở `example.com/product/sw.js`, và mã đăng ký ở `example.com/product/description.html`.
Chúng ta đang sử dụng các URL tương đối so với thư mục hiện tại cho `scriptURL` và `scope`, trong đó thư mục hiện tại là URL cơ sở của trang gọi `register()` (`example.com/product/`).
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

### Sử dụng Service-Worker-Allowed để tăng scope của service worker

Một service worker không thể có scope rộng hơn vị trí của nó, trừ khi máy chủ chỉ định scope tối đa rộng hơn trong header {{HTTPHeader("Service-Worker-Allowed")}} trên script service worker.
Sử dụng tùy chọn `scope` khi bạn cần scope _hẹp hơn_ mặc định.

Mã sau đây, nếu được đưa vào `example.com/index.html`, tại root của một trang web, sẽ chỉ áp dụng cho các tài nguyên dưới `example.com/product`.

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

Như đã lưu ý ở trên, máy chủ có thể thay đổi scope mặc định bằng cách đặt header `Service-Worker-Allowed` trên script service worker.
Điều này cho phép tùy chọn `scope` được đặt bên ngoài đường dẫn xác định bởi vị trí của service worker.

Mã sau đây, nếu được đưa vào `example.com/product/index.html`, sẽ áp dụng cho tất cả tài nguyên dưới `example.com` nếu máy chủ đặt header `Service-Worker-Allowed` thành `/` hoặc `https://example.com/` khi phục vụ `sw.js`. Nếu máy chủ không đặt header, việc đăng ký service worker sẽ thất bại, vì `scope` được yêu cầu quá rộng.

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
- [Service Worker API](/en-US/docs/Web/API/Service_Worker_API)
- [Sử dụng service workers](/en-US/docs/Web/API/Service_Worker_API/Using_Service_Workers)
- Header HTTP {{HTTPHeader("Service-Worker-Allowed")}}
