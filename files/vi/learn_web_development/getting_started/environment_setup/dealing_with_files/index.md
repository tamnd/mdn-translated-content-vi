---
title: Làm việc với tệp
slug: Learn_web_development/Getting_started/Environment_setup/Dealing_with_files
page-type: tutorial-chapter
sidebar: learnsidebar
---

{{PreviousMenuNext("Learn_web_development/Getting_started/Environment_setup/Code_editors", "Learn_web_development/Getting_started/Environment_setup/Command_line", "Learn_web_development/Getting_started/Environment_setup")}}

Một website bao gồm nhiều tệp: nội dung văn bản, mã lệnh, stylesheet, nội dung phương tiện, v.v. Khi bạn xây dựng một website, bạn cần tổ chức các tệp này thành một cấu trúc hợp lý trên máy tính cục bộ, đảm bảo chúng có thể giao tiếp với nhau, và hoàn chỉnh nội dung trước khi cuối cùng đưa chúng lên một máy chủ (server) để mọi người xem. Bài này giải thích cách sử dụng giao diện người dùng (UI) quản lý tệp của máy tính và thiết lập cấu trúc tệp hợp lý cho một website.

<table>
  <tbody>
    <tr>
      <th scope="row">Điều kiện tiên quyết:</th>
      <td>
        Làm quen cơ bản với hệ điều hành (OS) máy tính của bạn và phần mềm cơ bản bạn sẽ sử dụng để xây dựng website.
      </td>
    </tr>
    <tr>
      <th scope="row">Mục tiêu học tập:</th>
      <td>
        <ul>
          <li>Thao tác với tệp và thư mục (folder/directory).</li>
          <li>Quy tắc đặt tên tốt nhất.</li>
          <li>Cấu trúc thư mục website tiêu chuẩn.</li>
          <li>Xử lý đường dẫn tệp (file path).</li>
          <li>Xử lý phần mở rộng tệp (file extension).</li>
        </ul>
      </td>
    </tr>
  </tbody>
</table>

## Thao tác với tệp và thư mục

Có nhiều cách khác nhau để tạo và chỉnh sửa các tệp và thư mục trên máy tính. Bạn có thể làm điều đó thông qua dòng lệnh (command line)/terminal của máy tính bằng một loạt lệnh văn bản, mà bạn sẽ tìm hiểu thêm trong bài tiếp theo. Tuy nhiên, nhiều người thấy dễ dàng hơn khi bắt đầu học về hệ thống tệp bằng giao diện trực quan, đó là những gì chúng ta sẽ thảo luận ở đây. Các hệ điều hành (OS) hiện đại có giao diện người dùng hệ thống tệp (file system UI) mạnh mẽ mà bạn có thể sử dụng để thao tác với tệp và thư mục theo nhu cầu.

Trên macOS, ví dụ, bạn có chương trình Finder:

![Ứng dụng macOS Finder, hiển thị nội dung của thư mục Home điển hình](finder.png)

Trong khi Windows có File Explorer:

![Ứng dụng Windows File Explorer, hiển thị nội dung của thư mục Home điển hình](file-explorer.png)

> [!NOTE]
> Hướng dẫn này được viết sử dụng Windows 11 và macOS 15. Bạn có thể đang sử dụng phiên bản OS khác, hoặc một OS hoàn toàn khác, trong trường hợp đó trải nghiệm sẽ khác nhau. Có nhiều hướng dẫn trên web về cách sử dụng OS cơ bản — chúng tôi khuyến khích bạn tìm kiếm trên web thông tin về OS cụ thể của bạn.

### Cấu trúc cơ bản

Hầu hết các hệ điều hành hiện đại đều có thư mục `Users` (Người dùng), chứa một thư mục cho mỗi tài khoản người dùng trên hệ thống, còn được gọi là thư mục _Home_ (Trang chủ) của người dùng. Thư mục này thường được biểu thị bằng biểu tượng ngôi nhà để dễ tìm. Trong thư mục _Home_, sẽ có các thư mục và tệp quan trọng khác liên quan đến người dùng đó, như _Documents_ (Tài liệu), _Music_ (Nhạc), v.v. Máy tính của bạn còn có nhiều tệp và thư mục khác nữa, nhưng đừng lo về chúng ngay bây giờ.

Người dùng đang đăng nhập mặc định chỉ có thể truy cập thư mục _Home_ của riêng họ.

Bạn nên tạo các tệp dự án liên quan đến công việc ở đâu đó trong thư mục _Home_ của mình, có thể trong _Documents_. Điều này hợp lý vì các tệp trang web thường được gọi là _documents_ (tài liệu).

> [!WARNING]
> Nếu bạn bắt đầu tạo và chỉnh sửa tệp ở những nơi khác trên hệ thống (ví dụ: các khu vực kiểm soát hệ điều hành hoặc ứng dụng quan trọng), bạn có thể làm hỏng một thứ gì đó. Hãy gắn bó với việc tạo và chỉnh sửa tệp trong thư mục _Home_ của bạn cho đến khi bạn biết mình đang làm gì.

### Tạo thư mục

Hãy tạo một thư mục mới để lưu tất cả các dự án web của chúng ta.

1. Trong UI hệ thống tệp của bạn, nhấp vào thư mục _Home_, sau đó nhấp đúp vào thư mục _Documents_.
2. Tạo một thư mục mới ở vị trí này có tên `web-projects`:
   1. Trên Windows, điều này có thể thực hiện bằng cách chọn nút _New_ trong cửa sổ File Explorer và chọn _Folder_ (hoặc nhấn <kbd>Ctrl</kbd> + <kbd>Shift</kbd> + <kbd>N</kbd>), gõ `web-projects` làm tên cho biểu tượng thư mục mới xuất hiện, và nhấn <kbd>Enter</kbd>/<kbd>Return</kbd>.
   2. Trên macOS, điều này có thể thực hiện bằng cách chọn _File_ > _New Folder_ trên menu Finder (hoặc nhấn <kbd>Cmd</kbd> + <kbd>Shift</kbd> + <kbd>N</kbd>) — bạn sẽ thấy một thư mục mới xuất hiện có tên _untitled folder_. Nhấp vào tên thư mục để bắt đầu chỉnh sửa, gõ `web-projects`, và nhấn <kbd>Enter</kbd>/<kbd>Return</kbd>.

Nếu bạn mắc lỗi đánh máy, bạn có thể chỉnh sửa tên thư mục để sửa (điều này cũng hoạt động với tệp):

- Trên Windows, nhấp chuột phải vào thư mục, chọn _Rename_ từ menu, sau đó chỉnh sửa. Một số phiên bản Windows có menu đơn giản hóa hiện ra ban đầu — bạn có thể phải nhấp chuột phải, sau đó chọn _Show more options_, rồi chọn _Rename_!
- Trên macOS, nhấp vào/chọn tên thư mục để chỉnh sửa.

### Mở thư mục dự án và tạo tệp trong VS Code

Mặc dù bạn có thể tạo tệp văn bản trong UI hệ thống tệp của OS, nhưng thường dễ hơn và ít xảy ra lỗi hơn khi tạo chúng trong trình soạn thảo mã. Trên thực tế, VS Code có bộ khám phá tệp riêng cho phép bạn tạo tất cả các thư mục và tệp cần thiết cho các dự án web.

Vậy tại sao chúng tôi lại yêu cầu bạn tạo thư mục bằng UI hệ thống tệp OS? Vì VS Code cần được trỏ đến một thư mục cấp cao nhất ban đầu!

Cũng hữu ích khi hiểu một chút về cách cấu trúc hệ thống tệp OS của bạn. Điều này sẽ trở nên hữu ích hơn khi bạn bắt đầu sử dụng các công cụ phức tạp hơn sau này.

Hãy mở thư mục `web-projects` trong VS Code ngay bây giờ:

1. Mở VS Code.
2. Chọn _File_ > _Open Folder..._ từ menu.
   > [!NOTE]
   > Nếu bạn là người dùng bàn phím, bạn có thể chạy lệnh _Open Folder_ trên Windows bằng cách giữ phím <kbd>Ctrl</kbd> và nhấn <kbd>K</kbd> rồi <kbd>O</kbd>. Cách dễ nhất cho người dùng macOS là mở _Command Palette_ bằng <kbd>Cmd</kbd> + <kbd>Shift</kbd> + <kbd>P</kbd>, gõ "Open Folder" để lọc danh sách lệnh, sử dụng phím con trỏ để di chuyển xuống _File: Open Folder_, sau đó nhấn <kbd>Enter</kbd>.
3. Một phiên bản thu nhỏ của UI hệ thống tệp OS sẽ xuất hiện. Sử dụng nó để tìm thư mục `web-projects`, chọn nó, rồi nhấn nút _Select Folder_.
4. Bạn sẽ được hiển thị một hộp thoại có tiêu đề _Do you trust the authors of the files in this folder?_ Hãy đọc cẩn thận để hiểu ý nghĩa của nó. Hiện tại, bạn là người duy nhất sẽ tạo tệp trong thư mục này, vì vậy bạn có thể nhấp _Yes, I trust the authors_.

Bạn sẽ thấy thư mục `web-projects` mở trong ngăn _EXPLORER_ của VS Code, như hiển thị bên dưới:

![Ngăn Explorer của VS Code, hiển thị thư mục rỗng tên web-projects](vs-code-explorer.png)

> [!WARNING]
> Một lần nữa, hãy đảm bảo bạn chỉ chỉnh sửa các tệp của riêng mình trong thư mục _Home_ của bạn, để tránh gây ra bất kỳ sự cố nào với hệ thống.

#### Ghi chú về điều hướng bàn phím trong VS Code

VS Code, dù không hoàn hảo theo bất kỳ nghĩa nào, có bộ phím tắt bàn phím phong phú. Trong bài này, chúng tôi đã cố gắng bao gồm những phím tắt hữu ích khi có thể, nhưng bạn có thể tìm thêm danh sách đầy đủ tại [Tham chiếu phím tắt bàn phím](https://code.visualstudio.com/docs/configure/keybindings) của VS Code.

Nhìn chung, nếu bạn muốn điều hướng VS Code qua bàn phím, bạn có thể nhấn phím <kbd>Tab</kbd> để di chuyển giữa các khu vực khác nhau của UI (<kbd>Shift</kbd> + <kbd>Tab</kbd> sẽ đưa bạn về vị trí tab focus trước đó). Nếu có nhiều nút ở một vị trí tab focus, bạn có thể sử dụng phím con trỏ để di chuyển giữa chúng.

Nếu bạn đang chỉnh sửa tệp, phím tab sẽ không điều hướng xung quanh UI — nó sẽ thêm ký tự tab vào tệp. Để thoát khỏi tệp bạn đang chỉnh sửa sang ngăn _EXPLORER_, bạn có thể nhấn <kbd>Cmd</kbd> + <kbd>Shift</kbd> + <kbd>E</kbd> trên macOS, hoặc <kbd>Ctrl</kbd> + <kbd>Shift</kbd> + <kbd>E</kbd> trên Windows.

Để quay lại ngăn trình soạn thảo tệp và di chuyển giữa các tệp khác nhau được mở trong các tab khác nhau, giữ phím <kbd>Ctrl</kbd> và sử dụng <kbd>Tab</kbd> và <kbd>Shift</kbd> + <kbd>Tab</kbd> để di chuyển lên và xuống danh sách các tab đang mở (trên cả macOS và Windows). Khi đã tô sáng tệp bạn muốn chỉnh sửa, thả các phím để di chuyển đến tab đó.

#### Tạo tệp

Từ đây, bạn có thể tạo tệp và thư mục mới sử dụng các nút liên quan ở đầu ngăn _EXPLORER_.

1. Tạo tệp mới bằng cách nhấp vào biểu tượng _New File..._ (hoặc <kbd>Tab</kbd> đến nó và nhấn <kbd>Enter</kbd>/<kbd>Return</kbd>).
2. Nhập tên tệp là "index.html" trong ô nhập văn bản xuất hiện, và nhấn <kbd>Enter</kbd>/<kbd>Return</kbd>.

> [!NOTE]
> Đừng sử dụng các nút ở đầu tab _Welcome_ để tạo tệp và thư mục, vì chúng hoạt động hơi khác. Trên thực tế, bạn có thể đóng tab _Welcome_, vì bạn không cần nó. Làm điều này bằng cách nhấp vào "x" ở phía bên phải của tab, hoặc nhấn <kbd>Cmd</kbd> + <kbd>W</kbd> trên macOS (<kbd>Ctrl</kbd> + <kbd>W</kbd> trên Windows).

Tại thời điểm này, hãy quay lại UI hệ thống tệp OS của bạn, vào thư mục `web-projects` bằng cách nhấp đúp vào nó, và bạn sẽ thấy tệp `index.html` của mình cũng ở đó. VS Code đang sử dụng hệ thống tệp OS nền tảng, không sử dụng hệ thống tệp kỳ lạ của riêng nó.

### Di chuyển index.html vào thư mục con riêng của nó

Bạn có thể tạo các thư mục bên trong các thư mục khác (gọi là _thư mục con - sub-folder_) sâu nhiều cấp tùy ý. Bạn cũng có thể di chuyển các tệp (và thư mục) vào các thư mục khác bằng cách kéo và thả chúng lên thư mục đó.

Hãy khám phá điều này, và trong quá trình đó, di chuyển tệp `index.html` của chúng ta vào thư mục con riêng của nó. Chúng ta không thực sự muốn nó nằm bên trong thư mục `web-projects` chính.

1. Tạo một thư mục mới bên trong `web-projects`, sử dụng nút _New Folder..._ của ngăn _EXPLORER_ trong VS Code.
2. Đặt tên là `test-site`.
3. Bây giờ bạn có thể kéo tệp `index.html` và thả nó lên thư mục `test-site` để di chuyển tệp vào thư mục đó.
   > [!NOTE]
   > Nếu bạn là người dùng bàn phím, bạn có thể làm điều này bằng cách thực hiện các bước sau:
   >
   > 1. Sử dụng phím mũi tên lên và xuống để di chuyển đường viền focus lên tệp `index.html`.
   > 2. Nhấn <kbd>Cmd</kbd> + <kbd>X</kbd> trên macOS (<kbd>Ctrl</kbd> + <kbd>X</kbd> trên Windows) để chọn tệp để di chuyển.
   > 3. Sử dụng phím mũi tên để di chuyển đường viền focus lên thư mục.
   > 4. Nhấn <kbd>Cmd</kbd> + <kbd>V</kbd> trên macOS (<kbd>Ctrl</kbd> + <kbd>V</kbd> trên Windows) để di chuyển tệp vào thư mục đó.

Có nhiều điều hơn chúng tôi có thể đề cập về việc sử dụng UI hệ thống tệp OS và VS Code, nhưng không gian có hạn, vì vậy chúng tôi sẽ dừng ở đây. Những thông tin trên đủ để bạn bắt đầu, và chúng tôi khuyến khích bạn tìm kiếm trên web thông tin về cách thực hiện các thao tác khác với tệp và thư mục.

Hãy chuyển sang thảo luận ngắn về cấu trúc website.

## Một website nên có cấu trúc như thế nào?

Khi bạn làm việc trên các website cục bộ (trên máy tính của bạn), bạn nên giữ tất cả các tệp liên quan cho mỗi website trong một thư mục duy nhất. Đến lượt, bạn nên giữ tất cả các thư mục website trong một thư mục trung tâm, để dễ tìm.

Ở phần trước trong bài, chúng tôi đã hướng dẫn bạn tạo thư mục trung tâm có tên `web-projects` để lưu tất cả các dự án website. Chúng tôi cũng đã yêu cầu bạn tạo thư mục con có tên `test-site` với tệp `index.html` trống bên trong.

Hãy thêm một số tính năng trong `test-site` để minh họa cấu trúc website điển hình; trong mô-đun tiếp theo, chúng tôi sẽ yêu cầu bạn xây dựng một ví dụ website hoàn chỉnh bên trong nó. Những thứ phổ biến nhất mà bất kỳ dự án website nào sẽ chứa là một tệp HTML index và các thư mục chứa hình ảnh, tệp style, và tệp script:

1. **`index.html`**: Tệp này thường chứa nội dung trang chủ của bạn, tức là văn bản và hình ảnh mà mọi người thấy khi họ lần đầu truy cập website.
2. **Thư mục `images`**: Thư mục này chứa tất cả hình ảnh bạn sử dụng trên website.
3. **Thư mục `styles`**: Thư mục này chứa mã CSS được dùng để tạo kiểu cho nội dung (ví dụ: đặt màu văn bản và nền).
4. **Thư mục `scripts`**: Thư mục này chứa tất cả mã JavaScript được dùng để thêm chức năng tương tác cho website (ví dụ: xác định điều gì xảy ra khi các nút được nhấp).

Bạn đã có tệp `index.html` bên trong `test-site`. Hãy tạo các thư mục `images`, `styles`, và `scripts` bên trong nó ngay bây giờ.

## Tên tệp

Thông thường có hai phần của tên tệp — **tên** và **phần mở rộng (extension)**. Lấy tệp chúng ta đã tạo ở trên — `index.html`:

- Tên trong trường hợp này là `index`. Tên tệp thường có thể chứa bất kỳ ký tự nào bạn muốn, mặc dù các hệ thống máy tính khác nhau sẽ có nhiều hạn chế khác nhau về các ký tự có thể sử dụng. Tốt hơn là nên dùng số và chữ cái, ít nhất là ban đầu. Ngoài ra, hệ thống có thể gán ý nghĩa đặc biệt cho các tên hoặc phần tên nhất định — như chúng ta đã nói, các tệp `index` có xu hướng được nhận ra là tệp trang chủ chính của website.
- Phần mở rộng tệp xác định loại tệp chúng ta đang làm việc, và được các hệ thống máy tính sử dụng để xác định loại nội dung nào có thể mong đợi trong tệp, chương trình nào nên được dùng để mở tệp, v.v. Trong trường hợp này, phần mở rộng là `.html`, có nghĩa là tệp nên chứa văn bản thuần túy, và cụ thể hơn là mã HTML. Do phần mở rộng này, máy tính của bạn biết rằng khi bạn cố mở tệp, nó nên mở bằng trình soạn thảo văn bản mặc định, đó sẽ là VS Code nếu bạn đã làm theo tất cả hướng dẫn của chúng tôi đến thời điểm này.

Không phải luôn luôn đúng trong mọi trường hợp, nhưng hầu hết các tệp cần có phần mở rộng để được xử lý đúng cách. Việc xóa hoặc thay đổi phần mở rộng tệp có thể gây ra lỗi, vì vậy bạn không nên thay đổi nó trừ khi bạn thực sự biết mình đang làm gì.

> [!NOTE]
> Có thể có nhiều hơn một dấu chấm trong tên tệp, ví dụ `my.cats.html`. Trong những trường hợp như vậy, dấu chấm cuối cùng được giả định là bắt đầu phần mở rộng tệp.

Trên máy tính Windows, bạn có thể gặp khó khăn trong việc xem phần mở rộng của một số tệp, vì Windows có tùy chọn **Ẩn phần mở rộng cho các loại tệp đã biết (Hide extensions for known file types)** được bật theo mặc định. Bạn có thể tắt tùy chọn này bằng cách vào File Explorer, chọn tùy chọn **Folder options…**, bỏ chọn hộp kiểm **Hide extensions for known file types**, sau đó nhấp **OK**. Để biết thông tin cụ thể hơn về phiên bản Windows của bạn, bạn có thể tìm kiếm trên web.

### Quy tắc tốt nhất để đặt tên tệp

Khi theo học khóa học này, bạn sẽ nhận thấy rằng chúng tôi luôn yêu cầu bạn đặt tên thư mục và tệp hoàn toàn bằng chữ thường và không có khoảng trắng. Có nhiều cách mà việc bỏ qua lời khuyên này tạo ra vấn đề — một số vấn đề phổ biến hơn như sau:

1. Nhiều hệ thống máy tính, bao gồm hầu hết các máy chủ web, phân biệt chữ hoa chữ thường (case-sensitive). Vì vậy, ví dụ: nếu bạn đặt một hình ảnh trên website tại `test-site/images/MyImage.jpg` và sau đó trong một tệp khác bạn cố tham chiếu hình ảnh với `test-site/images/myimage.jpg`, nó có thể không hoạt động.
2. Khi bạn thực hiện các lệnh trên dòng lệnh, bạn phải đặt tên tệp có khoảng trắng trong dấu ngoặc kép, nếu không chúng sẽ được hiểu là hai mục riêng biệt.
3. Một số ngôn ngữ lập trình (ví dụ: Python) không hoạt động tốt với khoảng trắng trong tên tệp trong một số trường hợp (ví dụ: nếu các tệp này là các mô-đun cần được nhập).
4. Tên tệp thường ánh xạ đến địa chỉ web/URL. Ví dụ: nếu bạn có tệp tên <code>my&nbsp;file.html</code> trong thư mục gốc của máy chủ, nó thường có thể truy cập tại URL như `https://example.com/my%20file.html`. Máy chủ web thường thay thế khoảng trắng trong tên tệp bằng `%20` (vì URL là {{Glossary("Percent-encoding", "mã hóa phần trăm - percent-encoded")}}), điều này có thể tạo ra lỗi tinh tế với một số hệ thống nếu chúng giả định rằng tên tệp và URL khớp hoàn hảo.

Thay vì khoảng trắng, nhiều nhà phát triển sử dụng ký tự phân cách như gạch ngang (`-`) thay vì khoảng trắng — ví dụ `my-file.html` thay vì <code>my&nbsp;file.html</code>. Đây là một quy tắc tốt.

Tốt nhất là hãy tập thói quen viết tên thư mục và tệp bằng chữ thường, không có khoảng trắng và các từ được ngăn cách bằng gạch ngang, ít nhất cho đến khi bạn biết mình đang làm gì. Bằng cách đó, bạn sẽ ít gặp vấn đề hơn về sau.

> [!NOTE]
> Bạn có thể tìm thêm quy tắc tốt nhất cho tên tệp và URL trong [Quy tắc tốt nhất về cấu trúc URL cho Google](https://developers.google.com/search/docs/crawling-indexing/url-structure).

## Đường dẫn tệp

Để tham chiếu từ một tệp đến một tệp khác, bạn phải cung cấp đường dẫn tệp (file path) — về cơ bản là một tuyến đường, để một tệp biết tệp khác ở đâu. Ví dụ: khi tạo một trang web chứa hình ảnh, mã trang web của bạn sẽ cần chứa đường dẫn tệp chỉ ra vị trí của hình ảnh bạn muốn hiển thị.

Hãy thực hành một ví dụ cơ bản về điều này. Bạn có thể chưa hiểu tất cả ý nghĩa của điều này ngay bây giờ, nhưng không sao.

1. Tìm kiếm một hình ảnh bạn thích trên web (ví dụ: sử dụng dịch vụ như [Google Images](https://www.google.com/imghp)) và tải xuống. Hoặc, bạn có thể lấy [hình ảnh logo Firefox](https://raw.githubusercontent.com/mdn/beginner-html-site/refs/heads/main/images/firefox-icon.png) để sử dụng cho ví dụ này.
2. Đặt hình ảnh bên trong thư mục _images_ của bạn.
3. Đảm bảo tệp hình ảnh có tên ngắn gọn và đơn giản, không có khoảng trắng. Ví dụ: `firefox-icon.png` là tốt, và `cat.jpg` là tốt, nhưng `efregre^%^£$£@%$^&YTJgfbgfdgt54656756_ertgrth-rtgtfghhyj.png` là không tốt. Ngoài ra, hãy đảm bảo bạn giữ phần mở rộng tệp.

Bây giờ chúng ta sẽ thêm nội dung vào tệp `index.html` để nó có thể tìm thấy tệp hình ảnh và hiển thị nó.

1. Mở `index.html` trong VS Code và chèn nội dung sau vào tệp chính xác như hiển thị bên dưới. Đây là HTML, ngôn ngữ chúng ta sử dụng để xác định và cấu trúc nội dung trang web. Bạn sẽ tìm hiểu nhiều hơn về điều này rất sớm!

   ```html
   <!doctype html>
   <html lang="en-US">
     <head>
       <meta charset="utf-8" />
       <meta name="viewport" content="width=device-width" />
       <title>My test page</title>
     </head>
     <body>
       <img src="" alt="My test image" />
     </body>
   </html>
   ```

2. Dòng `<img src="" alt="My test image">` là mã HTML chèn hình ảnh vào trang. Chúng ta cần cho HTML biết hình ảnh ở đâu. Hình ảnh nằm trong thư mục _images_, nằm trong cùng thư mục với `index.html`. Để đi xuống cấu trúc tệp từ `index.html` đến hình ảnh, đường dẫn tệp chúng ta cần là `images/tên-tệp-hình-ảnh-của-bạn`. Ví dụ: nếu hình ảnh của bạn có tên `firefox-icon.png`, đường dẫn tệp sẽ là `images/firefox-icon.png`.
3. Chèn đường dẫn tệp vào mã HTML của bạn giữa hai dấu ngoặc kép của `src=""`.
4. Lưu tệp HTML của bạn, sau đó tải nó trong trình duyệt. Bạn có thể làm điều này bằng cách nhấp <kbd>Ctrl</kbd>/chuột phải vào tệp HTML, sau đó chọn _Open With_ và chọn trình duyệt từ submenu kết quả. Bạn cũng có thể mở UI hệ thống tệp và cửa sổ trình duyệt trên cùng màn hình, và kéo tệp HTML lên đầu cửa sổ trình duyệt.

Bạn sẽ thấy một trang web cơ bản hiển thị hình ảnh của bạn!

![Ảnh chụp màn hình về website cơ bản của chúng ta chỉ hiển thị logo Firefox — một con cáo lửa quấn quanh thế giới](website-screenshot.png)

### Quy tắc chung cho đường dẫn tệp

- Để liên kết đến tệp đích trong cùng thư mục với tệp HTML đang gọi, chỉ cần sử dụng tên tệp, ví dụ `my-image.jpg`.
- Để tham chiếu tệp trong một thư mục con, hãy viết tên thư mục trước đường dẫn, cộng với dấu gạch chéo, ví dụ `subfolder/my-image.jpg`.
- Để liên kết đến tệp đích trong thư mục **trên** tệp HTML đang gọi, hãy viết hai dấu chấm. Vì vậy, ví dụ: nếu `index.html` nằm trong thư mục con của `test-site` và `my-image.jpg` nằm trong `test-site`, bạn có thể tham chiếu `my-image.jpg` từ `index.html` bằng `../my-image.jpg`.
- Bạn có thể kết hợp các quy tắc này tùy ý, ví dụ `../subfolder/another-subfolder/my-image.jpg`.

> [!NOTE]
> Hệ thống tệp Windows có xu hướng sử dụng dấu gạch chéo ngược thay vì dấu gạch chéo xuôi, ví dụ `C:\Windows`. Điều này không quan trọng trong HTML — ngay cả khi bạn đang phát triển website trên Windows, bạn vẫn nên sử dụng dấu gạch chéo xuôi trong mã của mình.

{{PreviousMenuNext("Learn_web_development/Getting_started/Environment_setup/Code_editors", "Learn_web_development/Getting_started/Environment_setup/Command_line", "Learn_web_development/Getting_started/Environment_setup")}}
