---
title: "SVGScriptElement: thuộc tính href"
short-title: href
slug: Web/API/SVGScriptElement/href
page-type: web-api-instance-property
browser-compat: api.SVGScriptElement.href
---

{{APIRef("SVG")}}

> [!WARNING]
> Thuộc tính [`href.baseVal`](/en-US/docs/Web/API/SVGAnimatedString/baseVal) đại diện cho URL của một script bên ngoài được tải vào phần tử script SVG.
> Các API như thế này được gọi là [injection sinks](/en-US/docs/Web/API/Trusted_Types_API#concepts_and_usage) và có thể là vector cho các cuộc tấn công [cross-site scripting (XSS)](/en-US/docs/Web/Security/Attacks/XSS).
>
> Bạn có thể giảm thiểu rủi ro này bằng cách có [Content Security Policy (CSP)](/en-US/docs/Web/HTTP/Guides/CSP) giới hạn các vị trí mà script có thể được tải, và bằng cách luôn gán các đối tượng {{domxref("TrustedScriptURL")}} thay vì chuỗi, và [enforcing trusted types](/en-US/docs/Web/API/Trusted_Types_API#using_a_csp_to_enforce_trusted_types). Xem [Lưu ý bảo mật](#security_considerations) để biết thêm thông tin.

Thuộc tính chỉ đọc **`href`** của giao diện {{domxref("SVGScriptElement")}} phản ánh thuộc tính {{SVGAttr("href")}} hoặc {{SVGAttr("xlink:href")}} {{deprecated_inline}} của phần tử {{SVGElement("script")}} đã cho.

## Giá trị

Một đối tượng {{domxref("SVGAnimatedString")}}.

## Mô tả

Thuộc tính **`href`** phản ánh thuộc tính {{SVGAttr("href")}} hoặc {{SVGAttr("xlink:href")}} {{deprecated_inline}} của phần tử {{SVGElement("script")}} đã cho.
Thuộc tính có thể được thay đổi bằng cách đặt [`href.baseVal`](/en-US/docs/Web/API/SVGAnimatedString/baseVal) (`href.animVal` là chỉ đọc và phản chiếu giá trị của `baseVal`).

### Lưu ý bảo mật

Thuộc tính `href.baseVal` được dùng để tải và chạy các script bên ngoài.
Nếu SVG được khai báo inline, script được tải sẽ chạy trong ngữ cảnh của trang hiện tại và do đó có thể thực hiện bất kỳ điều gì mà code website của bạn có thể làm (ngay cả khi URL không cùng nguồn gốc với trang của bạn).
Nếu đầu vào được cung cấp bởi người dùng, đây là một vector có thể dẫn đến các cuộc tấn công [cross-site scripting (XSS)](/en-US/docs/Web/Security/Attacks/XSS).

Việc chấp nhận và thực thi các URL tùy ý từ các nguồn không đáng tin cậy là cực kỳ rủi ro.
Một website nên kiểm soát các script được phép chạy bằng cách sử dụng [Content Security Policy (CSP)](/en-US/docs/Web/HTTP/Guides/CSP) với chỉ thị [`script-src`](/en-US/docs/Web/HTTP/Reference/Headers/Content-Security-Policy/script-src) (hoặc dự phòng được định nghĩa trong [`default-src`](/en-US/docs/Web/HTTP/Reference/Headers/Content-Security-Policy/default-src)).
Điều này có thể giới hạn script chỉ từ nguồn gốc hiện tại, một tập hợp các nguồn gốc cụ thể, hoặc thậm chí các file cụ thể.

Nếu bạn đang sử dụng thuộc tính này và [enforcing trusted types](/en-US/docs/Web/API/Trusted_Types_API#using_a_csp_to_enforce_trusted_types) (sử dụng chỉ thị CSP [`require-trusted-types-for`](/en-US/docs/Web/HTTP/Reference/Headers/Content-Security-Policy/require-trusted-types-for)), bạn sẽ cần luôn gán các đối tượng {{domxref("TrustedScriptURL")}} thay vì chuỗi.
Điều này đảm bảo rằng đầu vào được truyền qua một hàm chuyển đổi, có cơ hội từ chối hoặc sửa đổi URL trước khi tài nguyên được tải.

## Ví dụ

### Truy cập thuộc tính `href`

```html
<svg xmlns="http://www.w3.org/2000/svg" width="400" height="200">
  <script id="myScript" href="script.js"></script>
</svg>
```

```js
const scriptElement = document.getElementById("myScript");

// Truy cập thuộc tính href
console.log(scriptElement.href.baseVal); // Đầu ra: "script.js"
```

### Đặt thuộc tính `href.baseVal`

Để giảm thiểu rủi ro XSS, chúng ta nên luôn gán các instance `TrustedScriptURL` cho thuộc tính `baseVal`.
Chúng ta cũng cần làm điều này nếu chúng ta đang enforcing trusted types vì các lý do khác và muốn cho phép một số nguồn script đã được cấp phép (bởi `CSP: script-src`).

Trusted types chưa được hỗ trợ trên tất cả các trình duyệt, vì vậy trước tiên chúng ta định nghĩa [trusted types tinyfill](/en-US/docs/Web/API/Trusted_Types_API#trusted_types_tinyfill).
Nó hoạt động như một sự thay thế minh bạch cho trusted types JavaScript API:

```js
if (typeof trustedTypes === "undefined")
  trustedTypes = { createPolicy: (n, rules) => rules };
```

Tiếp theo chúng ta tạo một {{domxref("TrustedTypePolicy")}} định nghĩa phương thức {{domxref("TrustedTypePolicy/createScriptURL", "createScriptURL()")}} để chuyển đổi chuỗi đầu vào thành các instance {{domxref("TrustedScriptURL")}}.

Trong ví dụ này, chúng ta giả định rằng chúng ta muốn cho phép một tập hợp URL được xác định trước trong mảng `scriptAllowList`, và ghi lại bất kỳ script nào khác.

```js
const scriptAllowList = [
  // Một số danh sách URL được phép
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

Tiếp theo chúng ta định nghĩa một SVG và phần tử script tương tự, như trong ví dụ trước, và lấy phần tử mà chúng ta sẽ inject URL vào.

```html
<svg xmlns="http://www.w3.org/2000/svg" width="400" height="200">
  <script id="aScriptElement" href="example.js"></script>
</svg>
```

```js
// Lấy phần tử script mà chúng ta sẽ inject URL vào
const scriptElement = document.getElementById("aScriptElement");
```

Sau đó chúng ta sử dụng đối tượng `policy` để tạo đối tượng `trustedScriptURL` từ chuỗi đầu vào có thể không an toàn, và gán kết quả cho thuộc tính `href.baseVal` của phần tử:

```js
// Chuỗi có khả năng độc hại
// Chúng ta sẽ không bao gồm untrustedScript trong mảng scriptAllowList của chúng ta
const untrustedScriptURL = "https://evil.example.com/naughty.js";

// Tạo instance TrustedScriptURL bằng cách sử dụng policy
const trustedScriptURL = policy.createScriptURL(untrustedScriptURL);

// Inject TrustedScriptURL (chứa URL đáng tin cậy)
scriptElement.href.baseVal = trustedScriptURL;
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
