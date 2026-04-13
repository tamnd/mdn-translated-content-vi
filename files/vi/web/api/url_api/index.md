---
title: URL API
slug: Web/API/URL_API
page-type: web-api-overview
browser-compat:
  - api.URL
  - api.URLSearchParams
spec-urls: https://url.spec.whatwg.org/#api
---

{{DefaultAPISidebar("URL API")}} {{AvailableInWorkers}}

URL API là một thành phần của tiêu chuẩn URL, xác định những gì cấu thành một {{Glossary("URL", "Uniform Resource Locator")}} hợp lệ và API truy cập và thao tác URL. Tiêu chuẩn URL cũng định nghĩa các khái niệm như tên miền, máy chủ và địa chỉ IP, và cũng cố gắng mô tả theo cách tiêu chuẩn kiểu MIME `application/x-www-form-urlencoded` cũ được sử dụng để gửi nội dung form web dưới dạng tập hợp các cặp khóa/giá trị.

## Khái niệm và cách sử dụng

Phần lớn tiêu chuẩn URL được dành cho [định nghĩa về URL](/en-US/docs/Learn_web_development/Howto/Web_mechanics/What_is_a_URL) và cách nó được cấu trúc và phân tích. Cũng được đề cập là các định nghĩa về các thuật ngữ khác nhau liên quan đến địa chỉ máy tính trên mạng, và các thuật toán phân tích địa chỉ IP và DOM được chỉ định. Thú vị hơn với hầu hết các nhà phát triển là bản thân API.

### Truy cập các thành phần URL

Tạo đối tượng {{domxref("URL")}} cho một URL đã cho sẽ phân tích URL và cung cấp quyền truy cập nhanh vào các thành phần của nó thông qua các thuộc tính của nó.

```js
let addr = new URL("https://developer.mozilla.org/en-US/docs/Web/API/URL_API");
let host = addr.host;
let path = addr.pathname;
```

### Thay đổi URL

Hầu hết các thuộc tính của `URL` đều có thể đặt; bạn có thể ghi các giá trị mới cho chúng để thay đổi URL được đại diện bởi đối tượng. Ví dụ, để tạo URL và đặt tên người dùng:

```js
let myUsername = "some-guy";
let addr = new URL("https://example.com/login");
addr.username = myUsername;
```

### Truy vấn

Thuộc tính {{domxref("URL.search", "search")}} trên `URL` chứa phần chuỗi truy vấn của URL. Bạn cũng có thể tra cứu giá trị của các tham số riêng lẻ bằng phương thức {{domxref("URLSearchParams.get", "get()")}} của đối tượng {{domxref("URLSearchParams")}}.

```js
let addr = new URL("https://example.com/login?user=some-guy&page=news");
try {
  loginUser(addr.searchParams.get("user"));
  gotoPage(addr.searchParams.get("page"));
} catch (err) {
  showErrorMessage(err);
}
```

## Giao diện

URL API đơn giản, chỉ có một vài giao diện:

- {{domxref("URL")}}
  - : Có thể được sử dụng để phân tích, xây dựng, chuẩn hóa và mã hóa {{glossary("URL", "URL")}}.
- {{domxref("URLSearchParams")}}
  - : Định nghĩa các phương thức tiện ích để làm việc với chuỗi truy vấn của URL.

## Ví dụ

### Phân tích tham số URL bằng URL API

```js
const table = document.querySelector(".param-table");

const url = new URL(document.location.href);
url.searchParams.sort();
const keys = url.searchParams.keys();

for (let key of keys) {
  let val = url.searchParams.get(key);
  let row = document.createElement("tr");
  let cell = document.createElement("td");
  cell.innerText = key;
  row.appendChild(cell);
  cell = document.createElement("td");
  cell.innerText = val;
  row.appendChild(cell);
  table.appendChild(row);
}
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("Fetch API", "", "", "nocode")}}
- Kiểu CSS {{cssxref("url_value", "&lt;url&gt;")}}
- {{jsxref("encodeURI", "encodeURI()")}}
- {{jsxref("encodeURIComponent", "encodeURIComponent()")}}
