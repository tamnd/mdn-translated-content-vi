---
title: "URLPattern: test() method"
short-title: test()
slug: Web/API/URLPattern/test
page-type: web-api-instance-method
browser-compat: api.URLPattern.test
---

{{APIRef("URL Pattern API")}} {{AvailableInWorkers}}

Phương thức **`test()`** của giao diện {{domxref("URLPattern")}} nhận một chuỗi URL hoặc một đối tượng chứa các phần của URL, và trả về một giá trị boolean cho biết input đã cho có khớp với mẫu hiện tại hay không.

## Cú pháp

```js-nolint
test(input)
test(url)
test(url, baseURL)
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

Một {{jsxref("boolean")}}.

### Ngoại lệ

- {{jsxref("TypeError")}}
  - : Cho biết rằng đã cung cấp `baseURL` khi truyền một đối tượng [`input`](#input) (tham số này chỉ nên được truyền cùng chuỗi `url`).

## Mô tả

Phương thức được gọi trên một {{domxref("URLPattern")}}, chỉ định input URL dưới dạng chuỗi với một URL cơ sở tùy chọn, hoặc dưới dạng đối tượng với các thuộc tính cho từng phần URL.

Phương thức trả về `true` nếu tất cả các thành phần của URL/input kiểm tra đều khớp với mọi thành phần của mẫu, và trả về `false` nếu bất kỳ thành phần nào không khớp.
Phương thức cũng trả về `false` nếu truyền một `url` tương đối nhưng không chỉ định `baseURL` (không thể phân giải thành URL kiểm tra tuyệt đối).
Lưu ý rằng khi truyền một đối tượng `input`, `input.baseURL` luôn là tùy chọn.

### Kế thừa từ baseURL

Các phần URL cụ thể hơn so với phần ít cụ thể nhất được định nghĩa trong `url` có thể được kế thừa từ `baseURL` (hoặc từ `input.baseURL` đối với `input`).
Hiểu đơn giản, điều này có nghĩa là nếu phần `pathname` được chỉ định trong input, các phần ở bên trái của nó trong URL có thể được kế thừa từ URL cơ sở (`protocol`, `hostname` và `port`), còn các phần ở bên phải thì không (`search` và `hash`).
`username` và `password` không bao giờ được kế thừa từ URL cơ sở.

Để biết thêm thông tin, xem [Kế thừa từ base URL](/en-US/docs/Web/API/URL_Pattern_API#inheritance_from_a_base_url) trong phần tổng quan của API.

## Ví dụ

Các ví dụ sau cho thấy cách dùng phương thức `test()` để khớp một URL với một mẫu.
Trong mỗi trường hợp, kết quả của `test()` được in ra console.

### Kiểm tra một URL tuyệt đối

Đầu tiên, chúng ta định nghĩa mẫu sẽ dùng để khớp URL.
Mẫu này khớp với các URL có protocol là `http` hoặc `https`, là các miền con của `.example.com` và có đường dẫn là `/books/` theo sau bởi bất kỳ giá trị nào.

```js
const pattern = new URLPattern("http{s}?://*.example.com/books/:id");
```

Tiếp theo, chúng ta khớp với hai chuỗi URL tuyệt đối.
Chuỗi đầu tiên khớp nhưng chuỗi thứ hai thì không, vì URL kiểm tra không phải là miền con của `example.com`.

```js
console.log(pattern.test("https://store.example.com/books/123")); // true
console.log(pattern.test("https://example.com/books/123")); // false
```

### Kiểm tra một URL tương đối

Ví dụ này dùng cùng mẫu như trên để kiểm tra với một số URL tương đối.

```js
const pattern = new URLPattern("http{s}?://*.example.com/books/:id");
```

Tiếp theo, chúng ta khớp với một số URL tương đối.
Trường hợp đầu khớp vì URL sau khi phân giải là `https://store.example.com/books/123`, trong khi trường hợp thứ hai thì không vì URL đã phân giải không phải là miền con của `example.com`.

```js
console.log(pattern.test("/books/123", "http://store.example.com")); // true
console.log(pattern.test("/books/123", "http://example.com")); // false
```

Kiểm tra này không khớp vì URL được cung cấp là tương đối và không có `baseURL`.
Lưu ý rằng bạn có thể định nghĩa một kiểm tra chỉ khớp với pathname, nhưng cần dùng input dạng đối tượng.

```js
console.log(pattern.test("/books/123")); // false
```

Kiểm tra này không khớp vì URL cơ sở không phải là một URL hợp lệ, và cùng với `/books/123` thì không phân giải được thành một URL tuyệt đối.

```js
console.log(pattern.test("/books/123", "data:text/plain,hello world!")); // false
```

### Kiểm tra một đối tượng URL

Ví dụ này dùng cùng mẫu như trên để kiểm tra với một số URL được định nghĩa dưới dạng đối tượng có cấu trúc.

```js
const pattern = new URLPattern("http{s}?://*.example.com/books/:id");
```

## Đặc tả

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
