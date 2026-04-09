---
title: categories
slug: Web/Progressive_web_apps/Manifest/Reference/categories
page-type: web-manifest-member
spec-urls: https://w3c.github.io/manifest-app-info/#categories-member
sidebar: pwasidebar
---

Thành viên manifest `categories` cho phép bạn chỉ định một hoặc nhiều phân loại cho ứng dụng web của mình.
Những phân loại này giúp người dùng khám phá ứng dụng của bạn trong các cửa hàng ứng dụng.

> [!NOTE]
> Member `categories` là tùy chọn, và các cửa hàng ứng dụng có thể dùng các giá trị khác nhau khi trình bày ứng dụng của bạn.

## Cú pháp

```json-nolint
/* Một danh mục */
"categories": ["productivity"]

/* Nhiều danh mục */
"categories": ["productivity", "utilities", "social"]
```

### Giá trị

- `categories`
  - : Một mảng các chuỗi được phân tách bằng dấu phẩy, trong đó mỗi chuỗi đại diện cho một tên danh mục.
    Các chuỗi nên ở dạng chữ thường.
    W3C duy trì một [danh sách các danh mục chuẩn hóa](https://github.com/w3c/manifest/wiki/Categories), bao gồm các giá trị phổ biến như `business`, `education`, `entertainment`, `finance`, `games`, và `productivity`.

## Mô tả

Member `categories` là metadata bổ sung, không ảnh hưởng đến hành vi chạy của ứng dụng hoặc cách trình duyệt trình bày ứng dụng.
Giá trị của nó chỉ được dùng trong các cửa hàng ứng dụng và các nền tảng phân phối khác, và không hiển thị cho người dùng trong trình duyệt hoặc ứng dụng đã cài đặt.

Nếu ứng dụng của bạn phục vụ nhiều mục đích, việc chỉ định nhiều danh mục liên quan có thể giúp người dùng khám phá ứng dụng của bạn ở nhiều phần khác nhau của cửa hàng ứng dụng.

Nếu `categories` không được chỉ định hoặc các giá trị đã chỉ định không được dùng, cửa hàng ứng dụng sẽ phân loại ứng dụng web của bạn theo hệ thống phân loại riêng của họ.

Các hình bên dưới từ Apple App Store cho thấy danh mục xuất hiện như thế nào ở các phần khác nhau của cửa hàng ứng dụng.
Phần tổng quan ứng dụng hiển thị danh mục trong trường "CHART" (được tô nổi) cùng với thứ hạng của ứng dụng trong danh mục đó, và phần Information hiển thị "Category" như một trường riêng biệt (được tô nổi).

- Ứng dụng BBC được phân loại là "News":

  <div style="display: flex; justify-content: center;">
    <img src="bbc.jpeg" alt="Tổng quan ứng dụng BBC trong Apple App Store. Trường CHART được khoanh đỏ để hiển thị danh mục News.">
    <img src="bbc-info.jpeg" alt="Phần Information của ứng dụng BBC với trường Category được khoanh đỏ hiển thị News.">
  </div>

- Ứng dụng Weather Channel được phân loại là "Weather":

  <div style="display: flex; justify-content: center;">
    <img src="weather.jpeg" alt="Tổng quan ứng dụng Weather trong Apple App Store. Trường CHART được khoanh đỏ để hiển thị danh mục Weather">
    <img src="weather-info.jpeg" alt="Phần Information của ứng dụng Weather với trường Category được khoanh đỏ hiển thị Weather">
  </div>

## Ví dụ

### Phân loại một ứng dụng web lập kế hoạch bữa ăn

Ví dụ này cho thấy cách phân loại một ứng dụng web để lập kế hoạch bữa ăn dựa trên nguyên liệu có sẵn:

```json
{
  "name": "Meal Planner",
  "categories": ["food", "health", "lifestyle"]
}
```

## Đặc tả

{{Specifications}}

## Tương thích trình duyệt

Thành viên manifest `categories` được dùng bởi các cửa hàng ứng dụng khi xuất bản và liệt kê ứng dụng web, nên không áp dụng thông tin tương thích trình duyệt.
Mặc dù trình duyệt có thể phân tích member này, nó là tùy chọn và không ảnh hưởng đến chức năng hay cách trình bày của ứng dụng.
