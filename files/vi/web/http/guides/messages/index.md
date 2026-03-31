---
title: Thông điệp HTTP
slug: Web/HTTP/Guides/Messages
page-type: guide
sidebar: http
---

**Thông điệp HTTP** là cơ chế được sử dụng để trao đổi dữ liệu giữa máy chủ và client trong giao thức HTTP.
Có hai loại thông điệp: **yêu cầu** được gửi bởi client để kích hoạt một hành động trên máy chủ, và **phản hồi**, câu trả lời mà máy chủ gửi để trả lời một yêu cầu.

Các nhà phát triển hiếm khi, nếu có, tự xây dựng các thông điệp HTTP từ đầu.
Các ứng dụng như trình duyệt, proxy, hoặc máy chủ web sử dụng phần mềm được thiết kế để tạo các thông điệp HTTP một cách đáng tin cậy và hiệu quả.
Cách các thông điệp được tạo ra hoặc biến đổi được kiểm soát thông qua API trong trình duyệt, tệp cấu hình cho proxy hoặc máy chủ, hoặc các giao diện khác.

Trong các phiên bản giao thức HTTP đến HTTP/2, các thông điệp dựa trên văn bản và tương đối dễ đọc và hiểu sau khi bạn đã quen với định dạng.
Trong HTTP/2, các thông điệp được bọc trong khung nhị phân, làm cho chúng khó đọc hơn một chút.
Tuy nhiên, ngữ nghĩa cơ bản của giao thức vẫn như vậy, vì vậy bạn có thể học cấu trúc và ý nghĩa của các thông điệp HTTP dựa trên định dạng văn bản của thông điệp HTTP/1.x, và áp dụng sự hiểu biết này vào HTTP/2 và xa hơn.

Hướng dẫn này sử dụng thông điệp HTTP/1.1 để dễ đọc, và giải thích cấu trúc của thông điệp HTTP bằng định dạng HTTP/1.1.
Chúng tôi nêu bật một số điểm khác biệt mà bạn có thể cần để mô tả HTTP/2 trong phần cuối.

> [!NOTE]
> Bạn có thể xem các thông điệp HTTP trong tab **Network** của trình duyệt trong công cụ phát triển, hoặc nếu bạn in các thông điệp HTTP ra console bằng các công cụ CLI như [curl](https://curl.se/), ví dụ như vậy.

## Giải phẫu của một thông điệp HTTP

Để hiểu cách các thông điệp HTTP hoạt động, chúng ta sẽ xem xét các thông điệp HTTP/1.1 và kiểm tra cấu trúc.
Hình minh họa sau đây cho thấy các thông điệp trong HTTP/1.1 trông như thế nào:

![Yêu cầu và phản hồi chia sẻ cấu trúc chung trong HTTP](https://mdn.github.io/shared-assets/images/diagrams/http/messages/http-message-anatomy.svg)

Cả yêu cầu và phản hồi đều có cấu trúc tương tự:

1. Một _dòng bắt đầu_ là một dòng đơn mô tả phiên bản HTTP cùng với phương thức yêu cầu hoặc kết quả của yêu cầu.
2. Một tập tùy chọn _tiêu đề HTTP_ chứa siêu dữ liệu mô tả thông điệp. Ví dụ, một yêu cầu tài nguyên có thể bao gồm các định dạng được phép của tài nguyên đó, trong khi phản hồi có thể bao gồm các tiêu đề để chỉ định định dạng thực sự được trả về.
3. Một dòng trống cho biết siêu dữ liệu của thông điệp đã hoàn chỉnh.
4. Một _nội dung_ tùy chọn chứa dữ liệu liên quan đến thông điệp. Đây có thể là dữ liệu POST để gửi đến máy chủ trong một yêu cầu, hoặc một số tài nguyên được trả về cho client trong một phản hồi.
   Liệu thông điệp có nội dung hay không được xác định bởi dòng bắt đầu và tiêu đề HTTP.

Dòng bắt đầu và tiêu đề của thông điệp HTTP được gọi chung là _đầu_ của các yêu cầu, và phần sau đó chứa nội dung của nó được gọi là _thân_.

## Các yêu cầu HTTP

Hãy xem xét ví dụ yêu cầu HTTP `POST` sau được gửi sau khi người dùng gửi biểu mẫu trên trang web:

```http
POST /users HTTP/1.1
Host: example.com
Content-Type: application/x-www-form-urlencoded
Content-Length: 49

name=FirstName+LastName&email=bsmth%40example.com
```

Dòng bắt đầu trong các yêu cầu HTTP/1.x (`POST /users HTTP/1.1` trong ví dụ trên) được gọi là "dòng yêu cầu" và bao gồm ba phần:

```http
<method> <request-target> <protocol>
```

- `<method>`
  - : [Phương thức HTTP](/en-US/docs/Web/HTTP/Reference/Methods) (còn được gọi là _động từ HTTP_) là một trong một tập hợp các từ được định nghĩa mô tả ý nghĩa của yêu cầu và kết quả mong muốn.
    Ví dụ, `GET` cho biết client muốn nhận một tài nguyên để đổi lại, và `POST` có nghĩa là client đang gửi dữ liệu đến máy chủ.
- `<request-target>`
  - : Mục tiêu yêu cầu thường là {{glossary("URL")}} tuyệt đối hoặc tương đối, và được đặc trưng bởi ngữ cảnh của yêu cầu.
    Định dạng của mục tiêu yêu cầu phụ thuộc vào phương thức HTTP được sử dụng và ngữ cảnh yêu cầu.
    Nó được mô tả chi tiết hơn trong phần [Mục tiêu yêu cầu](#request_targets) bên dưới.
- `<protocol>`
  - : _Phiên bản HTTP_, định nghĩa cấu trúc của phần thông điệp còn lại, hoạt động như chỉ số của phiên bản dự kiến để sử dụng cho phản hồi.
    Đây hầu như luôn là `HTTP/1.1`, vì `HTTP/0.9` và `HTTP/1.0` đã lỗi thời.
    Trong HTTP/2 trở lên, phiên bản giao thức không được bao gồm trong thông điệp vì nó được hiểu từ thiết lập kết nối.

### Mục tiêu yêu cầu

Có một vài cách để mô tả mục tiêu yêu cầu, nhưng phổ biến nhất là dạng "origin form".
Dưới đây là danh sách các loại mục tiêu và khi nào chúng được sử dụng:

1. Trong _dạng origin_, người nhận kết hợp đường dẫn tuyệt đối với thông tin trong tiêu đề {{HTTPHeader("Host")}}.
   Một chuỗi query có thể được thêm vào đường dẫn để có thêm thông tin (thường ở định dạng `key=value`).
   Điều này được sử dụng với các phương thức `GET`, `POST`, `HEAD`, và `OPTIONS`:

   ```http
   GET /en-US/docs/Web/HTTP/Guides/Messages HTTP/1.1
   ```

2. _Dạng tuyệt đối_ là URL đầy đủ, bao gồm cả authority, và được sử dụng với `GET` khi kết nối đến proxy:

   ```http
   GET https://developer.mozilla.org/en-US/docs/Web/HTTP/Guides/Messages HTTP/1.1
   ```

3. _Dạng authority_ là authority và cổng được phân tách bằng dấu hai chấm (`:`).
   Nó chỉ được sử dụng với phương thức {{HTTPMethod("CONNECT")}} khi thiết lập đường hầm HTTP:

   ```http
   CONNECT developer.mozilla.org:443 HTTP/1.1
   ```

4. _Dạng dấu sao_ chỉ được sử dụng với `OPTIONS` khi bạn muốn đại diện cho máy chủ như một tổng thể (`*`) thay vì một tài nguyên được đặt tên:

   ```http
   OPTIONS * HTTP/1.1
   ```

### Tiêu đề yêu cầu

Các tiêu đề là siêu dữ liệu được gửi cùng với yêu cầu sau dòng bắt đầu và trước nội dung.
Trong [ví dụ gửi biểu mẫu](#http_requests) ở trên, chúng là các dòng sau của thông điệp:

```http
Host: example.com
Content-Type: application/x-www-form-urlencoded
Content-Length: 49
```

Trong HTTP/1.x, mỗi tiêu đề là một chuỗi **không phân biệt hoa thường** theo sau là dấu hai chấm (`:`) và một giá trị có định dạng phụ thuộc vào tiêu đề.
Toàn bộ tiêu đề, bao gồm cả giá trị, bao gồm một dòng duy nhất.
Dòng này có thể khá dài trong một số trường hợp, chẳng hạn như tiêu đề {{HTTPHeader("Cookie")}}.

![Ví dụ về tiêu đề trong yêu cầu HTTP](https://mdn.github.io/shared-assets/images/diagrams/http/messages/request-headers.svg)

Một số tiêu đề được sử dụng độc quyền trong các yêu cầu, trong khi các tiêu đề khác có thể được gửi trong cả yêu cầu và phản hồi, hoặc có thể có phân loại cụ thể hơn:

- {{glossary("Request header", "Tiêu đề yêu cầu")}} cung cấp ngữ cảnh bổ sung cho yêu cầu hoặc thêm logic phụ cho cách nó nên được xử lý bởi máy chủ (ví dụ: [yêu cầu có điều kiện](/en-US/docs/Web/HTTP/Guides/Conditional_requests)).
- {{glossary("Representation header", "Tiêu đề đại diện")}} được gửi trong yêu cầu nếu thông điệp có nội dung, và chúng mô tả dạng ban đầu của dữ liệu thông điệp và bất kỳ mã hóa nào được áp dụng.
  Điều này cho phép người nhận hiểu cách tái tạo tài nguyên như nó ở trước khi được truyền qua mạng.

### Nội dung yêu cầu

Nội dung yêu cầu là phần của yêu cầu mang thông tin đến máy chủ.
Chỉ các yêu cầu `PATCH`, `POST`, và `PUT` mới có nội dung.
Trong [ví dụ gửi biểu mẫu](#http_requests), phần này là nội dung:

```http
name=FirstName+LastName&email=bsmth%40example.com
```

Nội dung trong yêu cầu gửi biểu mẫu chứa một lượng thông tin tương đối nhỏ dưới dạng các cặp `key=value`, nhưng nội dung yêu cầu có thể chứa các loại dữ liệu khác mà máy chủ mong đợi:

```json
{
  "firstName": "Brian",
  "lastName": "Smith",
  "email": "bsmth@example.com",
  "more": "data"
}
```

hoặc dữ liệu trong nhiều phần:

```http
--delimiter123
Content-Disposition: form-data; name="field1"

value1
--delimiter123
Content-Disposition: form-data; name="field2"; filename="example.txt"

Text file contents
--delimiter123--
```

## Các phản hồi HTTP

Phản hồi là các thông điệp HTTP mà máy chủ gửi lại để trả lời yêu cầu.
Phản hồi cho client biết kết quả của yêu cầu là gì.
Dưới đây là một ví dụ phản hồi HTTP/1.1 cho yêu cầu `POST` đã tạo người dùng mới:

```http
HTTP/1.1 201 Created
Content-Type: application/json
Location: http://example.com/users/123

{
  "message": "New user created",
  "user": {
    "id": 123,
    "firstName": "Example",
    "lastName": "Person",
    "email": "bsmth@example.com"
  }
}
```

Dòng bắt đầu (`HTTP/1.1 201 Created` ở trên) được gọi là "dòng trạng thái" trong các phản hồi, và có ba phần:

```http
<protocol> <status-code> <reason-phrase>
```

- `<protocol>`
  - : _Phiên bản HTTP_ của thông điệp.
- `<status-code>`
  - : Một [mã trạng thái](/en-US/docs/Web/HTTP/Reference/Status) số cho biết yêu cầu có thành công hay thất bại hay không.
    Các mã trạng thái phổ biến là {{HTTPStatus("200")}}, {{HTTPStatus("404")}}, hoặc {{HTTPStatus("302")}}.
- `<reason-phrase>` {{optional_inline}}
  - : Văn bản tùy chọn sau mã trạng thái là mô tả văn bản ngắn gọn, thuần thông tin, của trạng thái để giúp con người hiểu kết quả của yêu cầu.
    Cụm từ lý do đôi khi được bao gồm trong dấu ngoặc đơn (ví dụ: "201 (Created)") để chỉ ra rằng nó là tùy chọn.

### Tiêu đề phản hồi

Tiêu đề phản hồi là siêu dữ liệu được gửi cùng với phản hồi.
Trong HTTP/1.x, mỗi tiêu đề là chuỗi **không phân biệt hoa thường** theo sau là dấu hai chấm (`:`) và giá trị có định dạng phụ thuộc vào tiêu đề nào được sử dụng.

![Ví dụ về tiêu đề trong phản hồi HTTP](https://mdn.github.io/shared-assets/images/diagrams/http/messages/response-headers.svg)

Giống như tiêu đề yêu cầu, có nhiều tiêu đề khác nhau có thể xuất hiện trong phản hồi, và chúng được phân loại là:

- {{glossary("Response header", "Tiêu đề phản hồi")}} cung cấp ngữ cảnh bổ sung về thông điệp hoặc thêm logic phụ cho cách client thực hiện các yêu cầu tiếp theo.
  Ví dụ, các tiêu đề như {{HTTPHeader("Server")}} bao gồm thông tin về phần mềm máy chủ, trong khi {{HTTPHeader("Date")}} bao gồm thời điểm tạo phản hồi.
  Ngoài ra còn có thông tin về tài nguyên đang được trả về, chẳng hạn như loại nội dung của nó ({{HTTPHeader("Content-Type")}}), hoặc cách nó nên được lưu vào bộ nhớ đệm ({{HTTPHeader("Cache-Control")}}).
- {{glossary("Representation header", "Tiêu đề đại diện")}} nếu thông điệp có nội dung, chúng mô tả dạng của dữ liệu thông điệp và bất kỳ mã hóa nào được áp dụng.
  Ví dụ, cùng một tài nguyên có thể được định dạng theo một loại phương tiện cụ thể như XML hoặc JSON, được bản địa hóa sang một ngôn ngữ viết hoặc khu vực địa lý cụ thể, và/hoặc được nén hoặc mã hóa theo cách khác cho việc truyền tải.
  Điều này cho phép người nhận hiểu cách tái tạo tài nguyên như nó ở trước khi được truyền qua mạng.

### Nội dung phản hồi

Nội dung phản hồi được bao gồm trong hầu hết các thông điệp khi trả lời cho client.
Trong các yêu cầu thành công, nội dung phản hồi chứa dữ liệu mà client đã yêu cầu trong yêu cầu `GET`.
Nếu có vấn đề với yêu cầu của client, thường nội dung phản hồi mô tả lý do tại sao yêu cầu thất bại và gợi ý liệu nó là vĩnh viễn hay tạm thời.

Nội dung phản hồi có thể là:

- Nội dung tài nguyên đơn được xác định bởi hai tiêu đề: {{HTTPHeader("Content-Type")}} và {{HTTPHeader("Content-Length")}}, hoặc độ dài không xác định và được mã hóa theo chunks với {{HTTPHeader("Transfer-Encoding")}} được đặt thành `chunked`.
- [Nội dung nhiều tài nguyên](/en-US/docs/Web/HTTP/Guides/MIME_types#multipartform-data), bao gồm nội dung chứa nhiều phần, mỗi phần chứa một phần thông tin khác nhau.
  Nội dung nhiều phần thường được liên kết với [Biểu mẫu HTML](/en-US/docs/Learn_web_development/Extensions/Forms), nhưng cũng có thể được gửi để trả lời các [Yêu cầu phạm vi](/en-US/docs/Web/HTTP/Guides/Range_requests).

Các phản hồi với mã trạng thái trả lời yêu cầu mà không cần bao gồm nội dung thông điệp, chẳng hạn như {{HTTPStatus("201", "201 Created")}} hoặc {{HTTPStatus("204", "204 No Content")}}, không có nội dung.

## Thông điệp HTTP/2

HTTP/1.x sử dụng các thông điệp dựa trên văn bản dễ đọc và xây dựng, nhưng kết quả là có một vài nhược điểm.
Bạn có thể nén nội dung thông điệp bằng `gzip` hoặc các thuật toán nén khác, nhưng không nén tiêu đề.
Các tiêu đề thường giống nhau hoặc giống hệt nhau trong tương tác client-server, nhưng chúng được lặp lại trong các thông điệp liên tiếp trên một kết nối.
Có nhiều phương pháp đã biết để nén văn bản lặp đi lặp lại rất hiệu quả, để lại một lượng lớn tiết kiệm băng thông chưa được sử dụng.

HTTP/1.x cũng có vấn đề gọi là [chặn đầu hàng (HOL)](/en-US/docs/Glossary/Head_of_line_blocking), nơi client phải chờ phản hồi từ máy chủ trước khi gửi yêu cầu tiếp theo.
HTTP [pipeline](/en-US/docs/Web/HTTP/Guides/Connection_management_in_HTTP_1.x#http_pipelining) đã cố gắng giải quyết điều này, nhưng hỗ trợ kém và độ phức tạp có nghĩa là nó hiếm khi được sử dụng và khó thực hiện đúng.
Cần mở nhiều kết nối để gửi các yêu cầu đồng thời; và các kết nối ấm (đã thiết lập và bận) hiệu quả hơn các kết nối lạnh do TCP slow start.

Trong HTTP/1.1 nếu bạn muốn thực hiện hai yêu cầu song song, bạn phải mở hai kết nối:

![Thực hiện hai yêu cầu HTTP đến máy chủ song song](https://mdn.github.io/shared-assets/images/diagrams/http/messages/http-1-connection.png)

Điều này có nghĩa là trình duyệt bị giới hạn trong số lượng tài nguyên chúng có thể tải xuống và hiển thị cùng một lúc, thường bị giới hạn ở 6 kết nối song song.

HTTP/2 cho phép bạn sử dụng một kết nối TCP duy nhất cho nhiều yêu cầu và phản hồi cùng một lúc.
Điều này được thực hiện bằng cách bọc các thông điệp vào một khung nhị phân và gửi các yêu cầu và phản hồi trong một **luồng** được đánh số trên một kết nối.
Các khung dữ liệu và tiêu đề được xử lý riêng biệt, cho phép tiêu đề được nén thông qua thuật toán gọi là HPACK.
Sử dụng cùng một kết nối TCP để xử lý nhiều yêu cầu cùng một lúc được gọi là _ghép kênh_.

![Ghép kênh các yêu cầu và phản hồi trong HTTP/2 sử dụng một kết nối TCP duy nhất.](https://mdn.github.io/shared-assets/images/diagrams/http/messages/http-2-connection.png)

Các yêu cầu không nhất thiết phải tuần tự: luồng 9 không phải chờ luồng 7 hoàn thành, chẳng hạn.
Dữ liệu từ nhiều luồng thường được xen kẽ trên kết nối, do đó luồng 9 và 7 có thể được client nhận cùng một lúc.
Có một cơ chế để giao thức đặt ưu tiên cho mỗi luồng hoặc tài nguyên.
Các tài nguyên ưu tiên thấp chiếm ít băng thông hơn so với các tài nguyên ưu tiên cao hơn khi chúng được gửi qua các luồng khác nhau, hoặc chúng có thể được gửi tuần tự trên cùng một kết nối nếu có các tài nguyên quan trọng cần được xử lý trước.

Nhìn chung, mặc dù tất cả các cải tiến và trừu tượng hóa được thêm vào HTTP/1.x, thực tế không cần thay đổi trong các API được sử dụng bởi các nhà phát triển để sử dụng HTTP/2 qua HTTP/1.x.
Khi HTTP/2 có sẵn trong cả trình duyệt và máy chủ, nó được bật và sử dụng tự động.

### Tiêu đề giả

Một thay đổi đáng chú ý đối với các thông điệp trong HTTP/2 là việc sử dụng tiêu đề giả.
Trong khi HTTP/1.x sử dụng dòng bắt đầu thông điệp, HTTP/2 sử dụng các trường tiêu đề giả đặc biệt bắt đầu bằng `:`.
Trong các yêu cầu, có các tiêu đề giả sau:

- `:method` - phương thức HTTP.
- `:scheme` - phần scheme của URI mục tiêu, thường là HTTP(S).
- `:authority` - phần authority của URI mục tiêu.
- `:path` - các phần đường dẫn và query của URI mục tiêu.

Trong các phản hồi, chỉ có một tiêu đề giả, đó là `:status` cung cấp mã của phản hồi.

Chúng ta có thể thực hiện yêu cầu HTTP/2 bằng cách sử dụng [nghttp](https://github.com/nghttp2/nghttp2) để tải `example.com`, sẽ in yêu cầu ra theo dạng dễ đọc hơn.
Bạn có thể thực hiện yêu cầu bằng lệnh này trong đó tùy chọn `-n` loại bỏ dữ liệu đã tải xuống và `-v` là cho đầu ra 'verbose', hiển thị việc tiếp nhận và truyền khung:

```bash
nghttp -nv https://www.example.com
```

Nếu bạn xem qua đầu ra, bạn sẽ thấy thời gian cho mỗi khung được truyền và nhận:

```plain
[  0.123] <send|recv> <frame-type> <frame-details>
```

Chúng ta không cần đi vào quá nhiều chi tiết về đầu ra này, nhưng hãy chú ý đến khung `HEADERS` ở định dạng `[  0.123] send HEADERS frame ...`.
Trong các dòng sau khi truyền tiêu đề, bạn sẽ thấy các dòng sau:

```http
[  0.447] send HEADERS frame ...
          ...
          :method: GET
          :path: /
          :scheme: https
          :authority: www.example.com
          accept: */*
          accept-encoding: gzip, deflate
          user-agent: nghttp2/1.61.0
```

Điều này sẽ quen thuộc nếu bạn đã quen làm việc với HTTP/1.x và các khái niệm được đề cập trong phần trước của hướng dẫn này vẫn áp dụng.
Đây là khung nhị phân với yêu cầu `GET` cho `example.com`, được chuyển đổi thành dạng có thể đọc được bởi `nghttp`.
Nếu bạn xem thêm đầu ra của lệnh, bạn sẽ thấy tiêu đề giả `:status` trong một trong các luồng nhận từ máy chủ:

```http
[  0.433] recv (stream_id=13) :status: 200
[  0.433] recv (stream_id=13) content-encoding: gzip
[  0.433] recv (stream_id=13) age: 112721
[  0.433] recv (stream_id=13) cache-control: max-age=604800
[  0.433] recv (stream_id=13) content-type: text/html; charset=UTF-8
[  0.433] recv (stream_id=13) date: Fri, 13 Sep 2024 12:56:07 GMT
[  0.433] recv (stream_id=13) etag: "3147526947+gzip"
...
```

Và nếu bạn xóa thời gian và ID luồng khỏi thông điệp này, nó sẽ còn quen thuộc hơn:

```http
:status: 200
content-encoding: gzip
age: 112721
```

Đi sâu hơn vào các khung thông điệp, ID luồng và cách kết nối được quản lý nằm ngoài phạm vi của hướng dẫn này, nhưng để hiểu và gỡ lỗi thông điệp HTTP/2, bạn đã được trang bị tốt bằng kiến thức và công cụ trong bài viết này.

## Kết luận

Hướng dẫn này cung cấp tổng quan chung về giải phẫu của các thông điệp HTTP, sử dụng định dạng HTTP/1.1 để minh họa.
Chúng ta cũng đã khám phá việc đóng khung thông điệp HTTP/2, giới thiệu một lớp giữa cú pháp HTTP/1.x và giao thức vận chuyển bên dưới mà không thay đổi cơ bản ngữ nghĩa của HTTP.
HTTP/2 được giới thiệu để giải quyết các vấn đề {{glossary("head of line blocking", "chặn đầu hàng")}} có trong HTTP/1.x bằng cách cho phép ghép kênh các yêu cầu.

Một vấn đề còn lại trong HTTP/2 là mặc dù chặn đầu hàng đã được sửa ở cấp độ giao thức, vẫn còn tắc nghẽn hiệu suất do chặn đầu hàng trong TCP (ở cấp độ vận chuyển).
HTTP/3 giải quyết hạn chế này bằng cách sử dụng QUIC, một giao thức xây dựng trên UDP, thay vì TCP.
Thay đổi này cải thiện hiệu suất, giảm thời gian thiết lập kết nối và tăng cường sự ổn định trên các mạng bị suy giảm hoặc không đáng tin cậy.
HTTP/3 giữ nguyên cùng ngữ nghĩa HTTP cốt lõi, vì vậy các tính năng như phương thức yêu cầu, mã trạng thái và tiêu đề vẫn nhất quán trên tất cả ba phiên bản HTTP chính.

Nếu bạn hiểu ngữ nghĩa của HTTP/1.1, bạn đã có nền tảng vững chắc để nắm bắt HTTP/2 và HTTP/3.
Sự khác biệt chính nằm ở **cách** các ngữ nghĩa này được triển khai ở cấp độ vận chuyển.
Bằng cách theo dõi các ví dụ và khái niệm trong hướng dẫn này, bạn giờ đây cảm thấy được trang bị để làm việc với HTTP và hiểu ý nghĩa của các thông điệp, và cách các ứng dụng sử dụng HTTP để gửi và nhận dữ liệu.

## Xem thêm

- [Lịch sử phát triển của HTTP](/en-US/docs/Web/HTTP/Guides/Evolution_of_HTTP)
- [Cơ chế nâng cấp giao thức](/en-US/docs/Web/HTTP/Guides/Protocol_upgrade_mechanism)
- Các thuật ngữ từ điển:
  - {{glossary('HTTP')}}
  - {{glossary('HTTP_2', 'HTTP/2')}}
  - {{glossary('QUIC')}}
