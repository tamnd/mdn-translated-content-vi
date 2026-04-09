---
title: name
slug: Web/Progressive_web_apps/Manifest/Reference/name
page-type: web-manifest-member
browser-compat: manifests.webapp.name
sidebar: pwasidebar
---

Thành viên manifest `name` được dùng để chỉ định tên đầy đủ của ứng dụng web của bạn như nó thường được hiển thị cho người dùng, chẳng hạn trong danh sách ứng dụng hoặc làm nhãn cho biểu tượng ứng dụng của bạn.

## Cú pháp

```json-nolint
/* Tên đầy đủ của ứng dụng web */
"name": "Daily Task Planner"
"name": "Recipe and Pantry Tracker"
```

### Giá trị

- `name`
  - : Một chuỗi xác định tên đầy đủ của ứng dụng web của bạn.

## Mô tả

Member `name` đóng vai trò là {{Glossary("Accessible_name", "accessible name")}} cho ứng dụng đã cài đặt của bạn. Nó được hiển thị cho người dùng trong nhiều ngữ cảnh khác nhau, chẳng hạn trong danh sách các ứng dụng web đã cài đặt khác, làm nhãn cho biểu tượng ứng dụng của bạn, hoặc trong trình chuyển ứng dụng hay trình quản lý tác vụ.

Trong các ngữ cảnh bị giới hạn không gian mà tên `name` đầy đủ không vừa, chẳng hạn trên màn hình chính của thiết bị hoặc trong trình chuyển ứng dụng, giá trị của thuộc tính [`short_name`](/en-US/docs/Web/Progressive_web_apps/Manifest/Reference/short_name) (nếu được định nghĩa) có thể được dùng thay thế.

### Thực hành tốt nhất khi đặt tên cho ứng dụng web của bạn

Hãy cân nhắc các yếu tố sau khi chọn tên cho ứng dụng web của bạn:

- Độ dài của tên, đặc biệt nếu bạn không cung cấp `short_name` riêng
- Tên đó thể hiện tốt mục đích hoặc bản chất của ứng dụng đến mức nào
- Nó có rõ ràng, dễ hiểu và dễ nhớ hay không
- Nó xuất hiện như thế nào trong các ngữ cảnh khác nhau, chẳng hạn trong danh sách ứng dụng hoặc trên màn hình chính
- Nó có thể được phân biệt với các ứng dụng tương tự khác dễ đến mức nào
- Tính nhạy cảm văn hóa và sự phù hợp với đối tượng mục tiêu
- Nó dịch sang ngôn ngữ khác hoặc được cảm nhận như thế nào ở các ngôn ngữ khác, nếu ứng dụng nhắm tới đối tượng toàn cầu
- Khả năng xung đột nhãn hiệu

## Ví dụ

### Thêm tên cho ứng dụng web của bạn

Với một ứng dụng web giúp người dùng điều hướng đường mòn và lập kế hoạch cho các chuyến đi bộ đường dài, bạn có thể thêm `name` sau vào manifest của ứng dụng:

```json
{
  "name": "Trail Navigator"
}
```

Tên ứng dụng `Trail Navigator` mô tả hiệu quả mục đích của ứng dụng, dễ đọc và dễ nhớ, và nhiều khả năng được nhiều đối tượng hiểu.

Nếu muốn, bạn cũng có thể thêm `short_name`:

```json
{
  "name": "Trail Navigator",
  "short_name": "TrailNav"
}
```

## Đặc tả

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [`short_name`](/en-US/docs/Web/Progressive_web_apps/Manifest/Reference/short_name) manifest member
- [The web app manifest](/en-US/docs/Web/Progressive_web_apps/Guides/Making_PWAs_installable#the_web_app_manifest) để làm cho ứng dụng web của bạn có thể cài đặt
