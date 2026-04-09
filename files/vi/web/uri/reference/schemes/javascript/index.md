---
title: "javascript: URLs"
short-title: "javascript:"
slug: Web/URI/Reference/Schemes/javascript
page-type: uri-scheme
spec-urls: https://html.spec.whatwg.org/multipage/browsing-the-web.html#the-javascript:-url-special-case
sidebar: urlsidebar
---

> [!WARNING]
> Việc dùng URL `javascript:` trên web không được khuyến khích vì nó có thể dẫn đến việc thực thi mã tùy ý, tương tự như hệ quả của việc dùng [`eval()`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/eval). Nó cũng có thể làm giảm {{glossary("accessibility")}} vì nó đi chệch khỏi hành vi liên kết thông thường.

**JavaScript URL**, tức các URL có tiền tố bằng scheme `javascript:`, được dùng như các đích điều hướng giả để thực thi JavaScript khi trình duyệt cố điều hướng. Nếu URL đánh giá thành một chuỗi, chuỗi đó sẽ được coi là HTML và được trình duyệt hiển thị.

## Cú pháp

```url
javascript:<script>
```

- `javascript:`
  - : Scheme của URL.
- `<script>`
  - : Mã JavaScript cần thực thi. Mã sẽ được phân tích như một script.

## Mô tả

URL `javascript:` có thể được dùng ở bất kỳ đâu mà một URL là một đích điều hướng. Điều này bao gồm, nhưng không giới hạn ở:

- Thuộc tính [`href`](/en-US/docs/Web/HTML/Reference/Elements/a#href) của phần tử `<a>` hoặc `<area>`.
- Thuộc tính [`action`](/en-US/docs/Web/HTML/Reference/Elements/form#action) của phần tử `<form>`.
- Thuộc tính [`src`](/en-US/docs/Web/HTML/Reference/Elements/iframe#src) của phần tử `<iframe>`.
- Thuộc tính JavaScript [`window.location`](/en-US/docs/Web/API/Window/location).
- Chính thanh địa chỉ của trình duyệt.

> [!NOTE]
> Một số ngữ cảnh khác dùng URL, chẳng hạn thuộc tính [`href`](/en-US/docs/Web/HTML/Reference/Elements/link#href) của phần tử `<link>`, không cho phép URL `javascript:` vì chúng là vị trí tài nguyên, không phải đích điều hướng. Với các trường hợp này, nếu bạn muốn viết JavaScript trực tiếp, hãy dùng URL [`data:`](/en-US/docs/Web/URI/Reference/Schemes/data) với MIME type `text/javascript`.

Khi trình duyệt cố điều hướng tới một vị trí như vậy, nó phân tích và thực thi phần thân script. Script có thể có một _completion value_ (không phải giá trị trả về), và giá trị này giống như khi script được thực thi bằng [`eval()`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/eval). Nếu câu lệnh cuối cùng là một [biểu thức](/en-US/docs/Web/JavaScript/Reference/Statements/Expression_statement), completion value là giá trị của biểu thức đó. Nếu completion value này là một chuỗi, chuỗi đó sẽ được coi là một tài liệu HTML và trình duyệt điều hướng tới một tài liệu mới với nội dung đó, dùng cùng URL như trang hiện tại. Không tạo mục lịch sử nào. Nếu completion value không phải chuỗi, trình duyệt chỉ thực thi mã và không điều hướng. Vì vậy, thường được khuyến nghị rằng nếu script kết thúc bằng một lời gọi hàm như `javascript:foo()`, bạn nên thêm tiền tố {{jsxref("Operators/void", "void")}} để tránh điều hướng ngoài ý muốn nếu hàm đó tình cờ trả về một chuỗi.

Việc điều hướng `javascript:` có thể bị chặn bởi các thiết lập [content security policy](/en-US/docs/Web/HTTP/Guides/CSP), đặc biệt là {{CSP("script-src")}}.

## Ví dụ

### Dùng URL `javascript:` làm mục tiêu href

Trong ví dụ này, thuộc tính `href` của phần tử `<a>` được đặt thành một URL `javascript:` để hiển thị một thông báo khi được nhấp:

```html example-bad
<a href="javascript:alert('Hello, world!')">Click me</a>
```

Vì {{domxref("Window/alert", "alert()")}} trả về `undefined`, trình duyệt không điều hướng tới một trang mới. Đây là thực hành không tốt vì liên kết thực ra không phải là một siêu liên kết. Hãy cân nhắc dùng một button thay thế:

```html example-good
<button id="btn">Click me</button>
<script>
  document.getElementById("btn").addEventListener("click", () => {
    alert("Hello, world!");
  });
</script>
```

Trong ví dụ này, thuộc tính `href` của phần tử `<a>` được đặt thành một URL `javascript:` để điều hướng tới một trang mới có nội dung "Hello, world!":

```html example-bad
<a href="javascript:pageContent">Click me</a>
<script>
  // Dùng var để nó trở thành biến toàn cục và có thể được đọc ở nơi khác
  var pageContent = "Hello, world!";
</script>
```

Lưu ý rằng vì URL `javascript:` không tạo mục lịch sử, nên không có cách nào quay lại trang trước mà không làm mới.

### Dùng URL `javascript:` làm action của form

Trong ví dụ này, thuộc tính `action` của phần tử `<form>` được đặt thành một URL `javascript:` để hiển thị một thông báo khi được gửi:

```html example-bad
<form action="javascript:alert(myInput.value)">
  <input id="myInput" />
  <input type="submit" value="Submit" />
</form>
```

Thay vì làm vậy, hãy cân nhắc lắng nghe sự kiện `submit` của form và xử lý nó bằng JavaScript:

```html example-good
<form id="myForm">
  <input id="myInput" />
  <input type="submit" value="Submit" />
</form>
<script>
  document.getElementById("myForm").addEventListener("submit", (event) => {
    event.preventDefault();
    alert(document.getElementById("myInput").value);
  });
</script>
```

### Dùng URL `javascript:` làm nguồn iframe

Trong ví dụ này, thuộc tính `src` của phần tử `<iframe>` được đặt thành một URL `javascript:` để điều hướng tới một trang mới có nội dung "Hello, world!":

```html example-bad
<iframe src="javascript:pageContent"></iframe>
<script>
  // Dùng var để nó trở thành biến toàn cục và có thể được đọc ở nơi khác
  var pageContent = "Hello, world!";
</script>
```

Thay vì làm vậy, hãy cân nhắc đặt thuộc tính `srcdoc`:

```html example-good
<iframe id="myFrame"></iframe>
<script>
  document.getElementById("myFrame").srcdoc = "Hello, world!";
</script>
```

### Dùng URL `javascript:` với window.location

Trong ví dụ này, thuộc tính `window.location` được đặt thành một URL `javascript:` để điều hướng tới một trang mới có nội dung "Hello, world!":

```js example-bad
window.location = "javascript:'Hello world!'";
```

Thay vì làm vậy, hãy cân nhắc dùng [DOM APIs](/en-US/docs/Web/API/HTML_DOM_API) để chỉnh sửa nội dung trang. Ví dụ:

```js example-good
document.body.textContent = "Hello, world!";
```

## Đặc tả

{{Specifications}}

## Xem thêm

- [URIs](/en-US/docs/Web/URI)
- [Content Security Policy (CSP)](/en-US/docs/Web/HTTP/Guides/CSP)
- [Danh sách IANA các URI scheme](https://www.iana.org/assignments/uri-schemes/uri-schemes.xhtml)
