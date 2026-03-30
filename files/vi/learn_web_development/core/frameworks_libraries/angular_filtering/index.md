---
title: Lọc các mục việc cần làm
slug: Learn_web_development/Core/Frameworks_libraries/Angular_filtering
page-type: learn-module-chapter
sidebar: learnsidebar
---

{{PreviousMenuNext("Learn_web_development/Core/Frameworks_libraries/Angular_item_component","Learn_web_development/Core/Frameworks_libraries/Angular_building", "Learn_web_development/Core/Frameworks_libraries")}}

Bây giờ hãy tiến đến việc thêm chức năng cho phép người dùng lọc các mục việc cần làm, để họ có thể xem các mục đang hoạt động, đã hoàn thành, hoặc tất cả các mục.

<table>
  <tbody>
    <tr>
      <th scope="row">Điều kiện tiên quyết:</th>
      <td>
        Quen thuộc với các ngôn ngữ cốt lõi <a href="/en-US/docs/Learn_web_development/Core/Structuring_content">HTML</a>,
        <a href="/en-US/docs/Learn_web_development/Core/Styling_basics">CSS</a>, và
        <a href="/en-US/docs/Learn_web_development/Core/Scripting">JavaScript</a>,
        kiến thức về
        <a
          href="/en-US/docs/Learn_web_development/Getting_started/Environment_setup/Command_line"
          >terminal/command line</a
        >.
      </td>
    </tr>
    <tr>
      <th scope="row">Mục tiêu:</th>
      <td>Thêm chức năng lọc vào ứng dụng.</td>
    </tr>
  </tbody>
</table>

## Code lọc của chúng ta

Việc lọc các mục được xây dựng dựa trên thuộc tính `filter`, mà bạn đã thêm trước đó vào `app.component.ts`:

```ts
export class AppComponent {
  // …
  filter: "all" | "active" | "done" = "all";
  // …
}
```

Giá trị mặc định cho filter là `all`, nhưng nó cũng có thể là `active` hoặc `done`.

## Thêm điều khiển bộ lọc

Trong `app.component.html`, hãy thêm HTML sau bên dưới nút **Thêm** nhưng bên trên phần liệt kê các mục.
Trong đoạn trích sau, các phần hiện có trong HTML của bạn được đặt trong comment để bạn có thể thấy chính xác nơi đặt các nút.

```html
<!-- <button class="btn-primary" (click)="addItem(newItem.value)">Add</button>
 -->

<!-- Buttons that show all, still to do, or done items on click -->
<div class="btn-wrapper">
  <button
    class="btn btn-menu"
    [class.active]="filter === 'all'"
    (click)="filter = 'all'">
    All
  </button>

  <button
    class="btn btn-menu"
    [class.active]="filter === 'active'"
    (click)="filter = 'active'">
    To Do
  </button>

  <button
    class="btn btn-menu"
    [class.active]="filter === 'done'"
    (click)="filter = 'done'">
    Done
  </button>
</div>

<!-- <h2>\{{items.length}} item(s)</h2>
         <ul>... -->
```

Nhấp vào các nút sẽ thay đổi các giá trị `filter`, xác định các `items` hiển thị cũng như các kiểu dáng mà Angular áp dụng cho nút đang hoạt động.

- Nếu người dùng nhấp vào nút **Tất cả**, tất cả các mục sẽ hiển thị.
- Nếu người dùng nhấp vào nút **Đang làm**, chỉ các mục có giá trị `done` là `false` mới hiển thị.
- Nếu người dùng nhấp vào nút **Đã xong**, chỉ các mục có giá trị `done` là `true` mới hiển thị.

Ràng buộc thuộc tính class, sử dụng dấu ngoặc vuông, `[]`, kiểm soát màu văn bản của các nút.
Ràng buộc class, `[class.active]`, áp dụng class `active` khi giá trị của `filter` khớp với biểu thức.
Ví dụ, khi người dùng nhấp vào nút **Đã xong**, đặt giá trị `filter` thành `done`, biểu thức ràng buộc class là `filter === 'done'` được đánh giá là `true`.
Khi giá trị `filter` là `done`, Angular áp dụng class `active` cho nút **Đã xong** để làm màu văn bản thành màu xanh lá.
Ngay khi người dùng nhấp vào một trong các nút khác, giá trị `filter` không còn là `done` nữa, vì vậy màu văn bản xanh lá không còn áp dụng nữa.

## Tóm tắt

Thật nhanh! Vì bạn đã có code `filter` trong `app.component.ts`, tất cả những gì bạn phải làm là chỉnh sửa mẫu để cung cấp các điều khiển lọc cho các mục. Bài viết tiếp theo — và cuối cùng — xem xét cách xây dựng ứng dụng Angular sẵn sàng cho môi trường sản xuất, và cung cấp thêm tài nguyên để tiếp tục hành trình học tập của bạn.

{{PreviousMenuNext("Learn_web_development/Core/Frameworks_libraries/Angular_item_component","Learn_web_development/Core/Frameworks_libraries/Angular_building", "Learn_web_development/Core/Frameworks_libraries")}}
