---
title: Chính sách cùng nguồn gốc
slug: Web/Security/Defenses/Same-origin_policy
page-type: guide
sidebar: security
---

**Chính sách cùng nguồn gốc** là một cơ chế bảo mật quan trọng, giới hạn cách một tài liệu hoặc script được tải bởi một {{Glossary("origin")}} có thể tương tác với tài nguyên từ một origin khác.

Nó giúp cô lập các tài liệu có khả năng độc hại, giảm các vectơ tấn công có thể xảy ra. Ví dụ, nó ngăn một website độc hại trên Internet chạy JS trong trình duyệt để đọc dữ liệu từ một dịch vụ webmail của bên thứ ba (mà người dùng đang đăng nhập) hoặc từ mạng nội bộ của công ty (được bảo vệ khỏi truy cập trực tiếp của kẻ tấn công vì không có địa chỉ IP công khai), rồi chuyển tiếp dữ liệu đó cho kẻ tấn công.

## Định nghĩa của một origin

Hai URL có _cùng origin_ nếu {{Glossary("protocol")}}, {{Glossary("port")}} (nếu được chỉ định), và {{Glossary("host")}} giống nhau ở cả hai. Bạn có thể thấy điều này được gọi là "tuple scheme/host/port", hoặc chỉ là "tuple". ("Tuple" là một tập hợp các mục ghép lại với nhau thành một thể hoàn chỉnh - một dạng tổng quát cho cặp/bộ ba/bộ bốn/bộ năm, v.v.)

Bảng sau đưa ra các ví dụ so sánh origin với URL `http://store.company.com/dir/page.html`:

| URL                                               | Kết quả     | Lý do                                           |
| ------------------------------------------------- | ----------- | ------------------------------------------------ |
| `http://store.company.com/dir2/other.html`        | Cùng origin | Chỉ khác đường dẫn                            |
| `http://store.company.com/dir/inner/another.html` | Cùng origin | Chỉ khác đường dẫn                            |
| `https://store.company.com/page.html`             | Thất bại    | Khác giao thức                               |
| `http://store.company.com:81/dir/page.html`       | Thất bại    | Khác cổng (`http://` mặc định là cổng 80) |
| `http://news.company.com/dir/page.html`           | Thất bại    | Khác host                                   |

### Origin kế thừa

Các script được thực thi từ các trang có `about:blank` hoặc [URL `javascript:`](/en-US/docs/Web/URI/Reference/Schemes/javascript) sẽ kế thừa origin của tài liệu chứa URL đó, vì những loại URL này không chứa thông tin về một origin server.

Ví dụ, `about:blank` thường được dùng làm URL cho các cửa sổ popup mới, trống, vào đó script cha ghi nội dung (ví dụ thông qua cơ chế {{domxref("Window.open()")}}). Nếu popup này cũng chứa JavaScript, script đó sẽ kế thừa cùng origin với script đã tạo ra nó.

URL `data:` nhận một ngữ cảnh bảo mật mới, rỗng.

### Origin của file

Các trình duyệt hiện đại thường xem origin của các file được tải bằng scheme `file:///` là _origin mờ_.
Điều này có nghĩa là nếu một file bao gồm các file khác từ cùng thư mục (chẳng hạn), chúng không được giả định là đến từ cùng origin và có thể gây ra lỗi {{Glossary("CORS")}}.

Lưu ý rằng [đặc tả URL](https://url.spec.whatwg.org/#origin) nêu rằng origin của file phụ thuộc vào cách triển khai, và một số trình duyệt có thể xem các file trong cùng thư mục hoặc thư mục con là cùng origin, dù điều đó có [hệ quả bảo mật](https://www.mozilla.org/en-US/security/advisories/mfsa2019-21/#CVE-2019-11730).

## Thay đổi origin

> [!WARNING]
> Cách tiếp cận được mô tả ở đây (dùng setter của {{domxref("document.domain")}}) đã bị loại bỏ vì nó làm suy yếu các bảo vệ bảo mật do chính sách cùng nguồn gốc cung cấp, và làm phức tạp mô hình origin trong trình duyệt, dẫn đến các vấn đề tương thích và lỗi bảo mật.

Một trang có thể thay đổi origin của chính nó, nhưng có một số giới hạn. Script có thể đặt giá trị của {{domxref("document.domain")}} thành domain hiện tại của nó hoặc một superdomain của domain hiện tại. Nếu đặt thành superdomain của domain hiện tại, superdomain ngắn hơn sẽ được dùng cho các kiểm tra cùng origin.

Ví dụ, giả sử một script từ tài liệu tại `http://store.company.com/dir/other.html` thực thi đoạn sau:

```js
document.domain = "company.com";
```

Sau đó, trang có thể vượt qua kiểm tra cùng origin với `http://company.com/dir/page.html` (giả sử `http://company.com/dir/page.html` đặt `document.domain` của nó thành `"company.com"` để cho biết rằng nó muốn cho phép điều đó - xem thêm {{domxref("document.domain")}}). Tuy nhiên, `company.com` **không thể** đặt `document.domain` thành `othercompany.com`, vì đó không phải là superdomain của `company.com`.

Số cổng được trình duyệt kiểm tra riêng. Bất kỳ lần gọi nào tới `document.domain`, kể cả `document.domain = document.domain`, đều làm số cổng bị ghi đè thành `null`. Vì vậy, người ta **không thể** khiến `company.com:8080` nói chuyện với `company.com` chỉ bằng cách đặt `document.domain = "company.com"` ở phía đầu tiên. Nó phải được đặt ở cả hai phía để số cổng của cả hai đều là `null`.

Cơ chế này có một số giới hạn. Ví dụ, nó sẽ ném ra `SecurityError` [`DOMException`](/en-US/docs/Web/API/DOMException) nếu tài liệu nằm trong một [`<iframe>`](/en-US/docs/Web/HTML/Reference/Elements/iframe) có `sandbox`, và việc thay đổi origin theo cách này không ảnh hưởng đến các kiểm tra origin được dùng bởi nhiều Web API khác (ví dụ: [`localStorage`](/en-US/docs/Web/API/Window/localStorage), [`indexedDB`](/en-US/docs/Web/API/IndexedDB_API), [`BroadcastChannel`](/en-US/docs/Web/API/BroadcastChannel), [`SharedWorker`](/en-US/docs/Web/API/SharedWorker)). Danh sách đầy đủ hơn về các trường hợp thất bại có thể xem tại [Document.domain > Failures](/en-US/docs/Web/API/Document/domain#failures).

> [!NOTE]
> Khi dùng `document.domain` để cho phép một subdomain truy cập domain cha của nó, bạn cần đặt `document.domain` thành _cùng một giá trị_ ở cả domain cha và subdomain. Điều này là cần thiết ngay cả khi việc đó chỉ là đặt lại domain cha về giá trị ban đầu của nó. Nếu không làm vậy có thể dẫn đến lỗi quyền truy cập.

## Truy cập mạng xuyên origin

Chính sách cùng nguồn gốc kiểm soát các tương tác giữa hai origin khác nhau, chẳng hạn khi bạn dùng {{domxref("Window/fetch", "fetch()")}} hoặc một phần tử {{htmlelement("img")}}. Những tương tác này thường được chia thành ba nhóm:

- Các _ghi_ xuyên origin thường được phép. Ví dụ gồm liên kết, chuyển hướng và gửi biểu mẫu. Một số yêu cầu HTTP cần [preflight](/en-US/docs/Web/HTTP/Guides/CORS#preflighted_requests).
- _Nhúng_ xuyên origin thường được phép. (Các ví dụ được liệt kê bên dưới.)
- _Đọc_ xuyên origin thường không được phép, nhưng quyền đọc thường bị rò rỉ thông qua việc nhúng. Ví dụ, bạn có thể đọc kích thước của một ảnh được nhúng, các hành vi của một script được nhúng, hoặc [khả năng truy cập của một tài nguyên được nhúng](https://bugzil.la/629094).

Sau đây là một số ví dụ về tài nguyên có thể được nhúng xuyên origin:

- JavaScript với `<script src="…"></script>`. Chi tiết lỗi cho lỗi cú pháp chỉ có sẵn cho các script cùng origin.
- CSS được áp dụng bằng `<link rel="stylesheet" href="…">`. Do các quy tắc cú pháp lỏng hơn của CSS, CSS xuyên origin cần một tiêu đề `Content-Type` chính xác. Trình duyệt chặn việc tải stylesheet nếu đó là một lượt tải xuyên origin với MIME type không đúng và tài nguyên không bắt đầu bằng một cấu trúc CSS hợp lệ.
- Hình ảnh được hiển thị bởi {{htmlelement("img")}}.
- Media được phát bởi {{htmlelement("video")}} và {{htmlelement("audio")}}.
- Tài nguyên bên ngoài được nhúng bằng {{htmlelement("object")}} và {{htmlelement("embed")}}.
- Phông chữ được áp dụng bằng {{cssxref("@font-face")}}. Một số trình duyệt cho phép phông chữ xuyên origin, số khác yêu cầu cùng origin.
- Bất cứ thứ gì được nhúng bởi {{htmlelement("iframe")}}. Các site có thể dùng tiêu đề {{HTTPHeader("X-Frame-Options")}} để ngăn việc nhúng khung xuyên origin.

### Cách cho phép truy cập xuyên origin

Dùng [CORS](/en-US/docs/Web/HTTP/Guides/CORS) để cho phép truy cập xuyên origin. CORS là một phần của {{Glossary("HTTP")}} cho phép server chỉ định các host khác mà trình duyệt được phép tải nội dung từ đó.

### Cách chặn truy cập xuyên origin

- Để ngăn ghi xuyên origin, hãy kiểm tra một token không thể đoán trước trong yêu cầu - được gọi là token [Cross-Site Request Forgery (CSRF)](https://owasp.org/www-community/attacks/csrf). Bạn phải ngăn đọc xuyên origin đối với các trang yêu cầu token này.
- Để ngăn đọc xuyên origin của một tài nguyên, hãy đảm bảo nó không thể được nhúng. Thường cần ngăn việc nhúng vì việc nhúng một tài nguyên luôn làm rò rỉ một số thông tin về nó.
- Để ngăn nhúng xuyên origin, hãy đảm bảo tài nguyên của bạn không thể bị diễn giải là một trong các định dạng có thể nhúng được liệt kê ở trên. Trình duyệt có thể không tuân thủ tiêu đề `Content-Type`. Ví dụ, nếu bạn trỏ một thẻ `<script>` tới một tài liệu HTML, trình duyệt sẽ cố phân tích HTML như JavaScript. Khi tài nguyên của bạn không phải là một điểm vào site, bạn cũng có thể dùng token CSRF để ngăn việc nhúng.

## Truy cập API script xuyên origin

Các API JavaScript như {{domxref("HTMLIFrameElement.contentWindow", "iframe.contentWindow")}}, {{domxref("window.parent")}}, {{domxref("window.open")}}, và {{domxref("window.opener")}} cho phép các tài liệu tham chiếu trực tiếp đến nhau. Khi hai tài liệu không cùng origin, các tham chiếu này chỉ cung cấp quyền truy cập rất hạn chế vào các đối tượng {{domxref("Window")}} và {{domxref("Location")}}, như mô tả ở hai phần tiếp theo.

Để giao tiếp giữa các tài liệu từ các origin khác nhau, hãy dùng {{domxref("window.postMessage")}}.

Đặc tả: [HTML Living Standard § Cross-origin objects](https://html.spec.whatwg.org/multipage/browsers.html#cross-origin-objects).

### Window

Quyền truy cập xuyên origin sau đây đối với các thuộc tính `Window` này là được phép:

| Phương thức                           |
| ----------------------------------- |
| {{domxref("window.blur")}}        |
| {{domxref("window.close")}}       |
| {{domxref("window.focus")}}       |
| {{domxref("window.postMessage")}} |

| Thuộc tính                     |             |
| ------------------------------ | ----------- |
| {{domxref("window.closed")}}   | Chỉ đọc.  |
| {{domxref("window.frames")}}   | Chỉ đọc.  |
| {{domxref("window.length")}}   | Chỉ đọc.  |
| {{domxref("window.location")}} | Chỉ đọc/ghi. |
| {{domxref("window.opener")}}   | Chỉ đọc.  |
| {{domxref("window.parent")}}   | Chỉ đọc.  |
| {{domxref("window.self")}}     | Chỉ đọc.  |
| {{domxref("window.top")}}      | Chỉ đọc.  |
| {{domxref("window.window")}}   | Chỉ đọc.  |

Một số trình duyệt cho phép truy cập nhiều thuộc tính hơn các thuộc tính trên.

### Location

Quyền truy cập xuyên origin sau đây đối với các thuộc tính `Location` là được phép:

| Phương thức                         |
| ---------------------------------- |
| {{domxref("location.replace")}} |

| Thuộc tính                   |             |
| ---------------------------- | ----------- |
| {{domxref("location.href")}} | Chỉ ghi. |

Một số trình duyệt cho phép truy cập nhiều thuộc tính hơn các thuộc tính trên.

## Truy cập lưu trữ dữ liệu xuyên origin

Quyền truy cập dữ liệu được lưu trong trình duyệt, chẳng hạn như [Web Storage](/en-US/docs/Web/API/Web_Storage_API) và [IndexedDB](/en-US/docs/Web/API/IndexedDB_API), được tách biệt theo origin. Mỗi origin có vùng lưu trữ riêng biệt, và JavaScript ở một origin không thể đọc từ hoặc ghi vào vùng lưu trữ thuộc về origin khác.

{{glossary("Cookie", "Cookie")}} sử dụng một định nghĩa origin riêng. Một trang có thể đặt cookie cho domain của chính nó hoặc bất kỳ domain cha nào, miễn là domain cha đó không phải là một public suffix. Firefox và Chrome dùng [Public Suffix List](https://publicsuffix.org/) để xác định một domain có phải là public suffix hay không. Khi bạn đặt cookie, bạn có thể giới hạn phạm vi khả dụng của nó bằng các cờ `Domain`, `Path`, `Secure`, và `HttpOnly`. Khi bạn đọc cookie, bạn không thể biết nó được đặt từ đâu. Ngay cả khi bạn chỉ dùng các kết nối https an toàn, bất kỳ cookie nào bạn thấy cũng có thể đã được đặt qua một kết nối không an toàn.

## Xem thêm

- [Same Origin Policy tại W3C](https://www.w3.org/Security/wiki/Same_Origin_Policy)
- [Same-origin policy tại web.dev](https://web.dev/articles/same-origin-policy)
- {{httpheader("Cross-Origin-Resource-Policy")}}
- {{httpheader("Cross-Origin-Embedder-Policy")}}
