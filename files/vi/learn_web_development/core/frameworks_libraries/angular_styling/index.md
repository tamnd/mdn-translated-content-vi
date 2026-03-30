---
title: Tạo kiểu dáng cho ứng dụng Angular
slug: Learn_web_development/Core/Frameworks_libraries/Angular_styling
page-type: learn-module-chapter
sidebar: learnsidebar
---

{{PreviousMenuNext("Learn_web_development/Core/Frameworks_libraries/Angular_todo_list_beginning","Learn_web_development/Core/Frameworks_libraries/Angular_item_component", "Learn_web_development/Core/Frameworks_libraries")}}

Bây giờ chúng ta đã thiết lập cấu trúc ứng dụng cơ bản và bắt đầu hiển thị nội dung hữu ích, hãy đổi hướng và dành một bài viết để xem xét cách Angular xử lý việc tạo kiểu dáng cho các ứng dụng.

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
      <td>Tìm hiểu cách tạo kiểu dáng cho ứng dụng Angular.</td>
    </tr>
  </tbody>
</table>

## Thêm một số kiểu dáng cho Angular

Angular CLI tạo ra hai loại file kiểu dáng:

- Kiểu dáng thành phần: Angular CLI cung cấp cho mỗi thành phần file kiểu dáng riêng của nó.
  Các kiểu dáng trong file này chỉ áp dụng cho thành phần của nó.
- `styles.css`: Trong thư mục `src`, các kiểu dáng trong file này áp dụng cho toàn bộ ứng dụng của bạn trừ khi bạn chỉ định kiểu dáng ở cấp độ thành phần.

Tùy thuộc vào việc bạn có sử dụng bộ tiền xử lý CSS hay không, phần mở rộng trên các file CSS của bạn có thể thay đổi.
Angular hỗ trợ CSS thuần, SCSS, Sass và Less.

Trong `src/styles.css`, hãy dán các kiểu dáng sau:

```css
body {
  font-family: "Helvetica", "Arial", sans-serif;
}

.btn-wrapper {
  /* flexbox */
  display: flex;
  flex-wrap: nowrap;
  justify-content: space-between;
}

.btn {
  color: black;
  background-color: white;
  border: 2px solid #cecece;
  padding: 0.35rem 1rem 0.25rem 1rem;
  font-size: 1rem;
}

.btn:hover {
  background-color: #ecf2fd;
}

.btn:active {
  background-color: #d1e0fe;
}

.btn:focus {
  outline: none;
  border: black solid 2px;
}

.btn-primary {
  color: white;
  background-color: black;
  width: 100%;
  padding: 0.75rem;
  font-size: 1.3rem;
  border: black solid 2px;
  margin: 1rem 0;
}

.btn-primary:hover {
  background-color: #444242;
}

.btn-primary:focus {
  color: black;
  outline: none;
  border: black solid 2px;
  background-color: #d7ecff;
}

.btn-primary:active {
  background-color: #212020;
}
```

CSS trong `src/styles.css` áp dụng cho toàn bộ ứng dụng, tuy nhiên, các kiểu dáng này không ảnh hưởng đến mọi thứ trên trang.
Bước tiếp theo là thêm các kiểu dáng áp dụng riêng cho `AppComponent`.

Trong `app.component.css`, hãy thêm các kiểu dáng sau:

```css
.main {
  max-width: 500px;
  width: 85%;
  margin: 2rem auto;
  padding: 1rem;
  text-align: center;
  box-shadow:
    0 2px 4px 0 rgb(0 0 0 / 20%),
    0 2.5rem 5rem 0 rgb(0 0 0 / 10%);
}

@media screen and (width >= 600px) {
  .main {
    width: 70%;
  }
}

label {
  font-size: 1.5rem;
  font-weight: bold;
  display: block;
  padding-bottom: 1rem;
}

.lg-text-input {
  width: 100%;
  padding: 1rem;
  border: 2px solid black;
  display: block;
  box-sizing: border-box;
  font-size: 1rem;
}

.btn-wrapper {
  margin-bottom: 2rem;
}

.btn-menu {
  flex-basis: 32%;
}

.active {
  color: green;
}

ul {
  padding-inline-start: 0;
}

ul li {
  list-style: none;
}
```

Bước cuối cùng là xem lại trình duyệt của bạn và xem kiểu dáng đã được cập nhật như thế nào. Mọi thứ bây giờ trông có vẻ hợp lý hơn một chút.

## Tóm tắt

Bây giờ phần giới thiệu ngắn về việc tạo kiểu dáng trong Angular đã hoàn thành, hãy quay lại tạo chức năng ứng dụng của chúng ta. Trong bài viết tiếp theo, chúng ta sẽ tạo một thành phần phù hợp cho các mục việc cần làm, và làm cho bạn có thể đánh dấu, chỉnh sửa và xóa các mục việc cần làm.

{{PreviousMenuNext("Learn_web_development/Core/Frameworks_libraries/Angular_todo_list_beginning","Learn_web_development/Core/Frameworks_libraries/Angular_item_component", "Learn_web_development/Core/Frameworks_libraries")}}
