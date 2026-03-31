---
title: Origin header
short-title: Origin
slug: Web/HTTP/Reference/Headers/Origin
page-type: http-header
browser-compat: http.headers.Origin
sidebar: http
---

Tiêu đề HTTP **`Origin`** {{Glossary("request header")}} chỉ báo {{glossary("origin")}} ([giao thức](/en-US/docs/Web/URI/Reference/Schemes), tên máy chủ và cổng) _gây ra_ yêu cầu.
Ví dụ: nếu tác nhân người dùng cần yêu cầu các tài nguyên được bao gồm trong trang, hoặc được lấy bởi các script mà nó thực thi, thì nguồn gốc của trang có thể được bao gồm trong yêu cầu.

<table class="properties">
  <tbody>
    <tr>
      <th scope="row">Loại tiêu đề</th>
      <td>{{Glossary("Request header")}}</td>
    </tr>
    <tr>
      <th scope="row">{{Glossary("Forbidden request header")}}</th>
      <td>Có</td>
    </tr>
  </tbody>
</table>

## Cú pháp

```http
Origin: null
Origin: <scheme>://<hostname>
Origin: <scheme>://<hostname>:<port>
```

## Chỉ thị

- `null`
  - : Nguồn gốc là "nhạy cảm về quyền riêng tư", hoặc là [nguồn gốc mờ](/en-US/docs/Glossary/Origin#opaque_origin) (các trường hợp cụ thể được liệt kê trong phần [mô tả](#description)).
- `<scheme>`
  - : Giao thức được sử dụng.
    Thường là giao thức HTTP hoặc phiên bản bảo mật của nó, HTTPS.
- `<hostname>`
  - : Tên miền hoặc địa chỉ IP của máy chủ gốc.
- `<port>` {{optional_inline}}
  - : Số cổng mà máy chủ đang lắng nghe.
    Nếu không có cổng nào được cung cấp, cổng mặc định cho dịch vụ được yêu cầu sẽ được ngầm định từ giao thức (ví dụ: `80` cho URL HTTP).

## Mô tả

Tiêu đề `Origin` tương tự như tiêu đề {{HTTPHeader("Referer")}}, nhưng không tiết lộ đường dẫn và có thể là `null`.
Nó được sử dụng để cung cấp ngữ cảnh bảo mật cho yêu cầu nguồn gốc, ngoại trừ các trường hợp thông tin nguồn gốc sẽ nhạy cảm hoặc không cần thiết.

Nói chung, tác nhân người dùng thêm tiêu đề yêu cầu `Origin` vào:

- Yêu cầu {{Glossary("CORS", "khác nguồn gốc")}}.
- Yêu cầu [cùng nguồn gốc](/en-US/docs/Web/Security/Defenses/Same-origin_policy) ngoại trừ yêu cầu {{HTTPMethod("GET")}} hoặc {{HTTPMethod("HEAD")}} (tức là chúng được thêm vào cùng nguồn gốc {{HTTPMethod("POST")}}, {{HTTPMethod("OPTIONS")}}, {{HTTPMethod("PUT")}}, {{HTTPMethod("PATCH")}} và yêu cầu {{HTTPMethod("DELETE")}}).

Có một số ngoại lệ đối với các quy tắc trên; ví dụ: nếu yêu cầu {{HTTPMethod("GET")}} hoặc {{HTTPMethod("HEAD")}} khác nguồn gốc được thực hiện ở [chế độ no-cors](/en-US/docs/Web/API/Request/mode#value), tiêu đề `Origin` sẽ không được thêm.

Giá trị tiêu đề `Origin` có thể là `null` trong một số trường hợp, bao gồm (không đầy đủ):

- Các nguồn gốc có [giao thức](/en-US/docs/Web/URI/Reference/Schemes) không phải là `http`, `https`, `ftp`, `ws`, `wss`, hoặc `gopher` (bao gồm `blob`, `file` và `data`).
- Dữ liệu hình ảnh và phương tiện khác nguồn gốc, bao gồm dữ liệu trong phần tử {{HTMLElement("img")}}, {{HTMLElement("video")}} và {{HTMLElement("audio")}}.
- Tài liệu được tạo theo chương trình bằng {{domxref("DOMImplementation.createDocument", "createDocument()")}}, được tạo từ URL `data:`, hoặc không có ngữ cảnh duyệt web người tạo.
- Các chuyển hướng qua các nguồn gốc.
- Các tài liệu được phục vụ với chỉ thị `sandbox` của {{HTTPHeader("Content-Security-Policy")}} có giá trị không bao gồm `allow-same-origin`.
- {{HTMLElement("iframe", "iframe")}} với thuộc tính sandbox có giá trị không bao gồm `allow-same-origin`.
- Các phản hồi là lỗi mạng.
- {{HTTPHeader("Referrer-Policy")}} được đặt thành `no-referrer` cho các chế độ yêu cầu không phải `cors` (ví dụ: bài đăng biểu mẫu cơ bản).

> [!NOTE]
> Có danh sách chi tiết hơn về các trường hợp có thể trả về `null` trên Stack Overflow: [When do browsers send the Origin header? When do browsers set the origin to null?](https://stackoverflow.com/questions/42239643/when-do-browsers-send-the-origin-header-when-do-browsers-set-the-origin-to-null/42242802)

## Ví dụ

```http
Origin: https://developer.mozilla.org
```

```http
Origin: https://developer.mozilla.org:80
```

## Đặc tả

{{Specifications}}

## Khả năng tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{HTTPHeader("Host")}}
- {{HTTPHeader("Referer")}}
- [Chính sách cùng nguồn gốc](/en-US/docs/Web/Security/Defenses/Same-origin_policy)
- [When do browsers send the Origin header? When do browsers set the origin to null?](https://stackoverflow.com/questions/42239643/when-do-browsers-send-the-origin-header-when-do-browsers-set-the-origin-to-null/42242802) (Stack Overflow)
