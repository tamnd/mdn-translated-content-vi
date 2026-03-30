---
title: Cấu trúc ứng dụng Ember và chia thành phần
slug: Learn_web_development/Core/Frameworks_libraries/Ember_structure_componentization
page-type: learn-module-chapter
sidebar: learnsidebar
---

{{PreviousMenuNext("Learn_web_development/Core/Frameworks_libraries/Ember_getting_started","Learn_web_development/Core/Frameworks_libraries/Ember_interactivity_events_state", "Learn_web_development/Core/Frameworks_libraries")}}

Trong bài viết này, chúng ta sẽ bắt tay vào lập kế hoạch cấu trúc ứng dụng Ember TodoMVC, thêm HTML cho nó, và sau đó chia cấu trúc HTML đó thành các thành phần.

<table>
  <tbody>
    <tr>
      <th scope="row">Điều kiện tiên quyết:</th>
      <td>
        <p>
          Tối thiểu, nên quen thuộc với các ngôn ngữ cốt lõi
          <a href="/en-US/docs/Learn_web_development/Core/Structuring_content">HTML</a>,
          <a href="/en-US/docs/Learn_web_development/Core/Styling_basics">CSS</a>, và
          <a href="/en-US/docs/Learn_web_development/Core/Scripting">JavaScript</a>, và
          có kiến thức về
          <a
            href="/en-US/docs/Learn_web_development/Getting_started/Environment_setup/Command_line"
            >terminal/command line</a
          >.
        </p>
        <p>
          Hiểu sâu hơn về các tính năng JavaScript hiện đại (chẳng hạn như class,
          mô-đun, v.v.), sẽ rất có lợi, vì Ember sử dụng nhiều chúng.
        </p>
      </td>
    </tr>
    <tr>
      <th scope="row">Mục tiêu:</th>
      <td>
        Tìm hiểu cách cấu trúc ứng dụng Ember, và sau đó chia cấu trúc đó thành các thành phần.
      </td>
    </tr>
  </tbody>
</table>

## Lập kế hoạch bố cục ứng dụng TodoMVC

Trong bài viết cuối, chúng ta đã thiết lập một dự án Ember mới, sau đó thêm và cấu hình các kiểu dáng CSS. Tại thời điểm này, chúng ta thêm một số HTML, lập kế hoạch cấu trúc và ngữ nghĩa của ứng dụng TodoMVC.

HTML trang đích của ứng dụng được định nghĩa trong `app/templates/application.hbs`. Điều này đã tồn tại, và nội dung của nó hiện trông như thế này:

```hbs
\{{!-- The following component displays Ember's default welcome message. --}}
<WelcomePage />
\{{!-- Feel free to remove this! --}}

\{{outlet}}
```

`<WelcomePage />` là một thành phần được cung cấp bởi một addon Ember render trang chào mừng mặc định mà chúng ta thấy trong bài viết trước, khi chúng ta điều hướng đến máy chủ tại `localhost:4200` lần đầu.

Tuy nhiên, chúng ta không muốn điều này. Thay vào đó, chúng ta muốn nó chứa cấu trúc ứng dụng TodoMVC. Để bắt đầu, hãy xóa nội dung của `application.hbs` và thay thế chúng bằng nội dung sau:

```html
<section class="todoapp">
  <h1>todos</h1>
  <input
    class="new-todo"
    aria-label="What needs to be done?"
    placeholder="What needs to be done?"
    autofocus />
</section>
```

> [!NOTE]
> [`aria-label`](/en-US/docs/Web/Accessibility/ARIA/Reference/Attributes/aria-label) cung cấp nhãn cho công nghệ hỗ trợ sử dụng — ví dụ, để trình đọc màn hình đọc to. Điều này hữu ích trong các trường hợp chúng ta có [`<input>`](/en-US/docs/Web/HTML/Reference/Elements/input) được sử dụng mà không có văn bản HTML tương ứng có thể chuyển thành nhãn.

Khi bạn lưu `application.hbs`, máy chủ phát triển bạn đã khởi động trước đó sẽ tự động xây dựng lại ứng dụng và làm mới trình duyệt. Đầu ra được render bây giờ sẽ trông như thế này:

![todo app rendered in the browser with only the new todo input field showing](todos-initial-render.png)

Không cần nhiều nỗ lực để làm cho HTML của chúng ta trông giống ứng dụng danh sách việc cần làm đầy đủ tính năng. Hãy cập nhật lại file `application.hbs` để nội dung của nó trông như thế này:

```html
<section class="todoapp">
  <h1>todos</h1>
  <input
    class="new-todo"
    aria-label="What needs to be done?"
    placeholder="What needs to be done?"
    autofocus />

  <section class="main">
    <input id="mark-all-complete" class="toggle-all" type="checkbox" />
    <label for="mark-all-complete">Mark all as complete</label>

    <ul class="todo-list">
      <li>
        <div class="view">
          <input
            aria-label="Toggle the completion of this todo"
            class="toggle"
            type="checkbox" />
          <label>Buy Movie Tickets</label>
          <button
            type="button"
            class="destroy"
            title="Remove this todo"
            aria-label="Remove this todo"></button>
        </div>

        <input autofocus class="edit" value="Todo Text" />
      </li>

      <li>
        <div class="view">
          <input
            aria-label="Toggle the completion of this todo"
            class="toggle"
            type="checkbox" />
          <label>Go to Movie</label>
          <button
            type="button"
            class="destroy"
            title="Remove this todo"
            aria-label="Remove this todo"></button>
        </div>

        <input autofocus class="edit" value="Todo Text" />
      </li>
    </ul>
  </section>

  <footer class="footer">
    <span class="todo-count"> <strong>0</strong> todos left </span>

    <ul class="filters">
      <li>
        <a href="#">All</a>
        <a href="#">Active</a>
        <a href="#">Completed</a>
      </li>
    </ul>

    <button type="button" class="clear-completed">Clear Completed</button>
  </footer>
</section>
```

Đầu ra được render bây giờ sẽ như sau:

![todo app rendered in the browser with new todo input field and existing todos showing, - buy movie tickets and go to movie](todos-with-todo-items.png)

Điều này trông khá hoàn chỉnh, nhưng hãy nhớ rằng đây chỉ là một mẫu thử nghiệm tĩnh. Bây giờ chúng ta cần chia code HTML của mình thành các thành phần động; sau này chúng ta sẽ biến nó thành ứng dụng tương tác hoàn toàn.

Nhìn vào code bên cạnh ứng dụng todo được render, có một số cách chúng ta có thể quyết định cách chia giao diện người dùng, nhưng hãy lập kế hoạch chia HTML thành các thành phần sau:

![code screenshot annotated to show what parts of the code will go into which component](todos-ui-component-breakdown.png)

Các nhóm thành phần như sau:

- Input chính / "new-todo" (màu đỏ trong hình)
- Phần thân chứa danh sách todo + nút `mark-all-complete` (màu tím trong hình)
  - Nút `mark-all-complete`, được nổi bật rõ ràng vì những lý do được đưa ra bên dưới (màu vàng trong hình)
  - Mỗi todo là một thành phần riêng lẻ (màu xanh lá trong hình)

- Footer (màu xanh dương trong hình)

Điều thú vị cần lưu ý là hộp kiểm `mark-all-complete` (được đánh dấu màu vàng), trong khi ở phần "main", được render bên cạnh input "new-todo". Điều này là vì CSS mặc định định vị tuyệt đối hộp kiểm + nhãn với các giá trị top và left âm để di chuyển nó bên cạnh input, thay vì nằm bên trong phần "main".

![todo app looked at through devtools](todos-devtools-view.png)

## Sử dụng CLI để tạo các thành phần cho chúng ta

Vì vậy, để đại diện cho ứng dụng, chúng ta muốn tạo 4 thành phần:

- Header
- List
- Individual Todo
- Footer

Để tạo một thành phần, chúng ta sử dụng lệnh `ember generate component`, theo sau là tên của thành phần. Hãy tạo thành phần header trước. Để làm vậy:

1. Dừng máy chủ đang chạy bằng cách đến terminal và nhấn <kbd>Ctrl</kbd> + <kbd>C</kbd>.
2. Nhập lệnh sau vào terminal:

   ```bash
   ember generate component header
   ```

   Lệnh này sẽ tạo một số file mới, như được hiển thị trong đầu ra terminal kết quả:

   ```plain
   installing component
     create app/components/header.hbs
     skip app/components/header.js
     tip to add a class, run `ember generate component-class header`
   installing component-test
     create tests/integration/components/header-test.js
   ```

`header.hbs` là file mẫu nơi chúng ta sẽ bao gồm cấu trúc HTML chỉ cho thành phần đó. Sau này chúng ta sẽ thêm chức năng động cần thiết như ràng buộc dữ liệu, phản hồi tương tác người dùng, v.v.

> [!NOTE]
> File `header.js` (được hiển thị là đã bỏ qua) để kết nối với Lớp Thành phần Glimmer backing, mà chúng ta không cần cho bây giờ, vì chúng dành cho việc thêm tính tương tác và thao tác trạng thái. Theo mặc định, `generate component` tạo ra các thành phần chỉ có mẫu, vì trong các ứng dụng lớn, các thành phần chỉ có mẫu cuối cùng chiếm đa số các thành phần.

`header-test.js` để viết các kiểm thử tự động để đảm bảo ứng dụng tiếp tục hoạt động theo thời gian khi chúng ta nâng cấp, thêm tính năng, tái cấu trúc, v.v. Kiểm thử nằm ngoài phạm vi của hướng dẫn này, mặc dù nói chung kiểm thử nên được triển khai trong khi phát triển, thay vì sau đó, nếu không nó có xu hướng bị lãng quên. Nếu bạn tò mò về kiểm thử, hoặc tại sao bạn muốn có các kiểm thử tự động, hãy xem [hướng dẫn kiểm thử chính thức của Ember](https://guides.emberjs.com/release/tutorial/part-1/automated-testing/).

Trước khi chúng ta bắt đầu thêm bất kỳ code thành phần nào, hãy tạo khung cho các thành phần khác. Nhập các dòng sau vào terminal, từng dòng một:

```bash
ember generate component todo-list
ember generate component todo
ember generate component footer
```

Bây giờ bạn sẽ thấy những điều sau trong thư mục `todomvc/app/components`:

![the app components directory, showing the component template files we've created](todos-components-directory.png)

Bây giờ chúng ta có tất cả các file cấu trúc thành phần, chúng ta có thể cắt và dán HTML cho mỗi thành phần ra khỏi file `application.hbs` và vào từng thành phần đó, sau đó viết lại `application.hbs` để phản ánh các trừu tượng hóa mới của chúng ta.

1. File `header.hbs` nên được cập nhật để chứa nội dung sau:

   ```html
   <input
     class="new-todo"
     aria-label="What needs to be done?"
     placeholder="What needs to be done?"
     autofocus />
   ```

2. `todo-list.hbs` nên được cập nhật để chứa đoạn code này:

   ```html
   <section class="main">
     <input id="mark-all-complete" class="toggle-all" type="checkbox" />
     <label for="mark-all-complete">Mark all as complete</label>

     <ul class="todo-list">
       <Todo />
       <Todo />
     </ul>
   </section>
   ```

   > [!NOTE]
   > Điều không phải HTML duy nhất trong `todo-list.hbs` mới này là lời gọi thành phần `<Todo />`. Trong Ember, việc gọi thành phần tương tự như khai báo phần tử HTML, nhưng chữ cái đầu tiên bắt đầu bằng chữ hoa, và tên được viết theo {{Glossary("camel_case", "upper camel case")}}, như bạn sẽ thấy với `<TodoList />` sau này. Nội dung của file `todo.hbs` bên dưới sẽ thay thế `<Todo />` trong trang được render khi ứng dụng tải.

3. Thêm nội dung sau vào file `todo.hbs`:

   ```html
   <li>
     <div class="view">
       <input
         aria-label="Toggle the completion of this todo"
         class="toggle"
         type="checkbox" />
       <label>Buy Movie Tickets</label>
       <button
         type="button"
         class="destroy"
         title="Remove this todo"
         aria-label="Remove this todo"></button>
     </div>

     <input autofocus class="edit" value="Todo Text" />
   </li>
   ```

4. `footer.hbs` nên được cập nhật để chứa nội dung sau:

   ```html
   <footer class="footer">
     <span class="todo-count"> <strong>0</strong> todos left </span>

     <ul class="filters">
       <li>
         <a href="#">All</a>
         <a href="#">Active</a>
         <a href="#">Completed</a>
       </li>
     </ul>

     <button type="button" class="clear-completed">Clear Completed</button>
   </footer>
   ```

5. Cuối cùng, nội dung của `application.hbs` nên được cập nhật để chúng gọi các thành phần phù hợp, như thế này:

   ```hbs
   <section class="todoapp">
     <h1>todos</h1>

     <Header />
     <TodoList />
     <Footer />
   </section>
   ```

6. Với những thay đổi này, hãy chạy lại `npm start` trong terminal, sau đó đến `http://localhost:4200` để đảm bảo ứng dụng todo vẫn trông như trước khi tái cấu trúc.

![todo app rendered in the browser with new todo input field and existing todos showing, both saying buy movie tickets](todos-components-render.png)

Lưu ý cả hai mục todo đều nói "Buy Movie Tickets" — điều này vì cùng một thành phần đang được gọi hai lần, và văn bản todo được mã hóa cứng vào nó. Chúng ta sẽ xem xét việc hiển thị các mục todo khác nhau trong bài viết tiếp theo!

## Tóm tắt

Tuyệt! Mọi thứ trông như bình thường. Chúng ta đã tái cấu trúc HTML thành công thành các thành phần! Trong bài viết tiếp theo, chúng ta sẽ bắt đầu xem xét việc thêm tính tương tác vào ứng dụng Ember.

{{PreviousMenuNext("Learn_web_development/Core/Frameworks_libraries/Ember_getting_started","Learn_web_development/Core/Frameworks_libraries/Ember_interactivity_events_state", "Learn_web_development/Core/Frameworks_libraries")}}
