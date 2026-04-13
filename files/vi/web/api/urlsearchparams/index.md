---
title: URLSearchParams
slug: Web/API/URLSearchParams
page-type: web-api-interface
browser-compat: api.URLSearchParams
---

{{ApiRef("URL API")}} {{AvailableInWorkers}}

Giao diện **`URLSearchParams`** định nghĩa các phương thức tiện ích để làm việc với chuỗi truy vấn của một URL.

Các đối tượng `URLSearchParams` là [có thể lặp](/en-US/docs/Web/JavaScript/Reference/Iteration_protocols#the_iterable_protocol), nên có thể được dùng trực tiếp trong cấu trúc {{jsxref("Statements/for...of", "for...of")}} để lặp qua các cặp khóa/giá trị theo đúng thứ tự chúng xuất hiện trong chuỗi truy vấn. Ví dụ, hai dòng sau là tương đương:

```js
for (const [key, value] of mySearchParams) {
}
for (const [key, value] of mySearchParams.entries()) {
}
```

Mặc dù `URLSearchParams` có chức năng tương tự {{jsxref("Map")}}, khi lặp qua nó, bạn có thể gặp một số [cạm bẫy](/en-US/docs/Web/JavaScript/Reference/Iteration_protocols#concurrent_modifications_when_iterating) mà `Map` không gặp phải do cách nó được triển khai.

## Constructor

- {{domxref("URLSearchParams.URLSearchParams", 'URLSearchParams()')}}
  - : Trả về một thể hiện đối tượng `URLSearchParams`.

## Thuộc tính thể hiện

- {{domxref("URLSearchParams.size", 'size')}} {{ReadOnlyInline}}
  - : Cho biết tổng số mục tham số truy vấn.

## Phương thức thể hiện

- `URLSearchParams[Symbol.iterator]()`
  - : Trả về một {{jsxref("Iteration_protocols","iterator")}} cho phép lặp qua tất cả các cặp khóa/giá trị có trong đối tượng này theo đúng thứ tự chúng xuất hiện trong chuỗi truy vấn.
- {{domxref("URLSearchParams.append()")}}
  - : Thêm một cặp khóa/giá trị được chỉ định như một tham số truy vấn mới.
- {{domxref("URLSearchParams.delete()")}}
  - : Xóa các tham số truy vấn khớp với một tên, và tùy chọn một giá trị, khỏi danh sách tất cả các tham số truy vấn.
- {{domxref("URLSearchParams.entries()")}}
  - : Trả về một {{jsxref("Iteration_protocols","iterator")}} cho phép lặp qua tất cả các cặp khóa/giá trị có trong đối tượng này theo đúng thứ tự chúng xuất hiện trong chuỗi truy vấn.
- {{domxref("URLSearchParams.forEach()")}}
  - : Cho phép lặp qua tất cả các giá trị có trong đối tượng này thông qua một hàm callback.
- {{domxref("URLSearchParams.get()")}}
  - : Trả về giá trị đầu tiên gắn với tham số truy vấn đã cho.
- {{domxref("URLSearchParams.getAll()")}}
  - : Trả về tất cả các giá trị gắn với một tham số truy vấn đã cho.
- {{domxref("URLSearchParams.has()")}}
  - : Trả về một giá trị boolean cho biết liệu một tham số đã cho, hoặc cặp tham số và giá trị, có tồn tại hay không.
- {{domxref("URLSearchParams.keys()")}}
  - : Trả về một {{jsxref("Iteration_protocols", "iterator")}} cho phép lặp qua tất cả các khóa của các cặp khóa/giá trị có trong đối tượng này.
- {{domxref("URLSearchParams.set()")}}
  - : Đặt giá trị gắn với một tham số truy vấn đã cho thành giá trị đã chỉ định. Nếu có nhiều giá trị, các giá trị còn lại sẽ bị xóa.
- {{domxref("URLSearchParams.sort()")}}
  - : Sắp xếp tất cả các cặp khóa/giá trị, nếu có, theo khóa của chúng.
- {{domxref("URLSearchParams.toString()")}}
  - : Trả về một chuỗi chứa chuỗi truy vấn phù hợp để dùng trong URL.
- {{domxref("URLSearchParams.values()")}}
  - : Trả về một {{jsxref("Iteration_protocols", "iterator")}} cho phép lặp qua tất cả các giá trị của các cặp khóa/giá trị có trong đối tượng này.

## Ví dụ

### Sử dụng URLSearchParams

```js
const paramsString = "q=URLUtils.searchParams&topic=api";
const searchParams = new URLSearchParams(paramsString);

// Lặp qua các tham số truy vấn
for (const p of searchParams) {
  console.log(p);
}

console.log(searchParams.has("topic")); // true
console.log(searchParams.has("topic", "fish")); // false
console.log(searchParams.get("topic") === "api"); // true
console.log(searchParams.getAll("topic")); // ["api"]
console.log(searchParams.get("foo") === null); // true
console.log(searchParams.append("topic", "webdev"));
console.log(searchParams.toString()); // "q=URLUtils.searchParams&topic=api&topic=webdev"
console.log(searchParams.set("topic", "More webdev"));
console.log(searchParams.toString()); // "q=URLUtils.searchParams&topic=More+webdev"
console.log(searchParams.delete("topic"));
console.log(searchParams.toString()); // "q=URLUtils.searchParams"
```

Tham số truy vấn cũng có thể là một đối tượng.

```js
const paramsObj = { foo: "bar", baz: "bar" };
const searchParams = new URLSearchParams(paramsObj);

console.log(searchParams.toString()); // "foo=bar&baz=bar"
console.log(searchParams.has("foo")); // true
console.log(searchParams.get("foo")); // "bar"
```

### Phân tích `window.location`

Không giống như {{domxref("URL")}}, giao diện {{domxref("Location")}} không cung cấp sẵn thuộc tính `searchParams`. Chúng ta có thể phân tích `location.search` bằng `URLSearchParams`.

```js
// Giả sử trang có location:
// https://developer.mozilla.org/en-US/docs/Web/API/URLSearchParams?foo=a
const paramsString = window.location.search;
const searchParams = new URLSearchParams(paramsString);
console.log(searchParams.get("foo")); // a
```

### Tham số truy vấn trùng lặp

```js
const paramStr = "foo=bar&foo=baz";
const searchParams = new URLSearchParams(paramStr);

console.log(searchParams.toString()); // "foo=bar&foo=baz"
console.log(searchParams.has("foo")); // true
console.log(searchParams.get("foo")); // bar, chỉ trả về giá trị đầu tiên
console.log(searchParams.getAll("foo")); // ["bar", "baz"]
```

### Không phân tích URL

Constructor `URLSearchParams` _không_ phân tích các URL đầy đủ. Tuy nhiên, nó sẽ bỏ ký tự `'?'` đứng đầu nếu chuỗi có ký tự này.

```js
const paramsString1 = "http://example.com/search?query=%40";
const searchParams1 = new URLSearchParams(paramsString1);

console.log(searchParams1.has("query")); // false
console.log(searchParams1.has("http://example.com/search?query")); // true

console.log(searchParams1.get("query")); // null
console.log(searchParams1.get("http://example.com/search?query")); // "@" (tương đương với decodeURIComponent('%40'))

const paramsString2 = "?query=value";
const searchParams2 = new URLSearchParams(paramsString2);
console.log(searchParams2.has("query")); // true

const url = new URL("http://example.com/search?query=%40");
const searchParams3 = new URLSearchParams(url.search);
console.log(searchParams3.has("query")); // true
```

### Mã hóa phần trăm

Các đối tượng `URLSearchParams` [mã hóa phần trăm](/en-US/docs/Glossary/Percent-encoding) mọi thứ trong [tập hợp mã hóa phần trăm `application/x-www-form-urlencoded`](https://url.spec.whatwg.org/#application-x-www-form-urlencoded-percent-encode-set) (bao gồm tất cả các điểm mã trừ ký tự chữ-số ASCII, `*`, `-`, `.`, và `_`), và mã hóa U+0020 SPACE thành `+`. Tuy nhiên, nó chỉ xử lý mã hóa phần trăm khi tuần tự hóa và giải tuần tự hóa toàn bộ cú pháp tham số truy vấn URL. Khi làm việc với các khóa và giá trị riêng lẻ, bạn luôn dùng phiên bản chưa mã hóa.

```js
// Tạo từ việc phân tích một chuỗi: phần mã hóa phần trăm được giải mã
const params = new URLSearchParams("%24%25%26=%28%29%2B");
// Lấy tất cả khóa/giá trị: chỉ các giá trị đã giải mã được trả về
console.log([...params]); // [["$%&", "()+"]]
// Lấy một giá trị riêng lẻ: dùng khóa đã giải mã và nhận giá trị đã giải mã
console.log(params.get("$%&")); // "()+"
console.log(params.get("%24%25%26")); // null
// Đặt một giá trị riêng lẻ: dùng khóa và giá trị chưa mã hóa
params.append("$%&$#@+", "$#&*@#()+");
// Tuần tự hóa: mã hóa phần trăm được áp dụng
console.log(params.toString());
// "%24%25%26=%28%29%2B&%24%25%26%24%23%40%2B=%24%23%26*%40%23%28%29%2B"
```

Nếu bạn thêm một cặp khóa/giá trị với khóa đã được mã hóa phần trăm, khóa đó sẽ được xem là chưa mã hóa và được mã hóa lại.

```js
const params = new URLSearchParams();

params.append("%24%26", "value");
params.toString(); // "%2524%2526=value"
```

### Giữ nguyên dấu cộng

Constructor `URLSearchParams` diễn giải dấu cộng (`+`) là khoảng trắng, điều này có thể gây ra vấn đề. Trong ví dụ dưới đây, chúng ta dùng [chuỗi thoát thập lục phân](/en-US/docs/Web/JavaScript/Reference/Lexical_grammar#hexadecimal_escape_sequences) để mô phỏng một chuỗi chứa dữ liệu nhị phân (mỗi byte đều mang thông tin) cần được lưu trong tham số truy vấn URL. Hãy chú ý rằng chuỗi đã mã hóa do `btoa()` tạo ra có chứa `+` và không được `URLSearchParams` giữ nguyên.

```js
const rawData = "\x13à\x17@\x1F\x80";
const base64Data = btoa(rawData); // 'E+AXQB+A'

const searchParams = new URLSearchParams(`bin=${base64Data}`); // 'bin=E+AXQB+A'
const binQuery = searchParams.get("bin"); // 'E AXQB A', '+' được thay thế bằng khoảng trắng

console.log(atob(binQuery) === rawData); // false
```

Đừng bao giờ tạo đối tượng `URLSearchParams` bằng các chuỗi được nội suy động. Thay vào đó, hãy dùng phương thức `append()`, như đã nói ở trên, vì nó diễn giải mọi ký tự theo đúng nguyên dạng.

```js
const rawData = "\x13à\x17@\x1F\x80";
const base64Data = btoa(rawData); // 'E+AXQB+A'

const searchParams = new URLSearchParams();
searchParams.append("bin", base64Data); // 'bin=E%2BAXQB%2BA'
const binQuery = searchParams.get("bin"); // 'E+AXQB+A'

console.log(atob(binQuery) === rawData); // true
```

### Tương tác với URL.searchParams

Thuộc tính {{domxref("URL.searchParams")}} hiển thị chuỗi {{domxref("URL.search", "search")}} của URL dưới dạng một đối tượng `URLSearchParams`. Khi cập nhật `URLSearchParams` này, `search` của URL sẽ được cập nhật bằng biểu diễn tuần tự của nó. Tuy nhiên, `URL.search` mã hóa một tập con các ký tự mà `URLSearchParams` cũng mã hóa, và mã hóa khoảng trắng thành `%20` thay vì `+`. Điều này có thể dẫn đến một số tương tác bất ngờ - nếu bạn cập nhật `searchParams`, ngay cả với cùng các giá trị, URL có thể được tuần tự hóa khác đi.

```js
const url = new URL("https://example.com/?a=b ~");
console.log(url.href); // "https://example.com/?a=b%20~"
console.log(url.searchParams.toString()); // "a=b+%7E"
// Đáng lẽ không thay đổi gì, nhưng lại làm thay đổi truy vấn URL thành
// biểu diễn tuần tự của searchParams
url.searchParams.sort();
console.log(url.href); // "https://example.com/?a=b+%7E"

const url2 = new URL("https://example.com?search=1234&param=my%20param");
console.log(url2.search); // "?search=1234&param=my%20param"
url2.searchParams.delete("search");
console.log(url2.search); // "?param=my+param"
```

### Giá trị rỗng so với không có giá trị

`URLSearchParams` không phân biệt giữa một tham số không có gì sau dấu `=`, và một tham số hoàn toàn không có `=`.

```js
const emptyVal = new URLSearchParams("foo=&bar=baz");
console.log(emptyVal.get("foo")); // trả về ''
const noEquals = new URLSearchParams("foo&bar=baz");
console.log(noEquals.get("foo")); // cũng trả về ''
console.log(noEquals.toString()); // 'foo=&bar=baz'
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Polyfill của `URLSearchParams` trong `core-js`](https://github.com/zloirock/core-js#url-and-urlsearchparams)
- Giao diện {{domxref("URL")}}.
- [Google Developers: Thao tác URL dễ dàng với URLSearchParams](https://developer.chrome.com/blog/urlsearchparams/)
