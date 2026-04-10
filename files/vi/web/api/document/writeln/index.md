---
title: "Document: writeln() method"
short-title: writeln()
slug: Web/API/Document/writeln
page-type: web-api-instance-method
status:
  - deprecated
browser-compat: api.Document.writeln
---

{{ ApiRef("DOM") }}{{deprecated_header}}

> [!WARNING]
> Phương thức này phân tích cú pháp đầu vào dưới dạng HTML, ghi kết quả vào DOM.
> Các API như thế này được gọi là [injection sinks](/en-US/docs/Web/API/Trusted_Types_API#concepts_and_usage), và có thể là vector cho các cuộc tấn công [cross-site-scripting (XSS)](/en-US/docs/Web/Security/Attacks/XSS), nếu đầu vào ban đầu đến từ kẻ tấn công.
>
> Bạn có thể giảm thiểu rủi ro này bằng cách luôn truyền các đối tượng `TrustedHTML` thay vì chuỗi và [enforcing trusted types](/en-US/docs/Web/API/Trusted_Types_API#using_a_csp_to_enforce_trusted_types).
> Xem [Considerations về bảo mật](#security_considerations) để biết thêm thông tin.

Phương thức **`writeln()`** của giao diện {{domxref("Document")}} ghi văn bản từ một hoặc nhiều tham số {{domxref("TrustedHTML")}} hoặc chuỗi vào một luồng tài liệu được mở bởi {{domxref("document.open()")}}, theo sau là một ký tự newline.

## Cú pháp

```js-nolint
writeln(markup)
writeln(markup, markup2)
writeln(markup, markup2, /* …, */ markupN)
```

### Tham số

- `markup`, …, `markupN`
  - : Các đối tượng {{domxref("TrustedHTML")}} hoặc chuỗi chứa văn bản sẽ được ghi vào tài liệu.

### Giá trị trả về

Không có ({{jsxref("undefined")}}).

### Ngoại lệ

- `InvalidStateError` {{domxref("DOMException")}}
  - : Phương thức được gọi trên một tài liệu XML, hoặc được gọi khi parser đang thực thi một custom element constructor.
- `TypeError`
  - : Một chuỗi được truyền làm một trong các tham số khi [Trusted Types được thực thi](/en-US/docs/Web/API/Trusted_Types_API#using_a_csp_to_enforce_trusted_types) và [không có policy mặc định nào được định nghĩa](/en-US/docs/Web/API/TrustedTypePolicyFactory/createPolicy#creating_a_default_policy) để tạo các đối tượng {{domxref("TrustedHTML")}}.

## Mô tả

Phương thức này về cơ bản giống như {{domxref("document.write()")}} nhưng thêm một newline (thông tin trong chủ đề được liên kết cũng áp dụng cho phương thức này).
Newline này chỉ hiển thị nếu nó được tiêm vào bên trong một phần tử nơi newline được hiển thị.
Thông tin bổ sung trong {{domxref("document.write()")}} cũng áp dụng cho phương thức này.

### Considerations về bảo mật

Phương thức này là một vector tiềm năng cho các cuộc tấn công [Cross-site-scripting (XSS)](/en-US/docs/Web/Security/Attacks/XSS), trong đó các chuỗi không an toàn tiềm ẩn do người dùng cung cấp được tiêm vào DOM mà không được làm sạch trước.
Mặc dù phương thức có thể chặn các phần tử {{HTMLElement("script")}} khỏi việc thực thi khi chúng được tiêm trong một số trình duyệt (xem [Intervening against document.write()](https://developer.chrome.com/blog/removing-document-write/) cho Chrome), nó dễ bị nhiều cách khác mà kẻ tấn công có thể tạo HTML để chạy JavaScript độc hại.

Bạn có thể giảm thiểu những vấn đề này bằng cách luôn truyền các đối tượng {{domxref("TrustedHTML")}} thay vì chuỗi, và [enforcing trusted types](/en-US/docs/Web/API/Trusted_Types_API#using_a_csp_to_enforce_trusted_types) bằng chỉ thị CSP [`require-trusted-types-for`](/en-US/docs/Web/HTTP/Reference/Headers/Content-Security-Policy/require-trusted-types-for).
Điều này đảm bảo đầu vào được truyền qua một hàm biến đổi, có cơ hội [làm sạch](/en-US/docs/Web/Security/Attacks/XSS#sanitization) đầu vào để loại bỏ markup có thể nguy hiểm (chẳng hạn như các phần tử {{htmlelement("script")}} và thuộc tính trình xử lý sự kiện), trước khi nó được tiêm.

## Ví dụ

### Ghi TrustedHTML

Ví dụ này sử dụng [Trusted Types API](/en-US/docs/Web/API/Trusted_Types_API) để làm sạch các chuỗi HTML trước khi chúng được ghi vào một tài liệu.
Bạn nên luôn sử dụng trusted types để truyền các chuỗi không đáng tin cậy cho các API không an toàn.

Ví dụ ban đầu hiển thị một số văn bản mặc định và một nút.
Khi nút được nhấp, tài liệu hiện tại được mở, một số chuỗi HTML được chuyển đổi thành các instance {{domxref("TrustedHTML")}} và được ghi vào tài liệu, và sau đó tài liệu được đóng.
Điều này thay thế tài liệu trong khung ví dụ, bao gồm cả HTML gốc cho nút và JavaScript đã thực hiện cập nhật!

#### HTML

```html
<p>Some original document content.</p>
<button id="replace" type="button">Replace document content</button>
```

#### JavaScript

Đầu tiên chúng ta sử dụng thuộc tính {{domxref("Window.trustedTypes")}} để truy cập {{domxref("TrustedTypePolicyFactory")}} toàn cục, và sử dụng phương thức {{domxref("TrustedTypePolicyFactory/createPolicy","createPolicy()")}} của nó để định nghĩa một policy có tên `"docPolicy"`.

Policy mới định nghĩa một hàm biến đổi `createHTML()` để tạo các đối tượng {{domxref("TrustedHTML")}} mà chúng ta sẽ truyền cho phương thức `writeln()`.
Phương thức này có thể làm bất cứ điều gì nó thích với chuỗi đầu vào: trusted types API chỉ yêu cầu bạn truyền đầu vào qua một hàm biến đổi policy, không yêu cầu hàm biến đổi phải làm bất cứ điều gì cụ thể.

Bạn sẽ sử dụng phương thức để [làm sạch](/en-US/docs/Web/Security/Attacks/XSS#sanitization) đầu vào bằng cách loại bỏ các tính năng không an toàn tiềm ẩn như thẻ {{htmlelement("script")}} hoặc các thuộc tính trình xử lý sự kiện.
Làm sạch rất khó để làm đúng, nên quá trình này thường sử dụng một thư viện bên thứ ba uy tín như [DOMPurify](https://github.com/cure53/DOMPurify).

Ở đây chúng ta triển khai một bộ "làm sạch" sơ khai thay thế các ký tự `<` trong thẻ mở và đóng script bằng ký tự `&lt;`.
Các chuỗi được tiêm trong ví dụ này thực sự không chứa bất kỳ phần tử có hại nào, nên đây chỉ là minh họa.

```js
const policy = trustedTypes.createPolicy("docPolicy", {
  createHTML(string) {
    return string
      .replace("<script", "&lt;script")
      .replace("</script", "&lt;/script");
  },
});
```

Sau đó chúng ta có thể sử dụng phương thức {{domxref("TrustedTypePolicy.createHTML()")}} trên policy đã trả về để tạo các đối tượng {{domxref("TrustedHTML")}} từ các chuỗi đầu vào ban đầu.
Các đối tượng này sau đó được truyền cho hàm `writeln()` khi người dùng nhấp vào nút.

```js
const replace = document.querySelector("#replace");
const oneInput = "<h1>Out with";
const twoInput = "the old</h1>";
const threeInput = "<pre>in with";
const fourInput = "the new!</pre>";

replace.addEventListener("click", () => {
  document.open();
  document.writeln(policy.createHTML(oneInput));
  document.writeln(policy.createHTML(twoInput), policy.createHTML(threeInput));
  document.writeln(policy.createHTML(fourInput));
  document.close();
});
```

#### Kết quả

Nhấp vào nút.
Lưu ý rằng một newline được thêm vào sau mỗi lệnh gọi `writeln()`, nhưng điều này chỉ hiển thị bên trong phần tử {{htmlelement("pre")}} vì bố cục của nó mặc định bảo tồn khoảng trắng.

{{EmbedLiveSample("Writing TrustedHTML")}}

## Đặc tả kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
