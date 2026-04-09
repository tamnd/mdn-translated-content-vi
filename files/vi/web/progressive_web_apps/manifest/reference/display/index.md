---
title: display
slug: Web/Progressive_web_apps/Manifest/Reference/display
page-type: web-manifest-member
browser-compat: manifests.webapp.display
sidebar: pwasidebar
---

Member manifest `display` được dùng để chỉ định chế độ hiển thị ưu tiên của bạn cho ứng dụng web. Chế độ hiển thị quyết định mức độ giao diện trình duyệt được hiển thị cho người dùng khi ứng dụng được khởi chạy trong ngữ cảnh của hệ điều hành. Bạn có thể chọn hiển thị toàn bộ giao diện trình duyệt hoặc ẩn bớt nó để mang lại trải nghiệm giống ứng dụng hơn.

## Cú pháp

```json-nolint
/* Giá trị từ khóa */
"display": "fullscreen"
"display": "standalone"
"display": "minimal-ui"
"display": "browser"
```

### Giá trị

- `display`
  - : Một chuỗi với các giá trị từ khóa. Nếu không được chỉ định, giá trị mặc định `browser` sẽ được dùng. Các giá trị từ khóa gồm:
    - `fullscreen`
      - : Mở ứng dụng với các phần tử giao diện trình duyệt bị ẩn và sử dụng toàn bộ vùng hiển thị sẵn có. Dùng giá trị này cho các ứng dụng mà trải nghiệm toàn màn hình là quan trọng và mong muốn. Ví dụ, hãy dùng nó cho một ứng dụng game có thể chiếm toàn bộ màn hình mà không có bất kỳ điều khiển trình duyệt nào hiển thị, mang lại trải nghiệm chơi game nhập vai hoàn toàn.

        > [!NOTE]
        > Giá trị `fullscreen` của member `display` trong manifest hoạt động tách biệt với [Fullscreen API](/en-US/docs/Web/API/Fullscreen_API). Chế độ hiển thị `fullscreen` thay đổi trạng thái của toàn bộ cửa sổ trình duyệt sang toàn màn hình, trong khi Fullscreen API chỉ làm cho một phần tử cụ thể trong cửa sổ chuyển sang toàn màn hình. Vì vậy, một ứng dụng web có thể ở chế độ hiển thị `fullscreen` trong khi {{DOMxRef("Document.fullscreenElement")}} là `null` và {{DOMxRef("Document.fullscreenEnabled")}} là `false`.

    - `standalone`
      - : Mở ứng dụng để trông và hoạt động như một ứng dụng gốc độc lập. Điều này có thể bao gồm việc ứng dụng có một cửa sổ khác và biểu tượng riêng trong trình khởi chạy ứng dụng. Trình duyệt sẽ loại bỏ các phần tử giao diện như thanh URL nhưng vẫn có thể bao gồm các phần tử khác như thanh trạng thái. Ví dụ, hãy dùng nó cho một ứng dụng quản lý tác vụ mở trong cửa sổ riêng của nó mà không có thanh URL của trình duyệt, nhưng vẫn hiển thị thanh trạng thái của thiết bị cho pin và thông báo, từ đó mang lại trải nghiệm tích hợp.

    - `minimal-ui`
      - : Mở ứng dụng để trông và hoạt động như một ứng dụng độc lập nhưng với một tập tối thiểu các phần tử giao diện để điều hướng. Các phần tử cụ thể có thể thay đổi theo trình duyệt nhưng thường gồm các điều khiển điều hướng như quay lại, tiến tới, tải lại, và có thể cả cách xem URL của ứng dụng. Ngoài ra, trình duyệt có thể bao gồm các phần tử giao diện dành riêng cho nền tảng cung cấp chức năng chia sẻ và in nội dung. Dùng giá trị này cho các ứng dụng mà việc hiển thị một giao diện trình duyệt tối thiểu là có lợi. Ví dụ, hãy dùng nó cho ứng dụng đọc tin tức hoặc ứng dụng đọc chung chỉ hiển thị các điều khiển trình duyệt thiết yếu như nút quay lại và tải lại, mang lại giao diện gọn hơn và ít gây xao nhãng hơn.

    - `browser`
      - : Mở ứng dụng trong một tab trình duyệt hoặc cửa sổ mới thông thường, dùng quy ước mở liên kết theo nền tảng. Dùng giá trị này cho các ứng dụng được thiết kế để dùng trong ngữ cảnh trình duyệt, nơi cần đầy đủ chức năng trình duyệt. Đây là giá trị mặc định nếu không chỉ định chế độ `display`.

## Mô tả

Sau khi trình duyệt áp dụng chế độ `display` cho một {{Glossary("application context")}}, nó trở thành chế độ hiển thị mặc định cho ngữ cảnh duyệt cấp cao nhất. Trình duyệt có thể ghi đè chế độ hiển thị này vì lý do bảo mật hoặc cung cấp cho người dùng cách chuyển sang chế độ `display` khác.

Nếu trình duyệt không hỗ trợ chế độ hiển thị đã chỉ định, nó sẽ đi theo chuỗi dự phòng định sẵn: `fullscreen` → `standalone` → `minimal-ui` → `browser`.

Tính năng media {{cssxref("@media/display-mode", "display-mode")}} có thể được dùng để cấu hình kiểu ứng dụng và các hành vi khác dựa trên chế độ `display` hiện tại. Điều này có thể giúp mang lại trải nghiệm nhất quán bất kể website được khởi chạy từ URL hay từ biểu tượng trên máy tính để bàn.

> [!NOTE]
> Giá trị của media feature `display-mode` phản ánh chế độ `display` thực tế đang được trình duyệt dùng.
> Điều này có thể khác với chế độ được yêu cầu trong manifest, vì trình duyệt có thể không hỗ trợ chế độ đó.

Như minh họa trong mã bên dưới, bạn có thể điều chỉnh kiểu của ứng dụng tùy theo `display-mode` được dùng.

```css
@media (display-mode: standalone) {
  body {
    background-color: #f0f0f0; /* Nền xám nhạt cho chế độ standalone */
  }
}

@media (display-mode: fullscreen) {
  body {
    background-color: black; /* Nền đen cho chế độ fullscreen */
  }
}
```

## Ví dụ

### Chỉ định chế độ hiển thị standalone

Ví dụ manifest sau cho ứng dụng web tên "HackerWeb" xác định cách ứng dụng sẽ trông và hoạt động khi được cài trên thiết bị của người dùng. Member `display` được đặt thành `standalone`, cho biết ứng dụng sẽ mở trong một cửa sổ riêng mà không có các phần tử giao diện trình duyệt thông thường như thanh URL.

```json
{
  "name": "HackerWeb",
  "short_name": "HackerWeb",
  "start_url": "/index.html",
  "display": "standalone",
  "background_color": "white",
  "description": "Một ứng dụng Hacker News dễ đọc",
  "icons": [
    {
      "src": "images/icons/homescreen192.png",
      "sizes": "192x192",
      "type": "image/png"
    }
  ]
}
```

## Đặc tả

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
