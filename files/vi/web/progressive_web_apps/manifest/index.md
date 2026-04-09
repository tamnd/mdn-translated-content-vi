---
title: Tệp kê khai ứng dụng web
short-title: Web app manifest
slug: Web/Progressive_web_apps/Manifest
page-type: landing-page
browser-compat: manifests.webapp
sidebar: pwasidebar
---

**Tệp kê khai ứng dụng web** được định nghĩa trong đặc tả [Web Application Manifest](https://w3c.github.io/manifest/) là một tệp văn bản {{Glossary("JSON")}} cung cấp thông tin về một ứng dụng web.

Cách dùng phổ biến nhất của tệp kê khai ứng dụng web là cung cấp thông tin mà trình duyệt cần để cài đặt một [progressive web app](/en-US/docs/Web/Progressive_web_apps) (PWA) lên thiết bị, chẳng hạn tên và biểu tượng của ứng dụng.

Tệp kê khai ứng dụng web chứa một đối tượng JSON duy nhất, trong đó các khóa cấp cao nhất được gọi là _members_.

## Members

Phần này liệt kê các [trang tham chiếu cho các thành viên manifest](/en-US/docs/Web/Progressive_web_apps/Manifest/Reference) được tài liệu hóa trên MDN.
Trong đặc tả, mọi member đều là tùy chọn, nhưng một số ứng dụng yêu cầu phải có một số member nhất định. Ví dụ, [PWA phải cung cấp một số member manifest nhất định](/en-US/docs/Web/Progressive_web_apps/Guides/Making_PWAs_installable#required_manifest_members).

{{ListSubpages("/en-US/docs/Web/Progressive_web_apps/Manifest/Reference")}}

> [!NOTE]
> Các member `dir`, `lang`, và `iarc_rating_id` chưa được triển khai.

## Ví dụ manifest

```json
{
  "short_name": "MDN",
  "name": "MDN Web Docs",
  "icons": [
    {
      "src": "/favicon-192x192.png",
      "sizes": "192x192",
      "type": "image/png"
    },
    {
      "src": "/favicon-512x512.png",
      "sizes": "512x512",
      "type": "image/png"
    }
  ],
  "start_url": ".",
  "display": "standalone",
  "theme_color": "black",
  "background_color": "white"
}
```

## Triển khai manifest

Tệp kê khai ứng dụng web được triển khai trong các trang HTML của bạn bằng phần tử {{HTMLElement("link")}} trong {{HTMLElement("head")}} của tài liệu:

```html
<link rel="manifest" href="manifest.json" />
```

Phần mở rộng `.webmanifest` được nêu trong phần [Media type registration](https://w3c.github.io/manifest/#media-type-registration) của đặc tả (phản hồi của tệp manifest nên trả về `Content-Type: application/manifest+json`). Trình duyệt nói chung cũng hỗ trợ các manifest với các phần mở rộng phù hợp khác như `.json` (`Content-Type: application/json`).

Nếu manifest cần thông tin xác thực để tải, thuộc tính [`crossorigin`](/en-US/docs/Web/HTML/Reference/Attributes/crossorigin) phải được đặt thành `use-credentials`, ngay cả khi tệp manifest nằm cùng origin với trang hiện tại.

```html
<link rel="manifest" href="/app.webmanifest" crossorigin="use-credentials" />
```

## Màn hình chào

Trong một số trình duyệt và hệ điều hành, màn hình chào được hiển thị khi một PWA đã cài đặt được khởi chạy. Màn hình chào này được tự động tạo và diện mạo của nó được xác định bởi các member trong tệp kê khai ứng dụng web, cụ thể là:

- [`name`](/en-US/docs/Web/Progressive_web_apps/Manifest/Reference/name)
- [`background_color`](/en-US/docs/Web/Progressive_web_apps/Manifest/Reference/background_color)
- [`icons`](/en-US/docs/Web/Progressive_web_apps/Manifest/Reference/icons)

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Progressive Web Apps (PWAs)](/en-US/docs/Web/Progressive_web_apps)
