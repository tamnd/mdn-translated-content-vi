---
title: PWA là gì?
slug: Web/Progressive_web_apps/Guides/What_is_a_progressive_web_app
page-type: guide
sidebar: pwasidebar
---

Ứng dụng web tiến bộ (PWA) là ứng dụng được xây dựng bằng công nghệ nền tảng web, nhưng mang lại trải nghiệm người dùng giống như một ứng dụng dành riêng cho nền tảng.

## Ứng dụng dành riêng cho nền tảng

_Ứng dụng dành riêng cho nền tảng_ được phát triển cho một hệ điều hành (OS) cụ thể và/hoặc một lớp thiết bị, như thiết bị iOS hoặc Android, thường bằng SDK do nhà cung cấp nền tảng cung cấp. Chúng thường được phân phối qua app store của nhà cung cấp, nơi người dùng có thể tìm và cài chúng, và sau đó chúng xuất hiện với người dùng như một tính năng bổ sung vĩnh viễn của thiết bị, mở rộng khả năng của thiết bị theo một cách nào đó.

Lợi ích của ứng dụng dành riêng cho nền tảng bao gồm:

- **Dễ truy cập với người dùng**: Chúng có biểu tượng riêng trên thiết bị, giúp người dùng dễ tìm và mở.
- **Hoạt động ngoại tuyến và chạy nền**: Chúng có thể hoạt động khi người dùng không tương tác với chúng và khi thiết bị ngoại tuyến. Điều này, chẳng hạn, cho phép ứng dụng chat nhận tin nhắn khi không mở, và hiển thị thông báo cho người dùng. Nó cũng cho phép ứng dụng tin tức cập nhật trong nền để có thể hiển thị nội dung mới ngay cả khi thiết bị ngoại tuyến.
- **UI chuyên dụng**: Chúng có thể triển khai giao diện riêng, đặc trưng và đắm chìm.
- **Tích hợp OS**: Chúng có thể được tích hợp vào OS chủ: ví dụ, một ứng dụng nhắn tin có thể đăng ký như đích chia sẻ, cho phép người dùng chọn ảnh trong ứng dụng ảnh và gửi nó bằng ứng dụng nhắn tin. Chúng cũng có thể truy cập các tính năng thiết bị như camera, GPS hoặc gia tốc kế.
- **Tích hợp App Store**: Chúng được phân phối qua app store, cho người dùng một nơi duy nhất để tìm và một cách nhất quán để quyết định có muốn cài chúng hay không.

## Website truyền thống

Theo cách truyền thống, website ít giống "thứ mà người dùng sở hữu" hơn và giống "nơi mà người dùng ghé thăm" hơn. Thông thường, một website: không có mặt trên thiết bị của người dùng khi người dùng không truy cập nó, chỉ có thể được truy cập bằng cách mở trình duyệt và điều hướng tới site, và phụ thuộc rất nhiều vào kết nối mạng.

Tuy nhiên, website có một số lợi thế so với ứng dụng dành riêng cho nền tảng, bao gồm:

- **Một codebase duy nhất**: Vì web vốn có tính đa nền tảng, một website có thể chạy trên nhiều hệ điều hành và lớp thiết bị khác nhau từ một codebase duy nhất.
- **Phân phối qua web**: Web là một nền tảng phân phối tuyệt vời. Website được công cụ tìm kiếm lập chỉ mục, và có thể được chia sẻ, truy cập chỉ bằng URL. Một website có thể được phân phối mà không cần đăng ký qua app store của bất kỳ nhà cung cấp nào.

## Ứng dụng web tiến bộ

PWA kết hợp những tính năng tốt nhất của website truyền thống và ứng dụng dành riêng cho nền tảng.

PWA có các lợi ích của website, bao gồm:

- PWA được phát triển bằng công nghệ web chuẩn, vì vậy chúng có thể chạy trên nhiều hệ điều hành và lớp thiết bị từ một codebase duy nhất.
- PWA có thể được truy cập trực tiếp từ web.

PWA cũng có nhiều lợi ích của ứng dụng dành riêng cho nền tảng, bao gồm:

- [**PWA có thể được cài đặt lên thiết bị**](/en-US/docs/Web/Progressive_web_apps/Guides/Making_PWAs_installable). Điều này có nghĩa là:
  - PWA có thể được cài từ app store của nền tảng hoặc cài trực tiếp từ web.
  - PWA có thể được cài giống như ứng dụng dành riêng cho nền tảng, và có thể tùy biến quá trình cài đặt.
  - Sau khi cài đặt, PWA có biểu tượng ứng dụng trên thiết bị, cùng với các ứng dụng dành riêng cho nền tảng.
  - Sau khi cài đặt, PWA có thể được khởi chạy như một ứng dụng độc lập, thay vì một website trong trình duyệt.

- [**PWA có thể hoạt động trong nền và ngoại tuyến**](/en-US/docs/Web/Progressive_web_apps/Guides/Offline_and_background_operation): một website điển hình chỉ hoạt động khi trang được tải trong trình duyệt. Một PWA có thể:
  - Hoạt động khi thiết bị không có kết nối mạng.
  - Cập nhật nội dung trong nền.
  - Phản hồi [push messages](/en-US/docs/Web/API/Push_API) từ máy chủ.
  - Hiển thị thông báo bằng hệ thống [notifications](/en-US/docs/Web/API/Notifications_API) của OS.

- PWA có thể [dùng toàn bộ màn hình](/en-US/docs/Web/Progressive_web_apps/How_to/Create_a_standalone_app), thay vì chạy trong giao diện trình duyệt.
- PWA có thể được tích hợp vào thiết bị, đăng ký như đích chia sẻ và nguồn chia sẻ, và truy cập các tính năng thiết bị.
- PWA có thể được phân phối trong app store, cũng như công khai qua web.

### PWA và trình duyệt

Khi bạn truy cập một website trong trình duyệt, hiển nhiên là website đó đang "chạy trong trình duyệt". Giao diện trình duyệt cung cấp một khung nhìn thấy được quanh website, bao gồm các tính năng UI như nút quay lại/tiến và tiêu đề của trang. Các Web API mà website của bạn gọi được triển khai bởi engine của trình duyệt.

PWA thường trông giống ứng dụng dành riêng cho nền tảng - chúng thường được hiển thị mà không có giao diện trình duyệt bao quanh - nhưng về mặt công nghệ, chúng vẫn là website. Điều này có nghĩa là chúng vẫn cần một browser engine, như các engine trong Chrome hoặc Firefox, để quản lý và chạy chúng. Với ứng dụng dành riêng cho nền tảng, OS của nền tảng quản lý ứng dụng, cung cấp môi trường mà nó chạy trong đó. Với PWA, một browser engine đóng vai trò nền này, giống như nó làm với website bình thường.

![Sơ đồ so sánh môi trường chạy của website truyền thống, PWA, và ứng dụng dành riêng cho nền tảng](pwa-environment.svg)

Trong tài liệu PWA của chúng tôi, đôi khi chúng ta nhắc tới trình duyệt đóng vai trò nền này. Ví dụ, chúng ta có thể nói, "Trình duyệt khởi động service worker của PWA khi nhận được một push notification." Ở đây, hoạt động của trình duyệt hoàn toàn diễn ra trong nền. Từ góc nhìn của PWA, nó cũng có thể coi như chính hệ điều hành đã khởi động nó. Với một số hệ thống, như Chromebook, thậm chí có thể không có sự phân biệt giữa "trình duyệt" và "hệ điều hành".

### Các tính năng kỹ thuật của PWA

Vì PWA là website, chúng có các tính năng cơ bản giống mọi website khác: ít nhất một trang HTML, thường sẽ tải một số CSS và JavaScript. Giống như website bình thường, JavaScript được trang tải lên có một đối tượng toàn cục {{domxref("Window")}} và có thể truy cập tất cả Web API có sẵn thông qua đối tượng đó.

Ngoài ra, PWA còn có một số tính năng bổ sung:

- Một tệp [web app manifest](/en-US/docs/Web/Progressive_web_apps/Manifest), tối thiểu cung cấp thông tin mà trình duyệt cần để cài PWA, chẳng hạn tên và biểu tượng ứng dụng.
- Tùy chọn, một [service worker](/en-US/docs/Web/API/Service_Worker_API) để cung cấp trải nghiệm ngoại tuyến.

#### Web app manifest

PWA phải có web app manifest, và [manifest phải bao gồm đủ thông tin để trình duyệt cài PWA](/en-US/docs/Web/Progressive_web_apps/Guides/Making_PWAs_installable#the_web_app_manifest).

Manifest có thể định nghĩa nhiều khía cạnh khác của giao diện PWA, như [theme color](/en-US/docs/Web/Progressive_web_apps/Manifest/Reference/theme_color) và [background color](/en-US/docs/Web/Progressive_web_apps/Manifest/Reference/background_color), cũng như hành vi của nó, bao gồm khả năng [đóng vai trò đích chia sẻ](/en-US/docs/Web/Progressive_web_apps/Manifest/Reference/share_target) cho dữ liệu từ ứng dụng khác hoặc [xử lý các kiểu tệp cụ thể](/en-US/docs/Web/Progressive_web_apps/Manifest/Reference/file_handlers).

#### Service worker

Mặc dù PWA không cần service worker để được cài đặt, service worker thường được dùng với PWA để cung cấp ít nhất một trải nghiệm ngoại tuyến tối thiểu.

Service worker khuyến khích một kiến trúc trong đó các trang của ứng dụng - tức phần truyền thống của website - triển khai giao diện người dùng, còn service worker triển khai phần backend có thể hỗ trợ [hoạt động ngoại tuyến và chạy nền](/en-US/docs/Web/Progressive_web_apps/Guides/Offline_and_background_operation), làm cho PWA hoạt động giống ứng dụng hơn website. Điều này là vì service worker có thể được trình duyệt khởi động trong nền khi cần (ví dụ, để xử lý một push notification).

### PWA và ứng dụng một trang

Theo truyền thống, một website được xây dựng như một tập hợp các trang liên kết với nhau. Khi người dùng nhấp một liên kết từ trang này sang trang khác trong cùng site, trình duyệt tải trang mới như một thực thể hoàn toàn mới, bao gồm HTML và các tài nguyên phụ mà HTML tải, như CSS và JavaScript. Trong một {{Glossary("SPA", "ứng dụng một trang")}}, site chỉ gồm một trang HTML duy nhất, và khi người dùng nhấp các liên kết nội bộ, việc này được xử lý bằng JavaScript lấy nội dung mới từ máy chủ và cập nhật những phần liên quan của trang.

Ứng dụng một trang có thể mang lại trải nghiệm gần hơn với ứng dụng dành riêng cho nền tảng, nên PWA thường được triển khai như ứng dụng một trang. Đặc biệt, ứng dụng một trang giúp dễ đạt được giao diện liền mạch, trong đó người dùng được trình bày một trang nhất quán duy nhất, và chỉ các phần liên quan của trang được cập nhật khi người dùng tương tác với ứng dụng.

Tuy nhiên, PWA không bắt buộc phải là ứng dụng một trang, và ứng dụng một trang cũng không bắt buộc phải là PWA.

### Tăng cường dần

Mặc dù {{Glossary("Progressive Enhancement", "progressive enhancement")}} là một thuộc tính đáng mong muốn cho hầu hết website, nó đặc biệt quan trọng với PWA, vốn kỳ vọng chạy trên phạm vi thiết bị rất rộng và thường sử dụng các Web API nâng cao mà không phải trình duyệt nào cũng hỗ trợ.

Một thành phần cơ bản của progressive enhancement là, nếu người dùng truy cập PWA của bạn trên web bằng cách nhập URL vào trình duyệt, họ có thể tương tác với ứng dụng như một website bình thường. Nhưng nếu trình duyệt có thể cài nó, người dùng sẽ được nhắc cài đặt và ứng dụng sẽ xuất hiện như một tính năng mới trên thiết bị của họ.

PWA nên phát hiện tính năng cho các API nâng cao và cung cấp trải nghiệm dự phòng phù hợp.

Ví dụ, [Background Sync API](/en-US/docs/Web/API/Background_Synchronization_API) cho phép PWA yêu cầu service worker thực hiện yêu cầu mạng ngay khi thiết bị có kết nối. Một trường hợp sử dụng kinh điển là nhắn tin. Giả sử người dùng soạn một tin nhắn, nhưng khi người dùng cố gửi tin nhắn đó, thiết bị lại ngoại tuyến. Background Sync API cho phép thiết bị gửi tin nhắn trong nền khi thiết bị kết nối lại. Trên thiết bị không hỗ trợ Background Sync, ứng dụng nên cho người dùng biết tin nhắn không thể gửi, và cho họ cơ hội thử lại sau.
