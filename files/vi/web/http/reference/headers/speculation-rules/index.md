---
title: Speculation-Rules header
short-title: Speculation-Rules
slug: Web/HTTP/Reference/Headers/Speculation-Rules
page-type: http-header
status:
  - experimental
browser-compat: http.headers.Speculation-Rules
sidebar: http
---

{{SeeCompatTable}}

Tiêu đề HTTP **`Speculation-Rules`** {{Glossary("response header")}} cung cấp một hoặc nhiều URL trỏ đến các tài nguyên văn bản chứa định nghĩa JSON của quy tắc suy đoán. Khi phản hồi là tài liệu HTML, các quy tắc này sẽ được thêm vào tập hợp quy tắc suy đoán của tài liệu. Xem [Speculation Rules API](/en-US/docs/Web/API/Speculation_Rules_API) để biết thêm thông tin.

Tệp tài nguyên chứa JSON quy tắc suy đoán có thể có bất kỳ tên và phần mở rộng hợp lệ nào, nhưng nó sẽ được yêu cầu với kiểu [`destination`](/en-US/docs/Web/API/Request/destination) là [`speculationrules`](/en-US/docs/Web/API/Request/destination#speculationrules), và phải được phục vụ với kiểu MIME `application/speculationrules+json`.

> [!NOTE]
> Cơ chế này cung cấp một lựa chọn thay thế cho việc chỉ định định nghĩa JSON bên trong phần tử [`<script type="speculationrules">`](/en-US/docs/Web/HTML/Reference/Elements/script/type/speculationrules) nội tuyến. Chỉ định tiêu đề HTTP hữu ích trong các trường hợp nhà phát triển không thể trực tiếp sửa đổi tài liệu.

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
Speculation-Rules: <url-list>
```

## Chỉ thị

- `<url-list>`
  - : Danh sách URL phân cách bằng dấu phẩy trỏ đến các tài nguyên văn bản chứa định nghĩa JSON quy tắc suy đoán. JSON chứa trong các tệp văn bản phải tuân theo các quy tắc tương tự như JSON chứa bên trong các phần tử `<script type="speculationrules">` nội tuyến. Xem [Speculation rules JSON representation](/en-US/docs/Web/HTML/Reference/Elements/script/type/speculationrules#speculation_rules_json_representation) để tham khảo cú pháp.

## Ví dụ

### Trường Speculation-Rules với một tệp

Phản hồi sau chứa một tham chiếu tệp:

```http
Speculation-Rules: "/rules/prefetch.json"
```

### Trường Speculation-Rules với nhiều tệp

Phản hồi sau chứa nhiều tham chiếu tệp dưới dạng danh sách phân cách bằng dấu phẩy:

```http
Speculation-Rules: "/rules/prefetch.json","/rules/prerender.json"
```

> [!NOTE]
> Giá trị URL phải được đặt trong dấu ngoặc kép.

## Đặc tả

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Speculation Rules API](/en-US/docs/Web/API/Speculation_Rules_API)
- [`<script type="speculationrules">`](/en-US/docs/Web/HTML/Reference/Elements/script/type/speculationrules)
