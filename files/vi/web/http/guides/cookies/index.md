---
title: Sử dụng cookie HTTP
slug: Web/HTTP/Guides/Cookies
page-type: guide
sidebar: http
---

Một **cookie** (còn được gọi là cookie web hoặc cookie trình duyệt) là một mảnh dữ liệu nhỏ mà máy chủ gửi đến trình duyệt web của người dùng. Trình duyệt có thể lưu trữ cookie, tạo cookie mới, sửa đổi cookie hiện có và gửi chúng trở lại cùng máy chủ với các yêu cầu sau. Cookie cho phép các ứng dụng web lưu trữ lượng dữ liệu giới hạn và ghi nhớ thông tin trạng thái; theo mặc định giao thức HTTP là [không có trạng thái](/en-US/docs/Web/HTTP/Guides/Overview#http_is_stateless_but_not_sessionless).

Trong bài viết này, chúng ta sẽ khám phá các mục đích sử dụng chính của cookie, giải thích các thực tiễn tốt nhất để sử dụng chúng, và xem xét các tác động về quyền riêng tư và bảo mật của chúng.

## Cookie được sử dụng để làm gì

Thông thường, máy chủ sẽ sử dụng nội dung cookie HTTP để xác định xem các yêu cầu khác nhau có đến từ cùng một trình duyệt/người dùng hay không và sau đó đưa ra phản hồi được cá nhân hóa hoặc chung chung phù hợp. Dưới đây mô tả một hệ thống đăng nhập người dùng cơ bản:

1. Người dùng gửi thông tin đăng nhập đến máy chủ, ví dụ thông qua gửi biểu mẫu.
2. Nếu thông tin đăng nhập chính xác, máy chủ cập nhật UI để cho thấy người dùng đã đăng nhập, và phản hồi với cookie chứa ID phiên ghi lại trạng thái đăng nhập của họ trên trình duyệt.
3. Sau đó, người dùng chuyển đến một trang khác trên cùng trang web. Trình duyệt gửi cookie chứa ID phiên cùng với yêu cầu tương ứng để chỉ ra rằng nó vẫn nghĩ người dùng đã đăng nhập.
4. Máy chủ kiểm tra ID phiên và, nếu vẫn còn hợp lệ, gửi cho người dùng phiên bản được cá nhân hóa của trang mới. Nếu không hợp lệ, ID phiên sẽ bị xóa và người dùng được hiển thị phiên bản chung của trang (hoặc có thể được hiển thị thông báo "truy cập bị từ chối" và được yêu cầu đăng nhập lại).

![biểu diễn trực quan của mô tả hệ thống đăng nhập ở trên](/shared-assets/images/diagrams/http/cookies/cookie-basic-example.png)

Cookie chủ yếu được sử dụng cho ba mục đích:

- **Quản lý phiên**: Trạng thái đăng nhập của người dùng, nội dung giỏ hàng, điểm số trò chơi, hoặc bất kỳ chi tiết liên quan đến phiên người dùng nào khác mà máy chủ cần nhớ.
- **Cá nhân hóa**: Tùy chọn của người dùng như ngôn ngữ hiển thị và chủ đề giao diện.
- **Theo dõi**: Ghi lại và phân tích hành vi người dùng.

### Lưu trữ dữ liệu

Trong những ngày đầu của web khi không có lựa chọn nào khác, cookie được sử dụng cho mục đích lưu trữ dữ liệu phía client nói chung. Các API lưu trữ hiện đại hiện được khuyến nghị, ví dụ [Web Storage API](/en-US/docs/Web/API/Web_Storage_API) (`localStorage` và `sessionStorage`) và [IndexedDB](/en-US/docs/Web/API/IndexedDB_API).

Chúng được thiết kế với việc lưu trữ trong tâm trí, không bao giờ gửi dữ liệu đến máy chủ, và không có các nhược điểm khác của việc sử dụng cookie để lưu trữ:

- Trình duyệt thường bị giới hạn đến số lượng cookie tối đa trên mỗi tên miền (khác nhau theo trình duyệt, thường là vài trăm), và kích thước tối đa trên mỗi cookie (thường là 4KB). Các API lưu trữ có thể lưu trữ lượng dữ liệu lớn hơn.
- Cookie được gửi với mọi yêu cầu, vì vậy chúng có thể làm giảm hiệu suất (ví dụ trên kết nối dữ liệu di động chậm), đặc biệt nếu bạn có nhiều cookie được đặt.

> [!NOTE]
> Để xem các cookie đã lưu trữ (và bộ nhớ khác mà trang web đang sử dụng), bạn có thể sử dụng [Storage Inspector](https://firefox-source-docs.mozilla.org/devtools-user/storage_inspector/index.html) trong Firefox Developer Tools, hoặc [Application panel](https://developer.chrome.com/docs/devtools/progressive-web-apps) trong Chrome Developer Tools.

## Tạo, xóa và cập nhật cookie

Sau khi nhận được yêu cầu HTTP, máy chủ có thể gửi một hoặc nhiều tiêu đề {{HTTPHeader("Set-Cookie")}} với phản hồi, mỗi tiêu đề sẽ đặt một cookie riêng biệt. Cookie được đặt bằng cách chỉ định một cặp tên-giá trị như sau:

```http
Set-Cookie: <cookie-name>=<cookie-value>
```

Phản hồi HTTP sau hướng dẫn trình duyệt nhận lưu trữ một cặp cookie:

```http
HTTP/2.0 200 OK
Content-Type: text/html
Set-Cookie: yummy_cookie=chocolate
Set-Cookie: tasty_cookie=strawberry

[page content]
```

> [!NOTE]
> Tìm hiểu cách sử dụng tiêu đề `Set-Cookie` trong các ngôn ngữ/framework phía máy chủ khác nhau: [PHP](https://www.php.net/manual/en/function.setcookie.php), [Node.js](https://nodejs.org/docs/latest-v19.x/api/http.html#responsesetheadername-value), [Python](https://docs.python.org/3/library/http.cookies.html), [Ruby on Rails](https://api.rubyonrails.org/classes/ActionDispatch/Cookies.html).

Khi một yêu cầu mới được thực hiện, trình duyệt thường gửi lại các cookie đã lưu trước đó cho tên miền hiện tại đến máy chủ trong tiêu đề HTTP {{HTTPHeader("Cookie")}}:

```http
GET /sample_page.html HTTP/2.0
Host: www.example.org
Cookie: yummy_cookie=chocolate; tasty_cookie=strawberry
```

### Xóa: định nghĩa thời gian tồn tại của cookie

Bạn có thể chỉ định ngày hết hạn hoặc khoảng thời gian sau đó cookie nên bị xóa và không còn được gửi. Tùy thuộc vào các thuộc tính được đặt trong tiêu đề {{HTTPHeader("Set-Cookie")}} khi cookie được tạo, chúng có thể là cookie _vĩnh viễn_ hoặc _phiên_:

- Cookie vĩnh viễn bị xóa sau ngày được chỉ định trong thuộc tính `Expires`:

  ```http
  Set-Cookie: id=a3fWa; Expires=Thu, 31 Oct 2021 07:28:00 GMT;
  ```

  hoặc sau khoảng thời gian được chỉ định trong thuộc tính `Max-Age`:

  ```http
  Set-Cookie: id=a3fWa; Max-Age=2592000
  ```

  > [!NOTE]
  > `Expires` đã có sẵn lâu hơn `Max-Age`, tuy nhiên `Max-Age` ít bị lỗi hơn, và được ưu tiên khi cả hai được đặt. Lý do đằng sau điều này là khi bạn đặt ngày và giờ `Expires`, chúng liên quan đến client mà cookie đang được đặt. Nếu máy chủ được đặt theo thời gian khác, điều này có thể gây ra lỗi.

- Cookie _phiên_ — cookie không có thuộc tính `Max-Age` hoặc `Expires` — bị xóa khi phiên hiện tại kết thúc. Trình duyệt xác định khi nào "phiên hiện tại" kết thúc, và một số trình duyệt sử dụng _khôi phục phiên_ khi khởi động lại. Điều này có thể làm cho cookie phiên tồn tại vô thời hạn.

  > [!NOTE]
  > Nếu trang web của bạn xác thực người dùng, nó nên tạo lại và gửi lại cookie phiên, ngay cả những cookie đã tồn tại, bất cứ khi nào người dùng xác thực. Cách tiếp cận này giúp ngăn chặn các cuộc tấn công [session fixation](https://owasp.org/www-community/attacks/Session_fixation), khi một bên thứ ba có thể tái sử dụng phiên của người dùng.

Để xóa ngay lập tức cookie, hãy đặt lại cookie với cùng tên, đường dẫn và tên miền (nếu được chỉ định), và đặt thuộc tính `Expires` của nó thành ngày trong quá khứ hoặc thuộc tính `Max-Age` thành `0` hoặc âm. Điều này hướng dẫn trình duyệt xóa cookie ngay lập tức. Ví dụ:

```http
Set-Cookie: id=a3fWa; Max-Age=0
```

Bạn cũng có thể xóa tất cả cookie liên quan đến tên miền có thể đăng ký bằng tiêu đề phản hồi {{httpheader("Clear-Site-Data")}}.
Ví dụ, tiêu đề sau được gửi từ `https://foo.example.com/` sẽ xóa tất cả cookie được gửi bởi `example.com` và tất cả các tên miền con của nó, chẳng hạn như `all.bar.example.com`.

```http
Clear-Site-Data: "cookies"
```

Có một số kỹ thuật được thiết kế để tái tạo cookie sau khi chúng bị xóa. Những kỹ thuật này được gọi là cookie "zombie". Các kỹ thuật này vi phạm các nguyên tắc về [quyền riêng tư](#privacy_and_tracking) và kiểm soát của người dùng, có thể vi phạm [các quy định quyền riêng tư dữ liệu](#cookie-related_regulations), và có thể khiến trang web sử dụng chúng chịu trách nhiệm pháp lý.

### Cập nhật giá trị cookie

Để cập nhật cookie thông qua HTTP, máy chủ có thể gửi tiêu đề {{HTTPHeader("Set-Cookie")}} với tên cookie hiện có và giá trị mới. Ví dụ:

```http
Set-Cookie: id=new-value
```

Có một số lý do tại sao bạn có thể muốn làm điều này, ví dụ nếu người dùng đã cập nhật tùy chọn của họ và ứng dụng muốn phản ánh các thay đổi trong dữ liệu phía client (bạn cũng có thể làm điều này với cơ chế lưu trữ phía client như [Web Storage](/en-US/docs/Web/API/Web_Storage_API)).

#### Cập nhật cookie thông qua JavaScript

Trong trình duyệt, bạn có thể tạo cookie mới thông qua JavaScript bằng cách sử dụng thuộc tính {{domxref("Document.cookie")}}, hoặc API {{domxref("Cookie_Store_API", "Cookie Store", "", "nocode")}} bất đồng bộ. Lưu ý rằng tất cả các ví dụ bên dưới sử dụng `Document.cookie`, vì đây là tùy chọn được hỗ trợ/thiết lập rộng rãi nhất.

```js
document.cookie = "yummy_cookie=chocolate";
document.cookie = "tasty_cookie=strawberry";
```

Bạn cũng có thể truy cập các cookie hiện có và đặt giá trị mới cho chúng:

```js
console.log(document.cookie);
// logs "yummy_cookie=chocolate; tasty_cookie=strawberry"

document.cookie = "yummy_cookie=blueberry";

console.log(document.cookie);
// logs "tasty_cookie=strawberry; yummy_cookie=blueberry"
```

Vì lý do bảo mật, bạn không thể thay đổi giá trị cookie bằng cách gửi tiêu đề `Cookie` được cập nhật trực tiếp khi bắt đầu yêu cầu, ví dụ thông qua {{domxref("Window/fetch", "fetch()")}} hoặc {{domxref("XMLHttpRequest")}}.

Có lý do chính đáng để bạn không nên cho phép JavaScript sửa đổi cookie hoàn toàn. Bạn có thể ngăn JavaScript truy cập cookie bằng cách chỉ định thuộc tính [`HttpOnly`](/en-US/docs/Web/HTTP/Reference/Headers/Set-Cookie#httponly) trong quá trình tạo. Xem phần [Bảo mật](#security) để biết thêm chi tiết.

## Bảo mật

Khi bạn lưu trữ thông tin trong cookie, theo mặc định tất cả giá trị cookie đều hiển thị và có thể được thay đổi bởi người dùng cuối. Bạn thực sự không muốn cookie của mình bị lạm dụng — ví dụ được truy cập/sửa đổi bởi các tác nhân xấu, hoặc gửi đến các tên miền không nên gửi. Các hậu quả tiềm ẩn có thể từ khó chịu — ứng dụng không hoạt động hoặc có hành vi kỳ lạ — đến thảm khốc. Ví dụ, kẻ phạm tội có thể đánh cắp ID phiên và sử dụng nó để đặt cookie làm cho chúng trông như đang đăng nhập với tư cách là người khác, chiếm quyền kiểm soát tài khoản ngân hàng hoặc thương mại điện tử của họ.

Bạn có thể bảo mật cookie của mình theo nhiều cách, được xem xét trong phần này.

### Chặn quyền truy cập vào cookie của bạn

Bạn có thể đảm bảo rằng cookie được gửi an toàn và không bị truy cập bởi các bên hoặc script không mong muốn bằng một trong hai cách: với thuộc tính `Secure` và thuộc tính `HttpOnly`:

```http
Set-Cookie: id=a3fWa; Expires=Thu, 21 Oct 2021 07:28:00 GMT; Secure; HttpOnly
```

- Cookie với thuộc tính `Secure` chỉ được gửi đến máy chủ với yêu cầu được mã hóa qua giao thức HTTPS. Nó không bao giờ được gửi với HTTP không bảo mật (ngoại trừ trên localhost), điều đó có nghĩa là kẻ tấn công {{Glossary("MitM", "người trung gian")}} không thể dễ dàng truy cập nó. Các trang web không bảo mật (với `http:` trong URL) không thể đặt cookie với thuộc tính `Secure`. Tuy nhiên, đừng cho rằng `Secure` ngăn chặn tất cả quyền truy cập vào thông tin nhạy cảm trong cookie. Ví dụ, ai đó có quyền truy cập vào đĩa cứng của client (hoặc JavaScript nếu thuộc tính `HttpOnly` không được đặt) có thể đọc và sửa đổi thông tin.

- Cookie với thuộc tính `HttpOnly` không thể được truy cập bởi JavaScript, ví dụ sử dụng {{domxref("Document.cookie")}}; nó chỉ có thể được truy cập khi đến máy chủ. Cookie duy trì phiên người dùng, chẳng hạn, nên có thuộc tính `HttpOnly` được đặt — sẽ thực sự không an toàn khi làm cho chúng có sẵn cho JavaScript. Biện pháp phòng ngừa này giúp giảm thiểu các cuộc tấn công cross-site scripting ([XSS](/en-US/docs/Web/Security/Attacks/XSS)).

> [!NOTE]
> Tùy thuộc vào ứng dụng, bạn có thể muốn sử dụng mã định danh mờ mà máy chủ tra cứu thay vì lưu trữ thông tin nhạy cảm trực tiếp trong cookie, hoặc điều tra các cơ chế xác thực/bảo mật thay thế như [JSON Web Tokens](https://www.jwt.io/).

### Định nghĩa nơi cookie được gửi

Các thuộc tính `Domain` và `Path` định nghĩa _phạm vi_ của cookie: những URL nào mà cookie được gửi đến.

- Thuộc tính `Domain` chỉ định máy chủ nào có thể nhận cookie. Nếu được chỉ định, cookie có sẵn trên máy chủ được chỉ định và các tên miền con của nó. Ví dụ, nếu bạn đặt `Domain=mozilla.org` từ `mozilla.org`, cookie có sẵn trên tên miền đó và các tên miền con như `developer.mozilla.org`.

  ```http
  Set-Cookie: id=a3fWa; Expires=Thu, 21 Oct 2021 07:28:00 GMT; Secure; HttpOnly; Domain=mozilla.org
  ```

  Nếu tiêu đề `Set-Cookie` không chỉ định thuộc tính `Domain`, cookie có sẵn trên máy chủ đặt nó _nhưng không phải trên các tên miền con của nó_. Do đó, chỉ định `Domain` ít hạn chế hơn so với bỏ qua nó.
  Lưu ý rằng máy chủ chỉ có thể đặt thuộc tính `Domain` thành tên miền của chính nó hoặc tên miền cha, không phải tên miền con hoặc tên miền khác.
  Vì vậy, ví dụ, máy chủ có tên miền `foo.example.com` có thể đặt thuộc tính thành `example.com` hoặc `foo.example.com`, nhưng không phải `bar.foo.example.com` hoặc `elsewhere.com` (cookie vẫn sẽ được _gửi_ đến các tên miền con như `bar.foo.example.com` mặc dù).
  Xem [Tên miền không hợp lệ](/en-US/docs/Web/HTTP/Reference/Headers/Set-Cookie#invalid_domains) để biết thêm chi tiết.

- Thuộc tính `Path` cho biết đường dẫn URL phải tồn tại trong URL được yêu cầu để gửi tiêu đề `Cookie`. Ví dụ:

  ```http
  Set-Cookie: id=a3fWa; Expires=Thu, 21 Oct 2021 07:28:00 GMT; Secure; HttpOnly; Path=/docs
  ```

  Ký tự `%x2F` ("/") được coi là dấu phân cách thư mục, và các thư mục con cũng phù hợp. Ví dụ, nếu bạn đặt `Path=/docs`, các đường dẫn yêu cầu sau đây sẽ khớp:
  - `/docs`
  - `/docs/`
  - `/docs/Web/`
  - `/docs/Web/HTTP`

  Nhưng các đường dẫn yêu cầu này sẽ không khớp:
  - `/`
  - `/docsets`
  - `/fr/docs`

  > [!NOTE]
  > Thuộc tính `path` cho phép bạn kiểm soát cookie nào trình duyệt gửi dựa trên các phần khác nhau của trang web.
  > Nó không được coi là biện pháp bảo mật, và [không bảo vệ](/en-US/docs/Web/API/Document/cookie#security) chống lại việc đọc trái phép cookie từ đường dẫn khác.

### Kiểm soát cookie của bên thứ ba với `SameSite`

Thuộc tính [`SameSite`](/en-US/docs/Web/HTTP/Reference/Headers/Set-Cookie#samesitesamesite-value) cho phép máy chủ chỉ định liệu/khi nào cookie được gửi với các yêu cầu cross-site — tức là, [cookie của bên thứ ba](/en-US/docs/Web/Privacy/Guides/Third-party_cookies). Các yêu cầu cross-site là các yêu cầu mà {{Glossary("Site", "trang web")}} (tên miền có thể đăng ký) và/hoặc scheme (http hoặc https) không khớp với trang web mà người dùng đang truy cập hiện tại. Điều này bao gồm các yêu cầu được gửi khi các liên kết được nhấp trên các trang web khác để điều hướng đến trang web của bạn, và bất kỳ yêu cầu nào được gửi bởi nội dung bên thứ ba nhúng vào.

`SameSite` giúp ngăn chặn rò rỉ thông tin, bảo tồn [quyền riêng tư](#privacy_and_tracking) của người dùng và cung cấp một số bảo vệ chống lại các cuộc tấn công {{Glossary("CSRF", "cross-site request forgery")}}. Nó có ba giá trị có thể: `Strict`, `Lax`, và `None`:

- `Strict` khiến trình duyệt chỉ gửi cookie để phản hồi các yêu cầu xuất phát từ trang web nguồn gốc của cookie. Điều này nên được sử dụng khi bạn có cookie liên quan đến chức năng sẽ luôn nằm sau điều hướng ban đầu, như xác thực hoặc lưu trữ thông tin giỏ hàng.

  ```http
  Set-Cookie: cart=110045_77895_53420; SameSite=Strict
  ```

  > [!NOTE]
  > Cookie được sử dụng cho thông tin nhạy cảm cũng nên có [thời gian tồn tại](#removal_defining_the_lifetime_of_a_cookie) ngắn.

- `Lax` tương tự, ngoại trừ trình duyệt cũng gửi cookie khi người dùng _điều hướng_ đến trang web nguồn gốc của cookie (ngay cả khi người dùng đến từ một trang web khác). Điều này hữu ích cho cookie ảnh hưởng đến hiển thị của trang web — ví dụ bạn có thể có thông tin sản phẩm đối tác cùng với liên kết liên kết trên trang web của bạn. Khi liên kết đó được theo dõi đến trang web đối tác, họ có thể muốn đặt cookie cho biết liên kết liên kết đã được theo dõi, hiển thị biểu ngữ phần thưởng và cung cấp giảm giá nếu sản phẩm được mua.

  ```http
  Set-Cookie: affiliate=e4rt45dw; SameSite=Lax
  ```

- `None` chỉ định rằng cookie được gửi trên cả các yêu cầu xuất phát và cross-site. Điều này hữu ích nếu bạn muốn gửi cookie cùng với các yêu cầu được thực hiện từ nội dung bên thứ ba được nhúng trong các trang web khác, ví dụ, các nhà cung cấp ad-tech hoặc phân tích. Lưu ý rằng nếu `SameSite=None` được đặt thì thuộc tính `Secure` cũng phải được đặt — `SameSite=None` yêu cầu một _ngữ cảnh an toàn_.

  ```http
  Set-Cookie: widget_session=7yjgj57e4n3d; SameSite=None; Secure; HttpOnly
  ```

Nếu không có thuộc tính `SameSite` nào được đặt, cookie được coi là `Lax` theo mặc định.

### Tiền tố cookie

Vì thiết kế của cơ chế cookie, máy chủ không thể xác nhận rằng cookie được đặt từ nguồn gốc an toàn hoặc thậm chí biết _cookie ban đầu được đặt ở đâu_.

Một ứng dụng trên tên miền con có thể đặt cookie với thuộc tính `Domain`, cho phép truy cập cookie đó trên tất cả các tên miền con khác. Cơ chế này có thể bị lạm dụng trong cuộc tấn công [session fixation](https://owasp.org/www-community/attacks/Session_fixation).

Là [biện pháp phòng thủ theo chiều sâu](<https://en.wikipedia.org/wiki/Defense_in_depth_(computing)>), bạn có thể sử dụng _tiền tố cookie_ để áp đặt các hạn chế cụ thể đối với các thuộc tính của cookie trong các user-agent hỗ trợ. Tất cả các tiền tố cookie bắt đầu bằng dấu gạch dưới kép (`__`) và kết thúc bằng dấu gạch ngang (`-`). Có bốn tiền tố:

- **`__Secure-`**: Cookie có tên bắt đầu bằng `__Secure-` phải được đặt với thuộc tính `Secure` bởi trang an toàn (HTTPS).
- **`__Host-`**: Cookie có tên bắt đầu bằng `__Host-` phải được đặt với thuộc tính `Secure` bởi trang an toàn (HTTPS). Ngoài ra, chúng không được có thuộc tính `Domain` được chỉ định, và thuộc tính `Path` phải được đặt thành `/`. Điều này đảm bảo rằng các cookie như vậy chỉ được gửi đến host đặt chúng, không phải bất kỳ host nào khác trên tên miền. Nó cũng đảm bảo rằng chúng được đặt trên toàn bộ host và không thể bị ghi đè trên bất kỳ đường dẫn nào trên host đó. Sự kết hợp này tạo ra cookie gần nhất có thể với việc xử lý nguồn gốc như một ranh giới bảo mật.
- **`__Http-`**: Cookie có tên bắt đầu bằng `__Http-` phải được đặt với cờ `Secure` bởi trang an toàn (HTTPS) và ngoài ra phải có thuộc tính `HttpOnly` được đặt để chứng minh rằng chúng được đặt thông qua tiêu đề `Set-Cookie` (chúng không thể được đặt hoặc sửa đổi thông qua các tính năng JavaScript như {{domxref("Document.cookie")}} hoặc [Cookie Store API](/en-US/docs/Web/API/Cookie_Store_API)).
- **`__Host-Http-`**: Cookie có tên bắt đầu bằng `__Host-Http-` phải được đặt với cờ `Secure` bởi trang an toàn (HTTPS) và phải có thuộc tính `HttpOnly` được đặt để chứng minh rằng chúng được đặt thông qua tiêu đề `Set-Cookie`. Ngoài ra, chúng cũng có các hạn chế tương tự như cookie có tiền tố `__Host-`. Sự kết hợp này tạo ra cookie gần nhất có thể với việc xử lý nguồn gốc như một ranh giới bảo mật trong khi đồng thời đảm bảo các nhà phát triển và người vận hành máy chủ biết phạm vi của nó bị giới hạn cho các yêu cầu HTTP.

Trình duyệt sẽ từ chối cookie với các tiền tố này không tuân thủ các hạn chế của chúng. Vì ứng dụng máy chủ chỉ kiểm tra tên cookie cụ thể khi xác định xem người dùng đã được xác thực hay mã thông báo CSRF có chính xác không, điều này thực sự hoạt động như biện pháp phòng thủ chống lại [session fixation](https://owasp.org/www-community/attacks/Session_fixation).

> [!NOTE]
> Trên máy chủ, ứng dụng web _phải_ kiểm tra tên cookie đầy đủ bao gồm cả tiền tố. Các user-agent _không_ loại bỏ tiền tố khỏi cookie trước khi gửi nó trong tiêu đề {{HTTPHeader("Cookie")}} của yêu cầu.

Để biết thêm thông tin về tiền tố cookie và trạng thái hiện tại của hỗ trợ trình duyệt, hãy xem [phần Tiền tố của bài viết tham khảo Set-Cookie](/en-US/docs/Web/HTTP/Reference/Headers/Set-Cookie#cookie_prefixes).

## Quyền riêng tư và theo dõi

Trước đó chúng ta đã nói về cách thuộc tính `SameSite` có thể được sử dụng để kiểm soát khi nào cookie của bên thứ ba được gửi, và điều này có thể giúp bảo tồn quyền riêng tư của người dùng. Quyền riêng tư là một cân nhắc rất quan trọng khi xây dựng các trang web, điều này khi được thực hiện đúng, có thể xây dựng niềm tin với người dùng của bạn. Nếu được thực hiện kém, có thể hoàn toàn làm xói mòn niềm tin đó và gây ra tất cả các loại vấn đề khác.

Cookie của bên thứ ba có thể được đặt bởi nội dung bên thứ ba được nhúng trong các trang web thông qua {{htmlelement("iframe")}}. Chúng có nhiều mục đích sử dụng hợp pháp bao gồm chia sẻ thông tin hồ sơ người dùng, đếm lượt hiển thị quảng cáo, hoặc thu thập phân tích trên các tên miền liên quan khác nhau.

Tuy nhiên, cookie của bên thứ ba cũng có thể được sử dụng để tạo ra trải nghiệm người dùng xâm phạm và đáng sợ. Máy chủ của bên thứ ba có thể tạo hồ sơ về lịch sử duyệt web và thói quen của người dùng dựa trên cookie được gửi đến nó bởi cùng một trình duyệt khi truy cập nhiều trang web. Ví dụ điển hình là khi bạn tìm kiếm thông tin sản phẩm trên một trang web và sau đó bị chạy theo bởi quảng cáo cho các sản phẩm tương tự bất cứ đâu bạn đến.

Các nhà cung cấp trình duyệt biết rằng người dùng không thích hành vi này, và kết quả là tất cả đã bắt đầu chặn cookie của bên thứ ba theo mặc định, hoặc ít nhất đã lập kế hoạch đi theo hướng đó. Cookie của bên thứ ba (hoặc chỉ là cookie theo dõi) cũng có thể bị chặn bởi các cài đặt trình duyệt khác hoặc tiện ích mở rộng.

> [!NOTE]
> Chặn cookie có thể khiến một số thành phần của bên thứ ba (như widget mạng xã hội) không hoạt động như dự định. Khi trình duyệt áp đặt các hạn chế tiếp theo đối với cookie của bên thứ ba, các nhà phát triển nên bắt đầu tìm cách giảm sự phụ thuộc của họ vào chúng.

Xem bài viết [Cookie của bên thứ ba](/en-US/docs/Web/Privacy/Guides/Third-party_cookies) của chúng tôi để biết thông tin chi tiết về cookie của bên thứ ba, các vấn đề liên quan đến chúng, và những lựa chọn thay thế nào có sẵn. Xem trang đích [Quyền riêng tư](/en-US/docs/Web/Privacy) của chúng tôi để biết thêm thông tin về quyền riêng tư nói chung.

## Các quy định liên quan đến cookie

Luật pháp hoặc quy định bao phủ việc sử dụng cookie bao gồm:

- [Quy định bảo vệ dữ liệu chung](https://gdpr.eu/) (GDPR) ở Liên minh châu Âu
- Chỉ thị ePrivacy ở EU
- Đạo luật quyền riêng tư người tiêu dùng California

Các quy định này có phạm vi toàn cầu. Chúng áp dụng cho bất kỳ trang web nào trên _World Wide Web_ mà người dùng từ các khu vực tài phán này truy cập (EU và California, với lưu ý rằng luật của California chỉ áp dụng cho các tổ chức có doanh thu tổng trên 25 triệu USD, trong số các điều khác).

Các quy định này bao gồm các yêu cầu như:

- Thông báo cho người dùng rằng trang web của bạn sử dụng cookie.
- Cho phép người dùng từ chối nhận một số hoặc tất cả cookie.
- Cho phép người dùng sử dụng phần lớn dịch vụ của bạn mà không cần nhận cookie.

Có thể có các quy định khác điều chỉnh việc sử dụng cookie ở địa phương của bạn. Trách nhiệm là của bạn để biết và tuân thủ các quy định này. Có các công ty cung cấp mã "cookie banner" giúp bạn tuân thủ các quy định này.

> [!NOTE]
> Các công ty nên tiết lộ các loại cookie họ sử dụng trên trang web của mình vì lý do minh bạch và để tuân thủ các quy định. Ví dụ, xem [thông báo của Google về các loại cookie nó sử dụng](https://policies.google.com/technologies/cookies#types-of-cookies) và [Thông báo quyền riêng tư về trang web, giao tiếp & cookie của Mozilla](https://www.mozilla.org/en-US/privacy/websites/#cookies).

## Xem thêm

- Các tiêu đề HTTP liên quan: {{HTTPHeader("Set-Cookie")}}, {{HTTPHeader("Cookie")}}
- Các JavaScript API liên quan: {{domxref("Document.cookie")}}, {{domxref("Navigator.cookieEnabled")}}, {{domxref("Cookie_Store_API", "Cookie Store API", "", "nocode")}}
- [Cookie của bên thứ ba](/en-US/docs/Web/Privacy/Guides/Third-party_cookies)
- [Thông số kỹ thuật cookie: RFC 6265](https://datatracker.ietf.org/doc/html/rfc6265)
- [Cookie, GDPR, và Chỉ thị ePrivacy](https://gdpr.eu/cookies/)
