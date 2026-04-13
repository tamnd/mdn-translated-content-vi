---
title: Headers
slug: Web/API/Headers
page-type: web-api-interface
browser-compat: api.Headers
---

{{APIRef("Fetch API")}} {{AvailableInWorkers}}

Giao diện **`Headers`** của [Fetch API](/en-US/docs/Web/API/Fetch_API) cho phép bạn thực hiện nhiều thao tác khác nhau trên [các header của HTTP request và response](/en-US/docs/Web/HTTP/Reference/Headers). Các thao tác này bao gồm truy xuất, đặt, thêm và xóa header khỏi danh sách header của request.

Bạn có thể lấy một đối tượng `Headers` thông qua các thuộc tính {{domxref("Request.headers")}} và {{domxref("Response.headers")}}, đồng thời tạo một đối tượng `Headers` mới bằng constructor {{domxref("Headers.Headers", "Headers()")}}. So với việc dùng object thuần, dùng đối tượng `Headers` để gửi request cung cấp thêm một lớp làm sạch đầu vào. Ví dụ, nó chuẩn hóa tên header thành chữ thường, loại bỏ khoảng trắng đầu và cuối khỏi giá trị header, và ngăn không cho một số header nhất định được đặt.

> [!NOTE]
> Bạn có thể tìm hiểu thêm về các header có sẵn bằng cách đọc phần tham chiếu [HTTP headers](/en-US/docs/Web/HTTP/Reference/Headers) của chúng tôi.

## Mô tả

Một đối tượng `Headers` có một danh sách header liên kết, ban đầu rỗng và gồm không hoặc nhiều cặp tên-giá trị. Bạn có thể thêm vào danh sách này bằng các phương thức như {{domxref("Headers.append","append()")}} (xem [Ví dụ](#examples)). Trong mọi phương thức của giao diện này, tên header được so khớp theo chuỗi byte không phân biệt hoa thường.

Một object triển khai `Headers` có thể được dùng trực tiếp trong cấu trúc {{jsxref("Statements/for...of", "for...of")}} thay vì {{domxref('Headers.entries()', 'entries()')}}: `for (const p of myHeaders)` tương đương với `for (const p of myHeaders.entries())`.

### Hạn chế sửa đổi

Một số đối tượng `Headers` có hạn chế đối với việc các phương thức {{domxref("Headers.set","set()")}}, {{domxref("Headers.delete","delete()")}} và {{domxref("Headers.append","append()")}} có thể sửa đổi header hay không. Các hạn chế này được thiết lập tùy theo cách đối tượng `Headers` được tạo.

- Với header được tạo bằng constructor {{domxref("Headers.Headers","Headers()")}}, không có hạn chế sửa đổi nào.
- Với header của đối tượng {{domxref("Request")}}:
  - Nếu {{domxref("Request.mode","mode")}} của request là `no-cors`, bạn có thể sửa đổi mọi tên/giá trị của {{Glossary("CORS-safelisted request header")}}.
  - Nếu không, bạn có thể sửa đổi mọi tên/giá trị của {{Glossary("forbidden request header", "non-forbidden request header")}}.
- Với header của đối tượng {{domxref("Response")}}:
  - Nếu response được tạo bằng {{domxref("Response.error_static", "Response.error()")}} hoặc {{domxref("Response.redirect_static", "Response.redirect()")}}, hoặc được nhận từ một lời gọi {{domxref("Window/fetch", "fetch()")}}, các header là bất biến và không thể sửa đổi.
  - Nếu không, nếu response được tạo bằng {{domxref("Response.Response","Response()")}} hoặc {{domxref("Response.json_static","Response.json()")}}, bạn có thể sửa đổi mọi tên/giá trị của {{Glossary("forbidden response header name", "non-forbidden response header")}}.

Tất cả các phương thức của `Headers` sẽ ném ra {{jsxref("TypeError")}} nếu bạn cố truyền vào một tham chiếu đến tên không phải là [tên HTTP header hợp lệ](https://fetch.spec.whatwg.org/#concept-header-name). Các thao tác sửa đổi sẽ ném `TypeError` nếu header là bất biến. Trong mọi trường hợp thất bại khác, chúng sẽ thất bại một cách lặng lẽ.

## Constructor

- {{domxref("Headers.Headers()", "Headers()")}}
  - : Tạo một đối tượng `Headers` mới.

## Phương thức thể hiện

- {{domxref("Headers.append()")}}
  - : Thêm một giá trị mới vào một header hiện có bên trong đối tượng `Headers`, hoặc thêm header nếu nó chưa tồn tại.
- {{domxref("Headers.delete()")}}
  - : Xóa một header khỏi đối tượng `Headers`.
- {{domxref("Headers.entries()")}}
  - : Trả về một {{jsxref("Iteration_protocols","iterator")}} cho phép duyệt qua tất cả các cặp khóa/giá trị chứa trong đối tượng này.
- {{domxref("Headers.forEach()")}}
  - : Thực thi một hàm được cung cấp một lần cho mỗi cặp khóa/giá trị trong đối tượng `Headers` này.
- {{domxref("Headers.get()")}}
  - : Trả về một chuỗi byte của tất cả các giá trị của một header trong đối tượng `Headers` với tên đã cho.
- {{domxref("Headers.getSetCookie()")}}
  - : Trả về một mảng chứa các giá trị của tất cả header {{httpheader("Set-Cookie")}} gắn với một response.
- {{domxref("Headers.has()")}}
  - : Trả về giá trị boolean cho biết một đối tượng `Headers` có chứa một header nhất định hay không.
- {{domxref("Headers.keys()")}}
  - : Trả về một {{jsxref("Iteration_protocols", "iterator")}} cho phép bạn duyệt qua tất cả các khóa của các cặp khóa/giá trị chứa trong đối tượng này.
- {{domxref("Headers.set()")}}
  - : Đặt một giá trị mới cho một header hiện có bên trong đối tượng `Headers`, hoặc thêm header nếu nó chưa tồn tại.
- {{domxref("Headers.values()")}}
  - : Trả về một {{jsxref("Iteration_protocols", "iterator")}} cho phép bạn duyệt qua tất cả các giá trị của các cặp khóa/giá trị chứa trong đối tượng này.

> [!NOTE]
> Để làm rõ, sự khác biệt giữa {{domxref("Headers.set()")}} và {{domxref("Headers.append()")}} là nếu header được chỉ định đã tồn tại và chấp nhận nhiều giá trị, {{domxref("Headers.set()")}} sẽ ghi đè giá trị hiện có bằng giá trị mới, trong khi {{domxref("Headers.append()")}} sẽ nối giá trị mới vào cuối tập giá trị. Xem các trang riêng của chúng để có mã ví dụ.

> [!NOTE]
> Khi các giá trị header được duyệt qua, chúng sẽ tự động được sắp xếp theo thứ tự từ điển, và các giá trị từ những tên header trùng lặp sẽ được gộp lại.

## Ví dụ

Trong đoạn mã sau, chúng ta tạo một header mới bằng constructor `Headers()`, thêm một header mới vào đó bằng `append()`, rồi trả về giá trị header đó bằng `get()`:

```js
const myHeaders = new Headers();

myHeaders.append("Content-Type", "text/xml");
myHeaders.get("Content-Type"); // should return 'text/xml'
```

Ta cũng có thể thực hiện điều tương tự bằng cách truyền một mảng các mảng hoặc một object literal vào constructor:

```js
let myHeaders = new Headers({
  "Content-Type": "text/xml",
});

// or, using an array of arrays:
myHeaders = new Headers([["Content-Type", "text/xml"]]);

myHeaders.get("Content-Type"); // should return 'text/xml'
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [ServiceWorker API](/en-US/docs/Web/API/Service_Worker_API)
- [HTTP access control (CORS)](/en-US/docs/Web/HTTP/Guides/CORS)
- [HTTP](/en-US/docs/Web/HTTP)
