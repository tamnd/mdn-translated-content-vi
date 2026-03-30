---
title: "Hành vi động trong Svelte: làm việc với biến và prop"
slug: Learn_web_development/Core/Frameworks_libraries/Svelte_variables_props
page-type: learn-module-chapter
sidebar: learnsidebar
---

{{PreviousMenuNext("Learn_web_development/Core/Frameworks_libraries/Svelte_Todo_list_beginning","Learn_web_development/Core/Frameworks_libraries/Svelte_components", "Learn_web_development/Core/Frameworks_libraries")}}

Bây giờ khi chúng ta đã có đánh dấu và kiểu dáng sẵn sàng, chúng ta có thể bắt đầu phát triển các tính năng cần thiết cho ứng dụng danh sách việc cần làm Svelte. Trong bài viết này, chúng ta sẽ sử dụng biến và prop để làm cho ứng dụng của mình trở nên động, cho phép chúng ta thêm và xóa việc cần làm, đánh dấu chúng là đã hoàn thành và lọc chúng theo trạng thái.

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
        Tìm hiểu và thực hành một số khái niệm Svelte cơ bản, như tạo thành phần, truyền dữ liệu bằng prop, hiển thị các biểu thức JavaScript vào đánh dấu, sửa đổi trạng thái thành phần và lặp qua danh sách.
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
cd mdn-svelte-tutorial/03-adding-dynamic-behavior
```

Hoặc tải xuống trực tiếp nội dung thư mục:

```bash
npx degit opensas/mdn-svelte-tutorial/03-adding-dynamic-behavior
```

Nhớ chạy `npm install && npm run dev` để khởi động ứng dụng ở chế độ phát triển.

### REPL

Để lập trình cùng chúng tôi bằng REPL, bắt đầu tại

<https://svelte.dev/repl/c862d964d48d473ca63ab91709a0a5a0?version=3.23.2>

## Làm việc với việc cần làm

Thành phần `Todos.svelte` của chúng ta hiện chỉ hiển thị đánh dấu tĩnh; hãy bắt đầu làm cho nó trở nên động hơn một chút. Chúng ta sẽ lấy thông tin tác vụ từ đánh dấu và lưu trữ nó trong mảng `todos`. Chúng ta cũng sẽ tạo hai biến để theo dõi tổng số tác vụ và các tác vụ đã hoàn thành.

Trạng thái của thành phần của chúng ta sẽ được biểu diễn bởi ba biến cấp cao nhất này.

1. Tạo phần `<script>` ở đầu `src/components/Todos.svelte` và cung cấp cho nó một số nội dung, như sau:

   ```svelte
   <script>
     let todos = [
       { id: 1, name: "Create a Svelte starter app", completed: true },
       { id: 2, name: "Create your first component", completed: true },
       { id: 3, name: "Complete the rest of the tutorial", completed: false }
     ];
     let totalTodos = todos.length;
     let completedTodos = todos.filter((todo) => todo.completed).length;
   </script>
   ```

   Bây giờ hãy làm điều gì đó với thông tin đó.

2. Hãy bắt đầu bằng cách hiển thị thông báo trạng thái. Tìm tiêu đề `<h2>` với `id` là `list-heading` và thay thế số lượng tác vụ đang hoạt động và đã hoàn thành được mã hóa cứng bằng các biểu thức động:

   ```svelte
   <h2 id="list-heading">{completedTodos} out of {totalTodos} items completed</h2>
   ```

3. Vào ứng dụng, và bạn sẽ thấy thông báo "2 out of 3 items completed" như trước, nhưng lần này thông tin đến từ mảng `todos`.
4. Để chứng minh, hãy vào mảng đó và thử thay đổi một số giá trị thuộc tính completed của đối tượng to-do, thậm chí thêm một đối tượng to-do mới. Quan sát cách các con số trong thông báo được cập nhật phù hợp.

## Tạo các việc cần làm động từ dữ liệu

Hiện tại, các mục việc cần làm được hiển thị của chúng ta đều là tĩnh. Chúng ta muốn lặp qua mỗi mục trong mảng `todos` của mình và hiển thị đánh dấu cho mỗi tác vụ, vì vậy hãy thực hiện điều đó ngay bây giờ.

HTML không có cách để biểu đạt logic — như điều kiện và vòng lặp. Svelte thì có. Trong trường hợp này, chúng ta sử dụng chỉ thị [`{#each}`](https://svelte.dev/docs/logic-blocks#each) để lặp qua mảng `todos`. Tham số thứ hai, nếu được cung cấp, sẽ chứa chỉ số của mục hiện tại. Ngoài ra, một biểu thức khóa có thể được cung cấp, sẽ xác định duy nhất mỗi mục. Svelte sẽ sử dụng nó để phân biệt danh sách khi dữ liệu thay đổi, thay vì thêm hoặc xóa các mục ở cuối, và đây là thực hành tốt để luôn chỉ định một. Cuối cùng, một khối `:else` có thể được cung cấp, sẽ được hiển thị khi danh sách trống.

Hãy thử xem.

1. Thay thế phần tử `<ul>` hiện có bằng phiên bản đơn giản hóa sau để hiểu cách nó hoạt động:

   ```svelte
   <ul>
   {#each todos as todo, index (todo.id)}
     <li>
       <input type="checkbox" checked={todo.completed}/> {index}. {todo.name} (id: {todo.id})
     </li>
   {:else}
     Nothing to do here!
   {/each}
   </ul>
   ```

2. Quay lại ứng dụng; bạn sẽ thấy điều gì đó như thế này:

   ![đầu ra danh sách việc cần làm rất đơn giản được tạo bằng cách sử dụng khối each](01-each-block.png)

3. Bây giờ khi chúng ta đã thấy điều này đang hoạt động, hãy tạo một mục việc cần làm hoàn chỉnh với mỗi vòng lặp của chỉ thị `{#each}`, và bên trong nhúng thông tin từ mảng `todos`: `id`, `name` và `completed`. Thay thế khối `<ul>` hiện có của bạn bằng:

   ```svelte
   <!-- To-dos -->
   <ul role="list" class="todo-list stack-large" aria-labelledby="list-heading">
     {#each todos as todo (todo.id)}
     <li class="todo">
       <div class="stack-small">
         <div class="c-cb">
           <input
             type="checkbox"
             id="todo-{todo.id}"
             checked={todo.completed} />
           <label for="todo-{todo.id}" class="todo-label"> {todo.name} </label>
         </div>
         <div class="btn-group">
           <button type="button" class="btn">
             Edit <span class="visually-hidden">{todo.name}</span>
           </button>
           <button type="button" class="btn btn__danger">
             Delete <span class="visually-hidden">{todo.name}</span>
           </button>
         </div>
       </div>
     </li>
     {:else}
     <li>Nothing to do here!</li>
     {/each}
   </ul>
   ```

   Chú ý cách chúng ta sử dụng dấu ngoặc nhọn để nhúng các biểu thức JavaScript vào các thuộc tính HTML, giống như chúng ta đã làm với các thuộc tính `checked` và `id` của hộp kiểm.

Chúng ta đã chuyển đánh dấu tĩnh của mình thành một mẫu động sẵn sàng hiển thị các tác vụ từ trạng thái của thành phần. Tuyệt vời! Chúng ta đang đến nơi.

## Làm việc với prop

Với danh sách việc cần làm được mã hóa cứng, thành phần `Todos` của chúng ta không hữu ích lắm. Để biến thành phần của chúng ta thành một trình chỉnh sửa to-do đa năng, chúng ta nên cho phép cha của thành phần này truyền vào danh sách việc cần làm để chỉnh sửa. Điều này sẽ cho phép chúng ta lưu chúng vào dịch vụ web hoặc bộ nhớ cục bộ và sau đó lấy chúng để cập nhật. Vì vậy, hãy biến mảng thành một prop.

1. Trong `Todos.svelte`, thay thế khối `let todos = …` hiện có bằng `export let todos = []`.

   ```js
   export let todos = [];
   ```

   Điều này có thể cảm thấy hơi kỳ lạ lúc đầu. Đó không phải là cách `export` thường hoạt động trong các mô-đun JavaScript! Đây là cách Svelte 'mở rộng' JavaScript bằng cách lấy cú pháp hợp lệ và đưa cho nó một mục đích mới. Trong trường hợp này, Svelte đang sử dụng từ khóa `export` để đánh dấu khai báo biến như một thuộc tính hoặc prop, có nghĩa là nó trở nên có thể truy cập đối với người tiêu dùng của thành phần.

   Bạn cũng có thể chỉ định giá trị ban đầu mặc định cho một prop. Điều này sẽ được sử dụng nếu người tiêu dùng thành phần không chỉ định prop trên thành phần — hoặc nếu giá trị ban đầu của nó là undefined — khi khởi tạo thành phần.

   Vì vậy với `export let todos = []`, chúng ta đang cho Svelte biết rằng thành phần `Todos.svelte` của chúng ta sẽ chấp nhận thuộc tính `todos`, khi bỏ qua sẽ được khởi tạo thành mảng trống.

2. Xem ứng dụng và bạn sẽ thấy thông báo "Nothing to do here!". Điều này là vì chúng ta hiện không truyền bất kỳ giá trị nào vào nó từ `App.svelte`, vì vậy nó đang sử dụng giá trị mặc định.
3. Bây giờ hãy di chuyển việc cần làm của chúng ta đến `App.svelte` và truyền chúng đến thành phần `Todos.svelte` dưới dạng prop. Cập nhật `src/App.svelte` như sau:

   ```svelte
   <script>
     import Todos from "./components/Todos.svelte";

     let todos = [
       { id: 1, name: "Create a Svelte starter app", completed: true },
       { id: 2, name: "Create your first component", completed: true },
       { id: 3, name: "Complete the rest of the tutorial", completed: false }
     ];
   </script>

   <Todos todos={todos} />
   ```

4. Khi thuộc tính và biến có cùng tên, Svelte cho phép bạn chỉ cần chỉ định biến như một lối tắt tiện lợi, vì vậy chúng ta có thể viết lại dòng cuối của mình như thế này. Hãy thử điều này ngay bây giờ.

   ```svelte
   <Todos {todos} />
   ```

Tại thời điểm này, việc cần làm của bạn sẽ hiển thị giống như trước đây, ngoại trừ bây giờ chúng ta đang truyền chúng từ thành phần `App.svelte`.

## Bật/tắt và xóa việc cần làm

Hãy thêm một số chức năng để bật/tắt trạng thái tác vụ. Svelte có chỉ thị `on:eventname` để lắng nghe các sự kiện DOM. Hãy thêm trình xử lý vào sự kiện `on:click` của ô nhập hộp kiểm để bật/tắt giá trị completed.

1. Cập nhật phần tử `<input type="checkbox">` bên trong `src/components/Todos.svelte` như sau:

   ```svelte
   <input type="checkbox" id="todo-{todo.id}"
     on:click={() => todo.completed = !todo.completed}
     checked={todo.completed}
   />
   ```

2. Tiếp theo, chúng ta sẽ thêm hàm để xóa một việc cần làm khỏi mảng `todos`. Ở phần cuối của phần `<script>` của `Todos.svelte`, thêm hàm `removeTodo()` như thế này:

   ```js
   function removeTodo(todo) {
     todos = todos.filter((t) => t.id !== todo.id);
   }
   ```

3. Chúng ta sẽ gọi nó qua nút _Delete_. Cập nhật nó với sự kiện `click`, như thế này:

   ```svelte
   <button type="button" class="btn btn__danger"
     on:click={() => removeTodo(todo)}
   >
     Delete <span class="visually-hidden">{todo.name}</span>
   </button>
   ```

   Một lỗi rất phổ biến với các trình xử lý trong Svelte là truyền kết quả thực thi một hàm như trình xử lý, thay vì truyền hàm. Ví dụ, nếu bạn chỉ định `on:click={removeTodo(todo)}`, nó sẽ thực thi `removeTodo(todo)` và kết quả sẽ được truyền như trình xử lý, đây không phải là những gì chúng ta có trong đầu.

   Trong trường hợp này, bạn phải chỉ định `on:click={() => removeTodo(todo)}` như trình xử lý. Nếu `removeTodo()` không nhận tham số, bạn có thể sử dụng `on:event={removeTodo}`, nhưng không phải `on:event={removeTodo()}`. Đây không phải là cú pháp Svelte đặc biệt — ở đây chúng ta chỉ đang sử dụng [arrow function](/vi/docs/Web/JavaScript/Reference/Functions/Arrow_functions) JavaScript thông thường.

Một lần nữa, đây là tiến bộ tốt — tại thời điểm này, chúng ta giờ có thể xóa các tác vụ. Khi nút _Delete_ của mục việc cần làm được nhấn, việc cần làm liên quan bị xóa khỏi mảng `todos`, và giao diện người dùng cập nhật để không còn hiển thị nó. Ngoài ra, bây giờ chúng ta có thể kiểm tra các hộp kiểm và trạng thái hoàn thành của các việc cần làm liên quan sẽ cập nhật trong mảng `todos`.

Tuy nhiên, tiêu đề "x out of y items completed" không được cập nhật. Hãy đọc tiếp để tìm hiểu lý do tại sao điều này xảy ra và cách chúng ta có thể giải quyết nó.

## Việc cần làm có khả năng phản ứng

Như chúng ta đã thấy, mỗi khi giá trị của một biến cấp cao nhất của thành phần được sửa đổi, Svelte biết cách cập nhật giao diện người dùng. Trong ứng dụng của chúng ta, giá trị mảng `todos` được cập nhật trực tiếp mỗi khi một việc cần làm được bật/tắt hoặc xóa, vì vậy Svelte sẽ tự động cập nhật DOM.

Điều tương tự không đúng với `totalTodos` và `completedTodos`, tuy nhiên. Trong đoạn mã sau, chúng được gán một giá trị khi thành phần được khởi tạo và script được thực thi, nhưng sau đó, các giá trị của chúng không được sửa đổi:

```js
let totalTodos = todos.length;
let completedTodos = todos.filter((todo) => todo.completed).length;
```

Chúng ta có thể tính lại chúng sau khi bật/tắt và xóa việc cần làm, nhưng có một cách dễ hơn để thực hiện.

Chúng ta có thể nói với Svelte rằng chúng ta muốn các biến `totalTodos` và `completedTodos` có khả năng phản ứng bằng cách thêm tiền tố `$:` cho chúng. Svelte sẽ tạo ra mã để tự động cập nhật chúng bất cứ khi nào dữ liệu mà chúng phụ thuộc vào bị thay đổi.

> [!NOTE]
> Svelte sử dụng cú pháp [câu lệnh nhãn JavaScript](/vi/docs/Web/JavaScript/Reference/Statements/label) `$:` để đánh dấu các câu lệnh có khả năng phản ứng. Giống như từ khóa `export` được sử dụng để khai báo prop, điều này có thể trông hơi xa lạ. Đây là một ví dụ khác trong đó Svelte tận dụng cú pháp JavaScript hợp lệ và đưa cho nó một mục đích mới — trong trường hợp này là có nghĩa "chạy lại mã này bất cứ khi nào bất kỳ giá trị tham chiếu nào thay đổi". Khi bạn quen với nó, không có đường quay trở lại.

Cập nhật định nghĩa biến `totalTodos` và `completedTodos` của bạn bên trong `src/components/Todos.svelte` để trông như thế này:

```js
$: totalTodos = todos.length;
$: completedTodos = todos.filter((todo) => todo.completed).length;
```

Nếu bạn kiểm tra ứng dụng ngay bây giờ, bạn sẽ thấy rằng các con số của tiêu đề được cập nhật khi việc cần làm được hoàn thành hoặc xóa.

Đằng sau hậu trường, trình biên dịch Svelte sẽ phân tích và phân tích mã của chúng ta để tạo cây phụ thuộc, và sau đó nó sẽ tạo ra mã JavaScript để đánh giá lại từng câu lệnh có khả năng phản ứng bất cứ khi nào một trong những phụ thuộc của chúng được cập nhật. Khả năng phản ứng trong Svelte được triển khai theo cách rất nhẹ nhàng và hiệu quả, không sử dụng trình lắng nghe, setters, getters, hoặc bất kỳ cơ chế phức tạp nào khác.

## Thêm việc cần làm mới

Bây giờ chuyển đến tác vụ chính tiếp theo cho bài viết này — hãy thêm một số chức năng để thêm việc cần làm mới.

1. Đầu tiên chúng ta sẽ tạo một biến để giữ văn bản của việc cần làm mới. Thêm khai báo này vào phần `<script>` của tệp `Todos.svelte`:

   ```js
   let newTodoName = "";
   ```

2. Bây giờ chúng ta sẽ sử dụng giá trị này trong `<input>` để thêm tác vụ mới. Để làm điều đó, chúng ta cần ràng buộc biến `newTodoName` của mình với ô nhập `todo-0`, để giá trị của biến `newTodoName` luôn đồng bộ với thuộc tính `value` của ô nhập. Chúng ta có thể làm điều gì đó như thế này:

   ```svelte
   <input value={newTodoName} on:keydown={(e) => newTodoName = e.target.value} />
   ```

   Bất cứ khi nào giá trị của biến `newTodoName` thay đổi, nó sẽ được phản ánh trong thuộc tính `value` của ô nhập, và bất cứ khi nào một phím được nhấn trong ô nhập, chúng ta sẽ cập nhật nội dung của biến `newTodoName`.

   Đây là một triển khai thủ công của ràng buộc dữ liệu hai chiều cho hộp nhập. Nhưng chúng ta không cần phải làm điều này — Svelte cung cấp một cách dễ hơn để ràng buộc bất kỳ thuộc tính nào với một biến, sử dụng chỉ thị [`bind:property`](https://svelte.dev/docs/element-directives#bind-property):

   ```svelte
   <input bind:value={newTodoName} />
   ```

   Vì vậy, hãy triển khai điều này. Cập nhật ô nhập `todo-0` như thế này:

   ```svelte
   <input
     bind:value={newTodoName}
     type="text"
     id="todo-0"
     autocomplete="off"
     class="input input__lg" />
   ```

3. Một cách dễ dàng để kiểm tra xem điều này hoạt động là thêm câu lệnh có khả năng phản ứng để ghi nhật ký nội dung của `newTodoName`. Thêm đoạn mã này ở cuối phần `<script>`:

   ```js
   $: console.log("newTodoName: ", newTodoName);
   ```

   > [!NOTE]
   > Như bạn có thể nhận thấy, các câu lệnh có khả năng phản ứng không giới hạn ở khai báo biến. Bạn có thể đặt _bất kỳ_ câu lệnh JavaScript nào sau dấu `$:`.

4. Bây giờ hãy quay lại `localhost:5042`, nhấn <kbd>Ctrl</kbd> + <kbd>Shift</kbd> + <kbd>K</kbd> để mở bảng điều khiển trình duyệt và gõ gì đó vào trường nhập. Bạn sẽ thấy các mục nhập của bạn được ghi nhật ký. Tại thời điểm này, bạn có thể xóa `console.log()` có khả năng phản ứng nếu muốn.
5. Tiếp theo, chúng ta sẽ tạo hàm để thêm việc cần làm mới — `addTodo()` — sẽ đẩy một đối tượng `todo` mới vào mảng `todos`. Thêm điều này vào cuối khối `<script>` bên trong `src/components/Todos.svelte`:

   ```js
   function addTodo() {
     todos.push({ id: 999, name: newTodoName, completed: false });
     newTodoName = "";
   }
   ```

   > [!NOTE]
   > Hiện tại, chúng ta chỉ gán cùng một `id` cho mọi việc cần làm, nhưng đừng lo lắng, chúng ta sẽ sửa điều đó sớm thôi.

6. Bây giờ chúng ta muốn cập nhật HTML để gọi `addTodo()` bất cứ khi nào form được gửi. Cập nhật thẻ mở của form NewTodo như thế này:

   ```svelte
   <form on:submit|preventDefault={addTodo}>
   ```

   Chỉ thị [`on:eventname`](https://svelte.dev/docs/element-directives#on-eventname) hỗ trợ thêm các bộ sửa đổi vào sự kiện DOM bằng ký tự `|`. Trong trường hợp này, bộ sửa đổi `preventDefault` cho Svelte biết để tạo mã gọi `event.preventDefault()` trước khi chạy trình xử lý. Khám phá liên kết trước để xem các bộ sửa đổi khác có sẵn là gì.

7. Nếu bạn thử thêm việc cần làm mới tại thời điểm này, việc cần làm mới được thêm vào mảng todos, nhưng giao diện người dùng của chúng ta không được cập nhật. Hãy nhớ rằng trong Svelte [khả năng phản ứng được kích hoạt với các phép gán](https://svelte.dev/docs/svelte-components#script-2-assignments-are-reactive). Điều đó có nghĩa là hàm `addTodo()` được thực thi, phần tử được thêm vào mảng `todos`, nhưng Svelte sẽ không phát hiện rằng phương thức push đã sửa đổi mảng, vì vậy nó sẽ không làm mới `<ul>` tác vụ.

   Chỉ cần thêm `todos = todos` vào cuối hàm `addTodo()` sẽ giải quyết vấn đề, nhưng có vẻ lạ khi phải bao gồm điều đó ở cuối hàm. Thay vào đó, chúng ta sẽ bỏ phương thức `push()` và sử dụng [cú pháp spread](/vi/docs/Web/JavaScript/Reference/Operators/Spread_syntax) để đạt được kết quả tương tự: chúng ta sẽ gán một giá trị cho mảng `todos` bằng mảng `todos` cộng thêm đối tượng mới.

   > [!NOTE]
   > `Array` có một số thao tác có thể thay đổi: [`push()`](/vi/docs/Web/JavaScript/Reference/Global_Objects/Array/push), [`pop()`](/vi/docs/Web/JavaScript/Reference/Global_Objects/Array/pop), [`splice()`](/vi/docs/Web/JavaScript/Reference/Global_Objects/Array/splice), [`shift()`](/vi/docs/Web/JavaScript/Reference/Global_Objects/Array/shift), [`unshift()`](/vi/docs/Web/JavaScript/Reference/Global_Objects/Array/unshift), [`reverse()`](/vi/docs/Web/JavaScript/Reference/Global_Objects/Array/reverse) và [`sort()`](/vi/docs/Web/JavaScript/Reference/Global_Objects/Array/sort). Sử dụng chúng thường gây ra tác dụng phụ và lỗi khó theo dõi. Bằng cách sử dụng cú pháp spread thay vì `push()`, chúng ta tránh làm thay đổi mảng, điều này được coi là thực hành tốt.

   Cập nhật hàm `addTodo()` của bạn như thế này:

   ```js
   function addTodo() {
     todos = [...todos, { id: 999, name: newTodoName, completed: false }];
     newTodoName = "";
   }
   ```

## Cung cấp cho mỗi việc cần làm một ID duy nhất

Nếu bạn thử thêm việc cần làm mới trong ứng dụng ngay bây giờ, bạn sẽ có thể thêm một việc cần làm mới và hiển thị nó trong giao diện người dùng — một lần. Nếu bạn thử lần thứ hai, nó sẽ không hoạt động và bạn sẽ nhận được thông báo bảng điều khiển nói "Error: Cannot have duplicate keys in a keyed each". Chúng ta cần ID duy nhất cho việc cần làm của mình.

1. Hãy khai báo biến `newTodoId` được tính từ số lượng việc cần làm cộng 1, và làm cho nó có khả năng phản ứng. Thêm đoạn mã sau vào phần `<script>`:

   ```js
   let newTodoId;
   $: {
     if (totalTodos === 0) {
       newTodoId = 1;
     } else {
       newTodoId = Math.max(...todos.map((t) => t.id)) + 1;
     }
   }
   ```

   > [!NOTE]
   > Như bạn có thể thấy, các câu lệnh có khả năng phản ứng không giới hạn ở một dòng. Cách sau cũng hoạt động, nhưng ít dễ đọc hơn: `$: newTodoId = totalTodos ? Math.max(...todos.map((t) => t.id)) + 1 : 1`

2. Svelte đạt được điều này như thế nào? Trình biên dịch phân tích toàn bộ câu lệnh có khả năng phản ứng và phát hiện ra rằng nó phụ thuộc vào biến `totalTodos` và mảng `todos`. Vì vậy, bất cứ khi nào một trong hai được sửa đổi, mã này được đánh giá lại, cập nhật `newTodoId` cho phù hợp.

   Hãy sử dụng điều này trong hàm `addTodo()` của chúng ta. Cập nhật nó như thế này:

   ```js
   function addTodo() {
     todos = [...todos, { id: newTodoId, name: newTodoName, completed: false }];
     newTodoName = "";
   }
   ```

## Lọc việc cần làm theo trạng thái

Cuối cùng cho bài viết này, hãy triển khai khả năng lọc việc cần làm của chúng ta theo trạng thái. Chúng ta sẽ tạo một biến để giữ bộ lọc hiện tại và một hàm trợ giúp sẽ trả về các việc cần làm đã được lọc.

1. Ở cuối phần `<script>` của chúng ta, thêm những điều sau:

   ```js
   let filter = "all";
   const filterTodos = (filter, todos) =>
     filter === "active"
       ? todos.filter((t) => !t.completed)
       : filter === "completed"
         ? todos.filter((t) => t.completed)
         : todos;
   ```

   Chúng ta sử dụng biến `filter` để kiểm soát bộ lọc đang hoạt động: _all_, _active_ hoặc _completed_. Chỉ cần gán một trong các giá trị này cho biến filter sẽ kích hoạt bộ lọc và cập nhật danh sách việc cần làm. Hãy xem cách đạt được điều này.

   Hàm `filterTodos()` sẽ nhận bộ lọc hiện tại và danh sách việc cần làm, và trả về một mảng việc cần làm mới được lọc theo đó.

2. Hãy cập nhật đánh dấu nút lọc để làm cho nó động và cập nhật bộ lọc hiện tại khi người dùng nhấn một trong các nút lọc. Cập nhật nó như thế này:

   ```svelte
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

   Có một vài điều đang diễn ra trong đánh dấu này.

   Chúng ta sẽ hiển thị bộ lọc hiện tại bằng cách áp dụng lớp `btn__primary` cho nút bộ lọc đang hoạt động. Để có điều kiện áp dụng các lớp kiểu dáng cho một phần tử, chúng ta sử dụng chỉ thị `class:name={value}`. Nếu biểu thức giá trị đánh giá là true, tên lớp sẽ được áp dụng. Bạn có thể thêm nhiều chỉ thị này, với các điều kiện khác nhau, vào cùng một phần tử. Vì vậy khi chúng ta đưa ra `class:btn__primary={filter === 'all'}`, Svelte sẽ áp dụng lớp `btn__primary` nếu filter bằng all.

   > [!NOTE]
   > Svelte cung cấp một lối tắt cho phép chúng ta rút ngắn `<div class:active={active}>` thành `<div class:active>` khi lớp khớp với tên biến.

   Điều tương tự xảy ra với `aria-pressed={filter === 'all'}`: khi biểu thức JavaScript được truyền giữa dấu ngoặc nhọn đánh giá là true, thuộc tính `aria-pressed` sẽ được thêm vào nút.

   Bất cứ khi nào chúng ta nhấp vào một nút, chúng ta cập nhật biến filter bằng cách đưa ra `on:click={() => filter = 'all'}`. Hãy đọc tiếp để tìm hiểu cách khả năng phản ứng của Svelte sẽ xử lý phần còn lại.

3. Bây giờ chúng ta chỉ cần sử dụng hàm trợ giúp trong vòng lặp `{#each}`; cập nhật nó như thế này:

   ```svelte
   …
     <ul role="list" class="todo-list stack-large" aria-labelledby="list-heading">
     {#each filterTodos(filter, todos) as todo (todo.id)}
   …
   ```

   Sau khi phân tích mã của chúng ta, Svelte phát hiện rằng hàm `filterTodos()` phụ thuộc vào các biến `filter` và `todos`. Và, giống như với bất kỳ biểu thức động nào khác được nhúng trong đánh dấu, bất cứ khi nào bất kỳ phụ thuộc nào trong số này thay đổi, DOM sẽ được cập nhật cho phù hợp. Vì vậy, bất cứ khi nào `filter` hoặc `todos` thay đổi, hàm `filterTodos()` sẽ được đánh giá lại và các mục bên trong vòng lặp sẽ được cập nhật.

> [!NOTE]
> Khả năng phản ứng đôi khi có thể phức tạp. Svelte nhận ra `filter` như một phụ thuộc vì chúng ta đang tham chiếu nó trong biểu thức `filterTodos(filter, todo)`. `filter` là một biến cấp cao nhất, vì vậy chúng ta có thể bị cám dỗ xóa nó khỏi các tham số hàm trợ giúp và chỉ gọi nó như thế này: `filterTodos(todo)`. Điều này sẽ hoạt động, nhưng bây giờ Svelte không có cách nào để tìm ra rằng `{#each filterTodos(todos) }` phụ thuộc vào `filter`, và danh sách việc cần làm đã được lọc sẽ không được cập nhật khi bộ lọc thay đổi. Hãy luôn nhớ rằng Svelte phân tích mã của chúng ta để tìm ra các phụ thuộc, vì vậy tốt hơn là nên rõ ràng về nó và không dựa vào khả năng hiển thị của các biến cấp cao nhất. Ngoài ra, đây là thực hành tốt để làm cho mã của chúng ta rõ ràng và rõ ràng về thông tin nó đang sử dụng.

## Mã cho đến nay

### Git

Để xem trạng thái mã như nó phải là ở cuối bài viết này, hãy truy cập bản sao của repo của chúng ta như thế này:

```bash
cd mdn-svelte-tutorial/04-componentizing-our-app
```

Hoặc tải xuống trực tiếp nội dung thư mục:

```bash
npx degit opensas/mdn-svelte-tutorial/04-componentizing-our-app
```

Nhớ chạy `npm install && npm run dev` để khởi động ứng dụng ở chế độ phát triển.

### REPL

Để xem trạng thái hiện tại của mã trong REPL, hãy truy cập:

<https://svelte.dev/repl/99b9eb228b404a2f8c8959b22c0a40d3?version=3.23.2>

## Tóm tắt

Vậy là tạm đủ cho bây giờ! Trong bài viết này, chúng ta đã triển khai hầu hết các chức năng mong muốn. Ứng dụng của chúng ta có thể hiển thị, thêm và xóa việc cần làm, bật/tắt trạng thái hoàn thành của chúng, hiển thị số lượng đã hoàn thành và áp dụng bộ lọc.

Tóm lại, chúng ta đã đề cập đến các chủ đề sau:

- Tạo và sử dụng thành phần
- Chuyển đánh dấu tĩnh thành mẫu trực tiếp
- Nhúng các biểu thức JavaScript vào đánh dấu
- Lặp qua danh sách bằng chỉ thị `{#each}`
- Truyền thông tin giữa các thành phần bằng prop
- Lắng nghe sự kiện DOM
- Khai báo câu lệnh có khả năng phản ứng
- Gỡ lỗi cơ bản với `console.log()` và câu lệnh có khả năng phản ứng
- Ràng buộc các thuộc tính HTML với chỉ thị `bind:property`
- Kích hoạt khả năng phản ứng với các phép gán
- Sử dụng biểu thức có khả năng phản ứng để lọc dữ liệu
- Xác định rõ ràng các phụ thuộc có khả năng phản ứng của chúng ta

Trong bài viết tiếp theo, chúng ta sẽ thêm nhiều chức năng hơn, cho phép người dùng chỉnh sửa việc cần làm.

{{PreviousMenuNext("Learn_web_development/Core/Frameworks_libraries/Svelte_Todo_list_beginning","Learn_web_development/Core/Frameworks_libraries/Svelte_components", "Learn_web_development/Core/Frameworks_libraries")}}
