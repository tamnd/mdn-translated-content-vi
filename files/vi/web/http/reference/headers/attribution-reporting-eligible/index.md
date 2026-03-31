---
title: Attribution-Reporting-Eligible header
short-title: Attribution-Reporting-Eligible
slug: Web/HTTP/Reference/Headers/Attribution-Reporting-Eligible
page-type: http-header
status:
  - deprecated
browser-compat: http.headers.Attribution-Reporting-Eligible
sidebar: http
---

{{deprecated_header}}

Tiêu đề HTTP **`Attribution-Reporting-Eligible`** {{Glossary("request header")}} chỉ ra rằng phản hồi tương ứng đủ điều kiện để đăng ký nguồn phân bổ hoặc trigger.

Tiêu đề này không bao giờ được đặt thủ công và thay vào đó được trình duyệt gửi khi phản hồi các cài đặt phần tử HTML hoặc yêu cầu JavaScript khác nhau. Tùy thuộc vào các đăng ký được phép chỉ định trong giá trị `Attribution-Reporting-Eligible`, máy chủ dự kiến sẽ phản hồi với tiêu đề {{HTTPHeader("Attribution-Reporting-Register-Source")}} hoặc {{HTTPHeader("Attribution-Reporting-Register-Trigger")}} để hoàn tất đăng ký nguồn phân bổ hoặc trigger, tương ứng.

Xem [Attribution Reporting API](/en-US/docs/Web/API/Attribution_Reporting_API) để biết thêm chi tiết.

<table class="properties">
  <tbody>
    <tr>
      <th scope="row">Loại tiêu đề</th>
      <td>{{Glossary("Request header")}}</td>
    </tr>
    <tr>
      <th scope="row">{{Glossary("Forbidden request header")}}</th>
      <td>Không</td>
    </tr>
  </tbody>
</table>

## Cú pháp

```http
Attribution-Reporting-Eligible: <allowed-registrations>
```

## Chỉ thị

- `<allowed-registrations>`
  - : Từ điển structured-header đại diện cho các đăng ký được phép trong phản hồi tương ứng. Các khóa có thể là:
    - `event-source`
      - : Có thể đăng ký [nguồn phân bổ dựa trên sự kiện](/en-US/docs/Web/API/Attribution_Reporting_API/Registering_sources#event-based_attribution_sources).
    - `navigation-source`
      - : Có thể đăng ký [nguồn phân bổ dựa trên điều hướng](/en-US/docs/Web/API/Attribution_Reporting_API/Registering_sources#navigation-based_attribution_sources).
    - `trigger`
      - : Có thể đăng ký [trigger phân bổ](/en-US/docs/Web/API/Attribution_Reporting_API/Registering_triggers).

Mỗi phản hồi trong chuỗi chuyển hướng có thể đăng ký nhiều nhất một nguồn hoặc một trigger.

## Ví dụ

```http
Attribution-Reporting-Eligible: trigger
```

## Thông số kỹ thuật

{{Specifications}}

## Khả năng tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{HTTPHeader("Attribution-Reporting-Register-Source")}}
- {{HTTPHeader("Attribution-Reporting-Register-Trigger")}}
- [Attribution Reporting API](/en-US/docs/Web/API/Attribution_Reporting_API)
