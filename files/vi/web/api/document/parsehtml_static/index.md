---
title: "Document: phương thức parseHTML() static"
short-title: parseHTML()
slug: Web/API/Document/parseHTML_static
page-type: web-api-static-method
status:
  - experimental
browser-compat: api.Document.parseHTML_static
---

{{APIRef("DOM")}}{{SeeCompatTable}}

Phương thức static **`parseHTML()`** của đối tượng {{domxref("Document")}} cung cấp một phương thức an toàn XSS để phân tích cú pháp và làm sạch một chuỗi HTML nhằm tạo một instance {{domxref("Document")}} mới.

## Cú pháp

```js-nolint
Document.parseHTML(input)
Document.parseHTML(input, options)
```

### Tham số

- `input`
  - : Một chuỗi xác định HTML cần được làm sạch và tiêm vào shadow root.
- `options` {{optional_inline}}
  - : Một đối tượng tùy chọn với các tham số tùy chọn sau:
    - `sanitizer`
      - : Một đối tượng {{domxref("Sanitizer")}} hoặc {{domxref("SanitizerConfig")}} xác định những phần tử nào của đầu vào sẽ được phép hoặc bị xóa, hoặc chuỗi `"default"` cho [cấu hình sanitizer mặc định](/en-US/docs/Web/API/HTML_Sanitizer_API/Default_sanitizer_configuration).
        Phương thức sẽ xóa bất kỳ phần tử và thuộc tính không an toàn XSS nào, ngay cả khi được sanitizer cho phép.
        Nếu không được chỉ định, cấu hình `Sanitizer` mặc định được sử dụng.

        Lưu ý rằng nếu bạn đang sử dụng cùng cấu hình nhiều lần, dự kiến sẽ hiệu quả hơn khi sử dụng `Sanitizer` và sửa đổi nó khi cần.

### Giá trị trả về

Một {{domxref("Document")}}.

### Ngoại lệ

- `TypeError`
  - : Được ném ra nếu `options.sanitizer` được truyền một:
    - {{domxref("SanitizerConfig")}} không [hợp lệ](/en-US/docs/Web/API/SanitizerConfig#valid_configuration).
      Ví dụ: cấu hình bao gồm cả cài đặt cấu hình "allowed" và "removed".
    - chuỗi không có giá trị `"default"`.
    - giá trị không phải là {{domxref("Sanitizer")}}, {{domxref("SanitizerConfig")}}, hoặc chuỗi.

## Mô tả

Phương thức **`parseHTML()`** phân tích cú pháp và làm sạch một chuỗi HTML nhằm tạo một instance {{domxref("Document")}} mới an toàn XSS.
`Document` kết quả sẽ có [content type](/en-US/docs/Web/API/Document/contentType) là "text/html", [character set](/en-US/docs/Web/API/Document/characterSet) là UTF-8 và URL là "about:blank".

Nếu không có sanitizer nào được chỉ định trong tham số `options.sanitizer`, `parseHTML()` được sử dụng với [cấu hình sanitizer mặc định](/en-US/docs/Web/API/HTML_Sanitizer_API/Default_sanitizer_configuration).
Cấu hình này phù hợp cho đa số trường hợp sử dụng vì nó ngăn chặn các cuộc tấn công XSS, cũng như các cuộc tấn công khác như clickjacking hoặc spoofing.

Một `Sanitizer` hoặc `SanitizerConfig` tùy chỉnh có thể được chỉ định để chọn phần tử, thuộc tính và chú thích nào được phép hoặc bị xóa.
Lưu ý rằng ngay cả khi các tùy chọn không an toàn được sanitizer cho phép, chúng vẫn sẽ bị xóa khi sử dụng phương thức này (nó xóa các phần tử giống như một sanitizer mà {{domxref('Sanitizer.removeUnsafe()')}} đã được gọi).

HTML đầu vào có thể bao gồm [declarative shadow roots](/en-US/docs/Web/HTML/Reference/Elements/template#declarative_shadow_dom).
Nếu chuỗi HTML định nghĩa nhiều hơn một [declarative shadow root](/en-US/docs/Web/HTML/Reference/Elements/template#declarative_shadow_dom) trong một shadow host cụ thể thì chỉ {{domxref("ShadowRoot")}} đầu tiên được tạo — các khai báo tiếp theo được phân tích cú pháp dưới dạng các phần tử {{htmlelement("template")}} trong shadow root đó.

`parseHTML()` nên được sử dụng thay vì {{domxref("Document.parseHTMLUnsafe_static", "Document.parseHTMLUnsafe()")}}, trừ khi có nhu cầu cụ thể để cho phép các phần tử và thuộc tính không an toàn.
Nếu HTML cần phân tích cú pháp không cần chứa các thực thể HTML không an toàn, thì bạn nên sử dụng `Document.parseHTML()`.

Lưu ý rằng vì phương thức này luôn làm sạch các chuỗi đầu vào của các thực thể không an toàn XSS, nó không được bảo mật hoặc xác thực bằng cách sử dụng [Trusted Types API](/en-US/docs/Web/API/Trusted_Types_API).

## Đặc tả kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("Document.parseHTMLUnsafe_static", "Document.parseHTMLUnsafe()")}}
- {{domxref("Element.setHTML()")}} và {{domxref("Element.setHTMLUnsafe()")}}
- {{domxref("ShadowRoot.setHTML()")}} và {{domxref("ShadowRoot.setHTMLUnsafe()")}}
- {{domxref("DOMParser.parseFromString()")}} để phân tích cú pháp HTML hoặc XML thành cây DOM
- [HTML Sanitizer API](/en-US/docs/Web/API/HTML_Sanitizer_API)
