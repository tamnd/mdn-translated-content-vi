---
title: "URL: phương thức tĩnh canParse()"
short-title: canParse()
slug: Web/API/URL/canParse_static
page-type: web-api-static-method
browser-compat: api.URL.canParse_static
---

{{APIRef("URL API")}} {{AvailableInWorkers}}

Phương thức tĩnh **`URL.canParse()`** của giao diện {{domxref("URL")}} trả về một giá trị boolean cho biết một URL tuyệt đối, hoặc một URL tương đối kết hợp với URL cơ sở, có thể phân tích và hợp lệ hay không.

Đây là một lựa chọn thay thế nhanh và dễ cho việc tạo một `URL` bên trong khối [try...catch](/en-US/docs/Web/JavaScript/Reference/Statements/try...catch).
Nó trả về `true` cho cùng các giá trị mà [`URL()` constructor](/en-US/docs/Web/API/URL/URL) sẽ thành công, và `false` cho các giá trị sẽ khiến constructor ném lỗi.

## Cú pháp

```js-nolint
URL.canParse(url)
URL.canParse(url, base)
```

### Tham số

- `url`
  - : Một chuỗi hoặc bất kỳ đối tượng nào khác có {{Glossary("stringifier")}} - bao gồm, ví dụ, một phần tử {{htmlelement("a")}} hoặc {{htmlelement("area")}} - đại diện cho một URL tuyệt đối hoặc tương đối.
    Nếu `url` là một URL tương đối, `base` là bắt buộc, và sẽ được dùng làm URL cơ sở.
    Nếu `url` là một URL tuyệt đối, `base` được cung cấp sẽ bị bỏ qua.
- `base` {{optional_inline}}
  - : Một chuỗi đại diện cho URL cơ sở dùng trong trường hợp `url` là một URL tương đối.
    Nếu không chỉ định, giá trị mặc định là `undefined`.

> [!NOTE]
> Các đối số `url` và `base` sẽ lần lượt được stringify từ bất kỳ giá trị nào bạn truyền vào, giống như các Web API khác chấp nhận một chuỗi.
> Đặc biệt, bạn có thể dùng một đối tượng {{domxref("URL")}} hiện có cho bất kỳ đối số nào, và nó sẽ được stringify thành thuộc tính {{domxref("URL.href", "href")}} của đối tượng.

### Giá trị trả về

`true` nếu URL có thể được phân tích và hợp lệ; `false` nếu không.

## Ví dụ

Ví dụ trực tiếp này minh họa cách dùng phương thức tĩnh `URL.canParse()` với một vài giá trị URL tuyệt đối và tương đối khác nhau.

Phần đầu của ví dụ định nghĩa một phần tử HTML `<pre>` để ghi log, cùng với một phương thức ghi log `log()`.

```html
<pre id="log"></pre>
```

```js
const logElement = document.getElementById("log");
function log(text) {
  logElement.innerText += `${text}\n`;
}
```

Tiếp theo chúng ta kiểm tra xem phương thức `URL.canParse()` có được hỗ trợ hay không bằng điều kiện `"canParse" in URL`.
Nếu phương thức được hỗ trợ, chúng ta ghi lại kết quả kiểm tra một URL tuyệt đối, một URL tương đối không có URL cơ sở, và một URL tương đối với một URL cơ sở hợp lệ.
Chúng ta cũng ghi lại trường hợp `URL.canParse()` không được hỗ trợ.

```js
if ("canParse" in URL) {
  log("Test valid absolute URL");
  let url = "https://developer.mozilla.org/";
  let result = URL.canParse(url);
  log(` URL.canParse("${url}"): ${result}`);

  log("\nTest relative URL with no base URL");
  url = "/en-US/docs";
  result = URL.canParse(url);
  log(` URL.canParse("${url}"): ${result}`);

  log("\nTest relative URL with valid base URL");
  let baseUrl = "https://developer.mozilla.org/";
  result = URL.canParse(url, baseUrl);
  log(` URL.canParse("${url}","${baseUrl}"): ${result}`);
} else {
  log("URL.canParse() không được hỗ trợ");
}
```

Cuối cùng, đoạn mã dưới đây cho thấy `baseUrl` không nhất thiết phải là chuỗi.
Ở đây chúng ta đã truyền vào một đối tượng `URL`.

```js
if ("canParse" in URL) {
  log("\nTest relative URL with base URL supplied as a URL object");
  let baseUrl = new URL("https://developer.mozilla.org/");
  let url = "/en-US/docs";
  result = URL.canParse(url, baseUrl);
  log(` URL.canParse("${url}","${baseUrl}"): ${result}`);
}
```

Kết quả của từng kiểm tra được hiển thị bên dưới.

{{EmbedLiveSample('Examples', '100%', '200')}}

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("URL.URL", "URL()")}}
- [Polyfill của `URL.canParse()`](https://github.com/zloirock/core-js#url-and-urlsearchparams) có sẵn trong [`core-js`](https://github.com/zloirock/core-js)
