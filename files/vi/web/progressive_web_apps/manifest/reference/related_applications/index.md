---
title: related_applications
slug: Web/Progressive_web_apps/Manifest/Reference/related_applications
page-type: web-manifest-member
status:
  - experimental
browser-compat: manifests.webapp.related_applications
sidebar: pwasidebar
---

{{SeeCompatTable}}

Member `related_applications` được dùng để chỉ định một hoặc nhiều ứng dụng có liên quan đến ứng dụng web của bạn. Đây có thể là các ứng dụng đặc thù theo nền tảng hoặc Progressive Web Apps.

Điều này cho phép bạn dùng các web API như {{domxref("Navigator.getInstalledRelatedApps()")}} để kiểm tra xem một phiên bản dành cho nền tảng của ứng dụng web của bạn, hoặc chính ứng dụng web của bạn, đã được cài đặt trên thiết bị hay chưa.

Member `related_applications` cũng có thể được dùng cùng với member [`prefer_related_applications`](/en-US/docs/Web/Progressive_web_apps/Manifest/Reference/prefer_related_applications), để chỉ ra ưu tiên cài đặt ứng dụng gốc liên quan hoặc ứng dụng web của bạn.

## Cú pháp

```json-nolint
/* Ứng dụng gốc liên quan trên một nền tảng được chỉ định bởi cả url và id */
"related_applications": [
  {
    "platform": "play",
    "url": "https://play.google.com/store/apps/details?id=com.example.app1",
    "id": "com.example.app1"
  }
]

/* Ứng dụng gốc liên quan trên một nền tảng được chỉ định chỉ bởi id */
"related_applications": [
  {
    "platform": "windows",
    "id": "example.app1"
  }
]

/* Ứng dụng gốc liên quan trên hai nền tảng */
"related_applications": [
  {
    "platform": "play",
    "url": "https://play.google.com/store/apps/details?id=com.example.app1",
    "id": "com.example.app1"
  },
  {
    "platform": "amazon",
    "url": "https://www.amazon.com/product/dp/B000XA1000"
  }
]

/* Ứng dụng web liên quan được chỉ định bởi id */
"related_applications": [
  {
    "platform": "webapp",
    "id": "com.example.app1"
  }
]
```

### Giá trị

- `related_applications`
  - : Một mảng các đối tượng, mỗi đối tượng đại diện cho một ứng dụng đặc thù nền tảng liên quan tới ứng dụng web. Mỗi đối tượng phải bao gồm thuộc tính `platform` và `url` hoặc `id` (hoặc cả hai).
    - `platform`
      - : Một chuỗi xác định nền tảng mà ứng dụng có thể được tìm thấy.
        Ví dụ gồm `amazon` (Amazon App Store), `play` (Google Play Store), `windows` (Windows Store), và `webapp` (cho Progressive Web Apps).
        Xem danh sách đầy đủ các [giá trị platform](https://github.com/w3c/manifest/wiki/Platforms).
    - `url` {{Optional_Inline}}
      - : Một chuỗi đại diện cho URL nơi ứng dụng đặc thù nền tảng có thể được tìm thấy.
        Nếu không chỉ định, phải cung cấp `id`.
    - `id` {{Optional_Inline}}
      - : Một chuỗi với ID dùng để đại diện cho ứng dụng trên nền tảng đã chỉ định.
        Nếu không chỉ định, phải cung cấp `url`.

## Mô tả

Một "ứng dụng liên quan" là chính ứng dụng web, khi được cài như một Progressive Web App (PWA), hoặc một ứng dụng {{Glossary("native")}} cung cấp chức năng tương tự ứng dụng web của bạn, thường có thêm tính năng hoặc tích hợp tốt hơn với thiết bị của người dùng.

Member `related_applications` cho phép bạn xác định các ứng dụng đặc thù nền tảng có liên quan đến ứng dụng web của bạn.
Ví dụ, giả sử bạn có một ứng dụng Android gốc cho sản phẩm của mình có sẵn qua Google Play Store.
Nó cung cấp cùng các tính năng cốt lõi như ứng dụng web của bạn và tích hợp tốt hơn với hệ thống thông báo của thiết bị.
Bạn có thể dùng `related_applications` để chỉ định ứng dụng Android gốc này trong tệp manifest của ứng dụng web.

Một vài điểm chính về member `related_applications` gồm:

- Nó cho phép bạn chỉ định nhiều ứng dụng liên quan trên các nền tảng khác nhau, mang lại cho người dùng các lựa chọn ứng dụng gốc trên nhiều thiết bị và hệ điều hành.
- Nó tạo ra một quan hệ một chiều giữa ứng dụng web của bạn và nền tảng đã chỉ định.
  Các ứng dụng gốc không bắt buộc phải tham chiếu ngược lại ứng dụng web của bạn.
- Dữ liệu có thể được dùng bởi các trình thu thập web để thu thập thêm thông tin về các ứng dụng gốc liên quan tới ứng dụng web của bạn, từ đó có thể cải thiện khả năng được tìm thấy của các ứng dụng này.
- Khi được dùng cùng member [`prefer_related_applications`](/en-US/docs/Web/Progressive_web_apps/Manifest/Reference/prefer_related_applications) đặt thành `true`, nó cho phép trình duyệt gợi ý cài đặt ứng dụng gốc liên quan thay vì ứng dụng web của bạn.

  > [!NOTE]
  > Với các trình duyệt dựa trên Chromium, `prefer_related_applications` nên được đặt thành `false` hoặc bỏ qua để ứng dụng web của bạn có thể cài đặt được.

## Ví dụ

### Chỉ định một ứng dụng gốc liên quan

Ví dụ này cho thấy cách chỉ định một ứng dụng Android gốc liên quan trong tệp manifest của ứng dụng web. Nó chỉ dùng thông tin tối thiểu để xác định ứng dụng gốc có sẵn trên Google Play Store:

```json
{
  "related_applications": [
    {
      "platform": "play",
      "id": "com.example.app1"
    }
  ]
}
```

### Chỉ định các ứng dụng gốc liên quan trên nhiều nền tảng

Nếu các phiên bản gốc của ứng dụng web của bạn có sẵn trên cả Google Play Store và Windows Store, bạn có thể chỉ định chúng trong tệp manifest như sau:

```json
{
  "related_applications": [
    {
      "platform": "play",
      "url": "https://play.google.com/store/apps/details?id=com.example.app1",
      "id": "com.example.app1"
    },
    {
      "platform": "windows",
      "url": "https://apps.microsoft.com/store/detail/example-app1/9WZDNCRFHVJL"
    }
  ]
}
```

### Chỉ định ưu tiên cài đặt ứng dụng gốc liên quan

Nếu bạn muốn cho trình duyệt biết rằng bạn muốn người dùng được đưa ra tùy chọn cài đặt ứng dụng gốc của bạn, có sẵn trên Google App Store, thay vì ứng dụng web, bạn có thể đặt `prefer_related_applications` thành `true`. Khi đó, trình duyệt có thể nhắc người dùng cài đặt ứng dụng Android gốc thay vì ứng dụng web của bạn.

```json
{
  "prefer_related_applications": true,
  "related_applications": [
    {
      "platform": "play",
      "id": "com.example.app1"
    }
  ]
}
```

### Chỉ định một ứng dụng web liên quan

Nếu ứng dụng web của bạn có thể được cài dưới dạng Progressive Web App (PWA) trên thiết bị, ví dụ để tận dụng các tính năng tích hợp PWA vào hệ điều hành, bạn có thể tự tham chiếu ứng dụng web của mình trong tệp manifest:

```json
{
  "related_applications": [
    {
      "platform": "webapp",
      "id": "com.example.app1"
    }
  ]
}
```

## Đặc tả

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [`prefer_related_applications`](/en-US/docs/Web/Progressive_web_apps/Manifest/Reference/prefer_related_applications) manifest member
- [The web app manifest](/en-US/docs/Web/Progressive_web_apps/Guides/Making_PWAs_installable#the_web_app_manifest) để làm cho ứng dụng web của bạn có thể cài đặt
- {{domxref("Navigator.getInstalledRelatedApps()")}} để kiểm tra xem phiên bản đặc thù nền tảng liên quan của ứng dụng web, hoặc chính ứng dụng web, đã được cài hay chưa.
