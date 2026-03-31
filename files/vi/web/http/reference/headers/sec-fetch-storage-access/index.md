---
title: Sec-Fetch-Storage-Access header
short-title: Sec-Fetch-Storage-Access
slug: Web/HTTP/Reference/Headers/Sec-Fetch-Storage-Access
page-type: http-header
browser-compat: http.headers.Sec-Fetch-Storage-Access
sidebar: http
---

Tiêu đề HTTP **`Sec-Fetch-Storage-Access`** {{Glossary("fetch metadata request header")}} cung cấp "trạng thái truy cập bộ nhớ" cho ngữ cảnh fetch hiện tại.

Trạng thái có thể chỉ ra rằng quyền truy cập vào cookie bên thứ ba [không phân vùng](/en-US/docs/Web/Privacy/Guides/State_Partitioning#state_partitioning):

- Chưa được cấp phép.
- Đã được cấp phép nhưng chưa được kích hoạt cho ngữ cảnh yêu cầu hiện tại.
- Đã được cấp phép cho nội dung yêu cầu hiện tại, và các cookie đã được gửi cùng yêu cầu.

Các trình duyệt hỗ trợ phải bao gồm tiêu đề này trong các yêu cầu cross-site khi chế độ thông tin xác thực của yêu cầu là [`include`](/en-US/docs/Web/API/Request/credentials#include).
Tiêu đề không nên được gửi với các yêu cầu same-site (vì những yêu cầu đó không thể liên quan đến cookie cross-site), hoặc nếu [chế độ thông tin xác thực](/en-US/docs/Web/API/Request/credentials) của yêu cầu là "omit".
Tài nguyên được yêu cầu cũng phải có [nguồn gốc đáng tin cậy tiềm năng](/en-US/docs/Web/Security/Defenses/Secure_Contexts#potentially_trustworthy_origins).

Nếu quyền truy cập bộ nhớ đã được cấp nhưng chưa được kích hoạt, máy chủ có thể phản hồi bằng {{httpheader("Activate-Storage-Access")}} để yêu cầu kích hoạt quyền cho ngữ cảnh.
Để biết thêm thông tin, xem [Tiêu đề truy cập bộ nhớ](/en-US/docs/Web/API/Storage_Access_API#storage_access_headers) trong tổng quan [Storage Access API](/en-US/docs/Web/API/Storage_Access_API).

<table class="properties">
  <tbody>
    <tr>
      <th scope="row">Loại tiêu đề</th>
      <td>{{Glossary("Fetch Metadata Request Header")}}</td>
    </tr>
    <tr>
      <th scope="row">{{Glossary("Forbidden request header")}}</th>
      <td>Có (tiền tố <code>Sec-</code>)</td>
    </tr>
    <tr>
      <th scope="row">
        {{Glossary("CORS-safelisted request header")}}
      </th>
      <td>Không</td>
    </tr>
  </tbody>
</table>

## Cú pháp

```http
Sec-Fetch-Storage-Access: none
Sec-Fetch-Storage-Access: inactive
Sec-Fetch-Storage-Access: active
```

## Chỉ thị

Một giá trị chỉ ra trạng thái truy cập bộ nhớ cho ngữ cảnh fetch hiện tại.
Các giá trị sau được phép (máy chủ nên bỏ qua các giá trị khác):

- `none`
  - : Ngữ cảnh không có quyền `storage-access` hoặc quyền truy cập vào cookie không phân vùng.
- `inactive`
  - : Ngữ cảnh có quyền `storage-access`, nhưng chưa đồng ý sử dụng nó (và không có quyền truy cập cookie không phân vùng qua các phương tiện khác).
    Nếu giá trị này được đặt, thì tiêu đề yêu cầu {{httpheader("Origin")}} cũng nên được đặt.
- `active`
  - : Ngữ cảnh có quyền truy cập cookie không phân vùng.
    Nếu giá trị này được đặt, thì tiêu đề yêu cầu {{httpheader("Origin")}} cũng nên được đặt.

## Ví dụ

Xem [Ví dụ](/en-US/docs/Web/HTTP/Reference/Headers/Activate-Storage-Access#examples) trong {{httpheader("Activate-Storage-Access")}}.

## Thông số kỹ thuật

{{Specifications}}

## Khả năng tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{httpheader("Activate-Storage-Access")}}
- [Tiêu đề truy cập bộ nhớ](/en-US/docs/Web/API/Storage_Access_API#storage_access_headers) trong _Storage Access API_
- [Chuỗi tiêu đề truy cập bộ nhớ](/en-US/docs/Web/API/Storage_Access_API#storage_access_header_sequences) trong _Storage Access API_
- [Sử dụng Storage Access API](/en-US/docs/Web/API/Storage_Access_API/Using)
- [Fetch Metadata Request Headers playground](https://secmetadata.appspot.com/) (secmetadata.appspot.com)
