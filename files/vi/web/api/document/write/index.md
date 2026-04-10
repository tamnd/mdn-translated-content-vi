---
title: "Document: write() method"
short-title: write()
slug: Web/API/Document/write
page-type: web-api-instance-method
status:
  - deprecated
browser-compat: api.Document.write
---

{{ApiRef("DOM")}}{{deprecated_header}}

> [!WARNING]
> Việc sử dụng phương thức `document.write()` không được khuyến khích.
> Hãy tránh sử dụng nó và thay thế nó trong mã hiện có nếu có thể.
>
> Như [chính đặc tả HTML cảnh báo](<https://html.spec.whatwg.org/multipage/dynamic-markup-insertion.html#document.write()>):
>
> > Phương thức này có hành vi rất đặc thù.
> > Trong một số trường hợp, phương thức này có thể ảnh hưởng đến trạng thái của [HTML parser](https://html.spec.whatwg.org/multipage/parsing.html#html-parser) trong khi parser đang chạy, dẫn đến một DOM không tương ứng với nguồn của tài liệu (ví dụ: nếu chuỗi được ghi là chuỗi "`<plaintext>`" hoặc "`<!--`").
> > Trong các trường hợp khác, lệnh gọi có thể xóa trang hiện tại trước, như thể {{domxref("document.open()")}} đã được gọi.
> > Trong nhiều trường hợp hơn, phương thức đơn giản bị bỏ qua, hoặc ném ra một ngoại lệ. Các tác nhân người dùng được [cho phép rõ ràng tránh thực thi các phần tử `script` được chèn qua phương thức này](https://html.spec.whatwg.org/multipage/parsing.html#document-written-scripts-intervention).
> > Và để làm cho vấn đề thậm chí tồi tệ hơn, hành vi chính xác của phương thức này trong một số trường hợp có thể phụ thuộc vào độ trễ mạng, điều này có thể dẫn đến các lỗi rất khó debug.
> > Vì tất cả những lý do này, việc sử dụng phương thức này không được khuyến khích.

> [!WARNING]
> Phương thức này phân tích cú pháp đầu vào dưới dạng HTML, ghi kết quả vào DOM.
> Các API như thế này được gọi là [injection sinks](/en-US/docs/Web/API/Trusted_Types_API#concepts_and_usage), và có thể là vector cho các cuộc tấn công [cross-site scripting (XSS)](/en-US/docs/Web/Security/Attacks/XSS), nếu đầu vào ban đầu đến từ kẻ tấn công.
>
> Bạn có thể giảm thiểu rủi ro này bằng cách luôn truyền các đối tượng `TrustedHTML` thay vì chuỗi và [enforcing trusted types](/en-US/docs/Web/API/Trusted_Types_API#using_a_csp_to_enforce_trusted_types).
> Xem [Considerations về bảo mật](#security_considerations) để biết thêm thông tin.

Phương thức **`write()`** của giao diện {{domxref("Document")}} ghi văn bản từ một hoặc nhiều tham số {{domxref("TrustedHTML")}} hoặc chuỗi vào một luồng tài liệu được mở bởi {{domxref("document.open()")}}.

## Cú pháp

```js-nolint
write(markup)
write(markup, markup2)
write(markup, markup2, /* …, */ markupN)
```

### Tham số

- `markup`, …, `markupN`
  - : Các đối tượng {{domxref("TrustedHTML")}} hoặc chuỗi chứa markup sẽ được ghi vào tài liệu.

### Giá trị trả về

Không có ({{jsxref("undefined")}}).

### Ngoại lệ

- `InvalidStateError` {{domxref("DOMException")}}
  - : Phương thức được gọi trên một tài liệu XML, hoặc được gọi khi parser đang thực thi một custom element constructor.
- `TypeError`
  - : Một chuỗi được truyền làm một trong các tham số khi [Trusted Types được thực thi](/en-US/docs/Web/API/Trusted_Types_API#using_a_csp_to_enforce_trusted_types) và [không có policy mặc định nào được định nghĩa](/en-US/docs/Web/API/TrustedTypePolicyFactory/createPolicy#creating_a_default_policy) để tạo các đối tượng {{domxref("TrustedHTML")}}.

## Mô tả

`document.write()` phân tích cú pháp văn bản markup trong các đối tượng được truyền làm tham số vào mô hình đối tượng (DOM) của tài liệu đang mở, theo thứ tự các tham số được chỉ định.

Vì `document.write()` ghi vào **luồng tài liệu**, nên việc gọi `document.write()` trên một tài liệu đã đóng (đã tải) (mà không gọi {{domxref("document.open()")}} trước) sẽ tự động gọi {{domxref("document.open()")}}, sẽ xóa tài liệu.

Ngoại lệ là nếu lệnh gọi `document.write()` được nhúng trong một thẻ `<script>` HTML nội tuyến, thì nó sẽ không tự động gọi `document.open()`:

```html
<script>
  document.write("<h1>Main title</h1>");
</script>
```

`document.write()` (và {{domxref("document.writeln")}}) không thể được sử dụng với XML hoặc XHTML, và việc cố gắng làm như vậy sẽ ném ra ngoại lệ `InvalidStateError`.
Điều này đúng nếu mở một tệp cục bộ có phần mở rộng .xhtml hoặc cho bất kỳ tài liệu nào được phân phối với kiểu MIME `application/xhtml+xml`.
Thêm thông tin có sẵn trong [W3C XHTML FAQ](https://www.w3.org/MarkUp/2004/xhtml-faq#docwrite).

Sử dụng `document.write()` trong các tập lệnh [deferred](/en-US/docs/Web/HTML/Reference/Elements/script#defer) hoặc [asynchronous](/en-US/docs/Web/HTML/Reference/Elements/script#async) sẽ bị bỏ qua và bạn sẽ nhận được thông báo như "A call to `document.write()` from an asynchronously-loaded external script was ignored" trong console lỗi.

Chỉ trong Edge, gọi `document.write()` nhiều hơn một lần trong một {{HTMLElement("iframe")}} gây ra lỗi "SCRIPT70: Permission denied".

### Considerations về bảo mật

Phương thức này là một vector tiềm năng cho các cuộc tấn công [cross-site scripting (XSS)](/en-US/docs/Web/Security/Attacks/XSS), trong đó các chuỗi không an toàn do người dùng cung cấp được tiêm vào DOM mà không được làm sạch trước.
Mặc dù phương thức có thể chặn các phần tử {{HTMLElement("script")}} khỏi việc thực thi khi chúng được tiêm trong một số trình duyệt (xem [Intervening against document.write()](https://developer.chrome.com/blog/removing-document-write/) cho Chrome), nó dễ bị nhiều cách khác mà kẻ tấn công có thể tạo HTML để chạy JavaScript độc hại.

Bạn có thể giảm thiểu những vấn đề này bằng cách luôn truyền các đối tượng {{domxref("TrustedHTML")}} thay vì chuỗi, và [enforcing trusted types](/en-US/docs/Web/API/Trusted_Types_API#using_a_csp_to_enforce_trusted_types) bằng chỉ thị CSP [`require-trusted-types-for`](/en-US/docs/Web/HTTP/Reference/Headers/Content-Security-Policy/require-trusted-types-for).
Điều này đảm bảo đầu vào được truyền qua một hàm biến đổi, có cơ hội [làm sạch](/en-US/docs/Web/Security/Attacks/XSS#sanitization) đầu vào để loại bỏ markup có thể nguy hiểm (chẳng hạn như các phần tử {{htmlelement("script")}} và thuộc tính trình xử lý sự kiện), trước khi nó được tiêm.

## Ví dụ

### Ghi TrustedHTML

Ví dụ này sử dụng [Trusted Types API](/en-US/docs/Web/API/Trusted_Types_API) để làm sạch các chuỗi HTML khỏi các phần tử {{htmlelement("script")}} trước khi chúng được ghi vào một tài liệu.

Ví dụ ban đầu hiển thị một số văn bản mặc định và một nút.
Khi nút được nhấp, tài liệu hiện tại được mở, ba chuỗi HTML được chuyển đổi thành các instance {{domxref("TrustedHTML")}} và được ghi vào tài liệu, và sau đó tài liệu được đóng.
Điều này thay thế tài liệu trong khung ví dụ, bao gồm cả HTML gốc cho nút và JavaScript đã thực hiện cập nhật!

#### HTML

```html
<p>Some original document content.</p>
<button id="replace" type="button">Replace document content</button>
```

#### JavaScript

Đầu tiên chúng ta sử dụng thuộc tính {{domxref("Window.trustedTypes")}} để truy cập {{domxref("TrustedTypePolicyFactory")}} toàn cục, và sử dụng phương thức {{domxref("TrustedTypePolicyFactory/createPolicy","createPolicy()")}} của nó để định nghĩa một policy có tên `"docPolicy"`.

Policy mới định nghĩa một hàm biến đổi `createHTML()` để tạo các đối tượng {{domxref("TrustedHTML")}} mà chúng ta sẽ truyền cho phương thức `write()`.
Phương thức này có thể làm bất cứ điều gì nó thích với chuỗi đầu vào: trusted types API chỉ yêu cầu bạn truyền đầu vào qua một hàm biến đổi policy, không yêu cầu hàm biến đổi phải làm bất cứ điều gì cụ thể.

Bạn sẽ sử dụng phương thức để [làm sạch](/en-US/docs/Web/Security/Attacks/XSS#sanitization) đầu vào bằng cách loại bỏ các tính năng không an toàn tiềm ẩn như thẻ {{htmlelement("script")}} hoặc các thuộc tính trình xử lý sự kiện.
Làm sạch rất khó để làm đúng, nên quá trình này thường sử dụng một thư viện bên thứ ba uy tín như [DOMPurify](https://github.com/cure53/DOMPurify).

Cho mục đích minh họa, ở đây chúng ta triển khai một bộ "làm sạch" sơ khai thay thế các ký tự `<` trong thẻ mở và đóng script bằng ký tự `&lt;`.

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
Các đối tượng này sau đó được truyền cho hàm `write()` khi người dùng nhấp vào nút.

```js
const oneInput = "<h1>Out with the old</h1>";
const twoInput = "<p>in with the new!</p>";
const threeInput = "<script>alert('evil afoot')<" + "/script>";
const replace = document.querySelector("#replace");

replace.addEventListener("click", () => {
  document.open();
  document.write(
    policy.createHTML(oneInput),
    policy.createHTML(twoInput),
    policy.createHTML(threeInput),
  );
  document.close();
});
```

#### Kết quả

Nhấn nút và lưu ý rằng các phần tử HTML mà chúng ta tin tưởng (trong ví dụ này) được tiêm, nhưng phần tử {{htmlelement("script")}} không đáng tin cậy hiện được hiển thị dưới dạng văn bản thuần.

{{EmbedLiveSample("Writing TrustedHTML")}}

### Ghi chuỗi

Điều này giống như ví dụ trước, ngoại trừ trusted types không được sử dụng hoặc thực thi.
Chúng ta đang ghi các chuỗi không được làm sạch, có thể tạo đường cho [các cuộc tấn công XSS](/en-US/docs/Web/Security/Attacks/XSS).

Ví dụ ban đầu hiển thị một số văn bản mặc định và một nút.
Khi nút được nhấp, tài liệu hiện tại được mở, ba chuỗi HTML được ghi vào tài liệu, và sau đó tài liệu được đóng.
Điều này thay thế tài liệu trong khung ví dụ, bao gồm cả HTML gốc cho nút và JavaScript đã thực hiện cập nhật.

#### HTML

```html
<p>Some original document content.</p>
<button id="replace" type="button">Replace document content</button>
```

#### JavaScript

```js
const replace = document.querySelector("#replace");

const oneInput = "<h1>Out with the old</h1>";
const twoInput = "<p>in with the new!</p>";
const threeInput = "<script>alert('evil afoot')<" + "/script>";

replace.addEventListener("click", () => {
  document.open();
  document.write(oneInput, twoInput, threeInput);
  document.close();
});
```

#### Kết quả

Nhấn nút và lưu ý rằng tất cả các phần tử HTML được tiêm.
Điều này bao gồm phần tử {{htmlelement("script")}}, mà trong một ứng dụng thực tế có thể đã thực thi mã có hại.

{{EmbedLiveSample("Writing strings")}}

## Đặc tả kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("document.writeln()")}}
- {{domxref("element.innerHTML")}}
- {{domxref("document.createElement()")}}
- [Trusted Types API](/en-US/docs/Web/API/Trusted_Types_API)
- [Cross-site scripting (XSS)](/en-US/docs/Web/Security/Attacks/XSS)
