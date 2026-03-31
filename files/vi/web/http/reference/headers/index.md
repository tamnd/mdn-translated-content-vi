---
title: HTTP headers
short-title: Headers
slug: Web/HTTP/Reference/Headers
page-type: landing-page
sidebar: http
---

**Các tiêu đề HTTP** cho phép máy khách và máy chủ truyền thêm thông tin cùng với một thông điệp trong yêu cầu hoặc phản hồi.
Trong HTTP/1.X, tiêu đề là một tên không phân biệt chữ hoa/thường theo sau là dấu hai chấm, rồi đến khoảng trắng tùy chọn sẽ bị bỏ qua, và cuối cùng là giá trị của nó (ví dụ: `Allow: POST`).
Trong HTTP/2 trở lên, các tiêu đề hiển thị bằng chữ thường khi xem trong công cụ dành cho nhà phát triển (`accept: */*`), và được thêm tiền tố bằng dấu hai chấm cho nhóm đặc biệt [pseudo-headers](/en-US/docs/Web/HTTP/Guides/Messages#pseudo-headers) (`:status: 200`).
Bạn có thể tìm thêm thông tin về cú pháp trong từng phiên bản giao thức trên trang [HTTP messages](/en-US/docs/Web/HTTP/Guides/Messages).

Các tiêu đề tùy chỉnh độc quyền trong lịch sử đã được sử dụng với tiền tố `X-`, nhưng quy ước này đã bị khai thác vào năm 2012 do những bất tiện nó gây ra khi các trường phi tiêu chuẩn trở thành tiêu chuẩn trong [RFC 6648](https://datatracker.ietf.org/doc/html/rfc6648); các tiêu đề khác được liệt kê trong [IANA HTTP Field Name Registry](https://www.iana.org/assignments/http-fields/http-fields.xhtml), nội dung gốc được định nghĩa trong [RFC 4229](https://datatracker.ietf.org/doc/html/rfc4229).
Sổ đăng ký IANA liệt kê các tiêu đề, bao gồm [thông tin về trạng thái của chúng](https://github.com/protocol-registries/http-fields?tab=readme-ov-file#choosing-the-right-status).

Các tiêu đề có thể được nhóm theo ngữ cảnh của chúng:

- {{Glossary("Request header", "Tiêu đề yêu cầu")}}
  - : Chứa thêm thông tin về tài nguyên cần lấy, hoặc về máy khách đang yêu cầu tài nguyên.
- {{Glossary("Response header", "Tiêu đề phản hồi")}}
  - : Chứa thêm thông tin về phản hồi, như vị trí của nó hoặc về máy chủ cung cấp phản hồi.
- {{Glossary("Representation header", "Tiêu đề biểu diễn")}}
  - : Chứa thông tin về nội dung của tài nguyên, như [kiểu MIME](/en-US/docs/Web/HTTP/Guides/MIME_types) hoặc mã hóa/nén được áp dụng.
- {{Glossary("Payload header","Tiêu đề tải trọng")}}
  - : Chứa thông tin độc lập với biểu diễn về dữ liệu tải trọng, bao gồm độ dài nội dung và mã hóa được sử dụng cho quá trình truyền tải.

Các tiêu đề cũng có thể được nhóm theo cách {{Glossary("Proxy_server", "proxy")}} xử lý chúng:

- Tiêu đề đầu cuối (End-to-end headers)
  - : Những tiêu đề này _phải_ được truyền đến người nhận cuối cùng của thông điệp: máy chủ cho yêu cầu, hoặc máy khách cho phản hồi. Các proxy trung gian phải truyền lại những tiêu đề này không thay đổi và bộ nhớ đệm phải lưu trữ chúng.
- Tiêu đề từng chặng (Hop-by-hop headers)
  - : Những tiêu đề này chỉ có nghĩa trong một kết nối truyền tải đơn lẻ, và _không được_ truyền lại bởi proxy hoặc lưu vào bộ nhớ đệm. Lưu ý rằng chỉ các tiêu đề từng chặng mới có thể được đặt bằng tiêu đề {{HTTPHeader("Connection")}}.

## Xác thực

- {{HTTPHeader("WWW-Authenticate")}}
  - : Xác định phương thức xác thực nên được sử dụng để truy cập tài nguyên.
- {{HTTPHeader("Authorization")}}
  - : Chứa thông tin xác thực để xác minh tác nhân người dùng với máy chủ.
- {{HTTPHeader("Proxy-Authenticate")}}
  - : Xác định phương thức xác thực nên được sử dụng để truy cập tài nguyên phía sau một máy chủ proxy.
- {{HTTPHeader("Proxy-Authorization")}}
  - : Chứa thông tin xác thực để xác minh tác nhân người dùng với máy chủ proxy.

## Bộ nhớ đệm (Caching)

- {{HTTPHeader("Age")}}
  - : Thời gian tính bằng giây mà đối tượng đã nằm trong bộ nhớ đệm proxy.
- {{HTTPHeader("Cache-Control")}}
  - : Các chỉ thị cho cơ chế lưu bộ nhớ đệm trong cả yêu cầu và phản hồi.
- {{HTTPHeader("Clear-Site-Data")}}
  - : Xóa dữ liệu trình duyệt (ví dụ: cookie, storage, cache) liên quan đến trang web đang yêu cầu.
- {{HTTPHeader("Expires")}}
  - : Ngày/giờ sau đó phản hồi được coi là cũ (stale).
- {{HTTPHeader("No-Vary-Search")}} {{experimental_inline}}
  - : Chỉ định một tập hợp các quy tắc xác định cách các tham số truy vấn URL sẽ ảnh hưởng đến việc khớp bộ nhớ đệm. Các quy tắc này quy định liệu cùng một URL với các tham số URL khác nhau có nên được lưu dưới dạng các mục bộ nhớ đệm trình duyệt riêng biệt hay không.

## Điều kiện (Conditionals)

- {{HTTPHeader("Last-Modified")}}
  - : Ngày sửa đổi lần cuối của tài nguyên, được sử dụng để so sánh nhiều phiên bản của cùng một tài nguyên. Nó kém chính xác hơn {{HTTPHeader("ETag")}}, nhưng dễ tính toán hơn trong một số môi trường. Các yêu cầu có điều kiện sử dụng {{HTTPHeader("If-Modified-Since")}} và {{HTTPHeader("If-Unmodified-Since")}} dùng giá trị này để thay đổi hành vi của yêu cầu.
- {{HTTPHeader("ETag")}}
  - : Một chuỗi duy nhất xác định phiên bản của tài nguyên. Các yêu cầu có điều kiện sử dụng {{HTTPHeader("If-Match")}} và {{HTTPHeader("If-None-Match")}} dùng giá trị này để thay đổi hành vi của yêu cầu.
- {{HTTPHeader("If-Match")}}
  - : Làm cho yêu cầu có điều kiện, và chỉ áp dụng phương thức nếu tài nguyên được lưu khớp với một trong các ETag đã cho.
- {{HTTPHeader("If-None-Match")}}
  - : Làm cho yêu cầu có điều kiện, và chỉ áp dụng phương thức nếu tài nguyên được lưu _không_ khớp với bất kỳ ETag nào đã cho. Điều này được sử dụng để cập nhật bộ nhớ đệm (cho yêu cầu an toàn), hoặc để ngăn tải lên tài nguyên mới khi tài nguyên đó đã tồn tại.
- {{HTTPHeader("If-Modified-Since")}}
  - : Làm cho yêu cầu có điều kiện, và kỳ vọng tài nguyên chỉ được truyền nếu nó đã được sửa đổi sau ngày đã cho. Điều này được sử dụng để chỉ truyền dữ liệu khi bộ nhớ đệm đã lỗi thời.
- {{HTTPHeader("If-Unmodified-Since")}}
  - : Làm cho yêu cầu có điều kiện, và kỳ vọng tài nguyên chỉ được truyền nếu nó không được sửa đổi sau ngày đã cho. Điều này đảm bảo tính nhất quán của một đoạn mới trong một phạm vi cụ thể với các đoạn trước, hoặc để triển khai hệ thống kiểm soát đồng thời lạc quan khi sửa đổi tài liệu hiện có.
- {{HTTPHeader("Vary")}}
  - : Xác định cách khớp các tiêu đề yêu cầu để quyết định liệu có thể sử dụng phản hồi đã lưu trong bộ nhớ đệm thay vì yêu cầu một phản hồi mới từ máy chủ gốc hay không.

## Quản lý kết nối

- {{HTTPHeader("Connection")}}
  - : Kiểm soát xem kết nối mạng có tiếp tục mở sau khi giao dịch hiện tại kết thúc không.
- {{HTTPHeader("Keep-Alive")}}
  - : Kiểm soát thời gian một kết nối liên tục nên duy trì mở.

## Thương lượng nội dung (Content negotiation)

Để biết thêm chi tiết, hãy xem [bài viết về thương lượng nội dung](/en-US/docs/Web/HTTP/Guides/Content_negotiation).

- {{HTTPHeader("Accept")}}
  - : Thông báo cho máy chủ về {{Glossary("MIME_type", "các kiểu")}} dữ liệu có thể được gửi lại.
- {{HTTPHeader("Accept-Encoding")}}
  - : Thuật toán mã hóa, thường là [thuật toán nén](/en-US/docs/Web/HTTP/Guides/Compression), có thể được sử dụng trên tài nguyên được gửi lại.
- {{HTTPHeader("Accept-Language")}}
  - : Thông báo cho máy chủ về ngôn ngữ tự nhiên mà máy chủ được kỳ vọng gửi lại. Đây là gợi ý và không nhất thiết phải hoàn toàn dưới sự kiểm soát của người dùng: máy chủ luôn phải chú ý không ghi đè lên lựa chọn ngôn ngữ rõ ràng của người dùng (chẳng hạn như chọn ngôn ngữ từ menu thả xuống).
- {{HTTPHeader("Accept-Patch")}}
  - : Tiêu đề phản hồi _thương lượng nội dung yêu cầu_ quảng cáo [kiểu phương tiện](/en-US/docs/Web/HTTP/Guides/MIME_types) mà máy chủ có thể hiểu trong yêu cầu {{HTTPMethod("PATCH")}}.
- {{HTTPHeader("Accept-Post")}}
  - : Tiêu đề phản hồi _thương lượng nội dung yêu cầu_ quảng cáo [kiểu phương tiện](/en-US/docs/Web/HTTP/Guides/MIME_types) mà máy chủ có thể hiểu trong yêu cầu {{HTTPMethod("POST")}}.

## Điều khiển

- {{HTTPHeader("Expect")}}
  - : Chỉ ra các kỳ vọng cần được máy chủ đáp ứng để xử lý yêu cầu đúng cách.
- {{HTTPHeader("Max-Forwards")}}
  - : Khi sử dụng [`TRACE`](/en-US/docs/Web/HTTP/Reference/Methods/TRACE), chỉ ra số lần chuyển tiếp tối đa mà yêu cầu có thể thực hiện trước khi được phản ánh lại cho người gửi.

## Cookie

- {{HTTPHeader("Cookie")}}
  - : Chứa [các cookie HTTP](/en-US/docs/Web/HTTP/Guides/Cookies) đã được lưu trữ trước đó do máy chủ gửi với tiêu đề {{HTTPHeader("Set-Cookie")}}.
- {{HTTPHeader("Set-Cookie")}}
  - : Gửi cookie từ máy chủ đến tác nhân người dùng.

## CORS

Để biết thêm thông tin, hãy xem [tài liệu CORS](/en-US/docs/Web/HTTP/Guides/CORS).

- {{HTTPHeader("Access-Control-Allow-Credentials")}}
  - : Chỉ ra liệu phản hồi đối với yêu cầu có thể được hiển thị khi cờ thông tin xác thực là true hay không.
- {{HTTPHeader("Access-Control-Allow-Headers")}}
  - : Được sử dụng trong phản hồi cho {{Glossary("Preflight_request", "yêu cầu preflight")}} để chỉ ra các tiêu đề HTTP nào có thể được sử dụng khi thực hiện yêu cầu thực tế.
- {{HTTPHeader("Access-Control-Allow-Methods")}}
  - : Chỉ định các phương thức được phép khi truy cập tài nguyên trong phản hồi cho yêu cầu preflight.
- {{HTTPHeader("Access-Control-Allow-Origin")}}
  - : Chỉ ra liệu phản hồi có thể được chia sẻ hay không.
- {{HTTPHeader("Access-Control-Expose-Headers")}}
  - : Chỉ ra những tiêu đề nào có thể được hiển thị như một phần của phản hồi bằng cách liệt kê tên của chúng.
- {{HTTPHeader("Access-Control-Max-Age")}}
  - : Chỉ ra thời gian bao lâu kết quả của yêu cầu preflight có thể được lưu vào bộ nhớ đệm.
- {{HTTPHeader("Access-Control-Request-Headers")}}
  - : Được sử dụng khi phát ra yêu cầu preflight để cho máy chủ biết những tiêu đề HTTP nào sẽ được sử dụng khi thực hiện yêu cầu thực tế.
- {{HTTPHeader("Access-Control-Request-Method")}}
  - : Được sử dụng khi phát ra yêu cầu preflight để cho máy chủ biết [phương thức HTTP](/en-US/docs/Web/HTTP/Reference/Methods) nào sẽ được sử dụng khi thực hiện yêu cầu thực tế.
- {{HTTPHeader("Origin")}}
  - : Chỉ ra nguồn gốc của một yêu cầu fetch.
- {{HTTPHeader("Timing-Allow-Origin")}}
  - : Chỉ định các nguồn gốc được phép xem giá trị của các thuộc tính được lấy qua các tính năng của [Resource Timing API](/en-US/docs/Web/API/Performance_API/Resource_timing), mà nếu không sẽ được báo cáo là bằng không do các hạn chế cross-origin.

## Tải xuống

- {{HTTPHeader("Content-Disposition")}}
  - : Chỉ ra liệu tài nguyên được truyền có nên hiển thị trực tiếp (hành vi mặc định không có tiêu đề), hay nên được xử lý như tải xuống và trình duyệt nên hiển thị hộp thoại "Lưu thành".

## Thông báo xác thực toàn vẹn (Integrity digests)

- {{HTTPHeader("Content-Digest")}} {{experimental_inline}}
  - : Cung cấp {{Glossary("hash function", "thông báo xác thực")}} của luồng byte trong thông điệp HTTP (nội dung thông điệp) phụ thuộc vào {{HTTPHeader("Content-Encoding")}} và {{HTTPHeader("Content-Range")}}.
- {{HTTPHeader("Repr-Digest")}} {{experimental_inline}}
  - : Cung cấp {{Glossary("hash function", "thông báo xác thực")}} của biểu diễn đã chọn của tài nguyên đích trước khi truyền tải. Không giống như {{HTTPHeader("Content-Digest")}}, thông báo này không xem xét {{HTTPHeader("Content-Encoding")}} hay {{HTTPHeader("Content-Range")}}.
- {{HTTPHeader("Want-Content-Digest")}} {{experimental_inline}}
  - : Thể hiện mong muốn có tiêu đề {{HTTPHeader("Content-Digest")}}. Đây là phần tương tự `Content-` của {{HTTPHeader("Want-Repr-Digest")}}.
- {{HTTPHeader("Want-Repr-Digest")}} {{experimental_inline}}
  - : Thể hiện mong muốn có tiêu đề {{HTTPHeader("Repr-Digest")}}. Đây là phần tương tự `Repr-` của {{HTTPHeader("Want-Content-Digest")}}.

## Chính sách toàn vẹn

- {{HTTPHeader("Integrity-Policy")}}
  - : Đảm bảo rằng tất cả tài nguyên mà tác nhân người dùng tải (thuộc loại nhất định) đều có các đảm bảo [Subresource Integrity](/en-US/docs/Web/Security/Defenses/Subresource_Integrity).
- {{HTTPHeader("Integrity-Policy-Report-Only")}}
  - : Báo cáo về các tài nguyên mà tác nhân người dùng tải sẽ vi phạm các đảm bảo [Subresource Integrity](/en-US/docs/Web/Security/Defenses/Subresource_Integrity) nếu chính sách toàn vẹn được thực thi (sử dụng tiêu đề `Integrity-Policy`).

## Thông tin thân thông điệp

- {{HTTPHeader("Content-Length")}}
  - : Kích thước của tài nguyên, tính bằng số byte thập phân.
- {{HTTPHeader("Content-Type")}}
  - : Chỉ ra kiểu phương tiện của tài nguyên.
- {{HTTPHeader("Content-Encoding")}}
  - : Được sử dụng để chỉ định thuật toán nén.
- {{HTTPHeader("Content-Language")}}
  - : Mô tả (các) ngôn ngữ tự nhiên dành cho đối tượng, để người dùng có thể phân biệt theo ngôn ngữ ưa thích của họ.
- {{HTTPHeader("Content-Location")}}
  - : Chỉ ra vị trí thay thế cho dữ liệu được trả về.

## Tùy chọn (Preferences)

Các tùy chọn có thể được gửi bởi máy khách trong các yêu cầu để chỉ ra các hành vi tùy chọn cho yêu cầu và phản hồi. Phản hồi của máy chủ có thể chỉ ra nếu tùy chọn được áp dụng, trong trường hợp mà nếu không sẽ gây nhầm lẫn cho máy khách. Các trình duyệt không có xử lý gốc để gửi tùy chọn qua các tiêu đề này; chúng được sử dụng trong các máy khách tùy chỉnh, đặc thù theo triển khai.

- {{HTTPHeader("Prefer")}}
  - : Chỉ ra các tùy chọn cho các hành vi máy chủ cụ thể trong quá trình xử lý yêu cầu. Ví dụ, nó có thể yêu cầu nội dung phản hồi tối thiểu (`return=minimal`) hoặc xử lý bất đồng bộ (`respond-async`). Máy chủ xử lý yêu cầu bình thường nếu tiêu đề không được hỗ trợ.
- {{HTTPHeader("Preference-Applied")}}
  - : Thông báo cho máy khách biết những tùy chọn nào được chỉ định trong tiêu đề `Prefer` đã được máy chủ áp dụng. Đây là tiêu đề chỉ phản hồi cung cấp tính minh bạch về việc xử lý tùy chọn.

## Proxy

- {{HTTPHeader("Forwarded")}}
  - : Chứa thông tin từ phía máy khách của các máy chủ proxy bị thay đổi hoặc mất khi proxy tham gia vào đường dẫn của yêu cầu.
- {{HTTPHeader("Via")}}
  - : Được thêm bởi các proxy, cả proxy chuyển tiếp và proxy đảo ngược, và có thể xuất hiện trong các tiêu đề yêu cầu và phản hồi.

## Yêu cầu phạm vi (Range requests)

[Các yêu cầu phạm vi](/en-US/docs/Web/HTTP/Guides/Range_requests) HTTP cho phép máy khách yêu cầu một phần tài nguyên từ máy chủ. Các yêu cầu phạm vi hữu ích cho các ứng dụng như trình phát phương tiện hỗ trợ truy cập ngẫu nhiên, các công cụ dữ liệu biết rằng chúng chỉ cần một phần của tệp lớn, và các trình quản lý tải xuống cho phép người dùng tạm dừng và tiếp tục tải xuống.

- {{HTTPHeader("Accept-Ranges")}}
  - : Chỉ ra liệu máy chủ có hỗ trợ yêu cầu phạm vi không, và nếu có thì phạm vi có thể được diễn đạt bằng đơn vị nào.
- {{HTTPHeader("Range")}}
  - : Chỉ ra phần của tài liệu mà máy chủ nên trả về.
- {{HTTPHeader("If-Range")}}
  - : Tạo một yêu cầu phạm vi có điều kiện chỉ được thực hiện nếu etag hoặc ngày đã cho khớp với tài nguyên từ xa. Được sử dụng để ngăn tải xuống hai phạm vi từ phiên bản không tương thích của tài nguyên.
- {{HTTPHeader("Content-Range")}}
  - : Chỉ ra vị trí trong thân thông điệp đầy đủ mà thông điệp một phần thuộc về.

## Chuyển hướng

- {{HTTPHeader("Location")}}
  - : Chỉ ra URL để chuyển hướng trang.
- {{HTTPHeader("Refresh")}}
  - : Hướng dẫn trình duyệt tải lại trang hoặc chuyển hướng sang trang khác. Lấy cùng giá trị với phần tử `meta` có [`http-equiv="refresh"`](/en-US/docs/Web/HTML/Reference/Elements/meta/http-equiv).

## Ngữ cảnh yêu cầu

- {{HTTPHeader("From")}}
  - : Chứa địa chỉ email Internet cho người dùng con người điều khiển tác nhân người dùng đang yêu cầu.
- {{HTTPHeader("Host")}}
  - : Chỉ định tên miền của máy chủ (cho lưu trữ ảo), và (tùy chọn) số cổng TCP mà máy chủ đang lắng nghe.
- {{HTTPHeader("Referer")}}
  - : Địa chỉ của trang web trước đó mà một liên kết đến trang hiện đang yêu cầu được theo dõi.
- {{HTTPHeader("Referrer-Policy")}}
  - : Điều chỉnh thông tin referrer được gửi trong tiêu đề {{HTTPHeader("Referer")}} nên được bao gồm với các yêu cầu được thực hiện.
- {{HTTPHeader("User-Agent")}}
  - : Chứa một chuỗi đặc trưng cho phép các peer giao thức mạng xác định loại ứng dụng, hệ điều hành, nhà cung cấp phần mềm hoặc phiên bản phần mềm của tác nhân người dùng phần mềm đang yêu cầu.

## Ngữ cảnh phản hồi

- {{HTTPHeader("Allow")}}
  - : Liệt kê tập hợp các phương thức yêu cầu HTTP được hỗ trợ bởi một tài nguyên.
- {{HTTPHeader("Server")}}
  - : Chứa thông tin về phần mềm được sử dụng bởi máy chủ gốc để xử lý yêu cầu.

## Bảo mật

- {{HTTPHeader("Cross-Origin-Embedder-Policy")}} (COEP)
  - : Cho phép máy chủ khai báo chính sách nhúng cho một tài liệu cụ thể.
- {{HTTPHeader("Cross-Origin-Opener-Policy")}} (COOP)
  - : Ngăn các tên miền khác mở/kiểm soát một cửa sổ.
- {{HTTPHeader("Cross-Origin-Resource-Policy")}} (CORP)
  - : Ngăn các tên miền khác đọc phản hồi của các tài nguyên mà tiêu đề này được áp dụng. Xem thêm [bài giải thích CORP](/en-US/docs/Web/HTTP/Guides/Cross-Origin_Resource_Policy).
- {{HTTPHeader("Content-Security-Policy")}} ({{Glossary("CSP")}})
  - : Kiểm soát tài nguyên mà tác nhân người dùng được phép tải cho một trang nhất định.
- {{HTTPHeader("Content-Security-Policy-Report-Only")}}
  - : Cho phép nhà phát triển web thử nghiệm chính sách bằng cách giám sát, nhưng không thực thi, các hiệu ứng của chúng. Các báo cáo vi phạm bao gồm các tài liệu {{Glossary("JSON")}} được gửi qua yêu cầu HTTP `POST` đến URI được chỉ định.
- {{HTTPHeader("Expect-CT")}} {{deprecated_inline}}
  - : Cho phép các trang web chọn tham gia báo cáo và thực thi [Certificate Transparency](/en-US/docs/Web/Security/Defenses/Certificate_Transparency) để phát hiện việc sử dụng các chứng chỉ bị cấp sai cho trang web đó.
- {{HTTPHeader("Permissions-Policy")}}
  - : Cung cấp cơ chế để cho phép và từ chối việc sử dụng các tính năng trình duyệt trong khung của trang web, và trong các {{htmlelement("iframe")}} mà nó nhúng.
- {{HTTPHeader("Reporting-Endpoints")}} {{experimental_inline}}
  - : Tiêu đề phản hồi cho phép chủ sở hữu trang web chỉ định một hoặc nhiều điểm cuối được sử dụng để nhận lỗi như báo cáo vi phạm CSP, báo cáo {{HTTPHeader("Cross-Origin-Opener-Policy")}}, hoặc các vi phạm chung khác.
- {{HTTPHeader("Strict-Transport-Security")}} ({{Glossary("HSTS")}})
  - : Bắt buộc giao tiếp bằng HTTPS thay vì HTTP.
- {{HTTPHeader("Upgrade-Insecure-Requests")}}
  - : Gửi tín hiệu cho máy chủ biểu thị sở thích của máy khách đối với phản hồi được mã hóa và xác thực, và rằng nó có thể xử lý thành công chỉ thị {{CSP("upgrade-insecure-requests")}}.
- {{HTTPHeader("X-Content-Type-Options")}}
  - : Vô hiệu hóa MIME sniffing và buộc trình duyệt sử dụng kiểu được cung cấp trong {{HTTPHeader("Content-Type")}}.
- {{HTTPHeader("X-Frame-Options")}} (XFO)
  - : Chỉ ra liệu trình duyệt có được phép hiển thị trang trong {{HTMLElement("frame")}}, {{HTMLElement("iframe")}}, {{HTMLElement("embed")}} hay {{HTMLElement("object")}} không.
- {{HTTPHeader("X-Permitted-Cross-Domain-Policies")}}
  - : Một tệp chính sách cross-domain có thể cấp quyền cho các máy khách, như Adobe Acrobat hoặc Apache Flex (trong số các máy khách khác), để xử lý dữ liệu qua các tên miền mà nếu không sẽ bị hạn chế do [Chính sách cùng nguồn gốc](/en-US/docs/Web/Security/Defenses/Same-origin_policy). Tiêu đề `X-Permitted-Cross-Domain-Policies` ghi đè các tệp chính sách đó để các máy khách vẫn chặn các yêu cầu không mong muốn.
- {{HTTPHeader("X-Powered-By")}}
  - : Có thể được đặt bởi các môi trường lưu trữ hoặc các framework khác và chứa thông tin về chúng trong khi không cung cấp bất kỳ tính hữu dụng nào cho ứng dụng hoặc khách truy cập. Hãy bỏ đặt tiêu đề này để tránh hiển thị các lỗ hổng tiềm năng.
- {{HTTPHeader("X-XSS-Protection")}}
  - : Kích hoạt bộ lọc cross-site scripting.

### Tiêu đề yêu cầu Fetch metadata

{{Glossary("Fetch metadata request header", "Tiêu đề yêu cầu Fetch metadata")}} cung cấp thông tin về ngữ cảnh mà từ đó yêu cầu bắt nguồn. Máy chủ có thể sử dụng chúng để đưa ra quyết định liệu yêu cầu có nên được cho phép hay không, dựa trên nơi yêu cầu đến và cách tài nguyên sẽ được sử dụng.

- {{HTTPHeader("Sec-Fetch-Site")}}
  - : Chỉ ra mối quan hệ giữa nguồn gốc của người khởi tạo yêu cầu và nguồn gốc đích. Đây là Tiêu đề có cấu trúc có giá trị là token với các giá trị có thể là `cross-site`, `same-origin`, `same-site`, và `none`.
- {{HTTPHeader("Sec-Fetch-Mode")}}
  - : Chỉ ra chế độ yêu cầu cho máy chủ. Đây là Tiêu đề có cấu trúc có giá trị là token với các giá trị có thể là `cors`, `navigate`, `no-cors`, `same-origin`, và `websocket`.
- {{HTTPHeader("Sec-Fetch-User")}}
  - : Chỉ ra liệu yêu cầu điều hướng có được kích hoạt bởi kích hoạt người dùng hay không. Đây là Tiêu đề có cấu trúc có giá trị là boolean nên các giá trị có thể là `?0` cho false và `?1` cho true.
- {{HTTPHeader("Sec-Fetch-Dest")}}
  - : Chỉ ra đích đến của yêu cầu. Đây là Tiêu đề có cấu trúc có giá trị là token với các giá trị có thể là `audio`, `audioworklet`, `document`, `embed`, `empty`, `font`, `image`, `manifest`, `object`, `paintworklet`, `report`, `script`, `serviceworker`, `sharedworker`, `style`, `track`, `video`, `worker`, và `xslt`.

Các tiêu đề yêu cầu sau đây không hoàn toàn là "tiêu đề yêu cầu fetch metadata", nhưng cũng cung cấp thông tin về ngữ cảnh về cách tài nguyên sẽ được sử dụng. Máy chủ có thể sử dụng chúng để sửa đổi hành vi lưu bộ nhớ đệm hoặc thông tin được trả về:

- {{HTTPHeader("Sec-Purpose")}}
  - : Chỉ ra mục đích của yêu cầu, khi mục đích đó là thứ gì đó khác với việc sử dụng ngay lập tức bởi tác nhân người dùng. Tiêu đề hiện có một giá trị khả dĩ, `prefetch`, chỉ ra rằng tài nguyên đang được tải trước cho một điều hướng tương lai có thể xảy ra.
- {{HTTPHeader("Service-Worker-Navigation-Preload")}}
  - : Tiêu đề yêu cầu được gửi trong yêu cầu phòng ngừa để {{domxref("Window/fetch", "fetch()")}} một tài nguyên trong quá trình khởi động service worker. Giá trị, được đặt với {{domxref("NavigationPreloadManager.setHeaderValue()")}}, có thể được sử dụng để thông báo cho máy chủ rằng một tài nguyên khác nên được trả về so với trong thao tác `fetch()` bình thường.

## Tiêu đề truy cập storage Fetch

Những tiêu đề này cho phép một quy trình làm việc được nâng cao cho [Storage Access API](/en-US/docs/Web/API/Storage_Access_API).

- {{HTTPHeader("Sec-Fetch-Storage-Access")}}
  - : Chỉ ra "trạng thái truy cập storage" cho ngữ cảnh fetch hiện tại, sẽ là một trong `none`, `inactive`, hoặc `active`. Máy chủ có thể phản hồi bằng `Activate-Storage-Access` để yêu cầu trình duyệt kích hoạt quyền `inactive` và thử lại yêu cầu, hoặc để tải tài nguyên với quyền truy cập cookie bên thứ ba nếu trạng thái là `active`.
- {{HTTPHeader("Activate-Storage-Access")}}
  - : Được sử dụng để phản hồi `Sec-Fetch-Storage-Access` để chỉ ra rằng trình duyệt có thể kích hoạt quyền hiện có cho truy cập an toàn và thử lại yêu cầu với cookie, hoặc tải tài nguyên với quyền truy cập cookie nếu nó đã có quyền được kích hoạt.

## Sự kiện do máy chủ gửi

- {{HTTPHeader("Reporting-Endpoints")}}
  - : Tiêu đề phản hồi được sử dụng để chỉ định các điểm cuối máy chủ nơi trình duyệt nên gửi cảnh báo và báo cáo lỗi khi sử dụng [Reporting API](/en-US/docs/Web/API/Reporting_API).
- {{HTTPHeader("Report-To")}} {{deprecated_inline}} {{non-standard_inline}}
  - : Tiêu đề phản hồi được sử dụng để chỉ định các điểm cuối máy chủ nơi trình duyệt nên gửi cảnh báo và báo cáo lỗi khi sử dụng [Reporting API](/en-US/docs/Web/API/Reporting_API).

## Mã hóa truyền tải

- {{HTTPHeader("Transfer-Encoding")}}
  - : Chỉ định dạng mã hóa được sử dụng để an toàn truyền tài nguyên đến người dùng.
- {{HTTPHeader("TE")}}
  - : Chỉ định các mã hóa truyền tải mà tác nhân người dùng sẵn sàng chấp nhận.
- {{HTTPHeader("Trailer")}}
  - : Cho phép người gửi bao gồm các trường bổ sung ở cuối thông điệp được chia nhỏ (chunked message).

## WebSocket

Các tiêu đề được sử dụng bởi [WebSockets API](/en-US/docs/Web/API/WebSockets_API) trong [bắt tay WebSocket](/en-US/docs/Web/API/WebSockets_API/Writing_WebSocket_servers#the_websocket_handshake):

- {{HTTPHeader("Sec-WebSocket-Accept")}}
  - : Tiêu đề phản hồi chỉ ra rằng máy chủ sẵn sàng nâng cấp lên kết nối WebSocket.
- {{HTTPHeader("Sec-WebSocket-Extensions")}}
  - : Trong các yêu cầu, tiêu đề này chỉ ra các phần mở rộng WebSocket được hỗ trợ bởi máy khách theo thứ tự ưu tiên. Trong các phản hồi, nó chỉ ra phần mở rộng được máy chủ chọn từ các tùy chọn ưu tiên của máy khách.
- {{HTTPHeader("Sec-WebSocket-Key")}}
  - : Tiêu đề yêu cầu chứa một khóa xác minh rằng máy khách có ý định rõ ràng để mở một `WebSocket`.
- {{HTTPHeader("Sec-WebSocket-Protocol")}}
  - : Trong các yêu cầu, tiêu đề này chỉ ra các giao thức con được hỗ trợ bởi máy khách theo thứ tự ưu tiên. Trong các phản hồi, nó chỉ ra giao thức con được máy chủ chọn từ các tùy chọn ưu tiên của máy khách.
- {{HTTPHeader("Sec-WebSocket-Version")}}
  - : Trong các yêu cầu, tiêu đề này chỉ ra phiên bản của giao thức WebSocket được máy khách sử dụng. Trong các phản hồi, nó chỉ được gửi nếu phiên bản giao thức được yêu cầu không được máy chủ hỗ trợ, và liệt kê các phiên bản mà máy chủ hỗ trợ.

## Khác

- {{HTTPHeader("Alt-Svc")}}
  - : Được sử dụng để liệt kê các cách thay thế để tiếp cận dịch vụ này.
- {{HTTPHeader("Alt-Used")}}
  - : Được sử dụng để xác định dịch vụ thay thế đang được sử dụng.
- {{HTTPHeader("Date")}}
  - : Chứa ngày và giờ mà thông điệp được tạo.
- {{HTTPHeader("Link")}}
  - : Trường entity-header này cung cấp phương tiện để tuần tự hóa một hoặc nhiều liên kết trong các tiêu đề HTTP. Nó tương đương về mặt ngữ nghĩa với phần tử HTML {{HTMLElement("link")}}.
- {{HTTPHeader("Retry-After")}}
  - : Chỉ ra thời gian tác nhân người dùng nên đợi trước khi thực hiện yêu cầu tiếp theo.
- {{HTTPHeader("Server-Timing")}}
  - : Truyền đạt một hoặc nhiều số liệu và mô tả cho chu kỳ yêu cầu-phản hồi đã cho.
- {{HTTPHeader("Service-Worker")}}
  - : Được bao gồm trong các yêu cầu fetch cho tài nguyên script của service worker. Tiêu đề này giúp quản trị viên ghi nhật ký các yêu cầu script service worker cho mục đích giám sát.
- {{HTTPHeader("Service-Worker-Allowed")}}
  - : Được sử dụng để xóa [giới hạn đường dẫn](/en-US/docs/Web/API/Service_Worker_API/Using_Service_Workers#why_is_my_service_worker_failing_to_register) bằng cách bao gồm tiêu đề này [trong phản hồi của script Service Worker](https://w3c.github.io/ServiceWorker/#service-worker-script-response).
- {{HTTPHeader("SourceMap")}}
  - : Liên kết đến {{Glossary("source map")}} để các trình gỡ lỗi có thể bước qua mã nguồn gốc thay vì mã được tạo hoặc chuyển đổi.
- {{HTTPHeader("Upgrade")}}
  - : Tiêu đề HTTP/1.1 (chỉ) này có thể được sử dụng để nâng cấp kết nối máy khách/máy chủ đã được thiết lập lên một giao thức khác (qua cùng giao thức truyền tải). Ví dụ, nó có thể được sử dụng bởi máy khách để nâng cấp kết nối từ HTTP 1.1 lên HTTP 2.0, hoặc kết nối HTTP hoặc HTTPS lên WebSocket.
- {{HTTPHeader("Priority")}}
  - : Cung cấp gợi ý về mức độ ưu tiên của một yêu cầu tài nguyên cụ thể trên một kết nối cụ thể. Giá trị có thể được gửi trong yêu cầu để chỉ ra mức độ ưu tiên của máy khách, hoặc trong phản hồi nếu máy chủ chọn ưu tiên lại yêu cầu.

## Các tiêu đề thử nghiệm

### Tiêu đề báo cáo phân bổ (Attribution reporting)

[Attribution Reporting API](/en-US/docs/Web/API/Attribution_Reporting_API) cho phép nhà phát triển đo lường chuyển đổi — ví dụ khi người dùng nhấp vào quảng cáo được nhúng trên một trang và sau đó tiến hành mua hàng trên trang web của nhà cung cấp — và sau đó truy cập vào các báo cáo về những chuyển đổi đó. Điều này được thực hiện mà không dựa vào cookie theo dõi bên thứ ba, thay vào đó dựa vào nhiều tiêu đề khác nhau để đăng ký **nguồn** và **trigger** được khớp để chỉ ra chuyển đổi.

- {{HTTPHeader("Attribution-Reporting-Eligible")}}
  - : Được sử dụng để chỉ ra rằng phản hồi tương ứng với yêu cầu hiện tại đủ điều kiện để tham gia báo cáo phân bổ, bằng cách đăng ký nguồn phân bổ hoặc trigger.
- {{HTTPHeader("Attribution-Reporting-Register-Source")}}
  - : Được bao gồm như một phần của phản hồi cho yêu cầu bao gồm tiêu đề `Attribution-Reporting-Eligible`, điều này được sử dụng để đăng ký nguồn phân bổ.
- {{HTTPHeader("Attribution-Reporting-Register-Trigger")}}
  - : Được bao gồm như một phần của phản hồi cho yêu cầu bao gồm tiêu đề `Attribution-Reporting-Eligible`, điều này được sử dụng để đăng ký trigger phân bổ.

### Client hints

[Client hints](/en-US/docs/Web/HTTP/Guides/Client_hints) HTTP là một tập hợp các tiêu đề yêu cầu cung cấp thông tin hữu ích về máy khách như loại thiết bị và điều kiện mạng, và cho phép máy chủ tối ưu hóa những gì được phục vụ cho các điều kiện đó.

Các máy chủ chủ động yêu cầu các tiêu đề client hint mà họ quan tâm từ máy khách bằng cách sử dụng {{HTTPHeader("Accept-CH")}}. Sau đó máy khách có thể chọn bao gồm các tiêu đề được yêu cầu trong các yêu cầu tiếp theo.

- {{HTTPHeader("Accept-CH")}}
  - : Các máy chủ có thể quảng cáo hỗ trợ cho Client Hints bằng cách sử dụng trường tiêu đề `Accept-CH` hoặc phần tử HTML `<meta>` tương đương với thuộc tính [`http-equiv`](/en-US/docs/Web/HTML/Reference/Elements/meta/http-equiv).
- {{HTTPHeader("Critical-CH")}} {{experimental_inline}}
  - : Các máy chủ sử dụng `Critical-CH` cùng với {{HTTPHeader("Accept-CH")}} để chỉ định rằng các client hint được chấp nhận cũng là [critical client hints](/en-US/docs/Web/HTTP/Guides/Client_hints#critical_client_hints).
