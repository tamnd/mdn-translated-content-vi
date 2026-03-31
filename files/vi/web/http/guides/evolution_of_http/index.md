---
title: Lịch sử phát triển của HTTP
slug: Web/HTTP/Guides/Evolution_of_HTTP
page-type: guide
sidebar: http
---

**HTTP** (HyperText Transfer Protocol) là giao thức nền tảng của World Wide Web. Được phát triển bởi Tim Berners-Lee và nhóm của ông trong giai đoạn 1989-1991, HTTP đã trải qua nhiều thay đổi giúp duy trì sự đơn giản trong khi định hình tính linh hoạt của nó. Hãy tiếp tục đọc để tìm hiểu cách HTTP phát triển từ một giao thức được thiết kế để trao đổi tệp trong môi trường phòng thí nghiệm tin cậy một phần thành mê cung internet hiện đại mang hình ảnh và video độ phân giải cao và 3D.

## Phát minh ra World Wide Web

Năm 1989, trong khi làm việc tại CERN, Tim Berners-Lee đã viết một đề xuất để xây dựng một hệ thống siêu văn bản qua internet. Ban đầu được gọi là _Mesh_, sau đó được đổi tên thành _World Wide Web_ trong quá trình triển khai vào năm 1990. Được xây dựng trên các giao thức TCP và IP hiện có, nó bao gồm 4 thành phần cơ bản:

- Một định dạng văn bản để biểu diễn tài liệu siêu văn bản, _[HyperText Markup Language](/en-US/docs/Web/HTML)_ (HTML).
- Một giao thức để trao đổi các tài liệu này, _HyperText Transfer Protocol_ (HTTP).
- Một client để hiển thị (và chỉnh sửa) các tài liệu này, trình duyệt web đầu tiên được gọi là _WorldWideWeb_.
- Một máy chủ để cung cấp quyền truy cập vào tài liệu, một phiên bản đầu của _httpd_.

Bốn thành phần cơ bản này đã được hoàn thành vào cuối năm 1990, và các máy chủ đầu tiên đã chạy bên ngoài CERN vào đầu năm 1991. Vào ngày 6 tháng 8 năm 1991, Tim Berners-Lee đã [đăng](https://www.w3.org/People/Berners-Lee/1991/08/art-6484.txt) lên nhóm tin tức công khai _alt.hypertext_. Đây hiện được coi là điểm khởi đầu chính thức của World Wide Web như một dự án công khai.

Giao thức HTTP được sử dụng trong những giai đoạn đầu đó rất đơn giản. Sau này nó được gọi là HTTP/0.9 và đôi khi được gọi là giao thức một dòng.

## HTTP/0.9 – Giao thức một dòng

Phiên bản ban đầu của HTTP không có số phiên bản; sau này nó được gọi là 0.9 để phân biệt với các phiên bản sau. HTTP/0.9 cực kỳ đơn giản: các yêu cầu bao gồm một dòng duy nhất và bắt đầu bằng phương thức duy nhất có thể {{HTTPMethod("GET")}} theo sau là đường dẫn đến tài nguyên. URL đầy đủ không được bao gồm vì giao thức, máy chủ và cổng không cần thiết khi đã kết nối với máy chủ.

```http
GET /my-page.html
```

Phản hồi cũng cực kỳ đơn giản: nó chỉ bao gồm bản thân tệp.

```html
<html>
  A text-only web page
</html>
```

Không giống như các phiên bản phát triển sau, không có tiêu đề HTTP. Điều này có nghĩa là chỉ có thể truyền tải các tệp HTML. Không có mã trạng thái hoặc mã lỗi. Nếu có vấn đề, một tệp HTML cụ thể được tạo ra và bao gồm mô tả vấn đề cho mục đích con người đọc.

## HTTP/1.0 – Xây dựng khả năng mở rộng

HTTP/0.9 rất hạn chế, nhưng trình duyệt và máy chủ đã nhanh chóng làm cho nó linh hoạt hơn:

- Thông tin phiên bản được gửi trong mỗi yêu cầu (`HTTP/1.0` được thêm vào dòng `GET`).
- Một dòng mã trạng thái cũng được gửi ở đầu phản hồi. Điều này cho phép chính trình duyệt nhận ra sự thành công hay thất bại của yêu cầu và điều chỉnh hành vi của mình tương ứng. Ví dụ, cập nhật hoặc sử dụng bộ nhớ đệm cục bộ của nó theo cách cụ thể.
- Khái niệm tiêu đề HTTP đã được giới thiệu cho cả yêu cầu và phản hồi. Siêu dữ liệu có thể được truyền và giao thức đã trở nên cực kỳ linh hoạt và có thể mở rộng.
- Các tài liệu khác ngoài các tệp HTML thuần túy có thể được truyền nhờ vào tiêu đề {{HTTPHeader("Content-Type")}}.

Tại thời điểm đó, một yêu cầu và phản hồi điển hình trông như sau:

```http
GET /my-page.html HTTP/1.0
User-Agent: NCSA_Mosaic/2.0 (Windows 3.1)

HTTP/1.0 200 OK
Date: Tue, 15 Nov 1994 08:12:31 GMT
Server: CERN/3.0 libwww/2.17
Content-Type: text/html

<HTML>
A page with an image
  <IMG SRC="/my-image.gif">
</HTML>
```

Tiếp theo là kết nối thứ hai và yêu cầu tải hình ảnh (với phản hồi tương ứng):

```http
GET /my-image.gif HTTP/1.0
User-Agent: NCSA_Mosaic/2.0 (Windows 3.1)

HTTP/1.0 200 OK
Date: Tue, 15 Nov 1994 08:12:32 GMT
Server: CERN/3.0 libwww/2.17
Content-Type: text/gif

(image content)
```

Từ năm 1991 đến 1995, chúng được giới thiệu với phương pháp thử nghiệm. Máy chủ và trình duyệt sẽ thêm một tính năng và xem liệu nó có được chấp nhận hay không. Các vấn đề tương tác hoạt động là phổ biến. Trong nỗ lực giải quyết những vấn đề này, một tài liệu thông tin mô tả các thực hành phổ biến đã được xuất bản vào tháng 11 năm 1996. Đây được gọi là {{RFC(1945)}} và đã định nghĩa HTTP/1.0.

## HTTP/1.1 – Giao thức được chuẩn hóa

Trong khi đó, việc chuẩn hóa đúng đắn đang tiến triển. Điều này xảy ra song song với các triển khai đa dạng của HTTP/1.0. Phiên bản chuẩn hóa đầu tiên của HTTP, HTTP/1.1, đã được xuất bản vào đầu năm 1997, chỉ vài tháng sau HTTP/1.0.

HTTP/1.1 làm rõ các điểm mơ hồ và giới thiệu nhiều cải tiến:

- Kết nối có thể được tái sử dụng, tiết kiệm thời gian. Nó không còn cần được mở nhiều lần để hiển thị các tài nguyên được nhúng trong tài liệu gốc duy nhất.
- Pipeline đã được thêm vào. Điều này cho phép gửi yêu cầu thứ hai trước khi câu trả lời cho yêu cầu đầu tiên được truyền đầy đủ. Điều này giảm độ trễ của giao tiếp.
- Phản hồi chunked cũng được hỗ trợ.
- Các cơ chế kiểm soát bộ nhớ đệm bổ sung đã được giới thiệu.
- Thương lượng nội dung, bao gồm ngôn ngữ, mã hóa và loại, đã được giới thiệu. Client và máy chủ giờ có thể đồng ý về nội dung nào để trao đổi.
- Nhờ vào tiêu đề {{HTTPHeader("Host")}}, khả năng lưu trữ các tên miền khác nhau từ cùng một địa chỉ IP cho phép đặt cùng máy chủ.

Ví dụ sau đây minh họa một chuỗi điển hình của các yêu cầu HTTP/1.1 được gửi qua một kết nối TCP liên tục duy nhất, cho thấy cách client có thể tái sử dụng kết nối để tải tài nguyên hiệu quả hơn.
Yêu cầu đầu tiên truy xuất một trang web, và máy chủ phản hồi bằng một tài liệu HTML.
Sau đó client gửi các yêu cầu bổ sung tuần tự khi nó gặp các tài nguyên CSS và JavaScript trong HTML:

```http
GET /en-US/docs/ HTTP/1.1
Host: developer.mozilla.org
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:141.0) Gecko/20100101 Firefox/141.0
Accept: text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8
Accept-Language: en-US,en;q=0.5
Accept-Encoding: gzip, deflate, br, zstd
Connection: keep-alive

HTTP/1.1 200 OK
accept-ranges: none
content-encoding: br
date: Tue, 01 Jul 2025 08:32:50 GMT
expires: Tue, 01 Jul 2025 09:26:50 GMT
cache-control: public, max-age=3600
age: 1926
last-modified: Sat, 28 Jun 2025 00:47:12 GMT
etag: W/"b55394ed2f274eea5d528cf6c91e1dcf"
content-type: text/html
vary: Accept-Encoding
content-length: 26178

[26178 bytes of HTML]

GET /static/css/main.9e7d1ce5.css HTTP/1.1
Host: developer.mozilla.org
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:141.0) Gecko/20100101 Firefox/141.0
Accept: text/css,*/*;q=0.1
Accept-Language: en-US,en;q=0.5
Accept-Encoding: gzip, deflate, br, zstd

HTTP/1.1 200 OK
content-encoding: br
content-length: 43694
date: Mon, 30 Jun 2025 21:13:12 GMT
expires: Mon, 30 Jun 2025 21:47:29 GMT
cache-control: public, max-age=31536000
age: 42704
last-modified: Mon, 30 Jun 2025 00:33:45 GMT
etag: W/"d4f4d0955482844ad842986a9bcb7e8a"
content-type: text/css
vary: Accept-Encoding

[43694 bytes of CSS]

GET /static/js/main.a918a4e7.js HTTP/1.1
Host: developer.mozilla.org
…
```

Thiết lập kết nối TCP là phần tốn kém của việc trao đổi client-server, và {{glossary("TCP slow start")}} có nghĩa là các kết nối tồn tại lâu hơn nhanh hơn các kết nối mới được tạo.
HTTP/1.1 cho phép bạn tái sử dụng kết nối TCP cho nhiều yêu cầu và phản hồi, vì vậy bạn tránh phải tạo kết nối mới cho mỗi yêu cầu.
Tuy nhiên, client vẫn phải chờ từng tài nguyên tải xuống trước khi yêu cầu tài nguyên tiếp theo ({{glossary("Head_of_line_blocking", "Chặn đầu hàng")}}).
Để giải quyết điều này, hầu hết các trình duyệt cho phép tối đa sáu kết nối TCP mỗi trang web (hoặc {{glossary("origin", "nguồn gốc")}}).
Với sáu kết nối song song, trình duyệt có thể tải nhiều tài nguyên đồng thời bằng mô hình HTTP/1.1, đã thêm các cải tiến hiệu suất đáng kể.

HTTP/1.1 lần đầu được xuất bản như {{rfc(2068)}} vào tháng 1 năm 1997.

## Hơn hai thập kỷ phát triển

Khả năng mở rộng của HTTP đã làm cho việc tạo các tiêu đề và phương thức mới trở nên dễ dàng. Mặc dù giao thức HTTP/1.1 đã được tinh chỉnh qua hai lần sửa đổi, {{RFC("2616")}} xuất bản vào tháng 6 năm 1999 và {{RFC("7230")}}-{{RFC("7235")}} xuất bản vào tháng 6 năm 2014 trước khi phát hành HTTP/2, nó cực kỳ ổn định trong hơn 15 năm. HTTP/1.1 đã được cập nhật lại vào năm 2022 với {{RFC("9110")}}. Không chỉ HTTP/1.1 được cập nhật, mà toàn bộ HTTP đã được sửa đổi và giờ đây được chia thành các tài liệu sau: ngữ nghĩa ({{RFC("9110")}}), bộ nhớ đệm ({{RFC("9111")}}) áp dụng cho tất cả các phiên bản HTTP, và HTTP/1.1 ({{RFC("9112")}}), HTTP/2 ({{RFC("9113")}}), và HTTP/3 ({{RFC("9114")}}). Ngoài ra, thông số kỹ thuật cuối cùng đã đạt được trạng thái Tiêu chuẩn Internet (STD 97), trong khi trước đây nó luôn là tiêu chuẩn đề xuất/nháp.

### Sử dụng HTTP cho truyền tải an toàn

Thay đổi lớn nhất đối với HTTP được thực hiện vào cuối năm 1994. Thay vì gửi HTTP qua ngăn xếp TCP/IP cơ bản, công ty dịch vụ máy tính Netscape Communications đã tạo ra một lớp truyền tải được mã hóa bổ sung trên đó: SSL. SSL 1.0 không bao giờ được phát hành công khai, nhưng SSL 2.0 và người kế nhiệm SSL 3.0 cho phép tạo ra các trang web thương mại điện tử. Để làm điều này, họ đã mã hóa và đảm bảo tính xác thực của các thông điệp được trao đổi giữa máy chủ và client. SSL cuối cùng đã được chuẩn hóa và trở thành TLS.

Trong cùng thời gian đó, rõ ràng là cần có một lớp vận chuyển được mã hóa. Web không còn là một mạng chủ yếu mang tính học thuật nữa, mà thay vào đó đã trở thành một khu rừng mà các nhà quảng cáo, các cá nhân ngẫu nhiên và tội phạm cạnh tranh để lấy càng nhiều dữ liệu cá nhân càng tốt. Khi các ứng dụng được xây dựng trên HTTP trở nên mạnh mẽ hơn và yêu cầu truy cập vào thông tin riêng tư như sổ địa chỉ, email và vị trí người dùng, TLS đã trở nên cần thiết bên ngoài trường hợp sử dụng thương mại điện tử.

### Sử dụng HTTP cho các ứng dụng phức tạp

Tim Berners-Lee ban đầu không hình dung HTTP như một phương tiện chỉ đọc. Ông muốn tạo ra một web nơi mọi người có thể thêm và di chuyển tài liệu từ xa — một loại hệ thống tệp phân tán. Khoảng năm 1996, HTTP đã được mở rộng để cho phép tác giả, và một tiêu chuẩn được gọi là WebDAV đã được tạo ra. Nó phát triển để bao gồm các ứng dụng cụ thể như CardDAV để xử lý các mục sổ địa chỉ và CalDAV để xử lý lịch. Nhưng tất cả các tiện ích mở rộng \*DAV này có một lỗ hổng: chúng chỉ có thể sử dụng khi được triển khai bởi các máy chủ.

Năm 2000, một mẫu mới để sử dụng HTTP được thiết kế: {{glossary("REST", "chuyển trạng thái đại diện")}} (hay REST). API không dựa trên các phương thức HTTP mới, mà thay vào đó dựa vào quyền truy cập vào các URI cụ thể với các phương thức HTTP/1.1 cơ bản. Điều này cho phép bất kỳ ứng dụng web nào để API truy xuất và sửa đổi dữ liệu của mình mà không cần cập nhật trình duyệt hoặc máy chủ. Tất cả thông tin cần thiết được nhúng trong các tệp mà các trang web phục vụ thông qua HTTP/1.1 chuẩn. Nhược điểm của mô hình REST là mỗi trang web định nghĩa RESTful API phi chuẩn riêng của mình và có toàn quyền kiểm soát nó. Điều này khác với các tiện ích mở rộng \*DAV nơi client và máy chủ có thể tương tác. Các RESTful API trở nên rất phổ biến trong những năm 2010.

Từ năm 2005, nhiều API hơn đã có sẵn cho các trang web. Một số API này tạo ra các tiện ích mở rộng cho giao thức HTTP cho các mục đích cụ thể:

- [Sự kiện do máy chủ gửi](/en-US/docs/Web/API/Server-sent_events), nơi máy chủ có thể đẩy các thông điệp thỉnh thoảng đến trình duyệt.
- [WebSocket](/en-US/docs/Web/API/WebSockets_API), một giao thức mới có thể được thiết lập bằng cách nâng cấp kết nối HTTP hiện có.

### Nới lỏng mô hình bảo mật của web

HTTP độc lập với mô hình bảo mật web, được biết đến là [chính sách cùng nguồn gốc](/en-US/docs/Web/Security/Defenses/Same-origin_policy). Trên thực tế, mô hình bảo mật web hiện tại được phát triển sau khi tạo HTTP! Qua nhiều năm, người ta thấy hữu ích khi nâng một số hạn chế của chính sách này trong một số ràng buộc nhất định. Máy chủ truyền đạt bao nhiêu và khi nào để nâng những hạn chế đó cho client bằng cách sử dụng một tập hợp tiêu đề HTTP mới. Những tiêu đề này được định nghĩa trong các thông số kỹ thuật như [Chia sẻ tài nguyên cross-origin](/en-US/docs/Glossary/CORS) (CORS) và [Chính sách bảo mật nội dung](/en-US/docs/Web/HTTP/Guides/CSP) (CSP).

Ngoài những tiện ích mở rộng lớn này, nhiều tiêu đề khác đã được thêm vào, đôi khi chỉ thử nghiệm. Các tiêu đề đáng chú ý là tiêu đề Do Not Track ({{HTTPHeader("DNT")}}) để kiểm soát quyền riêng tư, {{HTTPHeader("X-Frame-Options")}}, và {{HTTPHeader('Upgrade-Insecure-Requests')}} nhưng còn nhiều tiêu đề khác tồn tại.

## HTTP/2 – Giao thức cho hiệu suất cao hơn

Qua nhiều năm, các trang web trở nên phức tạp hơn. Một số chúng thậm chí là ứng dụng theo đúng nghĩa của chúng. Nhiều phương tiện trực quan hơn được hiển thị và khối lượng và kích thước của các script thêm tương tác cũng tăng lên. Nhiều dữ liệu hơn được truyền qua nhiều yêu cầu HTTP hơn và điều này tạo ra sự phức tạp và chi phí lớn hơn cho các kết nối HTTP/1.1. Để giải quyết điều này, Google đã triển khai giao thức thử nghiệm SPDY vào đầu những năm 2010. Cách thay thế trao đổi dữ liệu giữa client và máy chủ này đã thu hút sự quan tâm từ các nhà phát triển làm việc trên cả trình duyệt và máy chủ. SPDY đã định nghĩa sự tăng khả năng phản hồi và giải quyết vấn đề truyền dữ liệu trùng lặp, phục vụ như là nền tảng cho giao thức HTTP/2.

Giao thức HTTP/2 khác với HTTP/1.1 ở một vài điểm:

- Đây là giao thức nhị phân thay vì giao thức văn bản. Nó không thể được đọc và tạo thủ công. Mặc dù trở ngại này, nó cho phép thực hiện các kỹ thuật tối ưu hóa cải tiến.
- Đây là giao thức ghép kênh. Các yêu cầu song song có thể được thực hiện qua cùng một kết nối, loại bỏ các ràng buộc của giao thức HTTP/1.x.
- Nó nén tiêu đề. Vì những tiêu đề này thường giống nhau trong một tập hợp các yêu cầu, điều này loại bỏ sự trùng lặp và chi phí dữ liệu được truyền.

Được chuẩn hóa chính thức vào tháng 5 năm 2015, việc sử dụng HTTP/2 đạt đỉnh điểm vào tháng 1 năm 2022 ở mức 46,9% của tất cả các trang web (xem [số liệu thống kê này](https://w3techs.com/technologies/details/ce-http2)). Các trang web có lưu lượng cao đã cho thấy sự áp dụng nhanh nhất trong nỗ lực tiết kiệm chi phí băng thông truyền dữ liệu.

Việc áp dụng nhanh chóng này có thể xảy ra vì HTTP/2 không yêu cầu thay đổi đối với các trang web và ứng dụng. Để sử dụng nó, chỉ cần có máy chủ cập nhật giao tiếp với trình duyệt gần đây. Chỉ cần một nhóm giới hạn các nhóm để kích hoạt việc áp dụng, và khi các phiên bản trình duyệt và máy chủ cũ được làm mới, việc sử dụng đã tự nhiên tăng lên, không cần công việc đáng kể cho các nhà phát triển web.

## Phát triển sau HTTP/2

Khả năng mở rộng của HTTP vẫn đang được sử dụng để thêm các tính năng mới. Đáng chú ý, chúng ta có thể kể đến các tiện ích mở rộng mới của giao thức HTTP xuất hiện vào năm 2016:

- Hỗ trợ {{HTTPHeader("Alt-Svc")}} cho phép tách biệt việc nhận dạng và vị trí của một tài nguyên nhất định. Điều này có nghĩa là cơ chế bộ nhớ đệm {{Glossary("CDN")}} thông minh hơn.
- Việc giới thiệu [gợi ý từ client](/en-US/docs/Web/HTTP/Guides/Client_hints) cho phép trình duyệt hoặc client chủ động truyền đạt thông tin về các yêu cầu và ràng buộc phần cứng của nó đến máy chủ.
- Việc giới thiệu các tiền tố liên quan đến bảo mật trong tiêu đề {{HTTPHeader("Cookie")}} giúp đảm bảo rằng các cookie an toàn không thể bị thay đổi.

## HTTP/3 - HTTP qua QUIC

Phiên bản chính tiếp theo của HTTP, HTTP/3 có cùng ngữ nghĩa như các phiên bản HTTP trước nhưng sử dụng {{Glossary("QUIC")}} thay vì {{Glossary("TCP")}} cho phần tầng vận chuyển. Vào tháng 10 năm 2022, [26% của tất cả các trang web đang sử dụng HTTP/3](https://w3techs.com/technologies/details/ce-http3).

QUIC được thiết kế để cung cấp độ trễ thấp hơn nhiều cho các kết nối HTTP. Giống như HTTP/2, đây là giao thức ghép kênh, nhưng HTTP/2 chạy trên một kết nối TCP duy nhất, do đó việc phát hiện mất gói tin và truyền lại được xử lý ở lớp TCP có thể chặn tất cả các luồng. QUIC chạy nhiều luồng qua {{Glossary("UDP")}} và thực hiện phát hiện mất gói tin và truyền lại độc lập cho mỗi luồng, để nếu xảy ra lỗi, chỉ luồng có dữ liệu trong gói tin đó bị chặn.

Được định nghĩa trong {{RFC("9114")}}, [HTTP/3 được hỗ trợ bởi hầu hết các trình duyệt chính](https://caniuse.com/http3) bao gồm Chromium (và các biến thể của nó như Chrome và Edge) và Firefox.

## Xem thêm

- [Quản lý kết nối trong HTTP/1.x](/en-US/docs/Web/HTTP/Guides/Connection_management_in_HTTP_1.x)
- [Cơ chế nâng cấp giao thức](/en-US/docs/Web/HTTP/Guides/Protocol_upgrade_mechanism)
- [Tài nguyên và thông số kỹ thuật HTTP](/en-US/docs/Web/HTTP/Reference/Resources_and_specifications)
- Các thuật ngữ từ điển:
  - {{glossary('HTTP')}}
  - {{glossary('HTTP_2', 'HTTP/2')}}
  - {{glossary('QUIC')}}
  - {{glossary('Round Trip Time', 'Round Trip Time (RTT)')}}
  - {{glossary('TCP slow start')}}
  - {{glossary('TCP', 'Transmission Control Protocol (TCP)')}}
