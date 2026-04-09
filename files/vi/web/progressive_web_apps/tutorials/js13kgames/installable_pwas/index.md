---
title: "js13kGames: Cách làm PWA có thể cài đặt"
short-title: Làm PWA có thể cài đặt
slug: Web/Progressive_web_apps/Tutorials/js13kGames/Installable_PWAs
page-type: guide
sidebar: pwasidebar
---

{{PreviousMenuNext("Web/Progressive_web_apps/Tutorials/js13kGames/Offline_Service_workers", "Web/Progressive_web_apps/Tutorials/js13kGames/Re-engageable_Notifications_Push", "Web/Progressive_web_apps/Tutorials/js13kGames")}}

Ở bước cuối của hướng dẫn này, chúng ta đã đọc về cách ứng dụng mẫu [js13kPWA](https://mdn.github.io/pwa-examples/js13kpwa/) hoạt động ngoại tuyến nhờ [service worker](/en-US/docs/Web/API/Service_Worker_API) của nó, nhưng chúng ta có thể đi xa hơn và cho phép người dùng cài ứng dụng web lên thiết bị của họ. Khi đó, ứng dụng web đã cài có thể được khởi chạy như bất kỳ app gốc nào của hệ điều hành. Bài viết này giải thích cách đạt được điều đó bằng manifest của ứng dụng web.

Web app manifest cho phép ứng dụng được mở trực tiếp từ màn hình chính, taskbar hoặc dock của thiết bị, thay vì người dùng phải mở trình duyệt rồi điều hướng tới site bằng bookmark hoặc gõ URL. Ứng dụng web của bạn có thể nằm cạnh các ứng dụng gốc, giúp người dùng truy cập dễ hơn. Ngoài ra, bạn có thể chỉ định ứng dụng mở ở chế độ fullscreen hoặc standalone, nhờ đó bỏ giao diện trình duyệt mặc định vốn có thể xuất hiện, tạo cảm giác liền mạch và giống ứng dụng gốc hơn.

Để tìm hiểu thêm, xem [Making PWAs installable](/en-US/docs/Web/Progressive_web_apps/Guides/Making_PWAs_installable).

## Yêu cầu

Để làm cho ứng dụng mẫu của chúng ta có thể cài đặt, cần các điều sau:

- Một web application manifest, với [các member bắt buộc được điền đúng](/en-US/docs/Web/Progressive_web_apps/Guides/Making_PWAs_installable#the_web_app_manifest).
- Website được phục vụ từ một miền an toàn (HTTPS).
- Một biểu tượng đại diện cho ứng dụng trên thiết bị.

### File web app manifest

Thành phần quan trọng nhất là file web application manifest, liệt kê toàn bộ thông tin về website ở định dạng JSON.

Nó thường nằm trong thư mục gốc của web app. Nó chứa thông tin hữu ích như tiêu đề app, đường dẫn tới các biểu tượng kích thước khác nhau có thể dùng để đại diện cho app trên hệ điều hành (như biểu tượng trên màn hình chính, một mục trong Start menu, hay một biểu tượng trên desktop), và màu nền dùng trong màn hình tải hoặc splash screen. Thông tin này cần để trình duyệt trình bày web app đúng cách trong quá trình cài đặt, cũng như trong giao diện khởi chạy app của thiết bị, như màn hình chính của thiết bị di động.

File `js13kpwa.webmanifest` của web app [js13kPWA](https://mdn.github.io/pwa-examples/js13kpwa/) được đưa vào khối {{HTMLElement("head")}} của file `index.html` bằng dòng code sau:

```html
<link rel="manifest" href="js13kpwa.webmanifest" />
```

> [!NOTE]
> Nhiều người dùng `manifest.json` cho manifest web app vì nội dung được tổ chức dưới dạng JSON. Tuy nhiên, định dạng file `.webmanifest` được nhắc đến rõ ràng trong [đặc tả manifest của W3C](https://w3c.github.io/manifest/), nên đó là định dạng chúng ta sẽ dùng ở đây.

Nội dung file trông như sau:

```json
{
  "name": "js13kGames Progressive Web App",
  "short_name": "js13kPWA",
  "description": "Progressive Web App that lists games submitted to the A-Frame category in the js13kGames 2017 competition.",
  "icons": [
    {
      "src": "icons/icon-32.png",
      "sizes": "32x32",
      "type": "image/png"
    },
    // …
    {
      "src": "icons/icon-512.png",
      "sizes": "512x512",
      "type": "image/png"
    }
  ],
  "start_url": "/pwa-examples/js13kpwa/index.html",
  "display": "fullscreen",
  "theme_color": "#B12A34",
  "background_color": "#B12A34"
}
```

Hầu hết member đều khá dễ hiểu. Đây là mô tả cho các member trong ví dụ trên:

- `name`: Tên đầy đủ của web app.
- `short_name`: Tên ngắn sẽ hiển thị trên màn hình chính.
- `description`: Một hoặc hai câu giải thích app của bạn làm gì.
- `icons`: Thông tin về biểu tượng ứng dụng - URL nguồn, kích thước và kiểu. Hãy nhớ thêm ít nhất vài biểu tượng để thiết bị của người dùng chọn biểu tượng phù hợp nhất. Xem [Định nghĩa biểu tượng ứng dụng của bạn](/en-US/docs/Web/Progressive_web_apps/How_to/Define_app_icons).
- `start_url`: Tài liệu index sẽ mở khi khởi chạy app.
- `display`: Cách app được hiển thị; có thể là `fullscreen`, `standalone`, `minimal-ui` hoặc `browser`.
- `theme_color`: Màu chính cho UI, do hệ điều hành dùng.
- `background_color`: Màu dùng làm nền mặc định của app, dùng trong lúc cài đặt và trên splash screen.

Còn có nhiều member khác bạn có thể dùng hơn số member liệt kê ở trên - hãy nhớ xem [tài liệu tham khảo Web App Manifest](/en-US/docs/Web/Progressive_web_apps/Manifest) để biết chi tiết.

## Cài đặt PWA

Dựa trên thông tin có trong web app manifest, các trình duyệt hỗ trợ có thể hiển thị lời nhắc cài đặt cho người dùng. Khi người dùng truy cập PWA, họ có thể được nhắc cài ứng dụng lên thiết bị. Khi họ chấp nhận, PWA sẽ được cài giống các app gốc khác của hệ điều hành và người dùng có thể khởi chạy, dùng web app như bình thường.

Để tìm hiểu thêm về cách người dùng có thể cài PWA, xem [Installing and uninstalling web apps](/en-US/docs/Web/Progressive_web_apps/Guides/Installing).

### Splash screen

Trên một số thiết bị, splash screen cũng được tạo từ thông tin trong manifest và được hiển thị khi PWA được khởi chạy và trong lúc nó đang tải.

![Ảnh chụp splash screen của ứng dụng trên điện thoại di động. Đó là một trang màu đỏ hoàn toàn với logo ứng dụng ở giữa và tên ở bên dưới: "js13kGames Progressive Web App"](js13kpwa-splash.png)

Biểu tượng cùng màu theme và background được dùng để tạo màn hình này.

## Tóm tắt

Trong bài viết này, chúng ta đã học cách làm cho PWA có thể cài đặt bằng một web app manifest được cấu hình đúng, và cách người dùng có thể cài PWA đó lên thiết bị của họ.

Giờ hãy chuyển sang bước cuối trong hướng dẫn PWA: dùng push notifications để chia sẻ thông báo với người dùng, và giúp người dùng tái tương tác với ứng dụng.

{{PreviousMenuNext("Web/Progressive_web_apps/Tutorials/js13kGames/Offline_Service_workers", "Web/Progressive_web_apps/Tutorials/js13kGames/Re-engageable_Notifications_Push", "Web/Progressive_web_apps/Tutorials/js13kGames")}}
