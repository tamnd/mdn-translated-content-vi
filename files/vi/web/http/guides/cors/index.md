---
title: Cross-Origin Resource Sharing (CORS)
slug: Web/HTTP/Guides/CORS
page-type: guide
browser-compat: http.headers.Access-Control-Allow-Origin
sidebar: http
---

**Cross-Origin Resource Sharing** ({{Glossary("CORS")}}) là một cơ chế dựa trên {{Glossary("HTTP")}} header cho phép máy chủ chỉ định bất kỳ {{glossary("origin", "nguồn gốc")}} nào (domain, scheme, hoặc cổng) khác với nguồn gốc của chính nó mà trình duyệt nên cho phép tải tài nguyên. CORS cũng dựa trên một cơ chế mà theo đó trình duyệt thực hiện yêu cầu "preflight" đến máy chủ lưu trữ tài nguyên xuyên nguồn gốc, để kiểm tra xem máy chủ có cho phép yêu cầu thực tế không. Trong preflight đó, trình duyệt gửi các header cho biết phương thức HTTP và các header sẽ được sử dụng trong yêu cầu thực tế.

Ví dụ về yêu cầu xuyên nguồn gốc: mã JavaScript phía client được phục vụ từ `https://domain-a.com` sử dụng {{domxref("Window/fetch", "fetch()")}} để thực hiện yêu cầu đến `https://domain-b.com/data.json`.

Vì lý do bảo mật, trình duyệt hạn chế các yêu cầu HTTP xuyên nguồn gốc được khởi tạo từ các script. Ví dụ, `fetch()` và {{domxref("XMLHttpRequest")}} tuân theo [chính sách cùng nguồn gốc](/en-US/docs/Web/Security/Defenses/Same-origin_policy). Điều này có nghĩa là một ứng dụng web sử dụng các API đó chỉ có thể yêu cầu tài nguyên từ cùng nguồn gốc mà ứng dụng được tải, trừ khi phản hồi từ các nguồn gốc khác bao gồm các CORS header phù hợp.

![Biểu đồ minh họa cơ chế CORS](https://mdn.github.io/shared-assets/images/diagrams/http/cors/fetching-page-cors.svg)

Cơ chế CORS hỗ trợ các yêu cầu và truyền dữ liệu xuyên nguồn gốc an toàn giữa trình duyệt và máy chủ. Trình duyệt sử dụng CORS trong các API như `fetch()` hoặc `XMLHttpRequest` để giảm thiểu rủi ro của các yêu cầu HTTP xuyên nguồn gốc.

## Những yêu cầu nào sử dụng CORS?

[Tiêu chuẩn chia sẻ xuyên nguồn gốc](https://fetch.spec.whatwg.org/#http-cors-protocol) này có thể kích hoạt các yêu cầu HTTP xuyên nguồn gốc cho:

- Gọi `fetch()` hoặc `XMLHttpRequest`, như đã thảo luận ở trên.
- Web Fonts (để sử dụng font xuyên domain trong `@font-face` trong CSS), như được mô tả trong [yêu cầu tải font](https://drafts.csswg.org/css-fonts/#font-fetching-requirements), để máy chủ có thể triển khai font TrueType chỉ có thể được tải xuyên nguồn gốc và sử dụng bởi các trang web được phép làm như vậy.
- [Texture WebGL](/en-US/docs/Web/API/WebGL_API/Tutorial/Using_textures_in_WebGL).
- Hình ảnh/khung video được vẽ vào canvas bằng {{domxref("CanvasRenderingContext2D.drawImage()", "drawImage()")}}.
- [CSS Shapes từ hình ảnh.](/en-US/docs/Web/CSS/Guides/Shapes/From_images)

Đây là bài viết tổng quan về Cross-Origin Resource Sharing, bao gồm thảo luận về các HTTP header cần thiết.

## Tổng quan về chức năng

Tiêu chuẩn Cross-Origin Resource Sharing hoạt động bằng cách thêm các [HTTP header](/en-US/docs/Web/HTTP/Reference/Headers) mới cho phép máy chủ mô tả các nguồn gốc nào được phép đọc thông tin đó từ trình duyệt web. Ngoài ra, đối với các phương thức yêu cầu HTTP có thể gây ra tác dụng phụ trên dữ liệu máy chủ (cụ thể, các phương thức HTTP khác ngoài {{HTTPMethod("GET")}}, hoặc {{HTTPMethod("POST")}} với một số [loại MIME](/en-US/docs/Web/HTTP/Guides/MIME_types) nhất định), quy định yêu cầu trình duyệt phải "preflight" yêu cầu, hỏi máy chủ về các phương thức được hỗ trợ bằng phương thức yêu cầu HTTP {{HTTPMethod("OPTIONS")}}, rồi sau khi được máy chủ "chấp thuận", mới gửi yêu cầu thực tế. Máy chủ cũng có thể thông báo cho client biết liệu "thông tin xác thực" (chẳng hạn như [Cookie](/en-US/docs/Web/HTTP/Guides/Cookies) và [Xác thực HTTP](/en-US/docs/Web/HTTP/Guides/Authentication)) có nên được gửi kèm các yêu cầu hay không.

Lỗi CORS dẫn đến lỗi nhưng vì lý do bảo mật, thông tin cụ thể về lỗi _không có sẵn cho JavaScript_. Tất cả những gì code biết là đã xảy ra lỗi. Cách duy nhất để xác định chính xác điều gì xảy ra là xem bảng điều khiển của trình duyệt để biết thêm chi tiết.

Các phần tiếp theo thảo luận về các tình huống, đồng thời cung cấp phân tích về các HTTP header được sử dụng.

## Ví dụ về các tình huống kiểm soát truy cập

Chúng tôi trình bày ba tình huống minh họa cách hoạt động của Cross-Origin Resource Sharing. Tất cả các ví dụ này đều sử dụng {{domxref("Window/fetch", "fetch()")}}, có thể thực hiện các yêu cầu xuyên nguồn gốc trong bất kỳ trình duyệt nào hỗ trợ.

### Yêu cầu đơn giản

Một số yêu cầu không kích hoạt {{Glossary("Preflight_request","CORS preflight")}}. Chúng được gọi là _yêu cầu đơn giản_ từ [đặc tả CORS](https://www.w3.org/TR/2014/REC-cors-20140116/#terminology) đã lỗi thời, mặc dù [đặc tả Fetch](https://fetch.spec.whatwg.org/) (hiện định nghĩa CORS) không sử dụng thuật ngữ đó.

Lý do là phần tử {{HTMLElement("form")}} từ HTML 4.0 (có trước `fetch()` và {{domxref("XMLHttpRequest")}} xuyên site) có thể gửi các yêu cầu đơn giản đến bất kỳ nguồn gốc nào, vì vậy bất kỳ ai viết máy chủ đều phải bảo vệ chống lại {{Glossary("CSRF", "giả mạo yêu cầu xuyên site")}} (CSRF). Dựa trên giả định này, máy chủ không cần phải chọn tham gia (bằng cách phản hồi yêu cầu preflight) để nhận bất kỳ yêu cầu nào trông giống như gửi form, vì mối đe dọa CSRF không tệ hơn so với gửi form. Tuy nhiên, máy chủ vẫn phải chọn tham gia bằng cách sử dụng {{HTTPHeader("Access-Control-Allow-Origin")}} để _chia sẻ_ phản hồi với script.

Một _yêu cầu đơn giản_ là yêu cầu **đáp ứng tất cả các điều kiện sau**:

- Một trong các phương thức được phép:
  - {{HTTPMethod("GET")}}
  - {{HTTPMethod("HEAD")}}
  - {{HTTPMethod("POST")}}

- Ngoài các header được tự động đặt bởi user agent (ví dụ như {{HTTPHeader("Connection")}}, {{HTTPHeader("User-Agent")}}, hoặc các {{glossary("Forbidden request header", "header yêu cầu bị cấm")}}), các header duy nhất được phép đặt thủ công là các [header yêu cầu CORS được đưa vào danh sách an toàn](/en-US/docs/Glossary/CORS-safelisted_request_header), bao gồm:
  - {{HTTPHeader("Accept")}}
  - {{HTTPHeader("Accept-Language")}}
  - {{HTTPHeader("Content-Language")}}
  - {{HTTPHeader("Content-Type")}} (lưu ý các yêu cầu bổ sung bên dưới)
  - {{HTTPHeader("Range")}} (chỉ với [giá trị header phạm vi đơn](https://fetch.spec.whatwg.org/#simple-range-header-value); ví dụ: `bytes=256-` hoặc `bytes=127-255`)

- Các kết hợp loại/loại con duy nhất được phép cho {{Glossary("MIME type","loại phương tiện")}} được chỉ định trong header {{HTTPHeader("Content-Type")}} là:
  - `application/x-www-form-urlencoded`
  - `multipart/form-data`
  - `text/plain`

- Nếu yêu cầu được thực hiện bằng đối tượng {{domxref("XMLHttpRequest")}}, không có event listener nào được đăng ký trên đối tượng được trả về bởi thuộc tính {{domxref("XMLHttpRequest.upload")}} được sử dụng trong yêu cầu; tức là, với một phiên bản {{domxref("XMLHttpRequest")}} `xhr`, không có code nào gọi `xhr.upload.addEventListener()` để thêm event listener theo dõi quá trình tải lên.
- Không có đối tượng {{domxref("ReadableStream")}} nào được sử dụng trong yêu cầu.

> [!NOTE]
> WebKit Nightly và Safari Technology Preview đặt thêm các hạn chế đối với các giá trị được phép trong header {{HTTPHeader("Accept")}}, {{HTTPHeader("Accept-Language")}} và {{HTTPHeader("Content-Language")}}. Nếu bất kỳ header nào trong số đó có giá trị "không chuẩn", WebKit/Safari không coi yêu cầu là "yêu cầu đơn giản". Những giá trị nào mà WebKit/Safari coi là "không chuẩn" không được ghi lại, ngoại trừ trong các lỗi WebKit sau:
>
> - [Require preflight for non-standard CORS-safelisted request headers Accept, Accept-Language, and Content-Language](https://webkit.org/b/165178)
> - [Allow commas in Accept, Accept-Language, and Content-Language request headers for simple CORS](https://webkit.org/b/165566)
> - [Switch to a blacklist model for restricted Accept headers in simple CORS requests](https://webkit.org/b/166363)
>
> Không có trình duyệt nào khác thực hiện các hạn chế bổ sung này vì chúng không phải là một phần của đặc tả.

Ví dụ: giả sử nội dung web tại `https://foo.example` muốn tải nội dung JSON từ domain `https://bar.other`. Code kiểu này có thể được sử dụng trong JavaScript triển khai trên `foo.example`:

```js
const fetchPromise = fetch("https://bar.other");

fetchPromise
  .then((response) => response.json())
  .then((data) => {
    console.log(data);
  });
```

Thao tác này thực hiện trao đổi đơn giản giữa client và máy chủ, sử dụng CORS header để xử lý quyền:

![Sơ đồ yêu cầu CORS GET đơn giản](https://mdn.github.io/shared-assets/images/diagrams/http/cors/simple-request.svg)

Hãy xem những gì trình duyệt sẽ gửi đến máy chủ trong trường hợp này:

```http
GET /resources/public-data/ HTTP/1.1
Host: bar.other
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:71.0) Gecko/20100101 Firefox/71.0
Accept: text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8
Accept-Language: en-us,en;q=0.5
Accept-Encoding: gzip,deflate
Connection: keep-alive
Origin: https://foo.example
```

Header yêu cầu đáng chú ý là {{HTTPHeader("Origin")}}, cho biết lời gọi đến từ `https://foo.example`.

Bây giờ hãy xem máy chủ phản hồi như thế nào:

```http
HTTP/1.1 200 OK
Date: Mon, 01 Dec 2008 00:23:53 GMT
Server: Apache/2
Access-Control-Allow-Origin: *
Keep-Alive: timeout=2, max=100
Connection: Keep-Alive
Transfer-Encoding: chunked
Content-Type: application/xml

[…XML Data…]
```

Trong phản hồi, máy chủ trả về header {{HTTPHeader("Access-Control-Allow-Origin")}} với `Access-Control-Allow-Origin: *`, có nghĩa là tài nguyên có thể được truy cập bởi **bất kỳ** nguồn gốc nào.

```http
Access-Control-Allow-Origin: *
```

Mẫu này của header {{HTTPHeader("Origin")}} và {{HTTPHeader("Access-Control-Allow-Origin")}} là cách sử dụng đơn giản nhất của giao thức kiểm soát truy cập. Nếu chủ sở hữu tài nguyên tại `https://bar.other` muốn hạn chế quyền truy cập tài nguyên chỉ cho các yêu cầu _từ_ `https://foo.example` (nghĩa là không có domain nào khác ngoài `https://foo.example` có thể truy cập tài nguyên theo kiểu xuyên nguồn gốc), họ sẽ gửi:

```http
Access-Control-Allow-Origin: https://foo.example
```

> [!NOTE]
> Khi phản hồi [yêu cầu có thông tin xác thực](#requests_with_credentials), máy chủ **phải** chỉ định nguồn gốc trong giá trị của header `Access-Control-Allow-Origin`, thay vì chỉ định ký tự đại diện `*`.

### Yêu cầu có preflight

Không giống như [_yêu cầu đơn giản_](#simple_requests), đối với các yêu cầu "có preflight", trình duyệt trước tiên gửi yêu cầu HTTP bằng phương thức {{HTTPMethod("OPTIONS")}} đến tài nguyên trên nguồn gốc khác, để xác định xem yêu cầu thực tế có an toàn để gửi hay không. Các yêu cầu xuyên nguồn gốc như vậy được preflight vì chúng có thể có tác động đến dữ liệu người dùng.

Sau đây là ví dụ về yêu cầu sẽ được preflight:

```js
const fetchPromise = fetch("https://bar.other/doc", {
  method: "POST",
  mode: "cors",
  headers: {
    "Content-Type": "text/xml",
    "X-PINGOTHER": "pingpong",
  },
  body: "<person><name>Arun</name></person>",
});

fetchPromise.then((response) => {
  console.log(response.status);
});
```

Ví dụ trên tạo một body XML để gửi với yêu cầu `POST`. Ngoài ra, một header yêu cầu HTTP không chuẩn `X-PINGOTHER` được đặt. Các header như vậy không phải là một phần của HTTP/1.1, nhưng thường hữu ích cho các ứng dụng web. Vì yêu cầu sử dụng `Content-Type` là `text/xml` và vì một header tùy chỉnh được đặt, yêu cầu này được preflight.

![Sơ đồ yêu cầu được preflight](https://mdn.github.io/shared-assets/images/diagrams/http/cors/preflight-correct.svg)

> [!NOTE]
> Như được mô tả bên dưới, yêu cầu `POST` thực tế không bao gồm các header `Access-Control-Request-*`; chúng chỉ cần thiết cho yêu cầu `OPTIONS`.

Hãy xem toàn bộ quá trình trao đổi giữa client và máy chủ. Trao đổi đầu tiên là _yêu cầu/phản hồi preflight_:

```http
OPTIONS /doc HTTP/1.1
Host: bar.other
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:71.0) Gecko/20100101 Firefox/71.0
Accept: text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8
Accept-Language: en-us,en;q=0.5
Accept-Encoding: gzip,deflate
Connection: keep-alive
Origin: https://foo.example
Access-Control-Request-Method: POST
Access-Control-Request-Headers: content-type,x-pingother

HTTP/1.1 204 No Content
Date: Mon, 01 Dec 2008 01:15:39 GMT
Server: Apache/2
Access-Control-Allow-Origin: https://foo.example
Access-Control-Allow-Methods: POST, GET, OPTIONS
Access-Control-Allow-Headers: X-PINGOTHER, Content-Type
Access-Control-Max-Age: 86400
Vary: Accept-Encoding, Origin
Keep-Alive: timeout=2, max=100
Connection: Keep-Alive
```

Khối đầu tiên ở trên đại diện cho yêu cầu preflight với phương thức {{HTTPMethod("OPTIONS")}}. Trình duyệt xác định rằng nó cần gửi yêu cầu này dựa trên các tham số yêu cầu mà đoạn code JavaScript ở trên đang sử dụng, để máy chủ có thể phản hồi liệu có chấp nhận gửi yêu cầu với các tham số yêu cầu thực tế hay không. OPTIONS là phương thức HTTP/1.1 được sử dụng để xác định thêm thông tin từ máy chủ và là phương thức {{Glossary("Safe/HTTP", "an toàn")}}, có nghĩa là nó không thể được sử dụng để thay đổi tài nguyên. Lưu ý rằng cùng với yêu cầu OPTIONS, hai header yêu cầu khác được gửi:

```http
Access-Control-Request-Method: POST
Access-Control-Request-Headers: content-type,x-pingother
```

Header {{HTTPHeader("Access-Control-Request-Method")}} thông báo cho máy chủ như một phần của yêu cầu preflight rằng khi yêu cầu thực tế được gửi, nó sẽ sử dụng phương thức yêu cầu `POST`. Header {{HTTPHeader("Access-Control-Request-Headers")}} thông báo cho máy chủ rằng khi yêu cầu thực tế được gửi, nó sẽ được gửi kèm các header tùy chỉnh `X-PINGOTHER` và `Content-Type`. Bây giờ máy chủ có cơ hội xác định xem nó có thể chấp nhận yêu cầu trong các điều kiện này không.

Khối thứ hai ở trên là phản hồi mà máy chủ trả về, cho biết phương thức yêu cầu (`POST`) và các header yêu cầu (`X-PINGOTHER`) được chấp nhận. Hãy xem kỹ hơn các dòng sau:

```http
Access-Control-Allow-Origin: https://foo.example
Access-Control-Allow-Methods: POST, GET, OPTIONS
Access-Control-Allow-Headers: X-PINGOTHER, Content-Type
Access-Control-Max-Age: 86400
```

Máy chủ phản hồi với `Access-Control-Allow-Origin: https://foo.example`, giới hạn quyền truy cập chỉ cho domain nguồn gốc yêu cầu. Nó cũng phản hồi với `Access-Control-Allow-Methods`, cho biết rằng `POST` và `GET` là các phương thức hợp lệ để truy vấn tài nguyên được hỏi (header này tương tự như header phản hồi {{HTTPHeader("Allow")}}, nhưng được sử dụng nghiêm ngặt trong bối cảnh kiểm soát truy cập).

Máy chủ cũng gửi `Access-Control-Allow-Headers` với giá trị `X-PINGOTHER, Content-Type`, xác nhận rằng đây là các header được phép sử dụng với yêu cầu thực tế. Giống như `Access-Control-Allow-Methods`, `Access-Control-Allow-Headers` là danh sách các header được phép, phân tách bằng dấu phẩy.

Cuối cùng, {{HTTPHeader("Access-Control-Max-Age")}} cho biết giá trị tính bằng giây về thời gian phản hồi cho yêu cầu preflight có thể được lưu vào cache mà không cần gửi yêu cầu preflight khác. Giá trị mặc định là 5 giây. Trong trường hợp hiện tại, thời gian tối đa là 86400 giây (= 24 giờ). Lưu ý rằng mỗi trình duyệt có [giá trị nội bộ tối đa](/en-US/docs/Web/HTTP/Reference/Headers/Access-Control-Max-Age) chiếm ưu tiên khi `Access-Control-Max-Age` vượt quá giá trị đó.

Sau khi yêu cầu preflight hoàn tất, yêu cầu thực sự được gửi:

```http
POST /doc HTTP/1.1
Host: bar.other
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:71.0) Gecko/20100101 Firefox/71.0
Accept: text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8
Accept-Language: en-us,en;q=0.5
Accept-Encoding: gzip,deflate
Connection: keep-alive
X-PINGOTHER: pingpong
Content-Type: text/xml; charset=UTF-8
Referer: https://foo.example/examples/preflightInvocation.html
Content-Length: 55
Origin: https://foo.example
Pragma: no-cache
Cache-Control: no-cache

<person><name>Arun</name></person>

HTTP/1.1 200 OK
Date: Mon, 01 Dec 2008 01:15:40 GMT
Server: Apache/2
Access-Control-Allow-Origin: https://foo.example
Vary: Accept-Encoding, Origin
Content-Encoding: gzip
Content-Length: 235
Keep-Alive: timeout=2, max=99
Connection: Keep-Alive
Content-Type: text/plain

[Some XML content]
```

#### Yêu cầu có preflight và chuyển hướng

Không phải tất cả trình duyệt hiện tại đều hỗ trợ theo dõi chuyển hướng sau yêu cầu có preflight. Nếu chuyển hướng xảy ra sau yêu cầu như vậy, một số trình duyệt hiện tại sẽ báo cáo thông báo lỗi như sau:

> The request was redirected to `https://example.com/foo`, which is disallowed for cross-origin requests that require preflight.
> Request requires preflight, which is disallowed to follow cross-origin redirects.

Giao thức CORS ban đầu yêu cầu hành vi đó nhưng [sau đó đã được thay đổi để không còn yêu cầu nữa](https://github.com/whatwg/fetch/commit/0d9a4db8bc02251cc9e391543bb3c1322fb882f2). Tuy nhiên, không phải tất cả trình duyệt đều đã triển khai thay đổi này, và do đó vẫn thể hiện hành vi được yêu cầu ban đầu.

Cho đến khi trình duyệt cập nhật theo đặc tả, bạn có thể khắc phục hạn chế này bằng cách thực hiện một hoặc cả hai điều sau:

- Thay đổi hành vi phía máy chủ để tránh preflight và/hoặc tránh chuyển hướng
- Thay đổi yêu cầu để nó là [yêu cầu đơn giản](#simple_requests) không gây ra preflight

Nếu điều đó không thể thực hiện được, thì một cách khác là:

1. Thực hiện [yêu cầu đơn giản](#simple_requests) (sử dụng {{domxref("Response.url")}} cho Fetch API, hoặc {{domxref("XMLHttpRequest.responseURL")}}) để xác định URL mà yêu cầu có preflight thực sự sẽ kết thúc.
2. Thực hiện yêu cầu khác (yêu cầu _thực_) sử dụng URL bạn đã có được từ `Response.url` hoặc `XMLHttpRequest.responseURL` ở bước đầu tiên.

Tuy nhiên, nếu yêu cầu là yêu cầu kích hoạt preflight do sự hiện diện của header `Authorization` trong yêu cầu, bạn sẽ không thể khắc phục hạn chế bằng các bước trên. Và bạn sẽ không thể khắc phục hoàn toàn trừ khi bạn có quyền kiểm soát máy chủ mà yêu cầu được gửi đến.

### Yêu cầu có thông tin xác thực

> [!NOTE]
> Khi thực hiện các yêu cầu có thông tin xác thực đến domain khác, chính sách cookie của bên thứ ba vẫn sẽ áp dụng. Chính sách luôn được thực thi bất kể cài đặt nào trên máy chủ và client như được mô tả trong chương này.

Khả năng thú vị nhất được cung cấp bởi cả {{domxref("Window/fetch", "fetch()")}} hay {{domxref("XMLHttpRequest")}} và CORS là khả năng thực hiện các yêu cầu "có thông tin xác thực" nhận biết về [HTTP cookie](/en-US/docs/Web/HTTP/Guides/Cookies) và thông tin Xác thực HTTP. Theo mặc định, trong các cuộc gọi `fetch()` hoặc `XMLHttpRequest` xuyên nguồn gốc, trình duyệt sẽ _không_ gửi thông tin xác thực.

Để yêu cầu `fetch()` bao gồm thông tin xác thực, đặt tùy chọn [`credentials`](/en-US/docs/Web/API/RequestInit#credentials) thành `"include"`.

Để yêu cầu `XMLHttpRequest` bao gồm thông tin xác thực, đặt thuộc tính {{domxref("XMLHttpRequest.withCredentials")}} thành `true`.

Trong ví dụ này, nội dung ban đầu được tải từ `https://foo.example` thực hiện yêu cầu GET đến tài nguyên trên `https://bar.other` có đặt Cookie. Nội dung trên foo.example có thể chứa JavaScript như sau:

```js
const url = "https://bar.other/resources/credentialed-content/";

const request = new Request(url, { credentials: "include" });

const fetchPromise = fetch(request);
fetchPromise.then((response) => console.log(response));
```

Code này tạo đối tượng {{domxref("Request")}}, đặt tùy chọn `credentials` thành `"include"` trong hàm tạo, sau đó truyền yêu cầu này vào `fetch()`. Vì đây là yêu cầu `GET` đơn giản, nó không được preflight nhưng trình duyệt sẽ **từ chối** bất kỳ phản hồi nào không có header {{HTTPHeader("Access-Control-Allow-Credentials")}} được đặt thành `true`, và **không** làm cho phản hồi có sẵn cho nội dung web đã gọi.

![Sơ đồ yêu cầu GET với Access-Control-Allow-Credentials](https://mdn.github.io/shared-assets/images/diagrams/http/cors/include-credentials.svg)

Dưới đây là ví dụ về trao đổi giữa client và máy chủ:

```http
GET /resources/credentialed-content/ HTTP/1.1
Host: bar.other
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:71.0) Gecko/20100101 Firefox/71.0
Accept: text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8
Accept-Language: en-us,en;q=0.5
Accept-Encoding: gzip,deflate
Connection: keep-alive
Referer: https://foo.example/examples/credential.html
Origin: https://foo.example
Cookie: pageAccess=2

HTTP/1.1 200 OK
Date: Mon, 01 Dec 2008 01:34:52 GMT
Server: Apache/2
Access-Control-Allow-Origin: https://foo.example
Access-Control-Allow-Credentials: true
Cache-Control: no-cache
Pragma: no-cache
Set-Cookie: pageAccess=3; expires=Wed, 31-Dec-2008 01:34:53 GMT
Vary: Accept-Encoding, Origin
Content-Encoding: gzip
Content-Length: 106
Keep-Alive: timeout=2, max=100
Connection: Keep-Alive
Content-Type: text/plain

[text/plain content]
```

Mặc dù header `Cookie` của yêu cầu chứa cookie dành cho nội dung trên `https://bar.other`, nếu bar.other không phản hồi với {{HTTPHeader("Access-Control-Allow-Credentials")}} với giá trị `true`, như được minh họa trong ví dụ này, phản hồi sẽ bị bỏ qua và không được cung cấp cho nội dung web.

#### Yêu cầu preflight và thông tin xác thực

Yêu cầu CORS-preflight không bao giờ được bao gồm thông tin xác thực. _Phản hồi_ cho yêu cầu preflight phải chỉ định `Access-Control-Allow-Credentials: true` để chỉ ra rằng yêu cầu thực tế có thể được thực hiện với thông tin xác thực.

> [!NOTE]
> Một số dịch vụ xác thực doanh nghiệp yêu cầu chứng chỉ client TLS phải được gửi trong các yêu cầu preflight, trái với đặc tả [Fetch](https://fetch.spec.whatwg.org/#cors-protocol-and-credentials).
>
> Firefox 87 cho phép bật hành vi không tuân thủ này bằng cách đặt tùy chọn: `network.cors_preflight.allow_client_cert` thành `true` ([Firefox bug 1511151](https://bugzil.la/1511151)). Các trình duyệt dựa trên Chromium hiện tại luôn gửi chứng chỉ client TLS trong các yêu cầu CORS preflight ([Chrome bug 775438](https://crbug.com/775438)).

#### Yêu cầu có thông tin xác thực và ký tự đại diện

Khi phản hồi yêu cầu có thông tin xác thực:

- Máy chủ **không được** chỉ định ký tự đại diện `*` cho giá trị header phản hồi `Access-Control-Allow-Origin`, mà phải chỉ định một nguồn gốc rõ ràng; ví dụ: `Access-Control-Allow-Origin: https://example.com`
- Máy chủ **không được** chỉ định ký tự đại diện `*` cho giá trị header phản hồi `Access-Control-Allow-Headers`, mà phải chỉ định danh sách tên header rõ ràng; ví dụ: `Access-Control-Allow-Headers: X-PINGOTHER, Content-Type`
- Máy chủ **không được** chỉ định ký tự đại diện `*` cho giá trị header phản hồi `Access-Control-Allow-Methods`, mà phải chỉ định danh sách tên phương thức rõ ràng; ví dụ: `Access-Control-Allow-Methods: POST, GET`
- Máy chủ **không được** chỉ định ký tự đại diện `*` cho giá trị header phản hồi `Access-Control-Expose-Headers`, mà phải chỉ định danh sách tên header rõ ràng; ví dụ: `Access-Control-Expose-Headers: Content-Encoding, Kuma-Revision`

Nếu một yêu cầu bao gồm thông tin xác thực (thường là header `Cookie`) và phản hồi bao gồm header `Access-Control-Allow-Origin: *` (tức là với ký tự đại diện), trình duyệt sẽ chặn quyền truy cập vào phản hồi và báo cáo lỗi CORS trong bảng điều khiển devtools.

Nhưng nếu một yêu cầu thực sự bao gồm thông tin xác thực (như header `Cookie`) và phản hồi bao gồm một nguồn gốc thực thay vì ký tự đại diện (ví dụ: `Access-Control-Allow-Origin: https://example.com`), thì trình duyệt sẽ cho phép truy cập vào phản hồi từ nguồn gốc được chỉ định.

Cũng lưu ý rằng bất kỳ header phản hồi `Set-Cookie` nào trong một phản hồi sẽ không đặt cookie nếu giá trị `Access-Control-Allow-Origin` trong phản hồi đó là ký tự đại diện `*` thay vì nguồn gốc thực tế.

#### Cookie của bên thứ ba

Lưu ý rằng cookie được đặt trong các phản hồi CORS tuân theo các chính sách cookie bên thứ ba thông thường. Trong ví dụ trên, trang được tải từ `foo.example` nhưng header `Set-Cookie` trong phản hồi được gửi bởi `bar.other`, và do đó sẽ không được lưu nếu trình duyệt của người dùng được cấu hình để từ chối tất cả cookie bên thứ ba.

Cookie được đặt trong các yêu cầu và phản hồi CORS tuân theo các chính sách cookie bên thứ ba thông thường.

Các chính sách cookie bên thứ ba có thể ngăn cookie bên thứ ba được gửi trong các yêu cầu, thực tế ngăn một trang web thực hiện các yêu cầu có thông tin xác thực ngay cả khi được cho phép bởi máy chủ bên thứ ba (sử dụng `Access-Control-Allow-Credentials`). Chính sách mặc định khác nhau giữa các trình duyệt, nhưng có thể được đặt bằng thuộc tính [SameSite](/en-US/docs/Web/HTTP/Reference/Headers/Set-Cookie#samesitesamesite-value).

Ngay cả khi các yêu cầu có thông tin xác thực được cho phép, trình duyệt có thể được cấu hình để từ chối tất cả cookie bên thứ ba trong các phản hồi.

## Các header phản hồi HTTP

Phần này liệt kê các header phản hồi HTTP mà máy chủ trả về cho các yêu cầu kiểm soát truy cập theo định nghĩa của đặc tả Cross-Origin Resource Sharing. Phần trước cung cấp tổng quan về những điều này trong thực tế.

### Access-Control-Allow-Origin

Một tài nguyên được trả về có thể có một header {{HTTPHeader("Access-Control-Allow-Origin")}} với cú pháp sau:

```http
Access-Control-Allow-Origin: <origin> | *
```

`Access-Control-Allow-Origin` chỉ định một nguồn gốc duy nhất cho trình duyệt biết cho phép nguồn gốc đó truy cập tài nguyên; hoặc — đối với các yêu cầu **không có** thông tin xác thực — ký tự đại diện `*` cho trình duyệt biết cho phép bất kỳ nguồn gốc nào truy cập tài nguyên.

Ví dụ: để cho phép code từ nguồn gốc `https://mozilla.org` truy cập tài nguyên, bạn có thể chỉ định:

```http
Access-Control-Allow-Origin: https://mozilla.org
Vary: Origin
```

Nếu máy chủ chỉ định một nguồn gốc duy nhất (có thể thay đổi động dựa trên nguồn gốc yêu cầu như một phần của danh sách cho phép) thay vì ký tự đại diện `*`, thì máy chủ cũng nên bao gồm `Origin` trong header phản hồi {{HTTPHeader("Vary")}} để cho client biết rằng các phản hồi của máy chủ sẽ khác nhau dựa trên giá trị của header yêu cầu {{HTTPHeader("Origin")}}.

### Access-Control-Expose-Headers

Header {{HTTPHeader("Access-Control-Expose-Headers")}} thêm các header được chỉ định vào danh sách cho phép mà JavaScript (như {{domxref("Response.headers")}}) trong trình duyệt được phép truy cập.

```http
Access-Control-Expose-Headers: <header-name>[, <header-name>]*
```

Ví dụ: sau đây sẽ cho phép header `X-My-Custom-Header` và `X-Another-Custom-Header` được hiển thị cho trình duyệt:

```http
Access-Control-Expose-Headers: X-My-Custom-Header, X-Another-Custom-Header
```

### Access-Control-Max-Age

Header {{HTTPHeader("Access-Control-Max-Age")}} cho biết thời gian kết quả của yêu cầu preflight có thể được lưu vào cache. Để biết ví dụ về yêu cầu preflight, xem các ví dụ ở trên.

```http
Access-Control-Max-Age: <delta-seconds>
```

Tham số `delta-seconds` cho biết số giây kết quả có thể được lưu vào cache.

### Access-Control-Allow-Credentials

Header {{HTTPHeader("Access-Control-Allow-Credentials")}} cho biết liệu phản hồi cho yêu cầu có thể được hiển thị khi cờ `credentials` là true hay không. Khi được sử dụng như một phần của phản hồi cho yêu cầu preflight, điều này cho biết liệu yêu cầu thực tế có thể được thực hiện bằng thông tin xác thực hay không. Lưu ý rằng các yêu cầu `GET` đơn giản không được preflight, vì vậy nếu một yêu cầu được thực hiện cho tài nguyên có thông tin xác thực, nếu header này không được trả về với tài nguyên, phản hồi bị bỏ qua bởi trình duyệt và không được trả về cho nội dung web.

```http
Access-Control-Allow-Credentials: true
```

[Yêu cầu có thông tin xác thực](#requests_with_credentials) được thảo luận ở trên.

### Access-Control-Allow-Methods

Header {{HTTPHeader("Access-Control-Allow-Methods")}} chỉ định phương thức hoặc các phương thức được phép khi truy cập tài nguyên. Điều này được sử dụng để phản hồi yêu cầu preflight. Các điều kiện mà yêu cầu được preflight được thảo luận ở trên.

```http
Access-Control-Allow-Methods: <method>[, <method>]*
```

Ví dụ về {{Glossary("preflight request")}} được đưa ra ở trên, bao gồm ví dụ gửi header này đến trình duyệt.

### Access-Control-Allow-Headers

Header {{HTTPHeader("Access-Control-Allow-Headers")}} được sử dụng để phản hồi {{Glossary("preflight request")}} để chỉ ra các HTTP header nào có thể được sử dụng khi thực hiện yêu cầu thực tế. Header này là phản hồi phía máy chủ cho header {{HTTPHeader("Access-Control-Request-Headers")}} của trình duyệt.

```http
Access-Control-Allow-Headers: <header-name>[, <header-name>]*
```

## Các header yêu cầu HTTP

Phần này liệt kê các header mà client có thể sử dụng khi phát hành yêu cầu HTTP để sử dụng tính năng chia sẻ xuyên nguồn gốc. Lưu ý rằng các header này được đặt cho bạn khi thực hiện lời gọi đến máy chủ. Các nhà phát triển thực hiện yêu cầu xuyên nguồn gốc không phải đặt bất kỳ header yêu cầu chia sẻ xuyên nguồn gốc nào theo chương trình.

### Origin

Header {{HTTPHeader("Origin")}} chỉ ra nguồn gốc của yêu cầu truy cập xuyên nguồn gốc hoặc yêu cầu preflight.

```http
Origin: <origin>
```

Nguồn gốc là URL chỉ ra máy chủ từ đó yêu cầu được khởi tạo. Nó không bao gồm bất kỳ thông tin đường dẫn nào, chỉ có tên máy chủ.

> [!NOTE]
> Giá trị `origin` có thể là `null`.

Lưu ý rằng trong bất kỳ yêu cầu kiểm soát truy cập nào, header {{HTTPHeader("Origin")}} **luôn** được gửi.

### Access-Control-Request-Method

{{HTTPHeader("Access-Control-Request-Method")}} được sử dụng khi phát hành yêu cầu preflight để cho máy chủ biết phương thức HTTP nào sẽ được sử dụng khi yêu cầu thực tế được thực hiện.

```http
Access-Control-Request-Method: <method>
```

Ví dụ về cách sử dụng này có thể [được tìm thấy ở trên.](#preflighted_requests)

### Access-Control-Request-Headers

Header {{HTTPHeader("Access-Control-Request-Headers")}} được sử dụng khi phát hành yêu cầu preflight để cho máy chủ biết các HTTP header nào sẽ được sử dụng khi yêu cầu thực tế được thực hiện (ví dụ: bằng cách truyền chúng như tùy chọn [`headers`](/en-US/docs/Web/API/RequestInit#headers)). Header phía trình duyệt này sẽ được trả lời bởi header phía máy chủ bổ sung {{HTTPHeader("Access-Control-Allow-Headers")}}.

```http
Access-Control-Request-Headers: <field-name>[,<field-name>]*
```

Ví dụ về cách sử dụng này có thể [được tìm thấy ở trên](#preflighted_requests).

## Thông số kỹ thuật

{{Specifications}}

## Khả năng tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Lỗi CORS](/en-US/docs/Web/HTTP/Guides/CORS/Errors)
- [Enable CORS: I want to add CORS support to my server](https://enable-cors.org/server.html)
- [Fetch API](/en-US/docs/Web/API/Fetch_API)
- {{domxref("XMLHttpRequest")}}
- [Will it CORS?](https://httptoolkit.com/will-it-cors/) - một công cụ giải thích & tạo CORS tương tác
- [How to run Chrome browser without CORS](https://alfilatov.com/posts/run-chrome-without-cors/)
- [Using CORS with All (Modern) Browsers](https://www.telerik.com/blogs/using-cors-with-all-modern-browsers)
- [Câu trả lời Stack Overflow với thông tin "cách thực hiện" để xử lý các vấn đề thường gặp](https://stackoverflow.com/questions/43871637/no-access-control-allow-origin-header-is-present-on-the-requested-resource-whe/43881141#43881141):
  - Cách tránh CORS preflight
  - Cách sử dụng proxy CORS để vượt qua _"No Access-Control-Allow-Origin header"_
  - Cách sửa _"Access-Control-Allow-Origin header must not be the wildcard"_
