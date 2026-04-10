---
title: "ShadowRoot: thuộc tính innerHTML"
short-title: innerHTML
slug: Web/API/ShadowRoot/innerHTML
page-type: web-api-instance-property
browser-compat: api.ShadowRoot.innerHTML
---

{{APIRef("Shadow DOM")}}

> [!WARNING]
> Thuộc tính này phân tích đầu vào của nó như HTML và ghi kết quả vào DOM.
> Các API như thế này được biết đến như [injection sink](/en-US/docs/Web/API/Trusted_Types_API#concepts_and_usage), và có thể là một vector cho các cuộc tấn công [cross-site scripting (XSS)](/en-US/docs/Web/Security/Attacks/XSS) nếu đầu vào ban đầu đến từ kẻ tấn công.
>
> Bạn có thể giảm thiểu rủi ro này bằng cách luôn gán đối tượng `TrustedHTML` thay vì chuỗi và [ép buộc trusted types](/en-US/docs/Web/API/Trusted_Types_API#using_a_csp_to_enforce_trusted_types).
> Xem [Cân nhắc bảo mật](#security_considerations) để biết thêm thông tin.

Thuộc tính **`innerHTML`** của giao diện {{domxref("ShadowRoot")}} lấy hoặc đặt HTML markup cho cây DOM bên trong `ShadowRoot`.

## Giá trị

Khi đọc thuộc tính, giá trị trả về là một chuỗi chứa dạng tuần tự hóa HTML của các phần tử con của shadow root.

Khi đặt thuộc tính, nó chấp nhận hoặc một đối tượng {{domxref("TrustedHTML")}} hoặc một chuỗi. Nó phân tích giá trị này thành HTML và thay thế toàn bộ các phần tử con của nó bằng kết quả. Khi được đặt thành giá trị `null`, giá trị `null` đó sẽ được chuyển thành chuỗi rỗng (`""`), nên `shadowRoot.innerHTML = null` tương đương với `shadowRoot.innerHTML = ""`.

### Ngoại lệ

- `SyntaxError` {{domxref("DOMException")}}
  - : Được ném ra nếu cố gắng đặt giá trị của `innerHTML` bằng một chuỗi HTML không được định dạng đúng.
- `TypeError`
  - : Được ném ra nếu thuộc tính được đặt bằng chuỗi khi [Trusted Types](/en-US/docs/Web/API/Trusted_Types_API) được [ép buộc bởi CSP](/en-US/docs/Web/API/Trusted_Types_API#using_a_csp_to_enforce_trusted_types) và không có chính sách mặc định nào được định nghĩa.

## Mô tả

`innerHTML` lấy ra phần HTML tuần tự hóa của các phần tử con lồng bên trong shadow root, hoặc đặt HTML hay XML cần được phân tích để thay thế cây DOM bên trong shadow root.

Lưu ý rằng một số trình duyệt tuần tự hóa các ký tự `<` và `>` thành `&lt;` và `&gt;` khi chúng xuất hiện trong giá trị thuộc tính (xem [Tương thích trình duyệt](#browser_compatibility)). Điều này nhằm ngăn một lỗ hổng bảo mật tiềm tàng ([mutation XSS](https://www.securitum.com/mutation-xss-via-mathml-mutation-dompurify-2-0-17-bypass.html)) trong đó kẻ tấn công có thể tạo dữ liệu đầu vào bỏ qua một [hàm làm sạch](/en-US/docs/Web/Security/Attacks/XSS#sanitization), dẫn đến tấn công cross-site scripting (XSS).

### Cân nhắc bảo mật

Thuộc tính `innerHTML` là một vector tiềm năng cho các cuộc tấn công [cross-site scripting (XSS)](/en-US/docs/Web/Security/Attacks/XSS), trong đó các chuỗi có thể không an toàn do người dùng cung cấp được chèn vào DOM mà không được làm sạch trước.
Mặc dù thuộc tính này ngăn các phần tử {{HTMLElement("script")}} thực thi khi chúng được chèn vào, nó vẫn dễ bị tấn công theo nhiều cách khác để kẻ tấn công tạo HTML nhằm chạy JavaScript độc hại.
Ví dụ, ví dụ sau sẽ thực thi mã trong trình xử lý sự kiện `error`, vì giá trị `src` của {{htmlelement("img")}} không phải là một URL hình ảnh hợp lệ:

```js
const name = "<img src='x' onerror='alert(1)'>";
shadowRoot.innerHTML = name; // hiển thị alert
```

Bạn có thể giảm thiểu các vấn đề này bằng cách luôn gán đối tượng {{domxref("TrustedHTML")}} thay vì chuỗi, và [ép buộc trusted types](/en-US/docs/Web/API/Trusted_Types_API#using_a_csp_to_enforce_trusted_types) bằng cách sử dụng chỉ thị CSP [`require-trusted-types-for`](/en-US/docs/Web/HTTP/Reference/Headers/Content-Security-Policy/require-trusted-types-for).
Điều này đảm bảo đầu vào được đưa qua một hàm chuyển đổi, hàm này có cơ hội [làm sạch](/en-US/docs/Web/Security/Attacks/XSS#sanitization) đầu vào để loại bỏ markup có thể nguy hiểm trước khi nó được chèn vào.

## Ví dụ

### Đọc nội dung HTML của một phần tử

Đọc `innerHTML` khiến user agent tuần tự hóa các phần tử con của shadow root.

Với HTML sau:

```html
<div class="host">
  <template shadowrootmode="open">
    <p>My name is Joe</p>
  </template>
</div>
```

Bạn có thể lấy và ghi log markup của shadow root như sau:

```js
const shadowHost = document.querySelector("#host");
const shadowRoot = shadowHost.shadowRoot;
const contents = shadowRoot.innerHTML;
console.log(contents); // "\n  <p>My name is Joe</p>\n"
```

### Đặt innerHTML của một Shadow root

Trong ví dụ này, chúng ta sẽ thay thế DOM của một phần tử bằng cách gán HTML cho thuộc tính `innerHTML` của phần tử đó. Để giảm thiểu rủi ro XSS, trước tiên chúng ta sẽ tạo một đối tượng `TrustedHTML` từ chuỗi chứa HTML, rồi gán đối tượng đó cho `innerHTML`.

Trusted types chưa được hỗ trợ trên tất cả trình duyệt, nên trước hết chúng ta định nghĩa [trusted types tinyfill](/en-US/docs/Web/API/Trusted_Types_API#trusted_types_tinyfill). Nó đóng vai trò thay thế trong suốt cho Trusted Types JavaScript API:

```js
if (typeof trustedTypes === "undefined")
  trustedTypes = { createPolicy: (n, rules) => rules };
```

Tiếp theo, chúng ta tạo một {{domxref("TrustedTypePolicy")}} định nghĩa phương thức {{domxref("TrustedTypePolicy/createHTML", "createHTML()")}} để chuyển đổi chuỗi đầu vào thành các thể hiện {{domxref("TrustedHTML")}}. Thông thường, việc triển khai `createHTML()` sẽ dùng một thư viện như [DOMPurify](https://github.com/cure53/DOMPurify) để làm sạch đầu vào như minh họa dưới đây:

```js
const policy = trustedTypes.createPolicy("my-policy", {
  createHTML: (input) => DOMPurify.sanitize(input),
});
```

Sau đó chúng ta dùng đối tượng `policy` này để tạo một đối tượng `TrustedHTML` từ chuỗi đầu vào có thể không an toàn, rồi gán kết quả cho phần tử:

```js
// Chuỗi có khả năng độc hại
const untrustedString = "<p>I might be XSS</p><img src='x' onerror='alert(1)'>";

// Tạo thể hiện TrustedHTML bằng policy
const trustedHTML = policy.createHTML(untrustedString);

// Lấy shadow root
const shadowHost = document.querySelector("#host");
const shadowRoot = shadowHost.shadowRoot;

// Chèn TrustedHTML (chứa chuỗi đáng tin cậy)
shadowRoot.innerHTML = trustedHTML;
```

> [!WARNING]
> Mặc dù bạn có thể gán trực tiếp một chuỗi cho `innerHTML`, đây là [rủi ro bảo mật](#security_considerations) nếu chuỗi cần chèn có thể chứa nội dung độc hại.

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
