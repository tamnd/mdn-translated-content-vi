---
title: Xuất bản trang web của bạn
short-title: Xuất bản
slug: Learn_web_development/Getting_started/Your_first_website/Publishing_your_website
page-type: tutorial-chapter
sidebar: learnsidebar
---

{{PreviousMenuNext("Learn_web_development/Getting_started/Your_first_website/Adding_interactivity", "Learn_web_development/Getting_started/Web_standards", "Learn_web_development/Getting_started/Your_first_website")}}

Sau khi hoàn thành việc viết mã và tổ chức các tệp tạo nên trang web, bạn cần đưa tất cả lên mạng để mọi người có thể tìm thấy. Bài viết này giải thích cách đưa trang web mẫu của bạn lên mạng một cách dễ dàng.

> [!NOTE]
> Bạn sẽ cần có một trang web mẫu sẵn có trên máy tính cục bộ để làm theo bài viết này. Trang đó ít nhất phải chứa một tệp `index.html` hợp lệ. Nếu bạn chưa làm điều đó, chúng tôi khuyến nghị bạn xây dựng một trang bằng cách xem qua các bài viết trước trong mô-đun này, bắt đầu từ [Trang web của bạn trông như thế nào?](/en-US/docs/Learn_web_development/Getting_started/Your_first_website/What_will_your_website_look_like).

<table>
  <tbody>
    <tr>
      <th scope="row">Điều kiện tiên quyết:</th>
      <td>
        Quen thuộc cơ bản với hệ điều hành máy tính của bạn, phần mềm cơ bản bạn sẽ dùng để xây dựng trang web và hệ thống tệp.
      </td>
    </tr>
    <tr>
      <th scope="row">Kết quả học tập:</th>
      <td>
        <ul>
          <li>Các công cụ và khái niệm cơ bản liên quan đến việc xuất bản một trang web — lưu trữ web (hosting), tên miền (domain), chương trình FTP.</li>
          <li>Các tùy chọn lưu trữ thay thế có sẵn, ví dụ Google App Engine, GitHub và CodePen.</li>
          <li>Xuất bản một trang web bằng GitHub Pages.</li>
          <li>Lưu trữ web, cách mua nó, và cách đưa trang web lên mạng.</li>
          <li>Cách đăng ký một tên miền.</li>
        </ul>
      </td>
    </tr>
  </tbody>
</table>

## Các lựa chọn là gì?

Xuất bản một trang web là chủ đề phức tạp vì có nhiều cách để thực hiện. Bài viết này không cố gắng ghi lại tất cả các phương pháp có thể. Thay vào đó, nó giải thích ưu và nhược điểm của ba phương pháp thực tế cho người mới bắt đầu. Sau đó nó hướng dẫn qua một phương pháp có thể hoạt động ngay lập tức cho nhiều độc giả.

### Mua lưu trữ web và tên miền

Để có thêm quyền kiểm soát nội dung và giao diện trang web, hầu hết các chuyên gia/doanh nghiệp chọn mua lưu trữ web (web hosting) và tên miền (domain name):

- Lưu trữ web là không gian tệp được thuê trên [máy chủ web](/en-US/docs/Learn_web_development/Howto/Web_mechanics/What_is_a_web_server) của một công ty lưu trữ. Bạn đặt các tệp trang web lên máy chủ web. Máy chủ web cung cấp nội dung trang web cho khách truy cập.
- [Tên miền](/en-US/docs/Learn_web_development/Howto/Web_mechanics/What_is_a_domain_name) là địa chỉ web duy nhất nơi mọi người tìm thấy trang web của bạn, chẳng hạn như `https://www.mozilla.org` hoặc `https://www.bbc.co.uk`. Bạn có thể thuê tên miền của mình trong bao nhiêu năm tùy ý từ một **nhà đăng ký tên miền** (domain registrar).

Nếu bạn mua lưu trữ web _và_ tên miền từ cùng một công ty, chúng thường được cấu hình tự động để kết nối với nhau. Tuy nhiên, nếu bạn mua chúng từ các công ty riêng biệt, hoặc muốn chuyển lưu trữ sang công ty khác, bạn cần thực hiện một chút cấu hình để trỏ tên miền đến máy chủ đúng. Điều này để mọi người sẽ thấy trang web của bạn khi họ điều hướng đến địa chỉ web đó. Điều này thường được thực hiện bằng cách đăng nhập vào trang web của nhà đăng ký tên miền và đặt [nameserver](https://kinsta.com/blog/what-is-a-nameserver/) của tên miền thành những nameserver do công ty lưu trữ cung cấp.

Các công ty sử dụng nhiều cơ chế khác nhau để chuyển tệp lên máy chủ web. Nhiều công ty sẽ có nhiều hơn một tùy chọn; các tùy chọn điển hình bao gồm:

- Giao diện kéo và thả (bạn sẽ thấy ví dụ về điều này trong [Xuất bản qua GitHub](#publishing_via_github), phần tiếp theo).
- Chương trình {{Glossary("FTP", "File Transfer Protocol (FTP)")}} (Giao thức truyền tệp). Các chương trình FTP khác nhau rất nhiều, nhưng nhìn chung, bạn phải kết nối với máy chủ web bằng các thông tin chi tiết do công ty lưu trữ cung cấp (thường là tên người dùng, mật khẩu, tên máy chủ). Sau đó chương trình hiển thị các tệp cục bộ và tệp trên máy chủ web trong hai cửa sổ và cung cấp cách để bạn chuyển tệp qua lại.
- Giữ mã nguồn trang web trong kho lưu trữ GitHub (xem bên dưới) và cấp cho công ty lưu trữ quyền truy cập để họ có thể lấy nguồn, xây dựng nếu cần và xuất bản nó.
- Một số công ty sẽ cung cấp [công cụ dòng lệnh](/en-US/docs/Learn_web_development/Getting_started/Environment_setup/Command_line) để bạn sử dụng để chuyển tệp.

#### Mẹo tìm lưu trữ và tên miền

- MDN không quảng bá các công ty lưu trữ thương mại hoặc nhà đăng ký tên miền cụ thể. Để tìm công ty lưu trữ và nhà đăng ký, chỉ cần tìm kiếm "web hosting" và "domain names". Tất cả các nhà đăng ký sẽ có tính năng cho phép bạn kiểm tra xem tên miền bạn muốn có sẵn không.
- {{Glossary("ISP", "Nhà cung cấp dịch vụ internet")}} (ISP) tại nhà hoặc văn phòng của bạn có thể cung cấp dịch vụ lưu trữ hạn chế cho một trang web nhỏ. Bộ tính năng sẵn có sẽ bị hạn chế, nhưng nó có thể hoàn hảo cho các thử nghiệm đầu tiên của bạn.
- Cũng có các dịch vụ miễn phí như [Neocities](https://neocities.org/), [Google Sites](https://sites.google.com/) và [WordPress](https://wordpress.com/). Các dịch vụ này có thể bị giới hạn về phạm vi, nhưng đủ tốt cho các thử nghiệm ban đầu.

### Sử dụng công cụ trực tuyến

Một số công cụ cho phép bạn xuất bản trang web trực tuyến:

- [GitHub](https://github.com/) là trang "lập trình xã hội" (social coding). Nó cho phép bạn tải lên kho lưu trữ mã để lưu trữ trong hệ thống **kiểm soát phiên bản** (version control system) [Git](https://git-scm.com/). Sau đó bạn có thể cộng tác trên các dự án mã, và hệ thống là mã nguồn mở theo mặc định, có nghĩa là bất kỳ ai trên thế giới cũng có thể tìm thấy mã GitHub của bạn, sử dụng nó, học từ nó và cải thiện nó. GitHub có một tính năng rất hữu ích gọi là [GitHub Pages](https://pages.github.com/), cho phép bạn hiển thị mã trang web trực tiếp trên web.
- [Netlify](https://www.netlify.com/) là nền tảng lưu trữ web cung cấp lưu trữ cho các trang web tĩnh trực tiếp từ kho GitHub của bạn. Nó cũng cung cấp một số tính năng bổ sung, chẳng hạn như xem trước triển khai, hàm serverless và xử lý biểu mẫu.
- [Fly.io](https://fly.io/) là nền tảng cho phép bạn triển khai ứng dụng và cơ sở dữ liệu gần người dùng của bạn. Điều này phù hợp hơn nếu bạn có ứng dụng web yêu cầu dịch vụ backend.

Các tùy chọn này thường miễn phí, với bộ tính năng hạn chế.

### Sử dụng IDE dựa trên web như CodePen

Có một số ứng dụng web mô phỏng môi trường phát triển trang web, cho phép bạn viết HTML, CSS và JavaScript, sau đó được hiển thị và hiển thị trong ngăn đầu ra. Nhìn chung, các công cụ này dễ sử dụng, tốt cho học tập, tốt để chia sẻ mã (ví dụ: nếu bạn muốn chia sẻ kỹ thuật hoặc yêu cầu trợ giúp gỡ lỗi từ đồng nghiệp ở văn phòng khác) và miễn phí (cho các tính năng cơ bản). Chúng lưu trữ trang được hiển thị của bạn tại một địa chỉ web duy nhất. Tuy nhiên, các tính năng bị hạn chế và các ứng dụng này thường không cung cấp không gian lưu trữ cho các tài nguyên (như hình ảnh).

Hãy thử dùng một số ví dụ này để tìm ra cái nào phù hợp nhất với bạn:

- [Scrimba](https://scrimba.com/new?via=mdn) <sup>[_MDN learning partner_](/en-US/docs/MDN/Writing_guidelines/Learning_content#partner_links_and_embeds)</sup>
- [JSFiddle](https://jsfiddle.net/)
- [JSBin](https://jsbin.com/)
- [CodePen](https://codepen.io/)

## Xuất bản qua GitHub

Bây giờ hãy xem cách xuất bản trang web của bạn qua GitHub Pages.

1. Trước tiên, [đăng ký GitHub](https://github.com/) và xác minh địa chỉ email của bạn.
2. Tiếp theo, bạn cần [tạo một kho lưu trữ](https://github.com/new) để lưu trữ tệp. Trên trang này:
   1. Trong hộp _Repository name_ (Tên kho lưu trữ), nhập _username_.github.io, trong đó _username_ là tên người dùng của bạn. Ví dụ: người bạn của chúng tôi là Bob Smith sẽ nhập _bobsmith.github.io_.
   2. Nhấp vào nút _Create repository_ (Tạo kho lưu trữ) ở cuối trang.
3. Trên trang tiếp theo, tìm liên kết _uploading an existing file_ (tải lên tệp hiện có) và nhấp vào đó. Thao tác này sẽ đưa bạn đến trang tải lên tệp.
4. Tại thời điểm này, bạn sẽ có thể kéo và thả tệp từ hệ thống tệp cục bộ lên trang web để tải chúng lên kho lưu trữ GitHub. Để thực hiện:
   1. Mở cửa sổ trình khám phá tệp/finder trên máy tính của bạn.
   2. Đảm bảo bạn có thể thấy cả cửa sổ trình khám phá tệp _và_ cửa sổ trình duyệt web — đặt chúng cạnh nhau trên màn hình của bạn.
   3. Điều hướng cửa sổ trình khám phá tệp đến thư mục chứa trang web mẫu của bạn.
      > [!NOTE]
      > Đảm bảo thư mục của bạn có tệp `index.html`.
   4. Chọn tất cả các tệp của trang web mẫu (ví dụ: sử dụng phím tắt bàn phím <kbd>Ctrl</kbd> + <kbd>A</kbd>, hoặc <kbd>Cmd</kbd> + <kbd>A</kbd> trên macOS).
   5. Kéo các tệp từ trình khám phá tệp qua phần "Drag files here to add them to your repository" (Kéo tệp vào đây để thêm vào kho lưu trữ) của trang GitHub.
   6. Đường viền và văn bản của phần thay đổi để cho biết có thể thả tệp. Hãy thả các tệp ở thời điểm này.
   7. Nhấp vào nút _Commit changes_ (Xác nhận thay đổi) ở cuối trang.
5. Điều hướng trình duyệt của bạn đến _username_.github.io để xem trang web của bạn trực tuyến. Ví dụ: với tên người dùng _chrisdavidmills_, hãy truy cập [_chrisdavidmills_.github.io](https://chrisdavidmills.github.io/).

   > [!NOTE]
   > Có thể mất vài phút để trang web của bạn hoạt động. Nếu trang web của bạn không hiển thị ngay lập tức, hãy đợi vài phút và thử lại.

Để tìm hiểu thêm, hãy xem [GitHub Pages Help](https://docs.github.com/en/pages/getting-started-with-github-pages).

## Đọc thêm

- [Máy chủ web là gì](/en-US/docs/Learn_web_development/Howto/Web_mechanics/What_is_a_web_server)
- [Tìm hiểu về tên miền](/en-US/docs/Learn_web_development/Howto/Web_mechanics/What_is_a_domain_name)
- [Chi phí để làm gì đó trên web là bao nhiêu?](/en-US/docs/Learn_web_development/Howto/Tools_and_setup/How_much_does_it_cost)
- [Deploy a Website](https://www.codecademy.com/learn/deploy-a-website): Một hướng dẫn hay từ Codecademy đi sâu hơn và hiển thị một số kỹ thuật bổ sung.

{{PreviousMenuNext("Learn_web_development/Getting_started/Your_first_website/Adding_interactivity", "Learn_web_development/Getting_started/Web_standards", "Learn_web_development/Getting_started/Your_first_website")}}
