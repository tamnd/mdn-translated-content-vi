---
title: Phân chia ứng dụng React của chúng ta thành các thành phần
short-title: Các thành phần React
slug: Learn_web_development/Core/Frameworks_libraries/React_components
page-type: learn-module-chapter
sidebar: learnsidebar
---

{{PreviousMenuNext("Learn_web_development/Core/Frameworks_libraries/React_todo_list_beginning","Learn_web_development/Core/Frameworks_libraries/React_interactivity_events_state", "Learn_web_development/Core/Frameworks_libraries")}}

Tại thời điểm này, ứng dụng của chúng ta là một khối đơn lẻ. Trước khi chúng ta có thể làm cho nó hoạt động, chúng ta cần chia nhỏ nó thành các thành phần có thể quản lý và mô tả được. React không có quy tắc cứng nhắc nào về thành phần là gì và không phải là gì — điều đó tùy thuộc vào bạn! Trong bài viết này, chúng tôi sẽ chỉ cho bạn một cách hợp lý để chia ứng dụng của chúng ta thành các thành phần.

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
        Một cách hợp lý để chia ứng dụng danh sách việc cần làm thành các thành phần.
      </td>
    </tr>
  </tbody>
</table>

## Định nghĩa thành phần đầu tiên của chúng ta

Định nghĩa thành phần có vẻ khó khăn cho đến khi bạn có một số thực hành, nhưng điểm mấu chốt là:

- Nếu nó đại diện cho một "khối" rõ ràng của ứng dụng, đó có thể là một thành phần
- Nếu nó được tái sử dụng thường xuyên, đó có thể là một thành phần.

Điểm thứ hai đặc biệt có giá trị: tạo một thành phần từ các phần tử giao diện người dùng thông dụng cho phép bạn thay đổi code ở một nơi và thấy những thay đổi đó ở mọi nơi thành phần đó được sử dụng. Bạn cũng không phải chia nhỏ mọi thứ thành các thành phần ngay lập tức. Hãy lấy điểm thứ hai làm nguồn cảm hứng và tạo một thành phần từ phần được tái sử dụng nhiều nhất, quan trọng nhất của giao diện người dùng: một mục danh sách việc cần làm.

## Tạo `<Todo />`

Trước khi chúng ta có thể tạo một thành phần, chúng ta nên tạo một tệp mới cho nó. Thực ra, chúng ta nên tạo một thư mục chỉ dành cho các thành phần. Hãy chắc chắn rằng bạn đang ở gốc của ứng dụng trước khi bạn chạy những lệnh này!

```bash
# create a `components` directory
mkdir src/components
# within `components`, create a file called `Todo.jsx`
touch src/components/Todo.jsx
```

Đừng quên khởi động lại máy chủ phát triển nếu bạn đã dừng nó để chạy các lệnh trước!

Hãy thêm hàm `Todo()` trong `Todo.jsx`. Ở đây, chúng ta định nghĩa hàm và xuất nó:

```jsx
function Todo() {}

export default Todo;
```

Cho đến nay điều này ổn, nhưng thành phần của chúng ta nên trả về thứ gì đó hữu ích! Quay lại `src/App.jsx`, sao chép [`<li>`](/en-US/docs/Web/HTML/Reference/Elements/li) đầu tiên từ bên trong danh sách không có thứ tự, và dán nó vào `Todo.jsx` để nó trông như thế này:

```jsx
function Todo() {
  return (
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
  );
}

export default Todo;
```

Bây giờ chúng ta có thứ gì đó có thể sử dụng. Trong `App.jsx`, thêm dòng sau ở đầu tệp để nhập `Todo`:

```jsx
import Todo from "./components/Todo";
```

Với thành phần này được nhập, bạn có thể thay thế tất cả các phần tử `<li>` trong `App.jsx` bằng các lời gọi thành phần `<Todo />`. `<ul>` của bạn trông như thế này:

```jsx
<ul
  role="list"
  className="todo-list stack-large stack-exception"
  aria-labelledby="list-heading">
  <Todo />
  <Todo />
  <Todo />
</ul>
```

Khi bạn quay lại ứng dụng, bạn sẽ nhận thấy điều gì đó không may: danh sách của bạn bây giờ lặp lại tác vụ đầu tiên ba lần!

![Our todo list app, with todo components repeating because the label is hardcoded into the component](todo-list-repeating-todos.png)

Chúng ta không chỉ muốn ăn; chúng ta có những thứ khác để — à — phải làm. Tiếp theo chúng ta sẽ xem cách chúng ta có thể làm cho các lời gọi thành phần khác nhau kết xuất nội dung duy nhất.

## Tạo `<Todo />` duy nhất

Các thành phần mạnh mẽ vì chúng cho phép chúng ta tái sử dụng các phần của giao diện người dùng, và tham chiếu đến một nơi để lấy nguồn gốc của giao diện người dùng đó. Vấn đề là, chúng ta thường không muốn tái sử dụng tất cả mỗi thành phần; chúng ta muốn tái sử dụng hầu hết các phần, và thay đổi các phần nhỏ. Đây là lúc props xuất hiện.

### Có gì trong tên `name`?

Để theo dõi tên của các tác vụ chúng ta muốn hoàn thành, chúng ta nên đảm bảo rằng mỗi thành phần `<Todo />` kết xuất một tên duy nhất.

Trong `App.jsx`, cho mỗi `<Todo />` một prop name. Hãy sử dụng tên của các tác vụ chúng ta đã có trước đây:

```jsx
<ul
  role="list"
  className="todo-list stack-large stack-exception"
  aria-labelledby="list-heading">
  <Todo name="Eat" />
  <Todo name="Sleep" />
  <Todo name="Repeat" />
</ul>
```

Khi trình duyệt của bạn làm mới, bạn sẽ thấy... cùng một thứ như trước. Chúng ta đã cho `<Todo />` một số props, nhưng chúng ta chưa sử dụng chúng. Hãy quay lại `Todo.jsx` và khắc phục điều đó.

Đầu tiên sửa đổi định nghĩa hàm `Todo()` để nó nhận `props` như một tham số. Bạn có thể `console.log()` các props nếu bạn muốn kiểm tra rằng chúng đang được thành phần nhận đúng cách.

Một khi bạn tự tin rằng thành phần đang nhận props, bạn có thể thay thế mỗi lần xuất hiện của `Eat` bằng prop `name` của bạn bằng cách đọc `props.name`. Hãy nhớ: `props.name` là biểu thức JSX, vì vậy bạn cần bọc nó trong dấu ngoặc nhọn.

Tổng hợp tất cả lại, hàm `Todo()` của bạn trông như thế này:

```jsx
function Todo(props) {
  return (
    <li className="todo stack-small">
      <div className="c-cb">
        <input id="todo-0" type="checkbox" defaultChecked={true} />
        <label className="todo-label" htmlFor="todo-0">
          {props.name}
        </label>
      </div>
      <div className="btn-group">
        <button type="button" className="btn">
          Edit <span className="visually-hidden">{props.name}</span>
        </button>
        <button type="button" className="btn btn__danger">
          Delete <span className="visually-hidden">{props.name}</span>
        </button>
      </div>
    </li>
  );
}

export default Todo;
```

_Bây giờ_ trình duyệt của bạn sẽ hiển thị ba tác vụ duy nhất. Tuy nhiên, một vấn đề khác vẫn còn: chúng tất cả vẫn được kiểm tra theo mặc định.

![Our todo list, with different todo labels now they are passed into the components as props](todo-list-unique-todos.png)

### Nó đã `completed` chưa?

Trong danh sách tĩnh ban đầu của chúng ta, chỉ `Eat` được kiểm tra. Một lần nữa, chúng ta muốn tái sử dụng _hầu hết_ giao diện người dùng tạo nên thành phần `<Todo />`, nhưng thay đổi một thứ. Đó là công việc tốt cho một prop khác! Cho lời gọi `<Todo />` đầu tiên một prop boolean là `completed`, và để hai cái kia như cũ.

```jsx
<ul
  role="list"
  className="todo-list stack-large stack-exception"
  aria-labelledby="list-heading">
  <Todo name="Eat" completed />
  <Todo name="Sleep" />
  <Todo name="Repeat" />
</ul>
```

Như trước, chúng ta phải quay lại `Todo.jsx` để thực sự sử dụng các props này. Thay đổi thuộc tính `defaultChecked` trên `<input />` để giá trị của nó bằng prop `completed`. Khi bạn hoàn thành, phần tử `<input />` của thành phần Todo trông như thế này:

```jsx
<input id="todo-0" type="checkbox" defaultChecked={props.completed} />
```

Và trình duyệt của bạn sẽ cập nhật để chỉ hiển thị `Eat` được kiểm tra:

![Our todo list app, now with differing checked states - some checkboxes are checked, others not](todo-list-differing-checked-states.png)

Nếu bạn thay đổi prop `completed` của mỗi thành phần `<Todo />`, trình duyệt sẽ kiểm tra hoặc bỏ kiểm tra các hộp kiểm tương ứng đã được kết xuất.

### Cho tôi một số `id`, xin vui lòng

Chúng ta vẫn có _một_ vấn đề khác: thành phần `<Todo />` của chúng ta cho mỗi tác vụ một thuộc tính `id` là `todo-0`. Điều này không tốt vì một vài lý do:

- [Thuộc tính `id`](/en-US/docs/Web/HTML/Reference/Global_attributes/id) phải là duy nhất (chúng được sử dụng như các định danh duy nhất cho các đoạn tài liệu, bởi CSS, JavaScript, v.v.).
- Khi `id` không phải là duy nhất, chức năng của [các phần tử label](/en-US/docs/Web/HTML/Reference/Elements/label) có thể bị hỏng.

Vấn đề thứ hai đang ảnh hưởng đến ứng dụng của chúng ta ngay bây giờ. Nếu bạn nhấp vào chữ "Sleep" bên cạnh hộp kiểm thứ hai, bạn sẽ nhận thấy hộp kiểm "Eat" bật tắt thay vì hộp kiểm "Sleep". Điều này là vì phần tử `<label>` của mỗi hộp kiểm có thuộc tính `htmlFor` là `todo-0`. `<label>` chỉ thừa nhận phần tử đầu tiên với thuộc tính `id` nhất định, gây ra vấn đề bạn thấy khi nhấp vào các nhãn khác.

Chúng ta đã có thuộc tính `id` duy nhất trước khi chúng ta tạo thành phần `<Todo />`. Hãy đưa chúng trở lại, theo định dạng `todo-i`, trong đó `i` tăng thêm một mỗi lần. Cập nhật các phiên bản thành phần `Todo` bên trong `App.jsx` để thêm props `id`, như sau:

```jsx
<ul
  role="list"
  className="todo-list stack-large stack-exception"
  aria-labelledby="list-heading">
  <Todo name="Eat" id="todo-0" completed />
  <Todo name="Sleep" id="todo-1" />
  <Todo name="Repeat" id="todo-2" />
</ul>
```

> [!NOTE]
> Prop `completed` ở cuối ở đây vì nó là boolean không có phép gán. Đây chỉ là quy ước phong cách. Thứ tự của props không quan trọng vì props là các đối tượng JavaScript, và các đối tượng JavaScript không có thứ tự.

Bây giờ hãy quay lại `Todo.jsx` và sử dụng prop `id`. Nó cần thay thế giá trị thuộc tính `id` của phần tử `<input />`, cũng như giá trị thuộc tính `htmlFor` của `<label>` của nó:

```jsx
<div className="c-cb">
  <input id={props.id} type="checkbox" defaultChecked={props.completed} />
  <label className="todo-label" htmlFor={props.id}>
    {props.name}
  </label>
</div>
```

Với những sửa chữa này, việc nhấp vào nhãn bên cạnh mỗi hộp kiểm sẽ làm những gì chúng ta mong đợi — kiểm tra và bỏ kiểm tra các hộp kiểm bên cạnh những nhãn đó.

## Cho đến nay, không tệ?

Chúng ta đang sử dụng React tốt cho đến nay, nhưng chúng ta có thể làm tốt hơn! Code của chúng ta lặp đi lặp lại. Ba dòng kết xuất thành phần `<Todo />` gần như giống hệt nhau, với chỉ một sự khác biệt: giá trị của mỗi prop.

Chúng ta có thể dọn dẹp code với một trong những khả năng cốt lõi của JavaScript: lặp. Để sử dụng lặp, chúng ta nên suy nghĩ lại về các tác vụ.

## Tác vụ là dữ liệu

Mỗi tác vụ của chúng ta hiện chứa ba thông tin: tên của nó, liệu nó đã được kiểm tra hay chưa, và ID duy nhất của nó. Dữ liệu này được dịch khéo léo sang một đối tượng. Vì chúng ta có nhiều hơn một tác vụ, một mảng đối tượng sẽ hoạt động tốt để đại diện dữ liệu này.

Trong `src/main.jsx`, khai báo một `const` mới bên dưới lần nhập cuối cùng, nhưng phía trên `ReactDOM.createRoot()`:

```jsx
const DATA = [
  { id: "todo-0", name: "Eat", completed: true },
  { id: "todo-1", name: "Sleep", completed: false },
  { id: "todo-2", name: "Repeat", completed: false },
];
```

> [!NOTE]
> Nếu trình soạn thảo văn bản của bạn có plugin [ESLint](https://eslint.org/), bạn có thể thấy cảnh báo trên `const DATA` này. Cảnh báo này xuất phát từ cấu hình ESLint được cung cấp bởi mẫu Vite chúng ta đã sử dụng, và nó không áp dụng cho code này. Bạn có thể an toàn tắt cảnh báo bằng cách thêm `// eslint-disable-next-line` vào dòng phía trên `const DATA`.

Tiếp theo, chúng ta sẽ truyền `DATA` cho `<App />` như một prop, gọi là `tasks`. Cập nhật lời gọi thành phần `<App />` bên trong `src/main.jsx` để trông như thế này:

```jsx
<App tasks={DATA} />
```

Mảng `DATA` bây giờ có sẵn bên trong thành phần App như `props.tasks`. Bạn có thể `console.log()` nó để kiểm tra, nếu muốn.

> [!NOTE]
> Tên hằng số `ALL_CAPS` không có ý nghĩa đặc biệt trong JavaScript; chúng là quy ước cho các nhà phát triển khác biết "dữ liệu này sẽ không bao giờ thay đổi sau khi được định nghĩa ở đây".

## Kết xuất với lặp

Để kết xuất mảng đối tượng, chúng ta phải biến mỗi đối tượng thành thành phần `<Todo />`. JavaScript cung cấp cho chúng ta một phương thức mảng để biến đổi các mục thành thứ gì đó khác: [`Array.prototype.map()`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Array/map).

Bên trong `App.jsx`, tạo một `const` mới phía trên câu lệnh `return` của hàm `App()` gọi là `taskList`. Hãy bắt đầu bằng cách biến đổi mỗi tác vụ trong mảng `props.tasks` thành `name` của nó. Toán tử `?.` cho phép chúng ta thực hiện [optional chaining](/en-US/docs/Web/JavaScript/Reference/Operators/Optional_chaining) để kiểm tra xem `props.tasks` có phải là `undefined` hoặc `null` trước khi cố gắng tạo mảng tên tác vụ mới không:

```jsx
const taskList = props.tasks?.map((task) => task.name);
```

Hãy thử thay thế tất cả con của `<ul>` bằng `taskList`:

```jsx
<ul
  role="list"
  className="todo-list stack-large stack-exception"
  aria-labelledby="list-heading">
  {taskList}
</ul>
```

Điều này giúp chúng ta một phần để hiển thị lại tất cả các thành phần, nhưng chúng ta còn nhiều việc phải làm: trình duyệt hiện tại kết xuất tên của mỗi tác vụ như văn bản thuần túy. Chúng ta thiếu cấu trúc HTML — `<li>` và các hộp kiểm và nút của nó!

![Our todo list app with the todo item labels just shown bunched up on one line](todo-list-unstructured-names.png)

Để sửa điều này, chúng ta cần trả về thành phần `<Todo />` từ hàm `map()` — nhớ rằng JSX là JavaScript, vì vậy chúng ta có thể sử dụng nó cùng với bất kỳ cú pháp JavaScript quen thuộc nào khác. Hãy thử như sau thay vì những gì chúng ta đã có:

```jsx
const taskList = props.tasks?.map((task) => <Todo />);
```

Nhìn lại ứng dụng; bây giờ các tác vụ trông giống như chúng đã từng, nhưng chúng thiếu tên của chính các tác vụ. Hãy nhớ rằng mỗi tác vụ chúng ta map qua chứa các thuộc tính `id`, `name` và `completed` mà chúng ta muốn truyền vào thành phần `<Todo />`. Nếu chúng ta tổng hợp kiến thức đó, chúng ta có code như thế này:

```jsx
const taskList = props.tasks?.map((task) => (
  <Todo id={task.id} name={task.name} completed={task.completed} />
));
```

Bây giờ ứng dụng trông giống như trước, và code của chúng ta ít lặp lại hơn.

## Khóa duy nhất

Bây giờ React đang kết xuất các tác vụ của chúng ta từ một mảng, nó phải theo dõi cái nào là cái nào để kết xuất chúng đúng cách. React cố gắng tự đoán để theo dõi mọi thứ, nhưng chúng ta có thể giúp bằng cách truyền prop `key` cho các thành phần `<Todo />`. `key` là một prop đặc biệt được React quản lý — bạn không thể sử dụng từ `key` cho bất kỳ mục đích nào khác.

Vì các khóa nên là duy nhất, chúng ta sẽ tái sử dụng `id` của mỗi đối tượng tác vụ như khóa của nó. Cập nhật hằng số `taskList` như sau:

```jsx
const taskList = props.tasks?.map((task) => (
  <Todo
    id={task.id}
    name={task.name}
    completed={task.completed}
    key={task.id}
  />
));
```

**Bạn nên luôn truyền khóa duy nhất cho bất cứ thứ gì bạn kết xuất bằng lặp.** Không có gì rõ ràng sẽ thay đổi trong trình duyệt, nhưng nếu bạn không sử dụng khóa duy nhất, React sẽ ghi cảnh báo vào console và ứng dụng có thể hoạt động kỳ lạ!

## Phân chia thành phần phần còn lại của ứng dụng

Bây giờ chúng ta đã sắp xếp xong thành phần quan trọng nhất, chúng ta có thể chuyển phần còn lại của ứng dụng thành các thành phần. Hãy nhớ rằng các thành phần là các phần giao diện người dùng rõ ràng, các phần giao diện người dùng được tái sử dụng, hoặc cả hai, chúng ta có thể tạo thêm hai thành phần:

- `<Form />`
- `<FilterButton />`

Vì chúng ta biết mình cần cả hai, chúng ta có thể gộp một số công việc tạo tệp lại trong một lệnh terminal. Chạy lệnh này trong terminal, chú ý rằng bạn đang ở thư mục gốc của ứng dụng:

```bash
touch src/components/{Form,FilterButton}.jsx
```

### `<Form />`

Mở `components/Form.jsx` và làm như sau:

- Khai báo hàm `Form()` và xuất nó ở cuối tệp.
- Sao chép thẻ `<form>` và mọi thứ giữa chúng từ bên trong `App.jsx`, và dán chúng bên trong câu lệnh `return` của `Form()`.

Tệp `Form.jsx` của bạn trông như thế này:

```jsx
function Form() {
  return (
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
  );
}

export default Form;
```

### `<FilterButton />`

Làm tương tự như bạn đã làm để tạo `Form.jsx` bên trong `FilterButton.jsx`, nhưng gọi thành phần là `FilterButton()` và sao chép HTML cho nút đầu tiên bên trong `<div className="filters btn-group stack-exception">` từ `App.jsx` vào câu lệnh `return`.

Tệp trông như thế này:

```jsx
function FilterButton() {
  return (
    <button type="button" className="btn toggle-btn" aria-pressed="true">
      <span className="visually-hidden">Show </span>
      <span>all </span>
      <span className="visually-hidden"> tasks</span>
    </button>
  );
}

export default FilterButton;
```

> [!NOTE]
> Bạn có thể nhận thấy rằng chúng ta đang mắc cùng một lỗi ở đây như chúng ta đã mắc lần đầu tiên với thành phần `<Todo />`, ở chỗ mỗi nút sẽ như nhau. Điều đó ổn! Chúng ta sẽ sửa thành phần này sau, trong [Quay lại các nút lọc](/en-US/docs/Learn_web_development/Core/Frameworks_libraries/React_interactivity_filtering_conditional_rendering#back_to_the_filter_buttons).

## Nhập tất cả các thành phần của chúng ta

Hãy sử dụng các thành phần mới của chúng ta. Thêm một số câu lệnh `import` vào đầu `App.jsx` và tham chiếu các thành phần chúng ta vừa tạo. Sau đó, cập nhật câu lệnh `return` của `App()` để nó kết xuất các thành phần của chúng ta.

Khi bạn hoàn thành, `App.jsx` trông như thế này:

```jsx
import Form from "./components/Form";
import FilterButton from "./components/FilterButton";
import Todo from "./components/Todo";

function App(props) {
  const taskList = props.tasks?.map((task) => (
    <Todo
      id={task.id}
      name={task.name}
      completed={task.completed}
      key={task.id}
    />
  ));
  return (
    <div className="todoapp stack-large">
      <h1>TodoMatic</h1>
      <Form />
      <div className="filters btn-group stack-exception">
        <FilterButton />
        <FilterButton />
        <FilterButton />
      </div>
      <h2 id="list-heading">3 tasks remaining</h2>
      <ul
        role="list"
        className="todo-list stack-large stack-exception"
        aria-labelledby="list-heading">
        {taskList}
      </ul>
    </div>
  );
}

export default App;
```

Với điều này, ứng dụng React của bạn sẽ kết xuất về cơ bản giống như trước, nhưng sử dụng các thành phần mới tuyệt đẹp của bạn.

## Tóm tắt

Và đó là tất cả cho bài viết này — chúng ta đã đi sâu vào cách chia ứng dụng thành các thành phần một cách khéo léo và kết xuất chúng hiệu quả. Tiếp theo chúng ta sẽ xem xét xử lý sự kiện trong React, và bắt đầu thêm một số tính tương tác.

{{PreviousMenuNext("Learn_web_development/Core/Frameworks_libraries/React_todo_list_beginning","Learn_web_development/Core/Frameworks_libraries/React_interactivity_events_state", "Learn_web_development/Core/Frameworks_libraries")}}
