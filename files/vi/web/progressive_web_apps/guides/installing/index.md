---
title: Cài đặt và gỡ cài đặt ứng dụng web
slug: Web/Progressive_web_apps/Guides/Installing
page-type: guide
sidebar: pwasidebar
---

Hướng dẫn này bao quát cách người dùng có thể cài đặt và gỡ cài đặt PWA trên thiết bị của họ. Nếu bạn muốn tìm hiểu về việc làm cho một web app có thể cài đặt như PWA, hãy xem [Làm cho PWA có thể cài đặt](/en-US/docs/Web/Progressive_web_apps/Guides/Making_PWAs_installable) thay thế.

## Lịch sử cài đặt web app

Trình duyệt từ trước đến nay luôn cho phép lưu lối tắt tới website, gọi là "bookmark". Đây chỉ là các liên kết tới website.

Một số hệ điều hành (OS) đã mở rộng khả năng bookmark, cho phép lưu bookmark tới các vị trí quen thuộc như màn hình chính hoặc thanh tác vụ, kèm biểu tượng khởi chạy site trong trình duyệt mặc định của OS. Với nhiều website, đây cũng chỉ là một liên kết tới site. Nếu site là [Ứng dụng Web Tiến bộ (PWA)](/en-US/docs/Web/Progressive_web_apps), việc lưu lên màn hình chính sẽ cài đặt PWA lên thiết bị của người dùng, tích hợp nó sâu hơn vào hệ điều hành giống như ứng dụng gốc trên hầu hết thiết bị. Giống như PWA có thể được cài đặt, chúng cũng có thể được gỡ cài đặt.

Trước tiên, chúng ta sẽ nói về các tiền thân của nó - việc lưu liên kết tới website.

### Bookmark website

Tất cả trình duyệt đều có chức năng thêm vào mục yêu thích/bookmark. Bookmark, hay favorite, là một lối tắt có thể nhấp cho một trang web. Bookmark cho phép truy cập nhanh tới website mà không cần người dùng nhập URL hoặc tìm nội dung theo cách khác. Bookmark đặc biệt hữu ích cho các URL dài và cho việc truy cập nội dung được ghé thường xuyên nhưng không phải trang chủ của site.

Tất cả trình duyệt đều cho phép người dùng xem và quản lý bookmark, bao gồm đổi tên và xóa favorite. Theo mặc định, phần hiển thị của bookmark bao gồm nội dung văn bản của phần tử {{HTMLElement("title")}} của trang được bookmark cùng một biểu tượng là [favicon](/en-US/docs/Glossary/Favicon) của site.

Trình duyệt cho phép lưu, chỉnh sửa, di chuyển, xóa, và quản lý bookmark theo nhiều cách khác. Giao diện quản lý bookmark khác nhau tùy trình duyệt.

### Thêm lên màn hình chính

Điện thoại thông minh, bắt đầu với iPhone năm 2007, đã thêm chức năng "save to home screen". Với website thông thường (không phải PWA), tính năng này tương tự bookmark, nhưng thay vì thêm favicon và tiêu đề của trang vào menu bookmark - một tính năng của trình duyệt - cách favorite này [thêm một biểu tượng](/en-US/docs/Learn_web_development/Core/Structuring_content/Webpage_metadata#adding_custom_icons_to_your_site) lên màn hình chính của OS.

Việc thêm một site không phải PWA lên màn hình chính không cài đặt website lên thiết bị. Thay vào đó, nó thêm biểu tượng do nhà phát triển định nghĩa lên màn hình chính, và khi nhấp vào sẽ mở liên kết đã lưu trong trình duyệt mặc định.

![iPhone thêm vào màn hình chính, prompt cài đặt, biểu tượng, và chức năng xóa.](iphone_pwa.jpg)

Nếu site được thêm lên màn hình chính là một PWA, PWA sẽ được cài đặt trên thiết bị.

Xóa biểu tượng khỏi màn hình chính sẽ xóa bookmark. Hộp thoại xác nhận xóa cung cấp thông tin về việc xóa biểu tượng có xóa bookmark hay xóa toàn bộ ứng dụng.

## Cài đặt và gỡ cài đặt PWA

Mặc dù cài đặt một PWA chỉ mất vài cú nhấp, tùy theo tính năng ứng dụng web, kết quả của việc cài đặt PWA thường vượt xa việc tạo một liên kết tới trang trên Internet; cài đặt PWA tích hợp ứng dụng web sâu hơn vào thiết bị của người dùng.

Tùy theo PWA, thiết bị, và các tính năng của hệ điều hành cùng trình duyệt, việc cài đặt PWA có thể bật các tính năng giống bản địa, chẳng hạn cho ứng dụng có cửa sổ độc lập riêng hoặc đăng ký nó như một trình xử lý tệp. Điều này cũng có nghĩa là việc gỡ cài đặt PWA, cũng chỉ cần vài cú nhấp, làm nhiều hơn là chỉ xóa biểu tượng của PWA.

### Cài đặt PWA

Giao diện cài đặt PWA từ web khác nhau giữa các trình duyệt và giữa các nền tảng.

Giao diện người dùng để cài đặt PWA khác nhau theo tổ hợp thiết bị và OS. Giao diện "Add to homes screen" cài đặt PWA trên Safari ở iOS. Các trình duyệt khác, bao gồm Chrome trên Android, đặt lệnh cài đặt ứng dụng trong menu cài đặt của trình duyệt. Trên Chrome và Edge máy tính để bàn, khi người dùng điều hướng tới trang, nếu trang là PWA và PWA hiện chưa được trình duyệt cài đặt, một biểu tượng cài đặt sẽ xuất hiện trên thanh URL:

![Prompt cài đặt PWA trên thanh URL](pwa-install.png)

Khi người dùng chọn biểu tượng, trình duyệt hiển thị prompt hỏi họ có muốn cài đặt PWA hay không, và nếu họ chấp nhận, PWA sẽ được cài đặt.

![Prompt xác nhận cài đặt PWA](installconfirm.jpg)

Sau khi được cài đặt, PWA sẽ hoạt động như các ứng dụng khác đã được cài trên OS. Ví dụ, trên macOS, biểu tượng sẽ xuất hiện trong dock, và có cùng tùy chọn biểu tượng như các ứng dụng khác:

![Biểu tượng PWA trong dock trên macOS](dock.jpg)

Trên hầu hết trình duyệt desktop, prompt cài đặt nằm trên thanh URL. Trên di động, prompt cài đặt thường nằm trong menu tùy chọn của trình duyệt. Dù là trình duyệt hay OS nào, việc cài đặt đều phải được xác nhận.

![Cài đặt PWA trên Chrome cho Android, với xác nhận, biểu tượng màn hình chính, và trải nghiệm ngoại tuyến.](android_pwa.jpg)

Sau khi cài đặt, PWA hoạt động giống hệt các ứng dụng đã cài khác: nhấp vào biểu tượng ứng dụng sẽ mở PWA, ngay cả khi người dùng đang ngoại tuyến.

Việc cài đặt được hỗ trợ trên mọi thiết bị desktop và di động hiện đại. Việc PWA có thể được trình duyệt cài đặt lên hệ điều hành hay không khác nhau theo tổ hợp trình duyệt/hệ điều hành. Phần lớn trình duyệt hỗ trợ cài đặt PWA trên mọi hệ điều hành - ChromeOS, macOS, Windows, Android, Linux, v.v. - trực tiếp hoặc khi cài một tiện ích mở rộng.

Firefox yêu cầu một [PWA extension](https://addons.mozilla.org/en-US/firefox/addon/pwas-for-firefox/).

Trước macOS 14 (Sonoma), PWA có thể được cài trên macOS từ mọi trình duyệt **ngoại trừ** Safari. Điều ngược lại đúng với các phiên bản iOS trước 16.4, khi PWA **chỉ** có thể được cài trong Safari. PWA có thể được cài trên macOS 14.0 trở lên và iOS/iPadOS 16.4 trở lên từ bất kỳ trình duyệt được hỗ trợ nào.

Khi một PWA đã cài được khởi chạy, nó có thể được hiển thị trong cửa sổ độc lập riêng (không có toàn bộ giao diện trình duyệt) nhưng về mặt kỹ thuật nó vẫn chạy trong một cửa sổ trình duyệt, ngay cả khi các thành phần giao diện quen thuộc như thanh địa chỉ hay nút quay lại không hiển thị. Ứng dụng sẽ nằm ở nơi OS lưu các ứng dụng khác, trong một thư mục riêng cho trình duyệt đó.

PWA được trình duyệt cài đặt sẽ vẫn thuộc riêng trình duyệt đó. Điều này có nghĩa là trình duyệt đã dùng để cài PWA cũng chính là trình duyệt dùng để chạy PWA đó. Điều này cũng có nghĩa là bạn có thể cài cùng một PWA từ một trình duyệt khác, và hai ứng dụng sẽ hoạt động như hai phiên bản khác nhau và không chia sẻ dữ liệu.

Trình duyệt dùng để cài PWA sẽ biết rằng PWA đã được cài, nhưng các trình duyệt khác sẽ không có quyền truy cập vào trạng thái cài đặt đó. Ví dụ, nếu bạn cài một PWA bằng MS Edge, Edge sẽ nhắc bạn mở PWA khi truy cập site đó, trong khi Chrome sẽ tiếp tục nhắc bạn cài ứng dụng. Nếu bạn cũng cài PWA bằng Chrome, bạn sẽ có hai bản sao của PWA. Khi nhiều phiên bản của một PWA đang mở, dữ liệu không được chia sẻ giữa các phiên bản được cài từ những trình duyệt khác nhau.

Khi bạn nhấn vào biểu tượng của web app, nó sẽ mở trong môi trường trình duyệt đã cài PWA, thường không có giao diện trình duyệt bao quanh, dù điều đó còn tùy cách nhà phát triển cấu hình [web app manifest](/en-US/docs/Web/Progressive_web_apps/Manifest). Tương tự, cách gỡ cài đặt PWA cũng phụ thuộc vào trình duyệt đã dùng để cài đặt nó.

### Gỡ cài đặt

Trên hầu hết hệ điều hành di động, gỡ cài đặt PWA được thực hiện giống như gỡ cài đặt các ứng dụng khác. Trên một số hệ điều hành di động, PWA xuất hiện trong cùng bảng điều khiển nơi quản lý các ứng dụng tải từ app store và có thể được gỡ cài đặt ở đó.

Trên iOS, PWA được cài từ Safari được liệt kê và có thể tìm kiếm từ màn hình "App Library", nhưng không được liệt kê cùng các ứng dụng đã cài khác trong "Settings". Trên iOS, nhấn giữ biểu tượng sẽ hiện giao diện xóa bookmark; gỡ biểu tượng khỏi màn hình chính sẽ xóa PWA.

Trên một số hệ điều hành desktop, có thể gỡ cài đặt PWA trực tiếp trong ứng dụng PWA đang mở. Để gỡ cài đặt, hãy mở PWA. Ở góc trên bên phải của ứng dụng đang mở, sẽ có một biểu tượng cần được mở rộng để thấy thêm công cụ. Tùy trình duyệt dùng để cài PWA, sẽ có либо liên kết gỡ cài đặt PWA, либо liên kết cài đặt mở trang cài đặt của trình duyệt với liên kết gỡ cài đặt. Chỉ cần nhấp vào tùy chọn gỡ cài đặt trong menu thả xuống, nếu có, hoặc đi tới cài đặt ứng dụng trong tab trình duyệt và nhấp gỡ cài đặt.

![Cài đặt ứng dụng trong MS Edge với liên kết gỡ cài đặt](remove.jpg)

Chọn cài đặt ứng dụng từ menu thả xuống đã mở trong Edge sẽ mở tab `edge://apps` của trình duyệt MS Edge. Tại đó, bạn sẽ thấy danh sách ứng dụng đã cài cùng các tùy chọn cho từng ứng dụng, bao gồm `🗑️ Uninstall`. Xác nhận gỡ cài đặt. Thế là xong!

Trong Edge, các PWA đã cài được liệt kê và có thể quản lý bằng cách truy cập [`edge://apps`](https://blogs.windows.com/msedgedev/2022/05/18/find-and-manage-your-installed-apps-and-sites/) trong trình duyệt Edge của bạn. Trong Chrome, danh sách Google Apps và PWA đã cài có thể xem và quản lý bằng cách truy cập `chrome://apps` trong trình duyệt Chrome của bạn.

## Xem thêm

- [Using PWAs in Chrome: computer and Android](https://support.google.com/chrome/answer/9658361)
- [Install, manage, or uninstall apps in Microsoft Edge](https://support.microsoft.com/en-us/topic/install-manage-or-uninstall-apps-in-microsoft-edge-0c156575-a94a-45e4-a54f-3a84846f6113)
