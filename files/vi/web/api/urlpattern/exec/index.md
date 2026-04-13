---
title: "URLPattern: exec() method"
short-title: exec()
slug: Web/API/URLPattern/exec
page-type: web-api-instance-method
browser-compat: api.URLPattern.exec
---

{{APIRef("URL Pattern API")}} {{AvailableInWorkers}}

Phương thức **`exec()`** của giao diện {{domxref("URLPattern")}} nhận một URL hoặc một đối tượng chứa các phần của URL, và trả về một đối tượng chứa kết quả khớp của URL với mẫu, hoặc `null` nếu URL không khớp với mẫu.

## Cú pháp

```js-nolint
exec(input)
exec(url)
exec(url, baseURL)
```

### Tham số

- `input`
  - : Một đối tượng cung cấp các phần URL riêng lẻ.
    Các thành viên của đối tượng có thể là `protocol`, `username`, `password`, `hostname`, `port`, `pathname`, `search`, `hash`, hoặc `baseURL`.
- `url`
  - : Một chuỗi xác định một URL tuyệt đối hoặc tương đối.
    Nếu là URL tương đối, thì cũng phải cung cấp [`baseURL`](#baseurl) và cùng nhau chúng phải phân giải thành một URL tuyệt đối.
    Nếu input không thể được phân tích, hoặc cung cấp URL tương đối mà không có base URL, phương thức sẽ trả về `false`.
- `baseURL` {{optional_inline}}
  - : Chuỗi biểu diễn URL cơ sở để dùng trong trường hợp [`url`](#url) là một URL tương đối.
    Nếu không chỉ định, giá trị mặc định là `undefined`.
    Nếu được cung cấp nhưng URL cơ sở không thể được phân tích, phương thức sẽ trả về `false`.

Các phần URL không được chỉ định trong `url`/`input` có thể được [kế thừa từ URL cơ sở](#inheritance_from_a_baseurl) trong một số trường hợp.
Các phần bị bỏ qua được coi là chuỗi rỗng.

### Giá trị trả về

Một {{jsxref("object")}} định nghĩa các phần tử và nhóm khớp, hoặc `null` nếu input đã truyền không khớp với mẫu.

Đối tượng có các thuộc tính sau:

- `inputs`
  - : Mảng chứa các input đã truyền vào hàm `exec()`.
    Mảng này sẽ chứa đối tượng `input` đã truyền, chuỗi `url` tuyệt đối, hoặc một `url` tương đối và một `baseURL`.

- `protocol`, `username`, `password`, `hostname`, `port`, `pathname`, `search`, và `hash`
  - : Các thuộc tính được đặt tên cho từng phần URL.
    Mỗi thuộc tính chứa một đối tượng với các thuộc tính sau:
    - `input`
      - : Phần của input tương ứng với thuộc tính phần URL hiện tại (phần này phải đã khớp với mẫu).
        Phần này có thể là chuỗi rỗng (`""`).
    - `groups`
      - : Đối tượng có các thuộc tính cho từng nhóm khớp trong phần URL (nếu có), cùng các giá trị khớp tương ứng trong input.
        Các thuộc tính nhóm được đánh số từ 0 cho các nhóm khớp không tên (chẳng hạn ký tự đại diện).
        Với các nhóm khớp có tên, tên thuộc tính là tên nhóm.

### Ngoại lệ

- {{jsxref("TypeError")}}
  - : Cho biết rằng đã cung cấp `baseURL` khi truyền một đối tượng [`input`](#input) (tham số này chỉ nên được truyền cùng chuỗi `url`).

## Mô tả

Phương thức được gọi trên một {{domxref("URLPattern")}}, chỉ định input URL dưới dạng chuỗi với một URL cơ sở tùy chọn, hoặc dưới dạng đối tượng với các thuộc tính cho từng phần URL.

Phương thức trả về một đối tượng chứa kết quả khớp URL với mẫu, hoặc `null` nếu URL không khớp với mẫu.
Nó cũng trả về `null` nếu truyền một `url` tương đối nhưng không chỉ định `baseURL` (không thể phân giải thành URL kiểm tra tuyệt đối).
Lưu ý rằng khi truyền một đối tượng `input`, `input.baseURL` luôn là tùy chọn.

### Kế thừa từ baseURL

Các phần URL cụ thể hơn so với phần ít cụ thể nhất được định nghĩa trong `url` có thể được kế thừa từ `baseURL` (hoặc từ `input.baseURL` đối với `input`).
Hiểu đơn giản, điều này có nghĩa là nếu phần `pathname` được chỉ định trong input, các phần ở bên trái của nó trong URL có thể được kế thừa từ URL cơ sở (`protocol`, `hostname` và `port`), còn các phần ở bên phải thì không (`search` và `hash`).
`username` và `password` không bao giờ được kế thừa từ URL cơ sở.

Để biết thêm thông tin, xem [Kế thừa từ base URL](/en-US/docs/Web/API/URL_Pattern_API#inheritance_from_a_base_url) trong phần tổng quan của API.

## Ví dụ

Các ví dụ sau cho thấy cách dùng phương thức `exec()` để khớp một URL với một mẫu.

### Khớp một URL tuyệt đối

Đầu tiên, chúng ta định nghĩa mẫu sẽ dùng để khớp URL.
Mẫu này khớp với các URL có protocol là `http` hoặc `https`, là các miền con của `.example.com` và có đường dẫn là `/books/` theo sau bởi bất kỳ giá trị nào.

```js
const pattern = new URLPattern("http{s}?://*.example.com/books/:id");
```

Tiếp theo, chúng ta kiểm tra chuỗi URL `"https://store.example.com/books/123"` với mẫu này, rồi lần lượt ghi log các đối tượng cho từng thuộc tính.
Lưu ý rằng `input` cho thấy phần input trong URL đã khớp với mẫu.
Trong nhiều trường hợp, đây là chuỗi rỗng (`""`) vì URL đầu vào không chỉ định phần URL cụ thể đó (URL vẫn khớp vì mặc định nó dùng ký tự đại diện cho các phần URL không được chỉ định).

```js
let match = pattern.exec("https://store.example.com/books/123");

console.log(match.inputs); // ['https://store.example.com/books/123']
console.log(match.protocol); // { input: "https", groups: {} }
console.log(match.username); // { input: "", groups: {"0": ""} }
console.log(match.password); // { input: "", groups: {"0": ""} }
console.log(match.hostname); // { input: "store.example.com", groups: { "0": "store" } }
console.log(match.port); // { input: "", groups: {} }
console.log(match.pathname); // { input: "/books/123", groups: { "id": "123" } }
console.log(match.search); // { input: "", groups: {"0": ""} }
console.log(match.hash); // { input: "", groups: {"0": ""} }
```

Lưu ý thêm cách `pathname` đầu vào `"/books/123"` khớp với mẫu `/books/:id`, và `groups` bao gồm một thuộc tính có tên `id` chứa giá trị đã khớp trong input.

### Khớp một URL tương đối

Ví dụ này dùng cùng mẫu như trên để khớp với một số URL tương đối và các URL cơ sở tương ứng của chúng.

```js
const pattern = new URLPattern("http{s}?://*.example.com/books/:id");
```

Đoạn mã dưới đây thực tế khớp cùng một URL tuyệt đối như ở ví dụ trước, nhưng được tách thành một chuỗi `url` tương đối và một URL cơ sở.
Đối tượng trả về chỉ khác ở `inputs`:

```js
match = pattern.exec("/books/123", "http://store.example.com"); // returns object
console.log(match.inputs); // ['/books/123', 'https://store.example.com']
```

Hai ví dụ dưới đây đều trả về `null`.
Ví dụ đầu tiên không khớp vì URL tương đối và URL cơ sở không thể phân giải thành một URL tuyệt đối hợp lệ.
Ví dụ thứ hai không khớp vì không cung cấp URL cơ sở.

```js
pattern.exec("/books/123", "data:text/plain,hello world!"); // returns null
pattern.exec("/books/123"); // returns null
```

### Khớp với một đối tượng URL

Ví dụ này dùng cùng mẫu như trên để khớp với một số URL được định nghĩa dưới dạng đối tượng có cấu trúc.

```js
const pattern = new URLPattern("http{s}?://*.example.com/books/:id");
```

Đoạn mã này kiểm tra cùng URL đã dùng trong ví dụ trước [Khớp một URL tuyệt đối](#matching_an_absolute_url).
Trong trường hợp này, nó vẫn được truyền dưới dạng một đối tượng có cấu trúc.
Vì đó là cùng một URL, điều duy nhất thay đổi là mảng thuộc tính `inputs` sẽ chứa đối tượng được truyền bên dưới.

```js
pattern.exec({
  protocol: "https",
  hostname: "store.example.com",
  pathname: "/books/123",
}); // returns object
```

Đoạn mã sau cũng khớp, nhưng lần này `protocol` là `http`, được kế thừa từ `baseURL`.
Đối tượng trả về sẽ tương tự, ngoại trừ `protocol.input` sẽ là `http`, và mảng `inputs` sẽ khớp với đối tượng đã truyền.

```js
pattern.exec({
  pathname: "/books/123",
  baseURL: "http://store.example.com",
}); // returns object
```

Đoạn mã sau không khớp vì protocol `file` không nằm trong các tùy chọn được chỉ định trong mẫu (`http` hoặc `https`).
Điều này trả về `null`.

```js
pattern.exec({
  protocol: "file",
  hostname: "store.example.com",
  pathname: "/books/123",
}); // returns null
```

## Đặc tả

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- Có một polyfill cho `URLPattern` trên [GitHub](https://github.com/kenchris/urlpattern-polyfill)
