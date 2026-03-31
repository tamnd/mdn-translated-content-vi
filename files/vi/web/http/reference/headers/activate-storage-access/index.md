---
title: Activate-Storage-Access header
short-title: Activate-Storage-Access
slug: Web/HTTP/Reference/Headers/Activate-Storage-Access
page-type: http-header
browser-compat: http.headers.Activate-Storage-Access
sidebar: http
---

Tiêu đề HTTP **`Activate-Storage-Access`** {{glossary("response header")}} cho phép máy chủ kích hoạt quyền đã được cấp để truy cập [cookie không được phân vùng](/en-US/docs/Web/API/Storage_Access_API#unpartitioned_versus_partitioned_cookies) trong một yêu cầu đa trang.

Máy chủ dựa vào thông tin trạng thái quyền được cung cấp trong tiêu đề {{httpheader("Sec-Fetch-Storage-Access")}} của yêu cầu.

Các tiêu đề này được gọi chung là [tiêu đề truy cập lưu trữ](/en-US/docs/Web/API/Storage_Access_API#storage_access_headers).
Chúng cung cấp giải pháp thay thế hiệu quả cho việc đầu tiên tải tài nguyên không có cookie, sử dụng [Storage Access API](/en-US/docs/Web/API/Storage_Access_API#) để kích hoạt quyền, sau đó tải lại tài nguyên với cookie.

<table class="properties">
  <tbody>
    <tr>
      <th scope="row">Loại tiêu đề</th>
      <td>{{Glossary("Fetch Metadata Request Header")}}</td>
    </tr>
    <tr>
      <th scope="row">{{Glossary("Forbidden request header")}}</th>
      <td>Không</td>
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
Activate-Storage-Access: retry; allowed-origin="https://foo.bar"
Activate-Storage-Access: retry; allowed-origin=*
Activate-Storage-Access: load
```

## Chỉ thị

- `retry`
  - : Máy chủ sử dụng token này để chỉ ra rằng nó cần cookie của bên thứ ba để phản hồi đúng yêu cầu này.

    Máy chủ nên kiểm tra `Sec-Fetch-Storage-Access: inactive` trong yêu cầu trước khi phản hồi với token này để xác nhận rằng quyền đã được cấp (nhưng không hoạt động).
    Tham số `allowed-origin` phải được chỉ định để cho phép nguồn gốc cụ thể (chỉ định `*` để cho phép bất kỳ nguồn gốc nào).

    Trình duyệt nên phản hồi bằng cách kích hoạt quyền truy cập lưu trữ _đã được cấp_, và thử lại yêu cầu với cookie không được phân vùng được đưa vào.

- `load`
  - : Máy chủ sử dụng token này để chỉ ra rằng nó đang gửi cho trình duyệt một tài liệu HTML cần kích hoạt cấp quyền `storage-access` đã có sẵn — để truy cập cookie không được phân vùng trong khi tải.

    Máy chủ nên kiểm tra `Sec-Fetch-Storage-Access: inactive` hoặc `Sec-Fetch-Storage-Access: active` trong yêu cầu trước khi phản hồi với `load` để xác nhận rằng quyền đã được cấp.

    Trình duyệt nên phản hồi bằng cách tải tài nguyên và cấp cho nó quyền truy cập vào cookie không được phân vùng của nó.

## Mô tả

[Storage Access API](/en-US/docs/Web/API/Storage_Access_API) cung cấp cơ chế JavaScript để cho phép tài nguyên nhúng yêu cầu quyền `storage-access`.
Điều này cho phép gửi cookie của bên thứ ba trong các yêu cầu, điều này theo mặc định sẽ bị chặn trong hầu hết các trình duyệt.
Tài nguyên trước tiên phải được yêu cầu không có cookie, vì vậy máy chủ trả về phiên bản không có thông tin đăng nhập của tài nguyên sẽ không có quyền truy cập vào cookie của chính nó.
Sau khi tải, tài nguyên này có thể gọi {{domxref("Document.requestStorageAccess()")}} với transient activation để yêu cầu quyền storage-access.
Nếu được người dùng cấp, quyền được trình duyệt lưu trữ trong một khóa liên kết với embedder và embedded _site_.
Trình duyệt sau đó phải tải lại tài nguyên, hiện có thể yêu cầu với cookie vì nó có trạng thái quyền `active` cho ngữ cảnh hiện tại.

Quyền được cấp cho một cặp embedder/embedded site cụ thể, nhưng chỉ được _kích hoạt_ cho một nguồn gốc cụ thể, và cho một ngữ cảnh cụ thể chẳng hạn như `<iframe>` hoặc tab trình duyệt.
Điều này có nghĩa là nếu bạn tải cùng một trang trong một tab mới hoặc `<iframe>`, trạng thái quyền của ngữ cảnh đó sẽ được cấp nhưng `inactive`; nó sẽ không trở thành `active` cho đến khi quyền được kích hoạt.
Tương tự, nếu bạn tải một nguồn gốc khác trong cùng một trang web, quyền sẽ được cấp nhưng bạn sẽ cần kích hoạt quyền để cookie của bên thứ ba được gửi hoặc tải cho tài nguyên đó.

Tài nguyên phải được tải ít nhất một lần để được cấp quyền storage-access.
Tuy nhiên, một khi đã được cấp, máy chủ có thể sử dụng `Activate-Storage-Access` để kích hoạt quyền cho các nguồn gốc và ngữ cảnh khác.

Cách thức hoạt động là:

1. Trình duyệt thêm `Sec-Fetch-Storage-Access: inactive` vào các yêu cầu khi ngữ cảnh có quyền nhưng nó không hoạt động (cùng với tiêu đề `Origin` chỉ ra nguồn của yêu cầu).
2. Nếu máy chủ nhận được `Sec-Fetch-Storage-Access: inactive` nó có thể phản hồi với `Activate-Storage-Access: retry; allowed-origin="<request_origin>"` để yêu cầu trình duyệt kích hoạt quyền cho ngữ cảnh và thử lại yêu cầu.
3. Nếu trình duyệt nhận được yêu cầu thử lại, nó kích hoạt quyền và gửi yêu cầu lại, lần này với `Sec-Fetch-Storage-Access: active` và bao gồm cookie.
4. Nếu máy chủ thấy một yêu cầu với `Sec-Fetch-Storage-Access: active` và cookie, nó phản hồi với phiên bản có thông tin đăng nhập của tài nguyên.
   Một khi được trình duyệt tải, tài nguyên này có quyền truy cập vào cookie của nó như thể nó là tài nguyên của bên thứ nhất.

Phản hồi cũng phải bao gồm tiêu đề {{httpheader("Vary")}} với `Sec-Fetch-Storage-Access`.

> [!NOTE]
> Cũng có thể (nhưng kém hiệu quả hơn) kích hoạt quyền bằng cách tải tài nguyên và gọi `Document.requestStorageAccess()`.

## Ví dụ

Các ví dụ này hiển thị các yêu cầu với {{httpheader("Sec-Fetch-Storage-Access")}} cho các ngữ cảnh có trạng thái quyền truy cập lưu trữ khác nhau, và các phản hồi tương ứng với `Activate-Storage-Access`.
Chúng sử dụng ví dụ của một trang web, `https://mysite.example`, bao gồm một {{htmlelement("iframe")}} nhúng một trang hồ sơ người dùng, `embedded.com/user/profile`.

### Máy chủ kích hoạt quyền

Ví dụ này giả sử rằng người dùng đã cấp quyền cho ngữ cảnh, nhưng nó chưa được kích hoạt.
(Với API, chúng ta sẽ kích hoạt quyền bằng cách tải lại tài nguyên để nó có thể gọi `Document.requestStorageAccess()`.)

Yêu cầu là cho một `<iframe>` đa trang với chế độ thông tin đăng nhập ["include"](/en-US/docs/Web/API/Request/credentials#include).
Trình duyệt đã thêm `Sec-Fetch-Storage-Access: inactive` vào yêu cầu, vì quyền `secure-access` đã được cấp nhưng chưa được kích hoạt.
Nó không thêm cookie vì chúng bị chặn theo mặc định.
`Origin` cũng được đặt vì máy chủ cần biết nguồn gốc của yêu cầu.

```http
GET /user/profile HTTP/1.1
Host: embedded.com
Origin: https://mysite.example
Sec-Fetch-Dest: iframe
Sec-Fetch-Site: cross-site
Sec-Fetch-Mode: navigate
Sec-Fetch-Storage-Access: inactive
Credentials-Mode: include
```

Máy chủ phản hồi với `Activate-Storage-Access: retry; allowed-origin="https://mysite.example"`, chỉ ra rằng trình duyệt nên kích hoạt quyền đã được cấp và thử lại yêu cầu với cookie.
Máy chủ bao gồm tiêu đề {{httpheader("Vary")}}, vì phản hồi có thể thay đổi với `Sec-Fetch-Storage-Access`.

```http
HTTP/1.1 401 Unauthorized
Content-Type: text/html
Vary: Sec-Fetch-Storage-Access
Activate-Storage-Access: retry; allowed-origin="https://mysite.example"
```

Trình duyệt kích hoạt quyền và thực hiện một yêu cầu mới.
Bên dưới bạn có thể thấy rằng nó đặt `Sec-Fetch-Storage-Access: active` và lần này bao gồm cookie của bên thứ ba.

```http
GET /user/profile HTTP/1.1
Host: embedded.com
Origin: https://mysite.example
Sec-Fetch-Dest: iframe
Sec-Fetch-Site: cross-site
Sec-Fetch-Mode: navigate
Sec-Fetch-Storage-Access: active
Credentials-Mode: include
Cookie: sessionid=abc123
```

Máy chủ sau đó phản hồi với tài nguyên có thông tin đăng nhập bao gồm `Activate-Storage-Access: load`.
Tài nguyên được tải và có quyền truy cập vào cookie của nó như thể nó là tài nguyên nhúng của bên thứ nhất.

```http
HTTP/1.1 200 OK
Content-Type: text/html
Activate-Storage-Access: load
Vary: Sec-Fetch-Storage-Access

<html>
  ...
</html>
```

### Quyền secure-access ban đầu không được cấp

Ví dụ này giả sử đây là lần _đầu tiên_ người dùng truy cập một trang nhúng bất kỳ thứ gì từ `embedded.com`, vì vậy quyền truy cập lưu trữ chưa được cấp.

Các tiêu đề chỉ có thể kích hoạt quyền cho một ngữ cảnh đã được cấp — chúng không thể được sử dụng để _cấp_ quyền storage-access ngay từ đầu.
Trang nhúng vì vậy phải được tải không có cookie và sau đó gọi {{domxref("Document.requestStorageAccess()")}} với transient activation để yêu cầu quyền storage-access.
Đây là luồng tương tự như khi các tiêu đề không có mặt.

> [!NOTE]
> Các tiêu đề được thêm vào nơi thích hợp khi quyền chưa được cấp, nhưng không ảnh hưởng đến luồng thông điệp hoặc hành vi trình duyệt.
> Vì ví dụ không minh họa mục đích chính của các tiêu đề, chúng tôi đã trình bày nó sau ví dụ "đã được cấp".

Yêu cầu tương tự như trong ví dụ trước ngoại trừ trình duyệt đã thêm `Sec-Fetch-Storage-Access: none`, vì quyền `secure-access` chưa được cấp.
Một lần nữa, cookie không được thêm vì chúng bị chặn theo mặc định.

```http
GET /user/profile HTTP/1.1
Host: embedded.com
Origin: https://mysite.example
Sec-Fetch-Dest: iframe
Sec-Fetch-Site: cross-site
Sec-Fetch-Mode: navigate
Sec-Fetch-Storage-Access: none
Credentials-Mode: include
```

Máy chủ trả về phiên bản không có thông tin đăng nhập của tài nguyên.
Điều này bao gồm tiêu đề {{httpheader("Vary")}}, vì phản hồi có thể thay đổi với `Sec-Fetch-Storage-Access`.
Lưu ý rằng nó không bao gồm `Activate-Storage-Access` vì máy chủ không thể kích hoạt quyền nếu không có quyền nào được cấp.

```http
HTTP/1.1 200 OK
Content-Type: text/html
Vary: Sec-Fetch-Storage-Access

<html>
  ...
</html>
```

Trang nhúng sau đó sẽ gọi {{domxref("Document.requestStorageAccess()")}} với transient activation để yêu cầu quyền storage-access.
Nếu quyền storage-access được cấp cho trang nhúng, nó cũng được kích hoạt.

Sau đó nó sẽ tải lại chính nó, dẫn đến yêu cầu sau.
Lần này trình duyệt thêm `Sec-Fetch-Storage-Access: active` và bao gồm cookie của bên thứ ba, phản ánh trạng thái quyền của nội dung nhúng.

```http
GET /user/profile HTTP/1.1
Host: embedded.com
Origin: https://mysite.example
Sec-Fetch-Dest: iframe
Sec-Fetch-Site: cross-site
Sec-Fetch-Mode: navigate
Sec-Fetch-Storage-Access: active
Credentials-Mode: include
Cookie: sessionid=abc123
```

Máy chủ phản hồi với phiên bản có thông tin đăng nhập của tài nguyên, có thể khác với phiên bản đầu tiên được tải, và thêm tiêu đề `Activate-Storage-Access: load`.
Trình duyệt tải trang, bây giờ sẽ có quyền truy cập vào thông tin cookie của chính nó.

```http
HTTP/1.1 200 OK
Content-Type: text/html
Vary: Sec-Fetch-Storage-Access
Activate-Storage-Access: load

<html>
  ...
</html>
```

## Thông số kỹ thuật

{{Specifications}}

## Khả năng tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{httpheader("Sec-Fetch-Storage-Access")}}
- [Tiêu đề truy cập lưu trữ](/en-US/docs/Web/API/Storage_Access_API#storage_access_headers) trong _Storage Access API_
- [Trình tự tiêu đề truy cập lưu trữ](/en-US/docs/Web/API/Storage_Access_API#storage_access_header_sequences) trong _Storage Access API_
