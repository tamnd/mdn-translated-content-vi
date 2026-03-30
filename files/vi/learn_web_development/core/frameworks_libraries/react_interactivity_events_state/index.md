---
title: "Tính tương tác React: Sự kiện và trạng thái"
short-title: Sự kiện và trạng thái React
slug: Learn_web_development/Core/Frameworks_libraries/React_interactivity_events_state
page-type: learn-module-chapter
sidebar: learnsidebar
---

{{PreviousMenuNext("Learn_web_development/Core/Frameworks_libraries/React_components","Learn_web_development/Core/Frameworks_libraries/React_interactivity_filtering_conditional_rendering", "Learn_web_development/Core/Frameworks_libraries")}}

Với kế hoạch thành phần đã được xây dựng, đã đến lúc bắt đầu cập nhật ứng dụng từ giao diện người dùng hoàn toàn tĩnh sang giao diện thực sự cho phép chúng ta tương tác và thay đổi mọi thứ. Trong bài viết này, chúng ta sẽ làm điều này, đào sâu vào sự kiện và trạng thái trong quá trình, và kết thúc với một ứng dụng mà chúng ta có thể thêm và xóa tác vụ thành công, và bật/tắt tác vụ là hoàn thành.

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
        Xử lý sự kiện và trạng thái trong React, và sử dụng chúng để
        bắt đầu làm cho ứng dụng nghiên cứu trường hợp tương tác.
      </td>
    </tr>
  </tbody>
</table>

## Xử lý sự kiện

Nếu bạn chỉ viết JavaScript thuần túy cho đến nay, bạn có thể quen với việc có một tệp JavaScript riêng biệt trong đó bạn truy vấn một số nút DOM và gắn trình lắng nghe vào chúng. Ví dụ, một tệp HTML có thể có một nút trong đó, như thế này:

```html
<button type="button">Say hi!</button>
```

Và một tệp JavaScript có thể có một số code như thế này:

```js
const btn = document.querySelector("button");

btn.addEventListener("click", () => {
  alert("hi!");
});
```

Trong JSX, code mô tả giao diện người dùng nằm ngay bên cạnh trình lắng nghe sự kiện:

```jsx
<button type="button" onClick={() => alert("hi!")}>
  Say hi!
</button>
```

Trong ví dụ này, chúng ta đang thêm thuộc tính `onClick` vào phần tử {{htmlelement("button")}}. Giá trị của thuộc tính đó là một hàm kích hoạt cảnh báo. Điều này có vẻ trái với lời khuyên thực hành tốt nhất về việc không viết trình lắng nghe sự kiện trong HTML, nhưng hãy nhớ: JSX không phải là HTML.

Thuộc tính `onClick` có ý nghĩa đặc biệt ở đây: nó cho React biết để chạy một hàm nhất định khi người dùng nhấp vào nút. Có một vài điều khác cần lưu ý:

- Bản chất {{Glossary("camel_case", "camel-cased")}} của `onClick` là quan trọng — JSX sẽ không nhận ra `onclick` (một lần nữa, nó đã được sử dụng trong JavaScript cho một mục đích cụ thể, liên quan nhưng khác — thuộc tính xử lý [`onclick`](/en-US/docs/Web/API/Element/click_event) tiêu chuẩn).
- Tất cả các sự kiện trình duyệt đều tuân theo định dạng này trong JSX – `on`, theo sau là tên của sự kiện.

Hãy áp dụng điều này cho ứng dụng của chúng ta, bắt đầu trong thành phần `Form.jsx`.

### Xử lý gửi biểu mẫu

Ở đầu hàm thành phần `Form()` (tức là, ngay dưới dòng `function Form() {`), tạo một hàm có tên `handleSubmit()`. Hàm này nên [ngăn hành vi mặc định của sự kiện `submit`](/en-US/docs/Learn_web_development/Core/Scripting/Events#preventing_default_behavior). Sau đó, nó nên kích hoạt `alert()`, có thể nói bất cứ điều gì bạn muốn. Nó nên kết thúc trông như thế này:

```jsx
function handleSubmit(event) {
  event.preventDefault();
  alert("Hello, world!");
}
```

Để sử dụng hàm này, thêm thuộc tính `onSubmit` vào phần tử [`<form>`](/en-US/docs/Web/HTML/Reference/Elements/form), và đặt giá trị của nó là hàm `handleSubmit`:

```jsx
<form onSubmit={handleSubmit}>{/* … */}</form>
```

Bây giờ nếu bạn quay lại trình duyệt và nhấp vào nút "Add", trình duyệt sẽ hiển thị hộp thoại cảnh báo với chữ "Hello, world!" — hoặc bất cứ điều gì bạn chọn để viết ở đó.

## Props callback

Trong các ứng dụng React, tính tương tác hiếm khi chỉ giới hạn ở một thành phần: các sự kiện xảy ra trong một thành phần sẽ ảnh hưởng đến các phần khác của ứng dụng. Khi chúng ta bắt đầu cho bản thân quyền lực để tạo tác vụ mới, những gì xảy ra trong thành phần `<Form />` sẽ ảnh hưởng đến danh sách được kết xuất trong `<App />`.

Chúng ta muốn hàm `handleSubmit()` cuối cùng giúp chúng ta tạo tác vụ mới, vì vậy chúng ta cần cách để truyền thông tin từ `<Form />` sang `<App />`. Chúng ta không thể truyền dữ liệu từ con sang cha theo cùng cách chúng ta truyền dữ liệu từ cha sang con bằng props tiêu chuẩn. Thay vào đó, chúng ta có thể viết một hàm trong `<App />` sẽ mong đợi một số dữ liệu từ biểu mẫu như đầu vào, sau đó truyền hàm đó vào `<Form />` như một prop. Hàm như prop này được gọi là **callback prop**. Một khi chúng ta có callback prop, chúng ta có thể gọi nó bên trong `<Form />` để gửi dữ liệu đúng đến `<App />`.

### Xử lý gửi biểu mẫu qua callback

Bên trong hàm `App()` trong `App.jsx`, tạo một hàm có tên `addTask()` với một tham số duy nhất là `name`:

```jsx
function addTask(name) {
  alert(name);
}
```

Tiếp theo, truyền `addTask()` vào `<Form />` như một prop. Prop có thể có bất kỳ tên nào bạn muốn, nhưng hãy chọn một tên bạn sẽ hiểu sau này. Thứ gì đó như `addTask` hoạt động, vì nó khớp với tên của hàm cũng như những gì hàm sẽ làm. Lời gọi thành phần `<Form />` của bạn nên được cập nhật như sau:

```jsx
<Form addTask={addTask} />
```

Để sử dụng prop này, chúng ta phải thay đổi chữ ký của hàm `Form()` trong `Form.jsx` để nó chấp nhận `props` như một tham số:

```jsx
function Form(props) {
  // …
}
```

Cuối cùng, chúng ta có thể sử dụng prop này bên trong hàm `handleSubmit()` trong thành phần `<Form />`! Cập nhật nó như sau:

```jsx
function handleSubmit(event) {
  event.preventDefault();
  props.addTask("Say hello!");
}
```

Nhấp vào nút "Add" trong trình duyệt sẽ chứng minh rằng hàm callback `addTask()` hoạt động, nhưng sẽ tốt nếu chúng ta có thể để cảnh báo hiển thị cho chúng ta những gì chúng ta đang gõ trong trường đầu vào! Đây là những gì chúng ta sẽ làm tiếp theo.

### Ngoài lề: lưu ý về quy ước đặt tên

Chúng ta đã truyền hàm `addTask()` vào thành phần `<Form />` như prop `addTask` để mối quan hệ giữa _hàm_ `addTask()` và _prop_ `addTask` vẫn rõ ràng nhất có thể. Tuy nhiên, hãy nhớ rằng tên prop _không cần_ phải là bất cứ điều gì đặc biệt. Chúng ta có thể đã truyền `addTask()` vào `<Form />` dưới bất kỳ tên nào khác, chẳng hạn như thế này:

```diff
- <Form addTask={addTask} />
+ <Form onSubmit={addTask} />
```

Điều này sẽ làm cho hàm `addTask()` có sẵn cho thành phần `<Form />` như prop `onSubmit`. Prop đó có thể được sử dụng trong `Form.jsx` như thế này:

```diff
function handleSubmit(event) {
  event.preventDefault();
- props.addTask("Say hello!");
+ props.onSubmit("Say hello!");
}
```

Ở đây, tiền tố `on` cho chúng ta biết rằng prop là một hàm callback; `Submit` là gợi ý cho chúng ta biết rằng sự kiện submit sẽ kích hoạt hàm này.

Mặc dù các callback prop thường khớp với tên của trình xử lý sự kiện quen thuộc, như `onSubmit` hoặc `onClick`, chúng có thể được đặt tên là bất cứ thứ gì giúp làm rõ ý nghĩa của chúng. Một thành phần `<Menu />` giả thuyết có thể bao gồm một hàm callback chạy khi menu được mở, cũng như một hàm callback riêng biệt chạy khi nó đóng:

```jsx
<Menu onOpen={() => console.log("Hi!")} onClose={() => console.log("Bye!")} />
```

Quy ước đặt tên `on*` này rất phổ biến trong hệ sinh thái React, vì vậy hãy nhớ nó khi bạn tiếp tục học. Để rõ ràng, chúng ta sẽ tiếp tục dùng `addTask` và tên prop tương tự cho phần còn lại của hướng dẫn này. Nếu bạn đã thay đổi bất kỳ tên prop nào khi đọc phần này, hãy chắc chắn thay đổi chúng lại trước khi tiếp tục!

## Duy trì và thay đổi dữ liệu với trạng thái

Cho đến nay, chúng ta đã sử dụng props để truyền dữ liệu qua các thành phần và điều này phục vụ chúng ta rất tốt. Bây giờ khi chúng ta đang xử lý tính tương tác, chúng ta cần khả năng tạo dữ liệu mới, giữ nó và cập nhật nó sau này. Props không phải là công cụ phù hợp cho công việc này vì chúng bất biến — một thành phần không thể thay đổi hoặc tạo props của riêng mình.

Đây là lúc **trạng thái** xuất hiện. Nếu chúng ta nghĩ về props như một cách để giao tiếp giữa các thành phần, chúng ta có thể nghĩ về trạng thái như một cách để cho các thành phần "bộ nhớ" — thông tin họ có thể giữ và cập nhật khi cần.

React cung cấp một hàm đặc biệt để giới thiệu trạng thái cho một thành phần, được đặt tên thích hợp là `useState()`.

> [!NOTE]
> `useState()` là một phần của danh mục hàm đặc biệt gọi là **hooks**, mỗi cái trong số đó có thể được sử dụng để thêm chức năng mới vào một thành phần. Chúng ta sẽ học về các hook khác sau này.

Để sử dụng `useState()`, chúng ta cần nhập nó từ mô-đun React. Thêm dòng sau vào đầu tệp `Form.jsx`, phía trên định nghĩa hàm `Form()`:

```jsx
import { useState } from "react";
```

`useState()` nhận một đối số duy nhất xác định giá trị ban đầu của trạng thái. Đối số này có thể là chuỗi, số, mảng, đối tượng hoặc bất kỳ kiểu dữ liệu JavaScript nào khác. `useState()` trả về một mảng chứa hai mục. Mục đầu tiên là giá trị hiện tại của trạng thái; mục thứ hai là hàm có thể được sử dụng để cập nhật trạng thái.

Hãy tạo trạng thái `name`. Viết dòng sau phía trên hàm `handleSubmit()`, bên trong `Form()`:

```jsx
const [name, setName] = useState("Learn React");
```

Một số điều đang xảy ra trong dòng code này:

- Chúng ta đang định nghĩa hằng số `name` với giá trị `"Learn React"`.
- Chúng ta đang định nghĩa một hàm có nhiệm vụ là sửa đổi `name`, gọi là `setName()`.
- `useState()` trả về hai thứ này trong một mảng, vì vậy chúng ta đang sử dụng [phân rã mảng](/en-US/docs/Web/JavaScript/Reference/Operators/Destructuring) để nắm bắt cả hai trong các biến riêng biệt.

### Đọc trạng thái

Bạn có thể thấy trạng thái `name` hoạt động ngay lập tức. Thêm thuộc tính `value` vào đầu vào của biểu mẫu, và đặt giá trị của nó thành `name`. Trình duyệt của bạn sẽ kết xuất "Learn React" bên trong đầu vào.

```jsx
<input
  type="text"
  id="new-todo-input"
  className="input input__lg"
  name="text"
  autoComplete="off"
  value={name}
/>
```

Thay đổi "Learn React" thành chuỗi rỗng sau khi bạn hoàn thành; đây là những gì chúng ta muốn cho trạng thái ban đầu:

```jsx
const [name, setName] = useState("");
```

### Đọc đầu vào người dùng

Trước khi chúng ta có thể thay đổi giá trị của `name`, chúng ta cần nắm bắt đầu vào của người dùng khi họ gõ. Để làm điều này, chúng ta có thể lắng nghe sự kiện `onChange`. Hãy viết hàm `handleChange()`, và lắng nghe nó trên phần tử `<input />`.

```jsx
// near the top of the `Form` component
function handleChange() {
  console.log("Typing!");
}

// …

// Down in the return statement
<input
  type="text"
  id="new-todo-input"
  className="input input__lg"
  name="text"
  autoComplete="off"
  value={name}
  onChange={handleChange}
/>;
```

Hiện tại, giá trị của đầu vào sẽ không thay đổi khi bạn cố gắng nhập văn bản vào nó, nhưng trình duyệt sẽ ghi chữ "Typing!" vào JavaScript console, vì vậy chúng ta biết trình lắng nghe sự kiện được gắn vào đầu vào.

Để đọc các lần gõ phím của người dùng, chúng ta phải truy cập thuộc tính `value` của đầu vào. Chúng ta có thể làm điều này bằng cách đọc đối tượng `event` mà `handleChange()` nhận khi nó được gọi. `event`, đến lượt, có [thuộc tính `target`](/en-US/docs/Web/API/Event/target), đại diện cho phần tử đã kích hoạt sự kiện `change`. Đó là đầu vào của chúng ta. Vì vậy, `event.target.value` là văn bản bên trong đầu vào.

Bạn có thể `console.log()` giá trị này để xem nó trong console trình duyệt của bạn. Hãy thử cập nhật hàm `handleChange()` như sau, và gõ vào đầu vào để xem kết quả trong console:

```jsx
function handleChange(event) {
  console.log(event.target.value);
}
```

### Cập nhật trạng thái

Ghi nhật ký không đủ — chúng ta muốn thực sự lưu trữ những gì người dùng gõ và kết xuất nó trong đầu vào! Thay đổi lời gọi `console.log()` thành `setName()`, như được hiển thị bên dưới:

```jsx
function handleChange(event) {
  setName(event.target.value);
}
```

Bây giờ khi bạn gõ vào đầu vào, các lần gõ phím sẽ điền vào đầu vào, như bạn có thể mong đợi.

Chúng ta có thêm một bước: chúng ta cần thay đổi hàm `handleSubmit()` để nó gọi `props.addTask` với `name` như một đối số. Hãy nhớ callback prop của chúng ta? Điều này sẽ phục vụ để gửi tác vụ trở lại thành phần `App`, để chúng ta có thể thêm nó vào danh sách tác vụ vào một thời điểm sau. Là vấn đề thực hành tốt, bạn nên xóa đầu vào sau khi biểu mẫu được gửi, vì vậy chúng ta sẽ gọi `setName()` lại với chuỗi rỗng để làm như vậy:

```jsx
function handleSubmit(event) {
  event.preventDefault();
  props.addTask(name);
  setName("");
}
```

Cuối cùng, bạn có thể gõ gì đó vào trường đầu vào trong trình duyệt và nhấp _Add_ — bất cứ điều gì bạn gõ sẽ xuất hiện trong hộp thoại cảnh báo.

Tệp `Form.jsx` của bạn bây giờ trông như thế này:

```jsx
import { useState } from "react";

function Form(props) {
  const [name, setName] = useState("");

  function handleChange(event) {
    setName(event.target.value);
  }

  function handleSubmit(event) {
    event.preventDefault();
    props.addTask(name);
    setName("");
  }

  return (
    <form onSubmit={handleSubmit}>
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
        value={name}
        onChange={handleChange}
      />
      <button type="submit" className="btn btn__primary btn__lg">
        Add
      </button>
    </form>
  );
}

export default Form;
```

> [!NOTE]
> Bạn sẽ nhận thấy rằng bạn có thể gửi tác vụ rỗng chỉ bằng cách nhấn nút `Add` mà không nhập tên tác vụ. Bạn có thể nghĩ ra cách để ngăn điều này không? Như một gợi ý, bạn có thể cần thêm một số loại kiểm tra vào hàm `handleSubmit()`.

## Tổng hợp tất cả: Thêm tác vụ

Bây giờ chúng ta đã thực hành với sự kiện, callback props và hooks, chúng ta sẵn sàng viết chức năng cho phép người dùng thêm tác vụ mới từ trình duyệt.

### Tác vụ là trạng thái

Chúng ta cần nhập `useState` vào `App.jsx` để chúng ta có thể lưu trữ tác vụ trong trạng thái. Thêm phần sau vào đầu tệp `App.jsx`:

```jsx
import { useState } from "react";
```

Chúng ta muốn truyền `props.tasks` vào hook `useState()` — điều này sẽ duy trì trạng thái ban đầu của nó. Thêm dòng sau ngay ở đầu định nghĩa hàm `App()`:

```jsx
const [tasks, setTasks] = useState(props.tasks);
```

Bây giờ, chúng ta có thể thay đổi ánh xạ `taskList` của mình để nó là kết quả của việc ánh xạ `tasks`, thay vì `props.tasks`. Khai báo hằng số `taskList` của bạn bây giờ trông như thế này:

```jsx
const taskList = tasks?.map((task) => (
  <Todo
    id={task.id}
    name={task.name}
    completed={task.completed}
    key={task.id}
  />
));
```

### Thêm tác vụ

Chúng ta giờ có hook `setTasks` mà chúng ta có thể sử dụng trong hàm `addTask()` để cập nhật danh sách tác vụ. Tuy nhiên có một vấn đề: chúng ta không thể chỉ truyền đối số `name` của `addTask()` vào `setTasks`, vì `tasks` là mảng đối tượng và `name` là chuỗi. Nếu chúng ta cố gắng làm điều này, mảng sẽ bị thay thế bởi chuỗi.

Trước hết, chúng ta cần đặt `name` vào một đối tượng có cùng cấu trúc với các tác vụ hiện có của chúng ta. Bên trong hàm `addTask()`, chúng ta sẽ tạo đối tượng `newTask` để thêm vào mảng.

Sau đó, chúng ta cần tạo mảng mới với tác vụ mới này được thêm vào và sau đó cập nhật trạng thái của dữ liệu tác vụ sang trạng thái mới này. Để làm điều này, chúng ta có thể sử dụng cú pháp spread để [sao chép mảng hiện có](/en-US/docs/Web/JavaScript/Reference/Operators/Spread_syntax#copying_an_array), và thêm đối tượng của chúng ta vào cuối. Sau đó, chúng ta truyền mảng này vào `setTasks()` để cập nhật trạng thái.

Tổng hợp tất cả lại, hàm `addTask()` của bạn trông như thế này:

```jsx
function addTask(name) {
  const newTask = { id: "id", name, completed: false };
  setTasks([...tasks, newTask]);
}
```

Bây giờ bạn có thể sử dụng trình duyệt để thêm tác vụ vào dữ liệu của chúng ta! Gõ bất cứ điều gì vào biểu mẫu và nhấp "Add" (hoặc nhấn phím <kbd>Enter</kbd>) và bạn sẽ thấy mục việc cần làm mới xuất hiện trong giao diện người dùng!

**Tuy nhiên, chúng ta có vấn đề khác**: hàm `addTask()` đang cho mỗi tác vụ cùng một `id`. Điều này xấu cho khả năng tiếp cận, và làm cho React không thể phân biệt các tác vụ trong tương lai với prop `key`. Thực ra, React sẽ cảnh báo bạn trong console DevTools — "Warning: Encountered two children with the same key…"

Chúng ta cần sửa điều này. Tạo định danh duy nhất là vấn đề khó — một vấn đề mà cộng đồng JavaScript đã viết một số thư viện hữu ích. Chúng ta sẽ sử dụng [nanoid](https://github.com/ai/nanoid) vì nó nhỏ và hoạt động tốt.

Hãy chắc chắn rằng bạn đang ở trong thư mục gốc của ứng dụng và chạy lệnh terminal sau:

```bash
npm install nanoid
```

> [!NOTE]
> Nếu bạn đang sử dụng yarn, bạn sẽ cần: `yarn add nanoid` thay thế.

Bây giờ chúng ta có thể sử dụng `nanoid` để tạo ID duy nhất cho các tác vụ mới của chúng ta. Đầu tiên, nhập nó bằng cách bao gồm dòng sau ở đầu `App.jsx`:

```jsx
import { nanoid } from "nanoid";
```

Bây giờ hãy cập nhật `addTask()` để mỗi ID tác vụ trở thành tiền tố `todo-` cộng với chuỗi duy nhất được tạo bởi nanoid. Cập nhật khai báo hằng số `newTask` như sau:

```jsx
const newTask = { id: `todo-${nanoid()}`, name, completed: false };
```

Lưu mọi thứ và thử lại ứng dụng — bây giờ bạn có thể thêm tác vụ mà không nhận được cảnh báo về ID trùng lặp.

## Đi vòng: đếm tác vụ

Bây giờ chúng ta có thể thêm tác vụ mới, bạn có thể nhận thấy một vấn đề: tiêu đề đọc "3 tasks remaining" bất kể chúng ta có bao nhiêu tác vụ! Chúng ta có thể sửa điều này bằng cách đếm độ dài của `taskList` và thay đổi văn bản của tiêu đề tương ứng.

Thêm điều này bên trong định nghĩa `App()`, trước câu lệnh return:

```jsx
const headingText = `${taskList.length} tasks remaining`;
```

Điều này gần đúng, ngoại trừ nếu danh sách của chúng ta từng chứa một tác vụ duy nhất, tiêu đề sẽ vẫn sử dụng từ "tasks". Chúng ta có thể làm cho điều này thành biến cũng vậy. Cập nhật code bạn vừa thêm như sau:

```jsx
const tasksNoun = taskList.length !== 1 ? "tasks" : "task";
const headingText = `${taskList.length} ${tasksNoun} remaining`;
```

Bây giờ bạn có thể thay thế nội dung văn bản của tiêu đề danh sách bằng biến `headingText`. Cập nhật `<h2>` như thế này:

```jsx
<h2 id="list-heading">{headingText}</h2>
```

Lưu tệp, quay lại trình duyệt và thử thêm một số tác vụ: số đếm bây giờ nên cập nhật như mong đợi.

## Hoàn thành tác vụ

Bạn có thể nhận thấy rằng khi bạn nhấp vào hộp kiểm, nó kiểm tra và bỏ kiểm tra một cách thích hợp. Là tính năng của HTML, trình duyệt biết cách ghi nhớ các đầu vào hộp kiểm nào được kiểm tra hoặc bỏ kiểm tra mà không cần sự giúp đỡ. Tuy nhiên, tính năng này ẩn một vấn đề: bật/tắt hộp kiểm không thay đổi trạng thái trong ứng dụng React của chúng ta. Điều này có nghĩa là trình duyệt và ứng dụng của chúng ta hiện đang không đồng bộ. Chúng ta phải viết code của riêng mình để đưa trình duyệt trở lại đồng bộ với ứng dụng.

### Chứng minh lỗi

Trước khi chúng ta sửa vấn đề, hãy quan sát nó xảy ra.

Chúng ta sẽ bắt đầu bằng cách viết hàm `toggleTaskCompleted()` trong thành phần `App()`. Hàm này sẽ có tham số `id`, nhưng chúng ta chưa sử dụng nó. Hiện tại, chúng ta sẽ ghi tác vụ đầu tiên trong mảng vào console — chúng ta sẽ kiểm tra điều gì xảy ra khi chúng ta kiểm tra hoặc bỏ kiểm tra nó trong trình duyệt:

Thêm điều này ngay phía trên khai báo hằng số `taskList`:

```jsx
function toggleTaskCompleted(id) {
  console.log(tasks[0]);
}
```

Tiếp theo, chúng ta sẽ thêm `toggleTaskCompleted` vào props của mỗi thành phần `<Todo />` được kết xuất bên trong `taskList`; cập nhật nó như sau:

```jsx
const taskList = tasks.map((task) => (
  <Todo
    id={task.id}
    name={task.name}
    completed={task.completed}
    key={task.id}
    toggleTaskCompleted={toggleTaskCompleted}
  />
));
```

Tiếp theo, đi đến thành phần `Todo.jsx` và thêm trình xử lý `onChange` vào phần tử `<input />`, nên sử dụng hàm ẩn danh để gọi `props.toggleTaskCompleted()` với tham số `props.id`. Phần tử `<input />` bây giờ trông như thế này:

```jsx
<input
  id={props.id}
  type="checkbox"
  defaultChecked={props.completed}
  onChange={() => props.toggleTaskCompleted(props.id)}
/>
```

Lưu mọi thứ và quay lại trình duyệt và nhận thấy rằng tác vụ đầu tiên, Eat, được kiểm tra. Mở JavaScript console, sau đó nhấp vào hộp kiểm bên cạnh Eat. Nó bỏ kiểm tra, như chúng ta mong đợi. JavaScript console của bạn, tuy nhiên, sẽ ghi nhật ký thứ gì đó như thế này:

```plain
Object { id: "task-0", name: "Eat", completed: true }
```

Hộp kiểm bỏ kiểm tra trong trình duyệt, nhưng console của chúng ta cho chúng ta biết rằng Eat vẫn hoàn thành. Chúng ta sẽ sửa điều đó tiếp theo!

### Đồng bộ hóa trình duyệt với dữ liệu

Hãy xem xét lại hàm `toggleTaskCompleted()` trong `App.jsx`. Chúng ta muốn nó thay đổi thuộc tính `completed` chỉ của tác vụ được bật/tắt, và để tất cả những cái khác một mình. Để làm điều này, chúng ta sẽ `map()` qua danh sách tác vụ và chỉ thay đổi cái chúng ta đã hoàn thành.

Cập nhật hàm `toggleTaskCompleted()` của bạn thành như sau:

```jsx
function toggleTaskCompleted(id) {
  const updatedTasks = tasks.map((task) => {
    // if this task has the same ID as the edited task
    if (id === task.id) {
      // use object spread to make a new object
      // whose `completed` prop has been inverted
      return { ...task, completed: !task.completed };
    }
    return task;
  });
  setTasks(updatedTasks);
}
```

Ở đây, chúng ta định nghĩa hằng số `updatedTasks` map qua mảng `tasks` gốc. Nếu thuộc tính `id` của tác vụ khớp với `id` được cung cấp cho hàm, chúng ta sử dụng [cú pháp spread đối tượng](/en-US/docs/Web/JavaScript/Reference/Operators/Spread_syntax) để tạo đối tượng mới, và bật/tắt thuộc tính `completed` của đối tượng đó trước khi trả về nó. Nếu nó không khớp, chúng ta trả về đối tượng gốc.

Sau đó, chúng ta gọi `setTasks()` với mảng mới này để cập nhật trạng thái.

## Xóa tác vụ

Xóa tác vụ sẽ theo mẫu tương tự như bật/tắt trạng thái hoàn thành: chúng ta cần định nghĩa hàm để cập nhật trạng thái, sau đó truyền hàm đó vào `<Todo />` như prop và gọi nó khi sự kiện đúng xảy ra.

### Callback prop `deleteTask`

Ở đây chúng ta sẽ bắt đầu bằng cách viết hàm `deleteTask()` trong thành phần `App`. Giống như `toggleTaskCompleted()`, hàm này sẽ nhận tham số `id`, và chúng ta sẽ ghi `id` đó vào console để bắt đầu. Thêm phần sau bên dưới `toggleTaskCompleted()`:

```jsx
function deleteTask(id) {
  console.log(id);
}
```

Tiếp theo, thêm callback prop khác vào mảng thành phần `<Todo />`:

```jsx
const taskList = tasks.map((task) => (
  <Todo
    id={task.id}
    name={task.name}
    completed={task.completed}
    key={task.id}
    toggleTaskCompleted={toggleTaskCompleted}
    deleteTask={deleteTask}
  />
));
```

Trong `Todo.jsx`, chúng ta muốn gọi `props.deleteTask()` khi nút "Delete" được nhấn. `deleteTask()` cần biết ID của tác vụ đã gọi nó, để nó có thể xóa tác vụ đúng từ trạng thái.

Cập nhật nút "Delete" bên trong `Todo.jsx`, như thế này:

```jsx
<button
  type="button"
  className="btn btn__danger"
  onClick={() => props.deleteTask(props.id)}>
  Delete <span className="visually-hidden">{props.name}</span>
</button>
```

Bây giờ khi bạn nhấp vào bất kỳ nút "Delete" nào trong ứng dụng, console trình duyệt sẽ ghi ID của tác vụ liên quan.

Tại thời điểm này, tệp `Todo.jsx` của bạn trông như thế này:

```jsx
function Todo(props) {
  return (
    <li className="todo stack-small">
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
    </li>
  );
}

export default Todo;
```

## Xóa tác vụ khỏi trạng thái và giao diện người dùng

Bây giờ chúng ta biết `deleteTask()` được gọi đúng cách, chúng ta có thể gọi hook `setTasks()` trong `deleteTask()` để thực sự xóa tác vụ đó khỏi trạng thái của ứng dụng cũng như trực quan trong giao diện người dùng ứng dụng. Vì `setTasks()` mong đợi một mảng như đối số, chúng ta nên cung cấp cho nó một mảng mới sao chép các tác vụ hiện có, _loại trừ_ tác vụ có ID khớp với cái được truyền vào `deleteTask()`.

Đây là cơ hội hoàn hảo để sử dụng [`Array.prototype.filter()`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Array/filter). Chúng ta có thể kiểm tra mỗi tác vụ, và loại trừ tác vụ khỏi mảng mới nếu thuộc tính `id` của nó khớp với đối số `id` được truyền vào `deleteTask()`.

Cập nhật hàm `deleteTask()` bên trong tệp `App.jsx` như sau:

```jsx
function deleteTask(id) {
  const remainingTasks = tasks.filter((task) => id !== task.id);
  setTasks(remainingTasks);
}
```

Hãy thử lại ứng dụng. Bây giờ bạn có thể xóa tác vụ khỏi ứng dụng!

Tại thời điểm này, tệp `App.jsx` của bạn trông như thế này:

```jsx
import { useState } from "react";
import { nanoid } from "nanoid";
import Todo from "./components/Todo";
import Form from "./components/Form";
import FilterButton from "./components/FilterButton";

function App(props) {
  const [tasks, setTasks] = useState(props.tasks);

  function addTask(name) {
    const newTask = { id: `todo-${nanoid()}`, name, completed: false };
    setTasks([...tasks, newTask]);
  }

  function toggleTaskCompleted(id) {
    const updatedTasks = tasks.map((task) => {
      // if this task has the same ID as the edited task
      if (id === task.id) {
        // use object spread to make a new object
        // whose `completed` prop has been inverted
        return { ...task, completed: !task.completed };
      }
      return task;
    });
    setTasks(updatedTasks);
  }

  function deleteTask(id) {
    const remainingTasks = tasks.filter((task) => id !== task.id);
    setTasks(remainingTasks);
  }
  const taskList = tasks?.map((task) => (
    <Todo
      id={task.id}
      name={task.name}
      completed={task.completed}
      key={task.id}
      toggleTaskCompleted={toggleTaskCompleted}
      deleteTask={deleteTask}
    />
  ));

  const tasksNoun = taskList.length !== 1 ? "tasks" : "task";
  const headingText = `${taskList.length} ${tasksNoun} remaining`;

  return (
    <div className="todoapp stack-large">
      <h1>TodoMatic</h1>
      <Form addTask={addTask} />
      <div className="filters btn-group stack-exception">
        <FilterButton />
        <FilterButton />
        <FilterButton />
      </div>
      <h2 id="list-heading">{headingText}</h2>
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

## Tóm tắt

Đó là đủ cho một bài viết. Ở đây chúng tôi đã cho bạn thấy cách React xử lý sự kiện và trạng thái, và triển khai chức năng để thêm tác vụ, xóa tác vụ và bật/tắt tác vụ là hoàn thành. Chúng ta gần xong rồi. Trong bài viết tiếp theo, chúng ta sẽ triển khai chức năng để chỉnh sửa tác vụ hiện có và lọc danh sách tác vụ giữa tất cả, đã hoàn thành và chưa hoàn thành. Chúng ta sẽ xem xét kết xuất giao diện người dùng có điều kiện trong quá trình đó.

{{PreviousMenuNext("Learn_web_development/Core/Frameworks_libraries/React_components","Learn_web_development/Core/Frameworks_libraries/React_interactivity_filtering_conditional_rendering", "Learn_web_development/Core/Frameworks_libraries")}}
