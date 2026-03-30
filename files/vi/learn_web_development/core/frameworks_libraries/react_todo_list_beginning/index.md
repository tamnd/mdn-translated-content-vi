---
title: Bắt đầu ứng dụng ToDo React của chúng ta
short-title: Ứng dụng ToDo React
slug: Learn_web_development/Core/Frameworks_libraries/React_todo_list_beginning
page-type: learn-module-chapter
sidebar: learnsidebar
---

{{PreviousMenuNext("Learn_web_development/Core/Frameworks_libraries/React_getting_started","Learn_web_development/Core/Frameworks_libraries/React_components", "Learn_web_development/Core/Frameworks_libraries")}}

Giả sử chúng ta được giao nhiệm vụ tạo một bằng chứng khái niệm trong React – một ứng dụng cho phép người dùng thêm, chỉnh sửa và xóa các tác vụ họ muốn thực hiện, đồng thời đánh dấu các tác vụ là hoàn thành mà không xóa chúng. Bài viết này sẽ hướng dẫn bạn thiết lập cấu trúc và kiểu dáng cơ bản của ứng dụng như vậy, sẵn sàng cho định nghĩa thành phần riêng lẻ và tính tương tác mà chúng ta sẽ thêm sau.

> [!NOTE]
> Nếu bạn cần kiểm tra code của mình so với phiên bản của chúng tôi, bạn có thể tìm phiên bản hoàn chỉnh của code ứng dụng React mẫu trong [kho lưu trữ todo-react](https://github.com/mdn/todo-react) của chúng tôi. Để xem phiên bản chạy trực tiếp, hãy xem <https://mdn.github.io/todo-react/>.

<table>
  <tbody>
    <tr>
      <th scope="row">Điều kiện tiên quyết:</th>
      <td>
        Quen thuộc với các ngôn ngữ cốt lõi <a href="/en-US/docs/Learn_web_development/Core/Structuring_content">HTML</a>,
        <a href="/en-US/docs/Learn_web_development/Core/Styling_basics">CSS</a> và
        <a href="/en-US/docs/Learn_web_development/Core/Scripting">JavaScript</a>, và <a href="/en-US/docs/Learn_web_development/Getting_started/Environment_setup/Command_line">dòng lệnh/terminal</a>.
      </td>
    </tr>
    <tr>
      <th scope="row">Kết quả học tập:</th>
      <td>
        Quen thuộc với nghiên cứu trường hợp danh sách việc cần làm và thiết lập cấu trúc
        <code>App</code> cơ bản và kiểu dáng.
      </td>
    </tr>
  </tbody>
</table>

## Câu chuyện người dùng của ứng dụng

Trong phát triển phần mềm, câu chuyện người dùng là mục tiêu có thể thực hiện từ góc nhìn của người dùng. Xác định câu chuyện người dùng trước khi chúng ta bắt đầu công việc sẽ giúp chúng ta tập trung vào công việc. Ứng dụng của chúng ta nên thực hiện các câu chuyện sau:

Với tư cách là người dùng, tôi có thể

- đọc danh sách tác vụ.
- thêm tác vụ bằng chuột hoặc bàn phím.
- đánh dấu bất kỳ tác vụ nào là hoàn thành, bằng chuột hoặc bàn phím.
- xóa bất kỳ tác vụ nào, bằng chuột hoặc bàn phím.
- chỉnh sửa bất kỳ tác vụ nào, bằng chuột hoặc bàn phím.
- xem một tập hợp con cụ thể của tác vụ: Tất cả tác vụ, chỉ tác vụ đang hoạt động, hoặc chỉ tác vụ đã hoàn thành.

Chúng ta sẽ giải quyết từng câu chuyện một.

## Dọn dẹp trước dự án

Vite đã cung cấp cho chúng ta một số code mà chúng ta sẽ không sử dụng cho dự án. Các lệnh terminal sau sẽ xóa nó để nhường chỗ cho dự án mới. Hãy chắc chắn rằng bạn đang bắt đầu trong thư mục gốc của ứng dụng!

```bash
# Move into the src directory
cd src
# Delete the App.css file and the React logo provided by Vite
rm App.css assets/react.svg
# Empty the contents of App.jsx and index.css
echo -n > App.jsx && echo -n > index.css
# Move back up to the root of the project
cd ..
```

> [!NOTE]
> Nếu bạn đã dừng máy chủ để thực hiện các tác vụ terminal đã đề cập ở trên, bạn sẽ phải khởi động lại bằng `npm run dev`.

## Code khởi đầu dự án

Là điểm khởi đầu cho dự án này, chúng ta sẽ cung cấp hai thứ: một hàm `App()` để thay thế cái bạn vừa xóa, và một số CSS để tạo kiểu cho ứng dụng.

### JSX

Sao chép đoạn code sau vào clipboard, sau đó dán vào `App.jsx`:

```jsx
function App(props) {
  return (
    <div className="todoapp stack-large">
      <h1>TodoMatic</h1>
      <form>
        <h2 className="label-wrapper">
          <label htmlFor="new-todo-input" className="label__lg">
            What needs to be done?
          </label>
        </h2>
        <input
          type="text"
          id="new-todo-input"
          className="input input__lg"
          name="text"
          autoComplete="off"
        />
        <button type="submit" className="btn btn__primary btn__lg">
          Add
        </button>
      </form>
      <div className="filters btn-group stack-exception">
        <button type="button" className="btn toggle-btn" aria-pressed="true">
          <span className="visually-hidden">Show </span>
          <span>all</span>
          <span className="visually-hidden"> tasks</span>
        </button>
        <button type="button" className="btn toggle-btn" aria-pressed="false">
          <span className="visually-hidden">Show </span>
          <span>Active</span>
          <span className="visually-hidden"> tasks</span>
        </button>
        <button type="button" className="btn toggle-btn" aria-pressed="false">
          <span className="visually-hidden">Show </span>
          <span>Completed</span>
          <span className="visually-hidden"> tasks</span>
        </button>
      </div>
      <h2 id="list-heading">3 tasks remaining</h2>
      <ul
        role="list"
        className="todo-list stack-large stack-exception"
        aria-labelledby="list-heading">
        <li className="todo stack-small">
          <div className="c-cb">
            <input id="todo-0" type="checkbox" defaultChecked />
            <label className="todo-label" htmlFor="todo-0">
              Eat
            </label>
          </div>
          <div className="btn-group">
            <button type="button" className="btn">
              Edit <span className="visually-hidden">Eat</span>
            </button>
            <button type="button" className="btn btn__danger">
              Delete <span className="visually-hidden">Eat</span>
            </button>
          </div>
        </li>
        <li className="todo stack-small">
          <div className="c-cb">
            <input id="todo-1" type="checkbox" />
            <label className="todo-label" htmlFor="todo-1">
              Sleep
            </label>
          </div>
          <div className="btn-group">
            <button type="button" className="btn">
              Edit <span className="visually-hidden">Sleep</span>
            </button>
            <button type="button" className="btn btn__danger">
              Delete <span className="visually-hidden">Sleep</span>
            </button>
          </div>
        </li>
        <li className="todo stack-small">
          <div className="c-cb">
            <input id="todo-2" type="checkbox" />
            <label className="todo-label" htmlFor="todo-2">
              Repeat
            </label>
          </div>
          <div className="btn-group">
            <button type="button" className="btn">
              Edit <span className="visually-hidden">Repeat</span>
            </button>
            <button type="button" className="btn btn__danger">
              Delete <span className="visually-hidden">Repeat</span>
            </button>
          </div>
        </li>
      </ul>
    </div>
  );
}

export default App;
```

Bây giờ mở `index.html` và thay đổi văn bản của phần tử [`<title>`](/en-US/docs/Web/HTML/Reference/Elements/title) thành `TodoMatic`. Bằng cách này, nó sẽ khớp với [`<h1>`](/en-US/docs/Web/HTML/Reference/Elements/Heading_Elements) ở đầu ứng dụng.

```html
<title>TodoMatic</title>
```

Khi trình duyệt của bạn làm mới, bạn sẽ thấy thứ gì đó như thế này:

![todo-matic app, unstyled, showing a jumbled mess of labels, inputs, and buttons](unstyled-app.png)

Nó xấu và chưa hoạt động, nhưng không sao — chúng ta sẽ tạo kiểu cho nó trong giây lát. Đầu tiên, hãy xem xét JSX chúng ta có và cách nó tương ứng với câu chuyện người dùng:

- Chúng ta có một phần tử [`<form>`](/en-US/docs/Web/HTML/Reference/Elements/form), với một [`<input type="text">`](/en-US/docs/Web/HTML/Reference/Elements/input/text) để viết tác vụ mới, và một nút để gửi biểu mẫu.
- Chúng ta có một mảng các nút sẽ được sử dụng để lọc tác vụ.
- Chúng ta có tiêu đề cho chúng ta biết có bao nhiêu tác vụ còn lại.
- Chúng ta có 3 tác vụ, được sắp xếp trong danh sách không có thứ tự. Mỗi tác vụ là một mục danh sách ([`<li>`](/en-US/docs/Web/HTML/Reference/Elements/li)), và có các nút để chỉnh sửa và xóa nó và một hộp kiểm để đánh dấu nó là đã xong.

Biểu mẫu sẽ cho phép chúng ta _tạo_ tác vụ; các nút sẽ cho chúng ta _lọc_ chúng; tiêu đề và danh sách là cách chúng ta _đọc_ chúng. Giao diện người dùng để _chỉnh sửa_ tác vụ hiện tại vắng mặt một cách đáng chú ý. Không sao — chúng ta sẽ viết điều đó sau.

### Tính năng khả năng tiếp cận

Bạn có thể nhận thấy một số đánh dấu khác thường ở đây. Ví dụ:

```jsx
<button type="button" className="btn toggle-btn" aria-pressed="true">
  <span className="visually-hidden">Show </span>
  <span>all</span>
  <span className="visually-hidden"> tasks</span>
</button>
```

Ở đây, `aria-pressed` cho công nghệ hỗ trợ (như trình đọc màn hình) biết rằng nút có thể ở một trong hai trạng thái: `pressed` hoặc `unpressed`. Hãy nghĩ về chúng như các tương đương cho `on` và `off`. Đặt giá trị là `"true"` có nghĩa là nút được nhấn theo mặc định.

Lớp `visually-hidden` chưa có hiệu ứng, vì chúng ta chưa bao gồm bất kỳ CSS nào. Tuy nhiên, khi chúng ta đã đặt các kiểu vào đúng chỗ, bất kỳ phần tử nào với lớp này sẽ bị ẩn khỏi người dùng có thể nhìn thấy và vẫn có sẵn cho người dùng công nghệ hỗ trợ — điều này là vì những từ này không cần thiết cho người dùng có thể nhìn thấy; chúng ở đó để cung cấp thêm thông tin về những gì nút làm cho người dùng công nghệ hỗ trợ không có ngữ cảnh trực quan thêm để giúp họ.

Tiếp theo, bạn có thể tìm thấy phần tử [`<ul>`](/en-US/docs/Web/HTML/Reference/Elements/ul):

```jsx
<ul
  role="list"
  className="todo-list stack-large stack-exception"
  aria-labelledby="list-heading">
  …
</ul>
```

Thuộc tính `role` giúp công nghệ hỗ trợ giải thích loại phần tử nào mà thẻ đại diện. Một `<ul>` được coi như một danh sách theo mặc định, nhưng các kiểu chúng ta sắp thêm sẽ phá vỡ chức năng đó. Role này sẽ khôi phục ý nghĩa "danh sách" cho phần tử `<ul>`. Nếu bạn muốn tìm hiểu thêm về lý do tại sao điều này cần thiết, bạn có thể xem [bài viết của Scott O'Hara, "Fixing Lists"](https://www.scottohara.me/blog/2019/01/12/lists-and-safari.html).

Thuộc tính `aria-labelledby` cho công nghệ hỗ trợ biết rằng chúng ta đang coi tiêu đề danh sách của mình như nhãn mô tả mục đích của danh sách bên dưới nó. Tạo ra mối liên kết này cung cấp cho danh sách ngữ cảnh thông tin hơn, có thể giúp người dùng công nghệ hỗ trợ hiểu mục đích của danh sách tốt hơn.

Cuối cùng, các nhãn và đầu vào trong các mục danh sách của chúng ta có một số thuộc tính độc đáo với JSX:

```jsx
<div className="c-cb">
  <input id="todo-0" type="checkbox" defaultChecked />
  <label className="todo-label" htmlFor="todo-0">
    Eat
  </label>
</div>
```

Thuộc tính `defaultChecked` trong thẻ `<input />` cho React biết để kiểm tra hộp kiểm này ban đầu. Nếu chúng ta sử dụng `checked`, như chúng ta sẽ làm trong HTML thông thường, React sẽ ghi một số cảnh báo vào console trình duyệt liên quan đến việc xử lý sự kiện trên hộp kiểm, mà chúng ta muốn tránh. Đừng lo lắng quá nhiều về điều này bây giờ — chúng ta sẽ đề cập đến điều này sau khi chúng ta đến việc sử dụng sự kiện.

Thuộc tính `htmlFor` tương ứng với thuộc tính `for` được sử dụng trong HTML. Chúng ta không thể sử dụng `for` như một thuộc tính trong JSX vì `for` là một từ dành riêng, vì vậy React sử dụng `htmlFor` thay thế.

### Một lưu ý về thuộc tính boolean trong JSX

Thuộc tính `defaultChecked` trong phần trước là thuộc tính boolean — một thuộc tính có giá trị là `true` hoặc `false`. Giống như trong HTML, một thuộc tính boolean là `true` nếu nó có mặt và `false` nếu vắng mặt; phép gán ở phía bên phải của biểu thức là tùy chọn. Bạn có thể đặt giá trị của nó một cách rõ ràng bằng cách truyền nó trong dấu ngoặc nhọn — ví dụ, `defaultChecked={true}` hoặc `defaultChecked={false}`.

Vì JSX là JavaScript, có một điều cần lưu ý với các thuộc tính boolean: viết `defaultChecked="false"` sẽ đặt giá trị _chuỗi_ là `"false"` chứ không phải giá trị _boolean_. Các chuỗi không rỗng là [truthy](/en-US/docs/Glossary/Truthy), vì vậy React sẽ coi `defaultChecked` là `true` và kiểm tra hộp kiểm theo mặc định. Đây không phải là điều chúng ta muốn, vì vậy chúng ta nên tránh nó.

Nếu bạn muốn, bạn có thể thực hành viết các thuộc tính boolean với một thuộc tính khác mà bạn có thể đã thấy trước đây, [`hidden`](/en-US/docs/Web/HTML/Reference/Global_attributes/hidden), ngăn các phần tử được kết xuất trên trang. Hãy thử thêm `hidden` vào phần tử `<h1>` trong `App.jsx` để xem điều gì xảy ra, sau đó thử đặt giá trị của nó một cách rõ ràng thành `{false}`. Lưu ý, một lần nữa, rằng viết `hidden="false"` dẫn đến giá trị truthy nên `<h1>` _sẽ_ ẩn. Đừng quên xóa code này khi bạn hoàn thành.

> [!NOTE]
> Thuộc tính `aria-pressed` được sử dụng trong đoạn code trước có giá trị là `"true"` vì `aria-pressed` không phải là thuộc tính boolean thực sự theo cách `checked` là.

### Triển khai kiểu dáng của chúng ta

Dán code CSS sau vào `src/index.css`:

```css
/* Resets */
*,
*::before,
*::after {
  box-sizing: border-box;
}
*:focus-visible {
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
  -moz-osx-font-smoothing: inherit;
  -webkit-font-smoothing: inherit;
  appearance: none;
  background: transparent;
  border: none;
  color: inherit;
  font: inherit;
  line-height: normal;
  margin: 0;
  overflow: visible;
  padding: 0;
  width: auto;
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
  background-color: whitesmoke;
  color: #4d4d4d;
  font:
    1.6rem/1.25 "Arial",
    sans-serif;
  margin: 0 auto;
  max-width: 68rem;
  width: 100%;
}
@media screen and (width >= 620px) {
  body {
    font-size: 1.9rem;
    line-height: 1.31579;
  }
}
/* End resets */
/* Global styles */
.form-group > input[type="text"] {
  display: inline-block;
  margin-top: 0.4rem;
}
.btn {
  border: 0.2rem solid #4d4d4d;
  cursor: pointer;
  padding: 0.8rem 1rem 0.7rem;
  text-transform: capitalize;
}
.btn.toggle-btn {
  border-color: lightgray;
  border-width: 1px;
}
.btn.toggle-btn[aria-pressed="true"] {
  border-color: #4d4d4d;
  text-decoration: underline;
}
.btn__danger {
  background-color: #ca3c3c;
  border-color: #bd2130;
  color: white;
}
.btn__filter {
  border-color: lightgrey;
}
.btn__primary {
  background-color: black;
  color: white;
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
  flex: 0 0 100%;
  margin: 0;
  text-align: center;
}
.visually-hidden {
  clip: rect(1px, 1px, 1px, 1px);
  height: 1px;
  overflow: hidden;
  position: absolute !important;
  white-space: nowrap;
  width: 1px;
}
[class*="stack"] > * {
  margin-bottom: 0;
  margin-top: 0;
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
/* End global styles */
/* General app styles */
.todoapp {
  background: white;
  box-shadow:
    0 2px 4px 0 rgb(0 0 0 / 20%),
    0 2.5rem 5rem 0 rgb(0 0 0 / 10%);
  margin: 2rem 0 4rem 0;
  padding: 1rem;
  position: relative;
}
@media screen and (width >= 550px) {
  .todoapp {
    padding: 4rem;
  }
}
.todoapp > * {
  margin-left: auto;
  margin-right: auto;
  max-width: 50rem;
}
.todoapp > form {
  max-width: 100%;
}
.todoapp > h1 {
  display: block;
  margin: 0;
  margin-bottom: 1rem;
  max-width: 100%;
  text-align: center;
}
.label__lg {
  line-height: 1.01567;
  font-weight: 300;
  margin-bottom: 1rem;
  padding: 0.8rem;
  text-align: center;
}
.input__lg {
  border: 2px solid black;
  padding: 2rem;
}
.input__lg:focus-visible {
  border-color: #4d4d4d;
  box-shadow: inset 0 0 0 2px;
}
[class*="__lg"] {
  display: inline-block;
  font-size: 1.9rem;
  width: 100%;
}
[class*="__lg"]:not(:last-child) {
  margin-bottom: 1rem;
}
@media screen and (width >= 620px) {
  [class*="__lg"] {
    font-size: 2.4rem;
  }
}
/* End general app styles */
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
  border: 2px solid #565656;
  min-height: 4.4rem;
  padding: 0.4rem 0.8rem;
  width: 100%;
}
.todo-text:focus-visible {
  box-shadow: inset 0 0 0 2px;
}
/* End todo item styles */
/* Checkbox styles */
.c-cb {
  -webkit-font-smoothing: antialiased;
  box-sizing: border-box;
  clear: left;
  display: block;
  font-family: "Arial", sans-serif;
  font-size: 1.6rem;
  font-weight: normal;
  line-height: 1.25;
  min-height: 44px;
  padding-left: 40px;
  position: relative;
}
.c-cb > label::before,
.c-cb > input[type="checkbox"] {
  box-sizing: border-box;
  height: 44px;
  left: -2px;
  top: -2px;
  width: 44px;
}
.c-cb > input[type="checkbox"] {
  -webkit-font-smoothing: antialiased;
  cursor: pointer;
  margin: 0;
  opacity: 0;
  position: absolute;
  z-index: 1;
}
.c-cb > label {
  cursor: pointer;
  display: inline-block;
  font-family: inherit;
  font-size: inherit;
  line-height: inherit;
  margin-bottom: 0;
  padding: 8px 15px 5px;
  touch-action: manipulation;
}
.c-cb > label::before {
  background: transparent;
  border: 2px solid currentColor;
  content: "";
  position: absolute;
}
.c-cb > input[type="checkbox"]:focus-visible + label::before {
  border-width: 4px;
  outline: 3px dashed #228bec;
}
.c-cb > label::after {
  background: transparent;
  border: solid;
  border-width: 0 0 5px 5px;
  border-top-color: transparent;
  box-sizing: content-box;
  content: "";
  height: 7px;
  left: 9px;
  opacity: 0;
  position: absolute;
  top: 11px;
  transform: rotate(-45deg);
  width: 18px;
}
.c-cb > input[type="checkbox"]:checked + label::after {
  opacity: 1;
}
/* End checkbox styles */
```

Lưu và nhìn lại trình duyệt, ứng dụng của bạn bây giờ sẽ có kiểu dáng hợp lý.

## Tóm tắt

Bây giờ ứng dụng danh sách việc cần làm của chúng ta thực sự trông giống như một ứng dụng thực sự hơn! Vấn đề là: nó thực sự chưa làm gì. Chúng ta sẽ bắt đầu sửa điều đó trong chương tiếp theo!

{{PreviousMenuNext("Learn_web_development/Core/Frameworks_libraries/React_getting_started","Learn_web_development/Core/Frameworks_libraries/React_components", "Learn_web_development/Core/Frameworks_libraries")}}
