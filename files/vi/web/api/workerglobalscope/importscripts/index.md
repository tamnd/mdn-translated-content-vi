---
title: "WorkerGlobalScope: phương thức importScripts()"
short-title: importScripts()
slug: Web/API/WorkerGlobalScope/importScripts
page-type: web-api-instance-method
browser-compat: api.WorkerGlobalScope.importScripts
---

{{APIRef("Web Workers API")}}{{AvailableInWorkers("worker")}}

> [!WARNING]
> Các tham số được truyền vào phương thức này đại diện cho các URL của classic scripts cần được import vào một worker.
> Các API như thế này được gọi là [injection sinks](/en-US/docs/Web/API/Trusted_Types_API#concepts_and_usage), và có khả năng là vector cho các cuộc tấn công [cross-site scripting (XSS)](/en-US/docs/Web/Security/Attacks/XSS).
>
> Bạn có thể giảm thiểu rủi ro này bằng cách có [Content Security Policy (CSP)](/en-US/docs/Web/HTTP/Guides/CSP) hạn chế các vị trí mà scripts có thể được tải từ đó, và luôn gán các đối tượng {{domxref("TrustedScriptURL")}} thay vì chuỗi và [thực thi trusted types](/en-US/docs/Web/API/Trusted_Types_API#using_a_csp_to_enforce_trusted_types).
> Xem [Cân nhắc bảo mật](#security_considerations) để biết thêm thông tin.

Phương thức **`importScripts()`** của giao diện {{domxref("WorkerGlobalScope")}} import đồng bộ một hoặc nhiều scripts vào phạm vi của một [classic worker](/en-US/docs/Web/API/Worker/Worker#module_and_classic_workers) (một worker được tạo từ một classic script).

Lưu ý rằng phương thức không thể được sử dụng trong [module workers](/en-US/docs/Web/API/Worker/Worker#module_and_classic_workers), thay vào đó tải các dependency bằng cách sử dụng [`câu lệnh import`](/en-US/docs/Web/JavaScript/Reference/Statements/import).

## Cú pháp

```js-nolint
importScripts(url0)
importScripts(url0, url1)
importScripts(url0, url1, /* …, */ urlN)
```

### Tham số

- `urlN`
  - : Một instance {{domxref("TrustedScriptURL")}} hoặc một chuỗi đại diện cho URL của script cần được import.
    URL có thể là tuyệt đối hoặc tương đối.
    Nếu URL là tương đối, nó tương đối so với URL của script worker entry.

### Giá trị trả về

Không có ({{jsxref("undefined")}}).

### Ngoại lệ

- `NetworkError`
  - : Các scripts được import được phục vụ mà không có kiểu media (MIME) `text/javascript` hoặc không có một trong các [kiểu JavaScript MIME kế thừa được phép](/en-US/docs/Web/HTTP/Guides/MIME_types#legacy_javascript_mime_types).
- {{jsxref("SyntaxError")}}
  - : Ném ra nếu bất kỳ URL nào không thể giải quyết được.
- {{jsxref("TypeError")}}
  - : Ném ra nếu {{domxref("WorkerGlobalScope")}} hiện tại là một module (sử dụng [`import`](/en-US/docs/Web/JavaScript/Reference/Statements/import) thay thế).
    Nó cũng có thể xảy ra nếu bất kỳ tham số nào không phải là {{domxref("TrustedScriptURL")}} và trang web đang [thực thi trusted types](/en-US/docs/Web/API/Trusted_Types_API#using_a_csp_to_enforce_trusted_types).

## Mô tả

Phương thức **`importScripts()`** import đồng bộ một hoặc nhiều scripts vào phạm vi của một classic worker.

Không giống như script module classic ban đầu, phải cùng nguồn gốc với tài liệu của nó, phương thức này có thể import các scripts chéo nguồn gốc trừ khi bị chặn bởi {{httpheader("Cross-Origin-Resource-Policy")}}, [Content Security Policy (CSP)](/en-US/docs/Web/HTTP/Guides/CSP), hoặc một cơ chế bảo mật khác.
Lưu ý rằng vì classic scripts được tải trong chế độ `no-cors`, chúng có thể được tải chéo nguồn gốc ngay cả khi server không thiết lập các tiêu đề CORS phù hợp.

### Cân nhắc bảo mật

Các tham số chỉ định các scripts cần được import vào phạm vi của một classic worker.
Nếu các URL cho scripts được cung cấp bởi người dùng, đây là một vector tiềm ẩn cho các cuộc tấn công [cross-site scripting (XSS)](/en-US/docs/Web/Security/Attacks/XSS).

Việc chấp nhận và thực thi các URL tùy ý từ các nguồn gốc không đáng tin cậy là cực kỳ rủi ro.
Một trang web nên kiểm soát những scripts nào được phép chạy bằng cách sử dụng [Content Security Policy (CSP)](/en-US/docs/Web/HTTP/Guides/CSP) với chỉ thị [`script-src`](/en-US/docs/Web/HTTP/Reference/Headers/Content-Security-Policy/worker-src) (hoặc fallback được định nghĩa trong [`default-src`](/en-US/docs/Web/HTTP/Reference/Headers/Content-Security-Policy/default-src)).
Điều này có thể hạn chế scripts chỉ từ nguồn gốc hiện tại, hoặc một tập hợp nguồn gốc cụ thể, hoặc thậm chí các tệp cụ thể.

Nếu bạn đang sử dụng thuộc tính này và [thực thi trusted types](/en-US/docs/Web/API/Trusted_Types_API#using_a_csp_to_enforce_trusted_types) (sử dụng chỉ thị CSP [`require-trusted-types-for`](/en-US/docs/Web/HTTP/Reference/Headers/Content-Security-Policy/require-trusted-types-for)), bạn sẽ cần luôn gán các đối tượng {{domxref("TrustedScriptURL")}} thay vì chuỗi.
Điều này đảm bảo rằng đầu vào được truyền qua một hàm biến đổi, có cơ hội từ chối hoặc sửa đổi URL trước khi nó được inject.

## Ví dụ

### Sử dụng cơ bản

Nếu bạn có một số chức năng được viết trong một script riêng gọi là `foo.js` trong cùng thư mục với `worker.js`, bạn có thể import nó vào worker bằng dòng sau:

```js
importScripts("foo.js");
```

`importScripts()` và `self.importScripts()` thực chất tương đương — cả hai đều đại diện cho `importScripts()` được gọi từ bên trong phạm vi bên trong của worker.

Lưu ý rằng trong phần tiếp theo, chúng tôi sẽ chỉ cho bạn cách truyền một `TrustedScriptURL` thay vì một chuỗi.
Điều này đã được bỏ qua trong ví dụ này để ngắn gọn, nhưng được khuyến nghị trong mã production.

### Sử dụng TrustedScriptURL

Để giảm thiểu rủi ro XSS, chúng ta nên luôn gán các instance `TrustedScriptURL` cho mỗi tham số.
Chúng ta cũng cần làm điều này nếu chúng ta đang thực thi trusted types vì các lý do khác và chúng ta muốn cho phép một số nguồn script đã được phép (ví dụ, bởi `CSP: script-src`).

Trusted types chưa được hỗ trợ trên tất cả các trình duyệt, vì vậy đầu tiên chúng ta định nghĩa [trusted types tinyfill](/en-US/docs/Web/API/Trusted_Types_API#trusted_types_tinyfill).
Điều này hoạt động như một sự thay thế trong suốt cho trusted types JavaScript API:

```js
if (typeof trustedTypes === "undefined")
  trustedTypes = { createPolicy: (n, rules) => rules };
```

Tiếp theo, chúng ta tạo một {{domxref("TrustedTypePolicy")}} định nghĩa một phương thức {{domxref("TrustedTypePolicy/createScriptURL", "createScriptURL()")}} để biến đổi các chuỗi đầu vào thành các instance {{domxref("TrustedScriptURL")}}.

Vì mục đích của ví dụ này, chúng ta sẽ giả sử rằng chúng ta muốn cho phép một tập hợp các URL đã được định nghĩa trước trong mảng `scriptAllowList` và ghi lại bất kỳ scripts nào khác.

```js
const scriptAllowList = [
  // Một số danh sách các URL được phép
];
const policy = trustedTypes.createPolicy("script-url-policy", {
  createScriptURL(input) {
    if (scriptAllowList.includes(input)) {
      return input; // cho phép script
    }
    console.log(`Script không có trong scriptAllowList: ${input}`);
    return ""; // Chặn script
  },
});
```

Sau đó, chúng ta sử dụng đối tượng `policy` để tạo một đối tượng `TrustedScript` từ một chuỗi đầu vào có khả năng không an toàn:

```js
// Chuỗi có khả năng độc hại
// Chúng ta sẽ không bao gồm untrustedScript trong mảng scriptAllowList của chúng ta
const untrustedScript = "https://evil.example.com/import_worker.js";

// Tạo một instance TrustedScriptURL bằng cách sử dụng policy
const trustedScriptURL = policy.createScriptURL(untrustedScript);
```

Đối tượng `TrustedScriptURL` bây giờ có thể được sử dụng khi import script trong một classic worker:

```js
importScripts(trustedScriptURL);
```

## Đặc tả kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

## Xem thêm

- {{domxref("WorkerGlobalScope")}}
