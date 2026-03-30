---
title: Cài đặt phần mềm cơ bản
short-title: Cài đặt phần mềm
slug: Learn_web_development/Getting_started/Environment_setup/Installing_software
page-type: tutorial-chapter
sidebar: learnsidebar
---

{{NextMenu("Learn_web_development/Getting_started/Environment_setup/Browsing_the_web", "Learn_web_development/Getting_started/Environment_setup")}}

Trong bài này, chúng ta sẽ thảo luận về những phần mềm (software) nào bạn cần để lập trình web đơn giản và những gì bạn cần cài đặt ngay bây giờ, bao gồm một trình soạn thảo mã (code editor) và một số trình duyệt web (web browser) hiện đại.

<table>
  <tbody>
    <tr>
      <th scope="row">Điều kiện tiên quyết:</th>
      <td>
        Làm quen cơ bản với hệ điều hành (OS) máy tính của bạn.
      </td>
    </tr>
    <tr>
      <th scope="row">Mục tiêu học tập:</th>
      <td>
        <ul>
          <li>Hiểu những phần mềm bạn cần để bắt đầu.</li>
          <li>Cài đặt một trình soạn thảo mã, một số trình duyệt hiện đại và máy chủ kiểm tra cục bộ (local testing server).</li>
          <li>Khám phá các tùy chọn cho các loại ứng dụng phổ biến khác.</li>
        </ul>
      </td>
    </tr>
  </tbody>
</table>

## Trình soạn thảo mã

Một trình soạn thảo mã tốt là một trong những công cụ quan trọng nhất mà bất kỳ lập trình viên nào cũng cần có trên máy tính. Ngoài việc là nơi bạn viết mã, trình soạn thảo mã còn có rất nhiều chức năng khác. Chúng tôi đã dành một bài riêng để nói về các trình soạn thảo mã ở phần sau của loạt bài này.

Hiện tại, chúng tôi khuyến nghị bạn cài đặt [Visual Studio Code](https://code.visualstudio.com/), vì nó có sẵn trên các nền tảng khác nhau, có bộ tính năng và hỗ trợ tuyệt vời, và là trình soạn thảo chúng tôi chủ yếu sử dụng. Bạn nên cài đặt ngay bây giờ để theo dõi phần còn lại của bài này.

## Trình duyệt web hiện đại

Có sẵn các trình duyệt web hiện đại là điều thiết yếu trong lập trình web để bạn có thể kiểm tra các website hoặc ứng dụng trên các trình duyệt mà người truy cập sử dụng. Bạn cũng cần cập nhật trình duyệt thường xuyên để chúng hỗ trợ các công nghệ web mới nhất và có các bản vá bảo mật mới nhất.

Các trình duyệt phổ biến nhất bạn sẽ gặp như sau:

- Trình duyệt máy tính để bàn (Desktop browsers):
  - Chromium: [Google Chrome](https://www.google.com/chrome/), [Opera](https://www.opera.com/opera), [Brave](https://brave.com/download/), [Microsoft Edge](https://www.microsoft.com/en-us/edge), [Vivaldi](https://vivaldi.com/).
  - Gecko: [Mozilla Firefox](https://www.firefox.com/en-US/).
  - WebKit: [Apple Safari](https://www.apple.com/safari/).
- Trình duyệt di động/thiết bị thay thế (Mobile/alternative device browsers):
  - Chromium (Android): [Google Chrome](https://www.google.com/chrome/go-mobile/), [Opera](https://www.opera.com/opera), [Brave](https://brave.com/download/), [Microsoft Edge](https://www.microsoft.com/en-us/edge/mobile), [Samsung Internet](https://www.samsung.com/us/support/owners/app/samsung-internet), [Vivaldi](https://vivaldi.com/android/).
  - Gecko (Android): [Mozilla Firefox](https://www.firefox.com/en-US/download/android/).
  - WebKit (iOS): [Apple Safari](https://www.apple.com/safari/).
    > [!NOTE]
    > Hầu hết các trình duyệt Android được liệt kê ở trên đều có phiên bản iOS, nhưng trước đây tất cả đều được hỗ trợ bởi engine WebKit của Apple do các quy tắc App Store của Apple. Tại thời điểm viết bài này, các trình duyệt đang bắt đầu tạo các phiên bản trình duyệt iOS dựa trên engine hiển thị riêng của chúng, do những thay đổi về quy định. Xem [Apple cuối cùng đã cho phép các phiên bản đầy đủ của Chrome và Firefox chạy trên iPhone](https://www.theverge.com/2024/1/25/24050478/apple-ios-17-4-browser-engines-eu).

Hầu hết các trình duyệt hiện đại có xu hướng cài đặt bản cập nhật tự động, áp dụng các thay đổi khi chúng được khởi động lại. Thông thường bạn có thể kiểm tra bản cập nhật trên trang "About" của trình duyệt. Trang này có sẵn ở những nơi hơi khác nhau trên các trình duyệt và OS khác nhau, ví dụ:

- Firefox: Có tại _Firefox_ > _About Firefox_ trên macOS, và biểu tượng menu > _Help_ > _About Firefox_ trên Windows.
- Chrome: Có tại _Chrome_ > _About Google Chrome_ trên macOS, và biểu tượng menu > _Help_ > _About Google Chrome_ trên Windows.

### Trình duyệt nào cần cài đặt

Hiện tại, bạn nên cài đặt một vài trình duyệt máy tính để bàn và di động/thiết bị thay thế để kiểm tra mã. Nếu có thể, hãy cài đặt ít nhất một trình duyệt từ mỗi danh mục phụ được hiển thị trước đó, để bạn không chỉ kiểm tra trong nhiều trình duyệt dựa trên cùng một engine hiển thị.

## Máy chủ web cục bộ

Thông thường, khi bạn gõ địa chỉ web trong trình duyệt để tải một website, các tệp được tổng hợp bởi trình duyệt của bạn để hiển thị website đó được lấy từ một máy chủ web từ xa được lưu trữ trên máy chủ ở đâu đó trên thế giới. Bạn sẽ tìm hiểu thêm về cách điều này hoạt động trong bài tiếp theo trong loạt bài này.

Khi tạo website cục bộ (trên máy tính của bạn), bạn thường có thể tải tệp HTML index chính trực tiếp trong trình duyệt để kiểm tra. Tuy nhiên, một số ví dụ sẽ cần được chạy thông qua máy chủ web được cài đặt cục bộ để hoạt động thành công.

### Cài đặt máy chủ web cục bộ

Một trong những tùy chọn dễ nhất chúng tôi tìm thấy để có sẵn máy chủ cục bộ là sử dụng tiện ích mở rộng của trình soạn thảo mã — theo cách này, nó có sẵn ngay trong trình soạn thảo mã. Hãy thực hiện những bước sau trong Visual Studio Code:

1. Mở ngăn _Extensions_ sử dụng tùy chọn menu _View_ > _Extensions_.
2. Trong ô "Search..." ở đầu ngăn này, gõ "live preview". Kết quả tìm kiếm hàng đầu sẽ là tiện ích mở rộng [_Live Preview_](https://marketplace.visualstudio.com/items?itemName=ms-vscode.live-server), được tạo bởi Microsoft.
3. Nhấp vào tùy chọn đó để mở trang thông tin về nó, bao gồm cách sử dụng.
4. Nhấn nút _Install_ để cài đặt tiện ích mở rộng.
5. Bây giờ, khi bạn đang làm việc trên tệp HTML trong trình soạn thảo, bạn có thể nhấp nút "Show Preview" để mở ví dụ trực tiếp trong một tab riêng biệt.

Tùy chọn trên đơn giản nhưng không linh hoạt lắm. Trong tương lai, bạn có thể muốn có tùy chọn máy chủ cục bộ linh hoạt hơn có thể dùng để tải ví dụ trong bất kỳ trình duyệt nào bạn có. Để biết các tùy chọn khác (và thêm thông tin cơ bản về lý do tại sao máy chủ cục bộ cần thiết), hãy xem [Làm thế nào để thiết lập máy chủ kiểm tra cục bộ?](/en-US/docs/Learn_web_development/Howto/Tools_and_setup/set_up_a_local_testing_server).

## Trình chỉnh sửa đồ họa

Các lập trình viên web thường phải thao tác với các tệp hình ảnh để sử dụng trên các website họ tạo. Điều này thường có nghĩa là thiết kế/tạo tài nguyên đồ họa, nhưng đồng thời đồ họa thường được cung cấp bởi một nhà thiết kế đồ họa (có thể là đồng đội hoặc bên thứ ba), trong trường hợp đó lập trình viên web có thể được yêu cầu cắt xén hoặc thay đổi kích thước các tệp nhận được.

Không có bài học nào trên MDN yêu cầu bạn tạo đồ họa riêng, mặc dù một số có thể yêu cầu bạn thao tác với các tệp mà chúng tôi cung cấp.

Chúng tôi khuyến nghị bạn không cài đặt trình chỉnh sửa đồ họa cho đến khi bạn cần nó sau trong hành trình học tập. Chắc chắn đừng chi tiền cho sản phẩm thương mại đắt tiền trừ khi bạn thực sự nghĩ nó sẽ mang lại giá trị.

Có nhiều công cụ phần mềm miễn phí và dịch vụ trực tuyến có thể đủ tốt cho hiện tại, ví dụ:

- macOS đi kèm với công cụ có tên [Preview](https://support.apple.com/en-gb/guide/preview/welcome/mac). Nó chủ yếu được dùng để xem hình ảnh và PDF, nhưng cũng có một số tính năng thực sự hữu ích để chỉnh sửa hình ảnh, bao gồm thay đổi kích thước, xoay, cắt xén, chú thích, và chuyển đổi giữa các loại tệp khác nhau.
- Ứng dụng [Photos](https://support.microsoft.com/en-gb/windows/manage-photos-and-videos-with-microsoft-photos-app-c0c6422f-d4cb-2e3d-eb65-7069071b2f9b) tích hợp sẵn trong Windows đi kèm với nhiều tính năng tương tự.
- Website [tinypng](https://tinypng.com/) cung cấp dịch vụ miễn phí cho phép bạn nén PNG, JPEG, và nhiều định dạng khác. Đây là tác vụ phổ biến mà bạn sẽ phải thực hiện khi chuẩn bị tài nguyên để sử dụng trên website.

Về các sản phẩm thương mại, [Adobe Photoshop](https://www.adobe.com/products/photoshop.html) từ lâu đã là tiêu chuẩn trong ngành đặc biệt cho chỉnh sửa ảnh, trong khi các chương trình như [Sketch](https://www.sketch.com/) phù hợp hơn cho công việc icon và UI. Cũng có những phần mềm mới nổi tiếng như [Figma](https://www.figma.com/), [The Affinity Suite](https://www.affinity.studio/), và [Canva](https://www.canva.com/).

Hầu hết các ứng dụng trên đều có dùng thử hoặc chế độ miễn phí đáng khám phá. Cũng có một số ứng dụng miễn phí được đánh giá cao như [GIMP](https://www.gimp.org/), [Adobe Express](https://www.adobe.com/express/), và [Paint.NET](https://www.getpaint.net/).

## Công cụ kiểm soát phiên bản

Công cụ **kiểm soát phiên bản (version control)** được các lập trình viên sử dụng để quản lý tệp trên máy chủ, cộng tác trong một dự án với một nhóm, chia sẻ mã và tài nguyên, và tránh xung đột chỉnh sửa. Hiện tại, [Git](https://git-scm.com/) là hệ thống kiểm soát phiên bản phổ biến nhất cùng với các dịch vụ lưu trữ như [GitHub](https://github.com/) hoặc [GitLab](https://about.gitlab.com/).

Mặc dù công cụ kiểm soát phiên bản là thiết yếu cho các nhóm lập trình web, bạn không cần lo lắng về chúng ngay bây giờ. Chúng tôi có một mô-đun riêng về [Kiểm soát phiên bản](/en-US/docs/Learn_web_development/Core/Version_control) ở cuối loạt mô-đun Core của chúng tôi.

## Ứng dụng triển khai website

Sau khi bạn đã hoàn thành phát triển một website hoặc ứng dụng (trên máy tính cục bộ, hoặc có thể trên máy chủ phát triển), bạn sẽ muốn đưa nó lên máy chủ web từ xa để người dùng có thể gõ địa chỉ web liên quan và xem nó trên web!

Có nhiều cách bạn có thể thực hiện điều này, từ mua hosting và sử dụng [ứng dụng SFTP](/en-US/docs/Learn_web_development/Howto/Tools_and_setup/Upload_files_to_a_web_server#sftp), sử dụng dịch vụ như [GitHub Pages](https://pages.github.com/) hoặc [Netlify](https://www.netlify.com/), hoặc thậm chí tạo nhanh bản demo để chia sẻ với người khác sử dụng thứ gì đó như [CodePen](https://codepen.io/) hoặc [JSFiddle](https://jsfiddle.net/).

Danh sách các tùy chọn như vậy có thể có vẻ choáng ngợp, nhưng đừng lo — bạn không cần biết bất cứ điều gì về việc xuất bản website ngay bây giờ. Chúng ta sẽ xem xét chủ đề này nhiều lần sau trong khóa học. Bạn sẽ có trải nghiệm thực tế về nó rất sớm, trong mô-đun [Trang web đầu tiên của bạn](/en-US/docs/Learn_web_development/Getting_started/Your_first_website).

{{NextMenu("Learn_web_development/Getting_started/Environment_setup/Browsing_the_web", "Learn_web_development/Getting_started/Environment_setup")}}
