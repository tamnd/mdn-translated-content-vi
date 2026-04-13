---
title: "Document: phương thức parseHTMLUnsafe() static"
short-title: parseHTMLUnsafe()
slug: Web/API/Document/parseHTMLUnsafe_static
page-type: web-api-static-method
browser-compat: api.Document.parseHTMLUnsafe_static
---

{{APIRef("DOM")}}

> [!WARNING]
> Phương thức này phân tích cú pháp đầu vào của nó dưới dạng HTML, ghi kết quả vào DOM.
> Các API như vậy được gọi là [injection sinks](/en-US/docs/Web/API/Trusted_Types_API#concepts_and_usage), và có thể là vector cho các cuộc tấn công [cross-site scripting (XSS)](/en-US/docs/Web/Security/Attacks/XSS), nếu đầu vào ban đầu đến từ kẻ tấn công.
>
> Bạn có thể giảm thiểu rủi ro này bằng cách luôn truyền các đối tượng `TrustedHTML` thay vì chuỗi và [enforcing trusted types](/en-US/docs/Web/API/Trusted_Types_API#using_a_csp_to_enforce_trusted_types).
> Xem [Cân nhắc bảo mật](#security_considerations) để biết thêm thông tin.

> [!NOTE]
> {{domxref("Document/parseHTML_static", "Document.parseHTML()")}} gần như luôn nên được sử dụng thay vì phương thức này — trên các trình duyệt nơi nó được hỗ trợ — vì nó luôn xóa các thực thể HTML không an toàn XSS.

Phương thức static **`parseHTMLUnsafe()`** của đối tượng {{domxref("Document")}} được sử dụng để phân tích cú pháp đầu vào HTML, tùy chọn lọc các phần tử và thuộc tính HTML không mong muốn, nhằm tạo một instance {{domxref("Document")}} mới.

## Cú pháp

```js-nolint
Document.parseHTMLUnsafe(input)
Document.parseHTMLUnsafe(input, options)
```

### Tham số

- `input`
  - : Một instance {{domxref("TrustedHTML")}} hoặc một chuỗi xác định HTML cần phân tích cú pháp.
- `options` {{optional_inline}}
  - : Một đối tượng tùy chọn với các tham số tùy chọn sau:
    - `sanitizer` {{optional_inline}}
      - : Một đối tượng {{domxref("Sanitizer")}} hoặc {{domxref("SanitizerConfig")}} xác định những phần tử nào của đầu vào sẽ được phép hoặc bị xóa.
        Đây cũng có thể là một chuỗi với giá trị `"default"`, áp dụng một `Sanitizer` với [cấu hình sanitizer mặc định](/en-US/docs/Web/API/HTML_Sanitizer_API/Default_sanitizer_configuration) (an toàn XSS).
        Nếu không được chỉ định, không có sanitizer nào được sử dụng.

        Lưu ý rằng nếu bạn đang sử dụng cùng cấu hình nhiều lần, dự kiến sẽ hiệu quả hơn khi sử dụng `Sanitizer` và sửa đổi nó khi cần.

### Giá trị trả về

Một {{domxref("Document")}}.

### Ngoại lệ

- `TypeError`
  - : Được ném ra nếu:
    - `html` được truyền một chuỗi khi [Trusted Types](/en-US/docs/Web/API/Trusted_Types_API) được [thực thi bởi CSP](/en-US/docs/Web/API/Trusted_Types_API#using_a_csp_to_enforce_trusted_types) và không có chính sách mặc định nào được định nghĩa.
    - `options.sanitizer` được truyền một:
      - {{domxref("SanitizerConfig")}} không [hợp lệ](/en-US/docs/Web/API/SanitizerConfig#valid_configuration).
        Ví dụ: cấu hình bao gồm cả cài đặt cấu hình "allowed" và "removed".
      - chuỗi không có giá trị `"default"`.
      - giá trị không phải là {{domxref("Sanitizer")}}, {{domxref("SanitizerConfig")}}, hoặc chuỗi.

## Mô tả

Phương thức static **`parseHTMLUnsafe()`** có thể được sử dụng để tạo một instance {{domxref("Document")}} mới, tùy chọn lọc ra các phần tử và thuộc tính không mong muốn.
`Document` kết quả sẽ có [content type](/en-US/docs/Web/API/Document/contentType) là "text/html", [character set](/en-US/docs/Web/API/Document/characterSet) là UTF-8 và URL là "about:blank".

HTML đầu vào có thể bao gồm [declarative shadow roots](/en-US/docs/Web/HTML/Reference/Elements/template#declarative_shadow_dom).
Nếu chuỗi HTML định nghĩa nhiều hơn một [declarative shadow root](/en-US/docs/Web/HTML/Reference/Elements/template#declarative_shadow_dom) trong một shadow host cụ thể thì chỉ {{domxref("ShadowRoot")}} đầu tiên được tạo — các khai báo tiếp theo được phân tích cú pháp dưới dạng các phần tử {{htmlelement("template")}} trong shadow root đó.

`parseHTMLUnsafe()` không thực hiện bất kỳ việc làm sạch nào theo mặc định.
Nếu không có sanitizer nào được truyền làm tham số, tất cả các thực thể HTML trong đầu vào sẽ được tiêm.

### Cân nhắc bảo mật

Hậu tố "Unsafe" trong tên phương thức cho biết nó không thực thi việc xóa tất cả các thực thể HTML không an toàn XSS (không giống như {{domxref("Document/parseHTML_static", "Document.parseHTML()")}}).
Mặc dù nó có thể làm như vậy nếu được sử dụng với một sanitizer phù hợp, nó không phải sử dụng một sanitizer hiệu quả, hoặc bất kỳ sanitizer nào!
Phương thức do đó là một vector tiềm năng cho các cuộc tấn công [cross-site scripting (XSS)](/en-US/docs/Web/Security/Attacks/XSS), nơi các chuỗi không an toàn tiềm ẩn do người dùng cung cấp được tiêm vào DOM mà không được làm sạch trước.

Bạn nên giảm thiểu rủi ro này bằng cách luôn truyền các đối tượng {{domxref("TrustedHTML")}} thay vì chuỗi, và [enforcing trusted types](/en-US/docs/Web/API/Trusted_Types_API#using_a_csp_to_enforce_trusted_types) bằng cách sử dụng chỉ thị CSP [`require-trusted-types-for`](/en-US/docs/Web/HTTP/Reference/Headers/Content-Security-Policy/require-trusted-types-for).
Điều này đảm bảo rằng đầu vào được truyền qua một hàm biến đổi, có cơ hội [sanitize](/en-US/docs/Web/Security/Attacks/XSS#sanitization) đầu vào để loại bỏ đánh dấu nguy hiểm tiềm ẩn (chẳng hạn như các phần tử {{htmlelement("script")}} và các thuộc tính trình xử lý sự kiện), trước khi nó được tiêm.

Sử dụng `TrustedHTML` giúp có thể kiểm tra và xác minh rằng mã sanitize hiệu quả chỉ ở một vài nơi, thay vì rải rác trên tất cả các injection sinks của bạn.
Bạn không cần phải truyền một sanitizer cho phương thức khi sử dụng `TrustedHTML`.

Nếu vì bất kỳ lý do gì bạn không thể sử dụng `TrustedHTML` (hoặc tốt hơn nữa, `setHTML()`) thì tùy chọn an toàn tiếp theo là sử dụng `setHTMLUnsafe()` với [cấu hình sanitizer mặc định](/en-US/docs/Web/API/HTML_Sanitizer_API/Default_sanitizer_configuration) an toàn XSS.

## Đặc tả kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("Document.parseHTML_static", "Document.parseHTML()")}}
- {{domxref("Element.setHTML()")}} và {{domxref("Element.setHTMLUnsafe()")}}
- {{domxref("ShadowRoot.setHTML()")}} và {{domxref("ShadowRoot.setHTMLUnsafe()")}}
- {{domxref("DOMParser.parseFromString()")}} để phân tích cú pháp HTML hoặc XML thành cây DOM
- [HTML Sanitizer API](/en-US/docs/Web/API/HTML_Sanitizer_API)
