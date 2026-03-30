---
title: "Kết xuất có điều kiện Vue: Chỉnh sửa việc cần làm hiện có"
slug: Learn_web_development/Core/Frameworks_libraries/Vue_conditional_rendering
page-type: learn-module-chapter
sidebar: learnsidebar
---

{{PreviousMenuNext("Learn_web_development/Core/Frameworks_libraries/Vue_computed_properties","Learn_web_development/Core/Frameworks_libraries/Vue_refs_focus_management", "Learn_web_development/Core/Frameworks_libraries")}}

Bây giờ đã đến lúc thêm một trong những phần chức năng chính mà chúng ta vẫn còn thiếu — khả năng chỉnh sửa các mục todo hiện có. Để làm điều này, chúng ta sẽ tận dụng khả năng kết xuất có điều kiện của Vue — cụ thể là `v-if` và `v-else` — để cho phép chúng ta chuyển đổi giữa chế độ xem mục todo hiện có và chế độ chỉnh sửa nơi bạn có thể cập nhật nhãn mục todo. Chúng ta cũng sẽ xem xét việc thêm chức năng xóa các mục todo.

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
      <td>Tìm hiểu cách thực hiện kết xuất có điều kiện trong Vue.</td>
    </tr>
  </tbody>
</table>

## Tạo thành phần chỉnh sửa

Chúng ta có thể bắt đầu bằng cách tạo một thành phần riêng để xử lý chức năng chỉnh sửa. Trong thư mục `components`, tạo một file mới có tên `ToDoItemEditForm.vue`. Sao chép code sau vào file đó:

```vue
<template>
  <form class="stack-small" @submit.prevent="onSubmit">
    <div>
      <label class="edit-label">Edit Name for &quot;\{{ label }}&quot;</label>
      <input
        :id="id"
        type="text"
        autocomplete="off"
        v-model.lazy.trim="newLabel" />
    </div>
    <div class="btn-group">
      <button type="button" class="btn" @click="onCancel">
        Cancel
        <span class="visually-hidden">editing \{{ label }}</span>
      </button>
      <button type="submit" class="btn btn__primary">
        Save
        <span class="visually-hidden">edit for \{{ label }}</span>
      </button>
    </div>
  </form>
</template>
<script>
export default {
  props: {
    label: {
      type: String,
      required: true,
    },
    id: {
      type: String,
      required: true,
    },
  },
  data() {
    return {
      newLabel: this.label,
    };
  },
  methods: {
    onSubmit() {
      if (this.newLabel && this.newLabel !== this.label) {
        this.$emit("item-edited", this.newLabel);
      }
    },
    onCancel() {
      this.$emit("edit-cancelled");
    },
  },
};
</script>
<style scoped>
.edit-label {
  font-family: "Arial", sans-serif;
  -webkit-font-smoothing: antialiased;
  -moz-osx-font-smoothing: grayscale;
  color: #0b0c0c;
  display: block;
  margin-bottom: 5px;
}
input {
  display: inline-block;
  margin-top: 0.4rem;
  width: 100%;
  min-height: 4.4rem;
  padding: 0.4rem 0.8rem;
  border: 2px solid #565656;
}
form {
  display: flex;
  flex-direction: row;
  flex-wrap: wrap;
}
form > * {
  flex: 0 0 100%;
}
</style>
```

> [!NOTE]
> Hãy đọc qua code ở trên rồi đọc mô tả bên dưới để đảm bảo bạn hiểu tất cả những gì thành phần đang làm trước khi tiếp tục. Đây là cách hữu ích để giúp củng cố mọi thứ bạn đã học cho đến nay.

Code này thiết lập cốt lõi của chức năng chỉnh sửa. Chúng ta tạo một biểu mẫu với trường `<input>` để chỉnh sửa tên todo của chúng ta.

Có nút "Save" và nút "Cancel":

- Khi nút "Save" được nhấp, thành phần phát ra nhãn mới thông qua sự kiện `item-edited`.
- Khi nút "Cancel" được nhấp, thành phần báo hiệu điều này bằng cách phát ra sự kiện `edit-cancelled`.

## Sửa đổi thành phần ToDoItem của chúng ta

Trước khi chúng ta có thể thêm `ToDoItemEditForm` vào ứng dụng, chúng ta cần thực hiện một vài sửa đổi cho thành phần `ToDoItem`. Cụ thể, chúng ta cần thêm một biến để theo dõi xem mục có đang được chỉnh sửa không, và một nút để chuyển đổi biến đó. Chúng ta cũng sẽ thêm nút `Delete` vì việc xóa liên quan chặt chẽ.

Cập nhật mẫu `ToDoItem` của bạn như hiển thị bên dưới.

```vue
<template>
  <div class="stack-small">
    <div class="custom-checkbox">
      <input
        type="checkbox"
        class="checkbox"
        :id="id"
        :checked="isDone"
        @change="$emit('checkbox-changed')" />
      <label :for="id" class="checkbox-label">\{{ label }}</label>
    </div>
    <div class="btn-group">
      <button type="button" class="btn" @click="toggleToItemEditForm">
        Edit <span class="visually-hidden">\{{ label }}</span>
      </button>
      <button type="button" class="btn btn__danger" @click="deleteToDo">
        Delete <span class="visually-hidden">\{{ label }}</span>
      </button>
    </div>
  </div>
</template>
```

Chúng ta đã thêm một `<div>` bao bọc xung quanh toàn bộ mẫu cho mục đích bố cục.

Chúng ta cũng đã thêm các nút "Edit" và "Delete":

- Nút "Edit", khi được nhấp, sẽ chuyển đổi việc hiển thị thành phần `ToDoItemEditForm` để chúng ta có thể sử dụng nó để chỉnh sửa mục todo, thông qua hàm trình xử lý sự kiện gọi là `toggleToItemEditForm()`. Trình xử lý này sẽ đặt cờ `isEditing` thành true. Để làm điều đó, chúng ta cần trước tiên định nghĩa nó bên trong thuộc tính `data()`.
- Nút "Delete", khi được nhấp, sẽ xóa mục todo thông qua hàm trình xử lý sự kiện gọi là `deleteToDo()`. Trong trình xử lý này, chúng ta sẽ phát ra sự kiện `item-deleted` cho thành phần cha để danh sách có thể được cập nhật.

Hãy định nghĩa các trình xử lý nhấp chuột của chúng ta và cờ `isEditing` cần thiết.

Thêm `isEditing` bên dưới điểm dữ liệu `isDone` hiện có của bạn:

```js
export default {
  // …
  data() {
    return {
      isDone: this.done,
      isEditing: false,
    };
  },
  // …
};
```

Bây giờ thêm các phương thức của bạn bên trong thuộc tính methods, ngay bên dưới thuộc tính `data()`:

```js
export default {
  // …
  methods: {
    deleteToDo() {
      this.$emit("item-deleted");
    },
    toggleToItemEditForm() {
      this.isEditing = true;
    },
  },
  // …
};
```

## Hiển thị có điều kiện các thành phần qua v-if và v-else

Bây giờ chúng ta có cờ `isEditing` mà chúng ta có thể sử dụng để biểu thị rằng mục đang được chỉnh sửa (hoặc không). Nếu `isEditing` là true, chúng ta muốn sử dụng cờ đó để hiển thị `ToDoItemEditForm` thay vì checkbox. Để làm điều đó, chúng ta sẽ sử dụng một chỉ thị Vue khác: [`v-if`](https://vuejs.org/api/built-in-directives.html#v-if).

Chỉ thị `v-if` sẽ chỉ kết xuất một khối nếu giá trị được truyền cho nó là truthy. Điều này tương tự như cách câu lệnh `if` hoạt động trong JavaScript. `v-if` cũng có các chỉ thị [`v-else-if`](https://vuejs.org/api/built-in-directives.html#v-else-if) và [`v-else`](https://vuejs.org/api/built-in-directives.html#v-else) tương ứng để cung cấp tương đương của logic JavaScript `else if` và `else` bên trong các mẫu Vue.

Điều quan trọng cần lưu ý là các khối `v-else` và `v-else-if` cần phải là anh chị em đầu tiên của một khối `v-if`/`v-else-if`, nếu không Vue sẽ không nhận ra chúng. Bạn cũng có thể gắn `v-if` vào thẻ `<template>` nếu bạn cần kết xuất có điều kiện một mẫu hoàn chỉnh.

Cuối cùng, bạn có thể sử dụng `v-if` + `v-else` ở gốc của thành phần để chỉ hiển thị một khối hoặc khối kia, vì Vue chỉ kết xuất một trong các khối này tại một thời điểm. Chúng ta sẽ làm điều này trong ứng dụng của mình, vì nó sẽ cho phép chúng ta thay thế code hiển thị mục todo bằng biểu mẫu chỉnh sửa.

Trước tiên thêm `v-if="!isEditing"` vào `<div>` gốc trong thành phần `ToDoItem` của bạn,

```vue
<div class="stack-small" v-if="!isEditing"></div>
```

Tiếp theo, bên dưới thẻ đóng của `<div>` đó thêm dòng sau:

```vue
<to-do-item-edit-form v-else :id="id" :label="label"></to-do-item-edit-form>
```

Chúng ta cũng cần import và đăng ký thành phần `ToDoItemEditForm`, để chúng ta có thể sử dụng nó bên trong mẫu này. Thêm dòng này ở đầu phần tử `<script>` của bạn:

```js
import ToDoItemEditForm from "./ToDoItemEditForm";
```

Và thêm thuộc tính `components` phía trên thuộc tính `props` bên trong đối tượng thành phần:

```js
export default {
  // …
  components: {
    ToDoItemEditForm,
  },
  // …
};
```

Bây giờ, nếu bạn đi đến ứng dụng và nhấp vào nút "Edit" của một mục todo, bạn sẽ thấy checkbox được thay thế bằng biểu mẫu chỉnh sửa.

![Ứng dụng danh sách todo, với các nút Edit và Delete được hiển thị, và một trong các todos ở chế độ chỉnh sửa, với input chỉnh sửa và các nút save và cancel được hiển thị](todo-edit-delete.png)

Tuy nhiên, hiện tại không có cách nào để quay lại. Để khắc phục điều đó, chúng ta cần thêm một số trình xử lý sự kiện nữa vào thành phần của chúng ta.

## Thoát khỏi chế độ chỉnh sửa

Đầu tiên, chúng ta cần thêm phương thức `itemEdited()` vào `methods` của thành phần `ToDoItem`. Phương thức này nên lấy nhãn mục mới làm đối số, phát ra sự kiện `itemEdited` cho thành phần cha và đặt `isEditing` thành `false`.

Thêm nó ngay bây giờ, bên dưới các phương thức hiện có của bạn:

```js
export default {
  // …
  methods: {
    // …
    itemEdited(newLabel) {
      this.$emit("item-edited", newLabel);
      this.isEditing = false;
    },
    // …
  },
  // …
};
```

Tiếp theo, chúng ta sẽ cần phương thức `editCancelled()`. Phương thức này sẽ không nhận đối số và chỉ đặt `isEditing` trở lại `false`. Thêm phương thức này bên dưới phương thức trước:

```js
export default {
  // …
  methods: {
    // …
    editCancelled() {
      this.isEditing = false;
    },
    // …
  },
  // …
};
```

Cuối cùng cho phần này, chúng ta sẽ thêm các trình xử lý sự kiện cho các sự kiện được phát ra bởi thành phần `ToDoItemEditForm`, và gắn các phương thức phù hợp vào mỗi sự kiện.

Cập nhật lệnh gọi `<to-do-item-edit-form></to-do-item-edit-form>` của bạn để trông như sau:

```vue
<to-do-item-edit-form
  v-else
  :id="id"
  :label="label"
  @item-edited="itemEdited"
  @edit-cancelled="editCancelled">
</to-do-item-edit-form>
```

## Cập nhật và xóa mục todo

Bây giờ chúng ta có thể chuyển đổi giữa biểu mẫu chỉnh sửa và checkbox. Tuy nhiên, chúng ta chưa thực sự xử lý việc cập nhật mảng `ToDoItems` trong `App.vue`. Để khắc phục điều đó, chúng ta cần lắng nghe sự kiện `item-edited` và cập nhật danh sách phù hợp. Chúng ta cũng muốn xử lý sự kiện xóa để chúng ta có thể xóa các mục todo.

Thêm các phương thức mới sau vào đối tượng thành phần `App.vue`, bên dưới các phương thức hiện có bên trong thuộc tính `methods`:

```js
export default {
  // …
  methods: {
    // …
    deleteToDo(toDoId) {
      const itemIndex = this.ToDoItems.findIndex((item) => item.id === toDoId);
      this.ToDoItems.splice(itemIndex, 1);
    },
    editToDo(toDoId, newLabel) {
      const toDoToEdit = this.ToDoItems.find((item) => item.id === toDoId);
      toDoToEdit.label = newLabel;
    },
    // …
  },
  // …
};
```

Tiếp theo, chúng ta sẽ thêm các trình lắng nghe sự kiện cho các sự kiện `item-deleted` và `item-edited`:

- Đối với `item-deleted`, bạn cần truyền `item.id` cho phương thức.
- Đối với `item-edited`, bạn cần truyền `item.id` và biến `$event` đặc biệt. Đây là biến Vue đặc biệt được sử dụng để truyền dữ liệu sự kiện cho các phương thức. Khi sử dụng các sự kiện HTML gốc (như `click`), điều này sẽ truyền đối tượng sự kiện gốc cho phương thức của bạn.

Cập nhật lệnh gọi `<to-do-item></to-do-item>` bên trong mẫu `App.vue` để trông như thế này:

```vue
<to-do-item
  :label="item.label"
  :done="item.done"
  :id="item.id"
  @checkbox-changed="updateDoneStatus(item.id)"
  @item-deleted="deleteToDo(item.id)"
  @item-edited="editToDo(item.id, $event)">
</to-do-item>
```

Và đây là kết quả — bây giờ bạn có thể chỉnh sửa và xóa các mục khỏi danh sách!

## Khắc phục lỗi nhỏ với trạng thái isDone

Đây là điều tuyệt vời cho đến nay, nhưng thực ra chúng ta đã đưa vào một lỗi bằng cách thêm chức năng chỉnh sửa. Hãy thử làm điều này:

1. Đánh dấu (hoặc bỏ đánh dấu) một trong các checkbox todo.
2. Nhấn nút "Edit" cho mục todo đó.
3. Hủy chỉnh sửa bằng cách nhấn nút "Cancel".

Lưu ý trạng thái của checkbox sau khi bạn hủy — không chỉ ứng dụng đã quên trạng thái của checkbox, mà trạng thái done của mục todo đó cũng bị lộn xộn. Nếu bạn thử đánh dấu (hoặc bỏ đánh dấu) lại, số lượng đã hoàn thành sẽ thay đổi theo chiều ngược lại với những gì bạn mong đợi. Điều này là vì `isDone` bên trong `data` chỉ được cung cấp giá trị `this.done` khi tải thành phần.

Khắc phục điều này rất may mắn là khá dễ dàng — chúng ta có thể làm điều này bằng cách chuyển đổi mục dữ liệu `isDone` thành [thuộc tính tính toán](/en-US/docs/Learn_web_development/Core/Frameworks_libraries/Vue_computed_properties) — một ưu điểm khác của thuộc tính tính toán là chúng bảo tồn [tính phản ứng](https://vuejs.org/guide/essentials/reactivity-fundamentals.html), nghĩa là (trong số những thứ khác) trạng thái của chúng được lưu khi mẫu thay đổi như của chúng ta đang làm.

Vì vậy, hãy triển khai bản sửa lỗi trong `ToDoItem.vue`:

1. Xóa dòng sau từ bên trong thuộc tính `data()` của chúng ta:

   ```js
   export default {
     // …
     isDone: this.done,
     // …
   };
   ```

2. Thêm khối sau bên dưới khối `data() {}`:

   ```js
   export default {
     // …
     computed: {
       isDone() {
         return this.done;
       },
     },
     // …
   };
   ```

Bây giờ khi bạn lưu và tải lại, bạn sẽ thấy rằng vấn đề đã được giải quyết — trạng thái checkbox bây giờ được bảo tồn khi bạn chuyển đổi giữa các mẫu mục todo.

## Hiểu mạng lưới sự kiện

Một trong những phần có thể gây nhầm lẫn nhất là mạng lưới các sự kiện tiêu chuẩn và tùy chỉnh mà chúng ta đã sử dụng để kích hoạt tất cả tính tương tác trong ứng dụng. Để hiểu điều này tốt hơn, nên viết ra một sơ đồ luồng, mô tả hoặc biểu đồ về những sự kiện nào được phát ra ở đâu, chúng đang được lắng nghe ở đâu và điều gì xảy ra khi chúng kích hoạt.

### App.vue

`<to-do-form>` lắng nghe:

- Sự kiện `todo-added` được phát ra bởi phương thức `onSubmit()` bên trong thành phần `ToDoForm` khi biểu mẫu được gửi.
  **Kết quả**: phương thức `addToDo()` được gọi để thêm mục todo mới vào mảng `ToDoItems`.

`<to-do-item>` lắng nghe:

- Sự kiện `checkbox-changed` được phát ra bởi `<input>` checkbox bên trong thành phần `ToDoItem` khi nó được đánh dấu hoặc bỏ đánh dấu.
  **Kết quả**: phương thức `updateDoneStatus()` được gọi để cập nhật trạng thái done của mục todo liên quan.
- Sự kiện `item-deleted` được phát ra bởi phương thức `deleteToDo()` bên trong thành phần `ToDoItem` khi nút "Delete" được nhấn.
  **Kết quả**: phương thức `deleteToDo()` được gọi để xóa mục todo liên quan.
- Sự kiện `item-edited` được phát ra bởi phương thức `itemEdited()` bên trong thành phần `ToDoItem` khi sự kiện `item-edited` được phát ra bởi phương thức `onSubmit()` bên trong `ToDoItemEditForm` đã được lắng nghe thành công. Vâng, đây là chuỗi hai sự kiện `item-edited` khác nhau!
  **Kết quả**: phương thức `editToDo()` được gọi để cập nhật nhãn của mục todo liên quan.

### ToDoForm.vue

`<form>` lắng nghe sự kiện `submit`.
**Kết quả**: phương thức `onSubmit()` được gọi, kiểm tra rằng nhãn mới không trống, sau đó phát ra sự kiện `todo-added` (sau đó được lắng nghe bên trong `App.vue`, xem ở trên), và cuối cùng xóa `<input>` nhãn mới.

### ToDoItem.vue

`<input>` của `type="checkbox"` lắng nghe các sự kiện `change`.
**Kết quả**: sự kiện `checkbox-changed` được phát ra khi checkbox được đánh dấu/bỏ đánh dấu (sau đó được lắng nghe bên trong `App.vue`; xem ở trên).

`<button>` "Edit" lắng nghe sự kiện `click`.
**Kết quả**: phương thức `toggleToItemEditForm()` được gọi, chuyển đổi `this.isEditing` thành `true`, điều này lần lượt hiển thị biểu mẫu chỉnh sửa mục todo khi kết xuất lại.

`<button>` "Delete" lắng nghe sự kiện `click`.
**Kết quả**: phương thức `deleteToDo()` được gọi, phát ra sự kiện `item-deleted` (sau đó được lắng nghe bên trong `App.vue`; xem ở trên).

`<to-do-item-edit-form>` lắng nghe:

- Sự kiện `item-edited` được phát ra bởi phương thức `onSubmit()` bên trong thành phần `ToDoItemEditForm` khi biểu mẫu được gửi thành công.
  **Kết quả**: phương thức `itemEdited()` được gọi, phát ra sự kiện `item-edited` (sau đó được lắng nghe bên trong `App.vue`, xem ở trên), và đặt `this.isEditing` trở lại `false`, để biểu mẫu chỉnh sửa không còn hiển thị khi kết xuất lại.
- Sự kiện `edit-cancelled` được phát ra bởi phương thức `onCancel()` bên trong thành phần `ToDoItemEditForm` khi nút "Cancel" được nhấp.
  **Kết quả**: phương thức `editCancelled()` được gọi, đặt `this.isEditing` trở lại `false`, để biểu mẫu chỉnh sửa không còn hiển thị khi kết xuất lại.

### ToDoItemEditForm.vue

`<form>` lắng nghe sự kiện `submit`.
**Kết quả**: phương thức `onSubmit()` được gọi, kiểm tra xem giá trị nhãn mới có không trống và không giống với cái cũ không, và nếu vậy phát ra sự kiện `item-edited` (sau đó được lắng nghe bên trong `ToDoItem.vue`, xem ở trên).

`<button>` "Cancel" lắng nghe sự kiện `click`.
**Kết quả**: phương thức `onCancel()` được gọi, phát ra sự kiện `edit-cancelled` (sau đó được lắng nghe bên trong `ToDoItem.vue`, xem ở trên).

## Tóm tắt

Bài viết này khá nhiều, và chúng ta đã đề cập đến rất nhiều ở đây. Bây giờ chúng ta có chức năng chỉnh sửa và xóa trong ứng dụng, điều này khá thú vị. Chúng ta đang đến gần cuối chuỗi Vue của mình. Tính năng chức năng cuối cùng cần xem xét là quản lý tiêu điểm, hay nói cách khác, cách chúng ta có thể cải thiện khả năng tiếp cận bàn phím của ứng dụng.

{{PreviousMenuNext("Learn_web_development/Core/Frameworks_libraries/Vue_computed_properties","Learn_web_development/Core/Frameworks_libraries/Vue_refs_focus_management", "Learn_web_development/Core/Frameworks_libraries")}}
