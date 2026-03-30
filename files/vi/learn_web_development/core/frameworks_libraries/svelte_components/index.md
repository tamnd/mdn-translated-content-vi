---
title: Chia nhỏ ứng dụng Svelte thành các thành phần
slug: Learn_web_development/Core/Frameworks_libraries/Svelte_components
page-type: learn-module-chapter
sidebar: learnsidebar
---

{{PreviousMenuNext("Learn_web_development/Core/Frameworks_libraries/Svelte_variables_props","Learn_web_development/Core/Frameworks_libraries/Svelte_reactivity_lifecycle_accessibility", "Learn_web_development/Core/Frameworks_libraries")}}

Trong bài viết trước, chúng ta đã bắt đầu phát triển ứng dụng danh sách việc cần làm. Mục tiêu trung tâm của bài viết này là xem cách chia nhỏ ứng dụng của chúng ta thành các thành phần có thể quản lý và chia sẻ thông tin giữa chúng. Chúng ta sẽ chia nhỏ ứng dụng thành các thành phần, sau đó thêm nhiều chức năng hơn để cho phép người dùng cập nhật các thành phần hiện có.

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
          Bạn sẽ cần một terminal với node và npm được cài đặt để biên dịch và xây dựng ứng dụng của mình.
        </p>
      </td>
    </tr>
    <tr>
      <th scope="row">Mục tiêu:</th>
      <td>
        Tìm hiểu cách chia nhỏ ứng dụng của chúng ta thành các thành phần và chia sẻ thông tin giữa chúng.
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
cd mdn-svelte-tutorial/04-componentizing-our-app
```

Hoặc tải xuống trực tiếp nội dung thư mục:

```bash
npx degit opensas/mdn-svelte-tutorial/04-componentizing-our-app
```

Nhớ chạy `npm install && npm run dev` để khởi động ứng dụng ở chế độ phát triển.

### REPL

Để lập trình cùng chúng tôi bằng REPL, bắt đầu tại

<https://svelte.dev/repl/99b9eb228b404a2f8c8959b22c0a40d3?version=3.23.2>

## Chia nhỏ ứng dụng thành các thành phần

Trong Svelte, một ứng dụng được tạo thành từ một hoặc nhiều thành phần. Một thành phần là một khối mã có thể tái sử dụng, khép kín, đóng gói HTML, CSS và JavaScript cùng nhau, được viết vào tệp `.svelte`. Các thành phần có thể lớn hoặc nhỏ, nhưng chúng thường được xác định rõ ràng: các thành phần hiệu quả nhất phục vụ một mục đích duy nhất, rõ ràng.

Lợi ích của việc định nghĩa các thành phần tương tự với thực hành tốt hơn nói chung là tổ chức mã của bạn thành các phần có thể quản lý. Nó sẽ giúp bạn hiểu cách chúng liên quan đến nhau, sẽ thúc đẩy tái sử dụng và làm cho mã của bạn dễ suy nghĩ, duy trì và mở rộng hơn.

Nhưng làm thế nào bạn biết điều gì nên được tách ra thành thành phần riêng của nó?

Không có quy tắc cứng nhắc nào cho điều này. Một số người thích phương pháp trực quan và bắt đầu nhìn vào đánh dấu và vẽ các hộp xung quanh mỗi thành phần và thành phần con có vẻ có logic riêng của nó.

Những người khác áp dụng các kỹ thuật giống nhau được sử dụng để quyết định xem bạn có nên tạo một hàm hoặc đối tượng mới không. Một kỹ thuật như vậy là nguyên tắc trách nhiệm đơn lẻ — đó là, một thành phần lý tưởng chỉ nên làm một việc. Nếu nó kết thúc phát triển, nó nên được tách ra thành các thành phần con nhỏ hơn.

Cả hai phương pháp nên bổ sung cho nhau và giúp bạn quyết định cách tổ chức tốt hơn các thành phần của mình.

Cuối cùng, chúng ta sẽ chia ứng dụng của mình thành các thành phần sau:

- `Alert.svelte`: Một hộp thông báo chung để truyền đạt các hành động đã xảy ra.
- `NewTodo.svelte`: Ô nhập văn bản và nút cho phép bạn nhập mục việc cần làm mới.
- `FilterButton.svelte`: Các nút _All_, _Active_ và _Completed_ cho phép bạn áp dụng bộ lọc cho các mục việc cần làm được hiển thị.
- `TodosStatus.svelte`: Tiêu đề "x out of y items completed".
- `Todo.svelte`: Một mục việc cần làm riêng lẻ. Mỗi mục việc cần làm hiển thị sẽ được hiển thị trong một bản sao riêng biệt của thành phần này.
- `MoreActions.svelte`: Các nút _Check All_ và _Remove Completed_ ở cuối giao diện người dùng cho phép bạn thực hiện các hành động hàng loạt trên các mục việc cần làm.

![biểu diễn đồ họa danh sách các thành phần trong ứng dụng của chúng ta](01-todo-components.png)

Trong bài viết này, chúng ta sẽ tập trung vào việc tạo các thành phần `FilterButton` và `Todo`; chúng ta sẽ đến phần còn lại trong các bài viết tương lai.

Hãy bắt đầu.

> [!NOTE]
> Trong quá trình tạo vài thành phần đầu tiên, chúng ta cũng sẽ tìm hiểu các kỹ thuật khác nhau để giao tiếp giữa các thành phần, và ưu nhược điểm của từng cái.

## Trích xuất thành phần bộ lọc

Chúng ta sẽ bắt đầu bằng cách tạo `FilterButton.svelte`.

1. Trước tiên, hãy tạo tệp mới, `components/FilterButton.svelte`.
2. Bên trong tệp này, chúng ta sẽ khai báo prop `filter` và sau đó sao chép đánh dấu liên quan vào nó từ `Todos.svelte`. Thêm nội dung sau vào tệp:

   ```svelte
   <script>
     export let filter = 'all'
   </script>

   <div class="filters btn-group stack-exception">
     <button class="btn toggle-btn" class:btn__primary={filter === 'all'} aria-pressed={filter === 'all'} on:click={() => filter = 'all'} >
       <span class="visually-hidden">Show</span>
       <span>All</span>
       <span class="visually-hidden">tasks</span>
     </button>
     <button class="btn toggle-btn" class:btn__primary={filter === 'active'} aria-pressed={filter === 'active'} on:click={() => filter = 'active'} >
       <span class="visually-hidden">Show</span>
       <span>Active</span>
       <span class="visually-hidden">tasks</span>
     </button>
     <button class="btn toggle-btn" class:btn__primary={filter === 'completed'} aria-pressed={filter === 'completed'} on:click={() => filter = 'completed'} >
       <span class="visually-hidden">Show</span>
       <span>Completed</span>
       <span class="visually-hidden">tasks</span>
     </button>
   </div>
   ```

3. Quay lại thành phần `Todos.svelte`, chúng ta muốn sử dụng thành phần `FilterButton`. Trước tiên, chúng ta cần nhập nó. Thêm dòng sau ở đầu phần `<script>` của `Todos.svelte`:

   ```js
   import FilterButton from "./FilterButton.svelte";
   ```

4. Bây giờ, thay thế phần tử `<div class="filters...` bằng lệnh gọi đến thành phần `FilterButton`, nhận bộ lọc hiện tại là prop. Dòng dưới đây là tất cả những gì bạn cần:

   ```svelte
   <FilterButton {filter} />
   ```

> [!NOTE]
> Hãy nhớ rằng khi tên thuộc tính HTML và biến khớp nhau, chúng có thể được thay thế bằng `{variable}`. Đó là lý do tại sao chúng ta có thể thay thế `<FilterButton filter={filter} />` bằng `<FilterButton {filter} />`.

Đến đây là ổn! Hãy thử ứng dụng ngay bây giờ. Bạn sẽ nhận thấy rằng khi bạn nhấp vào các nút bộ lọc, chúng được chọn và kiểu dáng cập nhật phù hợp. Nhưng chúng ta có một vấn đề: các việc cần làm không được lọc. Đó là vì biến `filter` chảy xuống từ thành phần `Todos` đến thành phần `FilterButton` qua prop, nhưng các thay đổi xảy ra trong thành phần `FilterButton` không chảy trở lên cha của nó — ràng buộc dữ liệu là một chiều theo mặc định. Hãy xem cách giải quyết vấn đề này.

## Chia sẻ dữ liệu giữa các thành phần: truyền trình xử lý như một prop

Một cách để cho phép các thành phần con thông báo cho cha của chúng về bất kỳ thay đổi nào là truyền một trình xử lý như một prop. Thành phần con sẽ thực thi trình xử lý, truyền thông tin cần thiết như tham số, và trình xử lý sẽ sửa đổi trạng thái của cha.

Trong trường hợp của chúng ta, thành phần `FilterButton` sẽ nhận trình xử lý `onclick` từ cha của nó. Bất cứ khi nào người dùng nhấp vào bất kỳ nút bộ lọc nào, con sẽ gọi trình xử lý `onclick`, truyền bộ lọc đã chọn như tham số trở lên cha của nó.

Chúng ta sẽ khai báo prop `onclick` gán một trình xử lý giả để ngăn lỗi, như thế này:

```js
export let onclick = (clicked) => {};
```

Và chúng ta sẽ khai báo câu lệnh có khả năng phản ứng `$: onclick(filter)` để gọi trình xử lý `onclick` bất cứ khi nào biến `filter` được cập nhật.

1. Phần `<script>` của thành phần `FilterButton` của chúng ta sẽ kết thúc như thế này. Cập nhật nó ngay bây giờ:

   ```js
   export let filter = "all";
   export let onclick = (clicked) => {};
   $: onclick(filter);
   ```

2. Bây giờ khi chúng ta gọi `FilterButton` bên trong `Todos.svelte`, chúng ta cần chỉ định trình xử lý. Cập nhật nó như thế này:

   ```svelte
   <FilterButton {filter} onclick={ (clicked) => filter = clicked }/>
   ```

Khi bất kỳ nút bộ lọc nào được nhấp, chúng ta chỉ cần cập nhật biến filter với bộ lọc mới. Bây giờ thành phần `FilterButton` của chúng ta sẽ hoạt động trở lại.

## Ràng buộc dữ liệu hai chiều dễ dàng hơn với chỉ thị bind

Trong ví dụ trước, chúng ta nhận ra rằng thành phần `FilterButton` của chúng ta không hoạt động vì trạng thái ứng dụng đang chảy xuống từ cha đến con qua prop `filter`, nhưng nó không đi trở lên. Vì vậy, chúng ta đã thêm prop `onclick` để cho thành phần con giao tiếp giá trị `filter` mới đến cha của nó.

Nó hoạt động tốt, nhưng Svelte cung cấp cho chúng ta một cách dễ hơn và thẳng hơn để đạt được ràng buộc dữ liệu hai chiều. Dữ liệu thông thường chảy xuống từ cha đến con bằng cách sử dụng prop. Nếu chúng ta muốn nó cũng chảy theo hướng khác, từ con đến cha, chúng ta có thể sử dụng [chỉ thị `bind:`](https://svelte.dev/docs/element-directives#bind-property).

Sử dụng `bind`, chúng ta sẽ cho Svelte biết rằng bất kỳ thay đổi nào được thực hiện đối với prop `filter` trong thành phần `FilterButton` sẽ được lan truyền trở lại thành phần cha, `Todos`. Nghĩa là, chúng ta sẽ ràng buộc giá trị của biến `filter` trong cha với giá trị của nó trong con.

1. Trong `Todos.svelte`, cập nhật lệnh gọi đến thành phần `FilterButton` như sau:

   ```svelte
   <FilterButton bind:filter={filter} />
   ```

   Như thường lệ, Svelte cung cấp cho chúng ta một lối tắt tiện lợi: `bind:value={value}` tương đương với `bind:value`. Vì vậy, trong ví dụ trên, bạn có thể chỉ viết `<FilterButton bind:filter />`.

2. Thành phần con giờ có thể sửa đổi giá trị của biến filter của cha, vì vậy chúng ta không còn cần prop `onclick`. Sửa đổi phần tử `<script>` của `FilterButton` như thế này:

   ```svelte
   <script>
     export let filter = "all";
   </script>
   ```

3. Hãy thử ứng dụng của bạn một lần nữa, và bạn vẫn sẽ thấy bộ lọc hoạt động đúng cách.

## Tạo thành phần Todo

Bây giờ chúng ta sẽ tạo thành phần `Todo` để đóng gói từng mục việc cần làm riêng lẻ, bao gồm hộp kiểm và một số logic chỉnh sửa để bạn có thể thay đổi một việc cần làm hiện có.

Thành phần `Todo` của chúng ta sẽ nhận một đối tượng `todo` duy nhất như prop. Hãy khai báo prop `todo` và di chuyển mã từ thành phần `Todos`. Hiện tại, chúng ta sẽ thay thế lệnh gọi đến `removeTodo` bằng một cảnh báo. Chúng ta sẽ thêm lại chức năng đó sau.

1. Tạo tệp thành phần mới, `components/Todo.svelte`.
2. Đặt nội dung sau bên trong tệp này:

   ```svelte
   <script>
     export let todo
   </script>

   <div class="stack-small">
     <div class="c-cb">
       <input type="checkbox" id="todo-{todo.id}"
         on:click={() => todo.completed = !todo.completed}
         checked={todo.completed}
       />
       <label for="todo-{todo.id}" class="todo-label">{todo.name}</label>
     </div>
     <div class="btn-group">
       <button type="button" class="btn">
         Edit <span class="visually-hidden">{todo.name}</span>
       </button>
       <button type="button" class="btn btn__danger" on:click={() => alert('not implemented')}>
         Delete <span class="visually-hidden">{todo.name}</span>
       </button>
     </div>
   </div>
   ```

3. Bây giờ chúng ta cần nhập thành phần `Todo` vào `Todos.svelte`. Vào tệp này ngay bây giờ và thêm câu lệnh `import` sau bên dưới câu lệnh trước:

   ```js
   import Todo from "./Todo.svelte";
   ```

4. Tiếp theo, chúng ta cần cập nhật khối `{#each}` để bao gồm thành phần `<Todo>` cho mỗi việc cần làm, thay vì mã đã được chuyển ra `Todo.svelte`. Chúng ta cũng đang truyền đối tượng `todo` hiện tại vào thành phần như một prop.

   Cập nhật khối `{#each}` bên trong `Todos.svelte` như thế này:

   ```svelte
   <ul role="list" class="todo-list stack-large" aria-labelledby="list-heading">
     {#each filterTodos(filter, todos) as todo (todo.id)}
     <li class="todo">
       <Todo {todo} />
     </li>
     {:else}
     <li>Nothing to do here!</li>
     {/each}
   </ul>
   ```

Danh sách việc cần làm được hiển thị trên trang và các hộp kiểm nên hoạt động (thử kiểm tra/bỏ kiểm tra vài cái, và quan sát rằng các bộ lọc vẫn hoạt động như mong đợi), nhưng tiêu đề trạng thái "x out of y items completed" của chúng ta sẽ không còn cập nhật cho phù hợp. Đó là vì thành phần `Todo` đang nhận việc cần làm qua prop, nhưng không gửi thông tin trở lại cha của nó. Chúng ta sẽ sửa điều này sau.

## Chia sẻ dữ liệu giữa các thành phần: mẫu props-down, events-up

Chỉ thị `bind` khá đơn giản và cho phép bạn chia sẻ dữ liệu giữa thành phần cha và con với ít phiền phức tối thiểu. Tuy nhiên, khi ứng dụng của bạn phát triển lớn hơn và phức tạp hơn, có thể dễ dàng trở nên khó khăn để theo dõi tất cả các giá trị đã ràng buộc của bạn. Một cách tiếp cận khác là mẫu giao tiếp "props-down, events-up".

Về cơ bản, mẫu này dựa trên các thành phần con nhận dữ liệu từ cha của chúng qua prop và các thành phần cha cập nhật trạng thái của chúng bằng cách xử lý các sự kiện được phát ra từ các thành phần con. Vì vậy, prop _chảy xuống_ từ cha đến con và sự kiện _nổi lên_ từ con đến cha. Mẫu này thiết lập một luồng thông tin hai chiều, có thể dự đoán và dễ suy nghĩ hơn.

Hãy xem cách phát ra các sự kiện riêng của chúng ta để tái triển khai chức năng nút _Delete_ bị thiếu.

Để tạo các sự kiện tùy chỉnh, chúng ta sẽ sử dụng tiện ích `createEventDispatcher`. Điều này sẽ trả về một hàm `dispatch()` cho phép chúng ta phát ra các sự kiện tùy chỉnh. Khi bạn gửi một sự kiện, bạn phải truyền tên của sự kiện và, tùy chọn, một đối tượng với thông tin bổ sung mà bạn muốn truyền đến mọi trình lắng nghe. Dữ liệu bổ sung này sẽ có sẵn trên thuộc tính `detail` của đối tượng sự kiện.

> [!NOTE]
> Các sự kiện tùy chỉnh trong Svelte chia sẻ cùng API với các sự kiện DOM thông thường. Hơn nữa, bạn có thể nổi lên một sự kiện đến thành phần cha bằng cách chỉ định `on:event` mà không có trình xử lý.

Chúng ta sẽ chỉnh sửa thành phần `Todo` để phát ra sự kiện `remove`, truyền việc cần làm đang bị xóa như thông tin bổ sung.

1. Trước tiên, thêm các dòng sau vào đầu phần `<script>` của thành phần `Todo`:

   ```js
   import { createEventDispatcher } from "svelte";

   const dispatch = createEventDispatcher();
   ```

2. Bây giờ cập nhật nút _Delete_ trong phần đánh dấu của cùng một tệp để trông như thế này:

   ```svelte
   <button type="button" class="btn btn__danger" on:click={() => dispatch('remove', todo)}>
     Delete <span class="visually-hidden">{todo.name}</span>
   </button>
   ```

   Với `dispatch('remove', todo)`, chúng ta đang phát ra sự kiện `remove` và truyền dữ liệu bổ sung là `todo` đang bị xóa. Trình xử lý sẽ được gọi với đối tượng sự kiện có sẵn, với dữ liệu bổ sung có sẵn trong thuộc tính `event.detail`.

3. Bây giờ chúng ta phải lắng nghe sự kiện đó từ bên trong `Todos.svelte` và hành động cho phù hợp. Quay lại tệp này và cập nhật lệnh gọi thành phần `<Todo>` như thế này:

   ```svelte
   <Todo {todo} on:remove={(e) => removeTodo(e.detail)} />
   ```

   Trình xử lý của chúng ta nhận tham số `e` (đối tượng sự kiện), mà như mô tả trước giữ việc cần làm đang bị xóa trong thuộc tính `detail`.

4. Tại thời điểm này, nếu bạn thử ứng dụng của mình một lần nữa, bạn sẽ thấy chức năng _Delete_ hiện hoạt động trở lại. Vì vậy, sự kiện tùy chỉnh của chúng ta đã hoạt động như chúng ta mong đợi. Ngoài ra, trình lắng nghe sự kiện `remove` đang gửi thay đổi dữ liệu trở lên cha, vì vậy tiêu đề trạng thái "x out of y items completed" của chúng ta giờ sẽ cập nhật phù hợp khi việc cần làm được xóa.

Bây giờ chúng ta sẽ xử lý sự kiện `update`, để thành phần cha có thể được thông báo về bất kỳ việc cần làm đã được sửa đổi nào.

## Cập nhật việc cần làm

Chúng ta vẫn phải triển khai chức năng để cho phép chúng ta chỉnh sửa các việc cần làm hiện có. Chúng ta sẽ phải bao gồm chế độ chỉnh sửa trong thành phần `Todo`. Khi vào chế độ chỉnh sửa, chúng ta sẽ hiển thị trường `<input>` để cho phép chúng ta chỉnh sửa tên việc cần làm hiện tại, với hai nút để xác nhận hoặc hủy các thay đổi của chúng ta.

### Xử lý sự kiện

1. Chúng ta sẽ cần một biến để theo dõi xem chúng ta đang ở chế độ chỉnh sửa và một biến khác để lưu trữ tên tác vụ đang được cập nhật. Thêm các định nghĩa biến sau vào cuối phần `<script>` của thành phần `Todo`:

   ```js
   let editing = false; // track editing mode
   let name = todo.name; // hold the name of the to-do being edited
   ```

2. Chúng ta phải quyết định những sự kiện nào thành phần `Todo` của chúng ta sẽ phát ra:
   - Chúng ta có thể phát các sự kiện khác nhau cho việc bật/tắt trạng thái và chỉnh sửa tên (ví dụ: `updateTodoStatus` và `updateTodoName`).
   - Hoặc chúng ta có thể lấy phương pháp tổng quát hơn và phát một sự kiện `update` duy nhất cho cả hai thao tác.

   Chúng ta sẽ lấy phương pháp thứ hai để chúng ta có thể trình diễn kỹ thuật khác. Ưu điểm của phương pháp này là sau đó chúng ta có thể thêm nhiều trường hơn vào việc cần làm và vẫn xử lý tất cả cập nhật bằng cùng một sự kiện.

   Hãy tạo hàm `update()` sẽ nhận các thay đổi và sẽ phát sự kiện update với việc cần làm đã sửa đổi. Thêm điều sau, một lần nữa vào cuối phần `<script>`:

   ```js
   function update(updatedTodo) {
     todo = { ...todo, ...updatedTodo }; // applies modifications to todo
     dispatch("update", todo); // emit update event
   }
   ```

   Ở đây chúng ta đang sử dụng [cú pháp spread](/vi/docs/Web/JavaScript/Reference/Operators/Spread_syntax) để trả về việc cần làm gốc với các sửa đổi được áp dụng cho nó.

3. Tiếp theo chúng ta sẽ tạo các hàm khác nhau để xử lý từng hành động người dùng. Khi việc cần làm đang ở chế độ chỉnh sửa, người dùng có thể lưu hoặc hủy các thay đổi. Khi không ở chế độ chỉnh sửa, người dùng có thể xóa việc cần làm, chỉnh sửa nó hoặc bật/tắt trạng thái giữa đã hoàn thành và đang hoạt động.

   Thêm tập hàm sau bên dưới hàm trước của bạn để xử lý các hành động này:

   ```js
   function onCancel() {
     name = todo.name; // restores name to its initial value and
     editing = false; // and exit editing mode
   }

   function onSave() {
     update({ name }); // updates todo name
     editing = false; // and exit editing mode
   }

   function onRemove() {
     dispatch("remove", todo); // emit remove event
   }

   function onEdit() {
     editing = true; // enter editing mode
   }

   function onToggle() {
     update({ completed: !todo.completed }); // updates todo status
   }
   ```

### Cập nhật đánh dấu

Bây giờ chúng ta cần cập nhật đánh dấu thành phần `Todo` để gọi các hàm trên khi các hành động thích hợp được thực hiện.

Để xử lý chế độ chỉnh sửa, chúng ta đang sử dụng biến `editing`, là boolean. Khi nó là `true`, nó sẽ hiển thị trường `<input>` để chỉnh sửa tên việc cần làm, và các nút _Cancel_ và _Save_. Khi không ở chế độ chỉnh sửa, nó sẽ hiển thị hộp kiểm, tên việc cần làm và các nút để chỉnh sửa và xóa việc cần làm.

Để đạt được điều này, chúng ta sẽ sử dụng [khối `if`](https://svelte.dev/docs/logic-blocks#if). Khối `if` hiển thị có điều kiện một số đánh dấu. Hãy lưu ý rằng nó sẽ không chỉ hiển thị hoặc ẩn đánh dấu dựa trên điều kiện — nó sẽ thêm và xóa động các phần tử khỏi DOM, tùy thuộc vào điều kiện.

Khi `editing` là `true`, ví dụ, Svelte sẽ hiển thị form cập nhật; khi nó là `false`, nó sẽ xóa nó khỏi DOM và thêm vào hộp kiểm. Nhờ khả năng phản ứng của Svelte, việc gán giá trị của biến editing sẽ đủ để hiển thị các phần tử HTML đúng.

Cấu trúc khối `if` cơ bản trông như thế này:

```svelte
<div class="stack-small">
  {#if editing}
  <!-- markup for editing to-do: label, input text, Cancel and Save Button -->
  {:else}
  <!-- markup for displaying to-do: checkbox, label, Edit and Delete Button -->
  {/if}
</div>
```

Phần không chỉnh sửa — đó là phần `{:else}` (nửa dưới) của khối `if` — sẽ rất giống với phần chúng ta có trong thành phần `Todos`. Sự khác biệt duy nhất là chúng ta đang gọi `onToggle()`, `onEdit()` và `onRemove()`, tùy thuộc vào hành động người dùng.

```svelte
{:else}
  <div class="c-cb">
    <input type="checkbox" id="todo-{todo.id}"
      on:click={onToggle} checked={todo.completed}
    >
    <label for="todo-{todo.id}" class="todo-label">{todo.name}</label>
  </div>
  <div class="btn-group">
    <button type="button" class="btn" on:click={onEdit}>
      Edit<span class="visually-hidden"> {todo.name}</span>
    </button>
    <button type="button" class="btn btn__danger" on:click={onRemove}>
      Delete<span class="visually-hidden"> {todo.name}</span>
    </button>
  </div>
{/if}
</div>
```

Đáng chú ý là:

- Khi người dùng nhấn nút _Edit_, chúng ta thực thi `onEdit()`, chỉ đặt biến `editing` thành `true`.
- Khi người dùng nhấp vào hộp kiểm, chúng ta gọi hàm `onToggle()`, thực thi `update()`, truyền đối tượng với giá trị `completed` mới như tham số.
- Hàm `update()` phát sự kiện `update`, truyền như thông tin bổ sung một bản sao của việc cần làm gốc với các thay đổi được áp dụng.
- Cuối cùng, hàm `onRemove()` phát sự kiện `remove`, truyền `todo` cần xóa như dữ liệu bổ sung.

Giao diện người dùng chỉnh sửa (nửa trên) sẽ chứa trường `<input>` và hai nút để hủy hoặc lưu các thay đổi:

```svelte
<div class="stack-small">
{#if editing}
  <form on:submit|preventDefault={onSave} class="stack-small" on:keydown={(e) => e.key === 'Escape' && onCancel()}>
    <div class="form-group">
      <label for="todo-{todo.id}" class="todo-label">New name for '{todo.name}'</label>
      <input bind:value={name} type="text" id="todo-{todo.id}" autoComplete="off" class="todo-text" />
    </div>
    <div class="btn-group">
      <button class="btn todo-cancel" on:click={onCancel} type="button">
        Cancel<span class="visually-hidden">renaming {todo.name}</span>
        </button>
      <button class="btn btn__primary todo-edit" type="submit" disabled={!name}>
        Save<span class="visually-hidden">new name for {todo.name}</span>
      </button>
    </div>
  </form>
{:else}
[...]
```

Khi người dùng nhấn nút _Edit_, biến `editing` sẽ được đặt thành `true`, và Svelte sẽ xóa đánh dấu trong phần `{:else}` của DOM và thay thế nó bằng đánh dấu trong phần `{#if}`.

Thuộc tính `value` của `<input>` sẽ được ràng buộc với biến `name`, và các nút để hủy và lưu các thay đổi gọi `onCancel()` và `onSave()` tương ứng (chúng ta đã thêm các hàm đó trước đó):

- Khi `onCancel()` được gọi, `name` được khôi phục về giá trị ban đầu của nó (khi được truyền vào như prop) và chúng ta thoát chế độ chỉnh sửa (bằng cách đặt `editing` thành `false`).
- Khi `onSave()` được gọi, chúng ta chạy hàm `update()` — truyền cho nó `name` đã sửa đổi — và thoát chế độ chỉnh sửa.

Chúng ta cũng vô hiệu hóa nút _Save_ khi `<input>` trống, sử dụng thuộc tính `disabled={!name}`, và cho phép người dùng hủy chỉnh sửa bằng phím <kbd>Escape</kbd>, như thế này:

```plain
on:keydown={(e) => e.key === 'Escape' && onCancel()}
```

Chúng ta cũng sử dụng `todo.id` để tạo các id duy nhất cho các điều khiển và nhãn nhập mới.

1. Đánh dấu cập nhật hoàn chỉnh của thành phần `Todo` trông như thế này. Cập nhật của bạn ngay bây giờ:

   ```svelte
   <div class="stack-small">
   {#if editing}
     <!-- markup for editing todo: label, input text, Cancel and Save Button -->
     <form on:submit|preventDefault={onSave} class="stack-small" on:keydown={(e) => e.key === 'Escape' && onCancel()}>
       <div class="form-group">
         <label for="todo-{todo.id}" class="todo-label">New name for '{todo.name}'</label>
         <input bind:value={name} type="text" id="todo-{todo.id}" autoComplete="off" class="todo-text" />
       </div>
       <div class="btn-group">
         <button class="btn todo-cancel" on:click={onCancel} type="button">
           Cancel<span class="visually-hidden">renaming {todo.name}</span>
           </button>
         <button class="btn btn__primary todo-edit" type="submit" disabled={!name}>
           Save<span class="visually-hidden">new name for {todo.name}</span>
         </button>
       </div>
     </form>
   {:else}
     <!-- markup for displaying todo: checkbox, label, Edit and Delete Button -->
     <div class="c-cb">
       <input type="checkbox" id="todo-{todo.id}"
         on:click={onToggle} checked={todo.completed}
       >
       <label for="todo-{todo.id}" class="todo-label">{todo.name}</label>
     </div>
     <div class="btn-group">
       <button type="button" class="btn" on:click={onEdit}>
         Edit<span class="visually-hidden"> {todo.name}</span>
       </button>
       <button type="button" class="btn btn__danger" on:click={onRemove}>
         Delete<span class="visually-hidden"> {todo.name}</span>
       </button>
     </div>
   {/if}
   </div>
   ```

   > [!NOTE]
   > Chúng ta có thể chia nhỏ thêm thành hai thành phần khác nhau, một để chỉnh sửa việc cần làm và cái kia để hiển thị nó. Cuối cùng, điều đó phụ thuộc vào mức độ thoải mái của bạn khi xử lý mức độ phức tạp này trong một thành phần duy nhất. Bạn cũng nên xem xét liệu việc chia nhỏ hơn có cho phép tái sử dụng thành phần này trong bối cảnh khác hay không.

2. Để chức năng update hoạt động, chúng ta phải xử lý sự kiện `update` từ thành phần `Todos`. Trong phần `<script>` của nó, thêm trình xử lý này:

   ```js
   function updateTodo(todo) {
     const i = todos.findIndex((t) => t.id === todo.id);
     todos[i] = { ...todos[i], ...todo };
   }
   ```

   Chúng ta tìm `todo` bằng `id` trong mảng `todos`, và cập nhật nội dung của nó bằng cú pháp spread. Trong trường hợp này, chúng ta cũng có thể chỉ sử dụng `todos[i] = todo`, nhưng triển khai này có thể vững chắc hơn, cho phép thành phần `Todo` chỉ trả về các phần đã cập nhật của việc cần làm.

3. Tiếp theo, chúng ta phải lắng nghe sự kiện `update` trên lệnh gọi thành phần `<Todo>`, và chạy hàm `updateTodo()` khi điều này xảy ra để thay đổi `name` và trạng thái `completed`. Cập nhật lệnh gọi \<Todo> của bạn như thế này:

   ```svelte
   {#each filterTodos(filter, todos) as todo (todo.id)}
   <li class="todo">
     <Todo {todo} on:update={(e) => updateTodo(e.detail)} on:remove={(e) =>
     removeTodo(e.detail)} />
   </li>
   ```

4. Hãy thử ứng dụng của bạn một lần nữa, và bạn sẽ thấy rằng bạn có thể xóa, thêm, chỉnh sửa, hủy chỉnh sửa, và bật/tắt trạng thái hoàn thành của việc cần làm. Và tiêu đề trạng thái "x out of y items completed" của chúng ta giờ sẽ cập nhật phù hợp khi việc cần làm được hoàn thành.

Như bạn có thể thấy, dễ dàng triển khai mẫu "props-down, events-up" trong Svelte. Tuy nhiên, với các thành phần đơn giản, `bind` có thể là lựa chọn tốt; Svelte sẽ để bạn lựa chọn.

> [!NOTE]
> Svelte cung cấp các cơ chế nâng cao hơn để chia sẻ thông tin giữa các thành phần: [Context API](https://svelte.dev/docs/svelte#setcontext) và [Stores](https://svelte.dev/docs/svelte-store). Context API cung cấp cơ chế cho các thành phần và hậu duệ của chúng để "nói chuyện" với nhau mà không cần truyền dữ liệu và hàm như prop, hoặc phát nhiều sự kiện. Stores cho phép bạn chia sẻ dữ liệu có khả năng phản ứng giữa các thành phần không có quan hệ phân cấp. Chúng ta sẽ tìm hiểu về Stores sau trong loạt bài.

## Mã cho đến nay

### Git

Để xem trạng thái mã như nó phải là ở cuối bài viết này, hãy truy cập bản sao của repo của chúng ta như thế này:

```bash
cd mdn-svelte-tutorial/05-advanced-concepts
```

Hoặc tải xuống trực tiếp nội dung thư mục:

```bash
npx degit opensas/mdn-svelte-tutorial/05-advanced-concepts
```

Nhớ chạy `npm install && npm run dev` để khởi động ứng dụng ở chế độ phát triển.

### REPL

Để xem trạng thái hiện tại của mã trong REPL, hãy truy cập:

<https://svelte.dev/repl/76cc90c43a37452e8c7f70521f88b698?version=3.23.2>

## Tóm tắt

Bây giờ chúng ta đã có tất cả các chức năng cần thiết của ứng dụng. Chúng ta có thể hiển thị, thêm, chỉnh sửa và xóa việc cần làm, đánh dấu chúng là đã hoàn thành và lọc theo trạng thái.

Trong bài viết này, chúng ta đã đề cập đến các chủ đề sau:

- Trích xuất chức năng thành thành phần mới
- Truyền thông tin từ con đến cha bằng trình xử lý nhận được như prop
- Truyền thông tin từ con đến cha bằng chỉ thị `bind`
- Hiển thị có điều kiện các khối đánh dấu bằng khối `if`
- Triển khai mẫu giao tiếp "props-down, events-up"
- Tạo và lắng nghe các sự kiện tùy chỉnh

Trong bài viết tiếp theo, chúng ta sẽ tiếp tục chia nhỏ ứng dụng và tìm hiểu một số kỹ thuật nâng cao để làm việc với DOM.

{{PreviousMenuNext("Learn_web_development/Core/Frameworks_libraries/Svelte_variables_props","Learn_web_development/Core/Frameworks_libraries/Svelte_reactivity_lifecycle_accessibility", "Learn_web_development/Core/Frameworks_libraries")}}
