---
title: Tạo thành phần Vue đầu tiên của chúng ta
slug: Learn_web_development/Core/Frameworks_libraries/Vue_first_component
page-type: learn-module-chapter
sidebar: learnsidebar
---

{{PreviousMenuNext("Learn_web_development/Core/Frameworks_libraries/Vue_getting_started","Learn_web_development/Core/Frameworks_libraries/Vue_rendering_lists", "Learn_web_development/Core/Frameworks_libraries")}}

Bây giờ đã đến lúc tìm hiểu sâu hơn về Vue và tạo thành phần tùy chỉnh đầu tiên của chúng ta — chúng ta sẽ bắt đầu bằng cách tạo một thành phần để đại diện cho mỗi mục trong danh sách todo. Trong quá trình đó, chúng ta sẽ học về một số khái niệm quan trọng như gọi các thành phần bên trong các thành phần khác, truyền dữ liệu cho chúng thông qua props và lưu trạng thái dữ liệu.

> [!NOTE]
> Nếu bạn cần kiểm tra code của mình so với phiên bản của chúng tôi, bạn có thể tìm thấy phiên bản hoàn chỉnh của code ứng dụng Vue mẫu trong [kho lưu trữ todo-vue](https://github.com/mdn/todo-vue). Để xem phiên bản trực tiếp đang chạy, hãy xem <https://mdn.github.io/todo-vue/>.

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
          Các thành phần Vue được viết như một sự kết hợp của các đối tượng JavaScript quản lý dữ liệu của ứng dụng và cú pháp mẫu dựa trên HTML ánh xạ tới cấu trúc DOM bên dưới. Để cài đặt và sử dụng một số tính năng nâng cao hơn của Vue (như Single File Components hoặc render functions), bạn sẽ cần một terminal có
          <a
            href="https://nodejs.org/en/download"
            rel="noopener noreferrer"
            target="_blank"
            >Node</a
          >
          và
          <a
            href="https://www.npmjs.com/get-npm"
            rel="noopener noreferrer"
            target="_blank"
            >npm</a
          >
          được cài đặt.
        </p>
      </td>
    </tr>
    <tr>
      <th scope="row">Mục tiêu:</th>
      <td>
        Tìm hiểu cách tạo một thành phần Vue, kết xuất nó bên trong một thành phần khác, truyền dữ liệu vào nó bằng props và lưu trạng thái của nó.
      </td>
    </tr>
  </tbody>
</table>

## Tạo thành phần ToDoItem

Hãy tạo thành phần đầu tiên của chúng ta, sẽ hiển thị một mục todo đơn lẻ. Chúng ta sẽ sử dụng nó để xây dựng danh sách todos của mình.

1. Trong thư mục `moz-todo-vue/src/components` của bạn, tạo một file mới có tên `ToDoItem.vue`. Mở file trong trình soạn thảo code của bạn.
2. Tạo phần mẫu của thành phần bằng cách thêm `<template></template>` vào đầu file.
3. Tạo phần `<script></script>` bên dưới phần mẫu của bạn. Bên trong thẻ `<script>`, thêm một đối tượng xuất mặc định `export default {}`, đây là đối tượng thành phần của bạn.

File của bạn bây giờ sẽ trông như thế này:

```vue
<template></template>
<script>
export default {};
</script>
```

Bây giờ chúng ta có thể bắt đầu thêm nội dung thực sự vào `ToDoItem`. Các mẫu Vue hiện tại chỉ cho phép một phần tử gốc duy nhất — một phần tử cần bao bọc mọi thứ bên trong phần mẫu (điều này sẽ thay đổi khi Vue 3 ra đời). Chúng ta sẽ sử dụng [`<div>`](/en-US/docs/Web/HTML/Reference/Elements/div) cho phần tử gốc đó.

1. Thêm một `<div>` trống vào bên trong mẫu thành phần của bạn ngay bây giờ.
2. Bên trong `<div>` đó, hãy thêm một checkbox và nhãn tương ứng. Thêm một `id` vào checkbox và thuộc tính `for` ánh xạ checkbox đến nhãn, như hiển thị bên dưới.

   ```vue
   <template>
     <div>
       <input type="checkbox" id="todo-item" />
       <label for="todo-item">My Todo Item</label>
     </div>
   </template>
   ```

### Sử dụng TodoItem bên trong ứng dụng của chúng ta

Tất cả đều ổn, nhưng chúng ta chưa thêm thành phần vào ứng dụng, vì vậy không có cách nào để kiểm thử nó và xem mọi thứ có hoạt động không. Hãy thêm nó ngay bây giờ.

1. Mở lại `App.vue`.
2. Ở đầu thẻ `<script>` của bạn, thêm nội dung sau để import thành phần `ToDoItem`:

   ```js
   import ToDoItem from "./components/ToDoItem.vue";
   ```

3. Bên trong đối tượng thành phần của bạn, thêm thuộc tính `components` và bên trong đó thêm thành phần `ToDoItem` để đăng ký nó.

Nội dung `<script>` của bạn bây giờ sẽ trông như thế này:

```js
import ToDoItem from "./components/ToDoItem.vue";

export default {
  name: "app",
  components: {
    ToDoItem,
  },
};
```

Đây là cách mà thành phần `HelloWorld` được đăng ký bởi Vue CLI trước đó.

Để thực sự kết xuất thành phần `ToDoItem` trong ứng dụng, bạn cần đi lên phần tử `<template>` và gọi nó như một phần tử `<to-do-item></to-do-item>`. Lưu ý rằng tên file thành phần và biểu diễn của nó trong JavaScript ở dạng PascalCase (ví dụ: `ToDoList`), và phần tử tùy chỉnh tương đương ở dạng {{Glossary("kebab_case", "kebab-case")}} (ví dụ: `<to-do-list>`).
Cần thiết phải sử dụng kiểu viết hoa này nếu bạn đang viết các mẫu Vue [trực tiếp trong DOM](https://vuejs.org/guide/essentials/component-basics.html#dom-template-parsing-caveats).

1. Bên dưới [`<h1>`](/en-US/docs/Web/HTML/Reference/Elements/Heading_Elements), tạo một danh sách không có thứ tự ([`<ul>`](/en-US/docs/Web/HTML/Reference/Elements/ul)) chứa một mục danh sách duy nhất ([`<li>`](/en-US/docs/Web/HTML/Reference/Elements/li)).
2. Bên trong mục danh sách, thêm `<to-do-item></to-do-item>`.

Phần `<template>` của file `App.vue` của bạn bây giờ sẽ trông giống như thế này:

```vue
<div id="app">
  <h1>To-Do List</h1>
  <ul>
    <li>
      <to-do-item></to-do-item>
    </li>
  </ul>
</div>
```

Nếu bạn kiểm tra lại ứng dụng được kết xuất, bây giờ bạn sẽ thấy `ToDoItem` được kết xuất, bao gồm một checkbox và nhãn.

![Trạng thái kết xuất hiện tại của ứng dụng, bao gồm tiêu đề To-Do List và một checkbox và nhãn duy nhất](rendered-todoitem.png)

## Làm cho các thành phần động với props

Thành phần `ToDoItem` của chúng ta vẫn chưa thực sự hữu ích vì chúng ta thực sự chỉ có thể đưa cái này vào một lần trên trang (các ID cần phải duy nhất), và chúng ta không có cách nào để đặt văn bản nhãn. Không có gì về điều này là động.

Những gì chúng ta cần là một số trạng thái thành phần. Điều này có thể được thực hiện bằng cách thêm props vào thành phần của chúng ta. Bạn có thể nghĩ về props như tương tự với các đầu vào trong một hàm. Giá trị của một prop cung cấp cho các thành phần một trạng thái ban đầu ảnh hưởng đến hiển thị của chúng.

### Đăng ký props

Trong Vue, có hai cách để đăng ký props:

- Cách đầu tiên là chỉ liệt kê props ra như một mảng các chuỗi. Mỗi mục trong mảng tương ứng với tên của một prop.
- Cách thứ hai là định nghĩa props như một đối tượng, với mỗi khóa tương ứng với tên prop. Liệt kê props như một đối tượng cho phép bạn chỉ định các giá trị mặc định, đánh dấu props là bắt buộc, thực hiện kiểm tra kiểu đối tượng cơ bản (đặc biệt là xung quanh các kiểu nguyên thủy JavaScript) và thực hiện xác thực prop đơn giản.

> [!NOTE]
> Xác thực prop chỉ xảy ra ở chế độ phát triển, vì vậy bạn không thể dựa vào nó một cách nghiêm ngặt trong môi trường sản xuất. Ngoài ra, các hàm xác thực prop được gọi trước khi instance thành phần được tạo, vì vậy chúng không có quyền truy cập vào trạng thái thành phần (hoặc các props khác).

Đối với thành phần này, chúng ta sẽ sử dụng phương pháp đăng ký đối tượng.

1. Quay lại file `ToDoItem.vue` của bạn.
2. Thêm thuộc tính `props` bên trong đối tượng `export default {}`, chứa một đối tượng trống.
3. Bên trong đối tượng này, thêm hai thuộc tính với các khóa `label` và `done`.
4. Giá trị của khóa `label` phải là một đối tượng có 2 thuộc tính (hoặc **props**, như chúng được gọi trong ngữ cảnh có sẵn cho các thành phần).
   1. Thuộc tính đầu tiên là thuộc tính `required`, sẽ có giá trị là `true`. Điều này sẽ cho Vue biết rằng chúng ta mong đợi mọi instance của thành phần này có trường label. Vue sẽ cảnh báo chúng ta nếu một thành phần `ToDoItem` không có trường label.
   2. Thuộc tính thứ hai chúng ta sẽ thêm là thuộc tính `type`. Đặt giá trị cho thuộc tính này là kiểu JavaScript `String` (lưu ý chữ "S" viết hoa). Điều này cho Vue biết rằng chúng ta mong đợi giá trị của thuộc tính này là một chuỗi.

5. Bây giờ đến prop `done`.
   1. Đầu tiên thêm trường `default` với giá trị là `false`. Điều này có nghĩa là khi không có prop `done` nào được truyền cho thành phần `ToDoItem`, prop `done` sẽ có giá trị là false (hãy nhớ rằng điều này không bắt buộc — chúng ta chỉ cần `default` trên các props không bắt buộc).
   2. Tiếp theo thêm trường `type` với giá trị là `Boolean`. Điều này cho Vue biết chúng ta mong đợi prop value là kiểu boolean JavaScript.

Đối tượng thành phần của bạn bây giờ sẽ trông như thế này:

```js
export default {
  props: {
    label: { required: true, type: String },
    done: { default: false, type: Boolean },
  },
};
```

### Sử dụng props đã đăng ký

Với các props này được định nghĩa bên trong đối tượng thành phần, chúng ta có thể sử dụng các giá trị biến này bên trong mẫu. Hãy bắt đầu bằng cách thêm prop `label` vào mẫu thành phần.

Trong `<template>` của bạn, thay thế nội dung của phần tử `<label>` bằng `\{{label}}`.

`\{{}}` là cú pháp mẫu đặc biệt trong Vue, cho phép chúng ta in kết quả của các biểu thức JavaScript được định nghĩa trong lớp của chúng ta, bên trong mẫu, bao gồm các giá trị và phương thức. Điều quan trọng cần biết là nội dung bên trong `\{{}}` được hiển thị dưới dạng văn bản và không phải HTML. Trong trường hợp này, chúng ta đang in giá trị của prop `label`.

Phần mẫu của thành phần của bạn bây giờ sẽ trông như thế này:

```vue
<template>
  <div>
    <input type="checkbox" id="todo-item" />
    <label for="todo-item">\{{ label }}</label>
  </div>
</template>
```

Quay lại trình duyệt của bạn và bạn sẽ thấy mục todo được kết xuất như trước, nhưng không có nhãn (ôi không!). Đi đến DevTools của trình duyệt và bạn sẽ thấy cảnh báo tương tự trong console:

```plain
[Vue warn]: Missing required prop: "label"

found in

---> <ToDoItem> at src/components/ToDoItem.vue
        <App> at src/App.vue
          <Root>
```

Điều này là vì chúng ta đã đánh dấu `label` là prop bắt buộc, nhưng chúng ta chưa bao giờ cung cấp prop đó cho thành phần — chúng ta đã định nghĩa nơi bên trong mẫu chúng ta muốn sử dụng nó, nhưng chúng ta chưa truyền nó vào thành phần khi gọi nó. Hãy khắc phục điều đó.

Bên trong file `App.vue` của bạn, thêm prop `label` vào thành phần `<to-do-item></to-do-item>`, giống như một thuộc tính HTML thông thường:

```vue
<to-do-item label="My ToDo Item"></to-do-item>
```

Bây giờ bạn sẽ thấy nhãn trong ứng dụng, và cảnh báo sẽ không xuất hiện trong console nữa.

Đó là những điều cơ bản về props. Tiếp theo chúng ta sẽ chuyển sang cách Vue duy trì trạng thái dữ liệu.

## Đối tượng data của Vue

Nếu bạn thay đổi giá trị của prop `label` được truyền vào lệnh gọi `<to-do-item></to-do-item>` trong thành phần `App` của bạn, bạn sẽ thấy nó cập nhật. Điều này rất tuyệt. Chúng ta có một checkbox với nhãn có thể cập nhật. Tuy nhiên, hiện tại chúng ta không làm gì với prop "done" — chúng ta có thể đánh dấu các checkbox trong UI, nhưng ở đâu trong ứng dụng chúng ta không ghi lại liệu một mục todo có thực sự được hoàn thành không.

Để đạt được điều này, chúng ta muốn ràng buộc prop `done` của thành phần với thuộc tính `checked` trên phần tử [`<input>`](/en-US/docs/Web/HTML/Reference/Elements/input), để nó có thể phục vụ như một bản ghi cho biết checkbox có được đánh dấu không. Tuy nhiên, điều quan trọng là props phục vụ như ràng buộc dữ liệu một chiều — một thành phần không bao giờ nên thay đổi giá trị của props riêng của nó. Có rất nhiều lý do cho điều này. Một phần, các thành phần chỉnh sửa props có thể làm cho việc gỡ lỗi trở nên khó khăn. Nếu một giá trị được truyền cho nhiều thành phần con, có thể khó theo dõi những thay đổi đối với giá trị đó đến từ đâu. Ngoài ra, việc thay đổi props có thể khiến các thành phần kết xuất lại. Vì vậy, việc thay đổi props trong một thành phần sẽ kích hoạt thành phần đó kết xuất lại, điều này lại có thể kích hoạt việc thay đổi một lần nữa.

Để giải quyết vấn đề này, chúng ta có thể quản lý trạng thái `done` bằng cách sử dụng thuộc tính `data` của Vue. Thuộc tính `data` là nơi bạn có thể quản lý trạng thái cục bộ trong một thành phần, nó tồn tại bên trong đối tượng thành phần cùng với thuộc tính `props` và có cấu trúc như sau:

```js
export default {
  // …
  data() {
    return {
      key: value,
    };
  },
  // …
};
```

Bạn sẽ lưu ý rằng thuộc tính `data` là một hàm. Điều này là để giữ cho các giá trị dữ liệu là duy nhất cho mỗi instance của thành phần tại thời điểm chạy — hàm được gọi riêng cho mỗi instance thành phần. Nếu bạn khai báo dữ liệu chỉ như một đối tượng, tất cả các instance của thành phần đó sẽ chia sẻ cùng các giá trị. Đây là tác dụng phụ của cách Vue đăng ký các thành phần và là điều bạn không muốn.

Bạn sử dụng `this` để truy cập các props và các thuộc tính khác của thành phần từ bên trong dữ liệu, như bạn có thể mong đợi. Chúng ta sẽ thấy một ví dụ về điều này ngay sau đây.

> [!NOTE]
> Vì cách `this` hoạt động trong các arrow function (ràng buộc với ngữ cảnh cha), bạn sẽ không thể truy cập bất kỳ thuộc tính cần thiết nào từ bên trong `data` nếu bạn sử dụng arrow function. Vì vậy, đừng sử dụng arrow function cho thuộc tính `data`.

Vậy hãy thêm thuộc tính `data` vào thành phần `ToDoItem` của chúng ta. Điều này sẽ trả về một đối tượng chứa một thuộc tính duy nhất mà chúng ta sẽ gọi là `isDone`, có giá trị là `this.done`.

Cập nhật đối tượng thành phần như sau:

```js
export default {
  props: {
    label: { required: true, type: String },
    done: { default: false, type: Boolean },
  },
  data() {
    return {
      isDone: this.done,
    };
  },
};
```

Vue thực hiện một ít ma thuật ở đây — nó ràng buộc tất cả props của bạn trực tiếp với instance thành phần, vì vậy chúng ta không cần gọi `this.props.done`. Nó cũng ràng buộc các thuộc tính khác (`data`, mà bạn đã thấy, và những cái khác như `methods`, `computed`, v.v.) trực tiếp với instance. Điều này, một phần, là để làm cho chúng có sẵn cho mẫu của bạn. Nhược điểm của điều này là bạn cần giữ cho các khóa là duy nhất trên các thuộc tính này. Đó là lý do tại sao chúng ta gọi thuộc tính `data` của mình là `isDone` thay vì `done`.

Vì vậy, bây giờ chúng ta cần gắn thuộc tính `isDone` vào thành phần của chúng ta. Theo cách tương tự như Vue sử dụng biểu thức `\{{}}` để hiển thị các biểu thức JavaScript bên trong các mẫu, Vue có cú pháp đặc biệt để ràng buộc các biểu thức JavaScript với các phần tử HTML và thành phần: **`v-bind`**. Biểu thức `v-bind` trông như thế này:

```plain
v-bind:attribute="expression"
```

Nói cách khác, bạn thêm tiền tố `v-bind:` vào bất kỳ thuộc tính/prop nào bạn muốn ràng buộc. Trong hầu hết các trường hợp, bạn có thể sử dụng cách viết tắt cho thuộc tính `v-bind`, đó là chỉ thêm tiền tố dấu hai chấm vào thuộc tính/prop. Vì vậy `:attribute="expression"` hoạt động giống như `v-bind:attribute="expression"`.

Vì vậy, trong trường hợp checkbox trong thành phần `ToDoItem` của chúng ta, chúng ta có thể sử dụng `v-bind` để ánh xạ thuộc tính `isDone` với thuộc tính `checked` trên phần tử `<input>`. Cả hai đều tương đương:

```vue
<input type="checkbox" id="todo-item" v-bind:checked="isDone" />

<input type="checkbox" id="todo-item" :checked="isDone" />
```

Bạn tự do sử dụng bất kỳ mẫu nào bạn muốn. Tuy nhiên tốt nhất là nhất quán. Vì cú pháp viết tắt được sử dụng phổ biến hơn, bài hướng dẫn này sẽ giữ theo mẫu đó.

Vậy hãy làm điều này. Cập nhật phần tử `<input>` của bạn ngay bây giờ để bao gồm `:checked="isDone"`.

Kiểm tra thành phần của bạn bằng cách truyền `:done="true"` vào lệnh gọi `ToDoItem` trong `App.vue`. Lưu ý rằng bạn cần sử dụng cú pháp `v-bind`, vì nếu không `true` sẽ được truyền dưới dạng chuỗi. Checkbox hiển thị sẽ được đánh dấu.

```vue
<template>
  <div id="app">
    <h1>My To-Do List</h1>
    <ul>
      <li>
        <to-do-item label="My ToDo Item" :done="true"></to-do-item>
      </li>
    </ul>
  </div>
</template>
```

Hãy thử thay đổi `true` thành `false` và ngược lại, tải lại ứng dụng giữa các lần để xem trạng thái thay đổi như thế nào.

## Cung cấp id duy nhất cho các Todos

Tuyệt! Bây giờ chúng ta có một checkbox hoạt động mà chúng ta có thể đặt trạng thái theo cách lập trình. Tuy nhiên, hiện tại chúng ta chỉ có thể thêm một thành phần `ToDoList` vào trang vì `id` được hardcode. Điều này sẽ dẫn đến lỗi với công nghệ hỗ trợ vì `id` cần thiết để ánh xạ chính xác nhãn đến checkbox của chúng. Để khắc phục điều này, chúng ta có thể đặt `id` theo cách lập trình trong dữ liệu thành phần.

Chúng ta có thể sử dụng phương thức {{domxref("Crypto.randomUUID()")}} để tạo ra một chuỗi duy nhất để giữ cho các `id` thành phần là duy nhất. `randomUUID()` được tích hợp vào các trình duyệt hiện đại và cung cấp một cách đơn giản để đảm bảo tính duy nhất mà không cần dựa vào các thư viện bên ngoài.

Tiếp theo, thêm trường `id` vào thuộc tính `data` như hiển thị bên dưới; điều này sử dụng `crypto.randomUUID()` để trả về một chuỗi duy nhất, mà chúng ta sau đó thêm tiền tố `todo-`:

```js
export default {
  props: {
    label: { required: true, type: String },
    done: { default: false, type: Boolean },
  },
  data() {
    return {
      isDone: this.done,
      id: `todo-${crypto.randomUUID()}`,
    };
  },
};
```

Tiếp theo, ràng buộc `id` vào cả thuộc tính `id` của checkbox và thuộc tính `for` của nhãn, cập nhật các thuộc tính `id` và `for` hiện có như hiển thị:

```vue
<template>
  <div>
    <input type="checkbox" :id="id" :checked="isDone" />
    <label :for="id">\{{ label }}</label>
  </div>
</template>
```

## Tóm tắt

Đó là đủ cho bài viết này. Ở điểm này, chúng ta có một thành phần `ToDoItem` hoạt động tốt, có thể được truyền nhãn để hiển thị, sẽ lưu trạng thái được đánh dấu của nó, và sẽ được kết xuất với một `id` duy nhất mỗi lần được gọi. Bạn có thể kiểm tra xem các `id` duy nhất có hoạt động không bằng cách tạm thời thêm nhiều lệnh gọi `<to-do-item></to-do-item>` hơn vào `App.vue`, sau đó kiểm tra đầu ra được kết xuất của chúng với DevTools của trình duyệt.

Bây giờ chúng ta đã sẵn sàng thêm nhiều thành phần `ToDoItem` vào ứng dụng của mình. Trong bài viết tiếp theo, chúng ta sẽ xem xét việc thêm một tập hợp dữ liệu mục todo vào thành phần `App.vue` của chúng ta, sau đó sẽ lặp qua và hiển thị bên trong các thành phần `ToDoItem` bằng cách sử dụng chỉ thị `v-for`.

{{PreviousMenuNext("Learn_web_development/Core/Frameworks_libraries/Vue_getting_started","Learn_web_development/Core/Frameworks_libraries/Vue_rendering_lists", "Learn_web_development/Core/Frameworks_libraries")}}
