---
title: description
slug: Web/Progressive_web_apps/Manifest/Reference/description
page-type: web-manifest-member
browser-compat: manifests.webapp.description
sidebar: pwasidebar
---

Thành viên manifest `description` được dùng để giải thích các tính năng hoặc chức năng cốt lõi của ứng dụng web của bạn.
Văn bản này giúp người dùng hiểu mục đích của ứng dụng khi xem nó trong cửa hàng ứng dụng.

> [!NOTE]
> Member `description` là tùy chọn, và cửa hàng ứng dụng có thể không dùng văn bản này khi hiển thị ứng dụng của bạn.

## Cú pháp

```json-nolint
"description": "Theo dõi các tác vụ hằng ngày và lập kế hoạch dự án hiệu quả."
```

### Giá trị

- `description`
  - : Một chuỗi mô tả ứng dụng web của bạn.

## Mô tả

Member `description` là metadata bổ sung không ảnh hưởng đến hành vi chạy của ứng dụng hoặc cách trình duyệt hiển thị ứng dụng.
Giá trị của nó được dùng trong cửa hàng ứng dụng và các nền tảng phân phối khác để giúp người dùng hiểu ứng dụng của bạn làm gì.
Ngoài ra, nó còn cung cấp một mô tả có thể truy cập cho ứng dụng đã cài đặt.

## Ví dụ

### Thêm mô tả cho một ứng dụng web lập kế hoạch bữa ăn

Mô tả `description` đơn giản bằng ngôn ngữ từ trái sang phải:

```json
{
  "name": "Meal Planner",
  "description": "Lên kế hoạch cho bữa ăn hằng tuần và tự động tạo danh sách mua sắm. Theo dõi dinh dưỡng và khám phá công thức."
}
```

## Đặc tả

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
