---
title: Retry-After header
short-title: Retry-After
slug: Web/HTTP/Reference/Headers/Retry-After
page-type: http-header
browser-compat: http.headers.Retry-After
sidebar: http
---

Tiêu đề HTTP **`Retry-After`** {{Glossary("response header")}} chỉ báo tác nhân người dùng nên chờ bao lâu trước khi thực hiện yêu cầu tiếp theo.
Có ba trường hợp chính mà tiêu đề này được sử dụng:

- Trong phản hồi {{HTTPStatus("503", "503 Service Unavailable")}}, điều này chỉ báo dịch vụ dự kiến không khả dụng bao lâu.
- Trong phản hồi {{HTTPStatus("429", "429 Too Many Requests")}}, điều này chỉ báo phải chờ bao lâu trước khi thực hiện yêu cầu mới.
- Trong phản hồi chuyển hướng, chẳng hạn {{HTTPStatus("301", "301 Moved Permanently")}}, điều này chỉ báo thời gian tối thiểu mà tác nhân người dùng được yêu cầu chờ trước khi đưa ra yêu cầu chuyển hướng.

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
Retry-After: <http-date>
Retry-After: <delay-seconds>
```

## Chỉ thị

- `<http-date>`
  - : Ngày sau khi thử lại. Xem tiêu đề {{HTTPHeader("Date")}} để biết thêm chi tiết về định dạng ngày HTTP.
- `<delay-seconds>`
  - : Số nguyên thập phân không âm chỉ báo số giây cần trì hoãn sau khi phản hồi được nhận.

## Ví dụ

### Xử lý downtime theo lịch trình

Hỗ trợ cho tiêu đề `Retry-After` trên cả máy khách và máy chủ vẫn không nhất quán.
Tuy nhiên, một số trình thu thập và spider, như Googlebot, tôn trọng tiêu đề `Retry-After`. Nó hữu ích khi gửi kèm với phản hồi `503`, để các công cụ tìm kiếm tiếp tục lập chỉ mục trang web khi thời gian downtime kết thúc.

```http
Retry-After: Wed, 21 Oct 2015 07:28:00 GMT
Retry-After: 120
```

## Đặc tả

{{Specifications}}

## Khả năng tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{HTTPStatus("503", "503 Service Unavailable")}}
- {{HTTPStatus("301", "301 Moved Permanently")}}
- [How to deal with planned site downtime](https://developers.google.com/search/blog/2011/01/how-to-deal-with-planned-site-downtime) trên developers.google.com (2011)
