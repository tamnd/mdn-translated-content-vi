---
title: "Svelte nâng cao: Khả năng phản ứng, vòng đời, khả năng tiếp cận"
slug: Learn_web_development/Core/Frameworks_libraries/Svelte_reactivity_lifecycle_accessibility
page-type: learn-module-chapter
sidebar: learnsidebar
---

{{PreviousMenuNext("Learn_web_development/Core/Frameworks_libraries/Svelte_components","Learn_web_development/Core/Frameworks_libraries/Svelte_stores", "Learn_web_development/Core/Frameworks_libraries")}}

Trong bài viết trước, chúng ta đã thêm nhiều tính năng hơn vào danh sách việc cần làm và bắt đầu tổ chức ứng dụng vào các thành phần. Trong bài viết này, chúng ta sẽ thêm các tính năng cuối cùng của ứng dụng và tiếp tục chia nhỏ ứng dụng vào các thành phần. Chúng ta sẽ học cách xử lý các vấn đề khả năng phản ứng liên quan đến cập nhật đối tượng và mảng. Để tránh các bẫy phổ biến, chúng ta sẽ phải đào sâu hơn một chút vào hệ thống khả năng phản ứng của Svelte. Chúng ta cũng sẽ xem xét giải quyết một số vấn đề tiêu điểm khả năng tiếp cận và nhiều hơn nữa.

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
        Tìm hiểu một số kỹ thuật Svelte nâng cao liên quan đến giải quyết các vấn đề khả năng phản ứng, các vấn đề khả năng tiếp cận bàn phím liên quan đến vòng đời thành phần, và nhiều hơn nữa.
      </td>
    </tr>
  </tbody>
</table>

Chúng ta sẽ tập trung vào một số vấn đề khả năng tiếp cận liên quan đến quản lý tiêu điểm. Để làm vậy, chúng ta sẽ sử dụng một số kỹ thuật để truy cập các nút DOM và thực thi các phương thức như [`focus()`](/vi/docs/Web/API/HTMLElement/focus) và [`select()`](/vi/docs/Web/API/HTMLInputElement/select). Chúng ta cũng sẽ thấy cách khai báo và dọn dẹp trình lắng nghe sự kiện trên các phần tử DOM.

Chúng ta cũng cần tìm hiểu một chút về vòng đời thành phần để hiểu khi nào các nút DOM này được gắn và ngắt gắn khỏi DOM và cách chúng ta có thể truy cập chúng. Chúng ta cũng sẽ tìm hiểu về chỉ thị `action`, sẽ cho phép chúng ta mở rộng chức năng của các phần tử HTML theo cách có thể tái sử dụng và khai báo.

Cuối cùng, chúng ta sẽ tìm hiểu thêm một chút về các thành phần. Cho đến nay, chúng ta đã thấy cách các thành phần có thể chia sẻ dữ liệu bằng prop, và giao tiếp với cha của chúng bằng sự kiện và ràng buộc dữ liệu hai chiều. Bây giờ chúng ta sẽ thấy cách các thành phần cũng có thể công khai các phương thức và biến.

Các thành phần mới sau sẽ được phát triển trong suốt bài viết này:

- `MoreActions`: Hiển thị các nút _Check All_ và _Remove Completed_, và phát các sự kiện tương ứng cần thiết để xử lý chức năng của chúng.
- `NewTodo`: Hiển thị trường `<input>` và nút _Add_ để thêm việc cần làm mới.
- `TodosStatus`: Hiển thị tiêu đề trạng thái "x out of y items completed".

## Lập trình cùng chúng tôi

### Git

Sao chép kho lưu trữ GitHub (nếu bạn chưa làm điều đó) với:

```bash
git clone https://github.com/opensas/mdn-svelte-tutorial.git
```

Sau đó để đến trạng thái ứng dụng hiện tại, chạy

```bash
cd mdn-svelte-tutorial/05-advanced-concepts
```

Hoặc tải xuống trực tiếp nội dung thư mục:

```bash
npx degit opensas/mdn-svelte-tutorial/05-advanced-concepts
```

Nhớ chạy `npm install && npm run dev` để khởi động ứng dụng ở chế độ phát triển.

### REPL

Để lập trình cùng chúng tôi bằng REPL, bắt đầu tại

<https://svelte.dev/repl/76cc90c43a37452e8c7f70521f88b698?version=3.23.2>

## Làm việc với thành phần MoreActions

Bây giờ chúng ta sẽ xử lý các nút _Check All_ và _Remove Completed_. Hãy tạo thành phần sẽ chịu trách nhiệm hiển thị các nút và phát các sự kiện tương ứng.

1. Tạo tệp mới, `components/MoreActions.svelte`.
2. Khi nút đầu tiên được nhấp, chúng ta sẽ phát sự kiện `checkAll` để báo hiệu rằng tất cả việc cần làm nên được kiểm tra/bỏ kiểm tra. Khi nút thứ hai được nhấp, chúng ta sẽ phát sự kiện `removeCompleted` để báo hiệu rằng tất cả việc cần làm đã hoàn thành nên bị xóa. Đặt nội dung sau vào tệp `MoreActions.svelte` của bạn:

   ```svelte
   <script>
     import { createEventDispatcher } from "svelte";

     const dispatch = createEventDispatcher();

     let completed = true;

     const checkAll = () => {
       dispatch("checkAll", completed);
       completed = !completed;
     };

     const removeCompleted = () => dispatch("removeCompleted");
   </script>

   <div class="btn-group">
     <button type="button" class="btn btn__primary" on:click={checkAll}>{completed ? 'Check' : 'Uncheck'} all</button>
     <button type="button" class="btn btn__primary" on:click={removeCompleted}>Remove completed</button>
   </div>
   ```

   Chúng ta cũng đã bao gồm biến `completed` để bật/tắt giữa kiểm tra và bỏ kiểm tra tất cả tác vụ.

3. Quay lại `Todos.svelte`, chúng ta sẽ nhập thành phần `MoreActions` và tạo hai hàm để xử lý các sự kiện được phát ra bởi thành phần `MoreActions`.

   Thêm câu lệnh import sau bên dưới các câu lệnh hiện có:

   ```js
   import MoreActions from "./MoreActions.svelte";
   ```

4. Sau đó thêm các hàm được mô tả ở cuối phần `<script>`:

   ```js
   const checkAllTodos = (completed) =>
     todos.forEach((t) => (t.completed = completed));

   const removeCompletedTodos = () =>
     (todos = todos.filter((t) => !t.completed));
   ```

5. Bây giờ vào phần đánh dấu dưới cùng của `Todos.svelte` và thay thế phần tử `<div class="btn-group">` mà chúng ta đã sao chép vào `MoreActions.svelte` bằng lệnh gọi đến thành phần `MoreActions`, như thế này:

   ```svelte
   <!-- MoreActions -->
   <MoreActions
     on:checkAll={(e) => checkAllTodos(e.detail)}
     on:removeCompleted={removeCompletedTodos}
   />
   ```

6. OK, hãy quay lại ứng dụng và thử. Bạn sẽ thấy nút _Remove Completed_ hoạt động tốt, nhưng nút _Check All_/_Uncheck All_ chỉ im lặng thất bại.

Để tìm hiểu điều gì đang xảy ra, chúng ta sẽ phải đào sâu hơn một chút vào khả năng phản ứng của Svelte.

## Những bẫy về khả năng phản ứng: cập nhật đối tượng và mảng

Để xem điều gì đang xảy ra, chúng ta có thể ghi nhật ký mảng `todos` từ hàm `checkAllTodos()` vào bảng điều khiển.

1. Cập nhật hàm `checkAllTodos()` hiện có của bạn như sau:

   ```js
   const checkAllTodos = (completed) => {
     todos.forEach((t) => (t.completed = completed));
     console.log("todos", todos);
   };
   ```

2. Quay lại trình duyệt, mở bảng điều khiển DevTools và nhấp _Check All_/_Uncheck All_ vài lần.

Bạn sẽ nhận thấy rằng mảng được cập nhật thành công mỗi khi bạn nhấn nút (các thuộc tính `completed` của đối tượng `todo` bật/tắt giữa `true` và `false`), nhưng Svelte không biết điều đó. Điều này cũng có nghĩa là trong trường hợp này, câu lệnh có khả năng phản ứng như `$: console.log('todos', todos)` sẽ không hữu ích lắm.

Để tìm hiểu lý do tại sao điều này xảy ra, chúng ta cần hiểu cách khả năng phản ứng hoạt động trong Svelte khi cập nhật mảng và đối tượng.

Nhiều framework web sử dụng kỹ thuật DOM ảo để cập nhật trang. Về cơ bản, DOM ảo là bản sao trong bộ nhớ của nội dung trang web. Framework cập nhật biểu diễn ảo này, sau đó được đồng bộ với DOM "thực". Điều này nhanh hơn nhiều so với cập nhật DOM trực tiếp và cho phép framework áp dụng nhiều kỹ thuật tối ưu hóa khác nhau.

Các framework này, theo mặc định, về cơ bản chạy lại tất cả JavaScript của chúng ta trên mỗi thay đổi đối với DOM ảo này và áp dụng các phương pháp khác nhau để lưu vào bộ nhớ đệm các tính toán tốn kém và tối ưu hóa thực thi. Chúng hầu như không cố gắng hiểu mã JavaScript của chúng ta đang làm gì.

Svelte không sử dụng biểu diễn DOM ảo. Thay vào đó, nó phân tích và phân tích mã của chúng ta, tạo cây phụ thuộc, và sau đó tạo ra JavaScript cần thiết để chỉ cập nhật những phần của DOM cần cập nhật. Cách tiếp cận này thường tạo ra mã JavaScript tối ưu với chi phí tối thiểu, nhưng nó cũng có giới hạn của nó.

Đôi khi Svelte không thể phát hiện các thay đổi đối với các biến đang được theo dõi. Hãy nhớ rằng để cho Svelte biết một biến đã thay đổi, bạn phải gán cho nó một giá trị mới. Một quy tắc đơn giản để ghi nhớ là **Tên của biến được cập nhật phải xuất hiện ở bên trái của phép gán.**

Ví dụ, trong đoạn mã sau:

```js
const foo = obj.foo;
foo.bar = "baz";
```

Svelte sẽ không cập nhật các tham chiếu đến `obj.foo.bar`, trừ khi bạn theo sau với `obj = obj`. Đó là vì Svelte không thể theo dõi các tham chiếu đối tượng, vì vậy chúng ta phải nói rõ ràng với nó rằng `obj` đã thay đổi bằng cách đưa ra một phép gán.

> [!NOTE]
> Nếu `foo` là một biến cấp cao nhất, bạn có thể dễ dàng cho Svelte biết để cập nhật `obj` bất cứ khi nào `foo` thay đổi với câu lệnh có khả năng phản ứng sau: `$: foo, obj = obj`. Với điều này, chúng ta đang định nghĩa `foo` là một phụ thuộc, và bất cứ khi nào nó thay đổi, Svelte sẽ chạy `obj = obj`.

Trong hàm `checkAllTodos()` của chúng ta, khi chúng ta chạy:

```js
todos.forEach((t) => (t.completed = completed));
```

Svelte sẽ không đánh dấu `todos` là đã thay đổi vì nó không biết rằng khi chúng ta cập nhật biến `t` bên trong phương thức `forEach()`, chúng ta cũng đang sửa đổi mảng `todos`. Và điều đó có ý nghĩa, vì nếu không, Svelte sẽ phải biết về hoạt động nội bộ của phương thức `forEach()`; điều tương tự do đó cũng đúng với bất kỳ phương thức nào được gắn với bất kỳ đối tượng hoặc mảng nào.

Tuy nhiên, có các kỹ thuật khác nhau mà chúng ta có thể áp dụng để giải quyết vấn đề này, và tất cả chúng liên quan đến việc gán một giá trị mới cho biến đang được theo dõi.

Như chúng ta đã thấy, chúng ta chỉ có thể cho Svelte biết để cập nhật biến với một phép gán tự, như thế này:

```js
const checkAllTodos = (completed) => {
  todos.forEach((t) => (t.completed = completed));
  todos = todos;
};
```

Điều này sẽ giải quyết vấn đề. Về mặt nội bộ, Svelte sẽ đánh dấu `todos` là đã thay đổi và xóa phép gán tự dư thừa. Ngoài việc trông kỳ lạ, hoàn toàn ổn để sử dụng kỹ thuật này và đôi khi đó là cách ngắn gọn nhất để làm điều đó.

Chúng ta cũng có thể truy cập mảng `todos` bằng chỉ số, như thế này:

```js
const checkAllTodos = (completed) => {
  todos.forEach((t, i) => (todos[i].completed = completed));
};
```

Các phép gán cho thuộc tính của mảng và đối tượng — ví dụ: `obj.foo += 1` hoặc `array[i] = x` — hoạt động theo cách tương tự như các phép gán cho chính các giá trị. Khi Svelte phân tích mã này, nó có thể phát hiện rằng mảng `todos` đang bị sửa đổi.

Một giải pháp khác là gán một mảng mới cho `todos` chứa bản sao của tất cả việc cần làm với thuộc tính `completed` được cập nhật theo đó, như thế này:

```js
const checkAllTodos = (completed) => {
  todos = todos.map((t) => ({ ...t, completed }));
};
```

Trong trường hợp này, chúng ta đang sử dụng phương thức [`map()`](/vi/docs/Web/JavaScript/Reference/Global_Objects/Array/map), trả về một mảng mới với kết quả thực thi hàm được cung cấp cho mỗi mục. Hàm trả về bản sao của mỗi việc cần làm bằng cách sử dụng [cú pháp spread](/vi/docs/Web/JavaScript/Reference/Operators/Spread_syntax) và ghi đè thuộc tính giá trị completed cho phù hợp. Giải pháp này có thêm lợi ích là trả về một mảng mới với các đối tượng mới, hoàn toàn tránh làm thay đổi mảng `todos` gốc.

> [!NOTE]
> Svelte cho phép chúng ta chỉ định các tùy chọn khác nhau ảnh hưởng đến cách trình biên dịch hoạt động. Tùy chọn `<svelte:options immutable={true}/>` cho trình biên dịch biết rằng bạn hứa không thay đổi bất kỳ đối tượng nào. Điều này cho phép nó ít thận trọng hơn trong việc kiểm tra xem các giá trị đã thay đổi chưa và tạo ra mã đơn giản và hiệu quả hơn. Để biết thêm thông tin về `<svelte:options>`, hãy xem [tài liệu tùy chọn Svelte](https://svelte.dev/docs/special-elements#svelte-options).

Tất cả các giải pháp này liên quan đến một phép gán trong đó biến được cập nhật ở bên trái của phương trình. Bất kỳ kỹ thuật nào trong số này sẽ cho phép Svelte nhận thấy rằng mảng `todos` của chúng ta đã bị sửa đổi.

**Chọn một và cập nhật hàm `checkAllTodos()` của bạn theo yêu cầu. Bây giờ bạn sẽ có thể kiểm tra và bỏ kiểm tra tất cả việc cần làm cùng một lúc. Hãy thử!**

## Hoàn thiện thành phần MoreActions

Chúng ta sẽ thêm một chi tiết khả năng sử dụng vào thành phần của mình. Chúng ta sẽ vô hiệu hóa các nút khi không có tác vụ nào cần xử lý. Để tạo điều này, chúng ta sẽ nhận mảng `todos` như một prop và đặt thuộc tính `disabled` của mỗi nút cho phù hợp.

1. Cập nhật thành phần `MoreActions.svelte` của bạn như thế này:

   ```svelte
   <script>
     import { createEventDispatcher } from 'svelte';
     const dispatch = createEventDispatcher();

     export let todos;

     let completed = true;

     const checkAll = () => {
       dispatch('checkAll', completed);
       completed = !completed;
     }

     const removeCompleted = () => dispatch('removeCompleted');

     $: completedTodos = todos.filter((t) => t.completed).length;
   </script>

   <div class="btn-group">
     <button type="button" class="btn btn__primary"
       disabled={todos.length === 0} on:click={checkAll}>{completed ? 'Check' : 'Uncheck'} all</button>
     <button type="button" class="btn btn__primary"
       disabled={completedTodos === 0} on:click={removeCompleted}>Remove completed</button>
   </div>
   ```

   Chúng ta cũng đã khai báo biến `completedTodos` có khả năng phản ứng để bật hoặc tắt nút _Remove Completed_.

2. Đừng quên truyền prop vào `MoreActions` từ bên trong `Todos.svelte`, nơi thành phần được gọi:

   ```svelte
   <MoreActions {todos}
       on:checkAll={(e) => checkAllTodos(e.detail)}
       on:removeCompleted={removeCompletedTodos}
     />
   ```

## Làm việc với DOM: tập trung vào chi tiết

Bây giờ chúng ta đã hoàn thành tất cả chức năng cần thiết của ứng dụng, chúng ta sẽ tập trung vào một số tính năng khả năng tiếp cận sẽ cải thiện tính khả dụng của ứng dụng cho người dùng chỉ dùng bàn phím và người dùng trình đọc màn hình.

Ở trạng thái hiện tại, ứng dụng của chúng ta có một vài vấn đề khả năng tiếp cận bàn phím liên quan đến quản lý tiêu điểm. Hãy xem xét các vấn đề này.

## Khám phá các vấn đề khả năng tiếp cận bàn phím trong ứng dụng to-do

Ngay bây giờ, người dùng bàn phím sẽ thấy rằng luồng tiêu điểm của ứng dụng không thể đoán trước hay nhất quán.

Nếu bạn nhấp vào ô nhập ở đầu ứng dụng, bạn sẽ thấy đường viền chấm đứt dày xung quanh ô nhập đó. Đường viền này là chỉ số hình ảnh của bạn rằng trình duyệt hiện đang tập trung vào phần tử này.

Nếu bạn là người dùng chuột, bạn có thể đã bỏ qua gợi ý hình ảnh này. Nhưng nếu bạn làm việc hoàn toàn với bàn phím, việc biết điều khiển nào có tiêu điểm là rất quan trọng. Nó cho chúng ta biết điều khiển nào sẽ nhận các phím bấm của chúng ta.

Nếu bạn nhấn phím <kbd>Tab</kbd> nhiều lần, bạn sẽ thấy chỉ số tiêu điểm đường chấm đứt quay vòng qua tất cả các phần tử có thể tập trung trên trang. Nếu bạn chuyển tiêu điểm đến nút _Edit_ và nhấn <kbd>Enter</kbd>, đột nhiên tiêu điểm biến mất và bạn không còn biết điều khiển nào sẽ nhận phím bấm của chúng ta.

Hơn nữa, nếu bạn nhấn phím <kbd>Escape</kbd> hoặc <kbd>Enter</kbd>, không có gì xảy ra. Và nếu bạn nhấp vào _Cancel_ hoặc _Save_, tiêu điểm biến mất một lần nữa. Đối với người dùng làm việc với bàn phím, hành vi này sẽ khó hiểu nhất.

Chúng ta cũng muốn thêm một số tính năng khả năng sử dụng, như vô hiệu hóa nút _Save_ khi các trường bắt buộc trống, đưa tiêu điểm đến các phần tử HTML nhất định hoặc tự động chọn nội dung khi ô nhập văn bản nhận tiêu điểm.

Để triển khai tất cả các tính năng này, chúng ta cần truy cập có chương trình các nút DOM để chạy các hàm như [`focus()`](/vi/docs/Web/API/HTMLElement/focus) và [`select()`](/vi/docs/Web/API/HTMLInputElement/select). Chúng ta cũng sẽ phải sử dụng [`addEventListener()`](/vi/docs/Web/API/EventTarget/addEventListener) và [`removeEventListener()`](/vi/docs/Web/API/EventTarget/removeEventListener) để chạy các tác vụ cụ thể khi điều khiển nhận tiêu điểm.

Vấn đề là tất cả các nút DOM này được tạo động bởi Svelte lúc chạy. Vì vậy, chúng ta sẽ phải chờ chúng được tạo và thêm vào DOM để sử dụng chúng. Để làm vậy, chúng ta sẽ phải tìm hiểu về [vòng đời thành phần](https://learn.svelte.dev/tutorial/onmount) để hiểu khi nào chúng ta có thể truy cập chúng — thêm về điều này sau.

## Tạo thành phần NewTodo

Hãy bắt đầu bằng cách trích xuất form việc cần làm mới của chúng ta vào thành phần riêng. Với những gì chúng ta biết cho đến nay, chúng ta có thể tạo tệp thành phần mới và điều chỉnh mã để phát sự kiện `addTodo`, truyền tên của việc cần làm mới cùng với các chi tiết bổ sung.

1. Tạo tệp mới, `components/NewTodo.svelte`.
2. Đặt nội dung sau bên trong nó:

   ```svelte
   <script>
     import { createEventDispatcher } from 'svelte';
     const dispatch = createEventDispatcher();

     let name = '';

     const addTodo = () => {
       dispatch('addTodo', name);
       name = '';
     }

     const onCancel = () => name = '';

   </script>

   <form on:submit|preventDefault={addTodo} on:keydown={(e) => e.key === 'Escape' && onCancel()}>
     <h2 class="label-wrapper">
       <label for="todo-0" class="label__lg">What needs to be done?</label>
     </h2>
     <input bind:value={name} type="text" id="todo-0" autoComplete="off" class="input input__lg" />
     <button type="submit" disabled={!name} class="btn btn__primary btn__lg">Add</button>
   </form>
   ```

   Ở đây chúng ta đang ràng buộc `<input>` với biến `name` bằng `bind:value={name}` và vô hiệu hóa nút _Add_ khi nó trống (tức là không có nội dung văn bản) bằng `disabled={!name}`. Chúng ta cũng đang xử lý phím <kbd>Escape</kbd> với `on:keydown={(e) => e.key === 'Escape' && onCancel()}`. Bất cứ khi nào phím <kbd>Escape</kbd> được nhấn, chúng ta chạy `onCancel()`, chỉ xóa biến `name`.

3. Bây giờ chúng ta phải `import` và sử dụng nó từ bên trong thành phần `Todos`, và cập nhật hàm `addTodo()` để nhận tên của todo mới.

   Thêm câu lệnh `import` sau bên dưới các câu lệnh khác bên trong `Todos.svelte`:

   ```js
   import NewTodo from "./NewTodo.svelte";
   ```

4. Và cập nhật hàm `addTodo()` như thế này:

   ```js
   function addTodo(name) {
     todos = [...todos, { id: newTodoId, name, completed: false }];
   }
   ```

   `addTodo()` bây giờ nhận tên của việc cần làm mới trực tiếp, vì vậy chúng ta không còn cần biến `newTodoName` để cung cấp giá trị cho nó. Thành phần `NewTodo` của chúng ta đảm nhận điều đó.

   > [!NOTE]
   > Cú pháp `{ name }` chỉ là viết tắt cho `{ name: name }`. Cái này đến từ chính JavaScript và không liên quan đến Svelte, ngoài việc cung cấp một số cảm hứng cho các viết tắt riêng của Svelte.

5. Cuối cùng trong phần này, thay thế đánh dấu form NewTodo bằng lệnh gọi đến thành phần `NewTodo`, như thế này:

   ```svelte
   <!-- NewTodo -->
   <NewTodo on:addTodo={(e) => addTodo(e.detail)} />
   ```

## Làm việc với các nút DOM bằng chỉ thị `bind:this={dom_node}`

Bây giờ chúng ta muốn phần tử `<input>` của thành phần `NewTodo` lấy lại tiêu điểm mỗi khi nút _Add_ được nhấn. Để làm điều đó, chúng ta cần tham chiếu đến nút DOM của ô nhập. Svelte cung cấp một cách để làm điều này với chỉ thị `bind:this={dom_node}`. Khi được chỉ định, ngay sau khi thành phần được gắn và nút DOM được tạo, Svelte gán tham chiếu đến nút DOM cho biến đã chỉ định.

Chúng ta sẽ tạo biến `nameEl` và ràng buộc nó với ô nhập bằng `bind:this={nameEl}`. Sau đó bên trong `addTodo()`, sau khi thêm việc cần làm mới, chúng ta sẽ gọi `nameEl.focus()` để đặt lại tiêu điểm cho `<input>`. Chúng ta sẽ làm tương tự khi người dùng nhấn phím <kbd>Escape</kbd>, với hàm `onCancel()`.

Cập nhật nội dung của `NewTodo.svelte` như thế này:

```svelte
<script>
  import { createEventDispatcher } from 'svelte';
  const dispatch = createEventDispatcher();

  let name = '';
  let nameEl; // reference to the name input DOM node

  const addTodo = () => {
    dispatch('addTodo', name);
    name = '';
    nameEl.focus(); // give focus to the name input
  }

  const onCancel = () => {
    name = '';
    nameEl.focus(); // give focus to the name input
  }
</script>

<form on:submit|preventDefault={addTodo} on:keydown={(e) => e.key === 'Escape' && onCancel()}>
  <h2 class="label-wrapper">
    <label for="todo-0" class="label__lg">What needs to be done?</label>
  </h2>
  <input bind:value={name} bind:this={nameEl} type="text" id="todo-0" autoComplete="off" class="input input__lg" />
  <button type="submit" disabled={!name} class="btn btn__primary btn__lg">Add</button>
</form>
```

Hãy thử ứng dụng: nhập tên việc cần làm mới vào trường `<input>`, nhấn <kbd>tab</kbd> để đưa tiêu điểm đến nút _Add_, và sau đó nhấn <kbd>Enter</kbd> hoặc <kbd>Escape</kbd> để xem ô nhập phục hồi tiêu điểm.

### Tự động tập trung ô nhập

Tính năng tiếp theo chúng ta sẽ thêm vào thành phần `NewTodo` là prop `autofocus`, sẽ cho phép chúng ta chỉ định rằng chúng ta muốn trường `<input>` được tập trung khi trang tải.

1. Nỗ lực đầu tiên của chúng ta như sau: hãy thử thêm prop `autofocus` và chỉ gọi `nameEl.focus()` từ khối `<script>`. Cập nhật phần đầu của phần `<script>` của `NewTodo.svelte` (bốn dòng đầu) để trông như thế này:

   ```svelte
   <script>
     import { createEventDispatcher } from 'svelte';
     const dispatch = createEventDispatcher();

     export let autofocus = false;

     let name = '';
     let nameEl; // reference to the name input DOM node

     if (autofocus) nameEl.focus();
   ```

2. Bây giờ quay lại thành phần `Todos` và truyền prop `autofocus` vào lệnh gọi thành phần `<NewTodo>`, như thế này:

   ```svelte
   <!-- NewTodo -->
   <NewTodo autofocus on:addTodo={(e) => addTodo(e.detail)} />
   ```

3. Nếu bạn thử ứng dụng ngay bây giờ, bạn sẽ thấy rằng trang bây giờ trống và trong bảng điều khiển web DevTools, bạn sẽ thấy lỗi tương tự như: `TypeError: nameEl is undefined`.

Để hiểu điều gì đang xảy ra, hãy nói thêm về [vòng đời thành phần](https://learn.svelte.dev/tutorial/onmount) mà chúng ta đã đề cập trước đó.

## Vòng đời thành phần và hàm `onMount()`

Khi một thành phần được khởi tạo, Svelte chạy mã khởi tạo (tức là phần `<script>` của thành phần). Nhưng tại thời điểm đó, tất cả các nút tạo nên thành phần không được gắn vào DOM, thực ra, chúng thậm chí không tồn tại.

Vậy làm thế nào bạn có thể biết khi nào thành phần đã được tạo và gắn vào DOM? Câu trả lời là mỗi thành phần có một vòng đời bắt đầu khi nó được tạo và kết thúc khi nó bị hủy. Có một số hàm cho phép bạn chạy mã tại các thời điểm quan trọng trong vòng đời đó.

Hàm bạn sẽ sử dụng thường xuyên nhất là `onMount()`, cho phép chúng ta chạy callback ngay sau khi thành phần đã được gắn vào DOM. Hãy thử và xem điều gì xảy ra với biến `nameEl`.

1. Để bắt đầu, thêm dòng sau vào đầu phần `<script>` của `NewTodo.svelte`:

   ```js
   import { onMount } from "svelte";
   ```

2. Và các dòng này ở cuối nó:

   ```js
   console.log("initializing:", nameEl);
   onMount(() => {
     console.log("mounted:", nameEl);
   });
   ```

3. Bây giờ xóa dòng `if (autofocus) nameEl.focus()` để tránh ném lỗi chúng ta đã thấy trước đó.
4. Ứng dụng sẽ hoạt động trở lại và bạn sẽ thấy điều sau trong bảng điều khiển:

   ```plain
   initializing: undefined
   mounted: <input id="todo-0" class="input input__lg" type="text" autocomplete="off">
   ```

   Như bạn có thể thấy, trong khi thành phần đang khởi tạo, `nameEl` là undefined, điều này có ý nghĩa vì nút `<input>` thậm chí không tồn tại. Sau khi thành phần đã được gắn, Svelte đã gán tham chiếu đến nút DOM `<input>` cho biến `nameEl`, nhờ chỉ thị `bind:this={nameEl}`.

5. Để chức năng autofocus hoạt động, thay thế khối `console.log()`/`onMount()` trước đó mà bạn đã thêm bằng cái này:

   ```js
   onMount(() => autofocus && nameEl.focus()); // if autofocus is true, we run nameEl.focus()
   ```

6. Vào ứng dụng của bạn một lần nữa và bạn sẽ thấy trường `<input>` được tập trung khi tải trang.

> [!NOTE]
> Bạn có thể xem xét các [hàm vòng đời khác trong tài liệu Svelte](https://svelte.dev/docs/svelte), và bạn có thể thấy chúng trong thực tế trong [hướng dẫn tương tác](https://learn.svelte.dev/tutorial/onmount).

## Chờ DOM được cập nhật với hàm `tick()`

Bây giờ chúng ta sẽ xử lý các chi tiết quản lý tiêu điểm của thành phần `Todo`. Trước tiên, chúng ta muốn `<input>` chỉnh sửa của thành phần `Todo` nhận tiêu điểm khi chúng ta vào chế độ chỉnh sửa bằng cách nhấn nút _Edit_. Tương tự như những gì chúng ta đã thấy trước đó, chúng ta sẽ tạo biến `nameEl` bên trong `Todo.svelte` và gọi `nameEl.focus()` sau khi đặt biến `editing` thành `true`.

1. Mở tệp `components/Todo.svelte` và thêm khai báo biến `nameEl` ngay bên dưới khai báo editing và name:

   ```js
   let nameEl; // reference to the name input DOM node
   ```

2. Bây giờ cập nhật hàm `onEdit()` như thế này:

   ```js
   function onEdit() {
     editing = true; // enter editing mode
     nameEl.focus(); // set focus to name input
   }
   ```

3. Và cuối cùng, ràng buộc `nameEl` với trường `<input>` bằng cách cập nhật nó như thế này:

   ```svelte
   <input
     bind:value={name}
     bind:this={nameEl}
     type="text"
     id="todo-{todo.id}"
     autocomplete="off"
     class="todo-text" />
   ```

4. Tuy nhiên, khi bạn thử ứng dụng đã cập nhật, bạn sẽ nhận được lỗi tương tự như "TypeError: nameEl is undefined" trong bảng điều khiển khi bạn nhấn nút _Edit_ của việc cần làm.

Vậy điều gì đang xảy ra ở đây? Khi bạn cập nhật trạng thái của thành phần trong Svelte, nó không cập nhật DOM ngay lập tức. Thay vào đó, nó đợi đến microtask tiếp theo để xem liệu có bất kỳ thay đổi nào khác cần áp dụng, kể cả trong các thành phần khác không. Làm vậy tránh công việc không cần thiết và cho phép trình duyệt xử lý mọi thứ hiệu quả hơn.

Trong trường hợp này, khi `editing` là `false`, phần tử `<input>` chỉnh sửa không hiển thị vì nó không tồn tại trong DOM. Bên trong hàm `onEdit()`, chúng ta đặt `editing = true` và ngay sau đó cố gắng truy cập biến `nameEl` và thực thi `nameEl.focus()`. Vấn đề ở đây là Svelte chưa cập nhật DOM.

Một cách để giải quyết vấn đề này là sử dụng {{domxref("Window.setTimeout", "setTimeout()")}} để trì hoãn lệnh gọi đến `nameEl.focus()` cho đến chu kỳ sự kiện tiếp theo, và tạo cơ hội cho Svelte cập nhật DOM.

Hãy thử điều này ngay:

```js
function onEdit() {
  editing = true; // enter editing mode
  setTimeout(() => nameEl.focus(), 0); // asynchronous call to set focus to name input
}
```

Giải pháp trên hoạt động, nhưng nó khá không thanh lịch. Svelte cung cấp một cách tốt hơn để xử lý các trường hợp này. [Hàm `tick()`](https://learn.svelte.dev/tutorial/tick) trả về một promise giải quyết ngay sau khi bất kỳ thay đổi trạng thái đang chờ xử lý nào đã được áp dụng vào DOM (hoặc ngay lập tức, nếu không có thay đổi trạng thái đang chờ xử lý). Hãy thử ngay bây giờ.

1. Trước tiên, import `tick` ở đầu phần `<script>` cùng với import hiện có:

   ```js
   import { tick } from "svelte";
   ```

2. Tiếp theo, gọi `tick()` với [`await`](/vi/docs/Web/JavaScript/Reference/Operators/await) từ [hàm async](/vi/docs/Web/JavaScript/Reference/Statements/async_function); cập nhật `onEdit()` như thế này:

   ```js
   async function onEdit() {
     editing = true; // enter editing mode
     await tick();
     nameEl.focus();
   }
   ```

3. Nếu bạn thử ngay bây giờ, bạn sẽ thấy rằng mọi thứ hoạt động như mong đợi.

> [!NOTE]
> Để xem một ví dụ khác sử dụng `tick()`, hãy truy cập [hướng dẫn Svelte](https://learn.svelte.dev/tutorial/tick).

## Thêm chức năng cho các phần tử HTML với chỉ thị `use:action`

Tiếp theo, chúng ta muốn `<input>` tên tự động chọn tất cả văn bản khi tập trung. Hơn nữa, chúng ta muốn phát triển điều này theo cách có thể dễ dàng tái sử dụng trên bất kỳ `<input>` HTML nào và áp dụng theo cách khai báo. Chúng ta sẽ sử dụng yêu cầu này như cái cớ để hiển thị một tính năng rất mạnh mà Svelte cung cấp để thêm chức năng cho các phần tử HTML thông thường: [actions](https://svelte.dev/docs/svelte-action).

Để chọn văn bản của nút nhập DOM, chúng ta phải gọi [`select()`](/vi/docs/Web/API/HTMLInputElement/select). Để hàm này được gọi bất cứ khi nào nút nhận tiêu điểm, chúng ta cần trình lắng nghe sự kiện như thế này:

```js
node.addEventListener("focus", (event) => node.select());
```

Và, để tránh rò rỉ bộ nhớ, chúng ta cũng nên gọi hàm [`removeEventListener()`](/vi/docs/Web/API/EventTarget/removeEventListener) khi nút bị hủy.

> [!NOTE]
> Tất cả điều này chỉ là chức năng WebAPI tiêu chuẩn; không có gì ở đây là cụ thể cho Svelte.

Chúng ta có thể đạt được tất cả điều này trong thành phần `Todo` mỗi khi chúng ta thêm hoặc xóa `<input>` khỏi DOM, nhưng chúng ta sẽ phải rất cẩn thận để thêm trình lắng nghe sự kiện sau khi nút đã được thêm vào DOM và xóa trình lắng nghe trước khi nút bị xóa khỏi DOM. Ngoài ra, giải pháp của chúng ta sẽ không tái sử dụng được lắm.

Đó là nơi các action Svelte phát huy tác dụng. Về cơ bản, chúng cho phép chúng ta chạy một hàm bất cứ khi nào một phần tử đã được thêm vào DOM và sau khi xóa khỏi DOM.

Trong trường hợp sử dụng ngay lập tức của chúng ta, chúng ta sẽ định nghĩa hàm `selectOnFocus()` sẽ nhận một nút như tham số. Hàm sẽ thêm trình lắng nghe sự kiện vào nút đó để bất cứ khi nào nó nhận tiêu điểm, nó sẽ chọn văn bản. Sau đó nó sẽ trả về một đối tượng với thuộc tính `destroy`. Thuộc tính `destroy` là những gì Svelte sẽ thực thi sau khi xóa nút khỏi DOM. Ở đây chúng ta sẽ xóa trình lắng nghe để đảm bảo chúng ta không để lại bất kỳ rò rỉ bộ nhớ nào.

1. Hãy tạo hàm `selectOnFocus()`. Thêm điều sau vào cuối phần `<script>` của `Todo.svelte`:

   ```js
   function selectOnFocus(node) {
     if (node && typeof node.select === "function") {
       // make sure node is defined and has a select() method
       const onFocus = (event) => node.select(); // event handler
       node.addEventListener("focus", onFocus); // when node gets focus call onFocus()
       return {
         destroy: () => node.removeEventListener("focus", onFocus), // this will be executed when the node is removed from the DOM
       };
     }
   }
   ```

2. Bây giờ chúng ta cần cho `<input>` biết sử dụng hàm đó với chỉ thị [`use:action`](https://svelte.dev/docs/element-directives#use-action):

   ```svelte
   <input use:selectOnFocus />
   ```

   Với chỉ thị này, chúng ta đang nói với Svelte chạy hàm này, truyền nút DOM của `<input>` như tham số, ngay sau khi thành phần được gắn vào DOM. Nó cũng sẽ chịu trách nhiệm thực thi hàm `destroy` khi thành phần bị xóa khỏi DOM. Vì vậy với chỉ thị `use`, Svelte đảm nhận vòng đời thành phần cho chúng ta.

   Trong trường hợp của chúng ta, `<input>` sẽ kết thúc như thế này: cập nhật cặp nhãn/ô nhập đầu tiên của thành phần (bên trong mẫu chỉnh sửa) như sau:

   ```svelte
   <label for="todo-{todo.id}" class="todo-label">New name for '{todo.name}'</label>
   <input
     bind:value={name}
     bind:this={nameEl}
     use:selectOnFocus
     type="text"
     id="todo-{todo.id}"
     autocomplete="off"
     class="todo-text" />
   ```

3. Hãy thử. Vào ứng dụng của bạn, nhấn nút _Edit_ của một việc cần làm, sau đó <kbd>Tab</kbd> để đưa tiêu điểm ra khỏi `<input>`. Bây giờ nhấp vào `<input>` và bạn sẽ thấy toàn bộ văn bản ô nhập được chọn.

### Làm cho action có thể tái sử dụng

Bây giờ hãy làm cho hàm này thực sự có thể tái sử dụng trên các thành phần. `selectOnFocus()` chỉ là một hàm không có phụ thuộc vào thành phần `Todo.svelte`, vì vậy chúng ta có thể trích xuất nó vào một tệp và sử dụng từ đó.

1. Tạo tệp mới, `actions.js`, bên trong thư mục `src`.
2. Cung cấp cho nó nội dung sau:

   ```js
   export function selectOnFocus(node) {
     if (node && typeof node.select === "function") {
       // make sure node is defined and has a select() method
       const onFocus = (event) => node.select(); // event handler
       node.addEventListener("focus", onFocus); // when node gets focus call onFocus()
       return {
         destroy: () => node.removeEventListener("focus", onFocus), // this will be executed when the node is removed from the DOM
       };
     }
   }
   ```

3. Bây giờ import nó từ bên trong `Todo.svelte`; thêm câu lệnh import sau ngay bên dưới các câu lệnh khác:

   ```js
   import { selectOnFocus } from "../actions.js";
   ```

4. Và xóa định nghĩa `selectOnFocus()` khỏi `Todo.svelte`, vì chúng ta không còn cần nó ở đó nữa.

### Tái sử dụng action của chúng ta

Để minh họa tính tái sử dụng của action, hãy sử dụng nó trong `NewTodo.svelte`.

1. Import `selectOnFocus()` từ `actions.js` trong tệp này cũng như vậy, như trước:

   ```js
   import { selectOnFocus } from "../actions.js";
   ```

2. Thêm chỉ thị `use:selectOnFocus` vào `<input>`, như thế này:

   ```svelte
   <input
     bind:value={name}
     bind:this={nameEl}
     use:selectOnFocus
     type="text"
     id="todo-0"
     autocomplete="off"
     class="input input__lg" />
   ```

Với một vài dòng mã, chúng ta có thể thêm chức năng cho các phần tử HTML thông thường theo cách rất có thể tái sử dụng và khai báo. Chỉ cần `import` và một chỉ thị ngắn như `use:selectOnFocus` mô tả rõ ràng mục đích của nó. Và chúng ta có thể đạt được điều này mà không cần tạo phần tử wrapper tùy chỉnh như `TextInput`, `MyInput`, hoặc tương tự. Hơn nữa, bạn có thể thêm bao nhiêu chỉ thị `use:action` tùy thích vào một phần tử.

Ngoài ra, chúng ta không phải vật lộn với `onMount()`, `onDestroy()`, hay `tick()` — chỉ thị `use` đảm nhận vòng đời thành phần cho chúng ta.

### Các cải tiến action khác

Trong phần trước, trong khi làm việc với các thành phần `Todo`, chúng ta phải xử lý `bind:this`, `tick()` và các hàm `async` chỉ để đưa tiêu điểm đến `<input>` ngay sau khi nó được thêm vào DOM.

1. Đây là cách chúng ta có thể triển khai nó với các action thay thế:

   ```js
   const focusOnInit = (node) =>
     node && typeof node.focus === "function" && node.focus();
   ```

2. Và sau đó trong đánh dấu của chúng ta, chúng ta chỉ cần thêm một chỉ thị `use:` khác:

   ```svelte
   <input bind:value={name} use:selectOnFocus use:focusOnInit />
   ```

3. Hàm `onEdit()` của chúng ta bây giờ có thể đơn giản hơn nhiều:

   ```js
   function onEdit() {
     editing = true; // enter editing mode
   }
   ```

Là ví dụ cuối cùng trước khi chúng ta tiếp tục, hãy quay lại thành phần `Todo.svelte` và đưa tiêu điểm đến nút _Edit_ sau khi người dùng nhấn _Save_ hoặc _Cancel_.

Chúng ta có thể thử chỉ tái sử dụng action `focusOnInit` của mình, thêm `use:focusOnInit` vào nút _Edit_. Nhưng chúng ta sẽ giới thiệu một lỗi tinh tế. Khi bạn thêm việc cần làm mới, tiêu điểm sẽ được đặt vào nút _Edit_ của việc cần làm vừa được thêm. Đó là vì action `focusOnInit` đang chạy khi thành phần được tạo.

Đó không phải là những gì chúng ta muốn — chúng ta muốn nút _Edit_ nhận tiêu điểm chỉ khi người dùng đã nhấn _Save_ hoặc _Cancel_.

1. Vì vậy, hãy quay lại tệp `Todo.svelte` của bạn.
2. Đầu tiên chúng ta sẽ tạo cờ có tên `editButtonPressed` và khởi tạo nó thành `false`. Thêm điều này ngay bên dưới các định nghĩa biến khác của bạn:

   ```js
   let editButtonPressed = false; // track if edit button has been pressed, to give focus to it after cancel or save
   ```

3. Tiếp theo chúng ta sẽ sửa đổi chức năng của nút _Edit_ để lưu cờ này và tạo action cho nó. Cập nhật hàm `onEdit()` như thế này:

   ```js
   function onEdit() {
     editButtonPressed = true; // user pressed the Edit button, focus will come back to the Edit button
     editing = true; // enter editing mode
   }
   ```

4. Bên dưới nó, thêm định nghĩa sau cho `focusEditButton()`:

   ```js
   const focusEditButton = (node) => editButtonPressed && node.focus();
   ```

5. Cuối cùng, chúng ta `use` action `focusEditButton` trên nút _Edit_, như thế này:

   ```svelte
   <button type="button" class="btn" on:click={onEdit} use:focusEditButton>
     Edit<span class="visually-hidden"> {todo.name}</span>
   </button>
   ```

6. Quay lại và thử ứng dụng của bạn một lần nữa. Tại thời điểm này, mỗi khi nút _Edit_ được thêm vào DOM, action `focusEditButton` được thực thi, nhưng nó sẽ chỉ đưa tiêu điểm đến nút nếu cờ `editButtonPressed` là `true`.

> [!NOTE]
> Chúng ta hầu như chỉ chạm vào bề mặt của các action ở đây. Các action cũng có thể có các tham số có khả năng phản ứng, và Svelte cho phép chúng ta phát hiện khi nào bất kỳ tham số nào trong số đó thay đổi. Vì vậy, chúng ta có thể thêm chức năng tích hợp tốt với hệ thống khả năng phản ứng Svelte. Để có phần giới thiệu chi tiết hơn về các action, hãy xem xét kiểm tra [tài liệu Svelte `use:action`](https://svelte.dev/docs/element-directives#use-action).

## Ràng buộc thành phần: công khai các phương thức và biến thành phần bằng chỉ thị `bind:this={component}`

Vẫn còn một vấn đề khả năng tiếp cận. Khi người dùng nhấn nút _Delete_, tiêu điểm biến mất.

Tính năng cuối cùng chúng ta sẽ xem xét trong bài viết này liên quan đến việc đặt tiêu điểm vào tiêu đề trạng thái sau khi một việc cần làm đã bị xóa.

Tại sao tiêu đề trạng thái? Trong trường hợp này, phần tử có tiêu điểm đã bị xóa, vì vậy không có ứng viên rõ ràng để nhận tiêu điểm. Chúng ta đã chọn tiêu đề trạng thái vì nó gần danh sách việc cần làm và là cách cung cấp phản hồi hình ảnh về việc xóa tác vụ, cũng như chỉ ra điều gì đã xảy ra với người dùng trình đọc màn hình.

Trước tiên chúng ta sẽ trích xuất tiêu đề trạng thái vào thành phần riêng của nó.

1. Tạo tệp mới, `components/TodosStatus.svelte`.
2. Thêm nội dung sau vào nó:

   ```svelte
   <script>
     export let todos;

     $: totalTodos = todos.length;
     $: completedTodos = todos.filter((todo) => todo.completed).length;
   </script>

   <h2 id="list-heading">
     {completedTodos} out of {totalTodos} items completed
   </h2>
   ```

3. Import tệp ở đầu `Todos.svelte`, thêm câu lệnh `import` sau bên dưới các câu lệnh khác:

   ```js
   import TodosStatus from "./TodosStatus.svelte";
   ```

4. Thay thế tiêu đề trạng thái `<h2>` bên trong `Todos.svelte` bằng lệnh gọi đến thành phần `TodosStatus`, truyền `todos` cho nó như prop, như thế này:

   ```svelte
   <TodosStatus {todos} />
   ```

5. Bạn cũng có thể dọn dẹp một chút, xóa các biến `totalTodos` và `completedTodos` khỏi `Todos.svelte`. Chỉ cần xóa các dòng `$: totalTodos = …` và `$: completedTodos = …`, và cũng xóa tham chiếu đến `totalTodos` khi chúng ta tính `newTodoId` và sử dụng `todos.length` thay thế. Để làm điều này, thay thế khối bắt đầu bằng `let newTodoId` bằng:

   ```js
   $: newTodoId = todos.length ? Math.max(...todos.map((t) => t.id)) + 1 : 1;
   ```

6. Mọi thứ hoạt động như mong đợi — chúng ta vừa trích xuất phần đánh dấu cuối cùng vào thành phần riêng của nó.

Bây giờ chúng ta cần tìm cách đưa tiêu điểm đến nhãn trạng thái `<h2>` sau khi việc cần làm đã bị xóa.

Cho đến nay chúng ta đã thấy cách gửi thông tin đến thành phần qua prop và cách thành phần có thể giao tiếp với cha của nó bằng cách phát sự kiện hoặc sử dụng ràng buộc dữ liệu hai chiều. Thành phần con có thể nhận tham chiếu đến nút `<h2>` bằng cách sử dụng `bind:this={dom_node}` và công khai nó ra bên ngoài bằng ràng buộc dữ liệu hai chiều. Nhưng làm vậy sẽ phá vỡ tính đóng gói thành phần; đặt tiêu điểm vào nó phải là trách nhiệm riêng của nó.

Vì vậy, chúng ta cần thành phần `TodosStatus` công khai một phương thức mà cha có thể gọi để đưa tiêu điểm đến nó. Đây là một tình huống rất phổ biến khi một thành phần cần công khai một số hành vi hoặc thông tin cho người tiêu dùng; hãy xem cách đạt được điều này với Svelte.

Chúng ta đã thấy rằng Svelte sử dụng `export let varname = …` để [khai báo prop](https://svelte.dev/docs/svelte-components#script-1-export-creates-a-component-prop). Nhưng nếu thay vì sử dụng `let`, bạn export `const`, `class` hoặc `function`, nó là chỉ đọc từ bên ngoài thành phần. Tuy nhiên, các biểu thức hàm là các prop hợp lệ. Trong ví dụ sau, ba khai báo đầu là prop và phần còn lại là các giá trị được export:

```svelte
<script>
  export let bar = "optional default initial value"; // prop
  export let baz = undefined; // prop
  export let format = (n) => n.toFixed(2); // prop

  // these are readonly
  export const thisIs = "readonly"; // read-only export

  export function greet(name) {
    // read-only export
    alert(`Hello, ${name}!`);
  }

  export const greet = (name) => alert(`Hello, ${name}!`); // read-only export
</script>
```

Với điều này trong đầu, hãy quay lại trường hợp sử dụng của chúng ta. Chúng ta sẽ tạo hàm `focus()` đưa tiêu điểm đến tiêu đề `<h2>`. Để làm điều đó, chúng ta sẽ cần biến `headingEl` để giữ tham chiếu đến nút DOM và chúng ta sẽ phải ràng buộc nó với phần tử `<h2>` bằng `bind:this={headingEl}`. Phương thức focus của chúng ta chỉ sẽ chạy `headingEl.focus()`.

1. Cập nhật nội dung của `TodosStatus.svelte` như thế này:

   ```svelte
   <script>
     export let todos;

     $: totalTodos = todos.length;
     $: completedTodos = todos.filter((todo) => todo.completed).length;

     let headingEl;

     export function focus() {
       // shorter version: export const focus = () => headingEl.focus()
       headingEl.focus();
     }
   </script>

   <h2 id="list-heading" bind:this={headingEl} tabindex="-1">
     {completedTodos} out of {totalTodos} items completed
   </h2>
   ```

   Chú ý rằng chúng ta đã thêm thuộc tính `tabindex` vào `<h2>` để cho phép phần tử nhận tiêu điểm có chương trình.

   Như chúng ta đã thấy trước đó, sử dụng chỉ thị `bind:this={headingEl}` cung cấp cho chúng ta tham chiếu đến nút DOM trong biến `headingEl`. Sau đó chúng ta sử dụng `export function focus()` để công khai một hàm đưa tiêu điểm đến tiêu đề `<h2>`.

   Làm thế nào chúng ta có thể truy cập các giá trị được export đó từ cha? Giống như bạn có thể ràng buộc với các phần tử DOM với chỉ thị `bind:this={dom_node}`, bạn cũng có thể ràng buộc với chính các phiên bản thành phần với `bind:this={component}`. Vì vậy, khi bạn sử dụng `bind:this` trên một phần tử HTML, bạn nhận tham chiếu đến nút DOM và khi bạn làm điều đó trên một thành phần Svelte, bạn nhận tham chiếu đến phiên bản của thành phần đó.

2. Vì vậy để ràng buộc với phiên bản của `TodosStatus`, trước tiên chúng ta sẽ tạo biến `todosStatus` trong `Todos.svelte`. Thêm dòng sau bên dưới các câu lệnh `import` của bạn:

   ```js
   let todosStatus; // reference to TodosStatus instance
   ```

3. Tiếp theo, thêm chỉ thị `bind:this={todosStatus}` vào lệnh gọi, như sau:

   ```svelte
   <!-- TodosStatus -->
   <TodosStatus bind:this={todosStatus} {todos} />
   ```

4. Bây giờ chúng ta có thể gọi phương thức `focus()` được export từ hàm `removeTodo()`:

   ```js
   function removeTodo(todo) {
     todos = todos.filter((t) => t.id !== todo.id);
     todosStatus.focus(); // give focus to status heading
   }
   ```

5. Quay lại ứng dụng của bạn. Bây giờ nếu bạn xóa bất kỳ việc cần làm nào, tiêu đề trạng thái sẽ được tập trung. Điều này hữu ích để làm nổi bật sự thay đổi trong số lượng việc cần làm, cho cả người dùng nhìn thấy và người dùng trình đọc màn hình.

> [!NOTE]
> Bạn có thể tự hỏi tại sao chúng ta cần khai báo một biến mới cho ràng buộc thành phần. Tại sao chúng ta không thể chỉ gọi `TodosStatus.focus()`? Bạn có thể có nhiều phiên bản `TodosStatus` đang hoạt động, vì vậy bạn cần cách tham chiếu từng phiên bản cụ thể. Đó là lý do tại sao bạn phải chỉ định một biến để ràng buộc từng phiên bản cụ thể.

## Mã cho đến nay

### Git

Để xem trạng thái mã như nó phải là ở cuối bài viết này, hãy truy cập bản sao của repo của chúng ta như thế này:

```bash
cd mdn-svelte-tutorial/06-stores
```

Hoặc tải xuống trực tiếp nội dung thư mục:

```bash
npx degit opensas/mdn-svelte-tutorial/06-stores
```

Nhớ chạy `npm install && npm run dev` để khởi động ứng dụng ở chế độ phát triển.

### REPL

Để xem trạng thái hiện tại của mã trong REPL, hãy truy cập:

<https://svelte.dev/repl/d1fa84a5a4494366b179c87395940039?version=3.23.2>

## Tóm tắt

Trong bài viết này, chúng ta đã hoàn thành việc thêm tất cả chức năng cần thiết vào ứng dụng, cộng với việc xử lý một số vấn đề khả năng tiếp cận và khả năng sử dụng. Chúng ta cũng đã hoàn thành việc chia ứng dụng thành các thành phần có thể quản lý, mỗi thành phần có trách nhiệm duy nhất.

Trong thời gian đó, chúng ta đã thấy một số kỹ thuật Svelte nâng cao, như:

- Xử lý các bẫy về khả năng phản ứng khi cập nhật đối tượng và mảng
- Làm việc với các nút DOM bằng `bind:this={dom_node}` (ràng buộc các phần tử DOM)
- Sử dụng hàm vòng đời thành phần `onMount()`
- Buộc Svelte giải quyết các thay đổi trạng thái đang chờ xử lý với hàm `tick()`
- Thêm chức năng cho các phần tử HTML theo cách có thể tái sử dụng và khai báo với chỉ thị `use:action`
- Truy cập các phương thức thành phần bằng `bind:this={component}` (ràng buộc thành phần)

Trong bài viết tiếp theo, chúng ta sẽ thấy cách sử dụng các kho lưu trữ để giao tiếp giữa các thành phần và thêm hoạt ảnh vào các thành phần.

{{PreviousMenuNext("Learn_web_development/Core/Frameworks_libraries/Svelte_components","Learn_web_development/Core/Frameworks_libraries/Svelte_stores", "Learn_web_development/Core/Frameworks_libraries")}}
