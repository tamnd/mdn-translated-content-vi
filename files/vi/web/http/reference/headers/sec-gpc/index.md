---
title: Sec-GPC header
short-title: Sec-GPC
slug: Web/HTTP/Reference/Headers/Sec-GPC
page-type: http-header
status:
  - experimental
browser-compat: http.headers.Sec-GPC
spec-urls: https://w3c.github.io/gpc/#the-sec-gpc-header-field-for-http-requests
sidebar: http
---

{{SeeCompatTable}}

Tiêu đề HTTP **`Sec-GPC`** {{Glossary("request header")}} là một phần của cơ chế [Global Privacy Control](https://globalprivacycontrol.org/) (GPC) để cho biết liệu người dùng có đồng ý cho một trang web hoặc dịch vụ bán hoặc chia sẻ thông tin cá nhân của họ với bên thứ ba hay không.

Đặc tả không xác định cách người dùng có thể rút lại hoặc cấp đồng ý cho trang web.

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
Sec-GPC: <preference>
```

## Chỉ thị

- `<preference>`
  - : Giá trị `1` có nghĩa là người dùng đã cho biết rằng họ thích thông tin của mình không được chia sẻ hoặc bán cho bên thứ ba.
    Nếu không, tiêu đề không được gửi, điều này cho biết người dùng chưa đưa ra quyết định hoặc người dùng không có vấn đề với việc thông tin của họ được chia sẻ hoặc bán cho bên thứ ba.

## Ví dụ

### Đọc trạng thái Global Privacy Control từ JavaScript

Sở thích GPC của người dùng cũng có thể được đọc từ JavaScript bằng cách sử dụng thuộc tính {{domxref("Navigator.globalPrivacyControl")}} hoặc {{domxref("WorkerNavigator.globalPrivacyControl")}}:

```js
navigator.globalPrivacyControl; // "false" or "true"
```

## Đặc tả

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("Navigator.globalPrivacyControl")}}
- Tiêu đề {{HTTPHeader("DNT")}}
- Tiêu đề {{HTTPHeader("Tk")}}
- [globalprivacycontrol.org](https://globalprivacycontrol.org/)
- [Do Not Track trên Wikipedia](https://en.wikipedia.org/wiki/Do_Not_Track)
