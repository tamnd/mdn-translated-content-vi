---
title: "URL: phương thức tĩnh parse()"
short-title: parse()
slug: Web/API/URL/parse_static
page-type: web-api-static-method
browser-compat: api.URL.parse_static
---

{{APIRef("URL API")}} {{AvailableInWorkers}}

Phương thức tĩnh **`URL.parse()`** của giao diện {{domxref("URL")}} trả về một đối tượng {{domxref("URL")}} mới được tạo, biểu diễn URL được xác định bởi các tham số.

Nếu URL cơ sở được cung cấp hoặc URL kết quả không phải là URL hợp lệ có thể phân tích, `null` sẽ được trả về.
Đây là một lựa chọn thay thế cho việc dùng constructor {{domxref("URL.URL", "URL()")}} để tạo một `URL` trong khối [try...catch](/en-US/docs/Web/JavaScript/Reference/Statements/try...catch), hoặc dùng {{domxref("URL.canParse_static", "canParse()")}} để kiểm tra các tham số và trả về `null` nếu phương thức trả về `false`.

## Cú pháp

```js-nolint
URL.parse(url)
URL.parse(url, base)
```

### Tham số

- `url`
  - : Một chuỗi hoặc bất kỳ đối tượng nào khác có {{Glossary("stringifier")}} đại diện cho một URL tuyệt đối hoặc một tham chiếu tương đối tới một URL.
    Nếu `url` là một tham chiếu tương đối, `base` là bắt buộc, và được dùng để phân giải URL cuối cùng.
    Nếu `url` là một URL tuyệt đối, `base` được cung cấp sẽ không được dùng để tạo URL kết quả.
- `base` {{optional_inline}}
  - : Một chuỗi đại diện cho URL cơ sở dùng trong trường hợp `url` là một URL tương đối.
    Nếu không chỉ định, giá trị mặc định là `undefined`.

    Khi bạn chỉ định một URL `base`, URL được phân giải không chỉ đơn giản là nối `url` và `base`.
    Các tham chiếu tương đối tới thư mục cha và thư mục hiện tại được phân giải tương đối với thư mục hiện tại của URL `base`, bao gồm chỉ các đoạn đường dẫn cho tới dấu gạch chéo cuối cùng, nhưng không bao gồm những phần sau đó.
    Các tham chiếu tương đối tới gốc được phân giải tương đối với origin của base.
    Để biết thêm thông tin, xem [Phân giải các tham chiếu tương đối tới một URL](/en-US/docs/Web/API/URL_API/Resolving_relative_references).

> [!NOTE]
> Các đối số `url` và `base` sẽ lần lượt được stringify từ bất kỳ giá trị nào bạn truyền vào, chẳng hạn như một phần tử {{domxref("HTMLAnchorElement")}} hoặc {{domxref("HTMLAreaElement")}}, giống như các Web API khác chấp nhận một chuỗi.
> Đặc biệt, bạn có thể dùng một đối tượng {{domxref("URL")}} hiện có cho bất kỳ đối số nào, và nó sẽ được stringify từ thuộc tính {{domxref("URL.href", "href")}} của đối tượng.

### Giá trị trả về

Một `URL` nếu các tham số có thể được phân giải thành URL hợp lệ; `null` nếu không.

## Ví dụ

[Phân giải các tham chiếu tương đối tới một URL](/en-US/docs/Web/API/URL_API/Resolving_relative_references) và [`URL()` constructor](/en-US/docs/Web/API/URL/URL#examples) cung cấp thêm ví dụ minh họa cách các giá trị `url` và `base` khác nhau được phân giải thành một URL tuyệt đối cuối cùng (dù chủ yếu dùng `URL()`).

### Cách dùng `URL.parse()`

Ví dụ trực tiếp này minh họa cách dùng phương thức tĩnh `URL.parse()` với một vài giá trị URL tuyệt đối và tham chiếu tương đối khác nhau.

```html hidden
<pre id="log"></pre>
```

```css hidden
#log {
  height: 100px;
  overflow: scroll;
  padding: 0.5rem;
  border: 1px solid black;
}
```

```js hidden
const logElement = document.getElementById("log");
function log(text) {
  logElement.innerText += `${text}\n`;
}
```

Trước hết chúng ta kiểm tra xem phương thức `URL.parse()` có được hỗ trợ hay không bằng điều kiện `"parse" in URL`.
Nếu phương thức được hỗ trợ, chúng ta ghi lại kết quả của việc kiểm tra một URL tuyệt đối, một tham chiếu tương đối và một URL cơ sở, một tham chiếu tương đối với một [URL cơ sở phức tạp hơn](/en-US/docs/Web/API/URL_API/Resolving_relative_references), một URL tuyệt đối hợp lệ với một URL cơ sở hợp lệ (không được dùng), và một URL cơ sở không hợp lệ dẫn đến việc phương thức trả về `null`.

Chúng ta cũng ghi lại trường hợp `URL.parse()` không được hỗ trợ.

```js
if ("parse" in URL) {
  // URL tuyệt đối
  let result = URL.parse("https://developer.mozilla.org/en-US/docs");
  log(`[1]: ${result.href}`);

  // Tham chiếu tương đối tới một URL cơ sở hợp lệ
  result = URL.parse("en-US/docs", "https://developer.mozilla.org");
  log(`[2]: ${result.href}`);

  // Tham chiếu tương đối tới một URL cơ sở hợp lệ "phức tạp"
  // (chỉ scheme và domain được dùng để phân giải url)
  result = URL.parse(
    "/different/place",
    "https://developer.mozilla.org:443/some/path?id=4",
  );
  log(`[3]: ${result.href}`);

  // Đối số URL tuyệt đối (bỏ qua URL cơ sở)
  result = URL.parse(
    "https://example.org/some/docs",
    "https://developer.mozilla.org",
  );
  log(`[4]: ${result.href}`);

  // URL cơ sở không hợp lệ (thiếu dấu hai chấm)
  result = URL.parse("en-US/docs", "https//developer.mozilla.org");
  log(`[5]: ${result}`);
} else {
  log("URL.parse() not supported");
}
```

Cuối cùng, đoạn mã dưới đây minh họa rằng các đối số không nhất thiết phải là chuỗi, bằng cách truyền một đối tượng `URL` cho tham số `base`.

```js
if ("parse" in URL) {
  // Tham chiếu tương đối với URL cơ sở được cung cấp dưới dạng đối tượng URL
  result = URL.parse("/en-US/docs", new URL("https://developer.mozilla.org/"));
  log(`[6]: ${result.href}`);
}
```

Kết quả của từng kiểm tra được hiển thị bên dưới.

{{EmbedLiveSample('URL.parse()', '100%')}}

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [`URL()` constructor](/en-US/docs/Web/API/URL/URL), một lựa chọn thay thế không ném lỗi nếu các tham số xác định một URL không hợp lệ
- [Polyfill của `URL.parse()`](https://github.com/zloirock/core-js#url-and-urlsearchparams) có sẵn trong [`core-js`](https://github.com/zloirock/core-js)
