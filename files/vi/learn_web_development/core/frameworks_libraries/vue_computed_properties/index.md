---
title: Sử dụng thuộc tính tính toán Vue
slug: Learn_web_development/Core/Frameworks_libraries/Vue_computed_properties
page-type: learn-module-chapter
sidebar: learnsidebar
---

{{PreviousMenuNext("Learn_web_development/Core/Frameworks_libraries/Vue_styling","Learn_web_development/Core/Frameworks_libraries/Vue_conditional_rendering", "Learn_web_development/Core/Frameworks_libraries")}}

Trong bài viết này, chúng ta sẽ thêm một bộ đếm hiển thị số lượng mục todo đã hoàn thành, sử dụng tính năng của Vue gọi là thuộc tính tính toán. Chúng hoạt động tương tự như các phương thức, nhưng chỉ chạy lại khi một trong các phụ thuộc của chúng thay đổi.

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
      <td>Tìm hiểu cách sử dụng các thuộc tính tính toán Vue.</td>
    </tr>
  </tbody>
</table>

## Sử dụng thuộc tính tính toán

Mục tiêu ở đây là thêm số lượng tóm tắt cho danh sách todo của chúng ta. Điều này có thể hữu ích cho người dùng, đồng thời cũng phục vụ để gắn nhãn cho danh sách với công nghệ hỗ trợ. Nếu chúng ta có 2 trong số 5 mục được hoàn thành trong danh sách todo, tóm tắt của chúng ta có thể đọc là "2 items completed out of 5". Mặc dù có thể hấp dẫn để làm điều gì đó như thế này:

```vue
<h2>
  \{{ToDoItems.filter(item =&gt; item.done).length}} out of
  \{{ToDoItems.length}} items completed
</h2>
```

Nó sẽ được tính lại mỗi lần kết xuất. Đối với một ứng dụng nhỏ như thế này, điều đó có lẽ không quan trọng lắm. Đối với các ứng dụng lớn hơn, hoặc khi biểu thức phức tạp hơn, điều đó có thể gây ra vấn đề hiệu suất nghiêm trọng.

Một giải pháp tốt hơn là sử dụng [thuộc tính tính toán](https://vuejs.org/guide/essentials/computed.html) của Vue. Các thuộc tính tính toán hoạt động tương tự như các phương thức, nhưng chỉ chạy lại khi một trong các phụ thuộc của chúng thay đổi. Trong trường hợp của chúng ta, điều này chỉ chạy lại khi mảng `ToDoItems` thay đổi.

Để tạo một thuộc tính tính toán, chúng ta cần thêm thuộc tính `computed` vào đối tượng thành phần, giống như thuộc tính `methods` chúng ta đã sử dụng trước đây.

## Thêm bộ đếm tóm tắt

Thêm code sau vào đối tượng thành phần `App`, bên dưới thuộc tính `methods`. Phương thức tóm tắt danh sách sẽ lấy số lượng `ToDoItems` đã hoàn thành và trả về một chuỗi báo cáo điều này.

```js
export default {
  // …
  computed: {
    listSummary() {
      const numberFinishedItems = this.ToDoItems.filter(
        (item) => item.done,
      ).length;
      return `${numberFinishedItems} out of ${this.ToDoItems.length} items completed`;
    },
  },
  // …
};
```

Bây giờ chúng ta có thể thêm `\{{listSummary}}` trực tiếp vào mẫu; chúng ta sẽ thêm điều này bên trong phần tử `<h2>`, ngay phía trên `<ul>`. Chúng ta cũng sẽ thêm thuộc tính `id` và thuộc tính `aria-labelledby` để gán nội dung `<h2>` là nhãn cho phần tử `<ul>`.

Thêm `<h2>` được mô tả và cập nhật `<ul>` bên trong mẫu `App` như sau:

```vue
<h2 id="list-summary">\{{listSummary}}</h2>
<ul aria-labelledby="list-summary" class="stack-large">
  <li v-for="item in ToDoItems" :key="item.id">
    <to-do-item
      :label="item.label"
      :done="item.done"
      :id="item.id"></to-do-item>
  </li>
</ul>
```

Bây giờ bạn sẽ thấy tóm tắt danh sách trong ứng dụng, và tổng số mục cập nhật khi bạn thêm nhiều mục todo hơn! Tuy nhiên, nếu bạn thử đánh dấu và bỏ đánh dấu một số mục, bạn sẽ phát hiện ra một lỗi. Hiện tại, chúng ta không thực sự theo dõi dữ liệu "done" theo bất kỳ cách nào, vì vậy số lượng mục đã hoàn thành không thay đổi.

## Theo dõi các thay đổi đối với "done"

Chúng ta có thể sử dụng các sự kiện để nắm bắt cập nhật checkbox và quản lý danh sách của chúng ta cho phù hợp.

Vì chúng ta không dựa vào việc nhấn nút để kích hoạt thay đổi, chúng ta có thể gắn trình xử lý sự kiện `@change` vào mỗi checkbox thay vì sử dụng `v-model`.

Cập nhật phần tử `<input>` trong `ToDoItem.vue` để trông như thế này.

```vue
<input
  type="checkbox"
  class="checkbox"
  :id="id"
  :checked="isDone"
  @change="$emit('checkbox-changed')" />
```

Vì tất cả những gì chúng ta cần làm là phát ra rằng checkbox đã được đánh dấu, chúng ta có thể bao gồm `$emit()` inline.

Trong `App.vue`, thêm một phương thức mới gọi là `updateDoneStatus()`, bên dưới phương thức `addToDo()`. Phương thức này nên nhận một tham số: todo item _id_. Chúng ta muốn tìm mục có `id` khớp và cập nhật trạng thái `done` của nó thành ngược lại với trạng thái hiện tại:

```js
export default {
  // …
  methods: {
    // …
    updateDoneStatus(toDoId) {
      const toDoToUpdate = this.ToDoItems.find((item) => item.id === toDoId);
      toDoToUpdate.done = !toDoToUpdate.done;
    },
    // …
  },
  // …
};
```

Chúng ta muốn chạy phương thức này bất cứ khi nào một `ToDoItem` phát ra sự kiện `checkbox-changed`, và truyền `item.id` của nó như tham số. Cập nhật lệnh gọi `<to-do-item></to-do-item>` như sau:

```vue
<to-do-item
  :label="item.label"
  :done="item.done"
  :id="item.id"
  @checkbox-changed="updateDoneStatus(item.id)">
</to-do-item>
```

Bây giờ nếu bạn đánh dấu một `ToDoItem`, bạn sẽ thấy tóm tắt cập nhật phù hợp!

![Ứng dụng của chúng ta, với bộ đếm todo đã hoàn thành được thêm vào. Hiện tại hiển thị 3 trong số 5 mục đã hoàn thành](todo-counter.png)

## Tóm tắt

Trong bài viết này, chúng ta đã sử dụng thuộc tính tính toán để thêm một tính năng nhỏ đẹp vào ứng dụng. Tuy nhiên, chúng ta có những vấn đề lớn hơn cần giải quyết — trong bài viết tiếp theo, chúng ta sẽ xem xét kết xuất có điều kiện, và cách chúng ta có thể sử dụng nó để hiển thị biểu mẫu chỉnh sửa khi chúng ta muốn chỉnh sửa các mục todo hiện có.

{{PreviousMenuNext("Learn_web_development/Core/Frameworks_libraries/Vue_styling","Learn_web_development/Core/Frameworks_libraries/Vue_conditional_rendering", "Learn_web_development/Core/Frameworks_libraries")}}
