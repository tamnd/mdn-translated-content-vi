---
title: Prefer header
short-title: Prefer
slug: Web/HTTP/Reference/Headers/Prefer
page-type: http-header
spec-urls: https://www.rfc-editor.org/rfc/rfc7240#section-2
sidebar: http
---

Tiêu đề HTTP **`Prefer`** cho phép máy khách chỉ ra các ưu tiên đối với các hành vi máy chủ cụ thể trong quá trình xử lý yêu cầu.

> [!NOTE]
> Trình duyệt không xử lý các tiêu đề `Prefer` và {{HTTPHeader("Preference-Applied")}}: chúng được sử dụng trong các máy khách tùy chỉnh, cụ thể theo triển khai.
> Đảm bảo cả máy khách và máy chủ hỗ trợ tiêu đề này trước khi dựa vào nó trong môi trường sản xuất.
>
> Các máy chủ nên bỏ qua các ưu tiên mà chúng không hỗ trợ, như thể tiêu đề không có mặt.

<table class="properties">
  <tbody>
    <tr>
      <th scope="row">Loại tiêu đề</th>
      <td>
        {{Glossary("Request header")}}
      </td>
    </tr>
    <tr>
      <th scope="row">{{Glossary("Forbidden request header")}}</th>
      <td>Không</td>
    </tr>
  </tbody>
</table>

## Cú pháp

```http
Prefer: <preference>, <preference>, ...
```

## Chỉ thị

- `respond-async`
  - : Máy khách ưu tiên xử lý bất đồng bộ.
    Ví dụ, máy chủ có thể phản hồi với phản hồi {{httpstatus("202", "202 Accepted")}} cho thấy yêu cầu đã được chấp nhận, cùng với tiêu đề {{httpheader("Location")}} có URL mà máy khách có thể sử dụng để theo dõi trạng thái của quá trình xử lý.
- `return=minimal`
  - : Yêu cầu máy chủ trả về nội dung tối thiểu (phản hồi chỉ có tiêu đề).
- `return=representation`
  - : Yêu cầu biểu diễn tài nguyên đầy đủ trong phản hồi.
- `wait=<seconds>`
  - : Thời gian mà máy khách mong đợi máy chủ cung cấp phản hồi, tính từ thời điểm yêu cầu được nhận.
    Nếu ưu tiên `respond-async` cũng được cung cấp, máy chủ nên phản hồi bất đồng bộ nếu xử lý yêu cầu sẽ vượt quá thời gian chờ.
    Nếu không, máy chủ nên cân nhắc rằng máy khách sẽ hết thời gian sau thời gian `wait` (hành vi phản hồi phụ thuộc vào việc triển khai của máy chủ).
- `handling=lenient`
  - : Máy khách muốn máy chủ áp dụng xác thực linh hoạt và xử lý lỗi cho việc xử lý yêu cầu.
- `handling=strict`
  - : Máy khách muốn máy chủ áp dụng xác thực nghiêm ngặt và xử lý lỗi cho việc xử lý yêu cầu.
- Ưu tiên tùy chỉnh
  - : Nhà cung cấp hoặc ứng dụng có thể xác định các ưu tiên của riêng mình để phù hợp với nhu cầu cụ thể.
    Ví dụ, `Prefer: timezone=America/Los_Angeles`.

## Ví dụ

### Yêu cầu phản hồi tối thiểu

Yêu cầu sau đây yêu cầu phản hồi tối thiểu.
Đây thường là phản hồi chỉ có tiêu đề (trái với `return=representation` nơi một biểu diễn được đưa vào thân phản hồi):

```http
POST /resource HTTP/1.1
Host: example.com
Content-Type: application/json
Prefer: return=minimal

{"id":123, "name": "abc"}
```

Máy chủ phản hồi với {{httpstatus("201")}}, nhưng không bao gồm thân phản hồi nào.
Tiêu đề {{httpheader("Location")}} chứa URL với vị trí của tài nguyên mới được tạo.
Không cần đưa vào tiêu đề `Preference-Applied` vì sự vắng mặt của thân phản hồi là hiển nhiên:

```http
HTTP/1.1 201 Created
Location: /resource?id=123
```

### Yêu cầu xử lý bất đồng bộ

Ví dụ này yêu cầu máy chủ bắt đầu một tác vụ xử lý bất đồng bộ:

```http
POST /process HTTP/1.1
Host: example.com
Prefer: respond-async

{
  "task": "check-broken-links"
}
```

Máy chủ phản hồi với phản hồi {{httpstatus("202", "202 Accepted")}} cho thấy yêu cầu đã được chấp nhận và chưa hoàn thành thực thi bất đồng bộ.
Tiêu đề `Location` trỏ đến màn hình trạng thái đại diện cho trạng thái của quá trình xử lý:

```http
HTTP/1.1 202 Accepted
Location: http://example.com/tasks/123/status
```

### Cung cấp nhiều ưu tiên

Yêu cầu sau bao gồm hai ưu tiên; `timezone=Jupiter/Red_Spot` chỉ ra ưu tiên múi giờ cho máy khách và `handling=strict` cho xác thực nghiêm ngặt:

```http
GET /events HTTP/1.1
Host: example.com
Prefer: handling=strict, timezone=Jupiter/Red_Spot
```

Trong triển khai này, múi giờ không hợp lệ sẽ ném ra lỗi:

```http
HTTP/1.1 400 Bad Request
```

## Thông số kỹ thuật

{{Specifications}}

## Xem thêm

- {{HTTPHeader("Preference-Applied")}}
- [Prefer header](https://docs.oasis-open.org/odata/odata/v4.01/odata-v4.01-part1-protocol.html#_Toc31358871) trên docs.oasis-open.org
- [Prefer header](https://docs.postgrest.org/en/v12/references/api/preferences.html) trên docs.postgrest.org
