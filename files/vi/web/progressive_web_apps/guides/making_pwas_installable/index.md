---
title: Làm cho PWA có thể cài đặt
slug: Web/Progressive_web_apps/Guides/Making_PWAs_installable
page-type: guide
sidebar: pwasidebar
---

Một trong những khía cạnh định nghĩa của PWA là nó có thể được trình duyệt quảng bá để cài đặt lên thiết bị. Sau khi cài đặt, PWA xuất hiện với người dùng như một ứng dụng dành riêng cho nền tảng, một tính năng lâu dài trên thiết bị mà họ có thể khởi chạy trực tiếp từ hệ điều hành như bất kỳ ứng dụng nào khác.

Chúng ta có thể tóm tắt như sau:

- Các trình duyệt được hỗ trợ sẽ đề xuất PWA cho người dùng để cài đặt lên thiết bị.
- PWA có thể được cài giống như một ứng dụng dành riêng cho nền tảng, và có thể tùy biến quy trình cài đặt.
- Sau khi cài đặt, PWA có biểu tượng ứng dụng trên thiết bị, cạnh các ứng dụng dành riêng cho nền tảng.
- Sau khi cài đặt, PWA có thể được khởi chạy như một ứng dụng độc lập, thay vì một website trong trình duyệt.

Trong hướng dẫn này, chúng ta sẽ thảo luận từng tính năng trên. Trước hết, chúng ta sẽ nói về các yêu cầu mà một web app phải đáp ứng để được đề xuất cài đặt.

## Khả năng cài đặt

Để một web app được trình duyệt hỗ trợ đề xuất cài đặt, nó cần đáp ứng một số yêu cầu kỹ thuật. Ta có thể xem đó là các yêu cầu tối thiểu để một web app trở thành PWA.

> [!NOTE]
> Mặc dù không phải yêu cầu bắt buộc để PWA có thể cài đặt, nhiều PWA dùng [service workers](/en-US/docs/Web/API/Service_Worker_API) để cung cấp trải nghiệm ngoại tuyến.
> Xem hướng dẫn [CycleTracker: Service workers](/en-US/docs/Web/Progressive_web_apps/Tutorials/CycleTracker/Service_workers) để biết thêm thông tin.

### Web app manifest

Web app manifest là một tệp JSON cho trình duyệt biết PWA nên trông và hoạt động như thế nào trên thiết bị. Để một web app là PWA thì nó phải có thể cài đặt được, và để có thể cài đặt được thì nó phải bao gồm một manifest.

Manifest được đưa vào bằng phần tử {{HTMLElement("link")}} trong HTML của ứng dụng:

```html
<!doctype html>
<html lang="en">
  <head>
    <link rel="manifest" href="manifest.json" />
    <!-- ... -->
  </head>
  <body></body>
</html>
```

Nếu PWA có hơn một trang, mọi trang đều phải tham chiếu manifest theo cách này.

Manifest chứa một đối tượng JSON duy nhất gồm tập hợp các thành phần, mỗi thành phần định nghĩa một khía cạnh nào đó về giao diện hoặc hành vi của PWA. Đây là một manifest khá tối giản, chỉ chứa hai thành phần: `"name"` và `"icons"`.

```json
{
  "name": "My PWA",
  "icons": [
    {
      "src": "icons/512.png",
      "type": "image/png",
      "sizes": "512x512"
    }
  ]
}
```

#### Các thành phần manifest bắt buộc

Các trình duyệt dựa trên Chromium, bao gồm Google Chrome, Samsung Internet, và Microsoft Edge, yêu cầu manifest bao gồm các thành phần sau:

- [`name`](/en-US/docs/Web/Progressive_web_apps/Manifest/Reference/name) hoặc [`short_name`](/en-US/docs/Web/Progressive_web_apps/Manifest/Reference/short_name)
- [`icons`](/en-US/docs/Web/Progressive_web_apps/Manifest/Reference/icons) phải chứa một icon 192px và một icon 512px
- [`start_url`](/en-US/docs/Web/Progressive_web_apps/Manifest/Reference/start_url)
- [`display`](/en-US/docs/Web/Progressive_web_apps/Manifest/Reference/display) và/hoặc [`display_override`](/en-US/docs/Web/Progressive_web_apps/Manifest/Reference/display_override)
- [`prefer_related_applications`](/en-US/docs/Web/Progressive_web_apps/Manifest/Reference/prefer_related_applications) phải là `false` hoặc không có mặt

Để xem mô tả đầy đủ về từng thành phần, hãy xem tài liệu tham khảo [Web app manifest](/en-US/docs/Web/Progressive_web_apps/Manifest).

### Bắt buộc phải dùng HTTPS, localhost, hoặc loopback

Để một PWA có thể cài đặt, nó phải được phục vụ qua giao thức `https`, hoặc từ môi trường phát triển cục bộ bằng `localhost` hay `127.0.0.1` - có hoặc không có số cổng.

Đây là yêu cầu chặt chẽ hơn [secure context](/en-US/docs/Web/Security/Defenses/Secure_Contexts), vốn coi các tài nguyên tải từ URL `file://` là an toàn.

## Cài đặt từ app store

Người dùng kỳ vọng tìm ứng dụng trong app store của nền tảng của họ, như Google Play Store hoặc Apple App Store.

Nếu ứng dụng của bạn đáp ứng các điều kiện để cài đặt, bạn có thể đóng gói nó và phân phối qua app store. Quy trình này cụ thể cho từng app store:

- [Cách xuất bản một PWA lên Google Play Store](https://chromeos.dev/en/publish/pwa-in-play)
- [Cách xuất bản một PWA lên Microsoft Store](https://learn.microsoft.com/en-us/microsoft-edge/progressive-web-apps/how-to/microsoft-store)
- [Cách xuất bản một PWA lên Meta Quest Store](https://developers.meta.com/horizon/resources/publish-submit/)

[PWABuilder](https://docs.pwabuilder.com/#/builder/quick-start) là một công cụ giúp đơn giản hóa quá trình đóng gói và xuất bản PWA cho nhiều app store. Nó hỗ trợ Google Play Store, Microsoft Store, Meta Quest Store, và iOS App Store.

Nếu bạn đã thêm ứng dụng của mình vào app store, người dùng có thể cài nó từ đó, giống như một ứng dụng dành riêng cho nền tảng.

## Cài đặt từ web

Khi một trình duyệt hỗ trợ xác định rằng một web app đáp ứng các tiêu chí cài đặt đã mô tả trước đó, nó sẽ đề xuất ứng dụng cho người dùng để cài đặt. Người dùng sẽ được mời cài ứng dụng. Điều này có nghĩa là bạn có thể phân phối PWA của mình như một website, để nó có thể được khám phá qua tìm kiếm web, đồng thời cũng phân phối nó trong app store, để người dùng có thể tìm thấy ở đó.

Đây là ví dụ tuyệt vời về cách PWA có thể mang lại điều tốt nhất của cả hai thế giới. Nó cũng là một ví dụ tốt về cách progressive enhancement hoạt động với PWA: nếu người dùng gặp PWA của bạn trên web bằng một trình duyệt không thể cài nó, họ vẫn có thể dùng nó như một website bình thường.

Giao diện cài đặt PWA từ web khác nhau giữa các trình duyệt và nền tảng. Ví dụ, một trình duyệt có thể hiển thị biểu tượng "Install" trên thanh URL khi người dùng điều hướng tới trang:

![Thanh URL Chrome, hiển thị biểu tượng cài đặt PWA](pwa-install.png)

Khi người dùng chọn biểu tượng, trình duyệt hiển thị prompt hỏi họ có muốn cài PWA hay không, và nếu đồng ý thì PWA sẽ được cài đặt.

Prompt sẽ hiển thị tên và biểu tượng của PWA, lấy từ các thành phần manifest [`name`](/en-US/docs/Web/Progressive_web_apps/Manifest/Reference/name) và [`icons`](/en-US/docs/Web/Progressive_web_apps/Manifest/Reference/icons).

### Hỗ trợ trình duyệt

Hỗ trợ cho việc đề xuất cài đặt PWA từ web khác nhau theo trình duyệt và nền tảng.

Trên desktop:

- Các trình duyệt Chromium hỗ trợ cài PWA có tệp manifest trên mọi hệ điều hành desktop được hỗ trợ.
- Safari hỗ trợ Add to Dock (_File_ > _Add to Dock..._) trên macOS Sonoma (Safari 17) trở lên cho mọi web app có hoặc không có tệp manifest.
- Firefox không hỗ trợ cài PWA bằng tệp manifest.

Trên di động:

- Trên Android, Firefox, Chrome, Edge, Opera, và Samsung Internet Browser đều hỗ trợ cài PWA.
- Trên iOS 16.3 trở xuống, PWA chỉ có thể được cài bằng Safari.
- Trên iOS 16.4 trở lên, PWA có thể được cài từ menu Share trong Safari, Chrome, Edge, Firefox, và Orion.

### Cài site như ứng dụng

Chrome cho desktop và Android, Safari cho desktop, và Edge cho desktop cũng hỗ trợ người dùng cài bất kỳ website nào như một ứng dụng, dù có hay không có tệp manifest, và không xét tới các tiêu chí cài đặt của tệp manifest.
Lợi ích của việc dùng tệp manifest là trình duyệt sẽ chủ động đề xuất site khi người dùng truy cập, và nhà phát triển có thể tùy biến hành vi cài đặt.

### Kích hoạt prompt cài đặt

PWA có thể cung cấp giao diện riêng ngay trong trang để người dùng mở prompt cài đặt, thay vì phụ thuộc vào giao diện do trình duyệt cung cấp mặc định. Điều này cho phép PWA cung cấp ngữ cảnh và lý do để người dùng cài PWA, đồng thời giúp luồng cài đặt dễ khám phá hơn.

Kỹ thuật này dựa vào sự kiện [`beforeinstallprompt`](/en-US/docs/Web/API/Window/beforeinstallprompt_event), được phát trên đối tượng toàn cục [`Window`](/en-US/docs/Web/API/Window) ngay khi trình duyệt xác định rằng PWA có thể cài đặt được. Sự kiện này có phương thức [`prompt()`](/en-US/docs/Web/API/BeforeInstallPromptEvent/prompt) hiển thị prompt cài đặt. Vì vậy, PWA có thể:

- thêm nút "Install" riêng
- lắng nghe sự kiện `beforeinstallprompt`
- hủy hành vi mặc định của sự kiện bằng cách gọi [`preventDefault()`](/en-US/docs/Web/API/Event/preventDefault)
- trong trình xử lý sự kiện của nút "Install" riêng, gọi [`prompt()`](/en-US/docs/Web/API/BeforeInstallPromptEvent/prompt).

Điều này không được hỗ trợ trên iOS.

### Tùy biến prompt cài đặt

Theo mặc định, prompt cài đặt chứa tên và biểu tượng của PWA. Nếu bạn cung cấp giá trị cho các thành phần manifest [`description`](/en-US/docs/Web/Progressive_web_apps/Manifest/Reference/description) và [`screenshots`](/en-US/docs/Web/Progressive_web_apps/Manifest/Reference/screenshots), thì trên Android thôi, các giá trị này sẽ được hiển thị trong prompt cài đặt, cung cấp thêm ngữ cảnh và động lực để người dùng cài PWA.

Ảnh chụp màn hình bên dưới cho thấy prompt cài đặt của bản demo [PWAmp demo](https://github.com/MicrosoftEdge/Demos/tree/main/pwamp) trông như thế nào trên Google Chrome chạy trên Android:

![Prompt cài đặt PWAmp trên Android](pwamp-install-prompt-android.png)

## Khởi chạy ứng dụng

Sau khi PWA được cài đặt, biểu tượng của nó sẽ được hiển thị trên thiết bị cùng với các ứng dụng khác mà người dùng đã cài, và việc nhấp vào biểu tượng sẽ khởi chạy ứng dụng.

Bạn có thể dùng thành phần manifest [`display`](/en-US/docs/Web/Progressive_web_apps/Manifest/Reference/display) để điều khiển _chế độ hiển thị_: tức là PWA xuất hiện như thế nào khi nó được khởi chạy. Cụ thể:

- `"standalone"` cho biết PWA nên trông và hoạt động như một ứng dụng của nền tảng, không có các thành phần giao diện trình duyệt
- `"browser"` cho biết PWA nên được mở như một tab hoặc cửa sổ trình duyệt mới, giống như một website bình thường.

Nếu trình duyệt không hỗ trợ một chế độ hiển thị nhất định, `display` sẽ chuyển sang một chế độ được hỗ trợ theo một chuỗi dự phòng định sẵn. [`display_override`](/en-US/docs/Web/Progressive_web_apps/Manifest/Reference/display_override) cho phép bạn định nghĩa lại chuỗi dự phòng.
