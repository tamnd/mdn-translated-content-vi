---
title: How do you upload your files to a web server?
slug: Learn_web_development/Howto/Tools_and_setup/Upload_files_to_a_web_server
page-type: learn-faq
sidebar: learn-how-to
---

Bài viết này trình bày cách xuất bản trang web của bạn trực tuyến bằng các công cụ truyền tệp.

<table>
  <tbody>
    <tr>
      <th scope="row">Điều kiện tiên quyết:</th>
      <td>
        Bạn phải biết
        <a href="/en-US/docs/Learn_web_development/Howto/Web_mechanics/What_is_a_web_server"
          >máy chủ web là gì</a
        >
        và
        <a href="/en-US/docs/Learn_web_development/Howto/Web_mechanics/What_is_a_domain_name"
          >tên miền hoạt động như thế nào</a
        >. Bạn cũng phải biết cách
        <a
          href="/en-US/docs/Learn_web_development/Howto/Tools_and_setup/set_up_a_local_testing_server"
          >thiết lập môi trường cơ bản</a
        >
        và cách
        <a href="/en-US/docs/Learn_web_development/Getting_started/Your_first_website"
          >viết một trang web đơn giản</a
        >.
      </td>
    </tr>
    <tr>
      <th scope="row">Mục tiêu:</th>
      <td>
        Tìm hiểu cách đẩy tệp lên máy chủ bằng các công cụ truyền tệp khác nhau có sẵn.
      </td>
    </tr>
  </tbody>
</table>

## Tóm tắt

Nếu bạn đã xây dựng một trang web đơn giản (xem [Kiến thức cơ bản về HTML](/en-US/docs/Learn_web_development/Getting_started/Your_first_website/Creating_the_content) để tham khảo), bạn có thể muốn đưa nó lên trực tuyến, trên một máy chủ web. Trong bài viết này, chúng tôi sẽ thảo luận về cách làm điều đó, sử dụng các tùy chọn có sẵn khác nhau như máy khách SFTP, RSync và GitHub.

## SFTP

Có nhiều máy khách SFTP khác nhau. Bản demo của chúng tôi đề cập đến [FileZilla](https://filezilla-project.org/), vì nó miễn phí và có sẵn cho Windows, macOS và Linux. Để cài đặt FileZilla, hãy đến [trang tải FileZilla](https://filezilla-project.org/download.php?type=client), nhấp vào nút Tải lớn, sau đó cài đặt từ tệp cài đặt theo cách thông thường.

> [!NOTE]
> Tất nhiên có nhiều lựa chọn khác. Xem [Công cụ xuất bản](/en-US/docs/Learn_web_development/Howto/Tools_and_setup/How_much_does_it_cost#publishing_tools) để biết thêm thông tin.

Mở ứng dụng FileZilla; bạn sẽ thấy giao diện như thế này:

![Ảnh chụp màn hình giao diện người dùng của ứng dụng FileZilla FTP. Ô nhập Host đang được chú ý.](filezilla-ui.png)

### Đăng nhập

Trong ví dụ này, chúng ta sẽ giả sử nhà cung cấp dịch vụ lưu trữ của chúng ta (dịch vụ sẽ lưu trữ máy chủ HTTP web của chúng ta) là một công ty hư cấu "Example Hosting Provider" với URL trông như thế này: `mypersonalwebsite.examplehostingprovider.net`.

Chúng ta vừa mở một tài khoản và nhận được thông tin này từ họ:

> Chúc mừng bạn đã mở tài khoản tại Example Hosting Provider.
>
> Tài khoản của bạn là: `demozilla`
>
> Trang web của bạn sẽ được xem tại `demozilla.examplehostingprovider.net`
>
> Để xuất bản lên tài khoản này, vui lòng kết nối qua SFTP với các thông tin đăng nhập sau:
>
> - Máy chủ SFTP: `sftp://demozilla.examplehostingprovider.net`
> - Tên người dùng: `demozilla`
> - Mật khẩu: `quickbrownfox`
> - Cổng: `5548`
> - Để xuất bản lên web, hãy đặt các tệp của bạn vào thư mục `Public/htdocs`.

Trước tiên hãy xem `http://demozilla.examplehostingprovider.net/` — như bạn có thể thấy, cho đến nay vẫn chưa có gì ở đó:

![Trang web cá nhân demozilla của chúng ta, được xem trong trình duyệt: nó trống rỗng](demozilla-empty.png)

> [!NOTE]
> Tùy thuộc vào nhà cung cấp dịch vụ lưu trữ của bạn, hầu hết thời gian bạn sẽ thấy một trang có nội dung như "Website này được lưu trữ bởi \[Dịch vụ lưu trữ]." khi bạn lần đầu vào địa chỉ web của mình.

Để kết nối máy khách SFTP với máy chủ từ xa, hãy làm theo các bước sau:

1. Chọn _File > Site Manager…_ từ menu chính.
2. Trong cửa sổ _Site Manager_, nhấn nút _New Site_, sau đó điền tên trang web là **demozilla** vào khoảng trống được cung cấp.
3. Điền máy chủ SFTP mà nhà cung cấp dịch vụ cung cấp vào trường _Host:_.
4. Trong danh sách thả xuống _Logon Type:_, chọn _Normal_, sau đó điền tên người dùng và mật khẩu đã cung cấp vào các trường tương ứng.
5. Điền cổng đúng và các thông tin khác.

Cửa sổ của bạn sẽ trông như thế này:

![Ảnh chụp màn hình trang đích mặc định của một trang web hư cấu khi thư mục tệp trống](site-manager.png)

Bây giờ nhấn _Connect_ để kết nối với máy chủ SFTP.

Lưu ý: Hãy đảm bảo nhà cung cấp lưu trữ của bạn cung cấp kết nối SFTP (Secure FTP) đến không gian lưu trữ của bạn. FTP vốn không an toàn và bạn không nên sử dụng nó.

### Tại đây và ở đó: giao diện cục bộ và từ xa

Khi đã kết nối, màn hình của bạn sẽ trông như thế này (chúng tôi đã kết nối với một ví dụ của riêng mình để cho bạn ý tưởng):

![Máy khách SFTP hiển thị nội dung trang web sau khi đã kết nối với máy chủ SFTP. Các tệp cục bộ ở bên trái. Các tệp từ xa ở bên phải.](connected.png)

Hãy xem những gì bạn thấy:

- Ở ngăn giữa bên trái, bạn thấy các tệp cục bộ của mình. Điều hướng vào thư mục nơi bạn lưu trữ trang web của mình (ví dụ: `mdn`).
- Ở ngăn giữa bên phải, bạn thấy các tệp từ xa. Chúng ta đã đăng nhập vào thư mục gốc FTP từ xa (trong trường hợp này là `users/demozilla`)
- Bạn có thể bỏ qua các ngăn dưới cùng và trên cùng cho bây giờ. Tương ứng, đây là nhật ký các thông báo hiển thị trạng thái kết nối giữa máy tính của bạn và máy chủ SFTP, và nhật ký trực tiếp của mọi tương tác giữa máy khách SFTP và máy chủ.

### Tải lên máy chủ

Hướng dẫn của máy chủ ví dụ của chúng ta đã cho biết "Để xuất bản lên web, hãy đặt các tệp của bạn vào thư mục `Public/htdocs`." Bạn cần điều hướng đến thư mục đã chỉ định trong ngăn bên phải. Thư mục này thực chất là thư mục gốc của trang web — nơi tệp `index.html` và các tài sản khác sẽ được đặt.

Khi bạn đã tìm thấy thư mục từ xa đúng để đặt tệp của mình, để tải tệp lên máy chủ bạn cần kéo và thả chúng từ ngăn bên trái sang ngăn bên phải.

### Chúng có thực sự trực tuyến không?

Tốt cho đến nay, nhưng các tệp có thực sự trực tuyến không? Bạn có thể kiểm tra lại bằng cách quay lại trang web của mình (ví dụ: `http://demozilla.examplehostingprovider.net/`) trong trình duyệt:

![Nào, trang web của chúng ta đã hoạt động!](here-we-go.png)

Và trang web của chúng ta đã hoạt động!

## Rsync

{{Glossary("Rsync")}} là công cụ đồng bộ tệp từ cục bộ đến từ xa, thường có sẵn trên hầu hết các hệ thống dựa trên Unix (như macOS và Linux), nhưng cũng có các phiên bản Windows.

Nó được xem là công cụ nâng cao hơn SFTP, vì theo mặc định nó được sử dụng trên dòng lệnh. Một lệnh cơ bản trông như thế này:

```bash
rsync [-options] SOURCE user@x.x.x.x:DESTINATION
```

- `-options` là một dấu gạch ngang theo sau là một hoặc nhiều chữ cái, ví dụ `-v` cho thông báo lỗi chi tiết, và `-b` để tạo bản sao lưu. Bạn có thể xem danh sách đầy đủ tại [trang man của rsync](https://linux.die.net/man/1/rsync) (tìm kiếm "Options summary").
- `SOURCE` là đường dẫn đến tệp hoặc thư mục cục bộ mà bạn muốn sao chép tệp từ đó.
- `user@` là thông tin đăng nhập của người dùng trên máy chủ từ xa mà bạn muốn sao chép tệp tới.
- `x.x.x.x` là địa chỉ IP của máy chủ từ xa.
- `DESTINATION` là đường dẫn đến vị trí bạn muốn sao chép thư mục hoặc tệp tới trên máy chủ từ xa.

Bạn cần lấy các thông tin như vậy từ nhà cung cấp dịch vụ lưu trữ của mình.

Để biết thêm thông tin và ví dụ thêm, hãy xem [Cách sử dụng Rsync để sao chép/đồng bộ tệp giữa các máy chủ](https://www.atlantic.net/vps-hosting/how-to-use-rsync-copy-sync-files-servers/).

Tất nhiên, sử dụng kết nối an toàn là ý tưởng tốt, như với FTP. Trong trường hợp Rsync, bạn chỉ định thông tin SSH để thực hiện kết nối qua SSH, sử dụng tùy chọn `-e`. Ví dụ:

```bash
rsync [-options] -e "ssh [SSH DETAILS GO HERE]" SOURCE user@x.x.x.x:DESTINATION
```

Bạn có thể tìm thêm chi tiết về những gì cần thiết tại [Cách sao chép tệp với Rsync qua SSH](https://www.digitalocean.com/community/tutorials/how-to-copy-files-with-rsync-over-ssh).

### Công cụ giao diện đồ họa cho Rsync

Các công cụ giao diện đồ họa (GUI) có sẵn cho Rsync (dành cho những người không quen sử dụng dòng lệnh). [Acrosync](https://acrosync.com/mac.html) là một công cụ như vậy, và nó có sẵn cho Windows và macOS.

Cũng như vậy, bạn sẽ phải lấy thông tin đăng nhập kết nối từ nhà cung cấp dịch vụ lưu trữ, nhưng theo cách này bạn sẽ có giao diện đồ họa để nhập chúng.

## GitHub

GitHub cho phép bạn xuất bản trang web qua [GitHub pages](https://pages.github.com/) (gh-pages).

Chúng tôi đã đề cập đến cơ bản của việc sử dụng tính năng này trong bài viết [Xuất bản trang web của bạn](/en-US/docs/Learn_web_development/Getting_started/Your_first_website/Publishing_your_website) từ hướng dẫn [Bắt đầu với Web](/en-US/docs/Learn_web_development/Getting_started/Your_first_website) của chúng tôi, vì vậy chúng tôi sẽ không lặp lại tất cả ở đây.

Tuy nhiên, đáng biết rằng bạn cũng có thể lưu trữ một trang web trên GitHub, nhưng sử dụng tên miền tùy chỉnh với nó. Xem [Sử dụng tên miền tùy chỉnh với GitHub Pages](https://docs.github.com/en/pages/configuring-a-custom-domain-for-your-github-pages-site) để có hướng dẫn chi tiết.

## Các phương thức tải tệp khác

Giao thức FTP là một phương thức phổ biến để xuất bản trang web, nhưng không phải là phương thức duy nhất. Dưới đây là một số khả năng khác:

- **Giao diện web**. Giao diện HTML hoạt động như giao diện người dùng cho dịch vụ tải tệp từ xa. Được cung cấp bởi dịch vụ lưu trữ của bạn.
- **{{Glossary("WebDAV")}}**. Một phần mở rộng của giao thức {{Glossary("HTTP")}} để cho phép quản lý tệp nâng cao hơn.
