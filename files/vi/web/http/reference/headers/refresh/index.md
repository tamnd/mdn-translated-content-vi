---
title: Refresh header
short-title: Refresh
slug: Web/HTTP/Reference/Headers/Refresh
page-type: http-header
browser-compat: http.headers.Refresh
sidebar: http
---

Tiêu đề HTTP **`Refresh`** {{Glossary("response header")}} hướng dẫn trình duyệt web làm mới hoặc chuyển hướng trang khi một khoảng thời gian đã trôi qua sau khi trang được tải hoàn toàn.
Nó hoàn toàn tương đương với việc sử dụng [`<meta http-equiv="refresh" content="...">`](/en-US/docs/Web/HTML/Reference/Elements/meta/http-equiv) trong HTML.

> [!NOTE]
> Mặc dù có trong phản hồi HTTP, tiêu đề `Refresh` vẫn được xử lý bởi cơ chế tải HTML và xảy ra sau khi chuyển hướng HTTP hoặc JavaScript. Xem [thứ tự ưu tiên chuyển hướng](/en-US/docs/Web/HTTP/Guides/Redirections#order_of_precedence) để biết thêm thông tin.

> [!NOTE]
> Khi chuyển hướng làm mới đến trang mới, tiêu đề {{httpheader("Referer")}} được bao gồm trong yêu cầu cho trang mới (nếu được chính sách người giới thiệu cho phép), và {{domxref("document.referrer")}} được đặt thành URL người giới thiệu sau khi điều hướng.

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
Refresh: <time>
Refresh: <time>, url=<url>
Refresh: <time>; url=<url>
```

- `<time>`
  - : Số giây không âm sau khi làm mới trang. Các phần thập phân được nhận dạng nhưng bị bỏ qua; bạn chỉ nên chỉ định số nguyên.
- `<url>` {{optional_inline}}
  - : Nếu có, trình duyệt sẽ chuyển hướng đến URL được chỉ định thay vì làm mới với URL hiện tại. URL này có thể được trích dẫn hoặc không. Tiền tố `url=` không phân biệt chữ hoa chữ thường và là tùy chọn.

## Ví dụ

### Làm mới trang sau thời gian cụ thể

Tiêu đề này sẽ khiến trình duyệt làm mới trang 5 giây sau khi được tải hoàn toàn (tức là sau sự kiện {{domxref("Window/load_event", "load")}}):

```http
Refresh: 5
```

### Chuyển hướng sau thời gian cụ thể

Tiêu đề này sẽ khiến trình duyệt chuyển hướng đến URL 5 giây sau khi trang được tải hoàn toàn:

```http
Refresh: 5; url=https://example.com/
```

> [!NOTE]
> Xem thuộc tính [`http-equiv="refresh"`](/en-US/docs/Web/HTML/Reference/Elements/meta/http-equiv#refresh) trong tài liệu tham chiếu HTML để biết thông tin quan trọng về hậu quả accessibility của chuyển hướng tự động.

## Đặc tả

{{Specifications}}

## Khả năng tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{htmlelement("meta")}}
- [Chuyển hướng trong HTTP](/en-US/docs/Web/HTTP/Guides/Redirections)
- [The Refresh header is still with us](https://lists.w3.org/Archives/Public/ietf-http-wg/2019JanMar/0197.html) Thông điệp HTTP Working Group (2019)
