---
title: Khóa học nhanh về dòng lệnh
short-title: Dòng lệnh
slug: Learn_web_development/Getting_started/Environment_setup/Command_line
page-type: tutorial-chapter
sidebar: learnsidebar
---

{{PreviousMenuNext("Learn_web_development/Getting_started/Environment_setup/Dealing_with_files", "Learn_web_development/Getting_started/Your_first_website", "Learn_web_development/Getting_started/Environment_setup")}}

Trong quá trình phát triển, chắc chắn bạn sẽ phải chạy một số lệnh trong terminal (hay còn gọi là "dòng lệnh" — về cơ bản là như nhau). Bài này cung cấp phần giới thiệu về terminal, các lệnh thiết yếu bạn cần nhập vào đó, cách kết hợp các lệnh với nhau, và cách thêm các công cụ giao diện dòng lệnh (CLI) của riêng bạn.

<table>
  <tbody>
    <tr>
      <th scope="row">Điều kiện tiên quyết:</th>
      <td>
        Làm quen cơ bản với hệ điều hành máy tính, phần mềm cơ bản bạn sẽ dùng để xây dựng website, và hệ thống tệp.
      </td>
    </tr>
    <tr>
      <th scope="row">Mục tiêu học tập:</th>
      <td>
        <ul>
          <li>Dòng lệnh là gì và bạn có thể làm gì với nó.</li>
          <li>Hiểu cách truy cập dòng lệnh trên các hệ thống khác nhau.</li>
          <li>Biết các phím tắt cơ bản (ví dụ: mũi tên lên để truy cập các lệnh trước đó, tab để tự động hoàn thành).</li>
          <li>Biết các lệnh cơ bản (ví dụ <code>cd</code>, <code>ls</code>, <code>mkdir</code>, <code>touch</code>, <code>grep</code>, <code>cat</code>, <code>mv</code>, <code>cp</code>).</li>
          <li>Tùy chọn/cờ lệnh (command options/flags).</li>
        </ul>
      </td>
    </tr>
  </tbody>
</table>

## Chào mừng đến với terminal

Terminal là giao diện văn bản để thực thi các chương trình dựa trên văn bản. Nếu bạn đang sử dụng bất kỳ công cụ nào cho lập trình web, rất có thể bạn sẽ phải mở dòng lệnh và chạy một số lệnh để sử dụng các công cụ đã chọn (bạn thường thấy các công cụ đó được gọi là **công cụ CLI** — công cụ giao diện dòng lệnh).

Có thể sử dụng nhiều công cụ bằng cách gõ lệnh vào dòng lệnh; nhiều công cụ đã được cài đặt sẵn trên hệ thống của bạn, và nhiều công cụ khác có thể cài đặt từ các kho lưu trữ gói (package registries).
Các kho lưu trữ gói giống như cửa hàng ứng dụng, nhưng (chủ yếu) dành cho các công cụ và phần mềm dựa trên dòng lệnh.
Chúng ta sẽ thấy cách cài đặt một số công cụ ở phần sau trong chương này, và sẽ tìm hiểu thêm về kho lưu trữ gói trong chương tiếp theo.

Một trong những chỉ trích lớn nhất về dòng lệnh là nó thiếu trải nghiệm người dùng.
Nhìn thấy dòng lệnh lần đầu tiên có thể là một trải nghiệm đáng sợ: một màn hình trống và con trỏ nhấp nháy, với rất ít trợ giúp rõ ràng về việc cần làm gì.

Nhìn bề ngoài, chúng trông không mấy thân thiện nhưng có rất nhiều thứ bạn có thể làm với chúng, và chúng tôi cam đoan rằng, với một chút hướng dẫn và thực hành, việc sử dụng chúng sẽ dễ dàng hơn!
Đó là lý do tại sao chúng tôi cung cấp chương này — để giúp bạn bắt đầu trong môi trường có vẻ không thân thiện này.

### Terminal đến từ đâu?

Terminal bắt nguồn từ khoảng những năm 1950-60 và hình dạng ban đầu của nó thực sự không giống những gì chúng ta sử dụng ngày nay (điều đó đáng mừng). Bạn có thể đọc một chút về lịch sử trên bài viết Wikipedia về [Computer Terminal](https://en.wikipedia.org/wiki/Computer_terminal).

Kể từ đó, terminal vẫn là một tính năng không thể thiếu của tất cả các hệ điều hành — từ máy tính để bàn đến máy chủ trong điện toán đám mây, đến máy tính vi mô như Raspberry PI Zero, và thậm chí đến điện thoại di động. Nó cung cấp quyền truy cập trực tiếp vào hệ thống tệp nền tảng và các tính năng cấp thấp của máy tính, và do đó cực kỳ hữu ích để thực hiện các tác vụ phức tạp một cách nhanh chóng, nếu bạn biết mình đang làm gì.

Nó cũng hữu ích cho việc tự động hóa — ví dụ, để viết một lệnh cập nhật tiêu đề của hàng trăm tệp ngay lập tức, giả sử từ "ch01-xxxx.png" thành "ch02-xxxx.png". Nếu bạn cập nhật tên tệp bằng ứng dụng finder hoặc explorer GUI, sẽ mất rất nhiều thời gian.

Dù sao đi nữa, terminal sẽ không biến mất sớm.

### Terminal trông như thế nào?

Bên dưới bạn có thể thấy một số loại chương trình khác nhau có sẵn để đưa bạn đến terminal.

Hình ảnh tiếp theo hiển thị các command prompt có sẵn trong Windows — có nhiều tùy chọn khác nhau từ chương trình "cmd" đến "powershell" — có thể chạy từ menu start bằng cách gõ tên chương trình.

![Cửa sổ cmd của Windows và cửa sổ PowerShell của Windows](win-terminals.png)

Và bên dưới, bạn có thể thấy ứng dụng terminal macOS.

![Terminal macOS cơ bản](mac-terminal.png)

### Làm thế nào để truy cập terminal?

Ngày nay, nhiều lập trình viên đang sử dụng các công cụ dựa trên Unix (ví dụ: terminal, và các công cụ bạn có thể truy cập qua nó). Nhiều hướng dẫn và công cụ tồn tại trên web ngày nay hỗ trợ (và đáng tiếc là giả định) các hệ thống dựa trên Unix, nhưng đừng lo — chúng có sẵn trên hầu hết các hệ thống. Trong phần này, chúng ta sẽ xem cách truy cập terminal trên hệ thống bạn đã chọn.

#### Linux/Unix

Như đã đề cập ở trên, các hệ thống Linux/Unix có sẵn terminal theo mặc định, được liệt kê trong Applications (Ứng dụng) của bạn.

#### macOS

macOS có một hệ thống gọi là Darwin nằm dưới giao diện người dùng đồ họa. Darwin là một hệ thống giống Unix, cung cấp terminal và quyền truy cập các công cụ cấp thấp. macOS Darwin hầu hết có sự tương thích với Unix, chắc chắn đủ tốt để không gây ra bất kỳ lo lắng nào khi chúng ta làm việc qua bài này.

Terminal có sẵn trên macOS tại `Applications/Utilities/Terminal`.

#### Windows

Giống như một số công cụ lập trình khác, việc sử dụng terminal (hoặc dòng lệnh) trên Windows theo truyền thống không đơn giản hoặc dễ dàng như trên các hệ điều hành khác. Nhưng mọi thứ đang trở nên tốt hơn.

Windows từ lâu đã có chương trình giống terminal riêng gọi là `cmd` ("the command prompt"), nhưng nó không có tính tương thích với các lệnh Unix, và tương đương với command prompt kiểu cũ của Windows DOS.

Có các chương trình tốt hơn để cung cấp trải nghiệm terminal trên Windows, chẳng hạn như PowerShell ([xem tại đây để tìm trình cài đặt](https://github.com/PowerShell/PowerShell)), và Git Bash (đi kèm như một phần của bộ công cụ [git for Windows](https://gitforwindows.org/)).

Tuy nhiên, tùy chọn tốt nhất cho Windows hiện đại là Windows Subsystem for Linux (WSL) — một lớp tương thích để chạy các hệ điều hành Linux trực tiếp từ bên trong Windows 10, cho phép bạn chạy "terminal thực" trực tiếp trên Windows, mà không cần máy ảo.

Nó có thể được cài đặt miễn phí trực tiếp từ Windows store. Bạn có thể tìm thấy tất cả tài liệu cần thiết trong [Tài liệu Windows Subsystem for Linux](https://learn.microsoft.com/en-us/windows/wsl/).

![Ảnh chụp màn hình tài liệu Windows Subsystem for Linux](wsl.png)

Về tùy chọn nào nên chọn trên Windows, chúng tôi mạnh mẽ khuyến nghị cố gắng cài đặt WSL. Bạn có thể gắn bó với command prompt mặc định (`cmd`), và nhiều công cụ sẽ hoạt động ổn, nhưng bạn sẽ thấy mọi thứ dễ dàng hơn nếu bạn có sự tương thích tốt hơn với các công cụ Unix.

#### Ghi chú bên lề: sự khác biệt giữa dòng lệnh và terminal là gì?

Thông thường, bạn sẽ thấy hai thuật ngữ này được dùng thay thế cho nhau. Về mặt kỹ thuật, terminal là phần mềm khởi động và kết nối đến một shell. Shell là phiên làm việc và môi trường phiên của bạn (nơi những thứ như prompt và phím tắt có thể được tùy chỉnh). Dòng lệnh là đường thực tế nơi bạn nhập lệnh và con trỏ nhấp nháy.

### Bạn có phải sử dụng terminal không?

Mặc dù có rất nhiều công cụ có sẵn từ dòng lệnh, nếu bạn đang sử dụng các công cụ như [Visual Studio Code](https://code.visualstudio.com/) thì cũng có nhiều tiện ích mở rộng có thể được sử dụng như proxy để sử dụng các lệnh terminal mà không cần sử dụng terminal trực tiếp. Tuy nhiên, bạn sẽ không tìm thấy tiện ích mở rộng trình soạn thảo mã cho mọi thứ bạn muốn làm — bạn sẽ phải có kinh nghiệm với terminal sau này.

## Các lệnh terminal tích hợp cơ bản

Nói đủ rồi — hãy bắt đầu xem một số lệnh terminal! Ngay từ đầu, đây chỉ là một vài trong số những thứ mà dòng lệnh có thể làm, cùng với tên của các công cụ liên quan trong mỗi trường hợp:

- Điều hướng hệ thống tệp (file system) máy tính cùng với các tác vụ cấp cơ sở như tạo, sao chép, đổi tên, và xóa:
  - Di chuyển quanh cấu trúc thư mục (thư mục - folder): `cd`
  - Tạo thư mục: `mkdir`
  - Tạo tệp (và sửa đổi siêu dữ liệu của chúng): `touch`
  - Sao chép tệp hoặc thư mục: `cp`
  - Di chuyển tệp hoặc thư mục: `mv`
  - Xóa tệp hoặc thư mục: `rm`

- Tải xuống tệp tại các URL cụ thể: `curl`
- Tìm kiếm các đoạn văn bản trong các văn bản lớn hơn: `grep`
- Xem nội dung tệp từng trang: `less`, `cat`
- Thao tác và chuyển đổi các luồng văn bản (ví dụ: thay đổi tất cả các trường hợp `<div>` trong tệp HTML thành `<article>`): `awk`, `tr`, `sed`

> [!NOTE]
> Có nhiều hướng dẫn tốt trên web đi sâu hơn nhiều vào dòng lệnh — đây chỉ là phần giới thiệu ngắn gọn!

Hãy tiến tới và xem cách sử dụng một vài công cụ này trên dòng lệnh. Trước khi tiếp tục, hãy mở chương trình terminal!

### Điều hướng trên dòng lệnh

Khi bạn truy cập dòng lệnh, chắc chắn bạn sẽ cần điều hướng đến một thư mục cụ thể để "làm gì đó". Tất cả các hệ điều hành (giả sử thiết lập mặc định) sẽ khởi chạy chương trình terminal trong thư mục _Home_ của bạn, và từ đó bạn có thể muốn di chuyển đến một nơi khác.

> [!NOTE]
> "Directory" (thư mục) là thuật ngữ kỹ thuật cho những gì chúng ta gọi là "folder" (thư mục) trong bài trước. Khi nhìn vào cấu trúc tệp trong giao diện người dùng (UI), thuật ngữ "folder" có ý nghĩa hơn vì các biểu tượng được sử dụng trông giống như các thư mục lưu trữ vật lý kiểu cũ. Tuy nhiên, bạn thường nghe thuật ngữ "directory" được dùng thường xuyên, đặc biệt khi nói về việc thao tác tệp bằng dòng lệnh. Có một số sắc thái, nhưng về cơ bản hai thuật ngữ có nghĩa như nhau.

Lệnh `cd` cho phép bạn thay đổi thư mục (Change Directory). Về mặt kỹ thuật, cd không phải là một chương trình mà là một lệnh tích hợp. Điều này có nghĩa là hệ điều hành của bạn cung cấp nó từ đầu, và cũng có nghĩa là bạn không thể vô tình xóa nó — thật may mắn! Bạn không cần lo lắng quá nhiều về việc lệnh có tích hợp hay không, nhưng hãy nhớ rằng các lệnh tích hợp xuất hiện trên tất cả các hệ thống dựa trên Unix.

1. Để thay đổi thư mục, gõ `cd` vào terminal, theo sau là thư mục bạn muốn chuyển đến. Giả sử thư mục nằm trong thư mục home của bạn, bạn có thể sử dụng `cd Desktop` (xem ảnh chụp màn hình bên dưới).

   ![Kết quả của lệnh cd Desktop chạy trên nhiều terminal Windows — vị trí terminal chuyển vào desktop](win-terminals-cd.png)

2. Hãy thử gõ vào terminal của hệ thống:

   ```bash
   cd Desktop
   ```

3. Để quay trở lại thư mục trước đó, bạn có thể sử dụng hai dấu chấm. Gõ lệnh này ngay bây giờ:

   ```bash
   cd ..
   ```

> [!NOTE]
> Một phím tắt terminal rất hữu ích là sử dụng phím <kbd>tab</kbd> để tự động hoàn thành các tên bạn biết là có sẵn, thay vì phải gõ toàn bộ tên. Ví dụ: sau khi gõ hai lệnh trên, hãy thử gõ `cd D` và nhấn <kbd>tab</kbd> — nó sẽ tự động hoàn thành tên thư mục `Desktop` cho bạn, miễn là nó có mặt trong thư mục hiện tại. Hãy nhớ điều này khi bạn tiến tới.

Nếu thư mục bạn muốn đến được lồng sâu, bạn cần biết đường dẫn để đến đó. Điều này thường trở nên dễ dàng hơn khi bạn quen hơn với cấu trúc hệ thống tệp, nhưng nếu bạn không chắc về đường dẫn, bạn thường có thể tìm ra bằng cách kết hợp lệnh `ls` (xem bên dưới), và bằng cách nhấp xung quanh trong cửa sổ Explorer/Finder để xem một thư mục ở đâu, tương đối với nơi bạn hiện đang ở.

Ví dụ: nếu bạn muốn đến thư mục `src`, nằm trong thư mục `project`, nằm trên _Desktop_, bạn có thể gõ ba lệnh này để đến từ thư mục _Home_:

```bash
cd Desktop
cd project
cd src
```

Nhưng đây là lãng phí thời gian — thay vào đó, bạn có thể gõ một lệnh, với các mục khác nhau trong đường dẫn được phân cách bằng dấu gạch chéo xuôi, giống như cách bạn chỉ định đường dẫn đến hình ảnh hoặc các tài nguyên khác trong CSS, HTML, hoặc JavaScript:

```bash
cd Desktop/project/src
```

Lưu ý rằng bao gồm dấu gạch chéo ở đầu đường dẫn làm cho đường dẫn là tuyệt đối, ví dụ `/Users/your-user-name/Desktop`. Bỏ dấu gạch chéo ở đầu như chúng ta đã làm ở trên làm cho đường dẫn là tương đối với thư mục làm việc hiện tại. Điều này giống hệt như những gì bạn thấy với URL trong trình duyệt. Dấu gạch chéo ở đầu có nghĩa là "ở gốc của website", trong khi bỏ dấu gạch chéo có nghĩa là "URL là tương đối so với trang hiện tại của tôi".

> [!NOTE]
> Trên Windows, bạn sử dụng dấu gạch chéo ngược thay vì dấu gạch chéo xuôi, ví dụ `cd Desktop\project\src` — điều này có vẻ thực sự kỳ lạ, nhưng nếu bạn muốn biết tại sao, [hãy xem clip YouTube này](https://www.youtube.com/watch?v=5T3IJfBfBmI) với giải thích của một trong những kỹ sư chính của Microsoft.

### Liệt kê nội dung thư mục

Một lệnh Unix tích hợp khác là `ls` (viết tắt của list - liệt kê), liệt kê nội dung của thư mục bạn hiện đang ở. Lưu ý rằng lệnh này sẽ không hoạt động nếu bạn đang sử dụng command prompt mặc định của Windows (`cmd`) — lệnh tương đương ở đó là `dir`.

Hãy thử chạy lệnh này ngay bây giờ trong terminal:

```bash
ls
```

Lệnh này cho bạn danh sách các tệp và thư mục trong thư mục làm việc hiện tại, nhưng thông tin rất cơ bản — bạn chỉ nhận được tên của mỗi mục có mặt, không biết nó là tệp hay thư mục, hay bất kỳ thông tin nào khác. May mắn thay, một thay đổi nhỏ trong cách sử dụng lệnh có thể cung cấp cho bạn nhiều thông tin hơn nhiều.

### Giới thiệu tùy chọn lệnh

Hầu hết các lệnh terminal đều có các tùy chọn — đây là các bộ điều chỉnh bạn thêm vào cuối lệnh, làm cho nó hoạt động theo cách hơi khác. Chúng thường bao gồm một khoảng trắng sau tên lệnh, theo sau là dấu gạch ngang, theo sau là một hoặc nhiều chữ cái.

Ví dụ: hãy thử lệnh này và xem bạn nhận được gì:

```bash
ls -l
```

Trong trường hợp của `ls`, tùy chọn `-l` (_dash ell_) cho bạn một danh sách với một tệp hoặc thư mục trên mỗi dòng, và hiển thị nhiều thông tin hơn. Thư mục có thể được xác định bằng cách tìm chữ "d" ở phía bên trái nhất của các dòng. Đó là những thứ chúng ta có thể `cd` vào.

Bên dưới là ảnh chụp màn hình với terminal macOS "vanilla" ở trên cùng, và terminal tùy chỉnh với một số biểu tượng và màu sắc thêm để giữ giao diện sinh động — cả hai đều hiển thị kết quả của việc chạy `ls -l`:

![Terminal macOS vanilla và terminal macOS tùy chỉnh nhiều màu sắc hơn, hiển thị danh sách tệp — kết quả của việc chạy lệnh ls -l](mac-terminals-ls.png)

> [!NOTE]
> Để tìm hiểu chính xác tùy chọn nào có sẵn cho mỗi lệnh, bạn có thể xem [man page](https://en.wikipedia.org/wiki/Man_page) của nó. Điều này được thực hiện bằng cách gõ lệnh `man`, theo sau là tên của lệnh bạn muốn tra cứu, ví dụ `man ls`. Điều này sẽ mở man page trong trình xem tệp văn bản mặc định của terminal (ví dụ: [`less`](<https://en.wikipedia.org/wiki/Less_(Unix)>) trong terminal của tôi), và sau đó bạn có thể cuộn qua trang bằng phím mũi tên, hoặc cơ chế tương tự nào đó. Man page liệt kê tất cả các tùy chọn một cách chi tiết, điều đó có thể hơi đáng sợ lúc đầu, nhưng ít nhất bạn biết nó ở đó nếu bạn cần. Khi bạn xem xong man page, bạn cần thoát khỏi nó bằng lệnh thoát của trình xem văn bản ("q" trong `less`; bạn có thể phải tìm kiếm trên web để tìm nó nếu không rõ ràng).

> [!NOTE]
> Để chạy một lệnh với nhiều tùy chọn cùng lúc, bạn thường có thể đặt tất cả chúng trong một chuỗi sau ký tự gạch ngang, ví dụ `ls -lah`, hoặc `ls -ltrh`. Hãy thử xem man page của `ls` để tìm hiểu các tùy chọn thêm này làm gì!

Bây giờ chúng ta đã thảo luận về hai lệnh cơ bản, hãy khám phá thư mục một chút và xem bạn có thể điều hướng từ nơi này sang nơi khác không.

### Tạo, sao chép, di chuyển, xóa

Có một số lệnh tiện ích cơ bản khác mà bạn sẽ thường sử dụng khi làm việc với terminal. Chúng khá đơn giản, vì vậy chúng tôi sẽ không giải thích tất cả một cách chi tiết như hai lệnh trước đó.

Hãy thử chúng trong một thư mục kiểm thử mà bạn đã tạo ở đâu đó để tránh vô tình xóa bất kỳ thứ gì quan trọng, sử dụng các lệnh ví dụ bên dưới làm hướng dẫn:

- `mkdir` — tạo một thư mục mới trong thư mục hiện tại, với tên bạn cung cấp sau tên lệnh. Ví dụ: `mkdir my-awesome-website` sẽ tạo một thư mục mới có tên `my-awesome-website`.
- `rmdir` — xóa thư mục được đặt tên, nhưng chỉ khi nó trống. Ví dụ: `rmdir my-awesome-website` sẽ xóa thư mục chúng ta đã tạo ở trên. Nếu bạn muốn xóa thư mục không trống (và cũng xóa tất cả những gì nó chứa), thì bạn có thể sử dụng `rm -r` thay thế (xem bên dưới), nhưng điều này nguy hiểm. Hãy đảm bảo không có gì bạn có thể cần trong thư mục sau này, vì nó sẽ biến mất mãi mãi.
- `touch` — tạo một tệp trống mới, trong thư mục hiện tại. Ví dụ: `touch mdn-example.md` tạo một tệp trống mới có tên `mdn-example.md`.
- `mv` — di chuyển tệp từ vị trí tệp đầu tiên được chỉ định đến vị trí tệp thứ hai được chỉ định, ví dụ `mv mdn-example.md mdn-example.txt` (các vị trí được viết dưới dạng đường dẫn tệp). Lệnh này di chuyển tệp tên `mdn-example.md` trong thư mục hiện tại đến tệp tên `mdn-example.txt` trong thư mục hiện tại. Về mặt kỹ thuật, tệp đang được di chuyển, nhưng từ góc độ thực tế, lệnh này thực sự đang đổi tên tệp.
- `cp` — tương tự trong cách sử dụng với `mv`, `cp` tạo một bản sao của tệp tại vị trí đầu tiên được chỉ định, tại vị trí thứ hai được chỉ định. Ví dụ: `cp mdn-example.txt mdn-example.txt.bak` tạo một bản sao của `mdn-example.txt` có tên `mdn-example.txt.bak` (tất nhiên bạn có thể đặt tên khác nếu muốn).
- `rm` — xóa tệp được chỉ định. Ví dụ: `rm mdn-example.txt` xóa một tệp đơn có tên `mdn-example.txt`. Lưu ý rằng việc xóa này là vĩnh viễn và không thể hoàn tác qua thùng rác mà bạn có thể có trong giao diện người dùng máy tính để bàn.

> [!NOTE]
> Nhiều lệnh terminal cho phép bạn sử dụng dấu hoa thị như ký tự "đại diện" (wildcard), có nghĩa là "bất kỳ chuỗi ký tự nào". Điều này cho phép bạn chạy một thao tác trên nhiều tệp cùng lúc, tất cả đều khớp với mẫu được chỉ định. Ví dụ: `rm mdn-*` sẽ xóa tất cả các tệp bắt đầu bằng `mdn-`. `rm mdn-*.bak` sẽ xóa tất cả các tệp bắt đầu bằng `mdn-` và kết thúc bằng `.bak`.

## Terminal — có nguy hiểm không?

Chúng tôi đã đề cập đến điều này trước đó, nhưng nói rõ hơn — bạn cần cẩn thận với terminal. Các lệnh đơn giản không mang lại nhiều nguy hiểm, nhưng khi bạn bắt đầu ghép các lệnh phức tạp hơn, bạn cần suy nghĩ cẩn thận về những gì lệnh sẽ làm, và thử kiểm tra chúng trước khi cuối cùng chạy chúng trong thư mục dự kiến.

Giả sử bạn có 1000 tệp văn bản trong một thư mục, và bạn muốn đi qua tất cả chúng và chỉ xóa những tệp có một chuỗi nhất định trong tên tệp. Nếu bạn không cẩn thận, bạn có thể kết thúc việc xóa một thứ gì đó quan trọng, làm mất đi nhiều công việc của bạn trong quá trình đó.
Một thói quen tốt nên có là viết lệnh terminal của bạn trong một trình soạn thảo văn bản, tìm hiểu cách nó nên trông, và sau đó tạo một bản sao lưu của thư mục và thử chạy lệnh trên đó trước, để kiểm tra.

Nếu bạn không thoải mái khi thử các lệnh terminal trên máy của mình, có các terminal trực tuyến được lưu trữ cung cấp nơi an toàn để thực hành nhập lệnh, mà không có nguy cơ làm hỏng máy của bạn:

- Đối tác học tập của chúng tôi, [Scrimba](https://scrimba.com/home?via=mdn), có tích hợp terminal để nhập lệnh trong môi trường học tập. Nơi tuyệt vời để thấy điều này trong thực tế là khóa học [Command Line Basics](https://scrimba.com/command-line-basics-c08b87ogl0/~05hu?via=mdn) <sup>[_Đối tác học tập MDN_](/en-US/docs/MDN/Writing_guidelines/Learning_content#partner_links_and_embeds)</sup> của họ, cũng cung cấp phần giới thiệu tương tác thú vị về điều hướng cây tệp và thao tác tệp và thư mục qua terminal.
- [Command-line playground](https://sandbox.bio/playgrounds/terminal) trên sandbox.bio là nơi tuyệt vời để thử các lệnh terminal để bạn làm quen với giao diện dòng lệnh và các shell phổ biến như Bash.

Một tài nguyên tuyệt vời để có được cái nhìn tổng quan nhanh về các lệnh terminal cụ thể là [tldr.sh](https://tldr.sh/). Đây là dịch vụ tài liệu do cộng đồng điều hành, tương tự như MDN, nhưng dành riêng cho các lệnh terminal.

Trong phần tiếp theo, hãy nâng cấp thêm một bậc (hoặc thực ra là nhiều bậc) và xem cách chúng ta có thể kết nối các công cụ lại với nhau trên dòng lệnh để thực sự thấy terminal có lợi ích gì so với giao diện người dùng máy tính để bàn thông thường.

## Kết nối các lệnh với nhau bằng pipe

Terminal thực sự phát huy sức mạnh khi bạn bắt đầu kết hợp các lệnh lại với nhau bằng ký hiệu `|` (pipe). Hãy xem một ví dụ rất nhanh về ý nghĩa của điều này.

Chúng ta đã xem `ls`, lệnh xuất nội dung của thư mục hiện tại:

```bash
ls
```

Nhưng nếu chúng ta muốn nhanh chóng đếm số lượng tệp và thư mục bên trong thư mục hiện tại thì sao? `ls` không thể tự làm điều đó.

Có một công cụ Unix khác có tên `wc`. Nó đếm số lượng từ, dòng, ký tự, hoặc byte của bất cứ thứ gì được nhập vào nó. Đây có thể là một tệp văn bản — ví dụ dưới đây xuất số dòng trong `myfile.txt`:

```bash
wc -l myfile.txt
```

Nhưng nó cũng có thể đếm số dòng của bất kỳ đầu ra nào được **pipe** vào nó. Ví dụ: lệnh dưới đây đếm số dòng được xuất bởi lệnh `ls` (những gì nó thường sẽ in ra terminal nếu chạy một mình) và xuất số đó vào terminal:

```bash
ls | wc -l
```

Vì `ls` in mỗi tệp hoặc thư mục trên dòng riêng của nó, điều đó thực sự cho chúng ta số lượng thư mục và tệp.

Vậy điều gì đang xảy ra ở đây? Một triết lý chung của các công cụ dòng lệnh (Unix) là chúng in văn bản vào terminal (còn được gọi là "in ra đầu ra chuẩn" hay `STDOUT`). Nhiều lệnh cũng có thể đọc nội dung từ đầu vào được truyền vào (được gọi là "đầu vào chuẩn" hay `STDIN`).

Toán tử pipe có thể _kết nối_ các đầu vào và đầu ra này lại với nhau, cho phép chúng ta xây dựng các thao tác ngày càng phức tạp hơn để phù hợp với nhu cầu — đầu ra từ một lệnh có thể trở thành đầu vào cho lệnh tiếp theo. Trong trường hợp này, `ls` thường sẽ in đầu ra của nó vào `STDOUT`, nhưng thay vào đó đầu ra của `ls` đang được pipe vào `wc`, lấy đầu ra đó làm đầu vào, đếm số dòng nó chứa, và in số đó vào `STDOUT`.

## Ví dụ phức tạp hơn một chút

Hãy đi qua điều gì đó phức tạp hơn một chút.

1. Chúng ta sẽ đầu tiên cố gắng lấy nội dung của trang "fetch" của MDN bằng lệnh `curl` (có thể được dùng để yêu cầu nội dung từ URL), từ `https://developer.mozilla.org/en-US/docs/Web/API/WindowOrWorkerGlobalScope/fetch`. Hãy thử ngay bây giờ:

   ```bash
   curl https://developer.mozilla.org/en-US/docs/Web/API/WindowOrWorkerGlobalScope/fetch
   ```

   Bạn sẽ không nhận được đầu ra vì trang đã được chuyển hướng (đến [/Web/API/fetch](/en-US/docs/Web/API/Window/fetch)). Chúng ta cần chỉ định rõ ràng cho `curl` theo các chuyển hướng bằng cờ `-L`.

2. Hãy cũng xem các header mà `developer.mozilla.org` trả về bằng cờ `-I` của `curl`, và in tất cả các chuyển hướng vị trí nó gửi đến terminal, bằng cách pipe đầu ra của `curl` vào `grep` (chúng ta sẽ yêu cầu `grep` trả về tất cả các dòng chứa từ "location"). Hãy thử chạy lệnh sau (bạn sẽ thấy chỉ có một chuyển hướng trước khi chúng ta đến trang cuối cùng):

   ```bash
   curl https://developer.mozilla.org/en-US/docs/Web/API/WindowOrWorkerGlobalScope/fetch -L -I | grep location
   ```

   Đầu ra của bạn sẽ trông giống như thế này (`curl` sẽ đầu tiên xuất một số bộ đếm tải xuống và tương tự):

   ```bash
   location: /en-US/docs/Web/API/Window/fetch
   ```

3. Mặc dù có vẻ nhân tạo, chúng ta có thể đi xa hơn với kết quả này và chuyển đổi nội dung dòng `location:`, thêm gốc cơ sở vào đầu mỗi dòng để chúng ta có được các URL hoàn chỉnh được in ra. Để làm điều đó, chúng ta sẽ thêm `awk` vào hỗn hợp (đây là ngôn ngữ lập trình tương tự JavaScript hoặc Ruby hoặc Python, chỉ là cũ hơn nhiều!). Hãy thử chạy lệnh này:

   ```bash
   curl https://developer.mozilla.org/en-US/docs/Web/API/WindowOrWorkerGlobalScope/fetch -L -I | grep location | awk '{ print "https://developer.mozilla.org" $2 }'
   ```

Đầu ra cuối cùng của bạn sẽ trông giống như thế này:

```bash
https://developer.mozilla.org/en-US/docs/Web/API/Window/fetch
```

Bằng cách kết hợp các lệnh này, chúng ta đã tùy chỉnh đầu ra để hiển thị các URL đầy đủ mà máy chủ Mozilla đang chuyển hướng qua khi chúng ta yêu cầu URL `/docs/Web/API/WindowOrWorkerGlobalScope/fetch`.
Việc làm quen với hệ thống của bạn sẽ chứng tỏ hữu ích trong nhiều năm tới — hãy tìm hiểu cách các công cụ đơn lẻ này hoạt động và cách chúng có thể trở thành một phần của bộ công cụ của bạn để giải quyết các vấn đề ngách.

## Thêm sức mạnh

Bây giờ chúng ta đã xem một số lệnh tích hợp mà hệ thống của bạn được trang bị, hãy xem cách chúng ta có thể cài đặt một công cụ CLI của bên thứ ba và sử dụng nó.

Hệ sinh thái rộng lớn của các công cụ có thể cài đặt cho phát triển web front-end hiện tại chủ yếu tồn tại trong [npm](https://www.npmjs.com/), một dịch vụ lưu trữ gói được sở hữu tư nhân, hoạt động chặt chẽ cùng với Node.js.
Điều này đang mở rộng dần dần — bạn có thể mong đợi thấy nhiều nhà cung cấp gói hơn theo thời gian.

[Cài đặt Node.js](https://nodejs.org/en/) cũng cài đặt công cụ dòng lệnh npm (và một công cụ tập trung npm bổ sung gọi là npx), cung cấp cổng để cài đặt các công cụ dòng lệnh bổ sung. Node.js và npm hoạt động giống nhau trên tất cả các hệ thống: macOS, Windows và Linux.

Hãy cài đặt npm trên hệ thống của bạn ngay bây giờ, bằng cách truy cập URL ở trên và tải xuống và chạy trình cài đặt Node.js phù hợp với hệ điều hành của bạn. Nếu được nhắc, hãy đảm bảo bao gồm npm như một phần của quá trình cài đặt.

![Trình cài đặt Node.js trên Windows, hiển thị tùy chọn bao gồm npm](npm-install-option.png)

Chúng ta sẽ sử dụng [Prettier](https://prettier.io/) làm ví dụ ở đây lần nữa. Chúng tôi đã chỉ cách cài đặt nó như một tiện ích mở rộng VS Code trong bài [Trình soạn thảo mã](/en-US/docs/Learn_web_development/Getting_started/Environment_setup/Code_editors#enhancing_your_code_editor_with_extensions). Ở đây chúng tôi sẽ chỉ cách cài đặt nó như một công cụ dòng lệnh.

> [!NOTE]
> Prettier là một trình định dạng mã có quan điểm riêng (opinionated code formatter) với "rất ít tùy chọn". Ít tùy chọn có xu hướng có nghĩa là đơn giản hơn. Cho rằng tooling đôi khi có thể mất kiểm soát về độ phức tạp, "ít tùy chọn" có thể rất hấp dẫn.

### Nên cài đặt công cụ CLI ở đâu?

Trước khi chúng ta bắt đầu cài đặt Prettier, có một câu hỏi cần trả lời — "chúng ta nên cài đặt nó ở đâu?"

Với `npm` chúng ta có thể lựa chọn cài đặt công cụ toàn cục — để chúng ta có thể truy cập chúng ở bất kỳ đâu — hoặc cục bộ trong thư mục dự án hiện tại.

Có ưu và nhược điểm theo từng cách — và danh sách ưu và nhược điểm sau đây cho việc cài đặt toàn cục còn lâu mới đầy đủ.

**Ưu điểm của cài đặt toàn cục:**

- Có thể truy cập ở bất kỳ đâu trong terminal của bạn
- Chỉ cài đặt một lần
- Sử dụng ít không gian đĩa hơn
- Luôn là cùng một phiên bản
- Cảm giác giống như bất kỳ lệnh Unix nào khác

**Nhược điểm của cài đặt toàn cục:**

- Có thể không tương thích với codebase của dự án
- Các lập trình viên khác trong nhóm của bạn sẽ không có quyền truy cập vào các công cụ này, ví dụ nếu bạn đang chia sẻ codebase qua một công cụ như git.
- Liên quan đến điểm trước, việc này làm cho mã dự án khó sao chép hơn (nếu bạn cài đặt công cụ của mình cục bộ, chúng có thể được thiết lập như các phụ thuộc và cài đặt với <code>npm install</code>).

Mặc dù danh sách _nhược điểm_ ngắn hơn, nhưng tác động tiêu cực của việc cài đặt toàn cục có thể lớn hơn nhiều so với lợi ích.
Ở đây chúng ta sẽ cài đặt cục bộ, nhưng hãy thoải mái cài đặt toàn cục khi bạn hiểu các rủi ro tương đối.

### Cài đặt Prettier

Prettier là một công cụ định dạng mã có quan điểm riêng dành cho các nhà phát triển web front-end, tập trung vào các ngôn ngữ dựa trên JavaScript và thêm hỗ trợ cho HTML, CSS, SCSS, JSON, và nhiều hơn nữa.

Prettier có thể:

- Tiết kiệm chi phí nhận thức khi đảm bảo style nhất quán thủ công trên tất cả các tệp mã; Prettier có thể làm điều này cho bạn tự động.
- Giúp những người mới bắt đầu phát triển web định dạng mã theo cách tốt nhất.
- Được cài đặt trên bất kỳ hệ điều hành nào và thậm chí như một phần trực tiếp của công cụ dự án, đảm bảo rằng đồng nghiệp và bạn bè làm việc trên mã của bạn sử dụng style mã bạn đang dùng.
- Được cấu hình để chạy khi lưu, khi bạn gõ, hoặc thậm chí trước khi xuất bản mã của bạn (với công cụ bổ sung mà chúng ta sẽ thấy sau trong mô-đun).

Cho bài này, chúng ta sẽ cài đặt Prettier cục bộ, như được đề xuất trong [hướng dẫn cài đặt Prettier](https://prettier.io/docs/install.html).

1. Sau khi bạn đã cài đặt Node.js, hãy mở terminal và chạy lệnh sau để cài đặt Prettier (chúng ta sẽ giải thích `--save-dev` làm gì trong bài tiếp theo):

   ```bash
   npm install --save-dev prettier
   ```

2. Bây giờ bạn có thể chạy tệp cục bộ bằng công cụ [npx](https://docs.npmjs.com/cli/commands/npx/). Chạy lệnh mà không có đối số, như với nhiều lệnh khác, sẽ cung cấp thông tin sử dụng và trợ giúp. Hãy thử ngay bây giờ:

   ```bash
   npx prettier
   ```

Đầu ra của bạn sẽ trông giống như thế này:

```bash
Usage: prettier [options] [file/glob ...]

By default, output is written to stdout.
Stdin is read if it is piped to Prettier and no files are given.

…
```

Luôn đáng để ít nhất lướt qua thông tin sử dụng, dù nó dài.
Nó sẽ giúp bạn hiểu rõ hơn về cách sử dụng công cụ dự định.

> [!NOTE]
> Nếu bạn chưa cài đặt Prettier cục bộ trước đó, thì việc chạy `npx prettier` sẽ tải xuống và chạy phiên bản mới nhất của Prettier tất cả trong một lần _chỉ cho lệnh đó_.
> Mặc dù điều đó có vẻ tuyệt, nhưng các phiên bản mới hơn của Prettier có thể sửa đổi đầu ra một chút.
> Bạn muốn cài đặt cục bộ để bạn đang cố định phiên bản Prettier bạn đang sử dụng để định dạng cho đến khi bạn sẵn sàng thay đổi.

### Thực hành với Prettier

Hãy nhanh chóng thực hành với Prettier để bạn có thể thấy cách nó hoạt động.

1. Đầu tiên, hãy tạo một thư mục mới ở đâu đó trên hệ thống tệp của bạn mà dễ tìm. Có thể là thư mục tên `prettier-test` trên `Desktop` của bạn.

2. Bây giờ hãy lưu đoạn mã sau trong tệp mới tên `index.js`, bên trong thư mục kiểm thử:

   ```js-nolint
   const myObj = {
   a:1,b:{c:2}}
   function printMe(obj){console.log(obj.b.c)}
   printMe(myObj)
   ```

3. Chúng ta có thể chạy Prettier trên một codebase để chỉ kiểm tra xem mã của chúng ta có cần điều chỉnh không. `cd` vào thư mục của bạn, và thử chạy lệnh này:

   ```bash
   npx prettier --check index.js
   ```

   Bạn sẽ nhận được đầu ra kiểu như:

   ```bash
   Checking formatting...
   index.js
   Code style issues found in the above file(s). Forgot to run Prettier?
   ```

4. Vì vậy, có một số style mã có thể được sửa. Không vấn đề gì. Thêm tùy chọn `--write` vào lệnh `prettier` sẽ sửa chúng, cho phép chúng ta tập trung vào việc thực sự viết mã hữu ích. Bây giờ hãy thử chạy phiên bản lệnh này:

   ```bash
   npx prettier --write index.js
   ```

   Bạn sẽ nhận được đầu ra như thế này:

   ```bash
   Checking formatting...
   index.js
   Code style issues fixed in the above file(s).
   ```

   Nhưng quan trọng hơn, nếu bạn nhìn lại tệp JavaScript của mình, bạn sẽ thấy nó đã được định dạng lại thành dạng như thế này:

   ```js
   const myObj = {
     a: 1,
     b: { c: 2 },
   };
   function printMe(obj) {
     console.log(obj.b.c);
   }
   printMe(myObj);
   ```

Tùy thuộc vào quy trình làm việc của bạn (hoặc quy trình bạn chọn), bạn có thể làm điều này thành một phần tự động của quy trình. Tự động hóa thực sự là nơi các công cụ phát huy; sở thích cá nhân của chúng tôi là loại tự động hóa "chỉ xảy ra" mà không cần cấu hình gì.

Với Prettier có một số cách tự động hóa có thể được thực hiện và dù chúng nằm ngoài phạm vi của bài này, nhưng có một số tài nguyên tuyệt vời trực tuyến để giúp đỡ (một số đã được liên kết). Bạn có thể gọi Prettier:

- Trước khi bạn commit mã vào kho lưu trữ git bằng [Husky](https://github.com/typicode/husky).
- Bất cứ khi nào bạn nhấn "save" trong trình soạn thảo mã, dù là [VS Code](https://marketplace.visualstudio.com/items?itemName=esbenp.prettier-vscode), hoặc [Sublime Text](https://packagecontrol.io/packages/JsPrettier).
- Như một phần của kiểm tra {{glossary("continuous integration")}} (tích hợp liên tục) sử dụng các công cụ như [GitHub Actions](https://github.com/features/actions).

Sở thích cá nhân của chúng tôi là tùy chọn thứ hai — khi sử dụng VS Code, Prettier khởi động và dọn dẹp bất kỳ định dạng nào cần làm mỗi khi chúng tôi nhấn save. Bạn có thể tìm thêm nhiều thông tin về cách sử dụng Prettier theo nhiều cách khác nhau trong [tài liệu Prettier](https://prettier.io/docs/).

## Các công cụ khác để thử

Nếu bạn muốn thử thêm một vài công cụ, đây là danh sách ngắn các công cụ thú vị để khám phá:

- [`bat`](https://github.com/sharkdp/bat) — Một `cat` "đẹp hơn" (`cat` được dùng để in nội dung tệp).
- [`prettyping`](https://denilson.sa.nom.br/prettyping/) — `ping` trên dòng lệnh, nhưng được trực quan hóa (`ping` là công cụ hữu ích để kiểm tra xem máy chủ có đang phản hồi không).
- [`htop`](https://htop.dev/) — Trình xem tiến trình (process viewer), hữu ích khi một thứ gì đó khiến quạt CPU của bạn hoạt động như động cơ máy bay và bạn muốn xác định chương trình gây ra vấn đề.
- [`tldr`](https://tldr.sh/#installation) — đã đề cập trước đó trong chương này, nhưng có sẵn như một công cụ dòng lệnh.

Lưu ý rằng một số gợi ý ở trên có thể cần cài đặt bằng npm, như chúng ta đã làm với Prettier.

## Tóm tắt

Như vậy chúng ta đã đến cuối phần giới thiệu terminal/dòng lệnh của chúng tôi, và mô-đun Thiết lập môi trường. Tiếp theo, chúng tôi sẽ giúp bạn làm việc xây dựng website đơn giản đầu tiên, để bạn có thể có ý tưởng về quá trình lập trình web như thế nào.

{{PreviousMenuNext("Learn_web_development/Getting_started/Environment_setup/Dealing_with_files", "Learn_web_development/Getting_started/Your_first_website", "Learn_web_development/Getting_started/Environment_setup")}}
