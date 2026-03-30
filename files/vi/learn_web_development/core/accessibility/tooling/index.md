---
title: Công cụ hỗ trợ khả năng tiếp cận và công nghệ hỗ trợ
short-title: Công cụ khả năng tiếp cận
slug: Learn_web_development/Core/Accessibility/Tooling
page-type: learn-module-chapter
sidebar: learnsidebar
---

{{PreviousMenuNext("Learn_web_development/Core/Accessibility/What_is_accessibility","Learn_web_development/Core/Accessibility/HTML", "Learn_web_development/Core/Accessibility")}}

Tiếp theo, chúng ta chuyển sự chú ý sang các công cụ hỗ trợ khả năng tiếp cận, cung cấp thông tin về các loại công cụ bạn có thể sử dụng để giải quyết các vấn đề về khả năng tiếp cận, và giúp bạn hiểu **công nghệ hỗ trợ** mà người khuyết tật sử dụng để duyệt web. Bạn sẽ sử dụng các công cụ được mô tả ở đây trong các bài viết tiếp theo.

<table>
  <tbody>
    <tr>
      <th scope="row">Điều kiện tiên quyết:</th>
      <td>Quen thuộc với <a href="/en-US/docs/Learn_web_development/Core/Structuring_content">HTML</a>, <a href="/en-US/docs/Learn_web_development/Core/Styling_basics">CSS</a>, <a href="/en-US/docs/Learn_web_development/Core/Accessibility/What_is_accessibility">hiểu biết cơ bản về các khái niệm khả năng tiếp cận</a>.</td>
    </tr>
    <tr>
      <th scope="row">Kết quả học tập:</th>
      <td>
        <ul>
          <li>Quen thuộc với loại công cụ hỗ trợ bạn có thể sử dụng để giải quyết các vấn đề về khả năng tiếp cận, ví dụ như các công cụ kiểm toán.</li>
          <li>Thiết lập trình đọc màn hình và sử dụng chúng để kiểm tra trang web trên máy tính để bàn và thiết bị di động.</li>
          <li>Quen thuộc với các loại công nghệ hỗ trợ khác như bàn phím chữ to hoặc chữ nổi Braille, các thiết bị trỏ thay thế và kính lúp màn hình.</li>
          <li>Tầm quan trọng của kiểm tra người dùng bên cạnh kiểm tra tự động.</li>
        </ul>
      </td>
    </tr>
  </tbody>
</table>

## Công cụ khả năng tiếp cận

Hãy xem qua các công cụ và kỹ thuật bạn có thể sử dụng để kiểm tra khả năng tiếp cận của trang web và khắc phục các vấn đề bạn phát hiện.

### Kiểm tra thứ tự nguồn

Nội dung của bạn phải có ý nghĩa hợp lý theo thứ tự nguồn — bạn có thể hiển thị nó khác đi với CSS sau này, nhưng bạn nên đúng cấu trúc cơ bản để bắt đầu. Điều này là vì các công nghệ hỗ trợ đọc nội dung trang web dựa trên thứ tự của nguồn, và người khuyết tật thường sửa đổi hoặc tắt một phần CSS để làm cho nội dung dễ đọc hơn (ví dụ phổ biến là tăng kích thước phông chữ và áp dụng các màu tương phản cao).

Để kiểm tra thứ tự nguồn, bạn có thể tắt CSS của trang web và xem nó có dễ hiểu không. Bạn có thể thực hiện thủ công bằng cách chỉ xóa CSS khỏi mã của bạn, nhưng cách dễ nhất là sử dụng các tính năng của trình duyệt, ví dụ:

- Firefox: Chọn _Xem > Kiểu trang > Không có kiểu_ từ menu chính.
- Safari: [Mở công cụ phát triển của trình duyệt](/en-US/docs/Learn_web_development/Howto/Tools_and_setup/What_are_browser_developer_tools#how_to_open_the_devtools_in_your_browser), nhấp vào nút _Cài đặt thiết bị_ gần phía trên bên trái của bảng công cụ phát triển (trông như màn hình máy tính), sau đó đánh dấu vào ô "Tắt CSS" trong bảng xuất hiện.
- Chrome/Edge: Cài đặt tiện ích mở rộng [Thanh công cụ nhà phát triển web](https://chromewebstore.google.com/detail/web-developer/bfbameneiokkgbdmiekhjnmfkcnldhhm), sau đó khởi động lại trình duyệt. Nhấp vào biểu tượng bánh răng "Web Developer" giờ sẽ có sẵn trong menu tiện ích mở rộng của bạn, sau đó chọn _CSS > Tắt tất cả kiểu_.

### Công cụ kiểm tra độ tương phản màu sắc

Khi chọn bảng màu cho trang web của bạn, hãy đảm bảo rằng màu văn bản (nền trước) tương phản tốt với màu nền. Thiết kế của bạn có thể trông đẹp, nhưng nó không có giá trị gì nếu mọi người không thể đọc nội dung của bạn. Sử dụng công cụ như [Công cụ kiểm tra độ tương phản màu sắc](https://webaim.org/resources/contrastchecker/) của WebAIM để kiểm tra xem sơ đồ của bạn có đủ tương phản không.

Một mẹo khác là tránh sử dụng chỉ màu sắc cho biển chỉ dẫn hoặc tô sáng thông tin quan trọng, vì điều này có thể bị bỏ lỡ bởi những người bị suy giảm thị giác như mù màu. Thay vì đánh dấu các trường biểu mẫu bắt buộc bằng màu đỏ, hãy đánh dấu chúng bằng dấu hoa thị và màu đỏ.

> [!NOTE]
> Tỷ lệ tương phản cao cũng sẽ cho phép bất kỳ ai sử dụng điện thoại thông minh hoặc máy tính bảng với màn hình bóng đọc trang tốt hơn khi ở môi trường sáng, chẳng hạn như ánh sáng mặt trời.

### Công cụ kiểm toán

Có một số công cụ kiểm toán có sẵn mà bạn có thể cung cấp trang web vào. Chúng sẽ xem xét chúng và trả về danh sách các vấn đề về khả năng tiếp cận có trên trang. Hãy xem [Wave](https://wave.webaim.org/) như một ví dụ, một công cụ kiểm tra khả năng tiếp cận trực tuyến chấp nhận địa chỉ web và trả về chế độ xem chú thích của trang đó với các vấn đề khả năng tiếp cận được đánh dấu.

1. Truy cập [trang chủ Wave](https://wave.webaim.org/).
2. Nhập URL ví dụ [bad-form.html](https://mdn.github.io/learning-area/accessibility/html/bad-form.html) của chúng tôi vào ô nhập văn bản gần đầu trang. Sau đó nhấn Enter hoặc nhấp/chạm vào mũi tên ở cạnh phải của ô nhập.
3. Trang web sẽ đánh dấu các vấn đề khả năng tiếp cận hiện có. Nhấp vào các biểu tượng hiển thị để xem thêm thông tin về từng vấn đề được Wave xác định.

Các công cụ kiểm toán khác đáng kiểm tra:

- [Trình kiểm tra khả năng tiếp cận Firefox](https://firefox-source-docs.mozilla.org/devtools-user/accessibility_inspector/index.html)
- [Đánh dấu trang ANDI](https://www.ssa.gov/accessibility/andi/help/install.html)
- [Kiểm toán khả năng tiếp cận Google Lighthouse](https://developer.chrome.com/docs/lighthouse/accessibility/scoring)

> [!NOTE]
> Các công cụ như vậy không đủ tốt để tự giải quyết tất cả các vấn đề khả năng tiếp cận của bạn. Bạn sẽ cần kết hợp những thứ này, kiến ​​thức và kinh nghiệm, kiểm tra người dùng, v.v. để có cái nhìn đầy đủ.

[Công cụ aXe của Deque](https://www.deque.com/axe/) đi xa hơn một chút so với các công cụ kiểm toán chúng tôi đã đề cập ở trên. Giống như những công cụ kia, nó kiểm tra trang và trả về lỗi khả năng tiếp cận. Dạng hữu ích nhất ngay lập tức có lẽ là các tiện ích mở rộng trình duyệt:

- [aXe cho Chrome](https://chromewebstore.google.com/detail/axe-devtools-web-accessib/lhdoppojpmngadmnindnejefpokejbdd)
- [aXe cho Firefox](https://addons.mozilla.org/en-US/firefox/addon/axe-devtools/)

Những tiện ích này thêm tab khả năng tiếp cận vào công cụ phát triển của trình duyệt. Ví dụ, chúng tôi đã cài đặt phiên bản Firefox, sau đó sử dụng nó để kiểm toán ví dụ [bad-table.html](https://mdn.github.io/learning-area/accessibility/html/bad-table.html) của chúng tôi. Chúng tôi nhận được kết quả sau:

![Ảnh chụp màn hình các vấn đề khả năng tiếp cận được xác định bởi công cụ Axe.](axe-screenshot.png)

aXe cũng có thể cài đặt bằng `npm`, và có thể tích hợp với các trình chạy tác vụ như [Grunt](https://gruntjs.com/) và [Gulp](https://gulpjs.com/), các khung tự động hóa như [Selenium](https://www.selenium.dev/) và [Cucumber](https://cucumber.io/), các khung kiểm tra đơn vị như [Jasmine](https://jasmine.github.io/), và nhiều hơn nữa (xem [trang aXe chính](https://www.deque.com/axe/) để biết chi tiết).

## Trình đọc màn hình

Một trong những loại công nghệ hỗ trợ (AT) phổ biến nhất mà người khuyết tật sử dụng — và một trong những loại phổ biến nhất bạn sẽ sử dụng để kiểm tra khả năng tiếp cận của trang web — là **trình đọc màn hình**. Đây là các phần mềm đọc to nội dung trang web hoặc nội dung từ các ứng dụng khác được cài đặt trên hệ điều hành của ai đó. Trình đọc màn hình cho phép mọi người sử dụng máy tính mà không cần nhìn thấy bất kỳ nội dung trực quan nào.

Các trình duyệt web hiển thị thông tin về nội dung trang cho trình đọc màn hình (và AT khác) để truyền đạt cho người dùng thông qua một biểu diễn gọi là [cây khả năng tiếp cận](/en-US/docs/Glossary/Accessibility_tree). Điều này cung cấp thông tin ngữ nghĩa như tên và mô tả của các phần tử, mục đích hoặc vai trò của chúng là gì (đó có phải là nút hay trường nhập không?), và liệu chúng có ở trạng thái cụ thể không (ví dụ: một hộp thoại có mở hay đóng không?).

Thông tin này có thể tầm thường trong trường hợp một đoạn văn bản, nghe có vẻ khá giống như cách nó được viết, nhưng có thể phức tạp khi liên quan đến các tính năng giao diện người dùng như menu thả xuống hoặc trình phát video. Đó là lý do tại sao rất quan trọng để sử dụng HTML ngữ nghĩa đúng cách, mà bạn sẽ xem xét chi tiết trong bài viết tiếp theo của mô-đun này. Nếu bạn đánh dấu nội dung bằng phần tử sai, nó có thể gây nhầm lẫn cho người dùng trình đọc màn hình.

Hãy đảm bảo bạn đã cài đặt một hoặc hai trình đọc màn hình trên máy phát triển của mình và thử sử dụng các trang web yêu thích của bạn qua trình đọc màn hình, như đã thảo luận bên dưới. Hiểu cách người khiếm thị sử dụng web là chìa khóa để thiết kế các sản phẩm hoạt động tốt hơn cho mọi người.

### Những trình đọc màn hình nào có sẵn?

Có một số trình đọc màn hình:

- Một số là sản phẩm thương mại có trả phí, như [JAWS](https://vispero.com/jaws-screen-reader-software/) (Windows).
- Một số là sản phẩm miễn phí, như [NVDA](https://www.nvaccess.org/) (Windows), [ChromeVox](https://support.google.com/chromebook/answer/7031755) (Chrome, Windows và macOS), và [Orca](https://wiki.gnome.org/Projects/Orca) (Linux).
- Một số được tích hợp vào hệ điều hành, như [VoiceOver](https://www.apple.com/accessibility/features/?vision) (macOS và iOS), [ChromeVox](https://support.google.com/chromebook/answer/7031755) (trên Chromebooks), và [TalkBack](https://play.google.com/store/apps/details?id=com.google.android.marvin.talkback) (Android).

Nói chung, trình đọc màn hình là các ứng dụng riêng biệt chạy trên hệ điều hành chủ và có thể đọc trang web và nội dung trong các ứng dụng khác cũng vậy (điều này không phải lúc nào cũng đúng; ChromeVox ví dụ là một tiện ích mở rộng trình duyệt). Trình đọc màn hình có xu hướng có một số khác biệt về hành vi và điều khiển chính xác, vì vậy bạn sẽ phải tham khảo tài liệu về trình đọc màn hình bạn chọn để có tất cả các chi tiết. Nói vậy, chúng đều hoạt động theo cùng một cách cơ bản.

Trong vài phần tiếp theo, chúng ta sẽ thực hiện một số bài kiểm tra với một vài trình đọc màn hình khác nhau để cho bạn ý tưởng chung về cách chúng hoạt động và cách kiểm tra với chúng.

> [!NOTE]
> [Thiết kế cho tương thích trình đọc màn hình](https://webaim.org/techniques/screenreader/) của WebAIM cung cấp một số thông tin hữu ích về việc sử dụng trình đọc màn hình và những gì hoạt động tốt nhất cho trình đọc màn hình. Ngoài ra, hãy xem [Kết quả khảo sát người dùng trình đọc màn hình #10](https://webaim.org/projects/screenreadersurvey10/#used) để biết một số số liệu thống kê thú vị về việc sử dụng trình đọc màn hình.

#### VoiceOver

VoiceOver (VO) đi kèm miễn phí với Mac/iPhone/iPad của Apple, vì vậy nó hữu ích để kiểm tra trên máy tính để bàn/thiết bị di động nếu bạn sử dụng sản phẩm Apple. Chúng tôi đã kiểm tra nó trên macOS trên MacBook Pro.

Để bật, nhấn <kbd>Cmd</kbd> + <kbd>F5</kbd>. Nếu bạn chưa từng sử dụng VO trước đây, bạn sẽ được hiển thị một màn hình chào mừng nơi bạn có thể chọn bắt đầu VO hay không, và chạy qua một hướng dẫn khá hữu ích để học cách sử dụng nó. Để tắt, nhấn <kbd>Cmd</kbd> + <kbd>F5</kbd> một lần nữa.

> [!NOTE]
> Bạn nên xem qua hướng dẫn ít nhất một lần — đó là cách thực sự hữu ích để học VO.

Khi VO đang bật, màn hình sẽ trông hầu như giống nhau, nhưng bạn sẽ thấy một hộp đen ở góc dưới bên trái của màn hình chứa thông tin về những gì VO hiện đang chọn. Lựa chọn hiện tại cũng sẽ được tô sáng, với viền đen — điểm sáng này được gọi là **con trỏ VO**.

![Ảnh chụp màn hình minh họa kiểm tra khả năng tiếp cận bằng VoiceOver trên trang chủ MDN. Góc dưới bên trái của ảnh là điểm sáng thông tin được chọn trên trang web.](voiceover.png)

Để sử dụng VO, bạn sẽ sử dụng nhiều "công cụ sửa đổi VO" — đây là phím hoặc tổ hợp phím bạn cần nhấn ngoài các phím tắt bàn phím VO thực tế để chúng hoạt động. Sử dụng công cụ sửa đổi như thế này là phổ biến với trình đọc màn hình, để cho phép chúng giữ các lệnh của mình không xung đột với các lệnh khác. Trong trường hợp VO, công cụ sửa đổi có thể là <kbd>CapsLock</kbd>, hoặc <kbd>Ctrl</kbd> + <kbd>Option</kbd>.

VO có nhiều lệnh bàn phím và chúng tôi sẽ không liệt kê tất cả ở đây. Những lệnh cơ bản bạn sẽ cần để kiểm tra trang web được liệt kê trong bảng sau. Trong các phím tắt bàn phím, "VO" có nghĩa là "công cụ sửa đổi VoiceOver".

<table class="standard-table no-markdown">
  <caption>
    Các phím tắt bàn phím VoiceOver phổ biến
  </caption>
  <thead>
    <tr>
      <th scope="col">Phím tắt bàn phím</th>
      <th scope="col">Mô tả</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td>VO + Phím mũi tên</td>
      <td>Di chuyển con trỏ VO lên, phải, xuống, trái.</td>
    </tr>
    <tr>
      <td>VO + Phím cách</td>
      <td>
        Chọn/kích hoạt các mục được tô sáng bởi con trỏ VO. Điều này bao gồm các mục
        được chọn trong Rotor (xem bên dưới).
      </td>
    </tr>
    <tr>
      <td>VO + <kbd>Shift</kbd> + phím mũi tên xuống</td>
      <td>
        Di chuyển vào một nhóm mục như bảng HTML hoặc biểu mẫu. Một khi
        bên trong một nhóm, bạn có thể di chuyển xung quanh và chọn các mục bên trong nhóm đó
        bằng cách sử dụng các lệnh ở trên như bình thường.
      </td>
    </tr>
    <tr>
      <td>VO + <kbd>Shift</kbd> + phím mũi tên lên</td>
      <td>Di chuyển ra khỏi nhóm.</td>
    </tr>
    <tr>
      <td>VO + <kbd>C</kbd></td>
      <td>(khi bên trong bảng) Đọc tiêu đề của cột hiện tại.</td>
    </tr>
    <tr>
      <td>VO + <kbd>R</kbd></td>
      <td>(khi bên trong bảng) Đọc tiêu đề của hàng hiện tại.</td>
    </tr>
    <tr>
      <td>VO + <kbd>C</kbd> + <kbd>C</kbd> (hai C liên tiếp)</td>
      <td>
        (khi bên trong bảng) Đọc toàn bộ cột hiện tại, bao gồm tiêu đề.
      </td>
    </tr>
    <tr>
      <td>VO + <kbd>R</kbd> + <kbd>R</kbd> (hai R liên tiếp)</td>
      <td>
        (khi bên trong bảng) Đọc toàn bộ hàng hiện tại, bao gồm các tiêu đề
        tương ứng với mỗi ô.
      </td>
    </tr>
    <tr>
      <td>VO + phím mũi tên trái, VO + phím mũi tên phải</td>
      <td>
        (khi bên trong một số tùy chọn ngang, chẳng hạn như bộ chọn ngày)
        Di chuyển giữa các tùy chọn.
      </td>
    </tr>
    <tr>
      <td>VO + phím mũi tên lên, VO + phím mũi tên xuống</td>
      <td>
        (khi bên trong một số tùy chọn ngang, chẳng hạn như bộ chọn ngày)
        Thay đổi tùy chọn hiện tại.
      </td>
    </tr>
    <tr>
      <td>VO + <kbd>U</kbd></td>
      <td>
        Mở Rotor, hiển thị danh sách tiêu đề, liên kết, điều khiển biểu mẫu,
        v.v. để điều hướng dễ dàng.
      </td>
    </tr>
    <tr>
      <td>VO + phím mũi tên trái, VO + phím mũi tên phải</td>
      <td>
        (khi bên trong Rotor) Di chuyển giữa các danh sách khác nhau có sẵn trong Rotor.
      </td>
    </tr>
    <tr>
      <td>VO + phím mũi tên lên, VO + phím mũi tên xuống</td>
      <td>
        (khi bên trong Rotor) Di chuyển giữa các mục khác nhau trong danh sách Rotor hiện tại.
      </td>
    </tr>
    <tr>
      <td><kbd>Esc</kbd></td>
      <td>(khi bên trong Rotor) Thoát Rotor.</td>
    </tr>
    <tr>
      <td><kbd>Ctrl</kbd></td>
      <td>(khi VO đang nói) Tạm dừng/Tiếp tục nói.</td>
    </tr>
    <tr>
      <td>VO + <kbd>Z</kbd></td>
      <td>Phát lại phần cuối cùng của lời nói.</td>
    </tr>
    <tr>
      <td>VO + <kbd>D</kbd></td>
      <td>Vào Dock của mac để bạn có thể chọn ứng dụng để chạy bên trong nó.</td>
    </tr>
  </tbody>
</table>

Có vẻ như có nhiều lệnh, nhưng không tệ lắm khi bạn đã quen, và VO thường xuyên nhắc bạn về những lệnh cần sử dụng ở những nơi nhất định. Hãy thử nghiệm với VO ngay bây giờ; bạn có thể tiếp tục thử nghiệm với một số ví dụ của chúng tôi trong phần [Kiểm tra trình đọc màn hình](#screen_reader_testing).

#### NVDA

NVDA chỉ dành cho Windows và bạn cần phải cài đặt nó.

1. Tải xuống NVDA từ [nvaccess.org](https://www.nvaccess.org/), sau đó cài đặt nó. Bạn có thể chọn đóng góp hoặc tải xuống miễn phí; bạn cũng sẽ cần cung cấp địa chỉ email trước khi có thể tải xuống.
2. Để khởi động NVDA sau khi cài đặt, nhấp đúp vào tệp/phím tắt chương trình, hoặc sử dụng phím tắt bàn phím <kbd>Ctrl</kbd> + <kbd>Alt</kbd> + <kbd>N</kbd>. Bạn sẽ thấy hộp thoại chào mừng NVDA khi bắt đầu. Ở đây bạn có thể chọn từ một vài tùy chọn, sau đó nhấn nút _OK_ để bắt đầu.

NVDA bây giờ sẽ hoạt động trên máy tính của bạn.

Để sử dụng NVDA, bạn sẽ sử dụng nhiều "công cụ sửa đổi NVDA" — phím bạn cần nhấn ngoài các phím tắt bàn phím NVDA thực tế để chúng hoạt động. Công cụ sửa đổi NVDA có thể là <kbd>Insert</kbd> (mặc định), hoặc <kbd>CapsLock</kbd> (có thể được chọn bằng cách đánh dấu vào ô kiểm đầu tiên trong hộp thoại chào mừng NVDA trước khi nhấn _OK_).

> [!NOTE]
> NVDA tinh tế hơn VoiceOver về cách nó tô sáng nơi nó đang ở và những gì nó đang làm. Khi bạn đang cuộn qua các tiêu đề, danh sách, v.v., các mục bạn đang chọn thường sẽ được tô sáng bằng đường viền tinh tế, nhưng điều này không phải lúc nào cũng đúng cho tất cả mọi thứ. Nếu bạn bị lạc hoàn toàn, bạn có thể nhấn Ctrl + F5 để làm mới trang hiện tại và bắt đầu lại từ đầu.

NVDA có nhiều lệnh bàn phím và chúng tôi sẽ không liệt kê tất cả ở đây. Những lệnh cơ bản bạn sẽ cần để kiểm tra trang web được liệt kê trong bảng sau. Trong các phím tắt bàn phím, "NVDA" có nghĩa là "công cụ sửa đổi NVDA".

<table class="standard-table no-markdown">
  <caption>
    Các phím tắt bàn phím NVDA phổ biến nhất
  </caption>
  <thead>
    <tr>
      <th scope="col">Phím tắt bàn phím</th>
      <th scope="col">Mô tả</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td>NVDA + <kbd>Q</kbd></td>
      <td>Tắt NVDA sau khi bạn đã bật nó.</td>
    </tr>
    <tr>
      <td>NVDA + phím mũi tên lên</td>
      <td>Đọc dòng hiện tại.</td>
    </tr>
    <tr>
      <td>NVDA + phím mũi tên xuống</td>
      <td>Bắt đầu đọc tại vị trí hiện tại.</td>
    </tr>
    <tr>
      <td>Phím mũi tên lên và xuống, hoặc <kbd>Shift</kbd> + <kbd>Tab</kbd> và <kbd>Tab</kbd></td>
      <td>Di chuyển đến mục trước/tiếp theo trên trang và đọc nó.</td>
    </tr>
    <tr>
      <td>Phím mũi tên trái và phải</td>
      <td>Di chuyển đến ký tự trước/tiếp theo trong mục hiện tại và đọc nó.</td>
    </tr>
    <tr>
      <td><kbd>Shift</kbd> + <kbd>H</kbd> và <kbd>H</kbd></td>
      <td>Di chuyển đến tiêu đề trước/tiếp theo và đọc nó.</td>
    </tr>
    <tr>
      <td><kbd>Shift</kbd> + <kbd>K</kbd> và <kbd>K</kbd></td>
      <td>Di chuyển đến liên kết trước/tiếp theo và đọc nó.</td>
    </tr>
    <tr>
      <td><kbd>Shift</kbd> + <kbd>D</kbd> và <kbd>D</kbd></td>
      <td>
        Di chuyển đến điểm mốc tài liệu trước/tiếp theo (ví dụ: <code>&#x3C;nav></code>)
        và đọc nó.
      </td>
    </tr>
    <tr>
      <td><kbd>Shift</kbd> + <kbd>1</kbd>–<kbd>6</kbd> và <kbd>1</kbd>–<kbd>6</kbd></td>
      <td>Di chuyển đến tiêu đề trước/tiếp theo (cấp 1–6) và đọc nó.</td>
    </tr>
    <tr>
      <td><kbd>Shift</kbd> + <kbd>F</kbd> và <kbd>F</kbd></td>
      <td>Di chuyển đến đầu vào biểu mẫu trước/tiếp theo và tập trung vào nó.</td>
    </tr>
    <tr>
      <td><kbd>Shift</kbd> + <kbd>T</kbd> và <kbd>T</kbd></td>
      <td>Di chuyển đến bảng dữ liệu trước/tiếp theo và tập trung vào nó.</td>
    </tr>
    <tr>
      <td><kbd>Shift</kbd> + <kbd>B</kbd> và <kbd>B</kbd></td>
      <td>Di chuyển đến nút trước/tiếp theo và đọc nhãn của nó.</td>
    </tr>
    <tr>
      <td><kbd>Shift</kbd> + <kbd>L</kbd> và <kbd>L</kbd></td>
      <td>Di chuyển đến danh sách trước/tiếp theo và đọc mục danh sách đầu tiên của nó.</td>
    </tr>
    <tr>
      <td><kbd>Shift</kbd> + <kbd>I</kbd> và <kbd>I</kbd></td>
      <td>Di chuyển đến mục danh sách trước/tiếp theo và đọc nó.</td>
    </tr>
    <tr>
      <td><kbd>Enter</kbd>/<kbd>Return</kbd></td>
      <td>
        (khi liên kết/nút hoặc mục có thể kích hoạt khác được chọn) Kích hoạt mục.
      </td>
    </tr>
    <tr>
      <td>NVDA + <kbd>Phím cách</kbd></td>
      <td>
        (khi biểu mẫu được chọn) Nhập vào biểu mẫu để các mục riêng lẻ có thể được chọn,
        hoặc rời biểu mẫu nếu bạn đã ở trong đó.
      </td>
    </tr>
    <tr>
      <td><kbd>Shift</kbd> + <kbd>Tab</kbd> và <kbd>Tab</kbd></td>
      <td>(khi bên trong biểu mẫu) Di chuyển giữa các đầu vào biểu mẫu.</td>
    </tr>
    <tr>
      <td>Phím mũi tên lên và xuống</td>
      <td>
        (khi bên trong biểu mẫu) Thay đổi giá trị đầu vào biểu mẫu (trong trường hợp các điều khiển như
        hộp chọn).
      </td>
    </tr>
    <tr>
      <td><kbd>Phím cách</kbd></td>
      <td>(khi bên trong biểu mẫu) Chọn giá trị đã chọn.</td>
    </tr>
    <tr>
      <td><kbd>Ctrl</kbd> + <kbd>Alt</kbd> + phím mũi tên</td>
      <td>(khi bảng được chọn) Di chuyển giữa các ô bảng.</td>
    </tr>
  </tbody>
</table>

### Kiểm tra trình đọc màn hình

Bây giờ bạn đã quen với việc sử dụng trình đọc màn hình, chúng tôi muốn bạn sử dụng nó để thực hiện một số bài kiểm tra khả năng tiếp cận nhanh, để có ý tưởng về cách trình đọc màn hình xử lý các tính năng trang web tốt và xấu:

- Xem [good-semantics.html](https://mdn.github.io/learning-area/accessibility/html/good-semantics.html), và lưu ý cách các tiêu đề được tìm thấy bởi trình đọc màn hình và có sẵn để điều hướng. Bây giờ xem [bad-semantics.html](https://mdn.github.io/learning-area/accessibility/html/bad-semantics.html), và lưu ý cách trình đọc màn hình không nhận được thông tin này. Hãy tưởng tượng sẽ khó chịu như thế nào khi cố gắng điều hướng một trang văn bản thực sự dài.
- Xem [good-links.html](https://mdn.github.io/learning-area/accessibility/html/good-links.html), và lưu ý cách chúng có ý nghĩa khi xem ra ngoài ngữ cảnh, ví dụ trong Rotor VoiceOver. Điều này không phải là trường hợp với [bad-links.html](https://mdn.github.io/learning-area/accessibility/html/bad-links.html) — chúng đều chỉ là "nhấp vào đây".
- Xem [good-form.html](https://mdn.github.io/learning-area/accessibility/html/good-form.html), và lưu ý cách các đầu vào biểu mẫu được mô tả bằng nhãn của chúng vì chúng tôi đã thêm các phần tử {{htmlelement("label")}} phù hợp. Trong [bad-form.html](https://mdn.github.io/learning-area/accessibility/html/bad-form.html), chúng nhận được nhãn không hữu ích kiểu như "blank".
- Xem ví dụ [punk-bands-complete.html](https://mdn.github.io/learning-area/css/styling-boxes/styling-tables/punk-bands-complete.html) của chúng tôi, và xem cách trình đọc màn hình có thể liên kết các cột và hàng nội dung và đọc chúng tất cả cùng nhau vì chúng tôi đã định nghĩa đúng tiêu đề bảng. Trong [bad-table.html](https://mdn.github.io/learning-area/accessibility/html/bad-table.html), không có ô nào có thể được liên kết. Lưu ý rằng NVDA có vẻ hoạt động hơi lạ khi bạn chỉ có một bảng trên trang; bạn có thể thử [trang kiểm tra bảng của WebAIM](https://webaim.org/articles/nvda/tables.htm) thay thế.

## Các công cụ hỗ trợ khác

Trình đọc màn hình là một trong những loại công nghệ hỗ trợ phổ biến nhất mà bạn sẽ gặp với tư cách là nhà phát triển web, nhưng các loại AT khác cũng tồn tại, và thật hữu ích khi quen với những gì người dùng có thể đang sử dụng để truy cập nội dung của bạn. Phần này tóm tắt một số trong số chúng.

### Bàn phím chữ to hoặc chữ nổi Braille

Có thể mua bàn phím chữ to được thiết kế để sử dụng bởi người khiếm thị hoặc người cao tuổi, và bàn phím Braille được thiết kế để sử dụng bởi người mù và người khiếm thị nặng.

### Thiết bị trỏ thay thế

Khi bạn nghĩ đến các thiết bị trỏ, chuột là ví dụ rõ ràng nhất, nhưng có các thiết bị trỏ khác được thiết kế để cho phép người dùng với các suy giảm vận động khác nhau điều hướng giao diện người dùng dễ dàng hơn:

- Trackball: Giống như chuột lộn ngược, trackball bao gồm một quả bóng được gắn cố định trên bàn của bạn, bạn có thể lăn để di chuyển con trỏ. Chúng được coi là chính xác hơn và dễ xử lý hơn chuột, đặc biệt đối với những người có chuyển động tay hạn chế.
- Joystick: Một cần điều khiển có thể di chuyển để di chuyển con trỏ. Joystick kém chính xác hơn trackball nhưng có thể sử dụng được bởi những người với nhiều loại suy giảm thể chất, ngay cả khuyết tật nặng.
- Bàn di chuột: Hầu hết các laptop hiện đại đều có bàn di chuột (đôi khi được gọi là trackpad) — một cảm biến xúc giác phẳng cho phép bạn di chuyển con trỏ bằng ngón tay, cũng như thực hiện các cử chỉ nhiều ngón theo cách tương tự như cử chỉ di động. Bạn có thể mua bàn di chuột bên ngoài cho các thiết bị không có bàn di chuột bên trong. Một số người thấy chúng chính xác hơn chuột.

### Kính lúp màn hình

Kính lúp màn hình cung cấp cho người dùng thị lực một phần chế độ xem phóng to của màn hình thiết bị để họ có thể hiểu và tương tác với nội dung thiết bị dễ dàng hơn, cũng như cung cấp các tính năng khác như điều chỉnh màu sắc để giúp ích với mù màu, và điều chỉnh kích thước con trỏ chuột và con trỏ văn bản để dễ nhìn hơn.

Phần mềm và phần cứng kính lúp màn hình đều có sẵn:

- Hầu hết các hệ điều hành hiện đại đều có ứng dụng tích hợp sẵn để phóng to toàn bộ hoặc một phần màn hình, ví dụ Zoom trên mac hoặc Magnifier trên Windows. Chúng cũng có xu hướng cung cấp các tùy chọn để tăng kích thước văn bản, kích thước con trỏ chuột, v.v. theo toàn cầu. Các tùy chọn bên thứ ba cũng có sẵn.
- Kính lúp màn hình phần cứng thường bao gồm một màn hình riêng biệt nằm cạnh hoặc phía trước màn hình của thiết bị và chiếu một phiên bản lớn hơn, hoặc một phiên bản được phóng to của một phần của màn hình.

### Phần mềm nhận dạng giọng nói

Phần mềm nhận dạng giọng nói (hoặc giọng nói) cho phép bạn nói lệnh để kiểm soát thiết bị của mình và/hoặc nói văn bản của email hoặc tài liệu và để máy tính ghi lại văn bản cho bạn. Điều này rất hữu ích cho những người không thể sử dụng bàn phím hoặc cơ chế kiểm soát khác.

Các hệ điều hành hiện đại có các tính năng tích hợp sẵn để kích hoạt điều này (ví dụ Dictation trên mac, hoặc Voice Access trên Windows), và cũng có các ứng dụng bên thứ ba có sẵn, từ ứng dụng máy tính để bàn đến tiện ích mở rộng trình duyệt.

### Điều khiển công tắc

Điều khiển công tắc cung cấp một cơ chế tương tác với các thiết bị cho người dùng có khả năng di động rất hạn chế hoặc [suy giảm nhận thức](/en-US/docs/Web/Accessibility/Guides/Cognitive_accessibility).

Thiết lập điều khiển công tắc thường bao gồm hai phần:

- Công tắc hoặc nút vật lý để kích hoạt các tùy chọn trên thiết bị. Bạn cũng có thể gán chức năng công tắc cho các nút thiết bị thông thường (chẳng hạn như điều khiển âm lượng) hoặc các phím trên bàn phím.
- Một chế độ thiết bị hoặc phần mềm bổ sung bên thứ ba làm cho thiết bị tương thích với điều khiển công tắc hoặc nút. Ví dụ, Switch Access trên Android là chế độ mà theo đó các tùy chọn khác nhau trong các tình huống khác nhau (ví dụ: ứng dụng trên màn hình chính) được duyệt qua và sau đó ứng dụng bạn muốn có thể được chọn bằng nút hoặc công tắc khi đến.

## Lập kế hoạch cho khả năng tiếp cận

Bạn nên suy nghĩ cẩn thận về khả năng tiếp cận gần đầu mỗi dự án. Hãy đảm bảo khả năng tiếp cận được xem xét trong giai đoạn thiết kế ban đầu, để bạn có thể:

- Làm đúng những điều cơ bản, ví dụ sử dụng [cấu trúc tài liệu tốt](/en-US/docs/Learn_web_development/Core/Accessibility/HTML#use_well-structured_text_content) và cung cấp [văn bản thay thế](/en-US/docs/Learn_web_development/Core/Accessibility/HTML#text_alternatives) cho hình ảnh.
- Cân nhắc cẩn thận cách tiếp cận tốt nhất cho các tính năng có khả năng có vấn đề về khả năng tiếp cận. Ví dụ, âm thanh và video chắc chắn sẽ không thể truy cập được đối với một số người, vì vậy bạn nên cung cấp các phương án thay thế như [bản ghi](/en-US/docs/Learn_web_development/Core/Accessibility/Multimedia#audio_transcripts) và [bản văn bản](/en-US/docs/Learn_web_development/Core/Accessibility/Multimedia#video_text_tracks).
- Tránh các lỗi tốn kém sau này. Các vấn đề được phát hiện gần cuối dự án thường tốn nhiều thời gian và chi phí hơn nhiều để sửa so với các vấn đề được phát hiện sớm.

## Kiểm tra người dùng

Bạn không thể chỉ dựa vào các công cụ tự động để xác định các vấn đề khả năng tiếp cận trên trang web của mình. Mỗi dự án trang web cần có [chiến lược kiểm tra người dùng](/en-US/docs/Learn_web_development/Extensions/Testing/Testing_strategies#user_testing), và rất nên bao gồm một số nhóm người dùng khả năng tiếp cận:

- Hãy cố gắng để một số người dùng trình đọc màn hình tham gia, một số người dùng chỉ dùng bàn phím, một số người dùng không nghe, người dùng có suy giảm vận động, v.v.
- Yêu cầu mỗi nhóm thử sử dụng trang web nói chung, bắt đầu bằng cách xem trang chủ và các trang chính khác, và thử một số chức năng chính. Các ví dụ điển hình bao gồm mua sản phẩm hoặc thực hiện đặt phòng. Hỏi họ ấn tượng của họ là gì và những vấn đề họ gặp phải.
- Tiếp theo, yêu cầu họ tập trung vào các tính năng hoặc quy trình làm việc mà bạn có mối lo ngại cụ thể về khả năng tiếp cận, chẳng hạn như các điều khiển biểu mẫu phức tạp hoặc trình phát video. Hỏi những gì còn thiếu đối với họ về mặt trải nghiệm người dùng, và những gì họ muốn thấy thay đổi.

Một số dự án sẽ có ngân sách để trả cho các nhóm kiểm tra, trong khi những dự án khác sẽ dựa vào tình nguyện viên không được trả hoặc thậm chí đồng nghiệp và bạn bè.

## Danh sách kiểm tra kiểm tra khả năng tiếp cận

Danh sách sau cung cấp danh sách kiểm tra để bạn theo dõi để đảm bảo bạn đã thực hiện kiểm tra khả năng tiếp cận được khuyến nghị cho dự án của mình:

1. Đảm bảo HTML của bạn ngữ nghĩa đúng nhất có thể. [Xác minh nó](/en-US/docs/Learn_web_development/Core/Structuring_content/Debugging_HTML#html_validation) là một bước khởi đầu tốt, cũng như sử dụng [công cụ kiểm toán](#auditing_tools).
2. Kiểm tra xem nội dung của bạn có ý nghĩa khi CSS bị tắt không.
3. Đảm bảo chức năng của bạn có thể truy cập bằng bàn phím (xem [Sử dụng điều khiển UI ngữ nghĩa khi có thể](/en-US/docs/Learn_web_development/Core/Accessibility/HTML#use_semantic_ui_controls_where_possible) để biết thêm chi tiết). Kiểm tra bằng Tab, Return/Enter, v.v.
4. Đảm bảo nội dung không phải văn bản của bạn có [văn bản thay thế](/en-US/docs/Learn_web_development/Core/Accessibility/HTML#text_alternatives). [Công cụ kiểm toán](#auditing_tools) tốt để phát hiện các vấn đề như vậy.
5. Đảm bảo [độ tương phản màu sắc](/en-US/docs/Learn_web_development/Core/Accessibility/CSS_and_JavaScript#color_and_color_contrast) của trang web của bạn chấp nhận được, sử dụng công cụ kiểm tra phù hợp.
6. Đảm bảo [nội dung ẩn](/en-US/docs/Learn_web_development/Core/Accessibility/CSS_and_JavaScript#hiding_things) có thể nhìn thấy bởi trình đọc màn hình.
7. Đảm bảo rằng chức năng có thể sử dụng được mà không cần JavaScript bất cứ khi nào có thể.
8. Sử dụng ARIA để cải thiện khả năng tiếp cận khi thích hợp.
9. Chạy trang web của bạn qua [công cụ kiểm toán](#auditing_tools).
10. Kiểm tra nó với trình đọc màn hình.
11. Bao gồm chính sách/tuyên bố khả năng tiếp cận ở nơi có thể tìm thấy trên trang web của bạn để nói những gì bạn đã làm.

## Tóm tắt

Hy vọng bài viết này đã cho bạn ý tưởng về các loại công cụ bạn có thể sử dụng để giúp sửa chữa các vấn đề khả năng tiếp cận, công nghệ hỗ trợ mà người khuyết tật sử dụng để truy cập web.

Trong bài viết tiếp theo, chúng ta sẽ xem xét cách viết HTML dễ tiếp cận.

{{PreviousMenuNext("Learn_web_development/Core/Accessibility/What_is_accessibility","Learn_web_development/Core/Accessibility/HTML", "Learn_web_development/Core/Accessibility")}}
