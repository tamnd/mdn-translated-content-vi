---
title: Sec-Browsing-Topics header
short-title: Sec-Browsing-Topics
slug: Web/HTTP/Reference/Headers/Sec-Browsing-Topics
page-type: http-header
status:
  - deprecated
  - non-standard
browser-compat: http.headers.Sec-Browsing-Topics
sidebar: http
---

{{non-standard_header}}{{deprecated_header}}

> [!WARNING]
> Tính năng này hiện đang bị phản đối bởi hai nhà cung cấp trình duyệt. Xem phần [Vị trí tiêu chuẩn](/en-US/docs/Web/API/Topics_API#standards_positions) để biết chi tiết về sự phản đối.

> [!NOTE]
> Cần có [Quy trình đăng ký](/en-US/docs/Web/Privacy/Guides/Privacy_sandbox/Enrollment) để sử dụng tính năng này trong ứng dụng của bạn.

Tiêu đề HTTP **`Sec-Browsing-Topics`** {{Glossary("request header")}} gửi các chủ đề đã được chọn cho người dùng hiện tại cùng với yêu cầu liên quan, được nền tảng công nghệ quảng cáo sử dụng để chọn quảng cáo cá nhân hóa để hiển thị.

Nếu trang web gọi không có Topics API được đưa vào trong quy trình đăng ký privacy sandbox thành công, việc cố tạo hoặc sửa đổi `Sec-Browsing-Topics` sẽ thất bại lặng lẽ, và bất kỳ tiêu đề `Sec-Browsing-Topics` hiện có nào cũng bị xóa.

Xem [Sử dụng Topics API](/en-US/docs/Web/API/Topics_API/Using) để biết thêm chi tiết.

<table class="properties">
  <tbody>
    <tr>
      <th scope="row">Loại tiêu đề</th>
      <td>{{Glossary("Request header")}}</td>
    </tr>
    <tr>
      <th scope="row">{{Glossary("Forbidden request header")}}</th>
      <td>Có (tiền tố <code>Sec-</code>)</td>
    </tr>
  </tbody>
</table>

## Cú pháp

```http
Sec-Browsing-Topics: <array-of-observed-topics>
```

## Chỉ thị

Một đối tượng JSON đại diện cho mảng tối đa ba đối tượng đại diện cho các chủ đề đã được chọn của người dùng hiện tại trong ba khoảng thời gian gần nhất. Mỗi đối tượng chứa các thuộc tính sau:

- `configVersion`
  - : Chuỗi xác định thuật toán (ngoài phần mô hình) dùng để tính toán chủ đề.
- `modelVersion`
  - : Chuỗi đại diện cho mô hình được dùng để phân loại một chuỗi (ví dụ như tên máy chủ của trang web) thành ID chủ đề.
- `taxonomyVersion`
  - : Chuỗi đại diện cho phiên bản phân loại đã được sử dụng.
- `topic`
  - : Số đại diện cho ID của chủ đề, có thể được trình duyệt dùng để truy xuất chủ đề từ phân loại (xem ví dụ [phân loại sở thích](https://github.com/patcg-individual-drafts/topics/blob/main/taxonomy_v1.md)).
- `version`
  - : `configVersion`, `modelVersion`, và `taxonomyVersion`, nối với nhau bằng dấu hai chấm (`:`).

## Ví dụ

Các giá trị thuộc tính cụ thể có thể khác nhau tùy theo cách triển khai của trình duyệt. Ví dụ về tiêu đề từ Chrome có thể trông như sau:

```http
Sec-Browsing-Topics: [{configVersion: "chrome.1", modelVersion: "1", taxonomyVersion: "1", topic: 43, version: "chrome.1:1:1"}]
```

## Đặc tả

Tính năng này không thuộc về bất kỳ tiêu chuẩn chính thức nào, mặc dù nó được mô tả trong [Topics API Unofficial Proposal Draft](https://patcg-individual-drafts.github.io/topics/).

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Topics API](/en-US/docs/Web/API/Topics_API)
