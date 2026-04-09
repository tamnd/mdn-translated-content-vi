---
title: short_name
slug: Web/Progressive_web_apps/Manifest/Reference/short_name
page-type: web-manifest-member
browser-compat: manifests.webapp.short_name
sidebar: pwasidebar
---

Thành viên manifest `short_name` được dùng để chỉ định một tên ngắn cho ứng dụng web của bạn, tên này có thể được dùng khi [`name`](/en-US/docs/Web/Progressive_web_apps/Manifest/Reference/name) đầy đủ quá dài so với không gian sẵn có.

## Cú pháp

```json-nolint
/* Tên ngắn của ứng dụng web */
"short_name": "TaskPlanner"
"short_name": "RecipePantry"
```

### Giá trị

- `short_name`
  - : Một chuỗi xác định phiên bản ngắn của [`name`](/en-US/docs/Web/Progressive_web_apps/Manifest/Reference/name) của ứng dụng web.

## Mô tả

Trình duyệt có thể dùng `short_name` thay cho [`name`](/en-US/docs/Web/Progressive_web_apps/Manifest/Reference/name) khi không đủ không gian để hiển thị tên đầy đủ, chẳng hạn trên màn hình chính của thiết bị, trong trình chuyển ứng dụng, hoặc trong các ngữ cảnh bị giới hạn không gian khác.

Hãy ghi nhớ các điểm sau khi chọn tên ngắn cho ứng dụng web của bạn:

- Nó nên là phiên bản ngắn gọn của `name` ứng dụng.
- Dù ưu tiên ngắn gọn, nó vẫn nên dễ nhận ra và có ý nghĩa.
- Hãy cân nhắc cách nó xuất hiện trong các ngữ cảnh bị giới hạn không gian.
- Tuân theo các hướng dẫn tương tự về tính phù hợp văn hóa và thương hiệu như với `name`.

## Ví dụ

### Thêm tên ngắn cho ứng dụng web của bạn

Hãy xét một ứng dụng web giúp người dùng lập kế hoạch và ghi lại các chuyến đi bộ đường dài. `name` đã được xác định là `Trail Navigator`. Có thể thêm `short_name` vào manifest như sau:

```json
{
  "name": "Trail Navigator",
  "short_name": "TrailNav"
}
```

Tên ngắn `TrailNav` của ứng dụng vừa gọn vừa phù hợp trong các ngữ cảnh ít không gian. Nó vẫn gắn với tên đầy đủ của ứng dụng và dễ nhớ.

## Đặc tả

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [`name`](/en-US/docs/Web/Progressive_web_apps/Manifest/Reference/name) manifest member
- [The web app manifest](/en-US/docs/Web/Progressive_web_apps/Guides/Making_PWAs_installable#the_web_app_manifest) để làm cho ứng dụng web của bạn có thể cài đặt
