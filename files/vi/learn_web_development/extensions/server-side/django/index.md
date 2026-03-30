---
title: Django Web Framework (Python)
slug: Learn_web_development/Extensions/Server-side/Django
page-type: learn-module
sidebar: learnsidebar
---

{{NextMenu("Learn_web_development/Extensions/Server-side/Django/Introduction", "Learn_web_development/Extensions/Server-side")}}

Django là một web framework phía máy chủ cực kỳ phổ biến và đầy đủ tính năng, được viết bằng Python. Module này giải thích tại sao Django là một trong những framework máy chủ web phổ biến nhất, cách thiết lập môi trường phát triển, và cách bắt đầu sử dụng nó để tạo các ứng dụng web của riêng bạn.

## Điều kiện tiên quyết

Trước khi bắt đầu module này, bạn không cần có bất kỳ kiến thức nào về Django. Lý tưởng nhất, bạn cần hiểu lập trình web phía máy chủ và web framework là gì bằng cách đọc các chủ đề trong module [Các bước đầu tiên về lập trình website phía máy chủ](/en-US/docs/Learn_web_development/Extensions/Server-side/First_steps) của chúng tôi.

Kiến thức chung về các khái niệm lập trình và [Python](/en-US/docs/Glossary/Python) được khuyến nghị, nhưng không cần thiết để hiểu các khái niệm cốt lõi.

> [!NOTE]
> Python là một trong những ngôn ngữ lập trình dễ đọc và dễ hiểu nhất dành cho người mới bắt đầu. Tuy nhiên, nếu bạn muốn hiểu module này tốt hơn, có rất nhiều sách và hướng dẫn miễn phí trên internet để giúp bạn (lập trình viên mới có thể muốn xem trang [Python for Non Programmers](https://wiki.python.org/moin/BeginnersGuide/NonProgrammers) trên wiki python.org).

## Hướng dẫn

- [Giới thiệu về Django](/en-US/docs/Learn_web_development/Extensions/Server-side/Django/Introduction)
  - : Trong bài Django đầu tiên này, chúng tôi trả lời câu hỏi "Django là gì?" và cung cấp cho bạn cái nhìn tổng quan về những gì làm cho web framework này đặc biệt. Chúng tôi sẽ phác thảo các tính năng chính, bao gồm một số chức năng nâng cao mà chúng tôi sẽ không có thời gian để đề cập chi tiết trong module này. Chúng tôi cũng sẽ chỉ cho bạn thấy một số thành phần xây dựng chính của ứng dụng Django, để cho bạn thấy những gì nó có thể làm trước khi bạn thiết lập và bắt đầu thực hành.
- [Thiết lập môi trường phát triển Django](/en-US/docs/Learn_web_development/Extensions/Server-side/Django/development_environment)
  - : Bây giờ khi bạn đã biết Django dùng để làm gì, chúng tôi sẽ chỉ cho bạn cách thiết lập và kiểm tra môi trường phát triển Django trên Windows, Linux (Ubuntu) và macOS — dù bạn đang sử dụng hệ điều hành nào phổ biến, bài viết này sẽ cung cấp cho bạn những gì bạn cần để bắt đầu phát triển ứng dụng Django.
- [Hướng dẫn Django: Website Thư viện Cục bộ](/en-US/docs/Learn_web_development/Extensions/Server-side/Django/Tutorial_local_library_website)
  - : Bài đầu tiên trong chuỗi hướng dẫn thực hành của chúng tôi giải thích những gì bạn sẽ học, và cung cấp cái nhìn tổng quan về ví dụ website "thư viện cục bộ" mà chúng tôi sẽ xây dựng và phát triển trong các bài tiếp theo.
- [Hướng dẫn Django Phần 2: Tạo website khung sườn](/en-US/docs/Learn_web_development/Extensions/Server-side/Django/skeleton_website)
  - : Bài viết này chỉ cho bạn cách tạo dự án website "khung sườn", sau đó bạn có thể tiếp tục điền vào các cài đặt, URL, mô hình, khung nhìn và mẫu cụ thể cho trang.
- [Hướng dẫn Django Phần 3: Sử dụng mô hình](/en-US/docs/Learn_web_development/Extensions/Server-side/Django/Models)
  - : Bài viết này chỉ cách định nghĩa các mô hình cho website _LocalLibrary_ — mô hình đại diện cho cấu trúc dữ liệu mà chúng tôi muốn lưu trữ dữ liệu ứng dụng, và cũng cho phép Django lưu trữ dữ liệu trong cơ sở dữ liệu cho chúng tôi (và chỉnh sửa sau này). Nó giải thích mô hình là gì, cách khai báo và một số loại trường chính. Nó cũng giới thiệu ngắn gọn một vài cách chính bạn có thể truy cập dữ liệu mô hình.
- [Hướng dẫn Django Phần 4: Trang quản trị Django](/en-US/docs/Learn_web_development/Extensions/Server-side/Django/Admin_site)
  - : Bây giờ chúng tôi đã tạo các mô hình cho website _LocalLibrary_, chúng tôi sẽ sử dụng trang quản trị Django để thêm một số dữ liệu sách "thực". Đầu tiên, chúng tôi sẽ chỉ cho bạn cách đăng ký các mô hình với trang quản trị, sau đó chúng tôi sẽ chỉ cho bạn cách đăng nhập và tạo một số dữ liệu. Cuối cùng, chúng tôi chỉ ra một số cách bạn có thể cải thiện hơn nữa việc trình bày trang quản trị.
- [Hướng dẫn Django Phần 5: Tạo trang chủ của chúng ta](/en-US/docs/Learn_web_development/Extensions/Server-side/Django/Home_page)
  - : Chúng tôi đã sẵn sàng thêm mã để hiển thị trang đầy đủ đầu tiên — trang chủ cho _LocalLibrary_ hiển thị số lượng bản ghi chúng tôi có cho mỗi loại mô hình, và cung cấp các liên kết điều hướng thanh bên đến các trang khác của chúng tôi. Theo đó, chúng tôi sẽ có kinh nghiệm thực tế trong việc viết các bản đồ URL cơ bản và khung nhìn, lấy bản ghi từ cơ sở dữ liệu và sử dụng mẫu.
- [Hướng dẫn Django Phần 6: Các khung nhìn danh sách và chi tiết chung](/en-US/docs/Learn_web_development/Extensions/Server-side/Django/Generic_views)
  - : Hướng dẫn này mở rộng website _LocalLibrary_ của chúng tôi, thêm các trang danh sách và chi tiết cho sách và tác giả. Ở đây chúng tôi sẽ học về các khung nhìn dựa trên lớp chung, và chỉ cách chúng có thể giảm lượng code bạn phải viết cho các trường hợp sử dụng phổ biến. Chúng tôi cũng sẽ đi sâu hơn vào xử lý URL, chỉ ra cách thực hiện khớp mẫu cơ bản.
- [Hướng dẫn Django Phần 7: Framework phiên làm việc](/en-US/docs/Learn_web_development/Extensions/Server-side/Django/Sessions)
  - : Hướng dẫn này mở rộng website _LocalLibrary_ của chúng tôi, thêm bộ đếm lượt truy cập dựa trên phiên làm việc vào trang chủ. Đây là ví dụ tương đối đơn giản, nhưng nó chỉ cách bạn có thể sử dụng framework phiên để cung cấp hành vi liên tục cho người dùng ẩn danh trên các trang của riêng bạn.
- [Hướng dẫn Django Phần 8: Xác thực người dùng và quyền hạn](/en-US/docs/Learn_web_development/Extensions/Server-side/Django/Authentication)
  - : Trong hướng dẫn này chúng tôi sẽ chỉ cho bạn cách cho phép người dùng đăng nhập vào trang của bạn bằng tài khoản của họ, và cách kiểm soát những gì họ có thể làm và xem dựa trên việc họ có đăng nhập hay không và _quyền hạn_ của họ. Là một phần của bản trình diễn này, chúng tôi sẽ mở rộng website _LocalLibrary_, thêm các trang đăng nhập và đăng xuất, và các trang cụ thể cho người dùng và nhân viên để xem sách đã được mượn.
- [Hướng dẫn Django Phần 9: Làm việc với biểu mẫu](/en-US/docs/Learn_web_development/Extensions/Server-side/Django/Forms)
  - : Trong hướng dẫn này chúng tôi sẽ chỉ cho bạn cách làm việc với [Biểu mẫu HTML](/en-US/docs/Learn_web_development/Extensions/Forms) trong Django, và đặc biệt là cách dễ nhất để viết biểu mẫu để tạo, cập nhật và xóa các phiên bản mô hình. Là một phần của bản trình diễn này, chúng tôi sẽ mở rộng website _LocalLibrary_ để thủ thư có thể gia hạn sách, và tạo, cập nhật và xóa tác giả bằng biểu mẫu của riêng chúng tôi (thay vì sử dụng ứng dụng quản trị).
- [Hướng dẫn Django Phần 10: Kiểm tra ứng dụng web Django](/en-US/docs/Learn_web_development/Extensions/Server-side/Django/Testing)
  - : Khi website phát triển, chúng trở nên khó kiểm tra thủ công hơn — không chỉ có nhiều thứ hơn để kiểm tra, mà còn vì khi các tương tác giữa các thành phần trở nên phức tạp hơn, một thay đổi nhỏ ở một khu vực có thể yêu cầu nhiều kiểm tra bổ sung để xác minh tác động của nó đến các khu vực khác. Một cách để giảm thiểu những vấn đề này là viết các bài kiểm tra tự động, có thể dễ dàng và đáng tin cậy chạy mỗi khi bạn thực hiện thay đổi. Hướng dẫn này chỉ cách tự động hóa _kiểm tra đơn vị_ website của bạn bằng framework kiểm tra của Django.
- [Hướng dẫn Django Phần 11: Triển khai Django lên môi trường sản xuất](/en-US/docs/Learn_web_development/Extensions/Server-side/Django/Deployment)
  - : Bây giờ bạn đã tạo (và kiểm tra) website _LocalLibrary_ tuyệt vời, bạn sẽ muốn cài đặt nó trên máy chủ web công khai để nhân viên và thành viên thư viện có thể truy cập qua internet. Bài viết này cung cấp cái nhìn tổng quan về cách bạn có thể tìm kiếm máy chủ để triển khai website của mình, và những gì bạn cần làm để chuẩn bị trang của mình cho môi trường sản xuất.
- [Bảo mật ứng dụng web Django](/en-US/docs/Learn_web_development/Extensions/Server-side/Django/web_application_security)
  - : Bảo vệ dữ liệu người dùng là một phần thiết yếu trong bất kỳ thiết kế website nào. Chúng tôi đã giải thích một số mối đe dọa bảo mật phổ biến hơn trong bài viết [Bảo mật Web](/en-US/docs/Web/Security) — bài viết này cung cấp bản trình diễn thực tế về cách bảo vệ tích hợp sẵn của Django xử lý các mối đe dọa đó.

## Bài đánh giá

Bài đánh giá sau đây sẽ kiểm tra sự hiểu biết của bạn về cách tạo website bằng Django, như được mô tả trong các hướng dẫn liệt kê ở trên.

- [DIY Django mini blog](/en-US/docs/Learn_web_development/Extensions/Server-side/Django/django_assessment_blog)
  - : Trong bài đánh giá này bạn sẽ sử dụng một số kiến thức bạn đã học từ module này để tạo blog của riêng bạn.

{{NextMenu("Learn_web_development/Extensions/Server-side/Django/Introduction", "Learn_web_development/Extensions/Server-side")}}
