---
title: "CycleTracker: Manifest và biểu tượng"
short-title: Manifest và biểu tượng
slug: Web/Progressive_web_apps/Tutorials/CycleTracker/Manifest_file
page-type: tutorial-chapter
sidebar: pwasidebar
---

{{PreviousMenuNext("Web/Progressive_web_apps/Tutorials/CycleTracker/JavaScript_functionality", "Web/Progressive_web_apps/Tutorials/CycleTracker/Service_workers", "Web/Progressive_web_apps/Tutorials/CycleTracker")}}

Manifest file của PWA là file JSON cung cấp thông tin về các tính năng của ứng dụng để khi được cài trên thiết bị của người dùng, nó trông và hoạt động như một ứng dụng gốc. Manifest chứa metadata cho ứng dụng của bạn, bao gồm tên, biểu tượng và các chỉ thị về cách hiển thị.

Mặc dù theo đặc tả thì tất cả các khóa (hay member) của manifest đều là tùy chọn, một số trình duyệt, hệ điều hành và nhà phân phối ứng dụng có [các member bắt buộc cụ thể](/en-US/docs/Web/Progressive_web_apps/Guides/Making_PWAs_installable#required_manifest_members) để một web app được coi là PWA. Bằng cách bao gồm `name` hoặc `short_name`, `start_url`, một biểu tượng đáp ứng một số yêu cầu tối thiểu, và kiểu vùng hiển thị của ứng dụng mà PWA sẽ được mở, app của bạn sẽ đáp ứng yêu cầu manifest của một PWA.

Một manifest tối giản cho ứng dụng theo dõi chu kỳ kinh nguyệt của chúng ta có thể trông như sau:

```json
{
  "short_name": "CT",
  "start_url": "/",
  "icons": [
    {
      "src": "icon-512.png",
      "sizes": "512x512"
    }
  ],
  "display": "standalone"
}
```

Trước khi lưu manifest file và liên kết nó từ file HTML, chúng ta có thể phát triển một đối tượng JSON vẫn ngắn gọn nhưng giàu thông tin hơn để định nghĩa danh tính, cách trình bày và hệ biểu tượng của PWA. Đúng là đoạn trên đã hoạt động, nhưng hãy cùng nói về các member trong ví dụ này và một vài member khác giúp manifest file mô tả tốt hơn giao diện của PWA CycleTracker.

## Danh tính ứng dụng

Để xác định PWA của bạn, JSON phải có member `name` hoặc `short_name`, hoặc cả hai, để định nghĩa tên PWA. Nó cũng có thể bao gồm `description`.

- [`name`](/en-US/docs/Web/Progressive_web_apps/Manifest/Reference/name)
  - : Tên đầy đủ của PWA. Đây là tên được dùng khi hệ điều hành liệt kê ứng dụng, như nhãn bên cạnh biểu tượng ứng dụng, v.v.
- [`short_name`](/en-US/docs/Web/Progressive_web_apps/Manifest/Reference/short_name)
  - : Tên ngắn của PWA được hiển thị cho người dùng nếu không đủ chỗ để hiển thị `name`. Nó được dùng làm nhãn cho biểu tượng trên màn hình điện thoại, bao gồm hộp thoại "Add to Home Screen" trên iOS.

Khi cả `name` và `short_name` đều có mặt, `name` sẽ được dùng trong hầu hết trường hợp, còn `short_name` sẽ được dùng khi không đủ không gian để hiển thị tên ứng dụng.

- [`description`](/en-US/docs/Web/Progressive_web_apps/Manifest/Reference/description)
  - : Mô tả ngắn về việc ứng dụng làm gì. Nó cung cấp một {{glossary("accessible description")}} về mục đích và chức năng của ứng dụng.

### Nhiệm vụ

Viết vài dòng đầu tiên của manifest file. Bạn có thể dùng đoạn văn dưới đây, hoặc dùng giá trị kín đáo hơn hay mô tả hơn, cùng một mô tả do bạn chọn.

### Lời giải mẫu

```json
{
  "name": "CycleTracker: Period Tracking app",
  "short_name": "CT",
  "description": "Securely and confidentially track your menstrual cycle. Enter the start and end dates of your periods, saving your private data to your browser on your device, without sharing it with the rest of the world."
}
```

## Trình bày ứng dụng

Diện mạo, hay phần trình bày, của trải nghiệm đã cài và trải nghiệm ngoại tuyến của một PWA được định nghĩa trong manifest. Các member trình bày gồm `start_url` và `display`, cùng các member có thể dùng để [tùy chỉnh màu ứng dụng](/en-US/docs/Web/Progressive_web_apps/How_to/Customize_your_app_colors), bao gồm `theme_color` và `background_color`.

- [`start_url`](/en-US/docs/Web/Progressive_web_apps/Manifest/Reference/start_url)
  - : Trang bắt đầu khi người dùng mở PWA.

- [`display`](/en-US/docs/Web/Progressive_web_apps/Manifest/Reference/display)
  - : Điều khiển chế độ hiển thị của ứng dụng, bao gồm `fullscreen`, `standalone` - hiển thị [PWA như một ứng dụng độc lập](/en-US/docs/Web/Progressive_web_apps/How_to/Create_a_standalone_app), `minimal-ui` - tương tự chế độ độc lập nhưng có các phần tử UI để điều hướng, và `browser` - mở ứng dụng trong chế độ trình duyệt bình thường.

Cũng có member [`orientation`](/en-US/docs/Web/Progressive_web_apps/Manifest/Reference/orientation) xác định hướng mặc định của PWA là `portrait` hoặc `landscape`. Vì ứng dụng của chúng ta hoạt động tốt ở cả hai hướng, chúng ta sẽ bỏ qua member này.

### Màu sắc

- [`theme_color`](/en-US/docs/Web/Progressive_web_apps/Manifest/Reference/theme_color)
  - : [Màu mặc định của các phần tử giao diện hệ điều hành và trình duyệt](/en-US/docs/Web/Progressive_web_apps/How_to/Customize_your_app_colors#define_a_theme_color) như thanh trạng thái trên một số trải nghiệm di động và thanh tiêu đề ứng dụng trên hệ điều hành máy tính.
- [`background_color`](/en-US/docs/Web/Progressive_web_apps/Manifest/Reference/background_color)
  - : Màu giữ chỗ được hiển thị làm [nền của ứng dụng](/en-US/docs/Web/Progressive_web_apps/How_to/Customize_your_app_colors#customize_the_app_window_background_color) cho đến khi CSS được tải. Để tạo chuyển tiếp mượt mà giữa lúc khởi chạy và lúc tải ứng dụng, nên dùng cùng {{cssxref("&lt;color&gt;")}} đã khai báo làm màu {{cssxref("background-color")}} của ứng dụng.

### Nhiệm vụ

Thêm định nghĩa trình bày vào manifest file bạn đã bắt đầu tạo ở nhiệm vụ trước.

### Lời giải mẫu

Vì ứng dụng ví dụ là một trang đơn, chúng ta có thể dùng `"/"` làm `start_url`, hoặc bỏ hẳn member đó. Vì cùng lý do ấy, chúng ta có thể hiển thị ứng dụng mà không có UI trình duyệt bằng cách đặt `display` thành `standalone`.

Trong [CSS của chúng ta](/en-US/docs/Web/Progressive_web_apps/Tutorials/CycleTracker/HTML_and_CSS#css_content), `background-color: #eeffee;` được đặt trên bộ chọn phần tử `body`. Chúng ta dùng `#eeffee` để đảm bảo quá trình chuyển đổi từ giao diện giữ chỗ sang lúc ứng dụng tải diễn ra mượt mà.

```json
{
  "name": "...",
  "short_name": "...",
  "description": "...",
  "start_url": "/",
  "theme_color": "#eeffee",
  "background_color": "#eeffee",
  "display": "standalone"
}
```

## Hệ biểu tượng của ứng dụng

Biểu tượng PWA giúp người dùng nhận diện ứng dụng của bạn, làm nó hấp dẫn hơn về mặt thị giác và cải thiện khả năng được tìm thấy. Biểu tượng PWA xuất hiện trên màn hình chính, trình khởi chạy ứng dụng hoặc kết quả tìm kiếm trong app store. Kích thước biểu tượng hiển thị và yêu cầu file thay đổi tùy nơi nó được hiển thị và ai là người hiển thị. Manifest là nơi bạn định nghĩa hình ảnh của mình.

Trong đối tượng JSON của manifest, member `icons` chỉ định một mảng gồm một hoặc nhiều đối tượng biểu tượng dùng trong các ngữ cảnh khác nhau, mỗi đối tượng có member `src` và `sizes`, cùng các member tùy chọn `type` và `purpose`. Member `src` của mỗi đối tượng biểu tượng liệt kê nguồn của một file ảnh duy nhất. Member `sizes` cung cấp danh sách các kích thước cách nhau bằng dấu cách mà ảnh đó sẽ được dùng hoặc từ khóa `any`; giá trị này giống thuộc tính [`sizes`](/en-US/docs/Web/HTML/Reference/Elements/link#sizes) của phần tử {{HTMLElement("link")}}. Member `type` liệt kê MIME type của ảnh.

```json
{
  "name": "MyApp",
  "icons": [
    {
      "src": "icons/tiny.webp",
      "sizes": "48x48"
    },
    {
      "src": "icons/small.png",
      "sizes": "72x72 96x96 128x128 256x256",
      "purpose": "maskable"
    },
    {
      "src": "icons/large.png",
      "sizes": "512x512"
    },
    {
      "src": "icons/scalable.svg",
      "sizes": "any"
    }
  ]
}
```

Tất cả biểu tượng nên có cùng phong cách để người dùng nhận ra PWA của bạn, nhưng biểu tượng càng lớn thì càng chứa được nhiều chi tiết. Dù tất cả file biểu tượng đều là hình vuông, một số hệ điều hành sẽ render các hình dạng khác, cắt bớt các phần, hay "mask" biểu tượng, để phù hợp với UI, hoặc thu nhỏ và căn giữa biểu tượng với nền nếu biểu tượng không maskable. [Safe zone](/en-US/docs/Web/Progressive_web_apps/How_to/Define_app_icons#support_masking), vùng sẽ hiển thị ổn nếu biểu tượng bị mask thành hình tròn, là 80% phần trong của file ảnh. Biểu tượng được đánh dấu an toàn để mask bởi member `purpose`, khi đặt thành `maskable`, sẽ định nghĩa [biểu tượng là adaptive](https://web.dev/articles/maskable-icon).

Trong Safari, và vì thế trong iOS và iPadOS, nếu bạn thêm [apple-touch-icon không chuẩn](/en-US/docs/Learn_web_development/Core/Structuring_content/Webpage_metadata#adding_custom_icons_to_your_site) vào {{HTMLElement("head")}} của tài liệu HTML bằng {{HTMLElement("link")}}, chúng sẽ được ưu tiên hơn biểu tượng khai báo trong manifest.

### Nhiệm vụ

Thêm các biểu tượng vào manifest file mà bạn đang xây dựng.

Chơi với các từ "cycle" và "period" của CycleTracker cùng màu xanh lá mà chúng ta đã chọn, các ảnh biểu tượng của chúng ta có thể đều là những hình vuông xanh nhạt với một vòng tròn xanh lá. Kích thước nhỏ nhất của chúng ta là `circle.ico`, một file biểu tượng chỉ là một vòng tròn đại diện cho dấu chấm của chu kỳ và màu chủ đề ứng dụng, với các ảnh ở giữa như `circle.svg`, `tire.svg` và `wheel.svg` dần thêm chi tiết từ một vòng tròn đơn giản thành một lốp xe khi kích thước lớn hơn, còn biểu tượng lớn nhất là một bánh xe chi tiết có nan hoa và bóng đổ. Dù vậy, việc thiết kế biểu tượng nằm ngoài phạm vi của hướng dẫn này.

```html hidden
<div>
  <img alt="a green circle" src="circle.svg" role="img" />
  <img alt="a simple wheel" src="tire.svg" role="img" />
  <img alt="a detailed wheel" src="wheel.svg" role="img" />
</div>
```

```css hidden
div {
  display: flex;
  gap: 5px;
}
img {
  width: 33%;
}
```

{{EmbedLiveSample("PWA iconography", 600, 250)}}

### Lời giải mẫu

```json
{
  "name": "...",
  "short_name": "...",
  "description": "...",
  "start_url": "...",
  "theme_color": "...",
  "background_color": "...",
  "display": "...",
  "icons": [
    {
      "src": "circle.ico",
      "sizes": "48x48"
    },
    {
      "src": "icons/circle.svg",
      "sizes": "72x72 96x96",
      "purpose": "maskable"
    },
    {
      "src": "icons/tire.svg",
      "sizes": "128x128 256x256"
    },
    {
      "src": "icons/wheel.svg",
      "sizes": "512x512"
    }
  ]
}
```

## Thêm manifest vào ứng dụng

Giờ bạn đã có một manifest file hoàn toàn dùng được. Đến lúc lưu nó và liên kết từ file HTML.

Phần mở rộng file manifest có thể là đề xuất của đặc tả `.webappmanifest`. Tuy nhiên, vì đây là file JSON, nó thường được lưu bằng phần mở rộng `.json` mà trình duyệt hỗ trợ.

PWA yêu cầu manifest file phải được liên kết từ tài liệu HTML của ứng dụng. Chúng ta đã có một ứng dụng hoạt động đầy đủ, nhưng nó vẫn chưa là PWA vì chưa liên kết tới file manifest JSON bên ngoài. Để bao gồm tài nguyên JSON bên ngoài, chúng ta dùng phần tử `<link>`, với thuộc tính `rel="manifest"`, và đặt thuộc tính `href` tới vị trí của tài nguyên.

```html
<link rel="manifest" href="cycletracker.json" />
```

Phần tử `<link>` thường được dùng để liên kết stylesheet và, với PWA, file manifest bắt buộc, nhưng cũng được dùng để [thiết lập biểu tượng site](/en-US/docs/Web/HTML/Reference/Attributes/rel#icon) (cả biểu tượng kiểu "favicon" và biểu tượng cho màn hình chính, ứng dụng trên thiết bị di động) cùng nhiều thứ khác.

```html
<link rel="icon" href="icons/circle.svg" />
```

Khi dùng phần mở rộng `.webmanifest`, hãy đặt `type="application/manifest+json"` nếu server của bạn không hỗ trợ MIME type đó.

### Nhiệm vụ

Lưu manifest file mà bạn đã tạo ở các bước trên, rồi liên kết nó từ file `index.html`.

Tùy chọn, bạn cũng có thể liên kết một shortcut icon từ HTML.

### Lời giải mẫu

{{HTMLelement("head")}} của `index.html` lúc này có thể giống như sau:

```html
<head>
  <meta charset="utf-8" />
  <meta name="viewport" content="width=device-width" />
  <title>Cycle Tracker</title>
  <link rel="stylesheet" href="style.css" />
  <link rel="manifest" href="cycletracker.json" />
  <link rel="icon" href="icons/circle.svg" />
</head>
```

Xem file [`cycletracker.json`](https://mdn.github.io/pwa-examples/cycletracker/manifest_file/cycletracker.json) và xem [mã nguồn dự án](https://github.com/mdn/pwa-examples/tree/main/cycletracker/manifest_file) trên GitHub.

Với manifest file và khi được tải từ URL `https://` (hoặc `localhost`), [hầu hết trình duyệt](/en-US/docs/Web/Progressive_web_apps/Guides/Making_PWAs_installable#browser_support) sẽ nhận ra site của bạn là một PWA và một số trình duyệt sẽ nhắc cài đặt nó. Để làm PWA của chúng ta hoạt động ngoại tuyến, chúng ta vẫn cần thêm một service worker.
