---
title: How do I use GitHub Pages?
slug: Learn_web_development/Howto/Tools_and_setup/Using_GitHub_pages
page-type: learn-faq
sidebar: learn-how-to
---

[GitHub](https://github.com/) là một trang "lập trình xã hội". Nó cho phép bạn tải lên các kho lưu trữ code để lưu trữ trong hệ thống **kiểm soát phiên bản** [Git](https://git-scm.com/). Sau đó bạn có thể cộng tác trong các dự án code, và hệ thống là mã nguồn mở theo mặc định, nghĩa là bất kỳ ai trên thế giới đều có thể tìm thấy code GitHub của bạn, sử dụng nó, học từ nó và cải thiện nó. Bạn cũng có thể làm điều đó với code của người khác! Bài viết này cung cấp hướng dẫn cơ bản để xuất bản nội dung bằng tính năng gh-pages của GitHub.

## Xuất bản nội dung

GitHub là một cộng đồng rất quan trọng và hữu ích để tham gia, và Git/GitHub là một [hệ thống kiểm soát phiên bản](https://git-scm.com/book/en/v2/Getting-Started-About-Version-Control) rất phổ biến — hầu hết các công ty công nghệ hiện nay sử dụng nó trong quy trình làm việc của họ. GitHub có một tính năng rất hữu ích gọi là [GitHub Pages](https://pages.github.com/), cho phép bạn xuất bản code trang web trực tiếp lên Web.

### Thiết lập GitHub cơ bản

1. Trước tiên, [cài đặt Git](https://git-scm.com/downloads/) trên máy của bạn. Đây là phần mềm hệ thống kiểm soát phiên bản nền tảng mà GitHub hoạt động dựa trên.
2. Tiếp theo, [đăng ký tài khoản GitHub](https://github.com/signup). Đơn giản và dễ dàng.
3. Sau khi đăng ký, hãy đăng nhập vào [github.com](https://github.com/) bằng tên người dùng và mật khẩu của bạn.

### Chuẩn bị code để tải lên

Bạn có thể lưu trữ bất kỳ code nào bạn thích trong kho lưu trữ GitHub, nhưng để sử dụng tính năng GitHub Pages đầy đủ, code của bạn nên được cấu trúc như một trang web điển hình, ví dụ: với điểm vào chính là tệp HTML được gọi là `index.html`.

Điều khác bạn cần làm trước khi tiếp tục là khởi tạo thư mục code của bạn như một kho lưu trữ Git. Để làm điều này:

1. Trỏ dòng lệnh đến thư mục `test-site` (hoặc bất cứ tên gì bạn đặt cho thư mục chứa trang web của mình). Để làm điều này, sử dụng lệnh `cd` (tức là "**c**hange **d**irectory" - thay đổi thư mục). Đây là những gì bạn sẽ gõ nếu bạn đã đặt trang web vào một thư mục tên `test-site` trên màn hình desktop của mình:

   ```bash
   cd Desktop/test-site
   ```

2. Khi dòng lệnh đang trỏ vào thư mục trang web của bạn, hãy gõ lệnh sau, lệnh này yêu cầu công cụ `git` chuyển thư mục thành kho lưu trữ git:

   ```bash
   git init
   ```

#### Một lưu ý về giao diện dòng lệnh

Cách tốt nhất để tải code của bạn lên GitHub là qua dòng lệnh — đây là cửa sổ nơi bạn gõ lệnh để làm những việc như tạo tệp và chạy chương trình, thay vì nhấp bên trong giao diện người dùng. Nó sẽ trông như thế này:

![Cửa sổ Terminal/dấu nhắc lệnh đã mở. Chưa có lệnh nào được nhập.](command-line.png)

> [!NOTE]
> Bạn cũng có thể xem xét sử dụng [giao diện đồ họa Git](https://git-scm.com/downloads/guis) để thực hiện cùng một công việc, nếu bạn cảm thấy không thoải mái với dòng lệnh.

Mỗi hệ điều hành đều có công cụ dòng lệnh:

- **Windows**: **Command Prompt** có thể truy cập bằng cách nhấn phím Windows, gõ _Command Prompt_ và chọn nó từ danh sách xuất hiện. Lưu ý rằng Windows có các quy ước lệnh riêng khác với Linux và macOS, vì vậy các lệnh bên dưới có thể khác trên máy của bạn.
- **macOS**: **Terminal** có thể tìm thấy trong _Applications > Utilities_.
- **Linux**: Thường bạn có thể mở terminal bằng _Ctrl + Alt + T_. Nếu điều đó không hoạt động, hãy tìm **Terminal** trong thanh ứng dụng hoặc menu.

Điều này có vẻ hơi đáng sợ lúc đầu, nhưng đừng lo — bạn sẽ sớm nắm được những điều cơ bản. Bạn yêu cầu máy tính làm gì đó trong terminal bằng cách gõ lệnh và nhấn Enter, như đã thấy ở trên.

### Tạo kho lưu trữ cho code của bạn

1. Tiếp theo, bạn cần tạo một kho lưu trữ mới để đặt tệp vào. Nhấp vào Dấu cộng (+) ở góc trên bên phải của trang chủ GitHub, sau đó chọn _New Repository_.
2. Trên trang này, trong ô _Repository name_, nhập tên cho kho lưu trữ code của bạn, ví dụ _my-repository_.
3. Cũng điền vào phần mô tả để nói trang web của bạn sẽ chứa gì. Màn hình của bạn sẽ trông như thế này:
   ![Trang kho lưu trữ mới được mở trong trình duyệt, ô nhập tên chủ sở hữu và tên kho lưu trữ đã được điền, cũng như ô mô tả tùy chọn. Hộp kiểm công khai được chọn, hộp kiểm riêng tư không được chọn, tương tự với hộp kiểm khởi tạo kho lưu trữ này với readme.](create-new-repo.png)
4. Nhấp _Create repository_; điều này sẽ đưa bạn đến trang sau:
   ![Trang kho lưu trữ được mở trong trình duyệt, bên dưới tiêu đề GitHub gồm thanh tìm kiếm và các liên kết điều hướng đến pull request, issues và gist của kho lưu trữ. Bên cạnh các liên kết điều hướng là thông báo chuông và liên kết đến tài khoản của bạn. Bên dưới, tên kho lưu trữ của chủ sở hữu theo sau là dấu gạch chéo với tên kho lưu trữ. Bên dưới một thanh điều hướng ngang gồm các tab khác nhau liên quan đến kho lưu trữ của bạn, tab code được chọn hiển thị tài liệu giải thích cách tạo kho lưu trữ hoặc cách đẩy từ dòng lệnh.](github-repo.png)

### Tải tệp của bạn lên GitHub

1. Trên trang hiện tại, bạn quan tâm đến phần _…or push an existing repository from the command line_. Bạn sẽ thấy hai dòng code được liệt kê trong phần này. Sao chép toàn bộ dòng đầu tiên, dán vào dòng lệnh và nhấn Enter. Lệnh sẽ trông giống như thế này:

   ```bash
   git remote add origin https://github.com/chrisdavidmills/my-repository.git
   ```

2. Tiếp theo, gõ hai lệnh sau, nhấn Enter sau mỗi lệnh. Chúng chuẩn bị code để tải lên GitHub và yêu cầu Git quản lý các tệp này.

   ```bash
   git add --all
   git commit -m 'adding my files to my repository'
   ```

3. Cuối cùng, đẩy code lên GitHub bằng cách đến trang web GitHub bạn đang mở và nhập vào terminal lệnh thứ hai trong hai lệnh chúng ta thấy trong phần _…or push an existing repository from the command line_:

   ```bash
   git push -u origin main
   ```

4. Bây giờ bạn cần bật GitHub pages cho kho lưu trữ của mình. Để làm điều này, từ trang chủ của kho lưu trữ chọn _Settings_, sau đó chọn _Pages_ từ thanh bên trái. Bên dưới _Source_, chọn nhánh "main". Trang sẽ tải lại.
5. Đến phần GitHub Pages một lần nữa, và bạn sẽ thấy một dòng có dạng "Your site is ready to be published at `https://xxxxxx`."
6. Nếu bạn nhấp vào URL này, bạn sẽ đến phiên bản trực tiếp của ví dụ của mình, miễn là trang chủ có tên là `index.html` — nó sẽ đến điểm vào này theo mặc định. Nếu điểm vào của trang web của bạn có tên khác, ví dụ `myPage.html`, bạn cần đến `https://xxxxxx/myPage.html`.

### Kiến thức GitHub thêm

Nếu bạn muốn thực hiện thêm thay đổi cho trang web kiểm thử và tải những thay đổi đó lên GitHub, bạn cần thực hiện thay đổi cho các tệp của mình như trước. Sau đó, bạn cần nhập các lệnh sau (nhấn Enter sau mỗi lệnh) để đẩy những thay đổi đó lên GitHub:

```bash
git add --all
git commit -m 'another commit'
git push
```

Bạn có thể thay _another commit_ bằng một thông điệp phù hợp hơn mô tả thay đổi bạn vừa thực hiện.

Chúng ta mới chỉ đề cập sơ qua về Git. Để tìm hiểu thêm, hãy xem trang [Git và GitHub](/en-US/docs/Learn_web_development/Core/Version_control) của chúng tôi.
