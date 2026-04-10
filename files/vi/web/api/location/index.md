---
title: Location
slug: Web/API/Location
page-type: web-api-interface
browser-compat: api.Location
---

{{APIRef("HTML DOM")}}

Giao diện **`Location`** đại diện cho vị trí (URL) của đối tượng mà nó được liên kết. Các thay đổi được thực hiện trên nó sẽ phản ánh lên đối tượng mà nó liên quan. Cả giao diện {{domxref("Document")}} và {{domxref("Window")}} đều có một `Location` được liên kết như vậy, có thể truy cập lần lượt qua {{domxref("Document.location")}} và {{domxref("Window.location")}}.

## Cấu trúc của Location

Di chuột lên các phân đoạn URL bên dưới để làm nổi bật ý nghĩa của chúng:

```html hidden
<span id="href" title="href"
  ><span id="origin" title="origin"
    ><span id="protocol" title="protocol">https:</span>//<span
      id="host"
      title="host"
      ><span id="hostname" title="hostname">example.org</span>:<span
        id="port"
        title="port"
        >8080</span
      ></span
    ></span
  ><span id="pathname" title="pathname">/foo/bar</span
  ><span id="search" title="search">?q=baz</span
  ><span id="hash" title="hash">#bang</span></span
>
```

```css hidden
html {
  display: table;
  width: 100%;
}

body {
  display: table-cell;
  text-align: center;
  vertical-align: middle;
  font-family: "Georgia";
  font-size: 200%;
  line-height: 1em;
  white-space: nowrap;
}

[title] {
  position: relative;
  display: inline-block;
  box-sizing: border-box;
  line-height: 2em;
  cursor: pointer;
  color: gray;
}

[title]::before {
  content: attr(title);
  font-family: monospace;
  position: absolute;
  top: 100%;
  width: 100%;
  left: 50%;
  margin-left: -50%;
  font-size: 50%;
  line-height: 1.5;
  background: black;
}

[title]:hover::before,
:target::before {
  background: black;
  color: yellow;
}

[title] [title]::before {
  margin-top: 1.5em;
}

[title] [title] [title]::before {
  margin-top: 3em;
}

[title] [title] [title] [title]::before {
  margin-top: 4.5em;
}

[title]:hover,
:target {
  position: relative;
  z-index: 1;
  outline: 50em solid rgb(255 255 255 / 80%);
}
```

```js hidden
document.body.addEventListener("click", (event) => {
  event.preventDefault();

  window.location.hash = event.target.hasAttribute("id")
    ? `#${event.target.getAttribute("id")}`
    : "";
});
```

{{EmbedLiveSample('Location anatomy', '85ch', '180px')}}

## Thuộc tính thể hiện

- {{domxref("Location.ancestorOrigins")}} {{ReadOnlyInline}}
  - : Một {{domxref("DOMStringList")}} tĩnh chứa, theo thứ tự ngược, các origin của mọi ngữ cảnh duyệt web tổ tiên của tài liệu liên kết với đối tượng `Location` đã cho.
- {{domxref("Location.href")}}
  - : Một {{Glossary("stringifier")}} trả về một chuỗi chứa toàn bộ URL. Nếu thay đổi, tài liệu liên quan sẽ điều hướng đến trang mới. Nó có thể được đặt từ một origin khác với tài liệu liên quan.
- {{domxref("Location.protocol")}}
  - : Một chuỗi chứa scheme giao thức của URL, bao gồm dấu `':'` cuối cùng.
- {{domxref("Location.host")}}
  - : Một chuỗi chứa host, tức là _hostname_, một `':'`, và _port_ của URL.
- {{domxref("Location.hostname")}}
  - : Một chuỗi chứa miền của URL.
- {{domxref("Location.port")}}
  - : Một chuỗi chứa số cổng của URL.
- {{domxref("Location.pathname")}}
  - : Một chuỗi chứa một `'/'` ở đầu, theo sau là đường dẫn của URL, không bao gồm chuỗi truy vấn hoặc fragment.
- {{domxref("Location.search")}}
  - : Một chuỗi chứa `'?'` theo sau là các tham số hoặc "query string" của URL. Các trình duyệt hiện đại cung cấp [`URLSearchParams`](/en-US/docs/Web/API/URLSearchParams/get) và [`URL.searchParams`](/en-US/docs/Web/API/URL/searchParams) để dễ dàng phân tích các tham số từ query string.
- {{domxref("Location.hash")}}
  - : Một chuỗi chứa `'#'` theo sau là mã định danh fragment của URL.
- {{domxref("Location.origin")}} {{ReadOnlyInline}}
  - : Trả về một chuỗi chứa dạng chuẩn tắc của origin của vị trí cụ thể.

## Phương thức thể hiện

- {{domxref("Location.assign()")}}
  - : Tải tài nguyên tại URL được cung cấp trong tham số.
- {{domxref("Location.reload()")}}
  - : Tải lại URL hiện tại, giống nút Refresh.
- {{domxref("Location.replace()")}}
  - : Thay thế tài nguyên hiện tại bằng tài nguyên tại URL được cung cấp (chuyển hướng đến URL được cung cấp). Điểm khác với phương thức `assign()` và việc đặt thuộc tính `href` là sau khi dùng `replace()`, trang hiện tại sẽ không được lưu trong phiên {{domxref("History")}}, nghĩa là người dùng sẽ không thể dùng nút _back_ để quay lại nó.
- {{domxref("Location.toString()")}}
  - : Trả về một chuỗi chứa toàn bộ URL. Nó là đồng nghĩa với {{domxref("Location.href")}}, dù không thể dùng để sửa đổi giá trị.

## Ví dụ

```js
// location: https://developer.mozilla.org:8080/en-US/search?q=URL#search-results-close-container
const loc = document.location;
console.log(loc.href); // https://developer.mozilla.org:8080/en-US/search?q=URL#search-results-close-container
console.log(loc.protocol); // https:
console.log(loc.host); // developer.mozilla.org:8080
console.log(loc.hostname); // developer.mozilla.org
console.log(loc.port); // 8080
console.log(loc.pathname); // /en-US/search
console.log(loc.search); // ?q=URL
console.log(loc.hash); // #search-results-close-container
console.log(loc.origin); // https://developer.mozilla.org:8080

location.assign("http://another.site"); // tải trang khác
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- Hai thuộc tính `Location`: {{domxref("Window.location")}} và {{domxref("Document.location")}}.
- Các giao diện thao tác URL: {{domxref("URL")}} và {{domxref("URLSearchParams")}}.
