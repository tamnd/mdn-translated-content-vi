---
title: "CSPViolationReport: blockedURL property"
short-title: blockedURL
slug: Web/API/CSPViolationReport/blockedURL
page-type: web-api-instance-property
browser-compat: api.ReportingObserver.ReportingObserver.options_parameter.types_property.csp-violation
---

{{APIRef("Reporting API")}}

Thuộc tính **`blockedURL`** của từ điển {{domxref("CSPViolationReport")}} là một chuỗi đại diện cho tài nguyên bị chặn vì vi phạm [Chính sách bảo mật nội dung (CSP)](/en-US/docs/Web/HTTP/Guides/CSP).

## Giá trị

Một chuỗi chứa giá trị hoặc URL đại diện cho tài nguyên vi phạm chính sách.

Nếu giá trị không phải là URL của một tài nguyên, nó phải là một trong các chuỗi sau:

- `inline`
  - : Một tài nguyên nội tuyến. Ví dụ, một script nội tuyến được sử dụng khi [`'unsafe-inline'`](/en-US/docs/Web/HTTP/Reference/Headers/Content-Security-Policy#unsafe-inline) không được chỉ định trong CSP.
- `eval`
  - : Một lệnh `eval()`. Ví dụ, `eval()` được sử dụng nhưng [`'unsafe-eval'`](/en-US/docs/Web/HTTP/Reference/Headers/Content-Security-Policy#unsafe-eval) không được chỉ định trong CSP.
- `wasm-eval`
  - : Một đánh giá Wasm. Ví dụ, `eval()` được sử dụng nhưng [`'wasm-unsafe-eval'`](/en-US/docs/Web/HTTP/Reference/Headers/Content-Security-Policy#wasm-unsafe-eval) không được chỉ định trong CSP.
- `trusted-types-policy`
  - : Một tài nguyên vi phạm chỉ thị CSP [`trusted-types`](/en-US/docs/Web/HTTP/Reference/Headers/Content-Security-Policy/trusted-types). Ví dụ, một {{domxref("TrustedTypePolicy")}} được tạo bằng {{domxref("TrustedTypePolicyFactory/createPolicy", "window.trustedTypes.createPolicy()")}} với tên không được liệt kê trong chỉ thị CSP `trusted-types`.
- `trusted-types-sink`
  - : Một tài nguyên vi phạm chỉ thị CSP [`require-trusted-types-for`](/en-US/docs/Web/HTTP/Reference/Headers/Content-Security-Policy/trusted-types). Ví dụ, chỉ thị được đặt thành `script` nhưng tài liệu không sử dụng {{domxref("TrustedTypePolicy")}} để làm sạch dữ liệu trước khi truyền vào một sink như {{domxref("Element.innerHTML")}}.

## Ví dụ

Các ví dụ sau cho thấy HTML có thể dẫn đến một số giá trị `blockedURL` được mô tả ở trên.

Các ví dụ giả định rằng bạn có tệp JavaScript tên `main.js` được nhập vào script từ cùng miền. Script, được hiển thị bên dưới, tạo một {{domxref("ReportingObserver")}} mới để quan sát các báo cáo vi phạm nội dung thuộc loại `"csp-violation"`. Mỗi lần hàm callback được gọi, chúng ta ghi lại `blockedURL` trong mục đầu tiên của mảng báo cáo.

```js
const observer = new ReportingObserver(
  (reports, observer) => {
    console.log(`blockedURL: ${reports[0].body.blockedURL}`);
  },
  {
    types: ["csp-violation"],
    buffered: true,
  },
);

observer.observe();
```

Lưu ý rằng mặc dù có thể có nhiều báo cáo trong mảng trả về, để ngắn gọn chúng ta chỉ ghi URL bị chặn của báo cáo đầu tiên.

### blockedURL cho tài nguyên bên ngoài

HTML bên dưới đặt chính sách `Content-Security-Policy: default-src 'self'`, chỉ cho phép tải tài nguyên từ cùng trang web, sau đó cố gắng tải một script từ trang web bên ngoài `https://apis.google.com`.

```html
<!doctype html>
<html lang="en">
  <head>
    <meta http-equiv="Content-Security-Policy" content="default-src 'self'" />
    <script src="main.js"></script>
  </head>
  <body>
    <!-- Điều này sẽ tạo ra vi phạm CSP -->
    <script src="https://apis.google.com/js/platform.js"></script>
  </body>
</html>
```

Kết quả ghi ra `blockedURL` sẽ là:

```plain
blockedURL: https://apis.google.com/js/platform.js
```

### blockedURL cho tài nguyên unsafe-inline

HTML bên dưới minh họa các điều kiện dẫn đến `blockedURL` là `inline`. Nó đặt chính sách `Content-Security-Policy: default-src 'self'`, không cho phép thực thi script nội tuyến, gây ra vi phạm vì trang chứa một script nội tuyến.

```html
<!doctype html>
<html lang="en">
  <head>
    <meta http-equiv="Content-Security-Policy" content="default-src 'self'" />
    <script src="main.js"></script>
  </head>
  <body>
    <script>
      const int = 4;
    </script>
  </body>
</html>
```

Kết quả ghi ra `blockedURL` sẽ là:

```plain
blockedURL: inline
```

### blockedURL cho tài nguyên trusted-types-policy

HTML bên dưới minh họa các điều kiện dẫn đến `blockedURL` là `trusted-types-policy`. Đầu tiên nó định nghĩa một chính sách cho phép thực thi script `'unsafe-inline'`, để chúng ta có thể tạo {{domxref("TrustedTypePolicy")}} gây ra vi phạm. Chính sách cũng sử dụng chỉ thị `trusted-types` để chỉ định rằng {{domxref("TrustedTypePolicy")}} với tên `myPolicy` được phép tạo.

```html
<!doctype html>
<html lang="en">
  <head>
    <meta
      http-equiv="Content-Security-Policy"
      content="default-src 'self' 'report-sample' 'unsafe-inline'; trusted-types myPolicy" />
    <script src="main.js"></script>
  </head>

  <body>
    <script>
      const policy = trustedTypes.createPolicy("somePolicy", {
        // Một số mã làm sạch (không đủ)
        createHTML: (string) => string.replace(/</g, "&lt;"),
      });
    </script>
  </body>
</html>
```

Trong script, một chính sách được tạo với tên `somePolicy`.

> [!NOTE]
> Chính sách cụ thể chúng ta định nghĩa ở trên không phải là một chính sách tốt. Mục đích sử dụng trusted types không phải là để thực thi một chính sách _cụ thể_, mà là để yêu cầu thực thi một số chính sách và đảm bảo mã làm sạch ở một nơi dễ xem xét.

Vì tên này không được liệt kê trong chỉ thị `trusted-types`, đây là vi phạm CSP và chúng ta sẽ thấy đầu ra log:

```plain
blockedURL: trusted-types-policy
```

Nếu chúng ta thay đổi tên của chính sách được phép thành `somePolicy`, trang sẽ không còn vi phạm.

### blockedURL cho tài nguyên trusted-types-sink

HTML bên dưới minh họa các điều kiện dẫn đến `blockedURL` là `trusted-types-sink`. Đầu tiên nó định nghĩa một chính sách cho phép thực thi script `'unsafe-inline'`, và như trong ví dụ trước, nó sử dụng chỉ thị `trusted-types` để chỉ định rằng {{domxref("TrustedTypePolicy")}} với tên `myPolicy` được phép tạo.

Ngoài ra, nó chỉ định chỉ thị `require-trusted-types-for 'script'`, yêu cầu các sink chỉ được truyền nội dung đã được làm sạch bằng trusted type.

```html
<!doctype html>
<html lang="en">
  <head>
    <meta
      http-equiv="Content-Security-Policy"
      content="default-src 'self' 'report-sample' 'unsafe-inline'; trusted-types 'myPolicy'; require-trusted-types-for 'script'" />
    <script src="main.js"></script>
  </head>
  <body>
    <input type="text" id="userInput" />
    <button>Update Content</button>
    <div id="content"></div>

    <script>
      function updateContent() {
        const userInput = document.getElementById("userInput").value;

        // Truyền nội dung chưa làm sạch - vi phạm chính sách
        document.getElementById("content").innerHTML = userInput;
      }

      document.querySelector("button").addEventListener("click", updateContent);
    </script>
  </body>
</html>
```

Phương thức `updateContent()` truyền nội dung chưa làm sạch vào thuộc tính `innerHTML` của phần tử, gây ra vi phạm CSP. Chúng ta sẽ thấy đầu ra log:

```plain
blockedURL: trusted-types-sink
```

Để tránh vi phạm, chúng ta cần cập nhật script để định nghĩa một chính sách trusted type và sử dụng nó để làm sạch đầu vào được truyền vào phần tử:

```js
const policy = trustedTypes.createPolicy("myPolicy", {
  // Một số mã làm sạch (không đủ)
  createHTML: (string) => string.replace(/</g, "&lt;"),
});

function updateContent() {
  const userInput = document.getElementById("userInput").value;
  const sanitizedInput = policy.createHTML(userInput);
  document.getElementById("content").innerHTML = sanitizedInput;
}
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("SecurityPolicyViolationEvent.blockedURI")}}
