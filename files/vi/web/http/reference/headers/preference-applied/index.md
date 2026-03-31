---
title: Preference-Applied header
short-title: Preference-Applied
slug: Web/HTTP/Reference/Headers/Preference-Applied
page-type: http-header
spec-urls: https://www.rfc-editor.org/rfc/rfc7240#section-3
sidebar: http
---

Tiêu đề HTTP **`Preference-Applied`** thông báo cho máy khách về các ưu tiên từ tiêu đề yêu cầu {{httpheader("Prefer")}} được máy chủ áp dụng.

Máy chủ chỉ ra nếu một ưu tiên được áp dụng cho phản hồi nếu điều đó sẽ không rõ ràng đối với máy khách.

<table class="properties">
  <tbody>
    <tr>
      <th scope="row">Loại tiêu đề</th>
      <td>
        {{Glossary("Response header")}}
      </td>
    </tr>
    <tr>
      <th scope="row">{{Glossary("Forbidden header name")}}</th>
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
Preference-Applied: <preference>
```

## Ví dụ

### Máy chủ áp dụng ưu tiên múi giờ

Yêu cầu sau chỉ ra rằng máy khách ưu tiên các sự kiện được biểu diễn theo một múi giờ nhất định:

```http
GET /events HTTP/1.1
Host: example.com
Prefer: timezone=America/Los_Angeles
```

Máy chủ hỗ trợ ưu tiên và gửi lại nội dung với tiêu đề `Preference-Applied`:

```http
HTTP/1.1 200 OK
Content-Type: application/json
Preference-Applied: timezone=America/Los_Angeles

[
  {"t":"2023-10-18T05:37:59.611-07:00"},
  {"t":"2023-10-18T07:37:59.611-07:00"},
  {"t":"2023-10-18T09:37:59.611-07:00"}
]
```

## Thông số kỹ thuật

{{Specifications}}

## Xem thêm

- {{HTTPHeader("Prefer")}}
- [Prefer header](https://docs.oasis-open.org/odata/odata/v4.01/odata-v4.01-part1-protocol.html#_Toc31358871) trên docs.oasis-open.org
- [Prefer header](https://docs.postgrest.org/en/v12/references/api/preferences.html) trên docs.postgrest.org
