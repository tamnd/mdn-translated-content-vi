---
title: "Tính tương tác React: Chỉnh sửa, lọc, kết xuất có điều kiện"
short-title: Chỉnh sửa, lọc, giao diện người dùng có điều kiện React
slug: Learn_web_development/Core/Frameworks_libraries/React_interactivity_filtering_conditional_rendering
page-type: learn-module-chapter
sidebar: learnsidebar
---

{{PreviousMenuNext("Learn_web_development/Core/Frameworks_libraries/React_interactivity_events_state","Learn_web_development/Core/Frameworks_libraries/React_accessibility", "Learn_web_development/Core/Frameworks_libraries")}}

Khi chúng ta gần đến cuối hành trình React (ít nhất là hiện tại), chúng ta sẽ thêm những điểm hoàn thiện cho các khu vực chức năng chính trong ứng dụng danh sách việc cần làm. Điều này bao gồm cho phép bạn chỉnh sửa các tác vụ hiện có, và lọc danh sách tác vụ giữa tất cả, đã hoàn thành và chưa hoàn thành. Chúng ta sẽ xem xét kết xuất giao diện người dùng có điều kiện trong quá trình đó.

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
        Kết xuất có điều kiện trong React, và triển khai lọc danh sách
        và giao diện người dùng chỉnh sửa trong ứng dụng.
      </td>
    </tr>
  </tbody>
</table>

## Chỉnh sửa tên của tác vụ

Chúng ta chưa có giao diện người dùng để chỉnh sửa tên tác vụ. Chúng ta sẽ đến điều đó trong giây lát. Để bắt đầu, chúng ta có thể ít nhất triển khai hàm `editTask()` trong `App.jsx`. Nó sẽ tương tự như `deleteTask()` vì nó sẽ nhận `id` để tìm đối tượng mục tiêu, nhưng nó cũng sẽ nhận thuộc tính `newName` chứa tên để cập nhật tác vụ. Chúng ta sẽ sử dụng [`Array.prototype.map()`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Array/map) thay vì [`Array.prototype.filter()`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Array/filter) vì chúng ta muốn trả về mảng mới với một số thay đổi, thay vì xóa thứ gì đó khỏi mảng.

Thêm hàm `editTask()` bên trong thành phần `<App />`, ở cùng chỗ với các hàm khác:

```jsx
function editTask(id, newName) {
  const editedTaskList = tasks.map((task) => {
    // if this task has the same ID as the edited task
    if (id === task.id) {
      // Copy the task and update its name
      return { ...task, name: newName };
    }
    // Return the original task if it's not the edited task
    return task;
  });
  setTasks(editedTaskList);
}
```

Truyền `editTask` vào các thành phần `<Todo />` như prop theo cùng cách chúng ta làm với `deleteTask`:

```jsx
const taskList = tasks.map((task) => (
  <Todo
    id={task.id}
    name={task.name}
    completed={task.completed}
    key={task.id}
    toggleTaskCompleted={toggleTaskCompleted}
    deleteTask={deleteTask}
    editTask={editTask}
  />
));
```

Bây giờ mở `Todo.jsx`. Chúng ta sẽ thực hiện một số tái cấu trúc.

## Giao diện người dùng để chỉnh sửa

Để cho phép người dùng chỉnh sửa tác vụ, chúng ta phải cung cấp giao diện người dùng cho họ làm điều đó. Đầu tiên, nhập `useState` vào thành phần `<Todo />` như chúng ta đã làm trước đây với thành phần `<App />`:

```jsx
import { useState } from "react";
```

Chúng ta sẽ sử dụng điều này để đặt trạng thái `isEditing` với giá trị mặc định là `false`. Thêm dòng sau ngay bên trong đầu định nghĩa thành phần `<Todo />`:

```jsx
const [isEditing, setEditing] = useState(false);
```

Tiếp theo, chúng ta sẽ suy nghĩ lại về thành phần `<Todo />`. Từ bây giờ, chúng ta muốn nó hiển thị một trong hai "mẫu" có thể, thay vì mẫu đơn lẻ mà nó đã sử dụng cho đến nay:

- Mẫu "xem", khi chúng ta chỉ xem việc cần làm; đây là những gì chúng ta đã sử dụng trong hướng dẫn cho đến nay.
- Mẫu "chỉnh sửa", khi chúng ta đang chỉnh sửa việc cần làm. Chúng ta sắp tạo điều này.

Sao chép khối code này vào hàm `Todo()`, bên dưới hook `useState()` nhưng phía trên câu lệnh `return`:

```jsx
const editingTemplate = (
  <form className="stack-small">
    <div className="form-group">
      <label className="todo-label" htmlFor={props.id}>
        New name for {props.name}
      </label>
      <input id={props.id} className="todo-text" type="text" />
    </div>
    <div className="btn-group">
      <button type="button" className="btn todo-cancel">
        Cancel
        <span className="visually-hidden">renaming {props.name}</span>
      </button>
      <button type="submit" className="btn btn__primary todo-edit">
        Save
        <span className="visually-hidden">new name for {props.name}</span>
      </button>
    </div>
  </form>
);
const viewTemplate = (
  <div className="stack-small">
    <div className="c-cb">
      <input
        id={props.id}
        type="checkbox"
        defaultChecked={props.completed}
        onChange={() => props.toggleTaskCompleted(props.id)}
      />
      <label className="todo-label" htmlFor={props.id}>
        {props.name}
      </label>
    </div>
    <div className="btn-group">
      <button type="button" className="btn">
        Edit <span className="visually-hidden">{props.name}</span>
      </button>
      <button
        type="button"
        className="btn btn__danger"
        onClick={() => props.deleteTask(props.id)}>
        Delete <span className="visually-hidden">{props.name}</span>
      </button>
    </div>
  </div>
);
```

Bây giờ chúng ta đã có hai cấu trúc mẫu khác nhau — "chỉnh sửa" và "xem" — được định nghĩa bên trong hai hằng số riêng biệt. Điều này có nghĩa là câu lệnh `return` của `<Todo />` bây giờ lặp đi lặp lại — nó cũng chứa định nghĩa mẫu "xem". Chúng ta có thể dọn dẹp điều này bằng cách sử dụng **kết xuất có điều kiện** để xác định mẫu nào thành phần trả về, và do đó được kết xuất trong giao diện người dùng.

## Kết xuất có điều kiện

Trong JSX, chúng ta có thể sử dụng điều kiện để thay đổi những gì được kết xuất bởi trình duyệt. Để viết điều kiện trong JSX, chúng ta có thể sử dụng [toán tử ternary](/en-US/docs/Web/JavaScript/Reference/Operators/Conditional_operator).

Trong trường hợp thành phần `<Todo />`, điều kiện của chúng ta là "Tác vụ này đang được chỉnh sửa không?" Thay đổi câu lệnh `return` bên trong `Todo()` để nó trông như thế này:

```jsx
return <li className="todo">{isEditing ? editingTemplate : viewTemplate}</li>;
```

Trình duyệt của bạn sẽ kết xuất tất cả tác vụ như trước. Để xem mẫu chỉnh sửa, bạn sẽ phải thay đổi trạng thái `isEditing` mặc định từ `false` thành `true` trong code của bạn ngay bây giờ; chúng ta sẽ xem xét việc làm cho nút chỉnh sửa bật/tắt điều này trong phần tiếp theo!

## Bật/tắt các mẫu `<Todo />`

Cuối cùng, chúng ta sẵn sàng làm cho tính năng cốt lõi cuối cùng của mình tương tác. Để bắt đầu, chúng ta muốn gọi `setEditing()` với giá trị `true` khi người dùng nhấn nút "Edit" trong `viewTemplate`, để chúng ta có thể chuyển đổi mẫu.

Cập nhật nút "Edit" trong `viewTemplate` như thế này:

```jsx
<button type="button" className="btn" onClick={() => setEditing(true)}>
  Edit <span className="visually-hidden">{props.name}</span>
</button>
```

Bây giờ chúng ta sẽ thêm cùng trình xử lý `onClick` vào nút "Cancel" trong `editingTemplate`, nhưng lần này chúng ta sẽ đặt `isEditing` thành `false` để nó chuyển chúng ta trở lại mẫu xem.

Cập nhật nút "Cancel" trong `editingTemplate` như thế này:

```jsx
<button
  type="button"
  className="btn todo-cancel"
  onClick={() => setEditing(false)}>
  Cancel
  <span className="visually-hidden">renaming {props.name}</span>
</button>
```

Với code này, bạn có thể nhấn các nút "Edit" và "Cancel" trong các mục việc cần làm để chuyển đổi giữa các mẫu.

![The eat todo item showing the view template, with edit and delete buttons available](view.png)

![The eat todo item showing the edit template, with an input field to enter a new name, and cancel and save buttons available](edit.png)

Bước tiếp theo là thực sự làm cho chức năng chỉnh sửa hoạt động.

## Chỉnh sửa từ giao diện người dùng

Phần lớn những gì chúng ta sắp làm sẽ phản ánh công việc chúng ta đã làm trong `Form.jsx`: khi người dùng gõ vào trường đầu vào mới của chúng ta, chúng ta cần theo dõi văn bản họ nhập; một khi họ gửi biểu mẫu, chúng ta cần sử dụng callback prop để cập nhật trạng thái với tên mới của tác vụ.

Chúng ta sẽ bắt đầu bằng cách tạo hook mới để lưu trữ và đặt tên mới. Vẫn trong `Todo.jsx`, đặt phần sau bên dưới hook hiện có:

```jsx
const [newName, setNewName] = useState("");
```

Tiếp theo, tạo hàm `handleChange()` sẽ đặt tên mới; đặt điều này bên dưới các hook nhưng trước các mẫu:

```jsx
function handleChange(e) {
  setNewName(e.target.value);
}
```

Bây giờ chúng ta sẽ cập nhật trường `<input />` của `editingTemplate`, đặt thuộc tính `value` là `newName`, và liên kết hàm `handleChange()` với sự kiện `onChange` của nó. Cập nhật như sau:

```jsx
<input
  id={props.id}
  className="todo-text"
  type="text"
  value={newName}
  onChange={handleChange}
/>
```

Cuối cùng, chúng ta cần tạo hàm để xử lý sự kiện `onSubmit` của biểu mẫu chỉnh sửa. Thêm phần sau ngay bên dưới `handleChange()`:

```jsx
function handleSubmit(e) {
  e.preventDefault();
  props.editTask(props.id, newName);
  setNewName("");
  setEditing(false);
}
```

Hãy nhớ rằng callback prop `editTask()` của chúng ta cần ID của tác vụ chúng ta đang chỉnh sửa cũng như tên mới của nó.

Liên kết hàm này với sự kiện `submit` của biểu mẫu bằng cách thêm trình xử lý `onSubmit` sau vào `<form>` của `editingTemplate`:

```jsx
<form className="stack-small" onSubmit={handleSubmit}>
  {/* … */}
</form>
```

Bây giờ bạn có thể chỉnh sửa tác vụ trong trình duyệt. Tại thời điểm này, tệp `Todo.jsx` của bạn trông như thế này:

```jsx
function Todo(props) {
  const [isEditing, setEditing] = useState(false);
  const [newName, setNewName] = useState("");

  function handleChange(e) {
    setNewName(e.target.value);
  }

  function handleSubmit(e) {
    e.preventDefault();
    props.editTask(props.id, newName);
    setNewName("");
    setEditing(false);
  }

  const editingTemplate = (
    <form className="stack-small" onSubmit={handleSubmit}>
      <div className="form-group">
        <label className="todo-label" htmlFor={props.id}>
          New name for {props.name}
        </label>
        <input
          id={props.id}
          className="todo-text"
          type="text"
          value={newName}
          onChange={handleChange}
        />
      </div>
      <div className="btn-group">
        <button
          type="button"
          className="btn todo-cancel"
          onClick={() => setEditing(false)}>
          Cancel
          <span className="visually-hidden">renaming {props.name}</span>
        </button>
        <button type="submit" className="btn btn__primary todo-edit">
          Save
          <span className="visually-hidden">new name for {props.name}</span>
        </button>
      </div>
    </form>
  );

  const viewTemplate = (
    <div className="stack-small">
      <div className="c-cb">
        <input
          id={props.id}
          type="checkbox"
          defaultChecked={props.completed}
          onChange={() => props.toggleTaskCompleted(props.id)}
        />
        <label className="todo-label" htmlFor={props.id}>
          {props.name}
        </label>
      </div>
      <div className="btn-group">
        <button
          type="button"
          className="btn"
          onClick={() => {
            setEditing(true);
          }}>
          Edit <span className="visually-hidden">{props.name}</span>
        </button>
        <button
          type="button"
          className="btn btn__danger"
          onClick={() => props.deleteTask(props.id)}>
          Delete <span className="visually-hidden">{props.name}</span>
        </button>
      </div>
    </div>
  );

  return <li className="todo">{isEditing ? editingTemplate : viewTemplate}</li>;
}

export default Todo;
```

## Quay lại các nút lọc

Bây giờ các tính năng chính của chúng ta đã hoàn chỉnh, chúng ta có thể nghĩ về các nút lọc. Hiện tại, chúng lặp nhãn "All", và chúng không có chức năng! Chúng ta sẽ áp dụng lại một số kỹ năng chúng ta đã sử dụng trong thành phần `<Todo />` để:

- Tạo hook để lưu trữ bộ lọc đang hoạt động.
- Kết xuất mảng các phần tử `<FilterButton />` cho phép người dùng thay đổi bộ lọc đang hoạt động giữa tất cả, đã hoàn thành và chưa hoàn thành.

### Thêm hook lọc

Thêm hook mới vào hàm `App()` để đọc và đặt bộ lọc. Chúng ta muốn bộ lọc mặc định là `All` vì tất cả tác vụ của chúng ta nên được hiển thị ban đầu:

```jsx
const [filter, setFilter] = useState("All");
```

### Định nghĩa các bộ lọc

Mục tiêu của chúng ta ngay bây giờ là hai mặt:

- Mỗi bộ lọc nên có tên duy nhất.
- Mỗi bộ lọc nên có hành vi duy nhất.

Một đối tượng JavaScript sẽ là cách tuyệt vời để liên kết tên với hành vi: mỗi khóa là tên của bộ lọc; mỗi thuộc tính là hành vi liên kết với tên đó.

Ở đầu `App.jsx`, bên dưới các lần nhập nhưng phía trên hàm `App()`, hãy thêm đối tượng có tên `FILTER_MAP`:

```jsx
const FILTER_MAP = {
  All: () => true,
  Active: (task) => !task.completed,
  Completed: (task) => task.completed,
};
```

Các giá trị của `FILTER_MAP` là các hàm mà chúng ta sẽ sử dụng để lọc mảng dữ liệu `tasks`:

- Bộ lọc `All` hiển thị tất cả tác vụ, vì vậy chúng ta trả về `true` cho tất cả tác vụ.
- Bộ lọc `Active` hiển thị các tác vụ có prop `completed` là `false`.
- Bộ lọc `Completed` hiển thị các tác vụ có prop `completed` là `true`.

Bên dưới bổ sung trước đó, thêm phần sau — ở đây chúng ta đang sử dụng phương thức [`Object.keys()`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Object/keys) để thu thập mảng `FILTER_NAMES`:

```jsx
const FILTER_NAMES = Object.keys(FILTER_MAP);
```

> [!NOTE]
> Chúng ta đang định nghĩa các hằng số này bên ngoài hàm `App()` vì nếu chúng được định nghĩa bên trong, chúng sẽ được tính toán lại mỗi khi thành phần `<App />` kết xuất lại, và chúng ta không muốn điều đó. Thông tin này sẽ không bao giờ thay đổi bất kể ứng dụng làm gì.

### Kết xuất các bộ lọc

Bây giờ chúng ta có mảng `FILTER_NAMES`, chúng ta có thể sử dụng nó để kết xuất cả ba bộ lọc. Bên trong hàm `App()`, chúng ta có thể tạo hằng số có tên `filterList`, mà chúng ta sẽ sử dụng để map qua mảng tên và trả về thành phần `<FilterButton />`. Hãy nhớ, chúng ta cũng cần khóa ở đây.

Thêm phần sau bên dưới khai báo hằng số `taskList`:

```jsx
const filterList = FILTER_NAMES.map((name) => (
  <FilterButton key={name} name={name} />
));
```

Bây giờ chúng ta sẽ thay thế ba `<FilterButton />` lặp đi lặp lại trong `App.jsx` bằng `filterList` này. Thay thế phần sau:

```jsx
<div className="filters btn-group stack-exception">
  <FilterButton />
  <FilterButton />
  <FilterButton />
</div>
```

Bằng cái này:

```jsx
<div className="filters btn-group stack-exception">{filterList}</div>
```

Điều này chưa hoạt động ngay. Chúng ta còn một chút việc phải làm trước.

### Bộ lọc tương tác

Để làm cho các nút lọc tương tác, chúng ta nên xem xét những props nào chúng cần sử dụng.

- Chúng ta biết rằng `<FilterButton />` nên báo cáo xem nó có đang được nhấn không, và nó nên được nhấn nếu tên của nó khớp với giá trị hiện tại của trạng thái bộ lọc.
- Chúng ta biết rằng `<FilterButton />` cần callback để đặt bộ lọc đang hoạt động. Chúng ta có thể sử dụng trực tiếp hook `setFilter` của mình.

Cập nhật hằng số `filterList` như sau:

```jsx
const filterList = FILTER_NAMES.map((name) => (
  <FilterButton
    key={name}
    name={name}
    isPressed={name === filter}
    setFilter={setFilter}
  />
));
```

Theo cách tương tự như chúng ta đã làm trước đây với thành phần `<Todo />`, bây giờ chúng ta phải cập nhật `FilterButton.jsx` để sử dụng các props chúng ta đã cho nó. Làm từng điều sau, và nhớ sử dụng dấu ngoặc nhọn để đọc các biến này!

- Thay thế `all` bằng `{props.name}`.
- Đặt giá trị của `aria-pressed` thành `{props.isPressed}`.
- Thêm trình xử lý `onClick` gọi `props.setFilter()` với tên bộ lọc.

Với tất cả điều đó hoàn thành, tệp `FilterButton.jsx` của bạn trông như thế này:

```jsx
function FilterButton(props) {
  return (
    <button
      type="button"
      className="btn toggle-btn"
      aria-pressed={props.isPressed}
      onClick={() => props.setFilter(props.name)}>
      <span className="visually-hidden">Show </span>
      <span>{props.name}</span>
      <span className="visually-hidden"> tasks</span>
    </button>
  );
}

export default FilterButton;
```

Truy cập trình duyệt lại. Bạn sẽ thấy rằng các nút khác nhau đã được đặt tên tương ứng. Khi bạn nhấn nút lọc, bạn sẽ thấy văn bản của nó có viền mới — điều này cho bạn biết nó đã được chọn. Và nếu bạn nhìn vào Page Inspector của DevTool khi nhấp vào các nút, bạn sẽ thấy giá trị thuộc tính `aria-pressed` thay đổi tương ứng.

![The three filter buttons of the app - all, active, and completed - with a focus highlight around completed](filter-buttons.png)

Tuy nhiên, các nút của chúng ta vẫn không thực sự lọc các việc cần làm trong giao diện người dùng! Hãy hoàn thành điều này.

### Lọc tác vụ trong giao diện người dùng

Hiện tại, hằng số `taskList` trong `App()` map qua trạng thái tác vụ và trả về thành phần `<Todo />` mới cho tất cả chúng. Đây không phải là những gì chúng ta muốn! Một tác vụ chỉ nên kết xuất nếu nó được bao gồm trong kết quả áp dụng bộ lọc đã chọn. Trước khi chúng ta map qua trạng thái tác vụ, chúng ta nên lọc nó (với [`Array.prototype.filter()`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Array/filter)) để loại bỏ các đối tượng chúng ta không muốn kết xuất.

Cập nhật `taskList` như thế này:

```jsx
const taskList = tasks
  .filter(FILTER_MAP[filter])
  .map((task) => (
    <Todo
      id={task.id}
      name={task.name}
      completed={task.completed}
      key={task.id}
      toggleTaskCompleted={toggleTaskCompleted}
      deleteTask={deleteTask}
      editTask={editTask}
    />
  ));
```

Để quyết định hàm callback nào sử dụng trong `Array.prototype.filter()`, chúng ta truy cập giá trị trong `FILTER_MAP` tương ứng với khóa của trạng thái bộ lọc. Khi bộ lọc là `All`, ví dụ, `FILTER_MAP[filter]` sẽ đánh giá thành `() => true`.

Chọn bộ lọc trong trình duyệt bây giờ sẽ xóa các tác vụ không đáp ứng tiêu chí của nó. Số đếm trong tiêu đề phía trên danh sách cũng sẽ thay đổi để phản ánh danh sách!

![The app with the filter buttons in place. Active is highlighted, so only the active todo items are being shown.](filtered-todo-list.png)

## Tóm tắt

Vậy là xong — ứng dụng của chúng ta bây giờ đầy đủ chức năng. Tuy nhiên, bây giờ chúng ta đã triển khai tất cả các tính năng, chúng ta có thể thực hiện một vài cải tiến để đảm bảo nhiều loại người dùng hơn có thể sử dụng ứng dụng. Bài viết tiếp theo kết thúc các hướng dẫn React bằng cách xem xét việc bao gồm quản lý tiêu điểm trong React, có thể cải thiện khả năng sử dụng và giảm sự nhầm lẫn cho cả người dùng chỉ dùng bàn phím và trình đọc màn hình.

{{PreviousMenuNext("Learn_web_development/Core/Frameworks_libraries/React_interactivity_events_state","Learn_web_development/Core/Frameworks_libraries/React_accessibility", "Learn_web_development/Core/Frameworks_libraries")}}
