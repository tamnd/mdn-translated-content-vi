---
title: Kết xuất danh sách các thành phần Vue
slug: Learn_web_development/Core/Frameworks_libraries/Vue_rendering_lists
page-type: learn-module-chapter
sidebar: learnsidebar
---

{{PreviousMenuNext("Learn_web_development/Core/Frameworks_libraries/Vue_first_component","Learn_web_development/Core/Frameworks_libraries/Vue_methods_events_models", "Learn_web_development/Core/Frameworks_libraries")}}

Ở điểm này, chúng ta có một thành phần hoạt động đầy đủ; bây giờ chúng ta đã sẵn sàng thêm nhiều thành phần `ToDoItem` vào ứng dụng của mình. Trong bài viết này, chúng ta sẽ xem xét việc thêm một tập hợp dữ liệu mục todo vào thành phần `App.vue`, sau đó sẽ lặp qua và hiển thị bên trong các thành phần `ToDoItem` bằng cách sử dụng chỉ thị `v-for`.

<table>
  <tbody>
    <tr>
      <th scope="row">Điều kiện tiên quyết:</th>
      <td>
        <p>
          Quen thuộc với các ngôn ngữ cốt lõi <a href="/en-US/docs/Learn_web_development/Core/Structuring_content">HTML</a>,
          <a href="/en-US/docs/Learn_web_development/Core/Styling_basics">CSS</a> và
          <a href="/en-US/docs/Learn_web_development/Core/Scripting">JavaScript</a>,
          kiến thức về
          <a
            href="/en-US/docs/Learn_web_development/Getting_started/Environment_setup/Command_line"
            >terminal/dòng lệnh</a
          >.
        </p>
        <p>
          Các thành phần Vue được viết như một sự kết hợp của các đối tượng JavaScript quản lý dữ liệu của ứng dụng và cú pháp mẫu dựa trên HTML ánh xạ tới cấu trúc DOM bên dưới. Để cài đặt và sử dụng một số tính năng nâng cao hơn của Vue (như Single File Components hoặc render functions), bạn sẽ cần một terminal có node + npm được cài đặt.
        </p>
      </td>
    </tr>
    <tr>
      <th scope="row">Mục tiêu:</th>
      <td>
        Tìm hiểu cách lặp qua một mảng dữ liệu và kết xuất nó trong nhiều thành phần.
      </td>
    </tr>
  </tbody>
</table>

## Kết xuất danh sách với v-for

Để là một danh sách todo hiệu quả, chúng ta cần có khả năng kết xuất nhiều mục todo. Để làm điều đó, Vue có một chỉ thị đặc biệt, [`v-for`](https://vuejs.org/api/built-in-directives.html#v-for). Đây là một chỉ thị Vue tích hợp cho phép chúng ta bao gồm một vòng lặp bên trong mẫu, lặp lại việc kết xuất một tính năng mẫu cho mỗi mục trong một mảng. Chúng ta sẽ sử dụng nó để lặp qua một mảng các mục todo và hiển thị chúng trong ứng dụng trong các thành phần `ToDoItem` riêng biệt.

### Thêm một số dữ liệu để kết xuất

Đầu tiên chúng ta cần lấy một mảng các mục todo. Để làm điều đó, chúng ta sẽ thêm thuộc tính `data` vào đối tượng thành phần `App.vue`, chứa trường `ToDoItems` có giá trị là một mảng các mục todo. Trong khi chúng ta cuối cùng sẽ thêm cơ chế để thêm các mục todo mới, chúng ta có thể bắt đầu với một số mục todo mẫu. Mỗi mục todo sẽ được đại diện bởi một đối tượng với thuộc tính `label` và `done`.

Thêm một vài mục todo mẫu, theo đường hướng của những cái được thấy bên dưới. Theo cách này, bạn có một số dữ liệu sẵn có để kết xuất bằng `v-for`.

```js
export default {
  name: "app",
  components: {
    ToDoItem,
  },
  data() {
    return {
      ToDoItems: [
        { label: "Learn Vue", done: false },
        { label: "Create a Vue project with the CLI", done: true },
        { label: "Have fun", done: true },
        { label: "Create a to-do list", done: false },
      ],
    };
  },
};
```

Bây giờ chúng ta có danh sách các mục, chúng ta có thể sử dụng chỉ thị `v-for` để hiển thị chúng. Các chỉ thị được áp dụng cho các phần tử như các thuộc tính khác. Trong trường hợp `v-for`, bạn sử dụng cú pháp đặc biệt tương tự như vòng lặp [`for...in`](/en-US/docs/Web/JavaScript/Reference/Statements/for...in) trong JavaScript — `v-for="item in items"` — trong đó `items` là mảng bạn muốn lặp qua và `item` là tham chiếu đến phần tử hiện tại trong mảng.

`v-for` gắn vào phần tử bạn muốn lặp lại, và kết xuất phần tử đó cùng với các thành phần con của nó. Trong trường hợp này, chúng ta muốn hiển thị một phần tử `<li>` cho mỗi mục todo bên trong mảng `ToDoItems` của chúng ta. Sau đó chúng ta muốn truyền dữ liệu từ mỗi mục todo sang một thành phần `ToDoItem`.

### Thuộc tính key

Trước khi làm điều đó, có một phần cú pháp khác cần biết được sử dụng với `v-for`, thuộc tính `key`. Để giúp Vue tối ưu hóa việc kết xuất các phần tử trong danh sách, nó cố gắng vá các phần tử danh sách để không tạo lại chúng mỗi khi danh sách thay đổi. Tuy nhiên, Vue cần sự trợ giúp. Để đảm bảo rằng nó đang tái sử dụng các phần tử danh sách một cách phù hợp, nó cần một "key" duy nhất trên cùng một phần tử mà bạn gắn `v-for`.

Để đảm bảo rằng Vue có thể so sánh chính xác các thuộc tính `key`, chúng cần là các giá trị chuỗi hoặc số. Mặc dù sẽ rất tốt nếu sử dụng trường name, trường này cuối cùng sẽ được kiểm soát bởi đầu vào người dùng, có nghĩa là chúng ta không thể đảm bảo rằng các tên sẽ là duy nhất. Tuy nhiên chúng ta có thể sử dụng `nanoid()`, như chúng ta đã làm trong bài viết trước.

1. Import `nanoid` vào thành phần `App` theo cách tương tự như bạn đã làm với thành phần `ToDoItem`, sử dụng

   ```js
   import { nanoid } from "nanoid";
   ```

2. Tiếp theo, thêm trường `id` vào mỗi phần tử trong mảng `ToDoItems` của bạn, và gán cho mỗi phần tử một giá trị là `` `todo-${nanoid()}` ``.

   Phần tử `<script>` trong `App.vue` bây giờ nên có nội dung sau:

   ```js
   import { nanoid } from "nanoid";
   import ToDoItem from "./components/ToDoItem.vue";

   export default {
     name: "app",
     components: {
       ToDoItem,
     },
     data() {
       return {
         ToDoItems: [
           { id: `todo-${nanoid()}`, label: "Learn Vue", done: false },
           {
             id: `todo-${nanoid()}`,
             label: "Create a Vue project with the CLI",
             done: true,
           },
           { id: `todo-${nanoid()}`, label: "Have fun", done: true },
           {
             id: `todo-${nanoid()}`,
             label: "Create a to-do list",
             done: false,
           },
         ],
       };
     },
   };
   ```

3. Bây giờ, thêm chỉ thị `v-for` và thuộc tính `key` vào phần tử `<li>` trong mẫu `App.vue` của bạn, như sau:

   ```vue
   <ul>
     <li v-for="item in ToDoItems" :key="item.id">
       <to-do-item label="My ToDo Item" :done="true"></to-do-item>
     </li>
   </ul>
   ```

   Khi bạn thực hiện thay đổi này, mọi biểu thức JavaScript giữa các thẻ `<li>` sẽ có quyền truy cập vào giá trị `item` ngoài các thuộc tính thành phần khác. Điều này có nghĩa là chúng ta có thể truyền các trường của đối tượng item của mình sang thành phần `ToDoItem` — chỉ cần nhớ sử dụng cú pháp `v-bind`. Điều này thực sự hữu ích, vì chúng ta muốn các mục todo của mình hiển thị thuộc tính `label` của chúng như nhãn của chúng, không phải nhãn tĩnh "My Todo Item". Ngoài ra, chúng ta muốn trạng thái được đánh dấu của chúng phản ánh thuộc tính `done` của chúng, không phải luôn được đặt thành `done="true"`.

4. Cập nhật thuộc tính `label="My ToDo Item"` thành `:label="item.label"`, và thuộc tính `:done="true"` thành `:done="item.done"`, như được thấy trong ngữ cảnh bên dưới:

   ```vue
   <ul>
     <li v-for="item in ToDoItems" :key="item.id">
       <to-do-item :label="item.label" :done="item.done"></to-do-item>
     </li>
   </ul>
   ```

Bây giờ khi bạn nhìn vào ứng dụng đang chạy, nó sẽ hiển thị các mục todo với tên phù hợp của chúng, và nếu bạn kiểm tra mã nguồn, bạn sẽ thấy rằng tất cả các input đều có `id` duy nhất, được lấy từ đối tượng trong thành phần `App`.

![Ứng dụng với danh sách các mục todo được kết xuất.](rendered-todo-items.png)

## Cơ hội để tái cấu trúc nhỏ

Có một chút tái cấu trúc nhỏ mà chúng ta có thể làm ở đây. Thay vì tạo `id` cho các checkbox bên trong thành phần `ToDoItem`, chúng ta có thể biến `id` thành một prop. Mặc dù điều này không thực sự cần thiết, nhưng nó giúp chúng ta dễ dàng quản lý hơn vì chúng ta đã cần tạo `id` duy nhất cho mỗi mục todo.

1. Thêm một prop mới vào thành phần `ToDoItem` của bạn — `id`.
2. Làm cho nó bắt buộc và đặt kiểu của nó là `String`.
3. Để ngăn xung đột tên, hãy xóa trường `id` khỏi thuộc tính `data` của bạn.
4. Bạn không còn sử dụng `nanoid`, vì vậy bạn cần xóa dòng `import { nanoid } from 'nanoid';`, nếu không ứng dụng của bạn sẽ báo lỗi.

Nội dung `<script>` trong thành phần `ToDoItem` của bạn bây giờ sẽ trông giống như thế này:

```js
export default {
  props: {
    label: { required: true, type: String },
    done: { default: false, type: Boolean },
    id: { required: true, type: String },
  },
  data() {
    return {
      isDone: this.done,
    };
  },
};
```

Bây giờ, trong thành phần `App.vue` của bạn, hãy truyền `item.id` như một prop cho thành phần `ToDoItem`. Mẫu `App.vue` của bạn bây giờ sẽ trông như thế này:

```vue
<template>
  <div id="app">
    <h1>My To-Do List</h1>
    <ul>
      <li v-for="item in ToDoItems" :key="item.id">
        <to-do-item
          :label="item.label"
          :done="item.done"
          :id="item.id"></to-do-item>
      </li>
    </ul>
  </div>
</template>
```

Khi bạn nhìn vào trang web được kết xuất, nó sẽ trông giống nhau, nhưng việc tái cấu trúc của chúng ta bây giờ có nghĩa là `id` của chúng ta được lấy từ dữ liệu bên trong `App.vue` và được truyền vào `ToDoItem` như một prop, giống như mọi thứ khác, vì vậy mọi thứ bây giờ hợp lý và nhất quán hơn.

## Tóm tắt

Và điều đó đưa chúng ta đến cuối bài viết này. Chúng ta bây giờ có dữ liệu mẫu và một vòng lặp lấy từng bit dữ liệu và kết xuất nó bên trong một `ToDoItem` trong ứng dụng của chúng ta.

Những gì chúng ta thực sự cần tiếp theo là khả năng cho phép người dùng của chúng ta nhập các mục todo của riêng họ vào ứng dụng, và để làm điều đó chúng ta sẽ cần một `<input>` văn bản, một sự kiện để kích hoạt khi dữ liệu được gửi, một phương thức để kích hoạt khi gửi để thêm dữ liệu và kết xuất lại danh sách, và một mô hình để kiểm soát dữ liệu. Chúng ta sẽ đến những điều này trong bài viết tiếp theo.

{{PreviousMenuNext("Learn_web_development/Core/Frameworks_libraries/Vue_first_component","Learn_web_development/Core/Frameworks_libraries/Vue_methods_events_models", "Learn_web_development/Core/Frameworks_libraries")}}
