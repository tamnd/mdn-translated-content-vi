---
title: Storage Access API
slug: Web/API/Storage_Access_API
page-type: web-api-overview
browser-compat:
  - api.Document.hasStorageAccess
  - api.Document.hasUnpartitionedCookieAccess
  - api.Document.requestStorageAccess
  - api.Document.requestStorageAccessFor
  - api.Permissions.permission_storage-access
  - http.headers.Activate-Storage-Access
  - http.headers.Sec-Fetch-Storage-Access
spec-urls:
  - https://privacycg.github.io/storage-access/
  - https://privacycg.github.io/saa-non-cookie-storage/
---

{{DefaultAPISidebar("Storage Access API")}}{{securecontext_header}}

Storage Access API cung cấp một cách để nội dung cross-site được tải trong ngữ cảnh bên thứ ba (tức là được nhúng trong {{htmlelement("iframe")}}) có thể truy cập vào [cookie bên thứ ba](/en-US/docs/Web/Privacy/Guides/Third-party_cookies) và [trạng thái không phân vùng](/en-US/docs/Web/Privacy/Guides/State_Partitioning#state_partitioning) mà thông thường nó chỉ có quyền truy cập trong ngữ cảnh bên đầu tiên (tức là khi được tải trực tiếp trong tab trình duyệt).

Storage Access API phù hợp với các tác nhân người dùng mặc định chặn quyền truy cập vào cookie bên thứ ba và trạng thái không phân vùng để cải thiện quyền riêng tư (ví dụ: để ngăn chặn theo dõi). Vẫn có các mục đích sử dụng hợp lệ cho cookie bên thứ ba và trạng thái không phân vùng mà chúng ta vẫn muốn kích hoạt, ngay cả khi có các hạn chế mặc định này. Ví dụ bao gồm đăng nhập một lần (SSO) với các nhà cung cấp danh tính liên kết (IdP), hoặc lưu trữ thông tin chi tiết người dùng như dữ liệu vị trí hoặc tùy chọn xem trên các trang khác nhau.

API cung cấp các phương thức cho phép các tài nguyên nhúng kiểm tra xem họ hiện có quyền truy cập vào cookie bên thứ ba không và nếu không, để yêu cầu quyền truy cập từ tác nhân người dùng.

## Khái niệm và cách sử dụng

Các trình duyệt triển khai một số tính năng và chính sách truy cập lưu trữ hạn chế quyền truy cập vào cookie bên thứ ba và trạng thái không phân vùng. Chúng dao động từ việc cung cấp cho các tài nguyên nhúng dưới mỗi nguồn gốc cấp cao nhất một không gian lưu trữ cookie duy nhất ([cookie phân vùng](#unpartitioned_versus_partitioned_cookies)) đến việc chặn hoàn toàn quyền truy cập cookie khi tài nguyên được tải trong ngữ cảnh bên thứ ba.

Ngữ nghĩa xung quanh các tính năng và chính sách chặn cookie bên thứ ba và trạng thái không phân vùng khác nhau giữa các trình duyệt, nhưng chức năng cốt lõi là tương tự. Các tài nguyên cross-site được nhúng trong ngữ cảnh bên thứ ba không được cấp quyền truy cập vào cùng trạng thái mà chúng có thể truy cập khi được tải trong ngữ cảnh bên đầu tiên.

Tuy nhiên, có các mục đích sử dụng hợp lệ để nội dung cross-site nhúng truy cập cookie bên thứ ba và trạng thái không phân vùng. Giả sử bạn có một loạt các trang khác nhau cung cấp quyền truy cập vào các sản phẩm khác nhau — `heads-example.com`, `shoulders-example.com`, `knees-example.com` và `toes-example.com`.

Ngoài ra, bạn có thể tách nội dung hoặc dịch vụ của mình thành các tên miền quốc gia khác nhau để bản địa hóa — `example.com`, `example.ua`, `example.br`, v.v. — hoặc theo một cách khác.

Bạn có thể có các trang tiện ích đi kèm với các thành phần được nhúng trong tất cả các trang khác, ví dụ: để cung cấp SSO (`sso-example.com`) hoặc dịch vụ cá nhân hóa chung (`services-example.com`). Các trang tiện ích này sẽ muốn chia sẻ trạng thái với các trang mà chúng được nhúng vào thông qua cookie. Chúng không thể chia sẻ cookie bên đầu tiên vì chúng nằm trên các tên miền khác nhau, và cookie bên thứ ba sẽ không còn hoạt động trong các trình duyệt chặn chúng.

Trong những tình huống như vậy, chủ sở hữu trang thường khuyến khích người dùng thêm trang của họ như một ngoại lệ hoặc tắt hoàn toàn các chính sách chặn cookie bên thứ ba. Những người dùng muốn tiếp tục tương tác với nội dung của họ phải nới lỏng đáng kể chính sách chặn cho các tài nguyên được tải từ tất cả các nguồn gốc nhúng và có thể trên tất cả các trang web.

Storage Access API nhằm giải quyết vấn đề này; nội dung cross-site nhúng có thể yêu cầu quyền truy cập không hạn chế vào cookie bên thứ ba và trạng thái không phân vùng trên cơ sở từng khung thông qua phương thức {{domxref("Document.requestStorageAccess()")}}.
Nó cũng có thể kiểm tra xem nó đã có quyền truy cập chưa thông qua phương thức {{domxref("Document.hasStorageAccess()")}}.

> [!NOTE]
> [Header truy cập lưu trữ](#storage_access_headers) là một phần mở rộng HTTP cho API cho phép quy trình làm việc API lưu trữ hiệu quả hơn, và cũng có thể được dùng để kích hoạt quyền truy cập lưu trữ đã được cấp trước đó cho các tài nguyên thụ động, chẳng hạn như hình ảnh.

### Cookie không phân vùng so với cookie phân vùng

Storage Access API chỉ cần thiết để cung cấp quyền truy cập vào cookie bên thứ ba _không phân vùng_!
Cookie không phân vùng là những cookie nơi tất cả các cookie được đặt trên cùng một trang web được lưu trữ trong cùng một cookie jar — cách truyền thống kể từ những ngày đầu của web.
Vì có rủi ro để lộ dữ liệu dành cho một trang web cho các trang khác, các trình duyệt thường chặn việc gửi cookie bên thứ ba không phân vùng trong các yêu cầu và không cho phép truy cập chúng trong các ngữ cảnh nhúng.

Điều này trái ngược với cookie _phân vùng_, nơi các tài nguyên nhúng dưới mỗi trang cấp cao nhất được cấp một không gian lưu trữ cookie duy nhất, cách ly với các trang khác.
Vì không có rủi ro về quyền riêng tư, vì không thể theo dõi người dùng trên các trang thông qua cookie phân vùng, các trình duyệt gửi cookie phân vùng trong các yêu cầu và cung cấp chúng cho các tài nguyên nhúng.
Tuy nhiên, vì các cookie không được chia sẻ giữa các trang, chúng cũng không tự động đồng bộ hóa trên các trang.

### Cách hoạt động

Nội dung bên thứ ba được nhúng trong {{htmlelement("iframe")}} cần quyền truy cập vào cookie hoặc trạng thái không phân vùng khác có thể yêu cầu quyền truy cập bằng Storage Access API như sau:

1. {{domxref("Document.hasStorageAccess()")}} có thể được gọi để kiểm tra xem nội dung nhúng đã có quyền truy cập vào cookie không phân vùng chưa.
2. Nếu chưa, {{domxref("Document.requestStorageAccess()")}} có thể được gọi với {{Glossary("transient activation")}} để yêu cầu quyền `storage-access`.

   Tùy thuộc vào trình duyệt, người dùng sẽ được hỏi liệu có cấp quyền cho embed yêu cầu theo những cách hơi khác nhau.
   - Safari hiển thị lời nhắc cho tất cả nội dung nhúng chưa từng nhận quyền truy cập lưu trữ.
   - Firefox chỉ nhắc người dùng sau khi một nguồn gốc đã yêu cầu quyền truy cập lưu trữ trên nhiều hơn một số lượng ngưỡng các trang.
   - Chrome hiển thị lời nhắc cho tất cả nội dung nhúng chưa từng nhận quyền truy cập lưu trữ.
     Tuy nhiên, nó sẽ tự động cấp quyền truy cập và bỏ qua lời nhắc nếu nội dung nhúng và trang nhúng thuộc cùng [tập hợp website liên quan](/en-US/docs/Web/API/Storage_Access_API/Related_website_sets).

3. Quyền được cấp hoặc từ chối dựa trên việc nội dung có đáp ứng tất cả các yêu cầu bảo mật không — xem [Lưu ý bảo mật](#security_considerations) để biết các yêu cầu chung, và [Biến thể theo trình duyệt](#browser-specific_variations) để biết một số yêu cầu bảo mật cụ thể theo trình duyệt.
   Bản chất dựa trên {{jsxref("Promise")}} của `requestStorageAccess()` cho phép bạn chạy code để xử lý các trường hợp thành công và thất bại.

   Sau khi quyền được cấp, một khóa quyền được lưu trữ trong trình duyệt với cấu trúc `<top-level site, embedded site>`.
   Ví dụ: nếu trang nhúng là `embedder.com` và embed là `locator.example.com`, khóa sẽ là `<embedder.com, example.com>`.

4. Quyền phải được kích hoạt rõ ràng cho mỗi _ngữ cảnh_.

   Khi embed được cấp quyền, quyền đó cũng được kích hoạt cho ngữ cảnh hiện tại.
   Tuy nhiên, các ngữ cảnh khác, chẳng hạn như tab trình duyệt mới hoặc nội dung trong các phần tử {{htmlelement("iframe")}} khác trong trang, có quyền truy cập cookie bên thứ ba bị chặn theo mặc định.

5. Sau khi embed đã kích hoạt quyền storage-access, nó nên tải lại chính nó.
   Trình duyệt sẽ yêu cầu lại tài nguyên với cookie bên thứ ba được bao gồm, và cung cấp chúng cho tài nguyên nhúng khi nó đã được tải.

### Header truy cập lưu trữ

Header truy cập lưu trữ cho phép quy trình làm việc được cải thiện, nơi máy chủ có thể yêu cầu trình duyệt kích hoạt quyền đã được cấp và thử lại yêu cầu với cookie.

Có hai header:

- Trình duyệt thêm header {{HTTPHeader("Sec-Fetch-Storage-Access")}} vào các yêu cầu để chỉ ra trạng thái truy cập lưu trữ của ngữ cảnh fetch hiện tại.
- Tùy thuộc vào trạng thái truy cập lưu trữ của yêu cầu, máy chủ có thể phản hồi với header {{HTTPHeader("Activate-Storage-Access")}} để yêu cầu trình duyệt kích hoạt quyền cho ngữ cảnh và thử lại yêu cầu với cookie.

## Lưu ý bảo mật

Một số biện pháp bảo mật khác nhau có thể khiến lệnh gọi {{domxref("Document.requestStorageAccess()")}} thất bại.
Kiểm tra danh sách dưới đây nếu bạn gặp khó khăn khi làm cho yêu cầu hoạt động:

1. Yêu cầu quyền phải liên quan đến một cử chỉ người dùng ({{Glossary("transient activation")}}) như nhấn hoặc click.
   Điều này ngăn nội dung nhúng trên trang gửi thư rác đến trình duyệt hoặc người dùng với các yêu cầu truy cập quá mức.
2. Tài liệu và tài liệu cấp cao nhất không được có nguồn gốc `null`.
3. Các nguồn gốc chưa từng được tương tác với tư cách là bên đầu tiên không có khái niệm về lưu trữ bên đầu tiên. Từ góc nhìn của người dùng, chúng chỉ có mối quan hệ bên thứ ba với nguồn gốc đó. Các yêu cầu truy cập tự động bị từ chối nếu trình duyệt phát hiện người dùng chưa tương tác với nội dung nhúng trong ngữ cảnh bên đầu tiên gần đây.
4. Cửa sổ của tài liệu phải là [ngữ cảnh bảo mật](/en-US/docs/Web/Security/Defenses/Secure_Contexts).
5. Các {{htmlelement("iframe")}} được sandbox không thể được cấp quyền truy cập lưu trữ theo mặc định vì lý do bảo mật.
   Để xử lý điều này, API cung cấp [sandbox token](/en-US/docs/Web/HTML/Reference/Elements/iframe#sandbox) [`allow-storage-access-by-user-activation`](/en-US/docs/Web/HTML/Reference/Elements/iframe#allow-storage-access-by-user-activation).
   `<iframe>` cần bao gồm điều này để kích hoạt các yêu cầu truy cập lưu trữ, cùng với `allow-scripts` và `allow-same-origin` để cho phép nó thực thi script để gọi API và thực thi nó trong nguồn gốc có thể có cookie/trạng thái:

   ```html
   <iframe
     sandbox="allow-storage-access-by-user-activation
                   allow-scripts
                   allow-same-origin">
     …
   </iframe>
   ```

6. Việc sử dụng tính năng này có thể bị chặn bởi {{httpheader("Permissions-Policy/storage-access", "storage-access")}} [Permissions Policy](/en-US/docs/Web/HTTP/Guides/Permissions_Policy) được đặt trên máy chủ của bạn.

## Biến thể theo trình duyệt

Mặc dù bề mặt API là giống nhau, các trang web sử dụng Storage Access API nên kỳ vọng sự khác biệt về mức độ và phạm vi truy cập cookie bên thứ ba mà chúng nhận được giữa các trình duyệt khác nhau, do sự khác biệt trong chính sách truy cập lưu trữ của chúng.

### Chrome

- Cookie phải có [`SameSite=None`](/en-US/docs/Web/HTTP/Reference/Headers/Set-Cookie#samesitesamesite-value) được đặt rõ ràng trên đó, vì giá trị mặc định cho Chrome là `SameSite=Lax` (`SameSite=None` là mặc định trong Firefox và Safari).
- Cookie phải có thuộc tính [`Secure`](/en-US/docs/Web/HTTP/Reference/Headers/Set-Cookie#secure) được đặt trên đó.
- Các cấp phép truy cập lưu trữ được giai đoạn loại bỏ sau 30 ngày sử dụng trình duyệt mà không có tương tác của người dùng. Tương tác với nội dung nhúng mở rộng giới hạn này thêm 30 ngày.

### Firefox

- Nếu nguồn gốc nhúng `tracker.example` đã có quyền truy cập cookie bên thứ ba trên nguồn gốc cấp cao nhất `foo.example`, và người dùng truy cập trang từ `foo.example` nhúng trang từ `tracker.example` lại trong vòng chưa đến 30 ngày, nguồn gốc nhúng sẽ có quyền truy cập cookie bên thứ ba ngay lập tức khi tải.
- Các cấp phép truy cập lưu trữ được giai đoạn loại bỏ sau 30 ngày lịch đã qua.

### Safari

- Các cấp phép truy cập lưu trữ được giai đoạn loại bỏ sau 30 ngày sử dụng trình duyệt mà không có tương tác của người dùng. Việc sử dụng thành công Storage Access API đặt lại bộ đếm này.

## Ví dụ

- Xem [Sử dụng Storage Access API](/en-US/docs/Web/API/Storage_Access_API/Using) để biết hướng dẫn triển khai với các ví dụ code.

## Phương thức API

- {{domxref("Document.hasStorageAccess()")}}
  - : Trả về {{jsxref("Promise")}} phân giải với giá trị boolean cho biết tài liệu có quyền truy cập vào cookie bên thứ ba không.
- {{domxref("Document.hasUnpartitionedCookieAccess()")}}
  - : Tên mới cho {{domxref("Document.hasStorageAccess()")}}.
- {{domxref("Document.requestStorageAccess()")}}
  - : Cho phép nội dung được tải trong ngữ cảnh bên thứ ba (tức là được nhúng trong {{htmlelement("iframe")}}) yêu cầu quyền truy cập vào cookie bên thứ ba và trạng thái không phân vùng; trả về {{jsxref("Promise")}} phân giải nếu quyền truy cập được cấp, và từ chối nếu quyền truy cập bị từ chối.
- {{domxref("Document.requestStorageAccessFor()")}} {{experimental_inline}}
  - : Một phần mở rộng đề xuất cho Storage Access API cho phép các trang cấp cao nhất yêu cầu quyền truy cập cookie bên thứ ba thay mặt cho nội dung nhúng có nguồn gốc từ trang khác trong cùng [tập hợp website liên quan](/en-US/docs/Web/API/Storage_Access_API/Related_website_sets). Trả về {{jsxref("Promise")}} phân giải nếu quyền truy cập được cấp, và từ chối nếu quyền truy cập bị từ chối.

### Bổ sung cho các API khác

- {{domxref("Permissions.query()")}}, tên tính năng `"storage-access"`
  - : Trong các trình duyệt hỗ trợ, có thể truy vấn xem quyền truy cập cookie bên thứ ba đã được cấp nói chung hay chưa, tức là cho một embed cùng trang web khác. Nếu vậy, bạn có thể gọi `requestStorageAccess()` mà không cần tương tác người dùng, và promise sẽ tự động phân giải.
- `Permissions.query()`, tên tính năng `"top-level-storage-access"` {{experimental_inline}}
  - : Tên tính năng riêng biệt được dùng để truy vấn xem quyền truy cập cookie bên thứ ba đã được cấp thông qua `requestStorageAccessFor()` chưa.

### Bổ sung cho HTTP

#### Permissions-Policy

- {{httpheader("Permissions-Policy/storage-access","Permissions-Policy: storage-access")}}
  - : Chỉ thị `storage-access` {{HTTPHeader("Permissions-Policy")}} kiểm soát xem tài liệu được tải trong ngữ cảnh bên thứ ba (tức là được nhúng trong {{htmlelement("iframe")}}) có được phép sử dụng Storage Access API để yêu cầu quyền truy cập vào cookie không phân vùng không.

#### Header truy cập lưu trữ

- {{HTTPHeader("Sec-Fetch-Storage-Access")}}
  - : Cho biết "trạng thái truy cập lưu trữ" cho ngữ cảnh yêu cầu hiện tại, sẽ là một trong `none`, `inactive`, hoặc `active`.
- {{HTTPHeader("Activate-Storage-Access")}}
  - : Được dùng để phản hồi `Sec-Fetch-Storage-Access` để chỉ ra rằng trình duyệt có thể kích hoạt quyền hiện có cho quyền truy cập bảo mật và thử lại yêu cầu với cookie, hoặc tải tài nguyên với quyền truy cập cookie nếu nó đã có quyền được kích hoạt.

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Sử dụng Storage Access API](/en-US/docs/Web/API/Storage_Access_API/Using)
- [Giới thiệu Storage Access API](https://webkit.org/blog/8124/introducing-storage-access-api/) (WebKit blog)
