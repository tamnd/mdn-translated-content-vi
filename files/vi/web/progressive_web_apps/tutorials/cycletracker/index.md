---
title: Hướng dẫn PWA CycleTracker
short-title: CycleTracker
slug: Web/Progressive_web_apps/Tutorials/CycleTracker
page-type: tutorial
sidebar: pwasidebar
---

{{NextMenu("Web/Progressive_web_apps/Tutorials/CycleTracker/HTML_and_CSS")}}

Hướng dẫn nhập môn này đi qua toàn bộ các bước xây dựng một progressive web app cơ bản, hay PWA. Chúng ta sẽ dùng các công nghệ web - HTML, CSS và JavaScript - để xây dựng một web app theo dõi chu kỳ kinh nguyệt tên là "CycleTracker". Giống như mọi web app khác, CycleTracker được thiết kế để hoạt động trên mọi trình duyệt và mọi thiết bị.

Theo mặc định, PWA là các website bình thường, được xây dựng bằng cùng các công nghệ đó. Cũng như website thông thường, PWA có thể được liên kết, được tìm thấy qua công cụ tìm kiếm, và hiển thị trong trình duyệt. Bằng cách thêm một manifest file và phục vụ website qua TLS, bất kỳ website nào cũng có thể trở thành PWA.

Trước hết, chúng ta sẽ xây dựng một web app đầy đủ chức năng, rồi từng bước nâng cấp CycleTracker để [có thể cài đặt](/en-US/docs/Web/Progressive_web_apps/Guides/Making_PWAs_installable), và hoạt động ngay cả khi người dùng ngoại tuyến.

## Lợi ích của PWA

Bằng các ngôn ngữ của web, chúng ta sẽ tạo ra một ứng dụng hoạt động đầy đủ cả khi trực tuyến lẫn ngoại tuyến, cả trong trình duyệt lẫn trên hệ điều hành của người dùng. Giống như website bình thường, CycleTracker được lưu trữ và tải về từ web server. Điều duy nhất chúng ta cần là một trình soạn thảo văn bản: CycleTracker, như mọi PWA khác, không đòi hỏi kiến thức ngôn ngữ lập trình bổ sung, đóng gói, hay SDK độc quyền. CycleTracker, như mọi PWA, có thể được cài đặt liền mạch trên bất kỳ hệ điều hành nào mà không cần app store, cũng không cần phê duyệt hay phí từ app store.

- Dùng công nghệ web chuẩn và mở
  - : Trong lịch sử, để một ứng dụng có thể cài đặt trên hệ điều hành như Windows, iOS, macOS, Linux và Android, ứng dụng đó thường được phát triển bằng các ngôn ngữ được hệ điều hành hỗ trợ, như C#, .Net, Objective C, Swift, Kotlin, Java hoặc Python. PWA theo mô hình khác: chúng dùng một codebase duy nhất, viết bằng công nghệ web mở và chuẩn (HTML, CSS và JavaScript) chạy được trên nhiều hệ điều hành.

- Không cần biên dịch
  - : Với hầu hết ngôn ngữ lập trình - như Java, C/C++ và Kotlin, thường dùng để xây dựng app Android, và Objective-C, Swift cho iOS - code cần được biên dịch và đóng gói thành một định dạng có thể cài đặt, như .exe, .dmg, .elf và .apk, hoặc loại file có thể cài đặt khác tùy hệ điều hành. Tùy ngôn ngữ, việc biên dịch và đóng gói có thể cần {{glossary("SDK")}} của hệ điều hành. PWA dùng các công nghệ web được mọi hệ điều hành hỗ trợ, không cần đóng gói hay biên dịch. Đúng là nhóm phát triển có thể có các hệ thống build phức tạp, nhưng như chúng ta sẽ thấy khi xây dựng CycleTracker, PWA có thể được tạo chỉ từ HTML và JavaScript (và CSS, dù việc tạo kiểu không nhất thiết phải là yêu cầu của PWA).

- Có mặt ở mọi nơi
  - : Ứng dụng chỉ dành cho một hệ điều hành thường được phân phối qua các bản tải về, thường là trong các app store độc quyền. Chúng có thể lấy từ các nhà cung cấp như Apple App Store, [Google Play](https://play.google.com/store/apps), [Microsoft Store](https://apps.microsoft.com/), hoặc tương tự. PWA không có các yêu cầu này. Nếu bạn muốn phân phối ứng dụng CycleTracker, bạn không cần một bên trung gian. Người dùng có thể truy cập ứng dụng bằng cách ghé vào phiên bản trực tuyến của nó. Nhưng nếu muốn, bạn vẫn có thể phân phối PWA lên Play Store và App Store, không khác gì các app iOS hoặc Android khác.

- Dễ cài đặt cho người dùng
  - : Trong lịch sử, các ứng dụng chỉ dành cho một hệ điều hành sau khi tải về phải được người dùng chủ động cài đặt. Tùy hệ điều hành, định dạng cài đặt và nguồn tải về, quá trình này có thể gồm nhiều bước. PWA thì gọn hơn nhiều. PWA có sẵn cho bất kỳ ai dùng trình duyệt được hỗ trợ, và có thể [cài đặt](/en-US/docs/Web/Progressive_web_apps/Guides/Installing) chỉ với vài cú nhấp.

### So với phần mềm cài đặt sẵn trên hệ điều hành

Sau khi được cài đặt, PWA có thể được làm cho xuất hiện và hoạt động giống các ứng dụng khác trên thiết bị của người dùng:

- Cửa sổ ứng dụng
  - : Với một thiết lập [manifest](/en-US/docs/Web/Progressive_web_apps/Tutorials/CycleTracker/Manifest_file#app_presentation), chúng ta sẽ làm cho CycleTracker mở trong cửa sổ ứng dụng riêng, nghĩa là PWA đã cài đặt sẽ giống các ứng dụng cài sẵn khác.

- Biểu tượng ứng dụng
  - : PWA hiển thị biểu tượng ứng dụng ở cùng vị trí với các ứng dụng khác đã cài trên hệ điều hành của người dùng. Có thể là biểu tượng trên màn hình chính, trong thanh công cụ, trong thư mục ứng dụng, hoặc bất kỳ nơi nào thiết bị hiển thị biểu tượng ứng dụng. Chúng ta sẽ học cách [khai báo biểu tượng](/en-US/docs/Web/Progressive_web_apps/Tutorials/CycleTracker/Manifest_file#app_iconography) cho CycleTracker, để sau khi cài đặt, PWA của chúng ta có thể trông như một ứng dụng bình thường khác trên thiết bị của người dùng.

- Hoạt động ngoại tuyến
  - : Internet ban đầu là cần thiết để tải ứng dụng và cũng cần khi đồng bộ dữ liệu với server hoặc người dùng khác. Điều này là yêu cầu của mọi ứng dụng, không chỉ PWA. Chúng ta sẽ thêm một [service worker](/en-US/docs/Web/Progressive_web_apps/Tutorials/CycleTracker/Service_workers) để tạo trải nghiệm ngoại tuyến, nghĩa là CycleTracker vẫn hoạt động ngay cả khi người dùng mất kết nối internet. Ở đây chúng ta chỉ chạm vào sức mạnh của hỗ trợ ngoại tuyến trong PWA. Service worker có thể được dùng để làm PWA hoạt động ngoại tuyến giống như bất kỳ ứng dụng cài đặt sẵn nào khác. Nếu người dùng thay đổi dữ liệu khi ngoại tuyến, service worker cho phép PWA đồng bộ dữ liệu khi kết nối được khôi phục. Với service worker, người dùng thậm chí không cần chủ động mở PWA thì ứng dụng vẫn có thể gửi và lấy dữ liệu từ server.

## Các bài học CycleTracker PWA

Ứng dụng web gốc cho hướng dẫn PWA này là một trình theo dõi chu kỳ, trong đó người dùng có thể theo dõi ngày bắt đầu và ngày kết thúc của mỗi chu kỳ kinh nguyệt. Chúng ta sẽ tạo một khung website tĩnh và tạo kiểu cho nó, rồi học cách tạo kết nối an toàn để xem tiến trình của mình. Sau đó, chúng ta sẽ thêm chức năng JavaScript biến khung HTML và CSS thành một ứng dụng đầy đủ chức năng lưu dữ liệu trong localStorage. Từ ứng dụng web đầy đủ đó, chúng ta sẽ từng bước nâng cấp thành PWA có thể hoạt động ngoại tuyến bằng cách thêm manifest file, biểu tượng và service worker.

Các bước bao gồm:

- [HTML và CSS của ứng dụng](/en-US/docs/Web/Progressive_web_apps/Tutorials/CycleTracker/HTML_and_CSS)
  - : Giải thích từng dòng HTML cho phần nội dung tĩnh của website, phần nội dung tĩnh của CycleTracker, cùng với CSS dùng để tạo kiểu cho nội dung đó.

- [Môi trường phát triển cục bộ hoặc kết nối an toàn](/en-US/docs/Web/Progressive_web_apps/Tutorials/CycleTracker/Secure_connection)
  - : Để có thể cài đặt, PWA phải được phục vụ bằng giao thức `https://`, hoặc là tài nguyên được phục vụ cục bộ qua `127.0.0.1` hay `localhost` với giao thức `http://`. Chúng ta sẽ xem trang với giao thức `file://`, đồng thời trình bày các lựa chọn để tạo kết nối localhost an toàn nhằm kiểm thử mã cài đặt khi đi qua các bước của hướng dẫn. Chúng ta cũng sẽ xem cách phục vụ PWA bằng GitHub Pages.

- [JavaScript và LocalStorage](/en-US/docs/Web/Progressive_web_apps/Tutorials/CycleTracker/JavaScript_functionality)
  - : Giải thích đầy đủ chức năng JavaScript để tạo một ứng dụng web theo dõi chu kỳ chạy ở phía client, sao cho ta có một ứng dụng hoạt động có thể từng bước nâng cấp thành PWA, dùng [`localStorage`](/en-US/docs/Web/API/Window/localStorage) để lưu thông tin chu kỳ.

- [Manifest: danh tính, diện mạo và biểu tượng](/en-US/docs/Web/Progressive_web_apps/Tutorials/CycleTracker/Manifest_file)
  - : PWA cần một manifest, tức file JSON mô tả tên, biểu tượng, mô tả và các định nghĩa khác về cách ứng dụng hoạt động trong hệ điều hành nơi PWA được cài đặt. Chúng ta sẽ tạo manifest file định nghĩa diện mạo của ứng dụng khi được cài, bao gồm biểu tượng nào sẽ được dùng tùy thiết bị của người dùng, và các tham số cho vùng hiển thị của ứng dụng. Chúng ta cũng sẽ xem cách gỡ lỗi manifest file bằng công cụ dành cho nhà phát triển của trình duyệt.

- [Service worker](/en-US/docs/Web/Progressive_web_apps/Tutorials/CycleTracker/Service_workers)
  - : Service worker giúp ứng dụng hoạt động ngoại tuyến. Với kết nối an toàn ở bước trước, lần truy cập đầu tiên vào trang sẽ cung cấp chức năng cơ bản trong khi service worker đang tải xuống. Sau khi service worker được cài đặt và kích hoạt, nó sẽ kiểm soát trang để mang lại độ tin cậy và tốc độ tốt hơn.

<!--

- [Trải nghiệm ngoại tuyến](/en-US/docs/Web/Progressive_web_apps/Tutorials/CycleTracker/offline)

  - : Dùng JavaScript, chúng ta sẽ xác định người dùng đang trực tuyến hay ngoại tuyến. Khi ngoại tuyến, họ sẽ thấy một trải nghiệm ngoại tuyến thông báo rằng họ đang ngoại tuyến. Khi trực tuyến, trải nghiệm sẽ tương tự website, nhưng nút cài đặt sẽ không hiển thị.

- [Session storage](/en-US/docs/Web/Progressive_web_apps/Tutorials/CycleTracker/Storage)
  - : Chúng ta sẽ xem qua service worker và session storage, dùng JavaScript để nâng cấp PWA.
-->

Để hoàn thành hướng dẫn này, bạn nên có hiểu biết cơ bản về HTML, CSS và JavaScript. Hướng dẫn cung cấp chỉ dẫn tạo manifest file và khởi tạo service worker, cũng như thiết lập môi trường phát triển cục bộ để bạn có thể xem tiến trình của mình. <!-- Hướng dẫn cũng sẽ đề cập đến việc kiểm tra kết nối internet, xác định trải nghiệm trực tuyến và ngoại tuyến. -->

Mặc dù kết nối an toàn là yêu cầu bắt buộc, không có yêu cầu phần mềm đặc biệt nào để tạo PWA ngoài một trình soạn thảo văn bản để viết mã và một trình duyệt để xem nó.

Bạn có thể thử [bản period tracker trực tiếp](https://mdn.github.io/pwa-examples/cycletracker/) và xem [mã nguồn của ứng dụng web](https://github.com/mdn/pwa-examples/tree/main/cycletracker) trên GitHub.

{{NextMenu("Web/Progressive_web_apps/Tutorials/CycleTracker/HTML_and_CSS")}}
