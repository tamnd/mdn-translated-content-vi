---
title: screenshots
slug: Web/Progressive_web_apps/Manifest/Reference/screenshots
page-type: web-manifest-member
spec-urls: https://w3c.github.io/manifest-app-info/#screenshots-member
sidebar: pwasidebar
---

Member manifest `screenshots` cho phép bạn chỉ định một hoặc nhiều hình ảnh trình bày ứng dụng web của mình.
Các hình ảnh này giúp người dùng xem trước giao diện và tính năng của ứng dụng web trong cửa hàng ứng dụng.

> [!NOTE]
> Member `screenshots` là tùy chọn, và các cửa hàng ứng dụng có thể không hiển thị những hình ảnh này khi trình bày ứng dụng của bạn.

## Cú pháp

```json-nolint
/* Một ảnh chụp màn hình */
"screenshots": [
  {
    "src": "desktop.webp",
    "sizes": "1280x720",
    "type": "image/webp"
  }
]

/* Hai ảnh chụp màn hình */
"screenshots": [
  {
    "src": "screenshots/home.webp",
    "sizes": "1280x720",
    "type": "image/webp",
    "form_factor": "wide",
    "label": "Màn hình chính hiển thị điều hướng chính và nội dung nổi bật"
  },
  {
    "src": "screenshots/dashboard.webp",
    "sizes": "1280x720",
    "type": "image/webp",
    "platform": "ios",
    "label": "Màn hình dashboard hiển thị các chỉ số chính"
  }
]
```

### Giá trị

- `screenshots`
  - : Một mảng các đối tượng.
    Mỗi đối tượng đại diện cho một ảnh chụp màn hình của ứng dụng web trong một tình huống sử dụng phổ biến.

    Mỗi đối tượng ảnh chụp màn hình có thể có một hoặc nhiều thuộc tính. Trong đó chỉ `src` là bắt buộc. Các thuộc tính có thể gồm:
    - `src`
      - : Một chuỗi chỉ định đường dẫn tới tệp ảnh.
        Nó có cùng định dạng với thuộc tính [`src`](/en-US/docs/Web/Progressive_web_apps/Manifest/Reference/icons#src) của member `icons`.

    - `sizes` {{Optional_Inline}}
      - : Một chuỗi chỉ định một hoặc nhiều kích thước của ảnh.
        Nó có cùng định dạng với thuộc tính [`sizes`](/en-US/docs/Web/Progressive_web_apps/Manifest/Reference/icons#sizes) của member `icons`.

    - `type` {{Optional_Inline}}
      - : Một chuỗi chỉ định {{glossary("MIME_type", "MIME type")}} của ảnh.
        Nó có cùng định dạng với thuộc tính [`type`](/en-US/docs/Web/Progressive_web_apps/Manifest/Reference/icons#type) của member `icons`.

    - `label` {{Optional_Inline}}
      - : Một chuỗi đại diện cho tên có thể truy cập của đối tượng ảnh chụp màn hình.
        Hãy giữ nó mô tả rõ ràng vì nó có thể đóng vai trò văn bản thay thế cho ảnh chụp màn hình đã hiển thị.
        Vì lý do truy cập, nên chỉ định thuộc tính này cho mọi ảnh chụp màn hình.

    - `form_factor` {{Optional_Inline}}
      - : Một chuỗi đại diện cho hình dạng màn hình của một lớp thiết bị mà ảnh chụp màn hình áp dụng.
        Chỉ chỉ định thuộc tính này khi ảnh chụp màn hình áp dụng cho một bố cục màn hình cụ thể.
        Nếu không chỉ định `form_factor`, ảnh chụp màn hình được xem là phù hợp với mọi loại màn hình.

        Các giá trị hợp lệ gồm:
        - `narrow`
          - : Cho biết ảnh chụp màn hình chỉ áp dụng cho màn hình hẹp, như thiết bị di động.
        - `wide`
          - : Cho biết ảnh chụp màn hình chỉ áp dụng cho màn hình rộng, như máy tính để bàn.

    - `platform`
      - : Một chuỗi đại diện cho nền tảng mà ảnh chụp màn hình áp dụng.
        Chỉ chỉ định thuộc tính này khi ảnh chụp màn hình áp dụng cho một thiết bị hoặc nền tảng phân phối cụ thể.
        Nếu không chỉ định `platform`, ảnh chụp màn hình được xem là phù hợp với mọi nền tảng.

        Các giá trị hợp lệ gồm:

        | Loại | Giá trị | Mô tả |
        | --- | --- | --- |
        | Hệ điều hành | `android` | Google Android |
        |  | `chromeos` | Google ChromeOS |
        |  | `ios` | Apple iOS |
        |  | `ipados` | Apple iPadOS |
        |  | `kaios` | KaiOS |
        |  | `macos` | Apple macOS |
        |  | `windows` | Microsoft Windows |
        |  | `xbox` | Microsoft Xbox |
        | Nền tảng phân phối | `chrome_web_store` | Google Chrome Web Store |
        |  | `itunes` | iTunes App Store |
        |  | `microsoft-inbox` | Được cài sẵn cùng Microsoft Windows |
        |  | `microsoft-store` | Microsoft Store |
        |  | `play` | Google Play Store |

## Mô tả

Member `screenshots` là metadata bổ sung, không ảnh hưởng đến hành vi chạy của ứng dụng hoặc cách trình duyệt trình bày ứng dụng.
Ảnh chụp màn hình được dùng trong các cửa hàng ứng dụng và các nền tảng phân phối khác để giới thiệu tính năng ứng dụng của bạn tới người dùng tiềm năng.

Các nền tảng phân phối có thể chọn số lượng ảnh chụp màn hình sẽ hiển thị.

Các hình bên dưới từ Apple App Store cho thấy ảnh chụp màn hình xuất hiện như thế nào trong danh sách ứng dụng trên iPhone.
Trong chế độ thư viện (hình bên trái), người dùng có thể cuộn ngang qua nhiều hình ảnh.
Họ có thể chạm vào bất kỳ hình nào để xem toàn màn hình (hình bên phải).

<div style="display: flex; justify-content: center; flex-wrap: wrap;">
  <img src="todoist-iphone-gallery.png" alt="Ứng dụng Todoist trong Apple App Store hiển thị một thư viện ảnh ứng dụng có thể cuộn ngang" width="350">
  <img src="todoist-iphone-fullscreen.png" alt="Chế độ xem toàn màn hình của một ảnh từ thư viện ngang của ứng dụng Todoist" width="350">
</div>

Ảnh toàn màn hình tương tự trên iPad cho thấy vì sao cần các ảnh chụp màn hình khác nhau cho form factor hẹp (iPhone) và rộng (iPad):

<div style="display: flex; justify-content: center;">
  <img src="todoist-ipad-fullscreen.png" alt="Danh sách ứng dụng Todoist trên iPad hiển thị nhiều ảnh chụp màn hình trong thư viện rộng hơn">
</div>

## Ví dụ

### Thêm ảnh xem trước cho một ứng dụng web lập kế hoạch bữa ăn

Ví dụ này cho thấy cách thêm ảnh chụp màn hình cho một ứng dụng lập kế hoạch bữa ăn trên các thiết bị khác nhau. Các ảnh chụp màn hình thể hiện cùng một tính năng của ứng dụng ở giao diện desktop và mobile:

```json
{
  "name": "Meal Planner",
  "screenshots": [
    {
      "src": "screenshots/desktop-home.webp",
      "sizes": "1920x1080",
      "form_factor": "wide",
      "label": "Giao diện desktop hiển thị lịch bữa ăn hằng tuần"
    },
    {
      "src": "screenshots/mobile-home.webp",
      "sizes": "750x1334",
      "form_factor": "narrow",
      "label": "Giao diện mobile hiển thị lịch bữa ăn hằng tuần"
    }
  ]
}
```

## Đặc tả

{{Specifications}}

## Tương thích trình duyệt

Thành viên manifest `screenshots` được dùng bởi các cửa hàng ứng dụng khi xuất bản và liệt kê ứng dụng web, nên không áp dụng thông tin tương thích trình duyệt.
Mặc dù trình duyệt có thể phân tích member này, nó là tùy chọn và không ảnh hưởng đến chức năng hay cách trình bày của ứng dụng.
