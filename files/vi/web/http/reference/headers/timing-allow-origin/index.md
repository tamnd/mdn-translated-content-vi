---
title: Timing-Allow-Origin header
short-title: Timing-Allow-Origin
slug: Web/HTTP/Reference/Headers/Timing-Allow-Origin
page-type: http-header
browser-compat: http.headers.Timing-Allow-Origin
sidebar: http
---

Tiêu đề HTTP **`Timing-Allow-Origin`** {{Glossary("response header")}} chỉ định các nguồn gốc được phép xem các giá trị của thuộc tính được lấy thông qua các tính năng của [Resource Timing API](/en-US/docs/Web/API/Performance_API/Resource_timing), nếu không sẽ được báo cáo là không do các hạn chế cross-origin.

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
Timing-Allow-Origin: *
Timing-Allow-Origin: <origin>, …, <originN>
```

## Chỉ thị

- `*` (wildcard)
  - : Bất kỳ nguồn gốc nào có thể xem các tài nguyên timing.
- `<origin>`
  - : Chỉ định URI có thể xem các tài nguyên timing. Bạn có thể chỉ định nhiều nguồn gốc, phân cách bằng dấu phẩy.

## Ví dụ

### Sử dụng Timing-Allow-Origin

Để cho phép bất kỳ tài nguyên nào xem các tài nguyên timing:

```http
Timing-Allow-Origin: *
```

Để cho phép `https://developer.mozilla.org` xem các tài nguyên timing, bạn có thể chỉ định:

```http
Timing-Allow-Origin: https://developer.mozilla.org
```

## Đặc tả

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Resource Timing API](/en-US/docs/Web/API/Performance_API/Resource_timing)
- Tiêu đề {{HTTPHeader("Server-Timing")}}
- Tiêu đề {{HTTPHeader("Vary")}}
