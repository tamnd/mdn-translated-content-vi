---
title: Nội dung hỗn hợp
slug: Web/Security/Defenses/Mixed_content
page-type: guide
browser-compat: http.mixed-content
sidebar: security
---

Khi một trang web được tải từ một origin an toàn, qua một kênh an toàn như {{Glossary("HTTPS")}}, kết nối với web server sẽ được mã hóa và vì thế được bảo vệ khỏi việc nghe lén và bị sửa đổi bởi các cuộc tấn công man-in-the-middle.
Nếu trang web được tải một cách an toàn chỉ bao gồm hình ảnh, script và các tài nguyên khác cũng được lưu trữ trên các origin an toàn, người dùng có thể tin rằng toàn bộ trang đều an toàn trước những kiểu tấn công này.

"Nội dung hỗn hợp" là thuật ngữ chỉ các trang web được tải an toàn nhưng sử dụng tài nguyên được tìm nạp qua HTTP hoặc một giao thức không an toàn khác.
Loại trang web này có thể không an toàn vì mọi tài nguyên được gửi không an toàn đều có thể bị xem và có thể làm lộ thông tin nhạy cảm, và/hoặc bị kẻ tấn công sửa đổi.
Script đặc biệt nguy hiểm vì chúng có thể sửa đổi mọi khía cạnh của trang, nhưng mọi loại tài nguyên đều có rủi ro nhất định.
Ví dụ, hình ảnh có thể bị sửa đổi để cung cấp cho người dùng thông tin sai lệch hoặc đánh lừa, hoặc làm thay đổi chức năng biểu kiến của một nút.

"Tải xuống hỗn hợp" là các lượt tải tài nguyên được khởi tạo từ một secure context nhưng được tìm nạp qua kết nối không an toàn.
Chúng chia sẻ cùng các rủi ro như nội dung hỗn hợp: nội dung tải xuống có vẻ đến từ một origin an toàn, nhưng có thể đã bị sửa đổi hoặc bị xem trong quá trình truyền.

Bạn nên tránh dùng nội dung hỗn hợp và tải xuống hỗn hợp trên website của mình!
Trình duyệt giảm thiểu rủi ro của nội dung hỗn hợp bằng cách tự động nâng cấp các yêu cầu nội dung hỗn hợp dạng hình ảnh, video và âm thanh từ HTTP lên HTTPS, và chặn các yêu cầu không an toàn cho mọi loại tài nguyên khác.
Chúng cũng nên chặn _tải xuống hỗn hợp_ theo mặc định.

## Các loại nội dung hỗn hợp

Nội dung hỗn hợp trong một trang web được chia thành hai loại: "nội dung có thể nâng cấp" và "nội dung có thể chặn".
Trình duyệt nên tự động nâng cấp các yêu cầu cho nội dung có thể nâng cấp từ HTTP lên HTTPS, và chặn các yêu cầu của nội dung có thể chặn.

Cách tiếp cận này đảm bảo rằng mọi nội dung trong một secure context đều được tải qua một kênh an toàn hoặc bị chặn, điều này an toàn hơn cho người dùng so với việc hiển thị lẫn lộn nội dung an toàn và không an toàn, đồng thời ít gây gián đoạn hơn so với việc chặn hoàn toàn mọi nội dung không an toàn và làm hỏng các trang web.

> [!NOTE]
> Các phiên bản cũ hơn của đặc tả chia nội dung hỗn hợp thành hai nhóm "có thể chặn" và "có thể chặn tùy chọn":
>
> - Các loại nội dung có thể chặn, còn được gọi là "nội dung hỗn hợp chủ động", là những nội dung có thể sửa đổi các phần khác của trang web, chẳng hạn như script và stylesheet.
>   Nguy cơ tiềm ẩn nếu các tệp này bị sửa đổi là rất cao, và trình duyệt được yêu cầu chặn chúng.
> - Các loại nội dung có thể chặn tùy chọn, còn được gọi là "nội dung hỗn hợp thụ động", là những nội dung không thể sửa đổi nội dung khác trong trang web, chẳng hạn như hình ảnh, video và tệp âm thanh.
>   Nguy cơ tiềm ẩn khi cho phép các tệp này thấp hơn, nên trình duyệt có thể chọn chặn hoặc hiển thị chúng, hoặc chuyển quyết định cho người dùng.

Tập hợp các kiểu tài nguyên tạo nên "nội dung có thể nâng cấp" được khởi tạo từ tập hợp nội dung hỗn hợp "có thể chặn tùy chọn".
Kỳ vọng là mọi kiểu tệp mới sẽ được định nghĩa là nội dung có thể chặn, và một số nội dung có thể nâng cấp có thể trở thành nội dung có thể chặn trong tương lai.

### Nội dung có thể nâng cấp

Các yêu cầu nội dung có thể nâng cấp là những yêu cầu mà một yêu cầu không an toàn sẽ tự động được nâng cấp thành yêu cầu an toàn, bằng cách thay đổi scheme của origin từ `http` sang `https`.
Máy chủ từ xa sẽ hoặc phản hồi bằng tài nguyên, hoặc bằng một mã trạng thái cho biết tài nguyên không được tìm thấy.

Các kiểu tài nguyên trong nhóm này là những tài nguyên mà việc chặn yêu cầu có thể gây nguy cơ làm hỏng những phần quan trọng của web.
Hiện nay chúng tương ứng với các loại nội dung hỗn hợp trước đây được xem là "có thể chặn tùy chọn", vì chúng vẫn còn được dùng trên một số website.

Các phần tử sau đây có thể được nâng cấp (trừ khi host của URL được chỉ định bằng một địa chỉ IP - xem phần sau):

- {{HTMLElement("img")}} khi origin được đặt qua thuộc tính `src`, bao gồm cả tài liệu SVG (nhưng không khi đặt tài nguyên bằng `srcset` hoặc `<picture>`).
- Các phần tử ảnh CSS như: `background-image`, `border-image`, v.v.
- {{HTMLElement("audio")}} khi origin được đặt bằng thuộc tính `src`.
- {{HTMLElement("video")}} khi origin được đặt bằng thuộc tính `src`
- {{HTMLElement("source")}} khi video hoặc origin resource được đặt.

### Nội dung có thể chặn

Nội dung có thể chặn được định nghĩa là "mọi nội dung hỗn hợp không thể nâng cấp".

Điều này bao gồm các yêu cầu HTTP phát sinh từ những phần tử sau đây (danh sách này không đầy đủ):

- {{HTMLElement("script")}} khi origin được đặt qua thuộc tính `src`
- {{HTMLElement("link")}} khi origin được đặt trong thuộc tính `href`, và bao gồm cả stylesheet
- {{HTMLElement("iframe")}} khi origin được đặt qua thuộc tính `src`
- Yêu cầu từ {{domxref("Window/fetch", "fetch()")}}
- Yêu cầu từ {{domxref("XMLHttpRequest")}}
- Tất cả các trường hợp trong CSS khi dùng giá trị {{CSSXref("url_value", "&lt;url&gt;")}} ({{cssxref("@font-face")}}, {{cssxref("cursor")}}, {{cssxref("background-image")}}, v.v.)
- {{HTMLElement("object")}} (thuộc tính `data`)
- {{domxref("Navigator.sendBeacon")}} (thuộc tính `url`)
- {{HTMLElement("img")}} khi origin được đặt qua `srcset` hoặc `<picture>`.
- Phông chữ web

Các yêu cầu nội dung hỗn hợp mà thông thường sẽ được nâng cấp vẫn bị chặn nếu host của URL là địa chỉ IP thay vì tên miền.
Vì vậy, `<img src="http://example.com/image.png">` sẽ được nâng cấp, nhưng `<img src="http://93.184.215.14/image.png">` sẽ bị chặn.

## Ví dụ về các yêu cầu nội dung hỗn hợp

Các yêu cầu nội dung hỗn hợp là các yêu cầu không an toàn tới tài nguyên từ một [secure context](/en-US/docs/Web/Security/Defenses/Secure_Contexts):

Những ví dụ sau minh họa các yêu cầu an toàn, không an toàn và hỗn hợp:

- `http://insecure.com` tải `http://also.insecure.com` - không phải là yêu cầu nội dung hỗn hợp vì cả hai origin đều không an toàn.
- `https://secure.com` tải `http://insecure.com` - là một yêu cầu nội dung hỗn hợp vì tài nguyên không an toàn `http://insecure.com` được tải vào secure context `https://secure.com`.
- `http://insecure.com` tải `https://secure.com` trong một `<iframe>`, rồi khung đó lại tải `http://also.insecure.com` - việc tải `https://secure.com` vào `http://insecure.com` không phải là yêu cầu nội dung hỗn hợp (không có hạn chế nào đối với việc tải một secure context vào một insecure context).
  Tuy nhiên, việc tải `http://also.insecure.com` vào khung an toàn `https://secure.com` là một yêu cầu nội dung hỗn hợp.
- `https://secure.com` đóng khung một URL `data:`, rồi URL đó tải `http://insecure.com` - đây là một yêu cầu nội dung hỗn hợp, vì `https://secure.com` (và do đó cả `data:`) đã được tải an toàn và `http://insecure.com` là không an toàn.

Các yêu cầu nội dung hỗn hợp cũng có thể được thực hiện từ các secure context như plugin hoặc worker, và sẽ được nâng cấp/chặn theo cùng cách.

Lưu ý rằng các yêu cầu điều hướng từ một secure context nhắm tới các top-level browsing context đích không an toàn không được xem là nội dung hỗn hợp vì chúng tạo ra một ngữ cảnh mới, và ngữ cảnh đó sẽ an toàn hay không an toàn một cách độc lập với origin của yêu cầu.

### Tải các tài nguyên hỗn hợp được phân phối cục bộ

Các tài nguyên cục bộ được xem là đến từ các origin an toàn, giống như các origin HTTPS.
Điều này bao gồm các URL `file:`, và nội dung được truy cập từ các địa chỉ loopback như `http://127.0.0.1/` hoặc `http://localhost/`.

Bạn có thể tải các tệp này từ secure context, và bạn vẫn sẽ có một secure context.
Tuy nhiên nếu một tệp cục bộ tải tài nguyên không an toàn qua `http:`, thì đó sẽ là một yêu cầu nội dung hỗn hợp.

Có thể kiểm tra hỗ trợ cho việc tải nội dung cục bộ trong phần [Tương thích trình duyệt](#browser_compatibility).

## Tải xuống hỗn hợp

Tải xuống hỗn hợp là việc tải tài nguyên từ một secure context qua một kết nối không an toàn.
Chúng có vấn đề vì cùng lý do như nội dung hỗn hợp - nội dung có thể bị kẻ tấn công chặn và/hoặc sửa đổi, và người dùng không dễ nhận ra rằng điều này có thể xảy ra trên một trang an toàn.

Ví dụ, đoạn mã sau xác định một phần tử [`<a>`](/en-US/docs/Web/HTML/Reference/Elements/a#download) có thể được dùng để tải xuống trang tại origin không an toàn `http://example.com/`.
Nếu mã này nằm trong một trang được phục vụ qua HTTPS, việc lưu liên kết sẽ tạo ra một lượt tải xuống hỗn hợp.

```html
<a href="http://example.com/" download>Download</a>
```

Trình duyệt được kỳ vọng sẽ chặn các lượt tải xuống hỗn hợp, và các site an toàn không nên bao gồm chúng.

> [!NOTE]
> Trình duyệt thường chặn tải xuống hỗn hợp theo mặc định, nhưng sẽ thông báo cho người dùng về rủi ro và cho phép họ giữ hoặc loại bỏ bản tải xuống.

## Bảng điều khiển nhà phát triển

Bảng điều khiển nhà phát triển sẽ hiển thị cảnh báo khi nội dung hỗn hợp được nâng cấp hoặc bị chặn.
Bạn có thể dùng các cảnh báo này để gỡ lỗi và sửa nội dung hỗn hợp trong website của mình.

Ảnh chụp màn hình dưới đây cho thấy cảnh báo trên console khi một hình ảnh được nâng cấp trong Firefox (Chrome có cảnh báo tương tự).

![Ảnh chụp màn hình web console hiển thị cảnh báo nâng cấp cho hình ảnh nội dung hỗn hợp.](mixed_content_console_upgradable.png)

Trên các phiên bản trình duyệt vẫn hiển thị nội dung "có thể chặn tùy chọn", một biểu tượng được dùng để cho biết có nội dung hỗn hợp trong nội dung được hiển thị, cùng với cảnh báo trên console.
Ảnh chụp màn hình dưới đây cho thấy biểu tượng và cảnh báo console cho Firefox khi bắt đầu hỗ trợ nội dung hỗn hợp có thể nâng cấp.

![Ảnh chụp màn hình web console hiển thị cảnh báo hiển thị cho hình ảnh nội dung hỗn hợp.](mixed_content_console_displayed.png)

## Sửa lỗi nội dung hỗn hợp

Chiến lược tốt nhất để tránh các vấn đề với nội dung hỗn hợp là phục vụ toàn bộ nội dung qua HTTPS:

- Phục vụ toàn bộ nội dung từ miền của bạn qua HTTPS.
- Chuyển mọi tham chiếu tới tài nguyên được lưu trữ trên miền của bạn thành liên kết tương đối hoặc liên kết HTTPS, kể cả cho các lượt tải xuống.
- Nếu dùng tài nguyên trên các site khác, hãy dùng phiên bản HTTPS nếu có.

  Phần lớn các site đều cung cấp phiên bản HTTPS cho tài nguyên dùng chung.
  Cách dễ nhất thường là thay thế tất cả liên kết `http://` bằng `https://`, sau đó dùng các công cụ như [LinkChecker](https://linkchecker.github.io/linkchecker/) để xác minh rằng mọi liên kết đều hoạt động.

Có nhiều cách để xác minh rằng site của bạn không còn nội dung hỗn hợp, bao gồm:

- Duyệt qua site của bạn, và kiểm tra [bảng điều khiển nhà phát triển](#developer_console) của trình duyệt để tìm cảnh báo về nội dung hỗn hợp.
- Tắt toàn bộ nội dung hỗn hợp trong trình duyệt của bạn và kiểm tra rằng các trang vẫn hoạt động như mong đợi.
  Đây là mặc định của Safari, nhưng phần lớn trình duyệt đều hỗ trợ một cơ chế nào đó để chặn toàn bộ nội dung hỗn hợp (xem [dữ liệu tương thích](#browser_compatibility)).
- Dùng một web crawler trên máy tính như [HTTPSChecker](https://httpschecker.net/how-it-works), hoặc một công cụ CLI như [mcdetect](https://github.com/agis/mcdetect), để kiểm tra website của bạn một cách đệ quy và tìm các liên kết tới nội dung không an toàn.
- Dùng một công cụ trực tuyến như [Mixed Content Checker](https://www.crawlcenter.com/mixed-content-checker) để kiểm tra site của bạn.

## Đặc tả

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [CSP: `upgrade-insecure-requests`](/en-US/docs/Web/HTTP/Reference/Headers/Content-Security-Policy/upgrade-insecure-requests) nâng cấp tất cả các yêu cầu lên HTTPS, bao gồm cả nội dung hỗn hợp có thể chặn
