---
title: Định nghĩa biểu tượng ứng dụng của bạn
slug: Web/Progressive_web_apps/How_to/Define_app_icons
page-type: how-to
sidebar: pwasidebar
---

[Progressive Web Apps (PWAs)](/en-US/docs/Web/Progressive_web_apps) có thể được cài trên thiết bị giống như các ứng dụng khác. Khi một PWA đã được cài, biểu tượng ứng dụng của nó sẽ xuất hiện trên màn hình chính, dock, thanh tác vụ, hoặc bất kỳ nơi nào mà các ứng dụng gốc của hệ điều hành thường xuất hiện.

Ví dụ, trên Windows, thanh tác vụ có thể chứa biểu tượng của cả ứng dụng gốc lẫn ứng dụng PWA cạnh nhau:

![Thanh tác vụ trên Windows, hiển thị các biểu tượng Windows thông thường, rồi đến biểu tượng của Firefox và Word, là ứng dụng gốc, nhưng cũng có biểu tượng của Spotify và PWAmp, là PWA](./windows-taskbar.png)

Khi tạo một PWA, bạn có thể định nghĩa bộ biểu tượng riêng để dùng khi ứng dụng được cài trên thiết bị. Bài viết này giải thích cách định nghĩa biểu tượng ứng dụng của bạn, cần tạo những kích thước biểu tượng nào, và cách làm cho biểu tượng hỗ trợ masking.

> [!NOTE]
> Biểu tượng ứng dụng PWA không giống với hình ảnh {{glossary("favicon")}}, vốn được hiển thị ở những nơi như thanh địa chỉ của trình duyệt. PWA có thể có cả favicon lẫn biểu tượng ứng dụng. Để tìm hiểu thêm về favicon, xem [Adding custom icons to your site](/en-US/docs/Learn_web_development/Core/Structuring_content/Webpage_metadata#adding_custom_icons_to_your_site).

## Thiết kế biểu tượng của bạn

Bước đầu tiên khi định nghĩa biểu tượng ứng dụng là thiết kế nó.

Hầu hết người dùng nhận diện ứng dụng qua biểu tượng của chúng. Biểu tượng xuất hiện ở nhiều nơi trong hệ điều hành, bao gồm màn hình chính, thanh tác vụ, trình khởi chạy ứng dụng, hoặc bảng cài đặt. Hãy bảo đảm người dùng có thể dễ dàng tìm thấy ứng dụng của bạn bằng cách làm cho biểu tượng vừa hấp dẫn về mặt thị giác, vừa đại diện cho ứng dụng của bạn.

Hình ảnh nên có nền trong suốt để có thể hiển thị trên nhiều loại nền khác nhau. Nó nên có kích thước ít nhất 1024x1024 pixel, hoặc có thể co giãn tới kích thước đó, vì đây là kích thước lớn nhất mà biểu tượng của bạn có thể được hiển thị. Bạn cũng có thể muốn tạo các phiên bản biểu tượng ít chi tiết hơn để dùng ở những nơi biểu tượng được hiển thị ở kích thước nhỏ hơn.

Thiết kế biểu tượng dưới dạng tệp SVG là một ý hay, vì điều này cho phép nó được co giãn tới mọi kích thước mà không bị giảm chất lượng.

## Tham chiếu biểu tượng trong web app manifest

Dùng thành phần web app manifest [`icons`](/en-US/docs/Web/Progressive_web_apps/Manifest/Reference/icons) để định nghĩa một bộ biểu tượng cho PWA của bạn.

Như mô tả trong [Create the necessary icon sizes](#create_the_necessary_icon_sizes), bạn nên tạo nhiều phiên bản của biểu tượng để bảo đảm nó hiển thị đúng ở mọi nơi nó được dùng. Đó là lý do thành phần `icons` là một mảng các đối tượng, mỗi đối tượng đại diện cho một biểu tượng, với kích thước, kiểu, và mục đích riêng. Mỗi đối tượng biểu tượng có các thuộc tính sau:

- `src`
  - : URL của tệp hình ảnh biểu tượng.
- `sizes`
  - : Các kích thước mà biểu tượng có thể được dùng cho.
- `type`
  - : {{Glossary("MIME type")}} của tệp hình ảnh mà hệ điều hành có thể dùng để nhanh chóng bỏ qua những hình ảnh nó không hỗ trợ.
- `purpose`
  - : Mục đích cụ thể theo hệ điều hành của hình ảnh.

Ví dụ, web app manifest sau định nghĩa năm biểu tượng PNG, mỗi biểu tượng có kích thước khác nhau:

```json
{
  "name": "My PWA",
  "start_url": "/",
  "display": "standalone",
  "icons": [
    {
      "src": "icon-72.png",
      "sizes": "72x72",
      "type": "image/png"
    },
    {
      "src": "icon-128.png",
      "sizes": "128x128",
      "type": "image/png"
    },
    {
      "src": "icon-144.png",
      "sizes": "144x144",
      "type": "image/png"
    },
    {
      "src": "icon-192.png",
      "sizes": "192x192",
      "type": "image/png"
    },
    {
      "src": "icon-512.png",
      "sizes": "512x512",
      "type": "image/png"
    }
  ]
}
```

## Tạo các kích thước biểu tượng cần thiết

Các hệ điều hành khác nhau dùng kích thước biểu tượng khác nhau ở những nơi khác nhau và cho các khả năng thiết bị khác nhau. Điều quan trọng là tạo nhiều phiên bản biểu tượng để nó hiển thị đúng ở mọi nơi được dùng.

Ví dụ, Windows có thể hiển thị biểu tượng ứng dụng của bạn dưới dạng ảnh 44x44 pixel trên thanh tác vụ, hoặc ảnh 150x150 pixel trong menu Start. Dùng các liên kết bên dưới để biết thêm về kích thước biểu tượng được các hệ điều hành khác nhau dùng và mẹo tạo biểu tượng hiệu quả:

- Với Windows, xem [Define icons and a theme color](https://learn.microsoft.com/en-us/microsoft-edge/progressive-web-apps/how-to/icon-theme-color) trên learn.microsoft.com.
- Với Android, xem [Google Play icon design specifications](https://developer.android.com/distribute/google-play/resources/icon-design-specifications) trên developer.android.com.
- Với iOS và macOS, xem [App icons](https://developer.apple.com/design/human-interface-guidelines/app-icons#App-icon-sizes) trên developer.apple.com.

Kích thước mà biểu tượng của bạn được hiển thị phụ thuộc vào hệ điều hành và có thể thay đổi theo thời gian. Tốt nhất là kiểm thử biểu tượng của bạn trên tất cả thiết bị và hệ điều hành mà bạn muốn hỗ trợ, và tạo ra các kích thước và kiểu hình ảnh cho kết quả tốt nhất. Bạn cũng có thể dùng một công cụ như [PWA Image Generator](https://www.pwabuilder.com/imageGenerator) để tạo các kích thước biểu tượng cần thiết từ một ảnh độ phân giải cao duy nhất.

Lưu ý rằng một số hệ điều hành hỗ trợ biểu tượng [SVG](/en-US/docs/Web/SVG), điều này có thể giúp giảm số lượng hình ảnh bạn cần tạo vì SVG có thể được co giãn tự động tới mọi kích thước. Nếu biểu tượng SVG của bạn không co giãn tốt xuống các kích thước nhỏ, có thể cần tạo thêm biểu tượng ít chi tiết và ít phức tạp hơn. Để hỗ trợ tất cả OS và các kích thước nhỏ, hãy tạo cả phiên bản PNG của biểu tượng.

Ví dụ web app manifest sau dùng ảnh WebP cho biểu tượng nhỏ, ảnh ICO cho biểu tượng cỡ trung, và ảnh SVG co giãn được cho các biểu tượng độ phân giải cao hơn:

```json
{
  "name": "My PWA",
  "start_url": "/",
  "display": "standalone",
  "icons": [
    {
      "src": "icon-small.webp",
      "sizes": "48x48",
      "type": "image/webp"
    },
    {
      "src": "icon-medium.ico",
      "sizes": "72x72 96x96 128x128 256x256"
    },
    {
      "src": "icon-high.svg",
      "sizes": "257x257"
    }
  ]
}
```

Tìm hiểu thêm về cách tham chiếu các kích thước biểu tượng khác nhau trong [Reference your icons in the web app manifest](#reference_your_icons_in_the_web_app_manifest).

## Hỗ trợ masking

Tùy theo hệ điều hành và khả năng của thiết bị, một mask có thể được áp dụng lên biểu tượng của bạn để khớp với một hình dạng cụ thể. Biểu tượng có thể masking là các biểu tượng thích ứng có thể được hiển thị theo nhiều hình dạng khác nhau do hệ điều hành cung cấp. Ví dụ, trên Android, biểu tượng ứng dụng có thể có mask hình tròn.

Biểu tượng ứng dụng PWA của bạn nên hỗ trợ masking một cách cụ thể để trông hòa nhập tốt với các hệ điều hành áp dụng mask. Biểu tượng không hỗ trợ masking có thể xuất hiện bị cắt hoặc nhỏ hơn mong đợi. Trên Android, các biểu tượng không mask được căn giữa trong mask hình tròn và có nền trắng, điều này có thể không đẹp với biểu tượng của bạn.

Hình ảnh sau minh họa sự khác biệt giữa biểu tượng có thể masking và không thể masking trên Android:

![Biểu tượng không thể masking ở bên trái, như một hình vuông nhỏ trong vòng tròn biểu tượng ứng dụng. Biểu tượng có thể masking ở bên phải, lấp đầy toàn bộ vòng tròn biểu tượng ứng dụng](./maskable-icon-comparison.png)

Để bắt đầu làm biểu tượng ứng dụng của bạn có thể masking, hãy dùng thuộc tính `purpose` trong các đối tượng biểu tượng của web app manifest, và đặt giá trị của nó thành `maskable`. Ví dụ:

```json
{
  "icons": [
    {
      "src": "icon-192-maskable.png",
      "sizes": "192x192",
      "type": "image/png",
      "purpose": "maskable"
    }
  ]
}
```

Dùng thuộc tính `purpose` chỉ là bước cuối cùng để làm biểu tượng của bạn có thể masking. Bạn cần bắt đầu bằng cách bảo đảm biểu tượng của bạn hòa nhập tốt với hệ điều hành chủ bằng cách bảo đảm các phần quan trọng của biểu tượng nằm gọn trong _safe zone_ của mask.

Safe zone là vùng được bảo đảm luôn hiển thị khi mask được áp dụng, và được định nghĩa là một hình tròn có đường kính bằng 80% kích thước nhỏ nhất của biểu tượng.

![Minh họa vùng an toàn bên trong biểu tượng có thể masking](./maskable-icon-safe-area.png)

Ví dụ, nếu biểu tượng của bạn là hình vuông, hãy bảo đảm hình vuông đó hoàn toàn nằm trong safe zone và các góc của nó không bị cắt mất.

Cuối cùng, hãy cho biểu tượng có thể masking của bạn một màu nền không trong suốt để lấp đầy toàn bộ vùng biểu tượng.

Bạn cũng có thể dùng các công cụ như [Maskable.app](https://maskable.app/) để xem trước biểu tượng của bạn sẽ trông như thế nào khi bị mask trên các hệ điều hành khác nhau.

## Xem thêm

- Thành phần manifest [`icons`](/en-US/docs/Web/Progressive_web_apps/Manifest/Reference/icons)
- [Thiết kế ứng dụng](https://web.dev/learn/pwa/app-design#the_icon) trên web.dev
- [Hỗ trợ biểu tượng thích ứng trong PWAs với biểu tượng có thể masking](https://web.dev/articles/maskable-icon) trên web.dev
- [Định nghĩa biểu tượng và màu chủ đề](https://learn.microsoft.com/en-us/microsoft-edge/progressive-web-apps/how-to/icon-theme-color) trên microsoft.com
- [PWA Image Generator](https://www.pwabuilder.com/imageGenerator) trên pwabuilder.com
