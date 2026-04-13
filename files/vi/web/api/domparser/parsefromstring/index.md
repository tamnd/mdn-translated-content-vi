---
title: "DOMParser: phương thức parseFromString()"
short-title: parseFromString()
slug: Web/API/DOMParser/parseFromString
page-type: web-api-instance-method
browser-compat: api.DOMParser.parseFromString
---

{{APIRef("DOMParser")}}

> [!WARNING]
> Phương thức này phân tích cú pháp đầu vào dưới dạng HTML, ghi kết quả vào DOM.
> Các API như thế này được gọi là [injection sinks](/en-US/docs/Web/API/Trusted_Types_API#concepts_and_usage) và có thể là vectơ tấn công [cross-site scripting (XSS)](/en-US/docs/Web/Security/Attacks/XSS) nếu đầu vào ban đầu đến từ kẻ tấn công.
>
> Bạn có thể giảm thiểu rủi ro này bằng cách luôn truyền các đối tượng `TrustedHTML` thay vì chuỗi và [áp dụng trusted types](/en-US/docs/Web/API/Trusted_Types_API#using_a_csp_to_enforce_trusted_types).
> Xem [Cân nhắc bảo mật](#security_considerations) để biết thêm thông tin.

Phương thức **`parseFromString()`** của giao diện {{domxref("DOMParser")}} phân tích cú pháp đầu vào chứa HTML hoặc XML, trả về một {{domxref("Document")}} với loại được chỉ định trong thuộc tính {{domxref("Document/contentType","contentType")}}.

> [!NOTE]
> Phương thức tĩnh [`Document.parseHTMLUnsafe()`](/en-US/docs/Web/API/Document/parseHTMLUnsafe_static) cung cấp một cách thay thế dễ sử dụng hơn để phân tích cú pháp đánh dấu HTML thành {{domxref("Document")}}.

## Cú pháp

```js-nolint
parseFromString(input, mimeType)
```

### Tham số

- `input`
  - : Một phiên bản {{domxref("TrustedHTML")}} hoặc một chuỗi xác định HTML cần phân tích cú pháp.
    Đánh dấu phải chứa tài liệu {{Glossary("HTML")}}, {{Glossary("XML")}}, {{Glossary("XHTML")}}, hoặc {{Glossary("SVG")}}.
- `mimeType`
  - : Một chuỗi xác định xem bộ phân tích cú pháp XML hay HTML được sử dụng để phân tích cú pháp chuỗi.

    Các giá trị được phép là:
    - `text/html`
    - `text/xml`
    - `application/xml`
    - `application/xhtml+xml`
    - `image/svg+xml`

### Giá trị trả về

Một {{domxref("Document")}} với {{domxref("Document/contentType","contentType")}} khớp với `mimeType` đã cho.

> [!NOTE]
> Trình duyệt thực tế có thể trả về một đối tượng {{domxref("HTMLDocument")}} hoặc {{domxref("XMLDocument")}}.
> Những đối tượng này kế thừa từ {{domxref("Document")}} và không thêm thuộc tính nào: về cơ bản chúng tương đương nhau.

### Ngoại lệ

- [`TypeError`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/TypeError)
  - : Được ném ra khi:
    - `mimeType` được truyền một giá trị không phải là một trong các [giá trị được phép](#mimetype).
    - `input` được truyền một giá trị chuỗi khi [Trusted Types](/en-US/docs/Web/API/Trusted_Types_API) được [áp dụng bởi CSP](/en-US/docs/Web/API/Trusted_Types_API#using_a_csp_to_enforce_trusted_types) và không có chính sách mặc định nào được xác định.

## Mô tả

Phương thức **`parseFromString()`** phân tích cú pháp đầu vào chứa HTML hoặc XML, trả về một {{domxref("Document")}} với {{domxref("Document/contentType","contentType")}} khớp với `mimeType`.
`Document` này chứa một DOM trong bộ nhớ hoàn chỉnh tách biệt với tài liệu chính trong trang liên quan.

Nếu `mimeType` là `text/html`, đầu vào được phân tích cú pháp dưới dạng HTML và các phần tử {{htmlelement("script")}} được đánh dấu là không thực thi, các sự kiện không được kích hoạt và trình xử lý sự kiện không được gọi để chạy các tập lệnh nội tuyến.
Mặc dù tài liệu có thể tải xuống các tài nguyên được chỉ định trong các phần tử {{htmlelement("iframe")}} và {{htmlelement("img")}}, về cơ bản nó không hoạt động.
Điều này hữu ích vì bạn có thể phân tích cú pháp các đầu vào HTML bao gồm {{glossary("Shadow tree","declarative shadow roots")}} và thực hiện các thao tác trên tài liệu mà không ảnh hưởng đến trang hiển thị.

Đối với các giá trị được phép khác (`text/xml`, `application/xml`, `application/xhtml+xml`, và `image/svg+xml`), đầu vào được phân tích cú pháp dưới dạng XML.
Nếu đầu vào không đại diện cho XML hợp lệ, tài liệu được trả về sẽ chứa một nút `<parsererror>` mô tả tính chất của lỗi phân tích cú pháp.

Các giá trị `mimeType` không được phép gây ra lỗi [`TypeError`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/TypeError).

### Cân nhắc bảo mật

Phương thức này phân tích cú pháp đầu vào thành một DOM trong bộ nhớ riêng biệt, vô hiệu hóa bất kỳ phần tử {{htmlelement("script")}} nào và ngăn chặn các trình xử lý sự kiện chạy.
Mặc dù tài liệu được trả về về cơ bản không hoạt động, các trình xử lý sự kiện và tập lệnh trong DOM của nó sẽ có thể chạy nếu chúng được chèn vào DOM hiển thị.
Do đó, phương thức là vectơ có thể cho các cuộc tấn công [cross-site scripting (XSS)](/en-US/docs/Web/Security/Attacks/XSS), nơi đầu vào không an toàn tiềm ẩn trước tiên được phân tích cú pháp thành một `Document` mà không được làm sạch, và sau đó được chèn vào DOM hiển thị/hoạt động nơi code có thể chạy.

Bạn nên giảm thiểu rủi ro này bằng cách luôn truyền các đối tượng {{domxref("TrustedHTML")}} thay vì chuỗi, và [áp dụng trusted types](/en-US/docs/Web/API/Trusted_Types_API#using_a_csp_to_enforce_trusted_types) sử dụng chỉ thị CSP [`require-trusted-types-for`](/en-US/docs/Web/HTTP/Reference/Headers/Content-Security-Policy/require-trusted-types-for).

## Ví dụ

### Phân tích cú pháp đầu vào bằng Trusted Types

Trong ví dụ này, chúng ta sẽ phân tích cú pháp một đầu vào HTML có thể gây hại và sau đó chèn nó vào DOM của trang hiển thị.

```js
if (typeof trustedTypes === "undefined")
  trustedTypes = { createPolicy: (n, rules) => rules };
```

```js
const policy = trustedTypes.createPolicy("my-policy", {
  createHTML: (input) => DOMPurify.sanitize(input),
});
```

```js
// The potentially malicious string
const untrustedString = "<p>I might be XSS</p><img src='x' onerror='alert(1)'>";

// Create a TrustedHTML instance using the policy
const trustedHTML = policy.createHTML(untrustedString);

// Parse the TrustedHTML (which contains a trusted string)
const safeDocument = parser.parseFromString(trustedHTML, "text/html");
```

```js
document.body.replaceWith(safeDocument.body);
```

### Phân tích cú pháp XML, SVG và HTML

```js
const parser = new DOMParser();

const xmlString = "<warning>Beware of the tiger</warning>";
const doc1 = parser.parseFromString(xmlString, "application/xml");
console.log(doc1.contentType); // "application/xml"

const svgString = '<circle cx="50" cy="50" r="50"/>';
const doc2 = parser.parseFromString(svgString, "image/svg+xml");
console.log(doc2.contentType); // "image/svg+xml"

const htmlString = "<strong>Beware of the leopard</strong>";
const doc3 = parser.parseFromString(htmlString, "text/html");
console.log(doc3.contentType); // "text/html"

console.log(doc1.documentElement.textContent);
// "Beware of the tiger"

console.log(doc2.firstChild.tagName);
// "circle"

console.log(doc3.body.firstChild.textContent);
// "Beware of the leopard"
```

### Xử lý lỗi

```js
const parser = new DOMParser();

const xmlString = "<warning>Beware of the missing closing tag";
const doc = parser.parseFromString(xmlString, "application/xml");
const errorNode = doc.querySelector("parsererror");
if (errorNode) {
  // parsing failed
} else {
  // parsing succeeded
}
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("XMLSerializer")}}
- {{jsxref("JSON.parse()")}} - tương đương cho tài liệu {{jsxref("JSON")}}.
