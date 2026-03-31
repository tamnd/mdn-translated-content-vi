---
title: Chuyển hướng trong HTTP
slug: Web/HTTP/Guides/Redirections
page-type: guide
sidebar: http
---

**Chuyển hướng URL**, còn được gọi là _chuyển tiếp URL_, là kỹ thuật để cung cấp nhiều hơn một địa chỉ URL cho một trang, một biểu mẫu, toàn bộ trang web, hoặc ứng dụng web. HTTP có một loại phản hồi đặc biệt, được gọi là **_HTTP redirect_**, cho hoạt động này.

Các chuyển hướng hoàn thành nhiều mục tiêu:

- Chuyển hướng tạm thời trong quá trình bảo trì hoặc ngừng hoạt động của trang web
- Chuyển hướng vĩnh viễn để bảo tồn các liên kết/dấu trang hiện có sau khi thay đổi URL của trang web, các trang tiến trình khi tải tệp lên, v.v.

## Nguyên tắc

Trong HTTP, chuyển hướng được kích hoạt bởi máy chủ gửi phản hồi _redirect_ đặc biệt đến một yêu cầu. Các phản hồi chuyển hướng có [mã trạng thái](/en-US/docs/Web/HTTP/Reference/Status) bắt đầu bằng `3`, và tiêu đề {{ httpheader("Location") }} chứa URL để chuyển hướng đến.

Khi trình duyệt nhận được chuyển hướng, chúng ngay lập tức tải URL mới được cung cấp trong tiêu đề `Location`. Ngoài lần nhấp nhỏ về hiệu suất do một vòng lặp bổ sung, người dùng hiếm khi nhận thấy sự chuyển hướng.

<!--
%%{init: { "sequence": { "wrap": true, "width":250, "noteAlign": "center", "messageAlign": "center" }} }%%

sequenceDiagram
    participant Client
    participant Server

    Note left of Client: Request resource
    Client->>Server: GET /doc HTTP/1.1
    Note right of Server: Resource moved<br>Respond with new location
    Server->>Client: HTTP/1.1 301 Moved Permanently<br/>Location: /doc_new

    Note left of Client: Request resource at new location
    Client->>Server: GET /doc_new HTTP/1.1
    Note right of Server: Return resource
    Server->>Client: HTTP/1.1 200 OK
-->

![Một yêu cầu được thực hiện từ client đến máy chủ. Máy chủ phản hồi với "301:moved permanently" và URL mới cho tài nguyên. Client thực hiện yêu cầu GET cho URL mới được trả về bởi máy chủ, với phản hồi 200 OK.](httpredirect.svg)

Có một số loại chuyển hướng, được sắp xếp thành ba danh mục:

1. [Chuyển hướng vĩnh viễn](#permanent_redirections)
2. [Chuyển hướng tạm thời](#temporary_redirections)
3. [Chuyển hướng đặc biệt](#special_redirections)

### Chuyển hướng vĩnh viễn

Những chuyển hướng này được thiết kế để kéo dài mãi mãi. Chúng ngụ ý rằng URL gốc không còn nên được sử dụng, và được thay thế bằng URL mới. Robot công cụ tìm kiếm, trình đọc RSS và các crawler khác sẽ cập nhật URL gốc cho tài nguyên.

| Mã    | Văn bản              | Xử lý phương thức                                                                                                                      | Trường hợp sử dụng điển hình                                     |
| ----- | -------------------- | -------------------------------------------------------------------------------------------------------------------------------------- | ---------------------------------------------------------------- |
| `301` | `Moved Permanently`  | Phương thức {{HTTPMethod("GET")}} không thay đổi. Các phương thức khác có thể hoặc không thể thay đổi thành {{HTTPMethod("GET")}}. [1] | Tái cơ cấu trang web.                                            |
| `308` | `Permanent Redirect` | Phương thức và nội dung không thay đổi.                                                                                                | Tái cơ cấu trang web, với các liên kết/hoạt động không phải GET. |

\[1] Thông số kỹ thuật không có ý định cho phép thay đổi phương thức, nhưng có các user-agent hiện tại thực sự thay đổi phương thức của họ. {{HTTPStatus("308")}} được tạo ra để loại bỏ sự mơ hồ của hành vi khi sử dụng các phương thức không phải `GET`.

### Chuyển hướng tạm thời

Đôi khi tài nguyên được yêu cầu không thể được truy cập từ vị trí chính thức của nó, nhưng có thể được truy cập từ nơi khác. Trong trường hợp này, có thể sử dụng chuyển hướng tạm thời.

Robot công cụ tìm kiếm và các crawler khác không lưu URL tạm thời mới. Các chuyển hướng tạm thời cũng được sử dụng khi tạo, cập nhật hoặc xóa tài nguyên, để hiển thị các trang tiến trình tạm thời.

| Mã    | Văn bản              | Xử lý phương thức                                                                                                                      | Trường hợp sử dụng điển hình                                                                                                                |
| ----- | -------------------- | -------------------------------------------------------------------------------------------------------------------------------------- | ------------------------------------------------------------------------------------------------------------------------------------------- |
| `302` | `Found`              | Phương thức {{HTTPMethod("GET")}} không thay đổi. Các phương thức khác có thể hoặc không thể thay đổi thành {{HTTPMethod("GET")}}. [2] | Trang Web tạm thời không có sẵn vì những lý do không lường trước.                                                                           |
| `303` | `See Other`          | Phương thức {{HTTPMethod("GET")}} không thay đổi. Các phương thức khác _thay đổi_ thành `GET` (nội dung bị mất).                       | Được sử dụng để chuyển hướng sau {{HTTPMethod("PUT")}} hoặc {{HTTPMethod("POST")}}, để làm mới trang kết quả không kích hoạt lại hoạt động. |
| `307` | `Temporary Redirect` | Phương thức và nội dung không thay đổi                                                                                                 | Trang Web tạm thời không có sẵn vì những lý do không lường trước. Tốt hơn `302` khi các hoạt động không phải `GET` có sẵn trên trang web.   |

\[2] Thông số kỹ thuật không có ý định cho phép thay đổi phương thức, nhưng có các user-agent hiện tại thực sự thay đổi phương thức của họ. {{HTTPStatus("307")}} được tạo ra để loại bỏ sự mơ hồ của hành vi khi sử dụng các phương thức không phải `GET`.

### Chuyển hướng đặc biệt

{{HTTPStatus("304")}} (Not Modified) chuyển hướng một trang đến bản sao được lưu vào bộ nhớ đệm cục bộ (đã cũ), và {{HTTPStatus("300")}} (Multiple Choices) là chuyển hướng thủ công: nội dung, được trình bày bởi trình duyệt như một trang Web, liệt kê các chuyển hướng có thể và người dùng nhấp vào một để chọn nó.

| Mã    | Văn bản            | Trường hợp sử dụng điển hình                                                                                                                                                                      |
| ----- | ------------------ | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| `300` | `Multiple Choices` | Không nhiều: các lựa chọn được liệt kê trong trang HTML trong nội dung. Các lựa chọn có thể đọc được bằng máy được khuyến khích gửi dưới dạng tiêu đề {{HTTPHeader("Link")}} với `rel=alternate`. |
| `304` | `Not Modified`     | Được gửi cho các yêu cầu có điều kiện được xác nhận lại. Cho biết rằng phản hồi được lưu vào bộ nhớ đệm vẫn còn mới và có thể được sử dụng.                                                       |

## Cách thay thế để chỉ định chuyển hướng

Các chuyển hướng HTTP không phải là cách duy nhất để định nghĩa chuyển hướng. Có hai cách khác:

1. Chuyển hướng HTML với phần tử {{HTMLElement("meta")}}
2. Chuyển hướng JavaScript thông qua [DOM](/en-US/docs/Web/API/Document_Object_Model)

### Chuyển hướng HTML

Các chuyển hướng HTTP là cách tốt nhất để tạo chuyển hướng, nhưng đôi khi bạn không kiểm soát được máy chủ. Trong trường hợp đó, hãy thử phần tử {{HTMLElement("meta")}} với thuộc tính [`http-equiv`](/en-US/docs/Web/HTML/Reference/Elements/meta/http-equiv) được đặt thành `Refresh` trong {{HTMLElement("head")}} của trang. Khi hiển thị trang, trình duyệt sẽ truy cập URL được chỉ định.

```html
<head>
  <meta http-equiv="Refresh" content="0; URL=https://example.com/" />
</head>
```

Thuộc tính [`content`](/en-US/docs/Web/HTML/Reference/Elements/meta#content) nên bắt đầu bằng một số cho biết bao nhiêu giây trình duyệt nên chờ trước khi chuyển hướng đến URL đã cho. Luôn đặt nó thành `0` để tuân thủ khả năng truy cập.

Rõ ràng, phương pháp này chỉ hoạt động với HTML, và không thể sử dụng cho hình ảnh hoặc các loại nội dung khác.

### Chuyển hướng JavaScript

Các chuyển hướng trong JavaScript được thực hiện bằng cách đặt chuỗi URL cho thuộc tính {{domxref("window.location")}}, tải trang mới:

```js
window.location = "https://example.com/";
```

Giống như chuyển hướng HTML, điều này không thể hoạt động trên tất cả các tài nguyên, và rõ ràng điều này sẽ chỉ hoạt động trên các client thực thi JavaScript. Mặt khác, có nhiều khả năng hơn: ví dụ, bạn có thể kích hoạt chuyển hướng chỉ khi một số điều kiện được đáp ứng.

### Thứ tự ưu tiên

Với ba cách để kích hoạt chuyển hướng, có thể sử dụng nhiều cách cùng một lúc. Nhưng cái nào được áp dụng trước?

1. Các chuyển hướng HTTP luôn thực thi trước — chúng tồn tại khi thậm chí không có trang nào được truyền.
2. Hơi ngạc nhiên, các chuyển hướng JavaScript thực thi tiếp theo, trước các chuyển hướng HTML. Điều này là vì chuyển hướng `<meta>` xảy ra sau khi trang được tải _hoàn toàn_, sau khi tất cả các script đã được thực thi.
3. Các chuyển hướng HTML ({{HTMLElement("meta")}}) thực thi nếu không có chuyển hướng HTTP hoặc JavaScript nào được thực thi trước khi trang được tải.
4. Nếu có bất kỳ chuyển hướng JavaScript nào xảy ra sau khi trang được tải (ví dụ, khi nhấp nút), nó sẽ thực thi cuối cùng nếu trang chưa được chuyển hướng bởi các phương pháp trước.

Khi có thể, hãy sử dụng các chuyển hướng HTTP và không thêm chuyển hướng phần tử {{HTMLElement("meta")}}. Nếu ai đó thay đổi các chuyển hướng HTTP nhưng quên thay đổi các chuyển hướng HTML, các chuyển hướng sẽ không còn giống nhau, điều này có thể gây ra vòng lặp vô tận hoặc các ác mộng khác.

## Các trường hợp sử dụng

Có nhiều trường hợp sử dụng cho chuyển hướng, nhưng vì hiệu suất bị ảnh hưởng với mỗi lần chuyển hướng, nên giữ việc sử dụng của chúng ở mức tối thiểu.

### Bí danh tên miền

Lý tưởng là có một vị trí, và do đó một URL, cho mỗi tài nguyên. Nhưng có lý do cho các tên thay thế cho tài nguyên:

- Mở rộng phạm vi tiếp cận của trang web của bạn
  - : Trường hợp phổ biến là khi trang web nằm ở `www.example.com`, nhưng truy cập nó từ `example.com` cũng nên hoạt động. Chuyển hướng từ `example.com` đến `www.example.com` do đó được thiết lập. Bạn cũng có thể chuyển hướng từ các từ đồng nghĩa phổ biến hoặc các lỗi đánh máy thường xuyên của tên miền của bạn.
- Di chuyển đến tên miền mới
  - : Ví dụ, công ty của bạn được đổi tên, nhưng bạn muốn các liên kết hoặc dấu trang hiện có vẫn tìm thấy bạn dưới tên mới.
- Buộc [HTTPS](/en-US/docs/Glossary/HTTPS)
  - : Các yêu cầu đến phiên bản `http://` của trang web của bạn sẽ chuyển hướng đến phiên bản `https://` của trang web của bạn.

### Giữ liên kết hoạt động

Khi bạn tái cơ cấu các trang web, URL thay đổi. Ngay cả khi bạn cập nhật các liên kết của trang web để khớp với URL mới, bạn không kiểm soát được các URL được sử dụng bởi các tài nguyên bên ngoài.

Bạn không muốn phá vỡ các liên kết này, vì chúng mang lại người dùng có giá trị và giúp SEO của bạn, vì vậy bạn thiết lập chuyển hướng từ URL cũ đến URL mới.

> [!NOTE]
> Kỹ thuật này hoạt động cho các liên kết nội bộ, nhưng hãy cố gắng tránh có chuyển hướng nội bộ. Chuyển hướng có chi phí hiệu suất đáng kể (vì có một yêu cầu HTTP bổ sung xảy ra). Nếu bạn có thể tránh điều đó bằng cách sửa các liên kết nội bộ, bạn nên sửa các liên kết đó thay vì.

### Phản hồi tạm thời cho các yêu cầu không an toàn

Các yêu cầu {{Glossary("Safe/HTTP", "Không an toàn")}} sửa đổi trạng thái của máy chủ và người dùng không nên vô ý gửi lại chúng.

Thông thường, bạn không muốn người dùng gửi lại các yêu cầu {{HTTPMethod("PUT")}}, {{HTTPMethod("POST")}} hoặc {{HTTPMethod("DELETE")}}. Nếu bạn phục vụ phản hồi như là kết quả của yêu cầu này, nhấn nút tải lại sẽ gửi lại yêu cầu (có thể sau thông báo xác nhận).

Trong trường hợp này, máy chủ có thể gửi lại phản hồi {{HTTPStatus("303")}} (See Other) cho URL sẽ chứa thông tin phù hợp. Nếu nút tải lại được nhấn, chỉ trang đó được hiển thị lại, không phát lại các yêu cầu không an toàn.

### Phản hồi tạm thời cho các yêu cầu dài

Một số yêu cầu có thể cần nhiều thời gian hơn trên máy chủ, như các yêu cầu {{HTTPMethod("DELETE")}} được lên lịch để xử lý sau. Trong trường hợp này, phản hồi là chuyển hướng {{HTTPStatus("303")}} (See Other) liên kết đến trang chỉ ra rằng hành động đã được lên lịch, và cuối cùng thông báo về tiến trình của nó, hoặc cho phép hủy nó.

## Cấu hình chuyển hướng trong các máy chủ phổ biến

### Apache

Chuyển hướng có thể được đặt trong tệp cấu hình máy chủ hoặc trong `.htaccess` của mỗi thư mục.

Module [`mod_alias`](https://httpd.apache.org/docs/current/mod/mod_alias.html) có các chỉ thị `Redirect` và `RedirectMatch` thiết lập chuyển hướng {{HTTPStatus("302")}} theo mặc định:

```apacheconf
<VirtualHost *:443>
  ServerName example.com
  Redirect / https://www.example.com
</VirtualHost>
```

URL `https://example.com/` sẽ được chuyển hướng đến `https://www.example.com/`, cũng như bất kỳ tệp hoặc thư mục nào bên dưới nó (`https://example.com/some-page` sẽ được chuyển hướng đến `https://www.example.com/some-page`)

`RedirectMatch` làm điều tương tự, nhưng nhận {{glossary("regular expression", "biểu thức chính quy")}} để định nghĩa một tập hợp các URL bị ảnh hưởng:

```apacheconf
RedirectMatch ^/images/(.*)$ https://images.example.com/$1
```

Tất cả các tài liệu trong thư mục `images/` sẽ chuyển hướng đến một tên miền khác.

Nếu bạn không muốn chuyển hướng tạm thời, một tham số bổ sung (mã trạng thái HTTP cần sử dụng hoặc từ khóa `permanent`) có thể được sử dụng để thiết lập chuyển hướng khác:

```apacheconf
Redirect permanent / https://www.example.com
# …acts the same as:
Redirect 301 / https://www.example.com
```

Module [`mod_rewrite`](https://httpd.apache.org/docs/current/mod/mod_rewrite.html) cũng có thể tạo chuyển hướng. Nó linh hoạt hơn, nhưng phức tạp hơn một chút.

### Nginx

Trong Nginx, bạn tạo một khối máy chủ cụ thể cho nội dung bạn muốn chuyển hướng:

```nginx
server {
  listen 80;
  server_name example.com;
  return 301 $scheme://www.example.com$request_uri;
}
```

Để áp dụng chuyển hướng cho một thư mục hoặc chỉ một số trang nhất định, hãy sử dụng chỉ thị `rewrite`:

```nginx
rewrite ^/images/(.*)$ https://images.example.com/$1 redirect;
rewrite ^/images/(.*)$ https://images.example.com/$1 permanent;
```

### IIS

Trong IIS, bạn sử dụng phần tử [`<httpRedirect>`](https://learn.microsoft.com/en-us/iis/configuration/system.webServer/httpRedirect/) để cấu hình chuyển hướng.

## Các vòng lặp chuyển hướng

Các vòng lặp chuyển hướng xảy ra khi các chuyển hướng bổ sung theo sau những chuyển hướng đã được theo dõi. Nói cách khác, có một vòng lặp sẽ không bao giờ kết thúc và không trang nào sẽ được tìm thấy.

Hầu hết thời gian đây là vấn đề máy chủ, và nếu máy chủ có thể phát hiện nó, nó sẽ gửi lại {{HTTPStatus("500")}} `Internal Server Error`. Nếu bạn gặp lỗi như vậy ngay sau khi sửa đổi cấu hình máy chủ, đây có thể là vòng lặp chuyển hướng.

Đôi khi, máy chủ sẽ không phát hiện ra nó: một vòng lặp chuyển hướng có thể trải rộng trên nhiều máy chủ mỗi máy không có hình ảnh đầy đủ. Trong trường hợp này, các trình duyệt sẽ phát hiện nó và hiển thị thông báo lỗi. Firefox hiển thị:

> Firefox has detected that the server is redirecting the request for this address in a way that will never terminate.

…trong khi Chrome hiển thị:

> This Webpage has a redirect loop

Trong cả hai trường hợp, người dùng không thể làm nhiều (trừ khi corruption đang xảy ra ở phía họ, như không khớp bộ nhớ đệm hoặc cookie).

Điều quan trọng là tránh các vòng lặp chuyển hướng, vì chúng hoàn toàn phá vỡ trải nghiệm người dùng.

## Xem thêm

- [3XX redirection](/en-US/docs/Web/HTTP/Reference/Status#redirection_messages) mã trạng thái phản hồi
- Tiêu đề {{HTTPHeader("Location")}}
- Thuộc tính {{domxref("window.location")}} để chuyển hướng bằng JavaScript
