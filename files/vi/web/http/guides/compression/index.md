---
title: Compression in HTTP
slug: Web/HTTP/Guides/Compression
page-type: guide
sidebar: http
---

**Nén** là một cách quan trọng để tăng hiệu suất của trang web. Đối với một số tài liệu, giảm kích thước lên đến 70% giúp giảm nhu cầu băng thông. Qua nhiều năm, các thuật toán cũng trở nên hiệu quả hơn, và các thuật toán mới được hỗ trợ bởi client và máy chủ.

Trong thực tế, các nhà phát triển web không cần triển khai cơ chế nén, cả trình duyệt lẫn máy chủ đều đã triển khai sẵn, nhưng họ phải đảm bảo rằng máy chủ được cấu hình đúng. Nén xảy ra ở ba cấp độ khác nhau:

- đầu tiên là một số định dạng tệp được nén bằng các phương pháp tối ưu hóa cụ thể,
- sau đó, nén chung có thể xảy ra ở cấp HTTP (tài nguyên được truyền nén từ đầu đến cuối),
- và cuối cùng, nén có thể được xác định ở cấp kết nối, giữa hai nút của kết nối HTTP.

## Nén định dạng tệp

Mỗi loại dữ liệu có một số dư thừa, tức là _không gian lãng phí_, trong đó. Nếu văn bản thường có thể có đến 60% dư thừa, tỷ lệ này có thể cao hơn nhiều đối với một số phương tiện khác như âm thanh và video. Khác với văn bản, các loại phương tiện khác này sử dụng nhiều không gian để lưu trữ dữ liệu của chúng, và nhu cầu tối ưu hóa lưu trữ và lấy lại không gian đã rõ ràng từ rất sớm. Các kỹ sư đã thiết kế thuật toán nén tối ưu được sử dụng bởi các định dạng tệp được thiết kế cho mục đích cụ thể này. Các thuật toán nén được sử dụng cho tệp có thể được nhóm thành hai danh mục rộng:

- _Nén không mất dữ liệu_, trong đó chu trình nén-giải nén không làm thay đổi dữ liệu được khôi phục. Nó khớp (byte theo byte) với bản gốc.
  Đối với hình ảnh, `gif` hoặc `png` sử dụng nén không mất dữ liệu.
- _Nén mất dữ liệu_, trong đó chu trình làm thay đổi dữ liệu gốc theo cách (hy vọng) không đáng kể với người dùng.
  Các định dạng video trên Web là mất dữ liệu; định dạng hình ảnh `jpeg` cũng mất dữ liệu.

Một số định dạng có thể được sử dụng cho cả nén không mất dữ liệu hoặc mất dữ liệu, như `webp`, và thường thuật toán mất dữ liệu có thể được cấu hình để nén nhiều hơn hoặc ít hơn, điều này dẫn đến chất lượng thấp hơn hoặc cao hơn. Để đạt hiệu suất tốt hơn của trang web, lý tưởng là nén càng nhiều càng tốt, đồng thời duy trì mức chất lượng chấp nhận được. Đối với hình ảnh, hình ảnh được tạo bởi công cụ có thể không được tối ưu hóa đủ cho Web; nên sử dụng các công cụ sẽ nén càng nhiều càng tốt với chất lượng yêu cầu. Có [nhiều công cụ](https://www.creativebloq.com/design/image-compression-tools-1132865) chuyên dụng cho mục đích này.

Các thuật toán nén mất dữ liệu thường hiệu quả hơn các thuật toán không mất dữ liệu.

> [!NOTE]
> Vì nén hoạt động tốt hơn trên một loại tệp cụ thể, thường không mang lại gì khi nén chúng lần thứ hai. Trên thực tế, điều này thường phản tác dụng vì chi phí tổng phụ (các thuật toán thường cần một từ điển thêm vào kích thước ban đầu) có thể cao hơn lợi ích nén thêm, dẫn đến tệp lớn hơn. Đừng sử dụng hai kỹ thuật sau đây cho các tệp ở định dạng nén.

## Nén đầu-đến-cuối

Đối với nén, nén đầu-đến-cuối là nơi chứa những cải tiến hiệu suất lớn nhất của trang web. Nén đầu-đến-cuối đề cập đến việc nén phần thân của thông điệp được thực hiện bởi máy chủ và sẽ không thay đổi cho đến khi đến client. Dù các nút trung gian là gì, chúng để phần thân không bị thay đổi.

<!--
%%{init: { "sequence": { "wrap": true, "width": 175, "noteAlign": "center", "messageAlign": "left" }} }%%

sequenceDiagram
    participant Client
    participant Proxy1 as Proxy
    participant Proxy2 as Proxy
    participant Server

    Note over Client: Resource requested.
    Client->>Server:
    Note over Server: Resource is compressed and returned.
    Server->>Client:
    Note over Proxy1,Proxy2: Intermediate nodes do not uncompress the body.
    Note over Client: Client decompresses the body.
-->

![Máy chủ gửi phần thân HTTP nén đến client qua các nút mạng. Phần thân không được giải nén ở bất kỳ bước nào qua mạng cho đến khi đến client.](httpenco1.svg)

Tất cả các trình duyệt và máy chủ hiện đại đều hỗ trợ nó, và điều duy nhất cần thương lượng là thuật toán nén để sử dụng. Các thuật toán này được tối ưu hóa cho văn bản. Vào những năm 1990, công nghệ nén đang phát triển với tốc độ nhanh và nhiều thuật toán liên tiếp đã được thêm vào tập hợp các lựa chọn có thể. Ngày nay, chỉ có hai thuật toán còn phù hợp: `gzip`, phổ biến nhất, và `br` là thách thức mới.

Để chọn thuật toán sử dụng, trình duyệt và máy chủ sử dụng [thương lượng nội dung chủ động](/en-US/docs/Web/HTTP/Guides/Content_negotiation). Trình duyệt gửi tiêu đề {{HTTPHeader("Accept-Encoding")}} với thuật toán nó hỗ trợ và thứ tự ưu tiên, máy chủ chọn một thuật toán, sử dụng nó để nén phần thân của phản hồi và sử dụng tiêu đề {{HTTPHeader("Content-Encoding")}} để thông báo cho trình duyệt thuật toán nó đã chọn. Vì thương lượng nội dung đã được sử dụng để chọn một biểu diễn dựa trên mã hóa của nó, máy chủ phải gửi tiêu đề {{HTTPHeader("Vary")}} chứa ít nhất {{HTTPHeader("Accept-Encoding")}} cùng với tiêu đề này trong phản hồi; theo cách đó, bộ nhớ đệm sẽ có thể lưu trữ các biểu diễn khác nhau của tài nguyên.

<!--
%%{init: { "sequence": { "wrap": true, "width":380, "noteAlign": "center", "messageAlign": "left" }} }%%

sequenceDiagram
    participant Client
    participant Server

    Note over Client: The client signifies its ability to understand two compression algorithms.
    Client->>Server: GET /doc HTTP/1.1<br/>Accept-Encoding: br, gzip
    Note over Server: The resource is sent compressed. The Vary header indicates that content negotiation has been used to select the algorithm.
    Server->>Client: HTTP/1.1 200 OK<br/>Content-Encoding: br<br/>Vary: Accept-Encoding
-->

![Client yêu cầu nội dung với tiêu đề 'Accept-Encoding: br, gzip'. Máy chủ phản hồi với phần thân được nén bằng thuật toán Brotli và các tiêu đề 'Content-Encoding' và 'Vary' cần thiết.](httpcompression1.svg)

Vì nén mang lại cải tiến hiệu suất đáng kể, nên kích hoạt nó cho tất cả các tệp ngoại trừ các tệp đã nén như hình ảnh, tệp âm thanh và video.

Apache hỗ trợ nén và sử dụng [mod_deflate](https://httpd.apache.org/docs/current/mod/mod_deflate.html); đối với Nginx có [ngx_http_gzip_module](https://nginx.org/en/docs/http/ngx_http_gzip_module.html); đối với IIS, phần tử [`<httpCompression>`](https://learn.microsoft.com/en-us/iis/configuration/system.webServer/httpCompression/).

## Truyền tải từ điển nén

Các định dạng nén hiện đại như {{glossary("Brotli compression")}} và {{glossary("Zstandard compression")}} có thể sử dụng từ điển của dữ liệu thường dùng để tăng thêm khả năng nén ngoài việc chỉ tham chiếu những dữ liệu đó từ bên trong tệp đang được nén. Thông thường, đối với các phản hồi HTTP, điều này sử dụng từ điển tĩnh được xác định trước được bao gồm trong định dạng đó (ví dụ [từ điển tĩnh Brotli có sẵn trong mã nguồn](https://github.com/google/brotli/blob/master/csharp/org/brotli/dec/Dictionary.cs)).

[Truyền tải từ điển nén](/en-US/docs/Web/HTTP/Guides/Compression_dictionary_transport) cho phép nhà phát triển chỉ định một tài nguyên có thể được sử dụng làm từ điển cho các yêu cầu trong tương lai. Đây có thể là một tệp từ điển cụ thể, hoặc một tài nguyên hiện có (ví dụ, sử dụng `app.v1.js` làm từ điển khi tải xuống `app.v2.js`). Điều này thường cải thiện khả năng nén và do đó thời gian tải. Trong ví dụ `app.vX.js`, hầu hết tải xuống sẽ chỉ bao gồm delta giữa hai phiên bản, và các byte chung có thể được tham chiếu từ tệp `app.v1.js` gốc đã được tải xuống.

## Nén hop-by-hop

Nén hop-by-hop, mặc dù tương tự như nén đầu-đến-cuối, khác ở một yếu tố cơ bản: việc nén không xảy ra trên tài nguyên trong máy chủ, tạo ra một biểu diễn cụ thể sau đó được truyền, mà là trên phần thân của thông điệp giữa bất kỳ hai nút nào trên đường từ client đến máy chủ. Các kết nối giữa các nút trung gian liên tiếp có thể áp dụng nén _khác nhau_.

<!--
%%{init: { "sequence": { "wrap": true, "width": 130, "noteAlign": "center", "messageAlign": "left" }} }%%

sequenceDiagram
    participant Client
    participant N1 as Node
    participant N2 as Node
    participant N3 as Node
    participant Server

    Client->>N1: Uncompressed
    Note left of Client: Client sends an uncompressed body.
    Note over N1,N3: Intermediate nodes send the body with or without compression on a hop-by-hop basis.
    N1->>N2: Uncompressed
    N2->>N3: Compressed
    N3->>Server: Uncompressed
    Note right of Server: The server receives an uncompressed body.
-->

![Máy chủ gửi phần thân HTTP không nén đến client qua các nút mạng. Phần thân được nén và giải nén bởi các nút trên mạng tùy thuộc vào tiêu đề 'Transfer-Encoding' trước khi đến client.](httpte1.svg)

Để làm điều này, HTTP sử dụng một cơ chế tương tự như thương lượng nội dung cho nén đầu-đến-cuối: nút truyền yêu cầu quảng bá ý muốn của nó bằng cách sử dụng tiêu đề {{HTTPHeader("TE")}} và nút kia chọn phương pháp thích hợp, áp dụng nó và chỉ ra lựa chọn của nó bằng tiêu đề {{HTTPHeader("Transfer-Encoding")}}.

<!--
%%{init: { "sequence": { "wrap": true, "width": 175, "noteAlign": "center" }} }%%

sequenceDiagram
    participant Client
    participant Node1 as Node
    participant Node2 as Node
    participant Server

    Note over Client: Request message
    Client->>Node1: GET /doc HTTP/1.1

    Note over Node1: Shows support for compression while forwarding message.
    Node1->>Node2: GET /doc HTTP/1.1<br/>TE: gzip, br

    Note over Node2: Forwards message
    Node2->>Server: GET /doc HTTP/1.1

    Note over Server: Returns resource in an uncompressed body.
    Server->>Node2: HTTP/1.1 200 OK

    Note over Node2: Compresses body and forwards message.
    Node2->>Node1: HTTP/1.1 200 OK<br/>Transfer-Encoding: br

    Note over Node1: Decompresses resource and returns message to Client.
    Node1->>Client: HTTP/1.1 200 OK
-->

![Client yêu cầu nội dung từ máy chủ mà không có tiêu đề liên quan đến nén. Máy chủ phản hồi với phần thân không nén. Phần thân được nén và giải nén bởi các nút trên mạng trước khi đến client.](httpcomp2.svg)

Trong thực tế, nén hop-by-hop là trong suốt đối với máy chủ và client, và hiếm khi được sử dụng. {{HTTPHeader("TE")}} và {{HTTPHeader("Transfer-Encoding")}} hầu hết được sử dụng để gửi phản hồi theo từng phần, cho phép bắt đầu truyền tài nguyên mà không biết độ dài của nó.

Lưu ý rằng việc sử dụng {{HTTPHeader("Transfer-Encoding")}} và nén ở cấp hop rất hiếm đến mức hầu hết các máy chủ, như Apache, Nginx hoặc IIS, không có cách dễ dàng để cấu hình nó. Cấu hình như vậy thường xảy ra ở cấp proxy.

## Xem thêm

- [Hướng dẫn truyền tải từ điển nén](/en-US/docs/Web/HTTP/Guides/Compression_dictionary_transport)
- Thuật ngữ:
  - {{Glossary("Brotli compression")}}
  - {{Glossary("Gzip compression")}}
  - {{Glossary("Lossless compression")}}
  - {{Glossary("Lossy compression")}}
  - {{Glossary("Zstandard compression")}}
  - {{Glossary("Compression Dictionary Transport")}}
