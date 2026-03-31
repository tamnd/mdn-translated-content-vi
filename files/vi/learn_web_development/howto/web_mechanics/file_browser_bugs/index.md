---
title: When and how to file bugs with browsers
slug: Learn_web_development/Howto/Web_mechanics/File_browser_bugs
page-type: learn-faq
sidebar: learn-how-to
---

Trình duyệt là phần mềm, và như bất kỳ phần mềm nào, chúng có thể có lỗi. Đôi khi, bạn có thể thấy rằng website bạn đang phát triển không hoạt động như mong đợi, hoặc không đúng với tài liệu hướng dẫn như MDN hay các đặc tả kỹ thuật. Điều này có thể chỉ ra lỗi trong mã của bạn, lỗi trong tài liệu (mong là không!), hoặc lỗi trong trình duyệt bạn đang dùng để kiểm thử website. Trong bài viết này, chúng ta sẽ thảo luận cách xác định nguyên nhân và cách báo cáo lỗi nếu hóa ra đó là vấn đề của trình duyệt.

## Lỗi của ai?

Trước khi báo cáo lỗi trình duyệt, bạn cần xác nhận đó thực sự là lỗi trong trình duyệt. Vấn đề có thể xuất phát từ một trong bốn nơi: mã của bạn, tài liệu, trình duyệt, hoặc đặc tả kỹ thuật. Điều quan trọng là loại trừ các khả năng khác trước khi báo cáo lỗi cho trình duyệt. Nhìn chung, đặc tả kỹ thuật là nguồn đáng tin cậy nhất; cả trình duyệt lẫn tài liệu đều theo đặc tả kỹ thuật, nhưng vẫn có thể có sai sót. Còn mã của bạn... luôn tốt khi kiểm tra lại lỗi chính tả và logic trước khi cho rằng đó là lỗi trình duyệt.

### Tạo một trường hợp kiểm thử

Bước đầu tiên để xác định nguồn gốc vấn đề là tạo một trường hợp kiểm thử tối giản có thể tái hiện lỗi. Nó phải nhỏ và độc lập, lý tưởng nhất là một file HTML duy nhất với CSS và JavaScript nhúng vào, không có phụ thuộc bên ngoài hay mã không liên quan. Điều này hữu ích vì hai lý do:

- Nó giảm thiểu khả năng vấn đề do mã của bạn hoặc phụ thuộc bên ngoài gây ra.
- Bạn cần cung cấp một cái dù sao đi nữa nếu muốn thảo luận với ai đó — ví dụ khi báo cáo lỗi.

Ví dụ, sau đây là một trường hợp kiểm thử tốt cho lỗi liên quan đến lớp giả {{cssxref(":autofill")}}. Lưu ý cách chúng ta đã rút gọn xuống mức tối thiểu, tức là bỏ qua các thực hành tốt như thêm doctype, thẻ `<head>` và `<body>`, hay nhãn cho các trường nhập liệu. Điều đó ổn vì mã liên quan vẫn còn đó.

```html
<style>
  :autofill {
    border: 3px solid darkorange;
  }
</style>
<input id="name" name="name" type="text" autocomplete="name" />
<input id="email" name="email" type="email" autocomplete="email" />
```

### Kiểm thử mã của bạn

Bạn có thể lưu mã HTML của mình cục bộ và [phục vụ nó qua máy chủ kiểm thử](/en-US/docs/Learn_web_development/Howto/Tools_and_setup/set_up_a_local_testing_server), hoặc sử dụng dịch vụ trực tuyến như [JSFiddle](https://jsfiddle.net/) hoặc [CodePen](https://codepen.io/) để tạo bản demo trực tiếp.

Cách đơn giản nhất để kiểm tra xem vấn đề có phải là lỗi trình duyệt không là mở trường hợp kiểm thử của bạn trong [nhiều trình duyệt](/en-US/docs/Learn_web_development/Extensions/Testing/Introduction). Nếu bạn thấy hành vi khác nhau giữa các trình duyệt, nhiều khả năng đó là lỗi trình duyệt.

> [!NOTE]
> Có các bước khác bạn có thể thực hiện để cô lập vấn đề, như kiểm thử trong cửa sổ riêng tư, tắt tiện ích mở rộng, hoặc xóa bộ nhớ đệm. Bạn cũng nên thử những cách này trước khi báo cáo lỗi.

### Kiểm tra trạng thái triển khai

Bắt đầu bằng cách tin tưởng vào tài liệu và điều tra (các) trình duyệt có hành vi không khớp với tài liệu đó. Không phải tất cả hành vi không mong đợi đều là lỗi. Đôi khi trình duyệt có thể triển khai một tính năng hay hành vi chưa được đưa vào đặc tả kỹ thuật, do đó ít có khả năng được ghi lại trong tài liệu. Khả năng khác là một tính năng được mô tả trong đặc tả nhưng chưa được triển khai trong bất kỳ trình duyệt nào, điều này cũng có nghĩa là nó có thể chưa được ghi lại.

Lúc này, bạn nên kiểm tra thêm các nguồn để xác định câu chuyện triển khai. Dưới đây là một số nơi để tìm:

- **Bảng tương thích trình duyệt của MDN**: Trong phần "Khả năng tương thích trình duyệt" của các trang tham chiếu (ví dụ, kiểm tra [phần này](/en-US/docs/Web/CSS/Reference/Values/basic-shape/shape#browser_compatibility) trên trang hàm CSS `shape()`), bạn sẽ tìm thấy thông tin về trình duyệt nào hỗ trợ tính năng và ở mức độ nào. Điều này có thể cho thấy tính năng chưa được triển khai trong trình duyệt mục tiêu của bạn, hoặc chỉ được triển khai một phần (tức là có lỗi hoặc hạn chế đã biết).
- **Kho đặc tả kỹ thuật**: Các tổ chức tiêu chuẩn như [WHATWG](https://github.com/whatwg) (cho DOM, HTML, fetch và nhiều hơn nữa), [CSSWG](https://github.com/w3c/csswg-drafts) (cho CSS), và [TC39](https://github.com/tc39) (cho JavaScript) đều làm việc công khai trên GitHub. Bạn có thể kiểm tra xem đặc tả kỹ thuật có vừa được thay đổi gần đây không, hay có vấn đề mở nào về tính năng bạn đang kiểm tra không.
- **Diễn đàn cộng đồng**: [Cộng đồng MDN](/en-US/docs/MDN/Community/Communication_channels) là nơi tuyệt vời để bắt đầu, cũng như các diễn đàn phát triển web khác. Đây là những nơi tốt để hỏi về việc trình duyệt chưa triển khai điều gì đó, hay có lỗi đã biết không.
- **Trình theo dõi vấn đề của trình duyệt bạn đang kiểm thử**: Nếu bạn tìm thấy vấn đề liên quan đến lỗi của bạn đã được báo cáo, điều đó xác nhận lỗi là có thực và bạn không cần làm thêm gì nữa. Thực ra, chúng ta sẽ đề cập đến trình theo dõi vấn đề tiếp theo.

Tất nhiên, dù tất cả trình duyệt hành xử giống nhau, vẫn có thể có lỗi trong tất cả chúng, hoặc có thể chỉ một trình duyệt đang triển khai hành vi đúng. Tài liệu có thể đã lỗi thời hoặc không chính xác. Để chắc chắn, bạn nên coi đặc tả kỹ thuật là nguồn sự thật (ngoại trừ trường hợp hiếm khi trình duyệt triển khai trước đặc tả). Trên mỗi trang tham chiếu MDN, bạn có thể tìm thấy liên kết đến các đặc tả liên quan trong phần "Đặc tả kỹ thuật" (xem [ví dụ này](/en-US/docs/Web/CSS/Reference/Values/basic-shape/shape#specifications)). Đọc đặc tả để kiểm tra hành vi dự kiến. Đôi khi đặc tả có thể khó hiểu vì chúng dành cho các kỹ sư trình duyệt, nhưng hãy cố gắng hết sức.

Nếu hóa ra tất cả các trình duyệt và đặc tả đều nhất quán nhưng MDN sai, hãy cân nhắc [đóng góp](/en-US/docs/MDN/Community/Getting_started)!

## Trình theo dõi lỗi trình duyệt

Mỗi trình duyệt có trình theo dõi lỗi riêng, nơi bạn có thể tìm kiếm lỗi hiện có và báo cáo lỗi mới. Giao diện và quy trình có thể cảm thấy hơi lạ lẫm lúc đầu, nhưng thường có hướng dẫn. Bảng dưới đây liệt kê các trình theo dõi lỗi cho các trình duyệt chính:

| Trình duyệt     | Trình theo dõi lỗi                                    |
| --------------- | ----------------------------------------------------- |
| Apple Safari    | [WebKit Bugzilla](https://webkit.org/reporting-bugs/) |
| Google Chrome   | [Chromium Issues](https://issues.chromium.org/issues) |
| Mozilla Firefox | [Mozilla Bugzilla](https://bugzilla.mozilla.org/)     |
| Opera           | [Opera Bug Wizard](https://bugs.opera.com/wizard/)    |

Tìm kiếm các báo cáo lỗi hiện có trước khi báo cáo lỗi mới. Nếu bạn tìm thấy báo cáo lỗi hiện có khớp với vấn đề của bạn, bạn có thể thêm bình luận với phát hiện của mình (ví dụ, nếu bạn tìm được cách khắc phục, hoặc nếu bạn có thêm thông tin về lỗi). Tuy nhiên, đừng thêm bình luận như "Tôi cũng gặp lỗi này", vì chúng không thực sự bổ sung giá trị gì. Nếu bạn không tìm thấy lỗi hiện có, bạn có thể báo cáo lỗi mới — ai đó sẽ cho bạn biết nếu đó là bản sao.

Khi báo cáo lỗi mới, hãy đảm bảo bao gồm trường hợp kiểm thử tối giản và mọi thông tin khác mà biểu mẫu yêu cầu — như phiên bản trình duyệt, kết quả mong đợi so với kết quả thực tế, và ảnh chụp màn hình. Một số trình theo dõi lỗi có thể yêu cầu bạn chọn thành phần hoặc danh mục cho lỗi, như hiển thị hoặc mạng. Các nhà phát triển trình duyệt dùng các nhãn này để sắp xếp công việc. Nếu bạn không chắc chọn gì, hãy chọn tùy ý — ai đó sẽ phân lại nếu cần.

## Báo cáo lỗi cho phần mềm không phải trình duyệt

Nếu lỗi liên quan đến phần mềm không phải trình duyệt có thể tích hợp với trình duyệt, bạn cần báo cáo lỗi cho nhà cung cấp phần mềm liên quan. Bảng dưới đây liệt kê một số công nghệ hỗ trợ và nơi báo cáo lỗi cho chúng:

| Phần mềm                                                                    | Nơi báo cáo                                                                            |
| --------------------------------------------------------------------------- | -------------------------------------------------------------------------------------- |
| [Freedom Scientific JAWS](https://vispero.com/jaws-screen-reader-software/) | [JAWS technical support form](https://support.freedomscientific.com/Forms/TechSupport) |
| [Non Visual Desktop Access (NVDA)](https://www.nvaccess.org/)               | [File NVDA bugs](https://github.com/nvaccess/nvda)                                     |
