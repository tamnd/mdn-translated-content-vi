---
title: prefer_related_applications
slug: Web/Progressive_web_apps/Manifest/Reference/prefer_related_applications
page-type: web-manifest-member
status:
  - experimental
browser-compat: manifests.webapp.prefer_related_applications
sidebar: pwasidebar
---

{{SeeCompatTable}}

Thành viên manifest `prefer_related_applications` được dùng để cung cấp một gợi ý cho trình duyệt về việc có nên ưu tiên cài đặt các ứng dụng gốc được chỉ định trong member [`related_applications`](/en-US/docs/Web/Progressive_web_apps/Manifest/Reference/related_applications) thay vì ứng dụng web của bạn hay không.

## Cú pháp

```json-nolint
/* Giá trị boolean */
"prefer_related_applications": true
"prefer_related_applications": false
```

### Giá trị

- `prefer_related_applications`
  - : Một giá trị boolean:
    - Nếu đặt `true`, trình duyệt có thể nhắc người dùng cài đặt một trong các ứng dụng được liệt kê trong [`related_applications`](/en-US/docs/Web/Progressive_web_apps/Manifest/Reference/related_applications) thay vì ứng dụng web của bạn.
    - Nếu đặt `false` hoặc bỏ qua, trình duyệt sẽ ưu tiên cài đặt ứng dụng web của bạn hơn các ứng dụng gốc liên quan.
      > [!NOTE]
      > Với các trình duyệt dựa trên Chromium, `prefer_related_applications` nên được đặt thành `false` hoặc bỏ qua để ứng dụng web của bạn có thể cài đặt được.

## Ví dụ

### Chỉ định ưu tiên cài đặt ứng dụng web của bạn

Giả sử bạn có cả một ứng dụng web và các ứng dụng gốc cho sản phẩm của mình trên Google Play Store và Windows Store. Nếu bạn muốn cung cấp các ứng dụng gốc liên quan như các lựa chọn thay thế nhưng vẫn ưu tiên người dùng cài đặt ứng dụng web của bạn, bạn có thể cấu hình manifest như bên dưới. Trình duyệt sẽ quảng bá ứng dụng web của bạn để cài đặt. Các ứng dụng gốc vẫn sẽ là lựa chọn thay thế.

```json
{
  "prefer_related_applications": false,
  "related_applications": [
    {
      "platform": "play",
      "id": "com.example.hiking-app"
    },
    {
      "platform": "windows",
      "url": "https://apps.microsoft.com/detail/9nqx6sv74srz"
    }
  ]
}
```

### Chỉ định ưu tiên cài đặt ứng dụng gốc liên quan

Để khuyến khích người dùng cài đặt ứng dụng Android gốc của bạn từ Google Play Store thay vì ứng dụng web, bạn có thể cấu hình manifest của ứng dụng web như bên dưới.

```json
{
  "prefer_related_applications": true,
  "related_applications": [
    {
      "platform": "play",
      "id": "com.example.hiking-app"
    }
  ]
}
```

## Đặc tả

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [`related_applications`](/en-US/docs/Web/Progressive_web_apps/Manifest/Reference/related_applications) manifest member
- [The web app manifest](/en-US/docs/Web/Progressive_web_apps/Guides/Making_PWAs_installable#the_web_app_manifest) để làm cho ứng dụng web của bạn có thể cài đặt
