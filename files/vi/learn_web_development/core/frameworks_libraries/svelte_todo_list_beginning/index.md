---
title: Bắt đầu xây dựng ứng dụng danh sách việc cần làm Svelte
slug: Learn_web_development/Core/Frameworks_libraries/Svelte_Todo_list_beginning
page-type: learn-module-chapter
sidebar: learnsidebar
---

{{PreviousMenuNext("Learn_web_development/Core/Frameworks_libraries/Svelte_getting_started","Learn_web_development/Core/Frameworks_libraries/Svelte_variables_props", "Learn_web_development/Core/Frameworks_libraries")}}

Bây giờ chúng ta đã có hiểu biết cơ bản về cách mọi thứ hoạt động trong Svelte, chúng ta có thể bắt đầu xây dựng ứng dụng ví dụ của mình: một danh sách việc cần làm. Trong bài viết này, trước tiên chúng ta sẽ xem xét chức năng mong muốn của ứng dụng, sau đó tạo thành phần `Todos.svelte` và đặt các đánh dấu và kiểu dáng tĩnh vào chỗ, để mọi thứ sẵn sàng để bắt đầu phát triển các tính năng của ứng dụng danh sách việc cần làm, mà chúng ta sẽ tiếp tục trong các bài viết tiếp theo.

Chúng ta muốn người dùng có thể duyệt, thêm và xóa các tác vụ, cũng như đánh dấu chúng là đã hoàn thành. Đây sẽ là chức năng cơ bản mà chúng ta sẽ phát triển trong loạt bài hướng dẫn này, và chúng ta cũng sẽ tìm hiểu một số khái niệm nâng cao hơn trong quá trình này.

<table>
  <tbody>
    <tr>
      <th scope="row">Điều kiện tiên quyết:</th>
      <td>
        <p>
          Tối thiểu, bạn nên quen thuộc với các ngôn ngữ cốt lõi
          <a href="/vi/docs/Learn_web_development/Core/Structuring_content">HTML</a>,
          <a href="/vi/docs/Learn_web_development/Core/Styling_basics">CSS</a>, và
          <a href="/vi/docs/Learn_web_development/Core/Scripting">JavaScript</a>,
          và có kiến thức về
          <a
            href="/vi/docs/Learn_web_development/Getting_started/Environment_setup/Command_line"
            >terminal/dòng lệnh</a
          >.
        </p>
        <p>
          Bạn sẽ cần một terminal với node + npm được cài đặt để biên dịch và xây dựng ứng dụng của mình.
        </p>
      </td>
    </tr>
    <tr>
      <th scope="row">Mục tiêu:</th>
      <td>
        Tìm hiểu cách tạo một thành phần Svelte, hiển thị nó bên trong một thành phần khác, truyền dữ liệu vào nó bằng các prop và lưu trạng thái của nó.
      </td>
    </tr>
  </tbody>
</table>

## Lập trình cùng chúng tôi

### Git

Sao chép kho lưu trữ GitHub (nếu bạn chưa làm điều đó) với:

```bash
git clone https://github.com/opensas/mdn-svelte-tutorial.git
```

Sau đó để đến trạng thái ứng dụng hiện tại, chạy

```bash
cd mdn-svelte-tutorial/02-starting-our-todo-app
```

Hoặc tải xuống trực tiếp nội dung thư mục:

```bash
npx degit opensas/mdn-svelte-tutorial/02-starting-our-todo-app
```

Nhớ chạy `npm install && npm run dev` để khởi động ứng dụng ở chế độ phát triển.

### REPL

Để lập trình cùng chúng tôi bằng REPL, bắt đầu tại

<https://svelte.dev/repl/b7b831ea3a354d3789cefbc31e2ca495?version=3.23.2>

## Các tính năng của ứng dụng danh sách việc cần làm

Đây là giao diện của ứng dụng danh sách việc cần làm sau khi hoàn thiện:

![ứng dụng danh sách việc cần làm điển hình, với tiêu đề 'what needs to be done', một ô nhập để thêm việc cần làm, và danh sách việc cần làm với các hộp kiểm](01-todo-list-app.png)

Sử dụng giao diện người dùng này, người dùng của chúng ta sẽ có thể:

- Duyệt các tác vụ của họ
- Đánh dấu tác vụ là đã hoàn thành/đang chờ mà không xóa chúng
- Xóa tác vụ
- Thêm tác vụ mới
- Lọc tác vụ theo trạng thái: tất cả các tác vụ, các tác vụ đang hoạt động, hoặc các tác vụ đã hoàn thành
- Chỉnh sửa tác vụ
- Đánh dấu tất cả tác vụ là đang hoạt động/đã hoàn thành
- Xóa tất cả các tác vụ đã hoàn thành

## Xây dựng thành phần đầu tiên

Hãy tạo một thành phần `Todos.svelte`. Đây sẽ chứa danh sách việc cần làm của chúng ta.

1. Tạo một thư mục mới — `src/components`.

   > [!NOTE]
   > Bạn có thể đặt các thành phần của mình ở bất kỳ đâu trong thư mục `src`, nhưng thư mục `components` là một quy ước được công nhận để tuân theo, cho phép bạn tìm thấy các thành phần của mình dễ dàng.

2. Tạo một tệp có tên `src/components/Todos.svelte` với nội dung sau:

   ```svelte
   <h1>Svelte to-do list</h1>
   ```

3. Thay đổi phần tử `title` trong `public/index.html` để chứa văn bản _Svelte to-do list_:

   ```svelte
   <title>Svelte to-do list</title>
   ```

4. Mở `src/App.svelte` và thay thế nội dung của nó bằng:

   ```svelte
   <script>
     import Todos from "./components/Todos.svelte";
   </script>

   <Todos />
   ```

5. Ở chế độ phát triển, Svelte sẽ phát ra cảnh báo trong bảng điều khiển trình duyệt khi chỉ định một prop không tồn tại trong thành phần; trong trường hợp này, chúng ta có prop `name` đang được chỉ định khi khởi tạo thành phần `App` bên trong `src/main.js`, nhưng không được sử dụng bên trong `App`. Bảng điều khiển hiện tại sẽ cung cấp cho bạn thông báo tương tự như "\<App> was created with unknown prop 'name'". Để thoát khỏi điều này, hãy xóa prop `name` khỏi `src/main.js`; bây giờ nó sẽ trông như thế này:

   ```js
   import App from "./App.svelte";

   const app = new App({
     target: document.body,
   });

   export default app;
   ```

Bây giờ nếu bạn kiểm tra URL máy chủ thử nghiệm của mình, bạn sẽ thấy thành phần `Todos.svelte` đang được hiển thị:

![kết xuất thành phần cơ bản với tiêu đề 'Svelte to-do list'](02-todos-component-rendered.png)

## Thêm đánh dấu tĩnh

Hiện tại chúng ta sẽ bắt đầu với một biểu diễn đánh dấu tĩnh của ứng dụng, để bạn có thể thấy nó sẽ trông như thế nào. Sao chép và dán nội dung sau vào tệp thành phần `Todos.svelte` của chúng ta, thay thế nội dung hiện có:

```svelte
<!-- Todos.svelte -->
<div class="todoapp stack-large">
  <!-- NewTodo -->
  <form>
    <h2 class="label-wrapper">
      <label for="todo-0" class="label__lg"> What needs to be done? </label>
    </h2>
    <input type="text" id="todo-0" autocomplete="off" class="input input__lg" />
    <button type="submit" disabled="" class="btn btn__primary btn__lg">
      Add
    </button>
  </form>

  <!-- Filter -->
  <div class="filters btn-group stack-exception">
    <button class="btn toggle-btn" aria-pressed="true">
      <span class="visually-hidden">Show</span>
      <span>All</span>
      <span class="visually-hidden">tasks</span>
    </button>
    <button class="btn toggle-btn" aria-pressed="false">
      <span class="visually-hidden">Show</span>
      <span>Active</span>
      <span class="visually-hidden">tasks</span>
    </button>
    <button class="btn toggle-btn" aria-pressed="false">
      <span class="visually-hidden">Show</span>
      <span>Completed</span>
      <span class="visually-hidden">tasks</span>
    </button>
  </div>

  <!-- TodosStatus -->
  <h2 id="list-heading">2 out of 3 items completed</h2>

  <!-- Todos -->
  <ul role="list" class="todo-list stack-large" aria-labelledby="list-heading">
    <!-- todo-1 (editing mode) -->
    <li class="todo">
      <div class="stack-small">
        <form class="stack-small">
          <div class="form-group">
            <label for="todo-1" class="todo-label">
              New name for 'Create a Svelte starter app'
            </label>
            <input
              type="text"
              id="todo-1"
              autocomplete="off"
              class="todo-text" />
          </div>
          <div class="btn-group">
            <button class="btn todo-cancel" type="button">
              Cancel
              <span class="visually-hidden">renaming Create a Svelte starter app</span>
            </button>
            <button class="btn btn__primary todo-edit" type="submit">
              Save
              <span class="visually-hidden">new name for Create a Svelte starter app</span>
            </button>
          </div>
        </form>
      </div>
    </li>

    <!-- todo-2 -->
    <li class="todo">
      <div class="stack-small">
        <div class="c-cb">
          <input type="checkbox" id="todo-2" checked />
          <label for="todo-2" class="todo-label">
            Create your first component
          </label>
        </div>
        <div class="btn-group">
          <button type="button" class="btn">
            Edit
            <span class="visually-hidden">Create your first component</span>
          </button>
          <button type="button" class="btn btn__danger">
            Delete
            <span class="visually-hidden">Create your first component</span>
          </button>
        </div>
      </div>
    </li>

    <!-- todo-3 -->
    <li class="todo">
      <div class="stack-small">
        <div class="c-cb">
          <input type="checkbox" id="todo-3" />
          <label for="todo-3" class="todo-label">
            Complete the rest of the tutorial
          </label>
        </div>
        <div class="btn-group">
          <button type="button" class="btn">
            Edit
            <span class="visually-hidden">Complete the rest of the tutorial</span>
          </button>
          <button type="button" class="btn btn__danger">
            Delete
            <span class="visually-hidden">Complete the rest of the tutorial</span>
          </button>
        </div>
      </div>
    </li>
  </ul>

  <hr />

  <!-- MoreActions -->
  <div class="btn-group">
    <button type="button" class="btn btn__primary">Check all</button>
    <button type="button" class="btn btn__primary">Remove completed</button>
  </div>
</div>
```

Kiểm tra lại kết quả hiển thị và bạn sẽ thấy điều gì đó như thế này:

![Ứng dụng danh sách việc cần làm, chưa có kiểu dáng, với tiêu đề 'what needs to be done', các ô nhập, hộp kiểm, v.v.](03-unstyled-todo-app.png)

Đánh dấu HTML ở trên không được tạo kiểu tốt và cũng không có chức năng. Tuy nhiên, hãy xem đánh dấu và xem nó liên quan đến các tính năng mong muốn của chúng ta như thế nào:

- Một nhãn và một hộp văn bản để nhập các tác vụ mới
- Ba nút để lọc theo trạng thái tác vụ
- Một nhãn hiển thị tổng số tác vụ và các tác vụ đã hoàn thành
- Một danh sách không có thứ tự, chứa một mục danh sách cho mỗi tác vụ
- Khi tác vụ đang được chỉnh sửa, mục danh sách có một ô nhập và hai nút để hủy hoặc lưu các thay đổi
- Nếu tác vụ không được chỉnh sửa, có một hộp kiểm để đặt trạng thái đã hoàn thành và hai nút để chỉnh sửa hoặc xóa tác vụ
- Cuối cùng có hai nút để chọn/bỏ chọn tất cả tác vụ và để xóa các tác vụ đã hoàn thành

Trong các bài viết tiếp theo, chúng ta sẽ làm cho tất cả các tính năng này hoạt động và nhiều hơn nữa.

### Các tính năng khả năng tiếp cận của danh sách việc cần làm

Bạn có thể nhận thấy một số thuộc tính bất thường ở đây. Ví dụ:

```svelte
<button class="btn toggle-btn" aria-pressed="true">
  <span class="visually-hidden">Show</span>
  <span>All</span>
  <span class="visually-hidden">tasks</span>
</button>
```

Ở đây, `aria-pressed` cho công nghệ hỗ trợ (như trình đọc màn hình) biết rằng nút có thể ở một trong hai trạng thái: `pressed` hoặc `unpressed`. Hãy nghĩ về chúng như là tương đương cho bật và tắt. Đặt giá trị `true` có nghĩa là nút được nhấn theo mặc định.

Lớp `visually-hidden` chưa có hiệu lực vì chúng ta chưa bao gồm bất kỳ CSS nào. Khi chúng ta đã đặt các kiểu dáng vào chỗ, bất kỳ phần tử nào với lớp này sẽ bị ẩn đối với người dùng nhìn thấy và vẫn có thể truy cập đối với người dùng trình đọc màn hình — vì những từ này không cần thiết cho người dùng nhìn thấy; chúng ở đó để cung cấp thêm thông tin về những gì nút làm cho người dùng trình đọc màn hình không có bối cảnh hình ảnh bổ sung để giúp họ.

Phía dưới hơn, bạn có thể tìm thấy phần tử `<ul>` sau:

```svelte
<ul
  role="list"
  class="todo-list stack-large"
  aria-labelledby="list-heading">
```

Thuộc tính `role` giúp công nghệ hỗ trợ giải thích loại giá trị ngữ nghĩa mà một phần tử có — hoặc mục đích của nó là gì. Một `<ul>` được coi như một danh sách theo mặc định, nhưng các kiểu dáng chúng ta sắp thêm sẽ phá vỡ chức năng đó. Vai trò này sẽ khôi phục ý nghĩa "list" cho phần tử `<ul>`. Nếu bạn muốn tìm hiểu thêm về lý do tại sao điều này cần thiết, bạn có thể xem bài viết của Scott O'Hara ["Fixing Lists"](https://www.scottohara.me/blog/2019/01/12/lists-and-safari.html) (2019).

Thuộc tính `aria-labelledby` cho các công nghệ hỗ trợ biết rằng chúng ta đang coi phần tử `<h2>` với `id` là `list-heading` là nhãn mô tả mục đích của danh sách bên dưới nó. Việc tạo liên kết này cung cấp cho danh sách ngữ cảnh có nhiều thông tin hơn, điều này có thể giúp người dùng trình đọc màn hình hiểu mục đích của nó tốt hơn.

Đây có vẻ là thời điểm tốt để nói về cách Svelte xử lý khả năng tiếp cận; hãy thực hiện điều đó bây giờ.

## Hỗ trợ khả năng tiếp cận của Svelte

Svelte đặc biệt nhấn mạnh vào khả năng tiếp cận. Mục đích là khuyến khích các nhà phát triển viết mã có thể tiếp cận hơn "theo mặc định". Là một trình biên dịch, Svelte có thể phân tích tĩnh các mẫu HTML của chúng ta để cung cấp cảnh báo khả năng tiếp cận khi các thành phần đang được biên dịch.

Khả năng tiếp cận (viết tắt là a11y) không phải lúc nào cũng dễ thực hiện đúng, nhưng Svelte sẽ giúp bằng cách cảnh báo bạn nếu bạn viết đánh dấu không thể tiếp cận.

Ví dụ, nếu chúng ta thêm phần tử `<img>` vào thành phần `todos.svelte` của mình mà không có prop `alt` tương ứng:

```svelte
<h1>Svelte To-Do list</h1>

<img height="32" width="88" src="https://www.w3.org/WAI/wcag2A" />
```

Trình biên dịch sẽ phát ra cảnh báo sau:

```bash
(!) Plugin svelte: A11y: <img> element should have an alt attribute
src/components/Todos.svelte
1: <h1>Svelte To-Do list</h1>
2:
3: <img height="32" width="88" src="https://www.w3.org/WAI/wcag2A">
   ^
created public/build/bundle.js in 220ms

[2020-07-15 04:07:43] waiting for changes...
```

Hơn nữa, trình soạn thảo của chúng ta có thể hiển thị cảnh báo này ngay cả trước khi gọi trình biên dịch:

![Cửa sổ trình soạn thảo mã hiển thị thẻ hình ảnh, với thông báo lỗi bật lên nói rằng phần tử nên có thuộc tính alt](04-svelte-accessibility-support.png)

Bạn có thể yêu cầu Svelte bỏ qua cảnh báo này cho khối đánh dấu tiếp theo bằng một [bình luận](https://svelte.dev/docs/basic-markup#comments) bắt đầu bằng `svelte-ignore`, như thế này:

```svelte
<!-- svelte-ignore a11y-missing-attribute -->
<img height="32" width="88" src="https://www.w3.org/WAI/wcag2A" />
```

> [!NOTE]
> Với VS Code, bạn có thể tự động thêm bình luận bỏ qua này bằng cách nhấp vào liên kết _Quick fix…_ hoặc nhấn <kbd>Ctrl</kbd> + <kbd>.</kbd>.

Nếu bạn muốn tắt cảnh báo này trên toàn cục, bạn có thể thêm trình xử lý `onwarn` này vào tệp `rollup.config.js` của bạn bên trong cấu hình cho plugin `Svelte`, như thế này:

```js
export default {
  // …
  plugins: [
    svelte({
      dev: !production,
      css(css) {
        css.write("public/build/bundle.css");
      },
      // Warnings are normally passed straight to Rollup. You can
      // optionally handle them here, for example to squelch
      // warnings with a particular code
      onwarn(warning, handler) {
        // e.g. I don't care about screen readers -> please DON'T DO THIS!!!
        if (warning.code === "a11y-missing-attribute") {
          return;
        }

        // let Rollup handle all other warnings normally
        handler(warning);
      },
    }),

    // …
  ],
  // …
};
```

Theo thiết kế, các cảnh báo này được triển khai trong chính trình biên dịch, và không phải là một plug-in mà bạn có thể chọn thêm vào dự án của mình. Ý tưởng là kiểm tra các vấn đề a11y trong đánh dấu theo mặc định và để bạn chọn thoát khỏi các cảnh báo cụ thể.

> [!NOTE]
> Bạn chỉ nên tắt các cảnh báo này nếu bạn có lý do chính đáng để làm vậy, ví dụ như trong khi xây dựng một nguyên mẫu nhanh. Điều quan trọng là trở thành công dân web tốt và làm cho các trang của bạn có thể tiếp cận với phần lớn người dùng nhất có thể.

Các quy tắc khả năng tiếp cận được kiểm tra bởi Svelte được lấy từ [eslint-plugin-jsx-a11y](https://github.com/jsx-eslint/eslint-plugin-jsx-a11y#supported-rules), một plugin cho ESLint cung cấp các kiểm tra tĩnh cho nhiều quy tắc khả năng tiếp cận trên các phần tử JSX. Svelte nhằm mục đích triển khai tất cả chúng trong trình biên dịch của nó và hầu hết đã được chuyển sang Svelte. Trên GitHub, bạn có thể xem [các kiểm tra khả năng tiếp cận nào vẫn còn thiếu](https://github.com/sveltejs/svelte/issues/820). Bạn có thể kiểm tra ý nghĩa của từng quy tắc bằng cách nhấp vào liên kết của nó.

## Tạo kiểu dáng cho đánh dấu

Hãy làm cho danh sách việc cần làm trông đẹp hơn một chút. Thay thế nội dung của tệp `public/global.css` bằng nội dung sau:

```css
/* RESETS */
*,
*::before,
*::after {
  box-sizing: border-box;
}
*:focus {
  outline: 3px dashed #228bec;
  outline-offset: 0;
}
html {
  font: 62.5% / 1.15 sans-serif;
}
h1,
h2 {
  margin-bottom: 0;
}
ul {
  list-style: none;
  padding: 0;
}
button {
  border: none;
  margin: 0;
  padding: 0;
  width: auto;
  overflow: visible;
  background: transparent;
  color: inherit;
  font: inherit;
  line-height: normal;
  -webkit-font-smoothing: inherit;
  -moz-osx-font-smoothing: inherit;
  appearance: none;
}
button::-moz-focus-inner {
  border: 0;
}
button,
input,
optgroup,
select,
textarea {
  font-family: inherit;
  font-size: 100%;
  line-height: 1.15;
  margin: 0;
}
button,
input {
  overflow: visible;
}
input[type="text"] {
  border-radius: 0;
}
body {
  width: 100%;
  max-width: 68rem;
  margin: 0 auto;
  font:
    1.6rem/1.25 "Arial",
    sans-serif;
  background-color: whitesmoke;
  color: #4d4d4d;
}
@media screen and (width >= 620px) {
  body {
    font-size: 1.9rem;
    line-height: 1.31579;
  }
}
/* END RESETS */

/* GLOBAL STYLES */
.form-group > input[type="text"] {
  display: inline-block;
  margin-top: 0.4rem;
}
.btn {
  padding: 0.8rem 1rem 0.7rem;
  border: 0.2rem solid #4d4d4d;
  cursor: pointer;
  text-transform: capitalize;
}
.btn.toggle-btn {
  border-width: 1px;
  border-color: lightgray;
}
.btn.toggle-btn[aria-pressed="true"] {
  text-decoration: underline;
  border-color: #4d4d4d;
}
.btn__danger {
  color: white;
  background-color: #ca3c3c;
  border-color: #bd2130;
}
.btn__filter {
  border-color: lightgrey;
}
.btn__primary {
  color: white;
  background-color: black;
}
.btn__primary:disabled {
  color: darkgrey;
  background-color: #565656;
}
.btn-group {
  display: flex;
  justify-content: space-between;
}
.btn-group > * {
  flex: 1 1 49%;
}
.btn-group > * + * {
  margin-left: 0.8rem;
}
.label-wrapper {
  margin: 0;
  flex: 0 0 100%;
  text-align: center;
}
.visually-hidden {
  position: absolute !important;
  height: 1px;
  width: 1px;
  overflow: hidden;
  clip: rect(1px, 1px, 1px, 1px);
  white-space: nowrap;
}
[class*="stack"] > * {
  margin-top: 0;
  margin-bottom: 0;
}
.stack-small > * + * {
  margin-top: 1.25rem;
}
.stack-large > * + * {
  margin-top: 2.5rem;
}
@media screen and (width >= 550px) {
  .stack-small > * + * {
    margin-top: 1.4rem;
  }
  .stack-large > * + * {
    margin-top: 2.8rem;
  }
}
.stack-exception {
  margin-top: 1.2rem;
}
/* END GLOBAL STYLES */

.todoapp {
  background: white;
  margin: 2rem 0 4rem 0;
  padding: 1rem;
  position: relative;
  box-shadow:
    0 2px 4px 0 rgb(0 0 0 / 20%),
    0 2.5rem 5rem 0 rgb(0 0 0 / 10%);
}
@media screen and (width >= 550px) {
  .todoapp {
    padding: 4rem;
  }
}
.todoapp > * {
  max-width: 50rem;
  margin-left: auto;
  margin-right: auto;
}
.todoapp > form {
  max-width: 100%;
}
.todoapp > h1 {
  display: block;
  max-width: 100%;
  text-align: center;
  margin: 0;
  margin-bottom: 1rem;
}
.label__lg {
  line-height: 1.01567;
  font-weight: 300;
  padding: 0.8rem;
  margin-bottom: 1rem;
  text-align: center;
}
.input__lg {
  padding: 2rem;
  border: 2px solid black;
}
.input__lg:focus {
  border-color: #4d4d4d;
  box-shadow: inset 0 0 0 2px;
}
[class*="__lg"] {
  display: inline-block;
  width: 100%;
  font-size: 1.9rem;
}
[class*="__lg"]:not(:last-child) {
  margin-bottom: 1rem;
}
@media screen and (width >= 620px) {
  [class*="__lg"] {
    font-size: 2.4rem;
  }
}
.filters {
  width: 100%;
  margin: unset;
}
/* Todo item styles */
.todo {
  display: flex;
  flex-direction: row;
  flex-wrap: wrap;
}
.todo > * {
  flex: 0 0 100%;
}
.todo-text {
  width: 100%;
  min-height: 4.4rem;
  padding: 0.4rem 0.8rem;
  border: 2px solid #565656;
}
.todo-text:focus {
  box-shadow: inset 0 0 0 2px;
}
/* CHECKBOX STYLES */
.c-cb {
  box-sizing: border-box;
  font-family: "Arial", sans-serif;
  -webkit-font-smoothing: antialiased;
  font-weight: normal;
  font-size: 1.6rem;
  line-height: 1.25;
  display: block;
  position: relative;
  min-height: 44px;
  padding-left: 40px;
  clear: left;
}
.c-cb > label::before,
.c-cb > input[type="checkbox"] {
  box-sizing: border-box;
  top: -2px;
  left: -2px;
  width: 44px;
  height: 44px;
}
.c-cb > input[type="checkbox"] {
  -webkit-font-smoothing: antialiased;
  cursor: pointer;
  position: absolute;
  z-index: 1;
  margin: 0;
  opacity: 0;
}
.c-cb > label {
  font-size: inherit;
  font-family: inherit;
  line-height: inherit;
  display: inline-block;
  margin-bottom: 0;
  padding: 8px 15px 5px;
  cursor: pointer;
  touch-action: manipulation;
}
.c-cb > label::before {
  content: "";
  position: absolute;
  border: 2px solid currentColor;
  background: transparent;
}
.c-cb > input[type="checkbox"]:focus + label::before {
  border-width: 4px;
  outline: 3px dashed #228bec;
}
.c-cb > label::after {
  box-sizing: content-box;
  content: "";
  position: absolute;
  top: 11px;
  left: 9px;
  width: 18px;
  height: 7px;
  transform: rotate(-45deg);
  border: solid;
  border-width: 0 0 5px 5px;
  border-top-color: transparent;
  opacity: 0;
  background: transparent;
}
.c-cb > input[type="checkbox"]:checked + label::after {
  opacity: 1;
}
```

Với đánh dấu của chúng ta được tạo kiểu dáng, mọi thứ bây giờ trông tốt hơn:

![Ứng dụng danh sách việc cần làm đã được tạo kiểu dáng, với tiêu đề 'what needs to be done', một ô nhập để thêm việc cần làm, và danh sách việc cần làm với hộp kiểm](05-styled-todo-app.png)

## Mã cho đến nay

### Git

Để xem trạng thái mã như nó phải là ở cuối bài viết này, hãy truy cập bản sao của repo của chúng ta như thế này:

```bash
cd mdn-svelte-tutorial/03-adding-dynamic-behavior
```

Hoặc tải xuống trực tiếp nội dung thư mục:

```bash
npx degit opensas/mdn-svelte-tutorial/03-adding-dynamic-behavior
```

Nhớ chạy `npm install && npm run dev` để khởi động ứng dụng ở chế độ phát triển.

### REPL

Để xem trạng thái hiện tại của mã trong REPL, hãy truy cập:

<https://svelte.dev/repl/c862d964d48d473ca63ab91709a0a5a0?version=3.23.2>

## Tóm tắt

Với đánh dấu và kiểu dáng đã vào chỗ, ứng dụng danh sách việc cần làm của chúng ta đang bắt đầu có hình dạng, và chúng ta đã sẵn sàng để bắt đầu tập trung vào các tính năng mà chúng ta phải triển khai.

{{PreviousMenuNext("Learn_web_development/Core/Frameworks_libraries/Svelte_getting_started","Learn_web_development/Core/Frameworks_libraries/Svelte_variables_props", "Learn_web_development/Core/Frameworks_libraries")}}
