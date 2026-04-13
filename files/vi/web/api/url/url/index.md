---
title: "URL: phương thức khởi tạo URL()"
short-title: URL()
slug: Web/API/URL/URL
page-type: web-api-constructor
browser-compat: api.URL.URL
---

{{APIRef("URL API")}} {{AvailableInWorkers}}

Constructor **`URL()`** trả về một đối tượng {{domxref("URL")}} mới được tạo, biểu diễn URL được xác định bởi các tham số.

Nếu URL cơ sở được cung cấp hoặc URL kết quả không phải là URL hợp lệ, ngoại lệ JavaScript {{jsxref("TypeError")}} sẽ được ném ra.

## Cú pháp

```js-nolint
new URL(url)
new URL(url, base)
```

### Tham số

- `url`
  - : Một chuỗi hoặc bất kỳ đối tượng nào khác có {{Glossary("stringifier")}} đại diện cho một URL tuyệt đối hoặc một tham chiếu tương đối tới một URL cơ sở.
    Nếu `url` là một tham chiếu tương đối, `base` là bắt buộc, và được dùng để phân giải URL cuối cùng.
    Nếu `url` là một URL tuyệt đối, `base` được cung cấp sẽ không được dùng để tạo URL kết quả.
- `base` {{optional_inline}}
  - : Một chuỗi đại diện cho URL cơ sở dùng trong trường hợp `url` là một tham chiếu tương đối.
    Nếu không chỉ định, giá trị mặc định là `undefined`.

    Khi chỉ định `base`, URL được phân giải không chỉ đơn giản là nối `url` và `base`.
    Các tham chiếu tương đối tới thư mục cha và thư mục hiện tại được phân giải tương đối với thư mục hiện tại của URL `base`, bao gồm các đoạn đường dẫn cho tới dấu gạch chéo cuối cùng, nhưng không bao gồm những phần sau đó.
    Các tham chiếu tương đối tới gốc được phân giải tương đối với origin của base.
    Để biết thêm thông tin, xem [Phân giải các tham chiếu tương đối tới một URL](/en-US/docs/Web/API/URL_API/Resolving_relative_references).

> [!NOTE]
> Các đối số `url` và `base` sẽ lần lượt được stringify từ bất kỳ giá trị nào bạn truyền vào, chẳng hạn như một phần tử {{domxref("HTMLAnchorElement")}} hoặc {{domxref("HTMLAreaElement")}}, giống như các Web API khác chấp nhận một chuỗi.
> Đặc biệt, bạn có thể dùng một đối tượng {{domxref("URL")}} hiện có cho bất kỳ đối số nào, và nó sẽ được stringify từ thuộc tính {{domxref("URL.href", "href")}} của đối tượng.

### Ngoại lệ

- {{jsxref("TypeError")}}
  - : `url` (trong trường hợp URL tuyệt đối) hoặc `base` + `url` (trong trường hợp tham chiếu tương đối) không phải là một URL hợp lệ.

## Ví dụ

Dưới đây là một vài ví dụ về cách dùng constructor.

> [!NOTE]
> [Phân giải các tham chiếu tương đối tới một URL](/en-US/docs/Web/API/URL_API/Resolving_relative_references) cung cấp thêm ví dụ minh họa cách các giá trị `url` và `base` khác nhau được phân giải thành một URL tuyệt đối cuối cùng.

```js
// URL cơ sở:
let baseUrl = "https://developer.mozilla.org";

let a = new URL("/", baseUrl);
// => 'https://developer.mozilla.org/'

let b = new URL(baseUrl);
// => 'https://developer.mozilla.org/'

new URL("en-US/docs", b);
// => 'https://developer.mozilla.org/en-US/docs'

let d = new URL("/en-US/docs", b);
// => 'https://developer.mozilla.org/en-US/docs'

new URL("/en-US/docs", d);
// => 'https://developer.mozilla.org/en-US/docs'

new URL("/en-US/docs", a);
// => 'https://developer.mozilla.org/en-US/docs'

new URL("/en-US/docs", "https://developer.mozilla.org/fr-FR/toto");
// => 'https://developer.mozilla.org/en-US/docs'
```

Dưới đây là một vài ví dụ về URL không hợp lệ:

```js
new URL("/en-US/docs", "");
// Raises a TypeError exception as '' is not a valid URL

new URL("/en-US/docs");
// Raises a TypeError exception as '/en-US/docs' is not a valid URL

// Các trường hợp khác:

new URL("http://www.example.com");
// => 'http://www.example.com/'

new URL("http://www.example.com", B);
// => 'http://www.example.com/'

new URL("", "https://example.com/?query=1");
// => 'https://example.com/?query=1' (Edge before 79 removes query arguments)

new URL("/a", "https://example.com/?query=1");
// => 'https://example.com/a' (see relative URLs)

new URL("//foo.example", "https://example.com");
// => 'https://foo.example/' (see relative URLs)
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("URL.parse_static", "URL.parse()")}}, một lựa chọn thay thế không ném lỗi cho constructor này
- [Polyfill của `URL` trong `core-js`](https://github.com/zloirock/core-js#url-and-urlsearchparams)
- Giao diện mà nó thuộc về: {{domxref("URL")}}.
