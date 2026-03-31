---
title: No-Vary-Search header
short-title: No-Vary-Search
slug: Web/HTTP/Reference/Headers/No-Vary-Search
page-type: http-header
status:
  - experimental
browser-compat: http.headers.No-Vary-Search
sidebar: http
---

{{SeeCompatTable}}

Tiêu đề HTTP **`No-Vary-Search`** {{Glossary("response header")}} chỉ định một tập hợp quy tắc định nghĩa cách các tham số truy vấn URL sẽ ảnh hưởng đến việc khớp bộ nhớ đệm.
Các quy tắc này quyết định liệu cùng URL với các tham số URL khác nhau có nên được lưu dưới dạng các mục bộ nhớ đệm trình duyệt riêng biệt hay không.

Điều này cho phép trình duyệt sử dụng lại các tài nguyên hiện có mặc dù tham số URL không khớp để tránh chi phí tải tài nguyên lại, khi cùng nội dung sẽ được trả về.

<table class="properties">
  <tbody>
    <tr>
      <th scope="row">Loại tiêu đề</th>
      <td>{{Glossary("Response header")}}</td>
    </tr>
  </tbody>
</table>

## Cú pháp

```http
No-Vary-Search: key-order
No-Vary-Search: params
No-Vary-Search: params=("param1" "param2")
No-Vary-Search: params, except=("param1" "param2")
No-Vary-Search: key-order, params, except=("param1")
```

## Chỉ thị

- `key-order` {{optional_inline}}
  - : Chỉ báo rằng các URL sẽ không được lưu dưới dạng các mục riêng biệt nếu _thứ tự_ mà các tham số xuất hiện trong URL là sự khác biệt duy nhất.
    Sự hiện diện của các tham số khác _sẽ_ khiến URL được lưu vào bộ đệm riêng.
- `params` {{optional_inline}}
  - : Là boolean hoặc danh sách chuỗi:
    - Là boolean (`params`), chỉ báo rằng các URL chỉ khác nhau về tham số sẽ không được lưu dưới dạng các mục riêng biệt.
    - Danh sách chuỗi phân tách bằng khoảng trắng bên trong (`params=("param1" "param2")`).
      Chỉ báo rằng các URL chỉ khác nhau về các tham số được liệt kê sẽ không được lưu dưới dạng các mục riêng biệt.
      Sự hiện diện của các tham số khác _sẽ_ khiến chúng được lưu vào bộ đệm riêng.
- `except` {{optional_inline}}
  - : Danh sách chuỗi phân tách bằng khoảng trắng bên trong (`except=("param1" "param2")`).
    Chỉ báo rằng các URL chỉ khác nhau về các tham số được liệt kê _sẽ_ được lưu dưới dạng các mục riêng biệt.
    Chỉ thị `params` boolean phải được bao gồm để nó có hiệu lực (`params, except=("param1" "param2")`).
    Sự hiện diện của các tham số khác không có trong danh sách `except=` _sẽ không_ khiến URL được lưu dưới dạng các mục riêng biệt.

## Mô tả

### Mối quan hệ với Speculation Rules API

[Speculation Rules API](/en-US/docs/Web/API/Speculation_Rules_API) hỗ trợ sử dụng tiêu đề `No-Vary-Search` để sử dụng lại trang được tải trước hoặc kết xuất trước hiện có cho các tham số URL khác nhau — nếu chúng được bao gồm trong tiêu đề `No-Vary-Search`.

> [!WARNING]
> Phải thận trọng thêm khi sử dụng kết xuất trước với `No-Vary-Search` vì trang ban đầu có thể được kết xuất trước với các tham số URL khác nhau. `No-Vary-Search` được sử dụng cho các tham số URL cung cấp cùng tài nguyên từ máy chủ, nhưng được máy khách sử dụng vì nhiều lý do khác nhau (kết xuất phía máy khách, tham số UTM để đo lường phân tích, v.v.). Vì kết xuất trước ban đầu có thể dành cho các tham số URL khác nhau, bất kỳ mã nào phụ thuộc vào chúng chỉ nên chạy sau khi kích hoạt kết xuất trước.

Speculation Rules API cũng có thể bao gồm trường `expects_no_vary_search`, cho biết cho trình duyệt biết giá trị `No-Vary-Search` dự kiến sẽ là gì (nếu có) cho các tài liệu mà nó đang nhận yêu cầu tải trước/kết xuất trước thông qua quy tắc suy đoán. Xem [ví dụ "expects_no_vary_search"](/en-US/docs/Web/HTML/Reference/Elements/script/type/speculationrules#expects_no_vary_search_example) để giải thích cách sử dụng nó.

## Ví dụ

### Cho phép phản hồi từ URL với các tham số được sắp xếp khác nhau khớp với cùng mục bộ đệm

Nếu bạn có ví dụ một trang tìm kiếm lưu trữ tiêu chí tìm kiếm trong các tham số URL và bạn không thể đảm bảo rằng các tham số sẽ được thêm vào URL theo cùng thứ tự mỗi lần, bạn có thể cho phép các phản hồi từ các URL giống nhau ngoại trừ thứ tự tham số khớp với cùng mục bộ đệm bằng `key-order`:

```http
No-Vary-Search: key-order
```

Khi tiêu đề này được thêm vào các phản hồi liên quan, các URL sau đây sẽ được coi là tương đương khi tìm kiếm bộ đệm:

```plain
https://search.example.com?a=1&b=2&c=3
https://search.example.com?b=2&a=1&c=3
```

Tuy nhiên, sự hiện diện của các tham số URL khác nhau sẽ khiến các URL này được lưu vào bộ đệm riêng. Ví dụ:

```plain
https://search.example.com?a=1&b=2&c=3
https://search.example.com?b=2&a=1&c=3&d=4
```

Các ví dụ bên dưới minh họa cách kiểm soát tham số nào bị bỏ qua trong bối cảnh khớp bộ đệm.

### Cho phép phản hồi từ URL với tham số khác nhau khớp với cùng mục bộ đệm

Hãy xem xét trường hợp trang đích thư mục người dùng `/users` đã được lưu vào bộ đệm. Tham số `id` có thể được sử dụng để hiển thị thông tin về người dùng cụ thể, ví dụ `/users?id=345`. Liệu URL này có nên được coi là giống nhau cho mục đích khớp bộ đệm hay không phụ thuộc vào hành vi của ứng dụng:

- Nếu tham số này có tác dụng tải một trang hoàn toàn mới chứa thông tin cho người dùng được chỉ định, thì phản hồi từ URL này nên được lưu vào bộ đệm riêng.
- Nếu tham số này có tác dụng tô sáng người dùng được chỉ định trên cùng trang và có thể tiết lộ bảng kéo ra hiển thị dữ liệu của họ, thì sẽ tốt hơn cho trình duyệt sử dụng phản hồi đã cache cho `/users`. Điều này có thể dẫn đến cải thiện hiệu suất trong việc tải trang người dùng.

Nếu ứng dụng của bạn hoạt động như ví dụ thứ hai được mô tả ở trên, bạn có thể khiến cả `/users` và `/users?id=345` được coi là giống nhau cho mục đích cache thông qua tiêu đề `No-Vary-Search`:

```http
No-Vary-Search: params=("id")
```

> [!NOTE]
> Nếu tham số bị loại trừ khỏi khóa cache bằng `params`, nếu nó có trong URL, nó sẽ bị bỏ qua cho mục đích khớp bộ đệm, bất kể nó xuất hiện ở đâu trong danh sách tham số.

### Cho phép phản hồi từ URL với nhiều tham số khác nhau khớp với cùng mục bộ đệm

Giả sử bạn cũng có các tham số URL sắp xếp danh sách người dùng trên trang theo thứ tự abc tăng dần hoặc giảm dần, và chỉ định ngôn ngữ để hiển thị chuỗi UI, ví dụ `/users?id=345&order=asc&lang=fr`.

Bạn có thể khiến trình duyệt bỏ qua tất cả những điều này khi xem xét khớp bộ đệm như sau:

```http
No-Vary-Search: params=("id" "order" "lang")
```

> [!NOTE]
> Là [trường có cấu trúc](https://www.rfc-editor.org/rfc/rfc8941), các tham số nên là chuỗi được trích dẫn phân tách bằng khoảng trắng — như hiển thị ở trên — và không phân tách bằng dấu phẩy, điều mà các nhà phát triển có thể quen thuộc hơn.

Nếu bạn muốn trình duyệt bỏ qua tất cả chúng _và_ bất kỳ tham số nào khác có thể có khi khớp cache, bạn có thể sử dụng dạng boolean của `params`:

```http
No-Vary-Search: params
```

### Chỉ định các tham số _gây ra_ lỗi khớp bộ đệm

Giả sử ứng dụng hoạt động khác nhau, với `/users` trỏ đến trang đích thư mục người dùng chính và `/users?id=345` trỏ đến trang chi tiết hoàn toàn riêng biệt cho người dùng cụ thể. Trong trường hợp này, bạn muốn trình duyệt bỏ qua tất cả các tham số đã đề cập ở trên cho mục đích khớp bộ đệm, _ngoại trừ_ `id`, sự hiện diện của nó sẽ khiến trình duyệt không khớp mục bộ đệm `/users` và yêu cầu `/users?id=345` từ máy chủ.

Điều này có thể đạt được như sau:

```http
No-Vary-Search: params, except=("id")
```

## Đặc tả

{{Specifications}}

## Khả năng tương thích trình duyệt

{{Compat}}

## Xem thêm

- [HTTP Caching: Vary](/en-US/docs/Web/HTTP/Guides/Caching#vary) và tiêu đề {{HTTPHeader("Vary")}}
