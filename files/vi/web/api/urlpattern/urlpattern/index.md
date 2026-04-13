---
title: "URLPattern: URLPattern() constructor"
short-title: URLPattern()
slug: Web/API/URLPattern/URLPattern
page-type: web-api-constructor
browser-compat: api.URLPattern.URLPattern
---

{{APIRef("URL Pattern API")}} {{AvailableInWorkers}}

Hàm tạo **`URLPattern()`** trả về một đối tượng {{domxref("URLPattern")}} mới biểu diễn các URL sẽ được khớp bởi mẫu này.

## Cú pháp

```js-nolint
new URLPattern(input)
new URLPattern(input, options)
new URLPattern(url)
new URLPattern(url, baseURL)
new URLPattern(url, baseURL, options)
```

### Tham số

- `input` {{Optional_Inline}}
  - : Một đối tượng có các thuộc tính riêng biệt để xác định [các mẫu](/en-US/docs/Web/API/URL_Pattern_API#pattern_syntax) dùng để khớp từng phần của URL.

    Các thành viên của đối tượng có thể là bất kỳ (hoặc không là) của:
    - `protocol` {{Optional_Inline}}
      - : Mẫu khớp với [protocol](/en-US/docs/Web/API/URL/protocol) của URL, chẳng hạn `http`, `https`, hoặc `"http{s}?"` (để khớp cả https và http).
    - `username` {{Optional_Inline}}
      - : Mẫu khớp với [username](/en-US/docs/Web/API/URL/username) của URL.
    - `password` {{Optional_Inline}}
      - : Mẫu khớp với [password](/en-US/docs/Web/API/URL/password) của URL.
    - `hostname` {{Optional_Inline}}
      - : Mẫu khớp với [hostname](/en-US/docs/Web/API/URL/hostname) của URL.
    - `port` {{Optional_Inline}}
      - : Mẫu khớp với [port](/en-US/docs/Web/API/URL/port) của URL.
    - `pathname` {{Optional_Inline}}
      - : Mẫu khớp với [pathname](/en-US/docs/Web/API/URL/pathname) của URL.
    - `search` {{Optional_Inline}}
      - : Mẫu khớp với [search](/en-US/docs/Web/API/URL/search) của URL.
    - `hash` {{Optional_Inline}}
      - : Mẫu khớp với [hash](/en-US/docs/Web/API/URL/hash) của URL.
    - `baseURL` {{Optional_Inline}}
      - : Chuỗi cung cấp một URL tuyệt đối để từ đó [các thuộc tính đối tượng ít cụ thể hơn chưa được xác định có thể được kế thừa](#inheritance_from_a_baseurl).

- `url` {{Optional_Inline}}
  - : Chuỗi biểu diễn các mẫu URL cần khớp.

    Chuỗi này được định dạng như một URL tuyệt đối hoặc tương đối nhưng có thể chứa các ký hiệu để biểu thị [các mẫu khớp](/en-US/docs/Web/API/URL_Pattern_API#pattern_syntax) và các chuỗi thoát ký tự.
    Nếu được định dạng như một URL tương đối, thì cũng phải cung cấp [`baseURL`](#baseurl_2).

- `baseURL` {{Optional_Inline}}
  - : Chuỗi cung cấp một URL tuyệt đối để từ đó [các phần URL ít cụ thể hơn chưa được xác định có thể được kế thừa](#inheritance_from_a_baseurl)
    Phải đặt giá trị này khi `url` là một URL tương đối, và không được đặt nếu dùng `input` (`input.baseURL` có thể được dùng để cung cấp các giá trị được kế thừa cho `input`, nhưng khác với thuộc tính này, nó không bao giờ là bắt buộc).

- `options` {{Optional_Inline}}
  - : Một đối tượng cung cấp các tùy chọn để khớp với mẫu đã cho.
    Các thành viên được phép của đối tượng là:
    - `ignoreCase` {{Optional_Inline}}
      - : Bật khớp không phân biệt chữ hoa chữ thường nếu đặt là `true`.
        Nếu bỏ qua hoặc đặt là `false`, việc khớp sẽ phân biệt chữ hoa chữ thường.

> [!NOTE]
> Tất cả các phần URL trong thuộc tính `input` và `url` đều là tùy chọn.
> Nếu không chỉ định trong các tham số đó, một số giá trị có thể được [kế thừa](#inheritance_from_a_baseurl) từ `baseURL`, tùy thuộc vào những phần URL khác đã được xác định.
> Các phần bị bỏ qua sẽ được chuẩn hóa thành ký tự đại diện (`*`).

### Ngoại lệ

- {{jsxref("TypeError")}}
  - : Cho biết một trong các trường hợp sau:
    - `input`, `url` hoặc `baseURL` đã cho không hợp lệ hoặc không đúng cú pháp.
    - `url` đã cho là tương đối nhưng không cung cấp `baseURL` để tạo thành một URL tuyệt đối đầy đủ.
    - Có cung cấp `baseURL`, nhưng input là một mẫu tuyệt đối hoặc một đối tượng có cấu trúc.

## Mô tả

Hàm tạo `URLPattern` có thể nhận một đối tượng "input" hoặc một chuỗi URL và `baseURL` tùy chọn.
Cả hai dạng cũng có thể nhận một đối tượng tùy chọn để thiết lập các tùy chọn khớp bổ sung, chẳng hạn như phân biệt chữ hoa chữ thường.

```js
new URLPattern(input);
new URLPattern(url, baseURL);
```

Đối tượng input được dùng trong kiểu hàm tạo thứ nhất mô tả các URL cần được khớp bằng cách chỉ định mẫu cho từng phần URL riêng lẻ: `protocol`, `username`, `password`, `hostname`, `port`, `pathname`, `search`, `hash`, và `baseURL`.
Nếu thuộc tính `baseURL` được cung cấp, nó sẽ được phân tích như một URL và có thể được dùng để điền vào bất kỳ thuộc tính nào bị thiếu (xem phần sau [Kế thừa từ base URL](#inheritance_from_a_baseurl)).
Những thuộc tính bị bỏ qua hoặc không được `baseURL` điền sẽ mặc định thành chuỗi ký tự đại diện (`*`), khớp với bất kỳ giá trị tương ứng nào trong URL.

Kiểu hàm tạo thứ hai nhận một chuỗi URL có thể chứa các mẫu được nhúng vào bên trong.
Chuỗi này có thể chỉ định một URL tuyệt đối hoặc tương đối - nếu mẫu là tương đối, thì phải cung cấp `baseURL` làm đối số thứ hai.
Lưu ý rằng có thể cần [thoát một số ký tự](#escaping_special_characters) trong chuỗi URL nếu không rõ ký tự đó đang phân tách các thành phần URL khác nhau hay là một phần của mẫu.

### Kế thừa từ baseURL

Các phần URL cụ thể hơn so với phần ít cụ thể nhất được định nghĩa trong `url` _có thể_ được kế thừa từ `baseURL` (hoặc từ `input.baseURL` đối với `input`).
Hiểu đơn giản, điều này có nghĩa là nếu phần `pathname` được chỉ định trong input, các phần ở bên trái của nó trong URL có thể được kế thừa từ URL cơ sở (`protocol`, `hostname` và `port`), còn các phần ở bên phải thì không (`search` và `hash`).
`username` và `password` không bao giờ được kế thừa từ URL cơ sở.

Để biết thêm thông tin, xem [Kế thừa từ base URL](/en-US/docs/Web/API/URL_Pattern_API#inheritance_from_a_base_url) trong phần tổng quan của API.

### `Hostname` trong `url` hoặc `baseURL` ảnh hưởng đến cổng mặc định

Khác với các phần URL khác, `port` có thể được đặt ngầm nếu bạn chỉ định một `url` hoặc URL cơ sở (trong tham số `baseURL` hoặc trong đối tượng) và không chỉ định rõ `port`.
Trong trường hợp này, `port` sẽ được đặt thành chuỗi rỗng (`""`) và khớp với cổng mặc định (`443`).

Ví dụ, tất cả các mẫu sau đều đặt mẫu `port` thành `""`:

```js
new URLPattern("https://example.com");
new URLPattern("https://example.com*");
new URLPattern("https://example.com/foo");
new URLPattern({
  pathname: "/foo/*",
  baseURL: "https://example.com",
});
```

Nếu bạn không chỉ định `hostname` trong `url` hoặc `baseURL`, thì `port` sẽ mặc định là chuỗi ký tự đại diện (`*`):

```js
new URLPattern({ pathname: "/foo/*" }); // Port omitted, defaults to '*'
```

#### Thoát ký tự đặc biệt

[Cú pháp mẫu](/en-US/docs/Web/API/URL_Pattern_API#pattern_syntax) bao gồm một số ký tự có thể xuất hiện tự nhiên trong URL, chẳng hạn như:

- `?` biểu thị cả ký tự hoặc nhóm tùy chọn trong một mẫu và phần search của URL.
- `:` biểu thị phần bắt đầu của một nhóm có tên trong mẫu và là dấu phân tách giữa username và password, hoặc giữa hostname và port.

Nếu bạn đang tạo `URLPattern` bằng tham số chuỗi [`url`](#url), các ký tự đặc biệt này sẽ được coi là một phần của cú pháp mẫu nếu có sự nhập nhằng.
Nếu bạn dùng các ký tự đó để biểu diễn các phần của URL thì bạn cần thoát chúng bằng cách đặt trước ký tự `\\` (hoặc tránh vấn đề này bằng cách tạo `URLPattern` theo cú pháp đối tượng).

Ví dụ, mẫu sau thoát ký tự `?`, khiến mẫu này khớp với một phần URL search là "fred"

```js
console.log(new URLPattern("https://example.com/*\\?fred"));
```

Tương tự, ví dụ [Khớp username và password](#match_the_username_and_password) bên dưới cho thấy trường hợp dấu phân tách `:` cần được thoát.

## Ví dụ

### Mẫu mặc định

Đoạn mã này chứng minh rằng các phần URL không được cung cấp trong một URL hoặc [được kế thừa từ URL cơ sở](#inheritance_from_a_baseurl) sẽ mặc định thành giá trị ký tự đại diện.

```js
console.log(new URLPattern());
console.log(new URLPattern({}));
/*
{
  protocol: "*",
  username: "*",
  password: "*",
  hostname: "*",
  port: "*",
  pathname: "*",
  search: "*",
  hash: "*",
  hasRegExpGroups: false,
};
*/
```

### Khớp một pathname

```js
let pattern1 = new URLPattern("https://example.com/books/:id");

// same as
let pattern2 = new URLPattern("/books/:id", "https://example.com");

// or
let pattern3 = new URLPattern({
  protocol: "https",
  hostname: "example.com",
  pathname: "/books/:id",
});

// or
let pattern4 = new URLPattern({
  pathname: "/books/:id",
  baseURL: "https://example.com",
});

// or
let pattern5 = new URLPattern({
  pathname: "/books/:id",
  baseURL: "https://example.com/some/path/?search=3#param=1",
  // More-specific URL parts are discarded
});
```

### Khớp protocol và hostname

```js
let pattern = new URLPattern({
  protocol: "http{s}?",
  hostname: ":subdomain.example.com",
});
```

### Khớp username và password

Đoạn này thiết lập các phần URL username và password bằng chuỗi mẫu.
Lưu ý dấu phân tách `:` cần được thoát như thế nào khi dùng chuỗi mẫu.
Nếu không làm vậy, mẫu username sẽ là `myusername:mypassword`.

```js
const pattern = new URLPattern(
  "https://myusername\\:mypassword@example.com/some/path",
);

console.log(pattern.username); // "myusername"
console.log(pattern.password); // "mypassword"
```

### Khớp tất cả các phần có cấu trúc có thể

```js
let pattern = new URLPattern({
  protocol: "http{s}?",
  username: ":username",
  password: ":password",
  hostname: ":subdomain.example.com",
  port: ":port(80|443)",
  pathname: "/:path",
  search: "*",
  hash: "*",
});
```

### Khớp không phân biệt chữ hoa chữ thường

```js
// Case-sensitive matching by default
const pattern = new URLPattern("https://example.com/2022/feb/*");
console.log(pattern.test("https://example.com/2022/feb/xc44rsz")); // true
console.log(pattern.test("https://example.com/2022/Feb/xc44rsz")); // false
```

Đặt tùy chọn `ignoreCase` thành `true` trong hàm tạo sẽ chuyển mọi thao tác khớp sang chế độ không phân biệt chữ hoa chữ thường cho mẫu đã cho:

```js
// Case-insensitive matching
const pattern = new URLPattern("https://example.com/2022/feb/*", {
  ignoreCase: true,
});
console.log(pattern.test("https://example.com/2022/feb/xc44rsz")); // true
console.log(pattern.test("https://example.com/2022/Feb/xc44rsz")); // true
```

### Kế thừa từ URL cơ sở

Đây là một ví dụ thực tế về kế thừa.
`pathname` được chỉ định rõ ràng. Các giá trị ít cụ thể hơn `pathname`, chẳng hạn như protocol và hostname, sẽ được kế thừa.
Các giá trị cụ thể hơn bị bỏ qua và chuyển về giá trị mặc định của chúng (chẳng hạn `"*"` cho search và hash, và `""` cho port).

```js
const pattern = new URLPattern({
  pathname: "/some/path",
  baseURL: "https://myuser:mypass@example.com/mypath?search=1&p=3#fred",
});

console.log(pattern);
// protocol: https
// username: *
// password: *
// hostname: example.com
// port:
// pathname: /some/path
// search: *
// hash: *
```

## Đặc tả

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- Có một polyfill cho `URLPattern` trên
  [GitHub](https://github.com/kenchris/urlpattern-polyfill)
