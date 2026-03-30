---
title: Tổng quan về client-server
slug: Learn_web_development/Extensions/Server-side/First_steps/Client-Server_overview
page-type: learn-module-chapter
sidebar: learnsidebar
---

{{PreviousMenuNext("Learn_web_development/Extensions/Server-side/First_steps/Introduction", "Learn_web_development/Extensions/Server-side/First_steps/Web_frameworks", "Learn_web_development/Extensions/Server-side/First_steps")}}

Bây giờ bạn đã biết mục đích và lợi ích tiềm năng của lập trình phía máy chủ, chúng ta sẽ xem xét chi tiết điều gì xảy ra khi máy chủ nhận được "yêu cầu động" từ trình duyệt. Vì hầu hết mã phía máy chủ của trang web xử lý yêu cầu và phản hồi theo cách tương tự, điều này sẽ giúp bạn hiểu những gì bạn cần làm khi viết hầu hết mã của riêng bạn.

<table>
  <tbody>
    <tr>
      <th scope="row">Điều kiện tiên quyết:</th>
      <td>
        Hiểu biết cơ bản về máy chủ web là gì.
      </td>
    </tr>
    <tr>
      <th scope="row">Mục tiêu:</th>
      <td>
        Để hiểu các tương tác client-server trong trang web động, và đặc biệt
        là những thao tác nào cần được thực hiện bởi mã phía máy chủ.
      </td>
    </tr>
  </tbody>
</table>

Không có mã thực sự trong phần thảo luận này vì chúng ta chưa chọn framework web để sử dụng để viết mã của chúng ta! Tuy nhiên, thảo luận này vẫn rất có liên quan, vì hành vi được mô tả phải được triển khai bởi mã phía máy chủ của bạn, bất kể bạn chọn ngôn ngữ lập trình hoặc framework web nào.

## Máy chủ web và HTTP (giới thiệu)

Trình duyệt web giao tiếp với [máy chủ web](/en-US/docs/Learn_web_development/Howto/Web_mechanics/What_is_a_web_server) bằng cách sử dụng Giao thức truyền siêu văn bản ([HTTP](/en-US/docs/Web/HTTP)). Khi bạn nhấp vào liên kết trên trang web, gửi biểu mẫu, hoặc chạy tìm kiếm, trình duyệt gửi _Yêu cầu HTTP_ đến máy chủ.

Yêu cầu này bao gồm:

- Một URL xác định máy chủ đích và tài nguyên (ví dụ: một tệp HTML, một điểm dữ liệu cụ thể trên máy chủ, hoặc một công cụ để chạy).
- Một phương thức xác định hành động cần thiết (ví dụ: để lấy tệp hoặc lưu hoặc cập nhật một số dữ liệu). Các phương thức/động từ khác nhau và các hành động liên quan được liệt kê dưới đây:
  - `GET`: Lấy một tài nguyên cụ thể (ví dụ: một tệp HTML chứa thông tin về sản phẩm, hoặc danh sách sản phẩm).
  - `POST`: Tạo một tài nguyên mới (ví dụ: thêm bài viết mới vào wiki, thêm liên hệ mới vào cơ sở dữ liệu).
  - `HEAD`: Lấy thông tin siêu dữ liệu về một tài nguyên cụ thể mà không lấy phần thân như `GET` sẽ. Bạn có thể sử dụng yêu cầu `HEAD` để tìm hiểu lần cuối tài nguyên được cập nhật, và sau đó chỉ sử dụng yêu cầu `GET` (đắt hơn) để tải tài nguyên nếu nó đã thay đổi.
  - `PUT`: Cập nhật tài nguyên hiện có (hoặc tạo một tài nguyên mới nếu nó không tồn tại).
  - `DELETE`: Xóa tài nguyên được chỉ định.
  - `TRACE`, `OPTIONS`, `CONNECT`, `PATCH`: Các động từ này dành cho các tác vụ ít phổ biến/nâng cao hơn, vì vậy chúng tôi sẽ không đề cập đến chúng ở đây.

- Thông tin bổ sung có thể được mã hóa với yêu cầu (ví dụ: dữ liệu biểu mẫu HTML). Thông tin có thể được mã hóa như:
  - Tham số URL: Các yêu cầu `GET` mã hóa dữ liệu trong URL được gửi đến máy chủ bằng cách thêm các cặp tên/giá trị vào cuối URL — ví dụ `http://example.com?name=Fred&age=11`. Bạn luôn có dấu hỏi (`?`) phân tách phần còn lại của URL với các tham số URL, dấu bằng (`=`) phân tách mỗi tên với giá trị liên quan của nó, và dấu và (`&`) phân tách mỗi cặp. Các tham số URL vốn "không an toàn" vì chúng có thể bị người dùng thay đổi và sau đó gửi lại. Do đó, các tham số URL/yêu cầu `GET` không được sử dụng cho các yêu cầu cập nhật dữ liệu trên máy chủ.
  - Dữ liệu `POST`. Các yêu cầu `POST` thêm tài nguyên mới, dữ liệu cho điều đó được mã hóa trong phần thân yêu cầu.
  - Cookie phía máy khách. Cookie chứa dữ liệu phiên về máy khách, bao gồm các khóa mà máy chủ có thể sử dụng để xác định trạng thái đăng nhập và quyền/truy cập vào tài nguyên của chúng.

Máy chủ web chờ các thông điệp yêu cầu từ máy khách, xử lý chúng khi chúng đến, và trả lời trình duyệt web với thông điệp phản hồi HTTP. Phản hồi chứa [mã trạng thái phản hồi HTTP](/en-US/docs/Web/HTTP/Reference/Status) cho biết yêu cầu có thành công hay không (ví dụ: {{HTTPStatus("200", "200 OK")}} cho thành công, {{HTTPStatus("404", "404 Not Found")}} nếu tài nguyên không thể tìm thấy, {{HTTPStatus("403", "403 Forbidden")}} nếu người dùng không được phép xem tài nguyên, v.v.). Phần thân của phản hồi thành công cho yêu cầu `GET` chứa tài nguyên được yêu cầu.

Khi trang HTML được trả về, nó được hiển thị bởi trình duyệt web. Như một phần của quá trình xử lý, trình duyệt có thể phát hiện các liên kết đến các tài nguyên khác (ví dụ: trang HTML thường tham chiếu đến các tệp JavaScript và CSS), và sẽ gửi các Yêu cầu HTTP riêng biệt để tải xuống các tệp này.

Cả trang web tĩnh và động (được thảo luận trong các phần tiếp theo) đều sử dụng chính xác cùng giao thức/mẫu giao tiếp.

### Ví dụ yêu cầu/phản hồi GET

Bạn có thể thực hiện yêu cầu `GET` đơn giản bằng cách nhấp vào liên kết hoặc tìm kiếm trên trang web (như trang chủ công cụ tìm kiếm). Ví dụ, yêu cầu HTTP được gửi khi bạn thực hiện tìm kiếm trên MDN cho từ "client-server overview" sẽ trông rất giống văn bản được hiển thị dưới đây (nó sẽ không hoàn toàn giống nhau vì các phần của thông điệp phụ thuộc vào trình duyệt/thiết lập của bạn).

> [!NOTE]
> Định dạng của các thông điệp HTTP được định nghĩa trong "tiêu chuẩn web" ([RFC9110](https://httpwg.org/specs/rfc9110.html#messages)). Bạn không cần biết mức độ chi tiết này, nhưng ít nhất bây giờ bạn biết tất cả những điều này đến từ đâu!

#### Yêu cầu

Mỗi dòng của yêu cầu chứa thông tin về nó. Phần đầu tiên được gọi là **tiêu đề**, và chứa thông tin hữu ích về yêu cầu, tương tự như cách [head HTML](/en-US/docs/Learn_web_development/Core/Structuring_content/Webpage_metadata) chứa thông tin hữu ích về tài liệu HTML (nhưng không phải nội dung thực sự, nằm trong phần thân):

```http
GET /en-US/search?q=client+server+overview&topic=apps&topic=html&topic=css&topic=js&topic=api&topic=webdev HTTP/1.1
Host: developer.mozilla.org
Connection: keep-alive
Pragma: no-cache
Cache-Control: no-cache
Upgrade-Insecure-Requests: 1
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/52.0.2743.116 Safari/537.36
Accept: text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,*/*;q=0.8
Referer: https://developer.mozilla.org/en-US/
Accept-Encoding: gzip, deflate, sdch, br
Accept-Language: en-US,en;q=0.8,es;q=0.6
Cookie: sessionid=6ynxs23n521lu21b1t136rhbv7ezngie; csrftoken=zIPUJsAZv6pcgCBJSCj1zU6pQZbfMUAT; dwf_section_edit=False; dwf_sg_task_completion=False; _gat=1; _ga=GA1.2.1688886003.1471911953; ffo=true
```

Dòng đầu tiên và thứ hai chứa hầu hết thông tin chúng ta đã đề cập ở trên:

- Loại yêu cầu (`GET`).
- URL tài nguyên đích (`/en-US/search`).
- Các tham số URL (`q=client%2Bserver%2Boverview&topic=apps&topic=html&topic=css&topic=js&topic=api&topic=webdev`).
- Trang web đích/máy chủ (developer.mozilla.org).
- Cuối dòng đầu tiên cũng bao gồm một chuỗi ngắn xác định phiên bản giao thức cụ thể (`HTTP/1.1`).

Dòng cuối cùng chứa thông tin về cookie phía máy khách — bạn có thể thấy trong trường hợp này cookie bao gồm id để quản lý phiên (`Cookie: sessionid=6ynxs23n521lu21b1t136rhbv7ezngie; …`).

Các dòng còn lại chứa thông tin về trình duyệt được sử dụng và loại phản hồi nó có thể xử lý.
Ví dụ, bạn có thể thấy ở đây rằng:

- Trình duyệt của tôi (`User-Agent`) là Mozilla Firefox (`Mozilla/5.0`).
- Nó có thể chấp nhận thông tin được nén gzip (`Accept-Encoding: gzip`).
- Nó có thể chấp nhận các ngôn ngữ được chỉ định (`Accept-Language: en-US,en;q=0.8,es;q=0.6`).
- Dòng `Referer` chỉ ra địa chỉ của trang web chứa liên kết đến tài nguyên này (tức là nguồn gốc của yêu cầu, `https://developer.mozilla.org/en-US/`).

Các yêu cầu HTTP cũng có thể có phần thân, nhưng nó trống trong trường hợp này.

#### Phản hồi

Phần đầu tiên của phản hồi cho yêu cầu này được hiển thị bên dưới. Tiêu đề chứa thông tin như sau:

- Dòng đầu tiên bao gồm mã phản hồi `200 OK`, cho chúng ta biết rằng yêu cầu đã thành công.
- Chúng ta có thể thấy rằng phản hồi được định dạng `text/html` (`Content-Type`).
- Chúng ta cũng có thể thấy rằng nó sử dụng bộ ký tự UTF-8 (`Content-Type: text/html; charset=utf-8`).
- Phần đầu cũng cho biết kích thước của nó (`Content-Length: 41823`).

Ở cuối thông điệp chúng ta thấy nội dung **phần thân** — chứa HTML thực sự được trả về bởi yêu cầu.

```http
HTTP/1.1 200 OK
Server: Apache
X-Backend-Server: developer1.webapp.scl3.mozilla.com
Vary: Accept, Cookie, Accept-Encoding
Content-Type: text/html; charset=utf-8
Date: Wed, 07 Sep 2016 00:11:31 GMT
Keep-Alive: timeout=5, max=999
Connection: Keep-Alive
X-Frame-Options: DENY
Allow: GET
X-Cache-Info: caching
Content-Length: 41823

<!doctype html>
<html lang="en-US" dir="ltr" class="redesign no-js" data-ffo-opensanslight=false data-ffo-opensans=false >
<head prefix="og: http://ogp.me/ns#">
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=Edge">
  <script>(function(d) { d.className = d.className.replace(/\bno-js/, ''); })(document.documentElement);</script>
  …
```

Phần còn lại của tiêu đề phản hồi bao gồm thông tin về phản hồi (ví dụ: khi nó được tạo ra), máy chủ, và cách nó mong muốn trình duyệt xử lý trang (ví dụ: dòng `X-Frame-Options: DENY` cho trình duyệt không cho phép trang này được nhúng trong một {{htmlelement("iframe")}} trong trang khác).

### Ví dụ yêu cầu/phản hồi POST

Yêu cầu HTTP `POST` được thực hiện khi bạn gửi biểu mẫu chứa thông tin cần lưu trên máy chủ.

#### Yêu cầu

Văn bản dưới đây hiển thị yêu cầu HTTP được thực hiện khi người dùng gửi chi tiết hồ sơ mới trên trang này. Định dạng của yêu cầu gần như giống với ví dụ yêu cầu `GET` được hiển thị trước đó, mặc dù dòng đầu tiên xác định yêu cầu này là `POST`.

```http
POST /en-US/profiles/hamishwillee/edit HTTP/1.1
Host: developer.mozilla.org
Connection: keep-alive
Content-Length: 432
Pragma: no-cache
Cache-Control: no-cache
Origin: https://developer.mozilla.org
Upgrade-Insecure-Requests: 1
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/52.0.2743.116 Safari/537.36
Content-Type: application/x-www-form-urlencoded
Accept: text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,*/*;q=0.8
Referer: https://developer.mozilla.org/en-US/profiles/hamishwillee/edit
Accept-Encoding: gzip, deflate, br
Accept-Language: en-US,en;q=0.8,es;q=0.6
Cookie: sessionid=6ynxs23n521lu21b1t136rhbv7ezngie; _gat=1; csrftoken=zIPUJsAZv6pcgCBJSCj1zU6pQZbfMUAT; dwf_section_edit=False; dwf_sg_task_completion=False; _ga=GA1.2.1688886003.1471911953; ffo=true

csrfmiddlewaretoken=zIPUJsAZv6pcgCBJSCj1zU6pQZbfMUAT&user-username=hamishwillee&user-fullname=Hamish+Willee&user-title=&user-organization=&user-location=Australia&user-locale=en-US&user-timezone=Australia%2FMelbourne&user-irc_nickname=&user-interests=&user-expertise=&user-twitter_url=&user-stackoverflow_url=&user-linkedin_url=&user-mozillians_url=&user-facebook_url=
```

Sự khác biệt chính là URL không có bất kỳ tham số nào. Như bạn có thể thấy, thông tin từ biểu mẫu được mã hóa trong phần thân yêu cầu (ví dụ: tên đầy đủ của người dùng mới được đặt bằng: `&user-fullname=Hamish+Willee`).

#### Phản hồi

Phản hồi từ yêu cầu được hiển thị bên dưới. Mã trạng thái `302 Found` cho trình duyệt biết rằng việc đăng đã thành công, và rằng nó phải thực hiện yêu cầu HTTP thứ hai để tải trang được chỉ định trong trường `Location`. Thông tin nói chung tương tự như phản hồi cho yêu cầu `GET`.

```http
HTTP/1.1 302 FOUND
Server: Apache
X-Backend-Server: developer3.webapp.scl3.mozilla.com
Vary: Cookie
Vary: Accept-Encoding
Content-Type: text/html; charset=utf-8
Date: Wed, 07 Sep 2016 00:38:13 GMT
Location: https://developer.mozilla.org/en-US/profiles/hamishwillee
Keep-Alive: timeout=5, max=1000
Connection: Keep-Alive
X-Frame-Options: DENY
X-Cache-Info: not cacheable; request wasn't a GET or HEAD
Content-Length: 0
```

> [!NOTE]
> Các phản hồi và yêu cầu HTTP được hiển thị trong các ví dụ này được chụp bằng ứng dụng [Fiddler](https://www.telerik.com/download/fiddler), nhưng bạn có thể nhận thông tin tương tự bằng cách sử dụng các sniffer web (ví dụ: [WebSniffer](https://websniffer.com/)) hoặc phân tích gói tin như [Wireshark](https://www.wireshark.org/). Bạn có thể tự thử điều này. Sử dụng bất kỳ công cụ nào được liên kết, sau đó điều hướng qua trang web và chỉnh sửa thông tin hồ sơ để xem các yêu cầu và phản hồi khác nhau. Hầu hết các trình duyệt hiện đại cũng có các công cụ giám sát các yêu cầu mạng (ví dụ: công cụ [Network Monitor](https://firefox-source-docs.mozilla.org/devtools-user/network_monitor/index.html) trong Firefox).

## Trang web tĩnh

_Trang web tĩnh_ là trang trả về cùng nội dung cố định từ máy chủ bất cứ khi nào một tài nguyên cụ thể được yêu cầu. Vì vậy, ví dụ, nếu bạn có một trang về sản phẩm tại `/static/my-product1.html`, trang tương tự này sẽ được trả về cho mọi người dùng. Nếu bạn thêm một sản phẩm tương tự khác vào trang web của bạn, bạn sẽ cần thêm một trang khác (ví dụ: `my-product2.html`) và cứ thế. Điều này có thể bắt đầu trở nên thực sự kém hiệu quả — điều gì xảy ra khi bạn đến hàng nghìn trang sản phẩm? Bạn sẽ lặp lại rất nhiều mã trên mỗi trang (mẫu trang cơ bản, cấu trúc, v.v.), và nếu bạn muốn thay đổi bất kỳ điều gì về cấu trúc trang — như thêm phần "sản phẩm liên quan" chẳng hạn — thì bạn sẽ phải thay đổi từng trang riêng lẻ.

> [!NOTE]
> Các trang web tĩnh tuyệt vời khi bạn có một số lượng nhỏ các trang và bạn muốn gửi cùng nội dung cho mọi người dùng. Tuy nhiên, chúng có thể có chi phí duy trì đáng kể khi số lượng trang trở nên lớn hơn.

Hãy tóm tắt cách điều này hoạt động, bằng cách nhìn lại sơ đồ kiến trúc trang web tĩnh mà chúng ta đã xem trong bài viết cuối.

![Sơ đồ đơn giản hóa của máy chủ web tĩnh.](basic_static_app_server.png)

Khi người dùng muốn điều hướng đến một trang, trình duyệt gửi yêu cầu HTTP `GET` chỉ định URL của trang HTML. Máy chủ lấy tài liệu được yêu cầu từ hệ thống tệp của nó và trả về phản hồi HTTP chứa tài liệu và [mã trạng thái phản hồi HTTP](/en-US/docs/Web/HTTP/Reference/Status) là `200 OK` (cho biết thành công). Máy chủ có thể trả về mã trạng thái khác, ví dụ `404 Not Found` nếu tệp không có trên máy chủ, hoặc `301 Moved Permanently` nếu tệp tồn tại nhưng đã được chuyển hướng đến một vị trí khác.

Máy chủ cho trang web tĩnh sẽ chỉ bao giờ cần xử lý các yêu cầu GET, vì máy chủ không lưu trữ bất kỳ dữ liệu có thể sửa đổi nào. Nó cũng không thay đổi phản hồi của mình dựa trên dữ liệu Yêu cầu HTTP (ví dụ: tham số URL hoặc cookie).

Tuy nhiên, hiểu cách các trang web tĩnh hoạt động rất hữu ích khi học lập trình phía máy chủ, vì các trang web động xử lý các yêu cầu cho tệp tĩnh (CSS, JavaScript, hình ảnh tĩnh, v.v.) theo chính xác cùng cách.

## Trang web động

_Trang web động_ là trang có thể tạo và trả về nội dung dựa trên URL yêu cầu cụ thể và dữ liệu (thay vì luôn trả về cùng tệp cố định cho một URL cụ thể). Sử dụng ví dụ về trang web sản phẩm, máy chủ sẽ lưu trữ "dữ liệu" sản phẩm trong cơ sở dữ liệu thay vì các tệp HTML riêng lẻ. Khi nhận yêu cầu HTTP `GET` cho một sản phẩm, máy chủ xác định ID sản phẩm, lấy dữ liệu từ cơ sở dữ liệu, và sau đó xây dựng trang HTML cho phản hồi bằng cách chèn dữ liệu vào mẫu HTML. Điều này có những lợi thế lớn so với trang web tĩnh:

Sử dụng cơ sở dữ liệu cho phép thông tin sản phẩm được lưu trữ hiệu quả theo cách dễ mở rộng, có thể sửa đổi và tìm kiếm.

Sử dụng các mẫu HTML làm cho việc thay đổi cấu trúc HTML rất dễ dàng, vì điều này chỉ cần thực hiện ở một nơi, trong một mẫu duy nhất, và không phải trên hàng nghìn trang tĩnh tiềm năng.

### Giải phẫu của một yêu cầu động

Phần này cung cấp tổng quan từng bước về chu kỳ yêu cầu và phản hồi HTTP "động", xây dựng trên những gì chúng ta đã xem trong bài viết cuối với nhiều chi tiết hơn. Để "giữ mọi thứ thực tế" chúng ta sẽ sử dụng ngữ cảnh của một trang web quản lý đội thể thao nơi huấn luyện viên có thể chọn tên đội và kích thước đội trong biểu mẫu HTML và nhận lại "đội hình tốt nhất" được đề xuất cho trận đấu tiếp theo của họ.

Sơ đồ dưới đây cho thấy các yếu tố chính của trang web "huấn luyện viên đội", cùng với các nhãn số cho chuỗi thao tác khi huấn luyện viên truy cập danh sách "đội tốt nhất" của họ. Các phần của trang làm cho nó động là _Ứng dụng Web_ (đây là cách chúng ta sẽ gọi mã phía máy chủ xử lý các yêu cầu HTTP và trả về các phản hồi HTTP), _Cơ sở dữ liệu_, chứa thông tin về cầu thủ, đội, huấn luyện viên và mối quan hệ của họ, và _Mẫu HTML_.

![Đây là sơ đồ của máy chủ web đơn giản với các số bước cho mỗi bước của tương tác client-server.](web_application_with_html_and_steps.png)

Sau khi huấn luyện viên gửi biểu mẫu với tên đội và số cầu thủ, chuỗi thao tác là:

1. Trình duyệt web tạo yêu cầu HTTP `GET` đến máy chủ bằng cách sử dụng URL cơ sở cho tài nguyên (`/best`) và mã hóa số đội và cầu thủ dưới dạng tham số URL (ví dụ: `/best?team=my_team_name&show=11`) hoặc như một phần của mẫu URL (ví dụ: `/best/my_team_name/11/`). Yêu cầu `GET` được sử dụng vì yêu cầu chỉ lấy dữ liệu (không sửa đổi dữ liệu).
2. _Máy chủ Web_ phát hiện rằng yêu cầu là "động" và chuyển tiếp nó đến _Ứng dụng Web_ để xử lý (máy chủ web xác định cách xử lý các URL khác nhau dựa trên các quy tắc khớp mẫu được định nghĩa trong cấu hình của nó).
3. _Ứng dụng Web_ xác định rằng _mục đích_ của yêu cầu là lấy "danh sách đội tốt nhất" dựa trên URL (`/best/`) và tìm ra tên đội và số cầu thủ cần thiết từ URL. _Ứng dụng Web_ sau đó lấy thông tin cần thiết từ cơ sở dữ liệu (sử dụng các tham số "nội bộ" bổ sung để định nghĩa cầu thủ nào là "tốt nhất", và có thể cũng lấy danh tính của huấn luyện viên đã đăng nhập từ cookie phía máy khách).
4. _Ứng dụng Web_ tạo động một trang HTML bằng cách đưa dữ liệu (từ _Cơ sở dữ liệu_) vào các trình giữ chỗ trong mẫu HTML.
5. _Ứng dụng Web_ trả về HTML được tạo ra cho trình duyệt web (thông qua _Máy chủ Web_), cùng với mã trạng thái HTTP là 200 ("thành công"). Nếu có bất kỳ điều gì ngăn HTML được trả về thì _Ứng dụng Web_ sẽ trả về mã khác — ví dụ "404" để chỉ ra rằng đội không tồn tại.
6. Trình duyệt Web sau đó sẽ bắt đầu xử lý HTML được trả về, gửi các yêu cầu riêng biệt để lấy bất kỳ tệp CSS hoặc JavaScript nào mà nó tham chiếu (xem bước 7).
7. Máy chủ Web tải các tệp tĩnh từ hệ thống tệp và trả về chúng cho trình duyệt trực tiếp (một lần nữa, xử lý tệp chính xác dựa trên các quy tắc cấu hình và khớp mẫu URL).

Một thao tác cập nhật một bản ghi trong cơ sở dữ liệu sẽ được xử lý tương tự, ngoại trừ rằng như bất kỳ cập nhật cơ sở dữ liệu nào, yêu cầu HTTP từ trình duyệt phải được mã hóa như một yêu cầu `POST`.

### Thực hiện công việc khác

Công việc của _Ứng dụng Web_ là nhận các yêu cầu HTTP và trả về các phản hồi HTTP. Trong khi tương tác với cơ sở dữ liệu để lấy hoặc cập nhật thông tin là các tác vụ rất phổ biến, mã có thể làm những việc khác cùng lúc, hoặc không tương tác với cơ sở dữ liệu chút nào.

Một ví dụ tốt về tác vụ bổ sung mà _Ứng dụng Web_ có thể thực hiện là gửi email cho người dùng để xác nhận đăng ký của họ với trang web. Trang web cũng có thể thực hiện ghi nhật ký hoặc các thao tác khác.

### Trả về thứ gì đó khác HTML

Mã phía máy chủ không nhất thiết phải trả về HTML snippet/tệp trong phản hồi. Thay vào đó, nó có thể tạo và trả về các loại tệp khác (văn bản, PDF, CSV, v.v.) hoặc thậm chí dữ liệu (JSON, XML, v.v.).

Điều này đặc biệt liên quan đến các trang web hoạt động bằng cách lấy nội dung từ máy chủ bằng JavaScript và cập nhật trang một cách động, thay vì luôn tải một trang mới khi nội dung mới cần được hiển thị. Xem [Thực hiện yêu cầu mạng với JavaScript](/en-US/docs/Learn_web_development/Core/Scripting/Network_requests) để biết thêm về động lực cho cách tiếp cận này, và mô hình này trông như thế nào từ góc độ của máy khách.

## Các framework web đơn giản hóa lập trình web phía máy chủ

Các framework web phía máy chủ làm cho việc viết mã để xử lý các thao tác được mô tả ở trên dễ dàng hơn nhiều.

Một trong những thao tác quan trọng nhất mà chúng thực hiện là cung cấp các cơ chế đơn giản để ánh xạ các URL cho các tài nguyên/trang khác nhau đến các hàm xử lý cụ thể. Điều này làm cho việc giữ mã liên quan đến mỗi loại tài nguyên riêng biệt dễ dàng hơn. Nó cũng có lợi ích về bảo trì, vì bạn có thể thay đổi URL được sử dụng để cung cấp một tính năng cụ thể ở một nơi mà không phải thay đổi hàm xử lý.

Ví dụ, hãy xem xét đoạn mã Django (Python) sau đây ánh xạ hai mẫu URL đến hai hàm xem. Mẫu đầu tiên đảm bảo rằng yêu cầu HTTP với URL tài nguyên `/best` sẽ được chuyển đến hàm có tên `index()` trong mô-đun `views`. Yêu cầu có mẫu `/best/junior`, thay vào đó sẽ được chuyển đến hàm xem `junior()`.

```python
# file: best/urls.py
#

from django.conf.urls import url

from . import views

urlpatterns = [
    # example: /best/
    url(r'^$', views.index),
    # example: /best/junior/
    url(r'^junior/$', views.junior),
]
```

> [!NOTE]
> Các tham số đầu tiên trong các hàm `url()` có thể trông hơi lạ (ví dụ: `r'^junior/$'`) vì chúng sử dụng kỹ thuật khớp mẫu được gọi là "biểu thức chính quy" (RegEx, hoặc RE). Bạn không cần biết cách biểu thức chính quy hoạt động tại thời điểm này, ngoài việc chúng cho phép chúng ta khớp các mẫu trong URL (thay vì các giá trị cố định ở trên) và sử dụng chúng làm tham số trong các hàm xem của chúng ta. Ví dụ, một RegEx thực sự đơn giản có thể nói "khớp một chữ hoa, theo sau là từ 4 đến 7 chữ thường."

Framework web cũng giúp hàm xem dễ dàng lấy thông tin từ cơ sở dữ liệu. Cấu trúc dữ liệu của chúng ta được định nghĩa trong các mô hình, đây là các lớp Python xác định các trường cần lưu trữ trong cơ sở dữ liệu bên dưới. Nếu chúng ta có mô hình có tên _Team_ với trường "_team_type_" thì chúng ta có thể sử dụng cú pháp truy vấn đơn giản để lấy lại tất cả các đội có loại cụ thể.

Ví dụ dưới đây lấy danh sách tất cả các đội có `team_type` chính xác (phân biệt chữ hoa chữ thường) là "junior" — lưu ý định dạng: tên trường (`team_type`) theo sau là hai dấu gạch dưới, và sau đó là loại khớp sử dụng (trong trường hợp này là `exact`). Có nhiều loại khớp khác và chúng ta có thể nối chúng. Chúng ta cũng có thể kiểm soát thứ tự và số lượng kết quả được trả về.

```python
#best/views.py

from django.shortcuts import render

from .models import Team

def junior(request):
    list_teams = Team.objects.filter(team_type__exact="junior")
    context = {'list': list_teams}
    return render(request, 'best/index.html', context)
```

Sau khi hàm `junior()` lấy danh sách các đội thiếu niên, nó gọi hàm `render()`, truyền `HttpRequest` ban đầu, mẫu HTML, và đối tượng "ngữ cảnh" xác định thông tin cần đưa vào mẫu. Hàm `render()` là hàm tiện ích tạo HTML bằng cách sử dụng ngữ cảnh và mẫu HTML, và trả về nó trong đối tượng `HttpResponse`.

Rõ ràng, các framework web có thể giúp bạn với nhiều tác vụ khác. Chúng ta thảo luận nhiều hơn về lợi ích và một số lựa chọn framework web phổ biến trong bài viết tiếp theo.

## Tóm tắt

Tại thời điểm này, bạn nên có tổng quan tốt về các thao tác mà mã phía máy chủ phải thực hiện, và biết một số cách mà framework web phía máy chủ có thể làm cho điều này dễ dàng hơn.

Trong một mô-đun tiếp theo, chúng ta sẽ giúp bạn chọn Framework Web tốt nhất cho trang đầu tiên của bạn.

{{PreviousMenuNext("Learn_web_development/Extensions/Server-side/First_steps/Introduction", "Learn_web_development/Extensions/Server-side/First_steps/Web_frameworks", "Learn_web_development/Extensions/Server-side/First_steps")}}
