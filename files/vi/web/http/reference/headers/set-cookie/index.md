---
title: Set-Cookie header
short-title: Set-Cookie
slug: Web/HTTP/Reference/Headers/Set-Cookie
page-type: http-header
browser-compat: http.headers.Set-Cookie
sidebar: http
---

Tiêu đề HTTP **`Set-Cookie`** {{Glossary("response header")}} được sử dụng để gửi cookie từ máy chủ đến tác nhân người dùng, để tác nhân người dùng có thể gửi lại cho máy chủ sau này.
Để gửi nhiều cookie, nhiều tiêu đề `Set-Cookie` phải được gửi trong cùng một phản hồi.

> [!WARNING]
> Trình duyệt chặn mã JavaScript frontend truy cập tiêu đề `Set-Cookie`, theo yêu cầu của đặc tả Fetch, định nghĩa `Set-Cookie` là [forbidden response header name](https://fetch.spec.whatwg.org/#forbidden-response-header-name) mà [phải được lọc ra](https://fetch.spec.whatwg.org/#ref-for-forbidden-response-header-name%E2%91%A0) khỏi bất kỳ phản hồi nào được hiển thị cho mã frontend.
>
> Khi yêu cầu [Fetch API](/en-US/docs/Web/API/Fetch_API/Using_Fetch) hoặc [XMLHttpRequest API](/en-US/docs/Web/API/XMLHttpRequest_API) [sử dụng CORS](/en-US/docs/Web/HTTP/Guides/CORS#what_requests_use_cors), trình duyệt sẽ bỏ qua tiêu đề `Set-Cookie` có trong phản hồi của máy chủ trừ khi yêu cầu bao gồm thông tin xác thực. Xem [Using the Fetch API - Including credentials](/en-US/docs/Web/API/Fetch_API/Using_Fetch#including_credentials) và [bài viết XMLHttpRequest](/en-US/docs/Web/API/XMLHttpRequest_API) để tìm hiểu cách bao gồm thông tin xác thực.

Để biết thêm thông tin, xem hướng dẫn về [Sử dụng HTTP cookies](/en-US/docs/Web/HTTP/Guides/Cookies).

<table class="properties">
  <tbody>
    <tr>
      <th scope="row">Loại tiêu đề</th>
      <td>{{Glossary("Response header")}}</td>
    </tr>
    <tr>
      <th scope="row">{{Glossary("Forbidden request header")}}</th>
      <td>Không</td>
    </tr>
    <tr>
      <th scope="row">{{Glossary("Forbidden response header name","Forbidden response header")}}</th>
      <td>Có</td>
    </tr>
  </tbody>
</table>

## Cú pháp

```http
Set-Cookie: <cookie-name>=<cookie-value>
Set-Cookie: <cookie-name>=<cookie-value>; Domain=<domain-value>
Set-Cookie: <cookie-name>=<cookie-value>; Expires=<date>
Set-Cookie: <cookie-name>=<cookie-value>; HttpOnly
Set-Cookie: <cookie-name>=<cookie-value>; Max-Age=<number>
Set-Cookie: <cookie-name>=<cookie-value>; Partitioned
Set-Cookie: <cookie-name>=<cookie-value>; Path=<path-value>
Set-Cookie: <cookie-name>=<cookie-value>; Secure

Set-Cookie: <cookie-name>=<cookie-value>; SameSite=Strict
Set-Cookie: <cookie-name>=<cookie-value>; SameSite=Lax
Set-Cookie: <cookie-name>=<cookie-value>; SameSite=None; Secure

// Multiple attributes are also possible, for example:
Set-Cookie: <cookie-name>=<cookie-value>; Domain=<domain-value>; Secure; HttpOnly
```

## Thuộc tính

- `<cookie-name>=<cookie-value>`
  - : Xác định tên cookie và giá trị của nó.
    Định nghĩa cookie bắt đầu bằng cặp tên-giá trị.

    `<cookie-name>` có thể chứa bất kỳ ký tự US-ASCII nào ngoại trừ ký tự điều khiển (ký tự {{Glossary("ASCII")}} từ 0 đến 31 và ký tự ASCII 127) hoặc ký tự phân tách (khoảng trắng, tab và các ký tự: `( ) < > @ , ; : \ " / [ ] ? = { }`)

    `<cookie-value>` có thể tùy chọn được bao bọc trong dấu ngoặc kép và bao gồm bất kỳ ký tự US-ASCII nào ngoại trừ ký tự điều khiển (ký tự ASCII từ 0 đến 31 và ký tự ASCII 127), {{glossary("Whitespace")}}, dấu ngoặc kép, dấu phẩy, dấu chấm phẩy và dấu gạch chéo ngược.

    **Mã hóa**: Nhiều triển khai thực hiện {{Glossary("Percent-encoding", "percent-encoding")}} trên giá trị cookie. Tuy nhiên, điều này không được yêu cầu bởi đặc tả RFC. Percent-encoding giúp thỏa mãn các yêu cầu về ký tự được phép cho `<cookie-value>`.

    > [!NOTE]
    > Một số tên cookie chứa tiền tố áp đặt các hạn chế cụ thể cho các thuộc tính của cookie trong các tác nhân người dùng hỗ trợ. Xem [Tiền tố cookie](#tiền_tố_cookie) để biết thêm thông tin.

- `Domain=<domain-value>` {{optional_inline}}
  - : Xác định máy chủ mà cookie sẽ được gửi đến.

    Chỉ có thể đặt tên miền hiện tại hoặc tên miền cấp cao hơn làm giá trị, trừ khi đó là hậu tố công khai. Đặt tên miền sẽ làm cho cookie có sẵn cho nó, cũng như tất cả các tên miền con của nó.

    Nếu bỏ qua, cookie chỉ được trả về cho máy chủ đã gửi chúng (tức là, nó trở thành "cookie chỉ dành cho máy chủ").
    Điều này hạn chế hơn so với việc đặt tên máy chủ, vì cookie không được cung cấp cho các tên miền con của máy chủ.

    Trái với các đặc tả trước đó, các dấu chấm đầu trong tên miền (`.example.com`) bị bỏ qua.

    Không cho phép nhiều giá trị máy chủ/tên miền, nhưng nếu một tên miền _được_ chỉ định, thì các tên miền con luôn được bao gồm.

- `Expires=<date>` {{optional_inline}}
  - : Cho biết thời hạn tối đa của cookie dưới dạng dấu thời gian HTTP.
    Xem {{HTTPHeader("Date")}} để biết định dạng yêu cầu.

    Nếu không được chỉ định, cookie trở thành **cookie phiên**.
    Phiên kết thúc khi máy khách tắt, sau đó
    cookie phiên bị xóa.

    > [!WARNING]
    > Nhiều trình duyệt web có tính năng _khôi phục phiên_ sẽ lưu tất cả các tab và khôi phục chúng vào lần tiếp theo sử dụng trình duyệt. Cookie phiên cũng sẽ được khôi phục, như thể trình duyệt chưa bao giờ bị đóng.

    Thuộc tính `Expires` được đặt bởi máy chủ với giá trị tương đối so với đồng hồ nội bộ của nó, có thể khác với đồng hồ của trình duyệt máy khách.
    Firefox và các trình duyệt dựa trên Chromium nội bộ sử dụng giá trị hết hạn (max-age) được điều chỉnh để bù đắp cho sự chênh lệch đồng hồ, lưu trữ và hết hạn cookie dựa trên thời gian mà máy chủ dự định.
    Việc điều chỉnh cho độ lệch đồng hồ được tính toán từ giá trị của tiêu đề {{httpheader("DATE")}}.
    Lưu ý rằng đặc tả giải thích cách phân tích cú pháp thuộc tính, nhưng không chỉ ra liệu/cách giá trị có nên được người nhận điều chỉnh hay không.

- `HttpOnly` {{optional_inline}}
  - : Cấm JavaScript truy cập cookie, ví dụ, thông qua thuộc tính {{domxref("Document.cookie")}}.
    Lưu ý rằng cookie được tạo với `HttpOnly` vẫn sẽ được gửi cùng với các yêu cầu do JavaScript khởi tạo, ví dụ khi gọi {{domxref("XMLHttpRequest.send()")}} hoặc {{domxref("Window/fetch", "fetch()")}}.
    Điều này giảm thiểu các cuộc tấn công chống lại cross-site scripting ({{Glossary("Cross-site_scripting", "XSS")}}).

- `Max-Age=<number>` {{optional_inline}}
  - : Cho biết số giây cho đến khi cookie hết hạn. Số bằng không hoặc âm sẽ làm cookie hết hạn ngay lập tức. Nếu cả `Expires` và `Max-Age` được đặt, `Max-Age` được ưu tiên.

- `Partitioned` {{optional_inline}}
  - : Cho biết cookie nên được lưu trữ bằng bộ lưu trữ phân vùng.
    Lưu ý rằng nếu điều này được đặt, [chỉ thị `Secure`](#secure) cũng phải được đặt.
    Xem [Cookies Having Independent Partitioned State (CHIPS)](/en-US/docs/Web/Privacy/Guides/Privacy_sandbox/Partitioned_cookies) để biết thêm chi tiết.

- `Path=<path-value>` {{optional_inline}}
  - : Cho biết đường dẫn _phải_ tồn tại trong URL được yêu cầu để trình duyệt gửi tiêu đề `Cookie`.

    Nếu bỏ qua, thuộc tính này mặc định là thành phần đường dẫn của URL yêu cầu. Ví dụ, nếu cookie được đặt bởi yêu cầu đến `https://example.com/docs/Web/HTTP/index.html`, đường dẫn mặc định sẽ là `/docs/Web/HTTP/`.

    Ký tự gạch chéo tiến (`/`) được hiểu là dấu tách thư mục, và các thư mục con cũng khớp. Ví dụ, với `Path=/docs`,
    - các đường dẫn yêu cầu `/docs`, `/docs/`, `/docs/Web/`, và `/docs/Web/HTTP` đều khớp.
    - các đường dẫn yêu cầu `/`, `/docsets`, `/fr/docs` sẽ không khớp.

    > [!NOTE]
    > Thuộc tính `path` cho phép bạn kiểm soát những cookie nào trình duyệt gửi dựa trên các phần khác nhau của trang web.
    > Nó không được thiết kế là biện pháp bảo mật, và [không bảo vệ](/en-US/docs/Web/API/Document/cookie#security) khỏi việc đọc cookie trái phép từ một đường dẫn khác.

- `SameSite=<samesite-value>` {{optional_inline}}
  - : Kiểm soát liệu cookie có được gửi cùng với các yêu cầu cross-site hay không: tức là, các yêu cầu xuất phát từ một {{glossary("site")}} khác, bao gồm cả scheme, với site đã đặt cookie. Điều này cung cấp một số bảo vệ chống lại các cuộc tấn công cross-site nhất định, bao gồm các cuộc tấn công {{Glossary("CSRF", "cross-site request forgery (CSRF)")}}.

    Các giá trị thuộc tính có thể là:
    - `Strict`
      - : Chỉ gửi cookie cho các yêu cầu xuất phát từ cùng {{glossary("site")}} đã đặt cookie.

    - `Lax`
      - : Chỉ gửi cookie cho các yêu cầu xuất phát từ cùng {{glossary("site")}} đã đặt cookie, và cho các yêu cầu cross-site đáp ứng cả hai tiêu chí sau:
        - Yêu cầu là điều hướng cấp cao nhất: điều này về cơ bản có nghĩa là yêu cầu gây ra URL hiển thị trong thanh địa chỉ của trình duyệt thay đổi.
          - Điều này sẽ loại trừ, ví dụ, các yêu cầu được thực hiện bằng API {{domxref("Window.fetch()", "fetch()")}}, hoặc các yêu cầu cho tài nguyên phụ từ các phần tử {{htmlelement("img")}} hoặc {{htmlelement("script")}}, hoặc điều hướng bên trong các phần tử {{htmlelement("iframe")}}.

          - Nó sẽ bao gồm các yêu cầu được thực hiện khi người dùng nhấp vào liên kết trong ngữ cảnh duyệt cấp cao nhất từ trang này sang trang khác, hoặc gán vào {{domxref("Document.location", "document.location")}}, hoặc gửi {{htmlelement("form")}}.

        - Yêu cầu sử dụng phương thức {{glossary("Safe/HTTP", "an toàn")}}: cụ thể, điều này loại trừ {{httpmethod("POST")}}, {{httpmethod("PUT")}}, và {{httpmethod("DELETE")}}.

        Một số trình duyệt sử dụng `Lax` làm giá trị mặc định nếu `SameSite` không được chỉ định: xem [Tương thích trình duyệt](#browser_compatibility) để biết chi tiết.

        > [!NOTE]
        > Khi `Lax` được áp dụng làm mặc định, phiên bản cho phép hơn được sử dụng. Trong phiên bản cho phép hơn này, cookie cũng được bao gồm trong các yêu cầu {{httpmethod("POST")}}, miễn là chúng được đặt không quá hai phút trước khi yêu cầu được thực hiện.

    - `None`
      - : Gửi cookie cùng với cả yêu cầu cross-site và same-site.
        Thuộc tính `Secure` cũng phải được đặt khi sử dụng giá trị này.

- `Secure` {{optional_inline}}
  - : Cho biết cookie chỉ được gửi đến máy chủ khi yêu cầu được thực hiện với scheme `https:` (ngoại trừ trên localhost), và do đó, có khả năng chống [man-in-the-middle](/en-US/docs/Glossary/MitM) tốt hơn.

    > [!NOTE]
    > Đừng giả định rằng `Secure` ngăn chặn tất cả quyền truy cập vào thông tin nhạy cảm trong cookie (khóa phiên, thông tin đăng nhập, v.v.).
    > Cookie với thuộc tính này vẫn có thể được đọc/sửa đổi bằng cách truy cập vào ổ cứng của máy khách hoặc từ JavaScript nếu thuộc tính cookie `HttpOnly` không được đặt.
    >
    > Các trang không an toàn (`http:`) không thể đặt cookie với thuộc tính `Secure`. Yêu cầu `https:` bị bỏ qua khi thuộc tính `Secure` được đặt bởi localhost.

## Tiền tố cookie

Một số tên cookie chứa tiền tố áp đặt các hạn chế cụ thể cho các thuộc tính của cookie trong các tác nhân người dùng hỗ trợ. Tất cả tiền tố cookie bắt đầu bằng dấu gạch dưới kép (`__`) và kết thúc bằng dấu gạch ngang (`-`). Các tiền tố sau được định nghĩa:

- **`__Secure-`**: Cookie có tên bắt đầu bằng `__Secure-` phải được đặt với thuộc tính `Secure` bởi một trang an toàn (HTTPS).
- **`__Host-`**: Cookie có tên bắt đầu bằng `__Host-` phải được đặt với thuộc tính `Secure` bởi một trang an toàn (HTTPS). Ngoài ra, chúng không được có thuộc tính `Domain` được chỉ định, và thuộc tính `Path` phải được đặt thành `/`. Điều này đảm bảo rằng các cookie đó chỉ được gửi đến máy chủ đã đặt chúng, không phải bất kỳ máy chủ nào khác trên tên miền. Nó cũng đảm bảo rằng chúng được đặt toàn bộ máy chủ và không thể bị ghi đè trên bất kỳ đường dẫn nào trên máy chủ đó. Sự kết hợp này tạo ra một cookie gần nhất có thể để coi nguồn gốc là ranh giới bảo mật.
- **`__Http-`**: Cookie có tên bắt đầu bằng `__Http-` phải được đặt với cờ `Secure` bởi một trang an toàn (HTTPS) và ngoài ra phải có thuộc tính `HttpOnly` được đặt để chứng minh rằng chúng được đặt qua tiêu đề `Set-Cookie` (chúng không thể được đặt hoặc sửa đổi qua các tính năng JavaScript như `Document.cookie` hoặc [Cookie Store API](/en-US/docs/Web/API/Cookie_Store_API)).
- **`__Host-Http-`**: Cookie có tên bắt đầu bằng `__Host-Http-` phải được đặt với cờ `Secure` bởi một trang an toàn (HTTPS) và phải có thuộc tính `HttpOnly` được đặt để chứng minh rằng chúng được đặt qua tiêu đề `Set-Cookie`. Ngoài ra, chúng cũng có các hạn chế tương tự như cookie có tiền tố `__Host-`. Sự kết hợp này tạo ra một cookie gần nhất có thể để coi nguồn gốc là ranh giới bảo mật đồng thời đảm bảo các nhà phát triển và nhà vận hành máy chủ biết rằng phạm vi của nó bị giới hạn trong các yêu cầu HTTP.

> [!WARNING]
> Bạn không thể tin vào các đảm bảo bổ sung này trên các trình duyệt không hỗ trợ tiền tố cookie; trong những trường hợp đó, cookie có tiền tố sẽ luôn được chấp nhận.

## Ví dụ

### Cookie phiên

Cookie phiên bị xóa khi máy khách tắt. Cookie là cookie phiên nếu chúng không chỉ định thuộc tính `Expires` hoặc `Max-Age`.

```http
Set-Cookie: sessionId=38afes7a8
```

### Cookie vĩnh viễn

Cookie vĩnh viễn bị xóa tại một ngày cụ thể (`Expires`) hoặc sau một khoảng thời gian cụ thể (`Max-Age`) và không khi máy khách bị đóng.

```http
Set-Cookie: id=a3fWa; Expires=Wed, 21 Oct 2015 07:28:00 GMT
```

```http
Set-Cookie: id=a3fWa; Max-Age=2592000
```

### Tên miền không hợp lệ

Cookie cho tên miền không bao gồm máy chủ đã đặt nó [nên bị tác nhân người dùng từ chối](https://datatracker.ietf.org/doc/html/rfc6265#section-4.1.2.3).

Cookie sau sẽ bị từ chối nếu được đặt bởi máy chủ được lưu trữ trên `original-company.com`:

```http
Set-Cookie: qwerty=219ffwef9w0f; Domain=some-company.co.uk
```

Cookie cho tên miền con của tên miền phục vụ sẽ bị từ chối.

Cookie sau sẽ bị từ chối nếu được đặt bởi máy chủ được lưu trữ trên `example.com`:

```http
Set-Cookie: sessionId=e8bb43229de9; Domain=foo.example.com
```

### Tiền tố cookie

Tên cookie có tiền tố `__Secure-` hoặc `__Host-` chỉ có thể được sử dụng nếu chúng được đặt với thuộc tính `Secure` từ nguồn gốc an toàn (HTTPS).

Tên cookie có tiền tố `__Http-` hoặc `__Host-Http-` chỉ có thể được sử dụng nếu chúng được đặt với thuộc tính `Secure` từ nguồn gốc an toàn (HTTPS) và ngoài ra phải có thuộc tính `HttpOnly` được đặt để chứng minh rằng chúng được đặt qua tiêu đề `Set-Cookie` chứ không phải phía máy khách qua JavaScript.

Ngoài ra, cookie có tiền tố `__Host-` hoặc `__Host-Http-` phải có đường dẫn `/` (nghĩa là bất kỳ đường dẫn nào tại máy chủ) và không được có thuộc tính `Domain`.

```http
// Both accepted when from a secure origin (HTTPS)
Set-Cookie: __Secure-ID=123; Secure; Domain=example.com
Set-Cookie: __Host-ID=123; Secure; Path=/

// Rejected due to missing Secure attribute
Set-Cookie: __Secure-id=1

// Rejected due to the missing Path=/ attribute
Set-Cookie: __Host-id=1; Secure

// Rejected due to setting a Domain
Set-Cookie: __Host-id=1; Secure; Path=/; Domain=example.com

// Only settable via Set-Cookie
Set-Cookie: __Http-ID=123; Secure; Domain=example.com
Set-Cookie: __Host-Http-ID=123; Secure; Path=/
```

### Cookie phân vùng

```http
Set-Cookie: __Host-example=34d8g; SameSite=None; Secure; Path=/; Partitioned;
```

> [!NOTE]
> Cookie phân vùng phải được đặt với `Secure`. Ngoài ra, nên sử dụng tiền tố `__Host` hoặc `__Host-Http-` khi đặt cookie phân vùng để ràng buộc chúng với tên máy chủ chứ không phải tên miền có thể đăng ký.

## Đặc tả

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [HTTP cookies](/en-US/docs/Web/HTTP/Guides/Cookies)
- {{HTTPHeader("Cookie")}}
- {{domxref("Document.cookie")}}
- [Samesite cookies explained](https://web.dev/articles/samesite-cookies-explained) (web.dev blog)
