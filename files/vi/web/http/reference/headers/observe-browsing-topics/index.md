---
title: Observe-Browsing-Topics header
short-title: Observe-Browsing-Topics
slug: Web/HTTP/Reference/Headers/Observe-Browsing-Topics
page-type: http-header
status:
  - deprecated
  - non-standard
browser-compat: http.headers.Observe-Browsing-Topics
sidebar: http
---

{{non-standard_header}}{{deprecated_header}}

> [!WARNING]
> Tính năng này hiện đang bị phản đối bởi hai nhà cung cấp trình duyệt. Xem phần [Vị trí tiêu chuẩn](/en-US/docs/Web/API/Topics_API#standards_positions) để biết chi tiết về sự phản đối.

Tiêu đề HTTP **`Observe-Browsing-Topics`** {{Glossary("response header")}} được sử dụng để đánh dấu các chủ đề quan tâm được suy luận từ URL của trang web gọi (tức là trang web nơi ad tech {{HTMLElement("iframe")}} được nhúng) là đã quan sát trong phản hồi cho yêu cầu được tạo bởi [tính năng cho phép Topics API](/en-US/docs/Web/API/Topics_API/Using#what_api_features_enable_the_topics_api).
Trình duyệt sau đó sẽ sử dụng những chủ đề đó để tính toán các chủ đề hàng đầu cho người dùng hiện tại cho các epoch trong tương lai.

Xem [Sử dụng Topics API](/en-US/docs/Web/API/Topics_API/Using) để biết thêm chi tiết.

<table class="properties">
  <tbody>
    <tr>
      <th scope="row">Loại tiêu đề</th>
      <td>
        {{Glossary("Response header")}}
      </td>
    </tr>
  </tbody>
</table>

## Cú pháp

```http
Observe-Browsing-Topics: ?1
```

### Chỉ thị

- `?1`
  - : Chuỗi ký tự khai báo rằng các chủ đề quan tâm được suy luận từ URL của trang web gọi (tức là trang web nơi ad tech `<iframe>` được nhúng) được đánh dấu là đã quan sát. Trình duyệt sau đó sẽ sử dụng những chủ đề đó để tính toán các chủ đề quan tâm cho người dùng cho các epoch trong tương lai.

## Đặc tả

Tính năng này không phải là một phần của tiêu chuẩn chính thức, mặc dù nó được chỉ định trong [Bản thảo đề xuất không chính thức Topics API](https://patcg-individual-drafts.github.io/topics/).

## Khả năng tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Topics API](/en-US/docs/Web/API/Topics_API)
