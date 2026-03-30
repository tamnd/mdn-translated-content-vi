---
title: Từ object đến iframe — các công nghệ nhúng tổng quát
short-title: Công nghệ nhúng
slug: Learn_web_development/Core/Structuring_content/General_embedding_technologies
page-type: learn-module-chapter
sidebar: learnsidebar
---

Các nhà phát triển thường nghĩ đến việc nhúng phương tiện như hình ảnh, video và âm thanh vào các trang web. Trong bài viết này, chúng ta thực hiện một bước đi hơi khác, xem xét một số phần tử cho phép bạn nhúng nhiều loại nội dung khác nhau vào trang web của mình: các phần tử {{htmlelement("iframe")}}, {{htmlelement("embed")}} và {{htmlelement("object")}}. `<iframe>` dùng để nhúng các trang web khác, và hai phần tử còn lại cho phép bạn nhúng các tài nguyên bên ngoài như tệp PDF.

<table>
  <tbody>
    <tr>
      <th scope="row">Điều kiện tiên quyết:</th>
      <td>
        <a
          href="/en-US/docs/Learn_web_development/Getting_started/Environment_setup/Installing_software"
          >Phần mềm cơ bản đã được cài đặt</a
        >, kiến thức cơ bản về
        <a
          href="/en-US/docs/Learn_web_development/Getting_started/Environment_setup/Dealing_with_files"
          >làm việc với tệp</a
        >, quen thuộc với <a href="/en-US/docs/Learn_web_development/Core/Structuring_content/"
          >kiến thức cơ bản về HTML</a>.
      </td>
    </tr>
    <tr>
      <th scope="row">Mục tiêu:</th>
      <td>
        Tìm hiểu cách nhúng các mục vào trang web bằng cách sử dụng
        {{htmlelement("object")}}, {{htmlelement("embed")}}, và
        {{htmlelement("iframe")}}, như tài liệu PDF và các trang web khác.
      </td>
    </tr>
  </tbody>
</table>

## Lịch sử ngắn về nhúng

Ngày xưa trên Web, việc sử dụng **frame** để tạo trang web rất phổ biến — các phần nhỏ của trang web được lưu trữ trong các trang HTML riêng lẻ. Những phần này được nhúng trong một tài liệu chính gọi là **frameset**, cho phép bạn chỉ định vùng trên màn hình mà mỗi frame chiếm, giống như việc định cỡ các cột và hàng của bảng. Điều này được coi là đỉnh cao của sự thú vị vào giữa đến cuối những năm 90, và có bằng chứng rằng việc chia trang web thành các phần nhỏ hơn như thế này tốt hơn cho tốc độ tải xuống — đặc biệt đáng chú ý với kết nối mạng chậm như vậy vào thời điểm đó. Tuy nhiên, chúng có nhiều vấn đề, vượt xa bất kỳ ưu điểm nào khi tốc độ mạng nhanh hơn, vì vậy bạn không thấy chúng được sử dụng nữa.

Một thời gian sau (cuối những năm 90, đầu những năm 2000), các công nghệ plugin trở nên rất phổ biến, như [Java Applets](/en-US/docs/Glossary/Java) và [Flash](/en-US/docs/Glossary/Adobe_Flash) — những công nghệ này cho phép các nhà phát triển web nhúng nội dung phong phú vào trang web như video và hoạt hình, những thứ không có sẵn qua HTML đơn thuần. Việc nhúng các công nghệ này đạt được qua các phần tử như {{htmlelement("object")}}, và {{htmlelement("embed")}} ít được sử dụng hơn, và chúng rất hữu ích vào thời điểm đó. Kể từ đó, chúng đã trở nên lỗi thời do nhiều vấn đề, bao gồm khả năng tiếp cận, bảo mật, kích thước tệp, v.v. Ngày nay, các trình duyệt lớn đã ngừng hỗ trợ các plugin như Flash.

Cuối cùng, phần tử {{htmlelement("iframe")}} đã xuất hiện (cùng với các cách nhúng nội dung khác, như {{htmlelement("canvas")}}, {{htmlelement("video")}}, v.v.) Điều này cung cấp cách nhúng toàn bộ tài liệu web vào trong một tài liệu khác, như thể đó là một {{htmlelement("img")}} hoặc phần tử tương tự, và được sử dụng thường xuyên ngày nay.

Với bài học lịch sử đã xong, hãy tiếp tục và xem cách sử dụng một số trong số này.

## Khám phá các cách sử dụng nhúng cổ điển

Trong bài viết này, chúng ta sẽ đi thẳng vào một bài tập, để ngay lập tức cung cấp cho bạn ý tưởng về công nghệ nhúng hữu ích cho điều gì. Thế giới trực tuyến rất quen thuộc với [YouTube](https://www.youtube.com/), nhưng nhiều người không biết về một số tiện ích chia sẻ mà nó cung cấp.

1. Đầu tiên, hãy mở [MDN Playground](/en-US/play).
2. Bây giờ chúng ta sẽ xem YouTube cho phép chúng ta nhúng video vào bất kỳ trang nào chúng ta muốn bằng cách sử dụng {{htmlelement("iframe")}} như thế nào.
   1. Hãy đến YouTube và tìm một video bạn thích.
   2. Bên dưới video, bạn sẽ thấy nút _Share_ — chọn nút này để hiển thị các tùy chọn chia sẻ.
   3. Chọn nút _Embed_ và bạn sẽ nhận được một số mã `<iframe>` — sao chép mã này.
   4. Dán vào ngăn _HTML_ trong Playground, và xem kết quả là gì trong đầu ra.
3. Để thêm điểm, bạn cũng có thể thử nhúng [Google Map](https://www.google.com/maps/) trong Playground:
   1. Hãy đến Google Maps và tìm bản đồ bạn thích.
   2. Nhấp vào "hamburger menu" (ba dòng ngang) ở góc trên bên trái của giao diện người dùng.
   3. Chọn tùy chọn _Share or embed map_.
   4. Chọn tùy chọn _Embed a map_, sẽ cung cấp cho bạn một số mã `<iframe>` — sao chép nó.
   5. Dán vào ngăn _HTML_ trong Playground, và xem kết quả là gì trong đầu ra.

Nếu bạn mắc lỗi, bạn luôn có thể đặt lại bằng cách sử dụng nút _Reset_ trong Playground.

## Chi tiết về iframe

Vậy, điều đó thật dễ dàng và thú vị, phải không? Các phần tử {{htmlelement("iframe")}} được thiết kế để cho phép bạn nhúng các tài liệu web khác vào tài liệu hiện tại. Điều này rất tốt để tích hợp nội dung của bên thứ ba vào trang web của bạn mà bạn có thể không có quyền kiểm soát trực tiếp và không muốn phải triển khai phiên bản của riêng mình — như video từ các nhà cung cấp video trực tuyến, hệ thống bình luận như [Disqus](https://disqus.com/), bản đồ từ các nhà cung cấp bản đồ trực tuyến, biểu ngữ quảng cáo, v.v. Ngay cả các ví dụ có thể chỉnh sửa trực tiếp bạn đã sử dụng trong khóa học này cũng được triển khai bằng `<iframe>`.

Trước khi bắt đầu sử dụng các phần tử `<iframe>`, cần lưu ý một số vấn đề bảo mật.
Giả sử bạn muốn đưa từ điển MDN vào một trong các trang web của bạn bằng cách sử dụng phần tử {{htmlelement("iframe")}}, bạn có thể thử điều gì đó như ví dụ mã tiếp theo.
Nếu bạn thêm mã dưới đây vào một trong các trang của mình, bạn có thể ngạc nhiên khi thấy thông báo lỗi thay vì trang từ điển:

```html
<iframe
  src="https://developer.mozilla.org/en-US/docs/Glossary"
  width="100%"
  height="500"
  allowfullscreen
  sandbox>
</iframe>
```

```css
iframe {
  border: none;
}
```

Nếu bạn xem console của trình duyệt, bạn sẽ thấy thông báo lỗi như sau:

```plain
Refused to display 'https://developer.mozilla.org/' in a frame because it set 'X-Frame-Options' to 'deny'.
```

Phần [Bảo mật](#security_concerns) bên dưới đi vào chi tiết hơn về lý do bạn thấy lỗi này, nhưng trước tiên, hãy xem mã của chúng ta đang làm gì.

Ví dụ bao gồm những điều cần thiết tối thiểu để sử dụng `<iframe>`:

- [`border: none`](/en-US/docs/Web/CSS/Reference/Properties/border)
  - : Nếu được sử dụng, `<iframe>` được hiển thị mà không có đường viền xung quanh. Nếu không, theo mặc định, các trình duyệt hiển thị `<iframe>` với đường viền xung quanh (thường không mong muốn).
- [`allowfullscreen`](/en-US/docs/Web/HTML/Reference/Elements/iframe#allowfullscreen)
  - : Nếu được đặt, `<iframe>` có thể được đặt ở chế độ toàn màn hình bằng cách sử dụng [Fullscreen API](/en-US/docs/Web/API/Fullscreen_API) (hơi ngoài phạm vi của bài viết này).
- [`src`](/en-US/docs/Web/HTML/Reference/Elements/iframe#src)
  - : Thuộc tính này, như với {{htmlelement("video")}}/{{htmlelement("img")}}, chứa đường dẫn trỏ đến URL của tài liệu cần nhúng.
- [`width`](/en-US/docs/Web/HTML/Reference/Elements/iframe#width) và [`height`](/en-US/docs/Web/HTML/Reference/Elements/iframe#height)
  - : Các thuộc tính này chỉ định chiều rộng và chiều cao bạn muốn iframe có.
- [`sandbox`](/en-US/docs/Web/HTML/Reference/Elements/iframe#sandbox)
  - : Thuộc tính này, hoạt động trong các trình duyệt mới hơn một chút so với phần còn lại của các tính năng `<iframe>` (ví dụ: IE 10 trở lên), yêu cầu cài đặt bảo mật nâng cao; chúng ta sẽ nói thêm về điều này trong phần tiếp theo.

> [!NOTE]
> Để cải thiện tốc độ, bạn nên đặt thuộc tính `src` của iframe bằng JavaScript sau khi nội dung chính đã được tải xong. Điều này làm cho trang của bạn có thể sử dụng được sớm hơn và giảm thời gian tải trang chính thức (một chỉ số {{glossary("SEO")}} quan trọng.)

### Các mối quan tâm bảo mật

Ở trên, chúng ta đã đề cập đến các mối quan tâm bảo mật — hãy đi vào chi tiết hơn một chút. Chúng tôi không mong bạn hiểu hoàn hảo tất cả nội dung này ngay lần đầu; chúng tôi chỉ muốn làm bạn nhận thức được mối quan tâm này và cung cấp tài liệu tham khảo để bạn quay lại khi bạn trở nên có kinh nghiệm hơn và bắt đầu xem xét sử dụng `<iframe>` trong các thí nghiệm và công việc của bạn. Ngoài ra, không cần phải sợ hãi và không sử dụng `<iframe>` — bạn chỉ cần cẩn thận. Hãy đọc tiếp…

Các nhà sản xuất trình duyệt và các nhà phát triển Web đã học được bài học khó khăn rằng iframe là mục tiêu phổ biến (thuật ngữ chính thức: **vectơ tấn công**) cho những người xấu trên Web (thường được gọi là **hacker**, hoặc chính xác hơn là **cracker**) để tấn công nếu họ đang cố gắng sửa đổi trang web của bạn một cách độc hại, hoặc lừa người dùng làm điều gì đó họ không muốn làm, như tiết lộ thông tin nhạy cảm như tên người dùng và mật khẩu. Vì điều này, các kỹ sư đặc tả và nhà phát triển trình duyệt đã phát triển nhiều cơ chế bảo mật khác nhau để làm cho `<iframe>` an toàn hơn, và còn có các phương pháp tốt nhất cần xem xét — chúng ta sẽ đề cập một số bên dưới.

> [!NOTE]
> [Clickjacking](/en-US/docs/Web/Security/Attacks/Clickjacking) là một loại tấn công iframe phổ biến nơi các hacker nhúng một iframe vô hình vào tài liệu của bạn (hoặc nhúng tài liệu của bạn vào trang web độc hại của riêng họ) và sử dụng nó để chặn các tương tác của người dùng. Đây là cách phổ biến để đánh lừa người dùng hoặc đánh cắp dữ liệu nhạy cảm.

Một ví dụ nhanh trước tiên — thử tải ví dụ trước chúng ta đã hiển thị ở trên vào trình duyệt của bạn — bạn có thể [tìm thấy nó trực tiếp trên GitHub](https://mdn.github.io/learning-area/html/multimedia-and-embedding/other-embedding-technologies/iframe-detail.html) ([xem mã nguồn](https://github.com/mdn/learning-area/blob/main/html/multimedia-and-embedding/other-embedding-technologies/iframe-detail.html) cũng vậy.) Thay vì trang bạn mong đợi, bạn có thể sẽ thấy một loại thông báo đại ý "Tôi không thể mở trang này", và nếu bạn nhìn vào _Console_ trong [công cụ dành cho nhà phát triển trình duyệt](/en-US/docs/Learn_web_development/Howto/Tools_and_setup/What_are_browser_developer_tools), bạn sẽ thấy thông báo cho bạn biết tại sao. Trong Firefox, bạn sẽ được thông báo điều gì đó như _The loading of "https\://developer.mozilla.org/en-US/docs/Glossary" in a frame is denied by "X-Frame-Options" directive set to "DENY"_. Điều này là vì các nhà phát triển đã xây dựng MDN đã bao gồm một cài đặt trên máy chủ phục vụ các trang web để ngăn chúng bị nhúng trong `<iframe>` (xem [Cấu hình chỉ thị CSP](#configure_csp_directives), bên dưới.) Điều này hợp lý — toàn bộ trang MDN thực sự không có ý nghĩa khi nhúng vào các trang khác trừ khi bạn muốn làm điều gì đó như nhúng chúng vào trang web của mình và cho rằng chúng là của bạn — hoặc cố gắng đánh cắp dữ liệu thông qua [clickjacking](/en-US/docs/Web/Security/Attacks/Clickjacking), đây đều là những việc thực sự tệ để làm. Ngoài ra, nếu tất cả mọi người bắt đầu làm điều này, tất cả băng thông bổ sung sẽ bắt đầu tốn của Mozilla rất nhiều tiền.

#### Chỉ nhúng khi cần thiết

Đôi khi có ý nghĩa khi nhúng nội dung của bên thứ ba — như video youtube và bản đồ — nhưng bạn có thể tự mình tránh nhiều vấn đề đau đầu nếu bạn chỉ nhúng nội dung của bên thứ ba khi hoàn toàn cần thiết. Một quy tắc tốt cho bảo mật web là _"Bạn không bao giờ có thể quá thận trọng. Nếu bạn tự làm, hãy kiểm tra lại. Nếu người khác làm, hãy giả sử nó nguy hiểm cho đến khi được chứng minh ngược lại."_

Ngoài bảo mật, bạn cũng nên nhận thức về các vấn đề sở hữu trí tuệ. Hầu hết nội dung đều có bản quyền, ngoại tuyến và trực tuyến, ngay cả nội dung bạn có thể không mong đợi (ví dụ: hầu hết hình ảnh trên [Wikimedia Commons](https://commons.wikimedia.org/wiki/Main_Page)). Đừng bao giờ hiển thị nội dung trên trang web của bạn trừ khi bạn sở hữu nó hoặc chủ sở hữu đã cho bạn sự cho phép rõ ràng bằng văn bản. Hình phạt cho vi phạm bản quyền là nghiêm trọng. Một lần nữa, bạn không bao giờ có thể quá thận trọng.

Nếu nội dung được cấp phép, bạn phải tuân theo các điều khoản cấp phép. Ví dụ, nội dung trên MDN được [cấp phép theo CC-BY-SA](/en-US/docs/MDN/Writing_guidelines/Attrib_copyright_license#documentation). Điều đó có nghĩa là bạn phải [ghi công chúng tôi đúng cách](https://wiki.creativecommons.org/wiki/Best_practices_for_attribution) khi bạn trích dẫn nội dung của chúng tôi, ngay cả khi bạn thực hiện các thay đổi đáng kể.

#### Sử dụng HTTPS

{{Glossary("HTTPS")}} là phiên bản mã hóa của {{Glossary("HTTP")}}. Bạn nên phục vụ trang web của mình bằng HTTPS bất cứ khi nào có thể:

1. HTTPS giảm nguy cơ nội dung từ xa đã bị giả mạo trong quá trình truyền.
2. HTTPS ngăn nội dung được nhúng truy cập nội dung trong tài liệu cha của bạn, và ngược lại.

Việc kích hoạt HTTPS cho trang web yêu cầu cài đặt chứng chỉ bảo mật đặc biệt. Nhiều nhà cung cấp hosting cung cấp hosting hỗ trợ HTTPS mà không cần bạn phải thực hiện bất kỳ thiết lập nào để đặt chứng chỉ vào vị trí. Nhưng nếu bạn _cần_ thiết lập hỗ trợ HTTPS cho trang web của mình, [Let's Encrypt](https://letsencrypt.org/) cung cấp các công cụ và hướng dẫn bạn có thể sử dụng để tự động tạo và cài đặt chứng chỉ cần thiết — với hỗ trợ tích hợp cho các máy chủ web được sử dụng rộng rãi nhất, bao gồm máy chủ web Apache, Nginx và các máy chủ khác. Công cụ Let's Encrypt được thiết kế để làm cho quá trình này đơn giản nhất có thể, vì vậy thực sự không có lý do tốt nào để tránh sử dụng nó hoặc các phương tiện khác để kích hoạt HTTPS cho trang web của bạn.

> [!NOTE]
> [GitHub pages](/en-US/docs/Learn_web_development/Howto/Tools_and_setup/Using_GitHub_pages) cho phép nội dung được phục vụ qua HTTPS theo mặc định.
> Nếu bạn đang sử dụng nhà cung cấp hosting khác, bạn nên kiểm tra hỗ trợ họ cung cấp để phục vụ nội dung với HTTPS.

#### Luôn sử dụng thuộc tính `sandbox`

Bạn muốn cung cấp cho những kẻ tấn công càng ít quyền lực càng tốt để làm điều xấu trên trang web của bạn, do đó bạn nên cung cấp cho nội dung được nhúng _chỉ các quyền cần thiết để thực hiện công việc của nó._ Tất nhiên, điều này cũng áp dụng cho nội dung của riêng bạn. Container cho mã nơi nó có thể được sử dụng phù hợp — hoặc để thử nghiệm — nhưng không thể gây hại cho phần còn lại của codebase (dù vô tình hay cố ý) được gọi là [sandbox](<https://en.wikipedia.org/wiki/Sandbox_(computer_security)>).

Nội dung không được sandboxed có thể thực thi JavaScript, gửi form, kích hoạt cửa sổ popup, v.v. Theo mặc định, bạn nên áp đặt tất cả các hạn chế có sẵn bằng cách sử dụng thuộc tính `sandbox` không có tham số, như được hiển thị trong ví dụ trước của chúng ta.

Nếu thực sự cần thiết, bạn có thể thêm lại các quyền từng cái một (bên trong giá trị thuộc tính `sandbox=""`) — xem mục tham khảo [`sandbox`](/en-US/docs/Web/HTML/Reference/Elements/iframe#sandbox) để biết tất cả các tùy chọn có sẵn. Một lưu ý quan trọng là bạn _không bao giờ_ nên thêm cả `allow-scripts` và `allow-same-origin` vào thuộc tính `sandbox` của mình — trong trường hợp đó, nội dung được nhúng có thể bỏ qua [Chính sách cùng nguồn](/en-US/docs/Glossary/Same-origin_policy) ngăn các trang chạy script, và sử dụng JavaScript để tắt sandboxing hoàn toàn.

> [!NOTE]
> Sandboxing không cung cấp bảo vệ nếu kẻ tấn công có thể lừa người dùng truy cập nội dung độc hại trực tiếp (bên ngoài `iframe`). Nếu có bất kỳ khả năng nào nội dung nhất định có thể độc hại (ví dụ: nội dung do người dùng tạo), vui lòng phục vụ nó từ một {{glossary("domain")}} khác với trang chính của bạn.

#### Cấu hình chỉ thị CSP

{{Glossary("CSP")}} là viết tắt của **[chính sách bảo mật nội dung](/en-US/docs/Web/HTTP/Guides/CSP)** và cung cấp [một tập hợp HTTP Header](/en-US/docs/Web/HTTP/Reference/Headers/Content-Security-Policy) (siêu dữ liệu được gửi cùng với các trang web của bạn khi chúng được phục vụ từ máy chủ web) được thiết kế để cải thiện bảo mật của tài liệu HTML của bạn. Khi nói đến việc bảo mật `<iframe>`, bạn có thể _[cấu hình máy chủ của mình để gửi tiêu đề `X-Frame-Options` phù hợp.](/en-US/docs/Web/HTTP/Reference/Headers/X-Frame-Options)_ Điều này có thể ngăn các trang web khác nhúng nội dung của bạn trong các trang web của họ (điều này sẽ cho phép [clickjacking](/en-US/docs/Web/Security/Attacks/Clickjacking) và hàng loạt các cuộc tấn công khác), đây chính xác là những gì các nhà phát triển MDN đã làm, như chúng ta đã thấy trước đó.

> [!NOTE]
> Bạn có thể đọc bài đăng của Frederik Braun [On the X-Frame-Options Security Header](https://blog.mozilla.org/security/2013/12/12/on-the-x-frame-options-security-header/) để biết thêm thông tin nền về chủ đề này. Rõ ràng, nó khá ngoài phạm vi để giải thích đầy đủ trong bài viết này.

## Các phần tử \<embed> và \<object>

Các phần tử {{htmlelement("embed")}} và {{htmlelement("object")}} phục vụ một chức năng khác với {{htmlelement("iframe")}} — những phần tử này là các công cụ nhúng đa năng để nhúng nội dung bên ngoài, chẳng hạn như PDF.

Tuy nhiên, bạn khó có thể sử dụng các phần tử này nhiều. Nếu bạn cần hiển thị PDF, thường tốt hơn là liên kết đến chúng, thay vì nhúng chúng trong trang.

Về mặt lịch sử, các phần tử này cũng đã được sử dụng để nhúng nội dung được xử lý bởi {{Glossary("Plugin", "plugin")}} trình duyệt như {{Glossary("Adobe Flash")}}, nhưng công nghệ này hiện đã lỗi thời và không được hỗ trợ bởi các trình duyệt hiện đại.

Nếu bạn cần nhúng nội dung plugin, đây là loại thông tin bạn sẽ cần, tối thiểu:

<table class="standard-table no-markdown">
  <thead>
    <tr>
      <th scope="col"></th>
      <th scope="col">{{htmlelement("embed")}}</th>
      <th scope="col">{{htmlelement("object")}}</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td>{{glossary("URL")}} của nội dung được nhúng</td>
      <td><a href="/en-US/docs/Web/HTML/Reference/Elements/embed#src"><code>src</code></a></td>
      <td><a href="/en-US/docs/Web/HTML/Reference/Elements/object#data"><code>data</code></a></td>
    </tr>
    <tr>
      <td>
        <em>Chính xác </em>{{glossary("MIME type", "loại phương tiện")}}
        của nội dung được nhúng
      </td>
      <td><a href="/en-US/docs/Web/HTML/Reference/Elements/embed#type"><code>type</code></a></td>
      <td><a href="/en-US/docs/Web/HTML/Reference/Elements/object#type"><code>type</code></a></td>
    </tr>
    <tr>
      <td>
        Chiều cao và chiều rộng (tính bằng pixel CSS) của hộp được kiểm soát bởi plugin
      </td>
      <td>
         <a href="/en-US/docs/Web/HTML/Reference/Elements/embed#height"><code>height</code></a><br /><a href="/en-US/docs/Web/HTML/Reference/Elements/embed#width"><code>width</code></a>
      </td>
      <td>
         <a href="/en-US/docs/Web/HTML/Reference/Elements/object#height"><code>height</code></a><br /><a href="/en-US/docs/Web/HTML/Reference/Elements/object#width"><code>width</code></a>
      </td>
    </tr>
    <tr>
      <td>Nội dung HTML độc lập như dự phòng cho tài nguyên không có sẵn</td>
      <td>Không được hỗ trợ (<code>&#x3C;noembed></code> đã lỗi thời)</td>
      <td>
        Chứa trong thẻ mở và đóng
        <code>&#x3C;object></code>
      </td>
    </tr>
  </tbody>
</table>

Hãy xem ví dụ `<object>` nhúng PDF vào trang (xem [ví dụ trực tiếp](https://mdn.github.io/learning-area/html/multimedia-and-embedding/other-embedding-technologies/object-pdf.html) và [mã nguồn](https://github.com/mdn/learning-area/blob/main/html/multimedia-and-embedding/other-embedding-technologies/object-pdf.html)):

```html
<object data="my-pdf.pdf" type="application/pdf" width="800" height="1200">
  <p>
    You don't have a PDF plugin, but you can
    <a href="my-pdf.pdf">download the PDF file. </a>
  </p>
</object>
```

PDF là bước chuyển tiếp cần thiết giữa giấy và kỹ thuật số, nhưng chúng đặt ra nhiều [thách thức về khả năng tiếp cận](https://webaim.org/techniques/acrobat/acrobat) và có thể khó đọc trên màn hình nhỏ. Chúng vẫn có xu hướng phổ biến trong một số vòng, nhưng tốt hơn nhiều là liên kết đến chúng để chúng có thể được tải xuống hoặc đọc trên một trang riêng biệt, thay vì nhúng chúng vào trang web.

## Tóm tắt

Chủ đề nhúng nội dung khác vào tài liệu web có thể nhanh chóng trở nên rất phức tạp, vì vậy trong bài viết này, chúng tôi đã cố gắng giới thiệu nó theo cách đơn giản, quen thuộc sẽ ngay lập tức có vẻ liên quan, trong khi vẫn gợi ý về một số tính năng nâng cao hơn của các công nghệ liên quan. Để bắt đầu, bạn ít có khả năng sử dụng nhúng cho nhiều hơn là bao gồm nội dung của bên thứ ba như bản đồ và video trên các trang của mình. Tuy nhiên, khi bạn trở nên có kinh nghiệm hơn, bạn có khả năng bắt đầu tìm thấy nhiều cách sử dụng hơn cho chúng.

Có nhiều công nghệ khác liên quan đến việc nhúng nội dung bên ngoài ngoài những công nghệ chúng ta đã thảo luận ở đây. Chúng ta đã thấy một số trong các bài viết trước đó, như {{htmlelement("video")}}, {{htmlelement("audio")}}, và {{htmlelement("img")}}, nhưng còn nhiều điều khác để khám phá, như {{htmlelement("canvas")}} cho đồ họa 2D và 3D được tạo bởi JavaScript, và {{SVGElement("svg")}} để nhúng đồ họa véc-tơ.
