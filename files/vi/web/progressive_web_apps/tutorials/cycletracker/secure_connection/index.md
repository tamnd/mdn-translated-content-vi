---
title: "CycleTracker: Kết nối an toàn"
short-title: Kết nối an toàn
slug: Web/Progressive_web_apps/Tutorials/CycleTracker/Secure_connection
page-type: tutorial-chapter
sidebar: pwasidebar
---

{{PreviousMenuNext("Web/Progressive_web_apps/Tutorials/CycleTracker/HTML_and_CSS", "Web/Progressive_web_apps/Tutorials/CycleTracker/JavaScript_functionality", "Web/Progressive_web_apps/Tutorials/CycleTracker")}}

PWA chỉ có thể được cài đặt khi dùng manifest file nếu được phục vụ với giao thức `https://`, hoặc khi được phục vụ cục bộ từ các URL `127.0.0.1` và `localhost` với giao thức `http://`.
Chúng cũng thường dùng các API [bị giới hạn trong secure context](/en-US/docs/Web/Security/Defenses/Secure_Contexts/features_restricted_to_secure_contexts).

Ở phần trước, chúng ta đã dùng HTML và CSS để tạo phần khung của ứng dụng theo dõi chu kỳ. Trong phần này, chúng ta sẽ mở nội dung tĩnh của CycleTracker trong trình duyệt, xem nội dung từ một môi trường phát triển khởi chạy cục bộ, và xem nội dung trên một server từ xa an toàn.

## Xem bằng giao thức `file://`

Bất kỳ trình duyệt nào cũng có thể hiển thị HTML của bạn. Để xem file HTML cùng CSS áp dụng từ phần trước, hãy mở file `index.html` bằng cách điều hướng tới nó trong cấu trúc file trên máy tính hoặc qua tùy chọn menu "Open File" của trình duyệt.

Khi `index.html` đã được cập nhật, và `style.css` nằm trong cùng thư mục, việc xem trang trong một cửa sổ trình duyệt hẹp sẽ trông giống như ảnh chụp màn hình này:

![Trang web màu xanh lá nhạt với tiêu đề lớn, một form có legend, hai bộ chọn ngày và một nút. Phần dưới hiển thị hai chu kỳ kinh nguyệt giữ chỗ và một tiêu đề.](filefile.jpg)

Chúng ta đang xem trang bằng giao thức `file://`, vốn cung cấp một [secure context](/en-US/docs/Web/Security/Defenses/Secure_Contexts).
Điều này đảm bảo các trang có thể được xem với trạng thái hiện tại của codebase, và sẽ tiếp tục hoạt động khi chúng ta [thêm chức năng JavaScript](/en-US/docs/Web/Progressive_web_apps/Tutorials/CycleTracker/JavaScript_functionality) cần secure context.

> [!NOTE]
> Phục vụ ứng dụng qua `https` không chỉ tốt cho PWA mà còn cho mọi website, vì nó đảm bảo thông tin truyền giữa web server và trình duyệt của người dùng được mã hóa đầu-cuối. Một số [Web API yêu cầu secure context](/en-US/docs/Web/Security/Defenses/Secure_Contexts/features_restricted_to_secure_contexts). Ngay cả khi bạn không tạo PWA có thể cài đặt, khi thêm tính năng vào bất kỳ web app nào bạn vẫn có thể gặp trường hợp cần secure context.

Mặc dù chúng ta có thể xem và kiểm thử hầu hết chức năng ứng dụng bằng giao thức `file://`, chúng ta không thể dùng nó để kiểm thử cài đặt ứng dụng bằng [manifest file](/en-US/docs/Web/Progressive_web_apps/Tutorials/CycleTracker/Manifest_file).

Chúng ta cần một môi trường phát triển cục bộ để kiểm thử toàn bộ hướng dẫn, bao gồm cả cài đặt. Một phần của [việc làm PWA có thể cài đặt](/en-US/docs/Web/Progressive_web_apps/Guides/Making_PWAs_installable) là cần một server an toàn. Các file sẽ cần được phục vụ qua kết nối an toàn trên web để có thể tận dụng các lợi ích mà PWA mang lại và phân phối ứng dụng của chúng ta như một PWA.

## localhost

Phương thức mặc định để thiết lập môi trường phát triển cục bộ khác nhau theo hệ điều hành. Mặc dù vị trí mặc định của file index và file cấu hình trên hệ điều hành của bạn có thể khác, hầu hết hệ điều hành máy tính đều cho phép cấu hình server mà bạn, nhà phát triển, có thể truy cập.

Ví dụ, trên macOS, ít nhất là trên Sierra và Monterey, nhập `sudo apachectl start` sẽ bật một Apache HTTP server. Khi server khởi động, nhập `http://localhost` trong trình duyệt sẽ hiển thị một trang web cơ bản có nội dung "It works!". Theo mặc định, file HTML được hiển thị là `Library/WebServer/Documents/index.html.en`. Để dùng các phần mở rộng khác ngoài `.html.en` hoặc đổi thư mục gốc khỏi `Library/WebServer/Documents/`, bạn phải sửa file cấu hình apache http nằm ở `/etc/apache2/httpd.conf`. Server có thể được dừng bằng `sudo apachectl stop`.

localhost mặc định của hệ điều hành có URL dễ nhớ, nhưng vị trí root của server và quy trình cấu hình lại khó nhớ. Nó cũng chỉ cho phép một local server ở một vị trí tại một thời điểm. May mắn là có các lựa chọn thiết lập server trực quan hơn để tạo một hoặc nhiều môi trường phát triển cục bộ trên nhiều cổng.

## localhost với số cổng

Có nhiều tiện ích mở rộng {{glossary("IDE")}} và các gói dành riêng cho ngôn ngữ lập trình cho phép khởi động môi trường phát triển chỉ bằng một cú nhấp hoặc một lệnh terminal. Bạn thậm chí có thể khởi động nhiều local server, mỗi server dùng một số cổng khác nhau.

Bạn có thể chạy một HTTP server cục bộ bằng một [VS Code plugin](/en-US/docs/Learn_web_development/Howto/Tools_and_setup/set_up_a_local_testing_server#using_an_extension_in_your_code_editor), cho phép chạy server cục bộ trên cùng hoặc cổng khác. Tiện ích [Preview on Web Server extension](https://marketplace.visualstudio.com/items?itemName=yuichinukiyama.vscode-preview-server) cho IDE [VS Code](https://code.visualstudio.com/download) tạo server tại gốc thư mục đang mở trong editor, với cổng mặc định là `8080`. Các extension của VS Code có thể cấu hình được. Thiết lập `previewServer.port` là số cổng của web server. Giá trị mặc định `8080` có thể được chỉnh sửa và thay đổi. Theo mặc định, nhập `localhost:8080` vào thanh URL của trình duyệt sẽ tải trang.

> [!NOTE]
> Preview on Web Server extension dùng Browsersync. Khi môi trường phát triển được khởi động bởi extension này, `localhost:3001` cung cấp giao diện người dùng cho Browsersync, cho bạn cái nhìn tổng quan về môi trường server hiện tại.

Tìm hiểu cách [thiết lập local testing server](/en-US/docs/Learn_web_development/Howto/Tools_and_setup/set_up_a_local_testing_server) bằng [Python](/en-US/docs/Learn_web_development/Howto/Tools_and_setup/set_up_a_local_testing_server#using_python) hoặc [ngôn ngữ server-side cục bộ](/en-US/docs/Learn_web_development/Howto/Tools_and_setup/set_up_a_local_testing_server#running_server-side_languages_locally) như PHP.

## Localhost với npx

Nếu bạn đã cài node, rất có thể bạn cũng đã có npm và npx. Trên command line, nhập `npx -v`. Nếu trả về một số phiên bản, bạn có thể dùng [http-server](https://www.npmjs.com/package/http-server), một static HTTP server không thể cấu hình, mà không cần cài thêm yêu cầu nào. Nhập `npx http-server [path]` trên command line, trong đó `[path]` là thư mục chứa file index của bạn.

Theo mặc định, nhập `localhost:8080` trong thanh URL của trình duyệt sẽ tải trang. Nếu bạn đã khởi động một server ở cổng `8080`, nó sẽ tự động đổi số cổng, khởi động môi trường phát triển bằng một cổng còn trống, chẳng hạn `8081`.

Bạn có thể chọn một số cổng khác. Nhập `npx http-server /user/yourName/CycleTracker -p 8787` sẽ khởi động local server ở cổng `8787` nếu còn trống. Nếu không, nếu bạn nhập một số cổng đang được dùng, bạn sẽ gặp lỗi `address already in use` hoặc lỗi tương tự. Nếu thành công, nhập `localhost:8787` trong thanh URL của trình duyệt sẽ hiển thị file index lưu tại `~/user/yourName/CycleTracker/index.html`, hoặc hiển thị nội dung thư mục `~/user/yourName/CycleTracker/` nếu không có file index.

Static HTTP server không thể cấu hình này đủ dùng cho ứng dụng cơ bản của chúng ta. Các ứng dụng được phục vụ qua `localhost` và `127.0.0.1` được miễn HTTPS và luôn được xem là an toàn. Nếu trình duyệt hiển thị cảnh báo không an toàn, có thể bỏ qua. Dù không bắt buộc, nếu muốn cấu hình web server cục bộ của bạn để phục vụ qua HTTPS, bạn có thể [thêm chứng chỉ TLS tích hợp sẵn](https://github.com/lwsjs/local-web-server/wiki/How-to-get-the-%22green-padlock%22-using-the-built-in-certificate). Với chứng chỉ đó, bạn sẽ có thể cài đặt và chạy [local-web-server](<https://github.com/lwsjs/local-web-server/wiki/How-to-launch-a-secure-local-web-server-(HTTPS)>) từ command line để phục vụ dự án cục bộ qua `https`, tránh mọi cảnh báo bảo mật.

```bash
npm install -g local-web-server
cd ~/user/yourName/CycleTracker/
ws --https
```

Trong lệnh trên, bạn có thể cần thêm `sudo` trước lệnh cài đặt.

> [!NOTE]
> Nếu bạn cần riêng tư, hãy nhớ rằng bạn đang tự xây dựng PWA này và có thể cài nó trên chính máy của bạn từ môi trường phát triển của mình, mà không cần truy cập Internet. Ứng dụng này không theo dõi gì cả. Nó riêng tư hết mức có thể.

## Server bên ngoài an toàn

Các lựa chọn trước là ổn, và cần thiết, để kiểm thử ứng dụng khi bạn đi qua hướng dẫn PWA này hoặc bất kỳ dự án web nào. Mặc dù bạn có thể host web app trên thiết bị của mình và cho bất kỳ ai có kết nối Internet truy cập, cách đó không được khuyến nghị.

Để có thêm các tính năng của PWA, bao gồm cài đặt chỉ bằng một cú nhấp, UI độc lập, quyền vào app store, và tùy chọn có thể hoạt động ngoại tuyến thông qua service worker, chúng ta cần một kết nối an toàn. Để phân phối ứng dụng của bạn, cho phép người khác xem, dùng và cài PWA, bạn sẽ muốn nội dung của mình được host và sẵn có trên một server từ xa an toàn.

Khi phát hành PWA chính thức, rất có thể bạn sẽ muốn đầu tư vào một [tên miền và web hosting](/en-US/docs/Learn_web_development/Howto/Tools_and_setup/How_much_does_it_cost#hosting). Với các dự án mã nguồn mở, nơi các nhà phát triển có thể học từ codebase và thậm chí đóng góp ngược trở lại dự án, bạn có thể host tiến trình của mình trên [GitHub Pages](https://pages.github.com/).

## GitHub Pages

Trạng thái hiện tại của ứng dụng CycleTracker có thể xem trên GitHub, được phục vụ an toàn tại [https://mdn.github.io/pwa-examples/cycletracker/html_and_css/](https://mdn.github.io/pwa-examples/cycletracker/html_and_css/). Chúng tôi đã đăng các file lên tài khoản GitHub của MDN. Tương tự, nếu bạn có tài khoản [GitHub](https://github.com/), bạn có thể đăng lên tài khoản của mình. Lưu ý rằng dù được phục vụ an toàn qua TLS, các hành động trên GitHub không nhất thiết là riêng tư, và mọi GitHub Pages đều công khai. Nếu bạn sống ở nơi có chính phủ đàn áp và theo dõi chu kỳ kinh nguyệt, hãy cân nhắc copy-paste code thay vì fork nó.

Để tạo một site công khai an toàn, hãy tạo một [GitHub Pages site](https://docs.github.com/en/pages/getting-started-with-github-pages/creating-a-github-pages-site). Tạo một repository tên `<username>.github.io`, trong đó `<username>` là tên người dùng GitHub của bạn. Tạo một nhánh `gh-pages`. Nhánh này của ứng dụng sẽ có sẵn tại `https://<username>.github.io`.

Như đã nói, mọi GitHub Pages đều công khai trên internet, ngay cả khi bạn đặt repository ở chế độ riêng tư. Vì dữ liệu chu kỳ được lưu bằng localStorage, ứng dụng sẽ có sẵn qua URL GitHub, nhưng dữ liệu người dùng chỉ có trên một trình duyệt duy nhất ở một thiết bị duy nhất nơi dữ liệu được nhập. Xóa trực tiếp localStorage, thực hiện trong trình duyệt, sẽ xóa toàn bộ dữ liệu đã lưu.

Nếu bạn không muốn PWA của mình nằm ở cấp cao nhất, bạn có thể làm ứng dụng trông như đang nằm trong một thư mục con. Bạn có thể tạo một thư mục con trong repository `<username>.github.io`, hoặc phát hành từ repository riêng của PWA. Bằng cách [cấu hình nguồn xuất bản](https://docs.github.com/en/pages/getting-started-with-github-pages/configuring-a-publishing-source-for-your-github-pages-site) trong repository PWA, ứng dụng của bạn sẽ xuất hiện tại `https://<username>.github.io/<repository>` trong đó `<repository>` là tên repository. Bạn có thể đặt GitHub tự động phát hành site của mình khi thay đổi được [xuất bản lên một nhánh cụ thể](https://docs.github.com/en/pages/getting-started-with-github-pages/configuring-a-publishing-source-for-your-github-pages-site#publishing-from-a-branch) trong repository đó, bao gồm `main`.

Trong trường hợp ứng dụng demo CycleTracker ở các giai đoạn phát triển khác nhau, `<username>` là `mdn` và repository là `pwa-examples`. Vì repository này có nhiều ví dụ PWA, mỗi ví dụ lại có tiến trình ở nhiều bước phát triển khác nhau, các file, và vì thế cả PWA, được lồng khá sâu trong cấu trúc thư mục.

Lưu ý rằng bạn có thể [cấu hình một tên miền tùy chỉnh cho GitHub Pages site](https://docs.github.com/en/pages/configuring-a-custom-domain-for-your-github-pages-site).

## Bước tiếp theo

Chúng ta đã có thể xem một phiên bản tĩnh, đã được tạo kiểu của khung ứng dụng CycleTracker. Giờ khi đã biết cách xem ứng dụng mình sắp xây dựng, hãy bắt đầu xây dựng nó. Tiếp theo, chúng ta tạo `app.js`, JavaScript biến thiết kế tĩnh thành một ứng dụng web hoạt động đầy đủ và lưu dữ liệu cục bộ trên máy của người dùng.

{{PreviousMenuNext("Web/Progressive_web_apps/Tutorials/CycleTracker/HTML_and_CSS", "Web/Progressive_web_apps/Tutorials/CycleTracker/JavaScript_functionality", "Web/Progressive_web_apps/Tutorials/CycleTracker")}}
