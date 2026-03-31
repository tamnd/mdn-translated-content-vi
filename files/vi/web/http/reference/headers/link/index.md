---
title: Link header
short-title: Link
slug: Web/HTTP/Reference/Headers/Link
page-type: http-header
browser-compat: http.headers.Link
sidebar: http
---

Tiêu đề HTTP **`Link`** cung cấp phương tiện để tuần tự hóa một hoặc nhiều liên kết trong tiêu đề HTTP.
Điều này cho phép máy chủ trỏ máy khách đến tài nguyên khác chứa siêu dữ liệu về tài nguyên được yêu cầu.
Tiêu đề này có cùng ngữ nghĩa như phần tử HTML {{HTMLElement("link")}}.
Một lợi ích của việc sử dụng tiêu đề `Link` là trình duyệt có thể bắt đầu kết nối trước hoặc tải trước các tài nguyên trước khi HTML được tải về và xử lý.

Trong thực tế, hầu hết các [loại liên kết `rel`](/en-US/docs/Web/HTML/Reference/Attributes/rel) không có hiệu lực khi được sử dụng với tiêu đề HTTP.
Ví dụ: quan hệ `icon` chỉ hoạt động trong HTML và `stylesheet` không hoạt động đáng tin cậy trên các trình duyệt (chỉ trong Firefox).
Các quan hệ hoạt động đáng tin cậy duy nhất là [`preconnect`](/en-US/docs/Web/HTML/Reference/Attributes/rel/preconnect) và [`preload`](/en-US/docs/Web/HTML/Reference/Attributes/rel/preload), có thể được kết hợp với {{HTTPStatus(103, "103 Early Hints")}}.

<table class="properties">
  <tbody>
    <tr>
      <th scope="row">Loại tiêu đề</th>
      <td>
        {{Glossary("Response header")}}, {{Glossary("Request header")}}
      </td>
    </tr>
    <tr>
      <th scope="row">{{Glossary("Forbidden request header")}}</th>
      <td>Không</td>
    </tr>
    <tr>
      <th scope="row">
        {{Glossary("CORS-safelisted response header")}}
      </th>
      <td>Không</td>
    </tr>
  </tbody>
</table>

## Cú pháp

```http
Link: <uri-reference>; param1=value1; param2="value2"
```

- `<uri-reference>`
  - : Tham chiếu URI, phải được đặt giữa `<` và `>` và được {{Glossary("Percent-encoding", "mã hóa phần trăm")}}.

### Tham số

Tiêu đề liên kết chứa các tham số, phân tách bằng `;` và tương đương với các thuộc tính của phần tử {{HTMLElement("link")}}.
Các giá trị có thể được trích dẫn hoặc không dựa trên [quy tắc thành phần giá trị trường](https://www.rfc-editor.org/rfc/rfc7230.html#section-3.2.6), vì vậy `x=y` tương đương với `x="y"`.

## Ví dụ

### Đặt URL trong dấu ngoặc nhọn

URI (tuyệt đối hoặc tương đối) phải được đặt giữa `<` và `>`:

```http example-good
Link: <https://example.com>; rel="preconnect"
```

```http example-bad
Link: https://bad.example; rel="preconnect"
```

### Mã hóa URL

URI (tuyệt đối hoặc tương đối) phải {{Glossary("Percent-encoding", "mã hóa phần trăm")}} các mã ký tự lớn hơn 255:

```http example-good
Link: <https://example.com/%E8%8B%97%E6%9D%A1>; rel="preconnect"
```

```http example-bad
Link: <https://example.com/苗条>; rel="preconnect"
```

### Chỉ định nhiều liên kết

Bạn có thể chỉ định nhiều liên kết phân tách bằng dấu phẩy, ví dụ:

```http
Link: <https://one.example.com>; rel="preconnect", <https://two.example.com>; rel="preconnect", <https://three.example.com>; rel="preconnect"
```

### Phân trang thông qua liên kết

Tiêu đề `Link` có thể cung cấp thông tin phân trang cho máy khách, thường được sử dụng để truy cập tài nguyên theo chương trình:

```http
Link: <https://api.example.com/issues?page=2>; rel="prev", <https://api.example.com/issues?page=4>; rel="next", <https://api.example.com/issues?page=10>; rel="last", <https://api.example.com/issues?page=1>; rel="first"
```

Trong trường hợp này, `rel="prev"` và `rel="next"` hiển thị quan hệ liên kết cho các trang trước và tiếp theo, và có các tham số `rel="last"` và `rel="first"` cung cấp trang đầu và trang cuối của kết quả tìm kiếm.

### Kiểm soát ưu tiên tải

Ngay cả khi sử dụng [`preload`](/en-US/docs/Web/HTML/Reference/Attributes/rel/preload) để tải tài nguyên sớm nhất có thể, các loại nội dung khác nhau sẽ được tải sớm hơn hoặc muộn hơn dựa trên ưu tiên nội bộ của trình duyệt.
Thuộc tính [`fetchpriority`](/en-US/docs/Web/HTML/Reference/Elements/link#fetchpriority) có thể được sử dụng để gợi ý cho trình duyệt rằng một tài nguyên cụ thể sẽ có tác động lớn hơn hoặc nhỏ hơn tương đối đến trải nghiệm người dùng so với các tài nguyên cùng loại khác.

Ví dụ: tiêu đề bên dưới có thể được sử dụng để tải trước `style.css` với ưu tiên cao hơn các stylesheet khác:

```http
Link: </style.css>; rel=preload; as=style; fetchpriority="high"
```

Lưu ý rằng cả ưu tiên nội bộ để tải tài nguyên và hiệu lực của chỉ thị `fetchpriority` đều phụ thuộc vào trình duyệt.
Chỉ thị `fetchpriority` nên được sử dụng một cách tiết kiệm, và chỉ trong các trường hợp trình duyệt không thể suy luận rằng một tài nguyên cụ thể nên được xử lý với ưu tiên khác.

## Đặc tả

{{Specifications}}

## Khả năng tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{HTTPStatus("103", "103 Early Hints")}}
- {{HTMLElement("link")}}
- Sổ đăng ký [Link Relations](https://www.iana.org/assignments/link-relations/link-relations.xhtml) IANA
- [Optimize resource loading with the Fetch Priority API](https://web.dev/articles/fetch-priority?hl=en#browser_priority_and_fetchpriority) để biết thông tin về cách API này ảnh hưởng đến ưu tiên trên Chrome.
