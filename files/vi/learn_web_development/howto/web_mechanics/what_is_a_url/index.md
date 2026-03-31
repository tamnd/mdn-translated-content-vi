---
title: What is a URL?
slug: Learn_web_development/Howto/Web_mechanics/What_is_a_URL
page-type: learn-faq
sidebar: learn-how-to
---

Bài viết này thảo luận về Uniform Resource Locators (URL), giải thích chúng là gì và cách chúng được cấu trúc.

<table>
  <tbody>
    <tr>
      <th scope="row">Điều kiện tiên quyết:</th>
      <td>
        Trước tiên bạn cần biết
        <a href="/en-US/docs/Learn_web_development/Howto/Web_mechanics/How_does_the_Internet_work"
          >Internet hoạt động như thế nào</a
        >,
        <a href="/en-US/docs/Learn_web_development/Howto/Web_mechanics/What_is_a_web_server"
          >máy chủ Web là gì</a
        >
        và
        <a href="/en-US/docs/Learn_web_development/Howto/Web_mechanics/What_are_hyperlinks"
          >các khái niệm đằng sau liên kết trên web</a
        >.
      </td>
    </tr>
    <tr>
      <th scope="row">Mục tiêu:</th>
      <td>Bạn sẽ tìm hiểu URL là gì và nó hoạt động như thế nào trên Web.</td>
    </tr>
  </tbody>
</table>

## Tóm tắt

**URL** (Uniform Resource Locator) là địa chỉ của một tài nguyên duy nhất trên internet. Đây là một trong những cơ chế chính được {{Glossary("Browser","trình duyệt")}} sử dụng để truy xuất các tài nguyên đã xuất bản, như các trang HTML, tài liệu CSS, hình ảnh, v.v.

Về lý thuyết, mỗi URL hợp lệ trỏ đến một tài nguyên duy nhất. Trên thực tế, có một số ngoại lệ, phổ biến nhất là URL trỏ đến tài nguyên không còn tồn tại hoặc đã bị di chuyển. Vì tài nguyên được biểu diễn bởi URL và bản thân URL được xử lý bởi máy chủ Web, đây là trách nhiệm của chủ sở hữu máy chủ web phải quản lý cẩn thận tài nguyên đó và URL liên quan của nó.

## Kiến thức cơ bản: giải phẫu URL

Dưới đây là một số ví dụ về URL:

```plain
https://developer.mozilla.org
https://developer.mozilla.org/en-US/docs/Learn_web_development/
https://developer.mozilla.org/en-US/search?q=URL
```

Bất kỳ URL nào trong số đó đều có thể được gõ vào thanh địa chỉ của trình duyệt để yêu cầu nó tải tài nguyên liên quan, trong cả ba trường hợp đều là một Trang Web.

URL được tạo thành từ các phần khác nhau, một số bắt buộc và một số tùy chọn. Các phần quan trọng nhất được làm nổi bật trên URL bên dưới (chi tiết được cung cấp trong các phần sau):

![URL đầy đủ](mdn-url-all.png)

> [!NOTE]
> Bạn có thể nghĩ về URL như địa chỉ thư bưu điện thông thường: _scheme_ đại diện cho dịch vụ bưu chính bạn muốn sử dụng, _tên miền_ là thành phố hoặc thị trấn, và _cổng_ giống như mã bưu chính; _đường dẫn_ đại diện cho tòa nhà nơi thư của bạn nên được giao; _tham số_ đại diện cho thông tin bổ sung như số căn hộ trong tòa nhà; và, cuối cùng, _mỏ neo_ đại diện cho người thực sự mà bạn đã gửi thư.

> [!NOTE]
> Có [một số phần thêm và một số quy tắc thêm](https://en.wikipedia.org/wiki/Uniform_Resource_Locator) liên quan đến URL, nhưng chúng không liên quan đến người dùng thông thường hoặc nhà phát triển Web. Đừng lo lắng về điều này, bạn không cần biết chúng để xây dựng và sử dụng URL đầy đủ chức năng.

## Scheme

![Scheme](mdn-url-protocol@x2_update.png)

Phần đầu tiên của URL là _scheme_, cho biết giao thức mà trình duyệt phải sử dụng để yêu cầu tài nguyên (giao thức là phương thức đặt sẵn để trao đổi hoặc chuyển dữ liệu qua mạng máy tính). Thông thường đối với các website, giao thức là HTTPS hoặc HTTP (phiên bản không bảo mật của nó). Truy cập các trang web yêu cầu một trong hai loại này, nhưng trình duyệt cũng biết cách xử lý các scheme khác như `mailto:` (để mở ứng dụng thư), vì vậy đừng ngạc nhiên nếu bạn thấy các giao thức khác.

## Authority

![Authority](mdn-url-authority.png)

Tiếp theo là _authority_, được phân tách khỏi scheme bằng mẫu ký tự `://`. Nếu có, authority bao gồm cả _tên miền_ (ví dụ: `www.example.com`) và _cổng_ (`80`), được phân tách bởi dấu hai chấm:

- Tên miền cho biết máy chủ Web nào đang được yêu cầu. Thông thường đây là [tên miền](/en-US/docs/Learn_web_development/Howto/Web_mechanics/What_is_a_domain_name), nhưng {{Glossary("IP address")}} cũng có thể được sử dụng (nhưng điều này hiếm vì ít tiện lợi hơn nhiều).
- Cổng cho biết "cổng" kỹ thuật được sử dụng để truy cập các tài nguyên trên máy chủ web. Thường được bỏ qua nếu máy chủ web sử dụng các cổng tiêu chuẩn của giao thức HTTP (80 cho HTTP và 443 cho HTTPS) để cấp quyền truy cập vào tài nguyên của nó. Nếu không, nó là bắt buộc.

> [!NOTE]
> Dấu phân cách giữa scheme và authority là `://`. Dấu hai chấm phân tách scheme khỏi phần tiếp theo của URL, trong khi `//` cho biết phần tiếp theo của URL là authority.
>
> Một ví dụ về URL không sử dụng authority là ứng dụng thư (`mailto:foobar`). Nó chứa scheme nhưng không sử dụng thành phần authority. Do đó, dấu hai chấm không được theo sau bởi hai dấu gạch chéo và chỉ hoạt động như dấu phân cách giữa scheme và địa chỉ thư.

## Đường dẫn đến tài nguyên

![Đường dẫn đến file](mdn-url-path@x2.png)

`/path/to/myfile.html` là đường dẫn đến tài nguyên trên máy chủ Web. Trong những ngày đầu của Web, đường dẫn như thế này đại diện cho vị trí file vật lý trên máy chủ Web. Ngày nay, nó chủ yếu là sự trừu tượng hóa được xử lý bởi các máy chủ Web mà không có thực tế vật lý nào.

## Tham số

![Tham số](mdn-url-parameters@x2.png)

`?key1=value1&key2=value2` là các tham số bổ sung được cung cấp cho máy chủ Web. Những tham số đó là một danh sách các cặp khóa/giá trị được phân tách bằng ký hiệu `&`. Máy chủ Web có thể sử dụng các tham số đó để thực hiện thêm các tác vụ trước khi trả về tài nguyên. Mỗi máy chủ Web có các quy tắc riêng liên quan đến tham số, và cách đáng tin cậy duy nhất để biết liệu một máy chủ Web cụ thể có xử lý tham số không là bằng cách hỏi chủ sở hữu máy chủ Web.

## Mỏ neo

![Mỏ neo](mdn-url-anchor@x2.png)

`#SomewhereInTheDocument` là mỏ neo đến phần khác của chính tài nguyên đó. Mỏ neo đại diện cho một loại "dấu trang" bên trong tài nguyên, cung cấp cho trình duyệt hướng dẫn để hiển thị nội dung nằm tại điểm "đã đánh dấu" đó. Trong tài liệu HTML, ví dụ, trình duyệt sẽ cuộn đến điểm nơi mỏ neo được định nghĩa; trong tài liệu video hoặc âm thanh, trình duyệt sẽ cố gắng đến thời điểm mà mỏ neo đại diện. Đáng chú ý là phần sau **#**, còn được biết là **định danh phân mảnh**, không bao giờ được gửi đến máy chủ cùng với yêu cầu.

## Cách sử dụng URL

Bất kỳ URL nào cũng có thể được gõ ngay vào thanh địa chỉ của trình duyệt để truy cập tài nguyên đằng sau nó. Nhưng đây chỉ là phần nổi của tảng băng!

Ngôn ngữ {{Glossary("HTML")}} (xem [Cấu trúc nội dung với HTML](/en-US/docs/Learn_web_development/Core/Structuring_content)) sử dụng URL rộng rãi:

- để tạo liên kết đến các tài liệu khác với phần tử {{HTMLElement("a")}};
- để liên kết tài liệu với các tài nguyên liên quan qua các phần tử khác nhau như {{HTMLElement("link")}} hoặc {{HTMLElement("script")}};
- để hiển thị phương tiện như hình ảnh (với phần tử {{HTMLElement("img")}}), video (với phần tử {{HTMLElement("video")}}), âm thanh và nhạc (với phần tử {{HTMLElement("audio")}}), v.v.;
- để hiển thị các tài liệu HTML khác với phần tử {{HTMLElement("iframe")}}.

> [!NOTE]
> Khi chỉ định URL để tải tài nguyên như một phần của trang (chẳng hạn khi sử dụng `<script>`, `<audio>`, `<img>`, `<video>` và tương tự), bạn thường chỉ nên sử dụng URL HTTP và HTTPS, với một vài ngoại lệ (một ngoại lệ đáng chú ý là `data:`; xem [Data URLs](/en-US/docs/Web/URI/Reference/Schemes/data)). Sử dụng FTP, ví dụ, không an toàn và không còn được hỗ trợ bởi các trình duyệt hiện đại.

Các công nghệ khác, như {{Glossary("CSS")}} hoặc {{Glossary("JavaScript")}}, sử dụng URL rộng rãi, và đây thực sự là trái tim của Web.

## URL tuyệt đối và URL tương đối

Những gì chúng ta đã thấy ở trên được gọi là _URL tuyệt đối_, nhưng cũng có thứ gọi là _URL tương đối_. [Tiêu chuẩn URL](https://url.spec.whatwg.org/#absolute-url-string) định nghĩa cả hai — mặc dù nó sử dụng các thuật ngữ [_chuỗi URL tuyệt đối_](https://url.spec.whatwg.org/#absolute-url-string) và [_chuỗi URL tương đối_](https://url.spec.whatwg.org/#relative-url-string), để phân biệt chúng với [đối tượng URL](https://url.spec.whatwg.org/#url) (là các biểu diễn trong bộ nhớ của URL).

Hãy xem xét sự phân biệt giữa _tuyệt đối_ và _tương đối_ có nghĩa gì trong bối cảnh URL.

Các phần bắt buộc của URL phụ thuộc rất nhiều vào ngữ cảnh trong đó URL được sử dụng. Trong thanh địa chỉ của trình duyệt, URL không có bất kỳ ngữ cảnh nào, vì vậy bạn phải cung cấp URL đầy đủ (hoặc _tuyệt đối_), như những URL chúng ta đã thấy ở trên. Bạn không cần bao gồm giao thức (trình duyệt sử dụng HTTP theo mặc định) hoặc cổng (chỉ bắt buộc khi máy chủ Web đích đang sử dụng một số cổng bất thường), nhưng tất cả các phần khác của URL là cần thiết.

Khi URL được sử dụng trong tài liệu, chẳng hạn trong trang HTML, mọi thứ hơi khác một chút. Vì trình duyệt đã có URL của chính tài liệu đó, nó có thể sử dụng thông tin này để điền vào các phần còn thiếu của bất kỳ URL nào có trong tài liệu đó. Chúng ta có thể phân biệt giữa _URL tuyệt đối_ và _URL tương đối_ bằng cách chỉ xem phần _đường dẫn_ của URL. Nếu phần đường dẫn của URL bắt đầu bằng ký tự `/`, trình duyệt sẽ lấy tài nguyên đó từ gốc trên cùng của máy chủ, không tham chiếu đến ngữ cảnh được cung cấp bởi tài liệu hiện tại.

Hãy xem một số ví dụ để làm rõ hơn. Giả sử rằng các URL được định nghĩa từ trong tài liệu nằm tại URL sau: `https://developer.mozilla.org/en-US/docs/Learn_web_development`.

`https://developer.mozilla.org/en-US/docs/Learn_web_development` bản thân nó là URL tuyệt đối. Nó có tất cả các phần cần thiết để định vị tài nguyên mà nó trỏ đến.

Tất cả các URL sau đây là URL tương đối:

- URL tương đối theo scheme: `//developer.mozilla.org/en-US/docs/Learn_web_development` — chỉ thiếu giao thức. Trình duyệt sẽ sử dụng cùng giao thức như giao thức được dùng để tải tài liệu chứa URL đó.
- URL tương đối theo tên miền: `/en-US/docs/Learn_web_development` — thiếu cả giao thức và tên miền. Trình duyệt sẽ sử dụng cùng giao thức và cùng tên miền như giao thức được dùng để tải tài liệu chứa URL đó.
- Tài nguyên con: `Howto/Web_mechanics/What_is_a_URL` — thiếu giao thức và tên miền, và đường dẫn không bắt đầu bằng `/`. Trình duyệt sẽ cố gắng tìm tài liệu trong thư mục con của thư mục chứa tài nguyên hiện tại. Trong trường hợp này, chúng ta thực sự muốn đến URL này: `https://developer.mozilla.org/en-US/docs/Learn_web_development/Howto/Web_mechanics/What_is_a_URL`.
- Quay lại cây thư mục: `../Web/CSS/Reference` — thiếu giao thức và tên miền, và đường dẫn bắt đầu bằng `..`. Điều này được kế thừa từ thế giới hệ thống file UNIX — để nói với trình duyệt rằng chúng ta muốn đi lên một cấp. Ở đây chúng ta muốn đến URL này: `https://developer.mozilla.org/en-US/docs/Learn_web_development/../Web/CSS/Reference`, có thể được rút gọn thành: `https://developer.mozilla.org/en-US/docs/Web/CSS/Reference`.
- Chỉ mỏ neo: `#semantic_urls` - tất cả các phần đều thiếu ngoại trừ mỏ neo. Trình duyệt sẽ sử dụng URL của tài liệu hiện tại và thay thế hoặc thêm phần mỏ neo vào đó. Điều này hữu ích khi bạn muốn liên kết đến một phần cụ thể của tài liệu hiện tại.

## Tên người dùng và mật khẩu URL

Ít phổ biến hơn các phần URL đã thảo luận ở trên, bạn có thể thấy tên người dùng và mật khẩu được bao gồm trong URL.

Ví dụ:

```plain
https://username:password@www.example.com:80/
```

Khi được bao gồm, tên người dùng và mật khẩu được đặt giữa các ký tự `://` và authority, với dấu hai chấm giữa hai và ký hiệu at (`@`) ở cuối.

Tên người dùng và mật khẩu có thể được bao gồm trong URL khi truy cập các website sử dụng cơ chế bảo mật [xác thực HTTP](/en-US/docs/Web/HTTP/Guides/Authentication), để đăng nhập ngay vào website và bỏ qua hộp thoại tên người dùng/mật khẩu sẽ xuất hiện để nhập thông tin xác thực của bạn.

Trong khi bạn có thể vẫn thấy cơ chế này được sử dụng thực tế, nó đã bị phản đối vì lo ngại bảo mật, và các website hiện đại có xu hướng sử dụng các cơ chế khác để xác thực. Xem [Truy cập sử dụng thông tin xác thực trong URL](/en-US/docs/Web/HTTP/Guides/Authentication#access_using_credentials_in_the_url) để biết thêm chi tiết.

## URL ngữ nghĩa

Bất chấp hương vị kỹ thuật của chúng, URL đại diện cho điểm vào dễ đọc cho người dùng đến website. Chúng có thể được ghi nhớ, và bất kỳ ai cũng có thể nhập chúng vào thanh địa chỉ của trình duyệt. Con người là trung tâm của Web, và vì vậy được coi là thực hành tốt nhất để xây dựng những gì được gọi là [_URL ngữ nghĩa_](https://en.wikipedia.org/wiki/Semantic_URL). URL ngữ nghĩa sử dụng các từ có ý nghĩa vốn có mà bất kỳ ai cũng có thể hiểu, bất kể hiểu biết kỹ thuật của họ.

Ngữ nghĩa ngôn ngữ học tất nhiên không liên quan đến máy tính. Bạn có thể đã thường thấy các URL trông như hỗn hợp các ký tự ngẫu nhiên. Nhưng có nhiều lợi thế khi tạo URL dễ đọc:

- Dễ dàng hơn để bạn thao tác với chúng.
- Nó làm rõ mọi thứ cho người dùng về vị trí của họ, những gì họ đang làm, những gì họ đang đọc hoặc tương tác trên Web.
- Một số công cụ tìm kiếm có thể sử dụng những ngữ nghĩa đó để cải thiện việc phân loại các trang liên quan.

## Xem thêm

[Data URLs](/en-US/docs/Web/URI/Reference/Schemes/data): URL có tiền tố với scheme `data:`, cho phép người tạo nội dung nhúng các file nhỏ trực tiếp vào tài liệu.
